Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFDA37BEF5
	for <lists+linux-nfc@lfdr.de>; Wed, 12 May 2021 15:54:58 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id D697B100EBB6C;
	Wed, 12 May 2021 06:54:56 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=62.216.211.111; helo=localhost; envelope-from=oneukum@localhost; receiver=<UNKNOWN> 
Received: from localhost (unknown [62.216.211.111])
	by ml01.01.org (Postfix) with ESMTP id BFECE100EBB6B
	for <linux-nfc@lists.01.org>; Wed, 12 May 2021 06:54:54 -0700 (PDT)
Received: by localhost (Postfix, from userid 1000)
	id 5D8BDE05D; Wed, 12 May 2021 15:54:53 +0200 (CEST)
From: Oliver Neukum <oneukum@suse.com>
To: clement.perrochaud@effinnov.com,
	charles.gorand@effinnov.com,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org
Date: Wed, 12 May 2021 15:54:51 +0200
Message-Id: <20210512135451.32375-1-oneukum@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Message-ID-Hash: 3C5RSUJUBWLPCLSRJMTDDIFVA5I7PLXT
X-Message-ID-Hash: 3C5RSUJUBWLPCLSRJMTDDIFVA5I7PLXT
X-MailFrom: oneukum@localhost
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Oliver Neukum <oneukum@suse.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH] nxp-nci: add NXP1002 id
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/3C5RSUJUBWLPCLSRJMTDDIFVA5I7PLXT/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The driver also works with those new devices.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/nfc/nxp-nci/i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nfc/nxp-nci/i2c.c b/drivers/nfc/nxp-nci/i2c.c
index 7e451c10985d..94f7f6d9cbad 100644
--- a/drivers/nfc/nxp-nci/i2c.c
+++ b/drivers/nfc/nxp-nci/i2c.c
@@ -332,6 +332,7 @@ MODULE_DEVICE_TABLE(of, of_nxp_nci_i2c_match);
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id acpi_id[] = {
 	{ "NXP1001" },
+	{ "NXP1002" },
 	{ "NXP7471" },
 	{ }
 };
-- 
2.26.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
