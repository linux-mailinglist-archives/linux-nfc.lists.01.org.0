Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA6937BE6E
	for <lists+linux-nfc@lfdr.de>; Wed, 12 May 2021 15:44:25 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 16F5A100EBB6B;
	Wed, 12 May 2021 06:44:24 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2001:a61:3b37:8401:666:cf1e:e8ed:533c; helo=localhost; envelope-from=oneukum@localhost; receiver=<UNKNOWN> 
Received: from localhost (unknown [IPv6:2001:a61:3b37:8401:666:cf1e:e8ed:533c])
	by ml01.01.org (Postfix) with ESMTP id E8EE1100EBB6A
	for <linux-nfc@lists.01.org>; Wed, 12 May 2021 06:44:20 -0700 (PDT)
Received: by localhost (Postfix, from userid 1000)
	id B721AE052; Wed, 12 May 2021 15:44:16 +0200 (CEST)
From: Oliver Neukum <oneukum@suse.com>
To: clement.perrochaud@effinnov.com,
	charles.gorand@effinnov.com,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org
Date: Wed, 12 May 2021 15:44:13 +0200
Message-Id: <20210512134413.31808-1-oneukum@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Message-ID-Hash: ZUXDSZZMA6HQ7ST5YPORDR4XO2JR444Q
X-Message-ID-Hash: ZUXDSZZMA6HQ7ST5YPORDR4XO2JR444Q
X-MailFrom: oneukum@localhost
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Oliver Neukum <oneukum@suse.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH] NFC: cooperation with runtime PM
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ZUXDSZZMA6HQ7ST5YPORDR4XO2JR444Q/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We cannot rely on the underlying hardware to do correct
runtime PM. NFC core needs to get PM reference while
a device is operational, lest it be suspended when
it is supposed to be waiting for a target to come
into range.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 net/nfc/core.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/net/nfc/core.c b/net/nfc/core.c
index 573c80c6ff7a..5ca4597c39c7 100644
--- a/net/nfc/core.c
+++ b/net/nfc/core.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/rfkill.h>
 #include <linux/nfc.h>
+#include <linux/pm_runtime.h>
 
 #include <net/genetlink.h>
 
@@ -37,6 +38,7 @@ int nfc_fw_download(struct nfc_dev *dev, const char *firmware_name)
 	pr_debug("%s do firmware %s\n", dev_name(&dev->dev), firmware_name);
 
 	device_lock(&dev->dev);
+	pm_runtime_get_sync(&dev->dev);
 
 	if (!device_is_registered(&dev->dev)) {
 		rc = -ENODEV;
@@ -58,7 +60,10 @@ int nfc_fw_download(struct nfc_dev *dev, const char *firmware_name)
 	if (rc)
 		dev->fw_download_in_progress = false;
 
+	device_unlock(&dev->dev);
+	return rc;
 error:
+	pm_runtime_put(&dev->dev);
 	device_unlock(&dev->dev);
 	return rc;
 }
@@ -73,9 +78,13 @@ int nfc_fw_download(struct nfc_dev *dev, const char *firmware_name)
 int nfc_fw_download_done(struct nfc_dev *dev, const char *firmware_name,
 			 u32 result)
 {
+	int rv;
+
 	dev->fw_download_in_progress = false;
 
-	return nfc_genl_fw_download_done(dev, firmware_name, result);
+	rv = nfc_genl_fw_download_done(dev, firmware_name, result);
+	pm_runtime_put(&dev->dev);
+	return rv;
 }
 EXPORT_SYMBOL(nfc_fw_download_done);
 
@@ -93,6 +102,7 @@ int nfc_dev_up(struct nfc_dev *dev)
 	pr_debug("dev_name=%s\n", dev_name(&dev->dev));
 
 	device_lock(&dev->dev);
+	pm_runtime_get_sync(&dev->dev);
 
 	if (dev->rfkill && rfkill_blocked(dev->rfkill)) {
 		rc = -ERFKILL;
@@ -124,7 +134,11 @@ int nfc_dev_up(struct nfc_dev *dev)
 	if (dev->ops->discover_se && dev->ops->discover_se(dev))
 		pr_err("SE discovery failed\n");
 
+	device_unlock(&dev->dev);
+	return rc;
+
 error:
+	pm_runtime_put(&dev->dev);
 	device_unlock(&dev->dev);
 	return rc;
 }
@@ -161,6 +175,9 @@ int nfc_dev_down(struct nfc_dev *dev)
 		dev->ops->dev_down(dev);
 
 	dev->dev_up = false;
+	pm_runtime_put(&dev->dev);
+	device_unlock(&dev->dev);
+	return rc;
 
 error:
 	device_unlock(&dev->dev);
-- 
2.26.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
