Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 000B13F1B20
	for <lists+linux-nfc@lfdr.de>; Thu, 19 Aug 2021 16:02:37 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id BD8A8100EB829;
	Thu, 19 Aug 2021 07:02:35 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=oneukum@suse.com; receiver=<UNKNOWN> 
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 5B462100EBB94
	for <linux-nfc@lists.01.org>; Thu, 19 Aug 2021 07:02:33 -0700 (PDT)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 260541FDA5;
	Thu, 19 Aug 2021 14:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629381751; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AZ80Q6dMMbJ0SGxIu6h4Aj+dCVtolubvmc8U9f/BKwg=;
	b=dw6MP9vAKcC+ITyzLz/TTosa9iPEEzrlVcPDBTAaxFbh5LrTrSAt3AXjxUQqFJP0yK+kUq
	l1B6tD51RH8INDDTVvXPVjug8SxzI/6rgurG4HMi1tp2hsc/Ci2B/rA1UzNUM1ufevF1Ry
	WtDB7CqpP6HONDAzVIkbGdpb406Ubd4=
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id D133D1340C;
	Thu, 19 Aug 2021 14:02:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap1.suse-dmz.suse.de with ESMTPSA
	id Y6v+MHZkHmFaAwAAGKfGzw
	(envelope-from <oneukum@suse.com>); Thu, 19 Aug 2021 14:02:30 +0000
From: Oliver Neukum <oneukum@suse.com>
To: charles.gorand@effinnov.com,
	krzysztof.kozlowski@canonical.com,
	andy.shevchenko@gmail.com,
	linux-nfc@lists.01.org
Date: Thu, 19 Aug 2021 16:02:28 +0200
Message-Id: <20210819140228.15591-1-oneukum@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Message-ID-Hash: SIRBDYA3UDDSMROBFDV5DHQIHOYTTZQZ
X-Message-ID-Hash: SIRBDYA3UDDSMROBFDV5DHQIHOYTTZQZ
X-MailFrom: oneukum@suse.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Oliver Neukum <oneukum@suse.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH] NFC: NCI: make parent aware in PM terms
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/SIRBDYA3UDDSMROBFDV5DHQIHOYTTZQZ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The NCI device is a child of an i2c device.
If the i2c layer uses runtime PM the power to
the NFC device can be cut whenever the i2c
layer is done transmitting data to the NFC
device.
Under these conditions NFC can not work, as
it needs power to wait for reception of packets.

The necessary extension of runtime PM
to the NFC device requires that it
be activated as a child of the i2c device.
It is not necessary to do any runtime PM
operations. This will disable runtime PM
for this branch of the tree, but otherwise
the NFC device is inoperable.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/nfc/nxp-nci/i2c.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/nfc/nxp-nci/i2c.c b/drivers/nfc/nxp-nci/i2c.c
index 94f7f6d9cbad..dba78a5d217a 100644
--- a/drivers/nfc/nxp-nci/i2c.c
+++ b/drivers/nfc/nxp-nci/i2c.c
@@ -18,6 +18,7 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/nfc.h>
+#include <linux/pm_runtime.h>
 #include <linux/gpio/consumer.h>
 #include <asm/unaligned.h>
 
@@ -261,6 +262,7 @@ static int nxp_nci_i2c_probe(struct i2c_client *client,
 {
 	struct device *dev = &client->dev;
 	struct nxp_nci_i2c_phy *phy;
+	struct nfc_dev *ndev;
 	int r;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
@@ -297,6 +299,11 @@ static int nxp_nci_i2c_probe(struct i2c_client *client,
 	if (r < 0)
 		return r;
 
+	ndev = phy->ndev->nfc_dev;
+	pm_runtime_set_active(&ndev->dev);
+	pm_runtime_enable(&ndev->dev);
+	pm_runtime_mark_last_busy(&ndev->dev);
+
 	r = request_threaded_irq(client->irq, NULL,
 				 nxp_nci_i2c_irq_thread_fn,
 				 IRQF_TRIGGER_RISING | IRQF_ONESHOT,
@@ -310,9 +317,12 @@ static int nxp_nci_i2c_probe(struct i2c_client *client,
 static int nxp_nci_i2c_remove(struct i2c_client *client)
 {
 	struct nxp_nci_i2c_phy *phy = i2c_get_clientdata(client);
+	struct nfc_dev *ndev = phy->ndev->nfc_dev;
 
 	nxp_nci_remove(phy->ndev);
 	free_irq(client->irq, phy);
+	pm_runtime_disable(&ndev->dev);
+	pm_runtime_set_suspended(&ndev->dev);
 
 	return 0;
 }
-- 
2.26.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
