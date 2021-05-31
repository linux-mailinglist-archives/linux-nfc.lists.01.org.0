Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9061E395638
	for <lists+linux-nfc@lfdr.de>; Mon, 31 May 2021 09:35:34 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 36347100ED48C;
	Mon, 31 May 2021 00:35:33 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 41F7E100EF267
	for <linux-nfc@lists.01.org>; Mon, 31 May 2021 00:35:31 -0700 (PDT)
Received: from mail-wm1-f71.google.com ([209.85.128.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lncSP-0002h5-Qk
	for linux-nfc@lists.01.org; Mon, 31 May 2021 07:35:29 +0000
Received: by mail-wm1-f71.google.com with SMTP id i13-20020a05600c354db029019c437c377eso252418wmq.9
        for <linux-nfc@lists.01.org>; Mon, 31 May 2021 00:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XhZpqiw5yroQ5T5SjmtgyekQkcqwTSamV1tsKU5zvv4=;
        b=hvhue3n7fcLLTP091F1N3xsGuZslD/MDO7EWIOcluJNEoxJzUYGOXUwlfSOroQ8WQH
         sqwYJJ88rjICAnbvSZA+Tl3uFoJ5IlywqCzUAveF5OFmY87bOg3rNQm+Dg78uh4okbrP
         MhtzMeJcvFgkFmIs1kYVP4ymdes2YwPaScEP0tFzHOKysLA/r3FLhqKDudYB1soSaI/h
         P3LjZOBJs/duYZ82mqrACdyxlQSwAABeGLASRjFYPBnAmKgKazUaikiivqoih2oTCL9X
         JBPeo8hMe8UNTv4JXCMphK9kFKCOTKAdV4l89mW+SPulvDlc86Jzu+YmcJWcmycjliNU
         ZZHg==
X-Gm-Message-State: AOAM533ZaYaXYoBet4a0QVcubv7EK/7oFGttxYCVKP4KDNuL1r4M7D5A
	Q13goyJWQR3LPjeRr9ls3+K/wB0GON8HkAWyItIzkrI0PT9mYZiCRC2rh/nRVPuGvQAD6HvZA+g
	Y9NfKNv7SqKNTwSxS1Pzzvnm8R0TVW1SsLg==
X-Received: by 2002:a5d:6701:: with SMTP id o1mr21259652wru.390.1622446529559;
        Mon, 31 May 2021 00:35:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxk5BA7dTNQ/7+z47YXbPG4XygKbY+0a1oPfGA6FykbFNsBqdHggXywOWUiRmA9mrf397cOBg==
X-Received: by 2002:a5d:6701:: with SMTP id o1mr21259636wru.390.1622446529384;
        Mon, 31 May 2021 00:35:29 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id g10sm17217780wrq.12.2021.05.31.00.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 00:35:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Mon, 31 May 2021 09:35:12 +0200
Message-Id: <20210531073522.6720-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Message-ID-Hash: QDW2F22YXQ32ILXCEH5ZVCCTFVMQPHIF
X-Message-ID-Hash: QDW2F22YXQ32ILXCEH5ZVCCTFVMQPHIF
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [RESEND PATCH 01/11] nfc: fdp: drop ftrace-like debugging messages
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/QDW2F22YXQ32ILXCEH5ZVCCTFVMQPHIF/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that the kernel has ftrace, any debugging calls that just do "made
it to this function!" and "leaving this function!" can be removed.
Better to use standard debugging tools.

This allows also to remove several local variables and entire
fdp_nci_recv_frame() function (whose purpose was only to log).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/fdp/fdp.c | 31 -------------------------------
 drivers/nfc/fdp/fdp.h |  1 -
 drivers/nfc/fdp/i2c.c | 12 +-----------
 3 files changed, 1 insertion(+), 43 deletions(-)

diff --git a/drivers/nfc/fdp/fdp.c b/drivers/nfc/fdp/fdp.c
index 125d71c27b8b..7863b2536999 100644
--- a/drivers/nfc/fdp/fdp.c
+++ b/drivers/nfc/fdp/fdp.c
@@ -237,28 +237,18 @@ static int fdp_nci_send_patch(struct nci_dev *ndev, u8 conn_id, u8 type)
 static int fdp_nci_open(struct nci_dev *ndev)
 {
 	struct fdp_nci_info *info = nci_get_drvdata(ndev);
-	struct device *dev = &info->phy->i2c_dev->dev;
-
-	dev_dbg(dev, "%s\n", __func__);
 
 	return info->phy_ops->enable(info->phy);
 }
 
 static int fdp_nci_close(struct nci_dev *ndev)
 {
-	struct fdp_nci_info *info = nci_get_drvdata(ndev);
-	struct device *dev = &info->phy->i2c_dev->dev;
-
-	dev_dbg(dev, "%s\n", __func__);
 	return 0;
 }
 
 static int fdp_nci_send(struct nci_dev *ndev, struct sk_buff *skb)
 {
 	struct fdp_nci_info *info = nci_get_drvdata(ndev);
-	struct device *dev = &info->phy->i2c_dev->dev;
-
-	dev_dbg(dev, "%s\n", __func__);
 
 	if (atomic_dec_and_test(&info->data_pkt_counter))
 		info->data_pkt_counter_cb(ndev);
@@ -266,16 +256,6 @@ static int fdp_nci_send(struct nci_dev *ndev, struct sk_buff *skb)
 	return info->phy_ops->write(info->phy, skb);
 }
 
-int fdp_nci_recv_frame(struct nci_dev *ndev, struct sk_buff *skb)
-{
-	struct fdp_nci_info *info = nci_get_drvdata(ndev);
-	struct device *dev = &info->phy->i2c_dev->dev;
-
-	dev_dbg(dev, "%s\n", __func__);
-	return nci_recv_frame(ndev, skb);
-}
-EXPORT_SYMBOL(fdp_nci_recv_frame);
-
 static int fdp_nci_request_firmware(struct nci_dev *ndev)
 {
 	struct fdp_nci_info *info = nci_get_drvdata(ndev);
@@ -476,8 +456,6 @@ static int fdp_nci_setup(struct nci_dev *ndev)
 	int r;
 	u8 patched = 0;
 
-	dev_dbg(dev, "%s\n", __func__);
-
 	r = nci_core_init(ndev);
 	if (r)
 		goto error;
@@ -585,9 +563,7 @@ static int fdp_nci_core_reset_ntf_packet(struct nci_dev *ndev,
 					  struct sk_buff *skb)
 {
 	struct fdp_nci_info *info = nci_get_drvdata(ndev);
-	struct device *dev = &info->phy->i2c_dev->dev;
 
-	dev_dbg(dev, "%s\n", __func__);
 	info->setup_reset_ntf = 1;
 	wake_up(&info->setup_wq);
 
@@ -598,9 +574,7 @@ static int fdp_nci_prop_patch_ntf_packet(struct nci_dev *ndev,
 					  struct sk_buff *skb)
 {
 	struct fdp_nci_info *info = nci_get_drvdata(ndev);
-	struct device *dev = &info->phy->i2c_dev->dev;
 
-	dev_dbg(dev, "%s\n", __func__);
 	info->setup_patch_ntf = 1;
 	info->setup_patch_status = skb->data[0];
 	wake_up(&info->setup_wq);
@@ -773,11 +747,6 @@ EXPORT_SYMBOL(fdp_nci_probe);
 
 void fdp_nci_remove(struct nci_dev *ndev)
 {
-	struct fdp_nci_info *info = nci_get_drvdata(ndev);
-	struct device *dev = &info->phy->i2c_dev->dev;
-
-	dev_dbg(dev, "%s\n", __func__);
-
 	nci_unregister_device(ndev);
 	nci_free_device(ndev);
 }
diff --git a/drivers/nfc/fdp/fdp.h b/drivers/nfc/fdp/fdp.h
index 9bd1f3f23e2d..ead3b21ccae6 100644
--- a/drivers/nfc/fdp/fdp.h
+++ b/drivers/nfc/fdp/fdp.h
@@ -25,6 +25,5 @@ int fdp_nci_probe(struct fdp_i2c_phy *phy, struct nfc_phy_ops *phy_ops,
 		  struct nci_dev **ndev, int tx_headroom, int tx_tailroom,
 		  u8 clock_type, u32 clock_freq, u8 *fw_vsc_cfg);
 void fdp_nci_remove(struct nci_dev *ndev);
-int fdp_nci_recv_frame(struct nci_dev *ndev, struct sk_buff *skb);
 
 #endif /* __LOCAL_FDP_H_ */
diff --git a/drivers/nfc/fdp/i2c.c b/drivers/nfc/fdp/i2c.c
index 997e0806821a..c5596e514648 100644
--- a/drivers/nfc/fdp/i2c.c
+++ b/drivers/nfc/fdp/i2c.c
@@ -49,7 +49,6 @@ static int fdp_nci_i2c_enable(void *phy_id)
 {
 	struct fdp_i2c_phy *phy = phy_id;
 
-	dev_dbg(&phy->i2c_dev->dev, "%s\n", __func__);
 	fdp_nci_i2c_reset(phy);
 
 	return 0;
@@ -59,7 +58,6 @@ static void fdp_nci_i2c_disable(void *phy_id)
 {
 	struct fdp_i2c_phy *phy = phy_id;
 
-	dev_dbg(&phy->i2c_dev->dev, "%s\n", __func__);
 	fdp_nci_i2c_reset(phy);
 }
 
@@ -197,7 +195,6 @@ static int fdp_nci_i2c_read(struct fdp_i2c_phy *phy, struct sk_buff **skb)
 static irqreturn_t fdp_nci_i2c_irq_thread_fn(int irq, void *phy_id)
 {
 	struct fdp_i2c_phy *phy = phy_id;
-	struct i2c_client *client;
 	struct sk_buff *skb;
 	int r;
 
@@ -206,9 +203,6 @@ static irqreturn_t fdp_nci_i2c_irq_thread_fn(int irq, void *phy_id)
 		return IRQ_NONE;
 	}
 
-	client = phy->i2c_dev;
-	dev_dbg(&client->dev, "%s\n", __func__);
-
 	r = fdp_nci_i2c_read(phy, &skb);
 
 	if (r == -EREMOTEIO)
@@ -217,7 +211,7 @@ static irqreturn_t fdp_nci_i2c_irq_thread_fn(int irq, void *phy_id)
 		return IRQ_HANDLED;
 
 	if (skb != NULL)
-		fdp_nci_recv_frame(phy->ndev, skb);
+		nci_recv_frame(phy->ndev, skb);
 
 	return IRQ_HANDLED;
 }
@@ -288,8 +282,6 @@ static int fdp_nci_i2c_probe(struct i2c_client *client)
 	u32 clock_freq;
 	int r = 0;
 
-	dev_dbg(dev, "%s\n", __func__);
-
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		nfc_err(dev, "No I2C_FUNC_I2C support\n");
 		return -ENODEV;
@@ -351,8 +343,6 @@ static int fdp_nci_i2c_remove(struct i2c_client *client)
 {
 	struct fdp_i2c_phy *phy = i2c_get_clientdata(client);
 
-	dev_dbg(&client->dev, "%s\n", __func__);
-
 	fdp_nci_remove(phy->ndev);
 	fdp_nci_i2c_disable(phy);
 
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
