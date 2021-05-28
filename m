Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEFC394489
	for <lists+linux-nfc@lfdr.de>; Fri, 28 May 2021 16:54:27 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 7635D100ED4BA;
	Fri, 28 May 2021 07:54:25 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id BCFBB100ED4AB
	for <linux-nfc@lists.01.org>; Fri, 28 May 2021 07:54:23 -0700 (PDT)
Received: from mail-ua1-f71.google.com ([209.85.222.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lmdsT-0003zv-Kz
	for linux-nfc@lists.01.org; Fri, 28 May 2021 14:54:21 +0000
Received: by mail-ua1-f71.google.com with SMTP id v20-20020ab076940000b029020b0b4ada34so2025471uaq.4
        for <linux-nfc@lists.01.org>; Fri, 28 May 2021 07:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XhZpqiw5yroQ5T5SjmtgyekQkcqwTSamV1tsKU5zvv4=;
        b=lpbnGUiHqpYkVlpJAMQIeTrG6rfpi7FB0ocYKiNkwLnZOGDXObadLPsujU2ILEV4Gx
         yyv3SX/1zv1MFNSgdJz5QsHlLKuvDBw+6iDfdf086PPpY2zWbrmAw/rVD34OvkGqbpZf
         XoeD6KYj+ZF+AaX61J4FrTROdLq6ortWDNTaBfbgCDY1i/2ApE+zUI9r/pkHq7PTOL57
         FMkyzIkpcRrRFpZwU/JuC0jMo+D3JkHrkSFLcvpdRQiEEU6V+uvddhvGVn3PPXX26TNH
         V+RDo7h3QqH3Ly52R2FncDuQX+nTEAFIchURrti+qEJXWn172Bfd+d0LTWBzVtLoohpc
         ij+A==
X-Gm-Message-State: AOAM530r6jhDmovdUwSQgzr3sSisU9FgCyjrrdPG8RYOjGmpYVd9hKMv
	w2x7MI+Hx86JqutTVCjfEKCdUYH2B2G7SreaMV1RP5lRVIkw8KgYLkyAplrW1WyrijrrvdLgUiL
	TwjyRZo2zuv4ZoivuwxOxh5S8rfsNAhV32Q==
X-Received: by 2002:a05:6102:b06:: with SMTP id b6mr7491296vst.21.1622213660581;
        Fri, 28 May 2021 07:54:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPMQ3xY66/5n4l/VQaIPoHo7DEPcLTbN8UNm7Bn5EXdgUbFqs6QFW7LZSH6KTqPyxb7SwHGw==
X-Received: by 2002:a05:6102:b06:: with SMTP id b6mr7491279vst.21.1622213660390;
        Fri, 28 May 2021 07:54:20 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id v132sm737783vkd.1.2021.05.28.07.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 07:54:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 28 May 2021 10:53:20 -0400
Message-Id: <20210528145330.125055-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Message-ID-Hash: ZCGLWAL7SIWEVINEQKNBSXDMFQLB6EKZ
X-Message-ID-Hash: ZCGLWAL7SIWEVINEQKNBSXDMFQLB6EKZ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 01/11] nfc: fdp: drop ftrace-like debugging messages
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ZCGLWAL7SIWEVINEQKNBSXDMFQLB6EKZ/>
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
