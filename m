Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 592CA395658
	for <lists+linux-nfc@lfdr.de>; Mon, 31 May 2021 09:39:34 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4D6A6100EBBCE;
	Mon, 31 May 2021 00:39:27 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 30DCD100EBBBD
	for <linux-nfc@lists.01.org>; Mon, 31 May 2021 00:39:25 -0700 (PDT)
Received: from mail-wr1-f71.google.com ([209.85.221.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lncWB-00039k-SY
	for linux-nfc@lists.01.org; Mon, 31 May 2021 07:39:23 +0000
Received: by mail-wr1-f71.google.com with SMTP id t5-20020adfb7c50000b029010dd0bb24cfso3643038wre.2
        for <linux-nfc@lists.01.org>; Mon, 31 May 2021 00:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g1FAyvgyu/qVXx6L5siomBosL8eH4sVo53XTzJaTdO0=;
        b=aJluZ0UiLdXCLgA1629C1imJ6ovEuZ4drhdEUYuYcaE3Lugd6/t5oAE8M4zY9mBA4C
         HsOTY/UxyrJ40+zqSsNeZFFqwGkWS2OMChP9g6rs2ZPUoSdFk5vcbvwWy6LHHiwdJaVL
         QzktMVou5X+2aNwgthncjw9alDM99+nLUXhRlpzZumC/iFmJ0WzgMkw3NpK5UVI0ar+h
         b8C6pOKuQz0kbLarS0kjv/D+XTsWZkFM2MXDPYuVabVEXsmDh9Yhp8eqHmU3TJ7bXQPm
         7fMsBTjJuHJnbf3mcZy5lszQIYIjyYBh5N64ytcw5ZDBL4O6Afx3k0nIZYDIGjSbZRrI
         E2jQ==
X-Gm-Message-State: AOAM532oGRn+iP8jVhcbxGwcwnYXnWccoDwgjpv6YvcjskyIX/yYrtnu
	4daCfez0rZIEt5WHRTv6mZDlMtiI36HH2lAeXOYHgAu+3cUUEtWlVE9GrYiy7KsAa+LJPp2U9Oa
	SvC/YSzcqmMUD7+vFxZIPJcI1dZRLJfsgOw==
X-Received: by 2002:a05:600c:231a:: with SMTP id 26mr13555905wmo.92.1622446763251;
        Mon, 31 May 2021 00:39:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsV8autLYEr9eV5Wyus99mhUBr9uj33Y8pykWfReCEKmHjnGozrIsUQTth2S6tBaa77HTFEQ==
X-Received: by 2002:a05:600c:231a:: with SMTP id 26mr13555897wmo.92.1622446763135;
        Mon, 31 May 2021 00:39:23 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id a1sm9168911wrg.92.2021.05.31.00.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 00:39:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Mon, 31 May 2021 09:39:01 +0200
Message-Id: <20210531073902.7111-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210531073522.6720-1-krzysztof.kozlowski@canonical.com>
References: <20210531073522.6720-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: RVJ45VDOWCBECEQWW5D66NRYW5YIXL2B
X-Message-ID-Hash: RVJ45VDOWCBECEQWW5D66NRYW5YIXL2B
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [RESEND PATCH 10/11] nfc: st-nci: drop ftrace-like debugging messages
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/RVJ45VDOWCBECEQWW5D66NRYW5YIXL2B/>
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/st-nci/i2c.c | 5 -----
 drivers/nfc/st-nci/se.c  | 6 ------
 drivers/nfc/st-nci/spi.c | 5 -----
 3 files changed, 16 deletions(-)

diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
index 663d1cc19b81..46981405e8b1 100644
--- a/drivers/nfc/st-nci/i2c.c
+++ b/drivers/nfc/st-nci/i2c.c
@@ -206,9 +206,6 @@ static int st_nci_i2c_probe(struct i2c_client *client,
 	struct st_nci_i2c_phy *phy;
 	int r;
 
-	dev_dbg(&client->dev, "%s\n", __func__);
-	dev_dbg(&client->dev, "IRQ: %d\n", client->irq);
-
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		nfc_err(&client->dev, "Need I2C_FUNC_I2C\n");
 		return -ENODEV;
@@ -261,8 +258,6 @@ static int st_nci_i2c_remove(struct i2c_client *client)
 {
 	struct st_nci_i2c_phy *phy = i2c_get_clientdata(client);
 
-	dev_dbg(&client->dev, "%s\n", __func__);
-
 	ndlc_remove(phy->ndlc);
 
 	return 0;
diff --git a/drivers/nfc/st-nci/se.c b/drivers/nfc/st-nci/se.c
index 8657e025166f..5fd89f72969d 100644
--- a/drivers/nfc/st-nci/se.c
+++ b/drivers/nfc/st-nci/se.c
@@ -470,8 +470,6 @@ int st_nci_disable_se(struct nci_dev *ndev, u32 se_idx)
 {
 	int r;
 
-	pr_debug("st_nci_disable_se\n");
-
 	/*
 	 * According to upper layer, se_idx == NFC_SE_UICC when
 	 * info->se_info.se_status->is_uicc_enable is true should never happen
@@ -496,8 +494,6 @@ int st_nci_enable_se(struct nci_dev *ndev, u32 se_idx)
 {
 	int r;
 
-	pr_debug("st_nci_enable_se\n");
-
 	/*
 	 * According to upper layer, se_idx == NFC_SE_UICC when
 	 * info->se_info.se_status->is_uicc_enable is true should never happen.
@@ -602,8 +598,6 @@ int st_nci_discover_se(struct nci_dev *ndev)
 	int se_count = 0;
 	struct st_nci_info *info = nci_get_drvdata(ndev);
 
-	pr_debug("st_nci_discover_se\n");
-
 	r = st_nci_hci_network_init(ndev);
 	if (r != 0)
 		return r;
diff --git a/drivers/nfc/st-nci/spi.c b/drivers/nfc/st-nci/spi.c
index 5f1a2173b2e7..250d56f204c3 100644
--- a/drivers/nfc/st-nci/spi.c
+++ b/drivers/nfc/st-nci/spi.c
@@ -216,9 +216,6 @@ static int st_nci_spi_probe(struct spi_device *dev)
 	struct st_nci_spi_phy *phy;
 	int r;
 
-	dev_dbg(&dev->dev, "%s\n", __func__);
-	dev_dbg(&dev->dev, "IRQ: %d\n", dev->irq);
-
 	/* Check SPI platform functionnalities */
 	if (!dev) {
 		pr_debug("%s: dev is NULL. Device is not accessible.\n",
@@ -274,8 +271,6 @@ static int st_nci_spi_remove(struct spi_device *dev)
 {
 	struct st_nci_spi_phy *phy = spi_get_drvdata(dev);
 
-	dev_dbg(&dev->dev, "%s\n", __func__);
-
 	ndlc_remove(phy->ndlc);
 
 	return 0;
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
