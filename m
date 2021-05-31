Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73333395653
	for <lists+linux-nfc@lfdr.de>; Mon, 31 May 2021 09:39:26 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 1D51A100EBBA2;
	Mon, 31 May 2021 00:39:25 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id E9AF5100ED48C
	for <linux-nfc@lists.01.org>; Mon, 31 May 2021 00:39:22 -0700 (PDT)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lncW9-00038Y-Fy
	for linux-nfc@lists.01.org; Mon, 31 May 2021 07:39:21 +0000
Received: by mail-wr1-f69.google.com with SMTP id x10-20020adfc18a0000b029010d83c83f2aso3642803wre.8
        for <linux-nfc@lists.01.org>; Mon, 31 May 2021 00:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j+dadvxhKr9M8DJyOltCeC2IGkgvG/BUqwA8QIFSNMA=;
        b=Fci3AQ8kgqXsanNGZJXGcQCloVlRsh+AOI5OTlPOViTqE1dsqC5qJ8vn+tpF6gA2c9
         O/bLpnvUJGASrLHBhcu7cHegraXDV8HF5M7cwDeAALa9od7Hgl35mkW/GIoASEAH9PE6
         O3Q7TEz2ECQzR88sr47my6QTPp0cxSkguppE1wgIWGtvaNbcm1z9bzqIqDXwio4rgQgt
         hcDScwl9rG1PUioCICKJmGtiu0EGPXCvSTyoP2Wn6kF/iIbTGBr/tMTzTZOUoiZmbLv9
         IdW/mf1YKNIZhXwUFhh+M2HLFm06iASpqCcjoJY18WIx0CfUliyGabNDYAmlG+1brvSp
         3mvg==
X-Gm-Message-State: AOAM530P1CeyKJMix3+q/uY3ZOqK5l7vtxryBG/4AF8DJNWd0yiRq10V
	g9d/KRz2NEwHyaJJ5i8a5hKQCDK43j9xA+yp5du8vnC1XGZ+2UkIOiWUaOTfeB/n7WQ6pxlSuLN
	KP9TkBpcwrEUOuVRwo52Ut8cs0ppImp4DSQ==
X-Received: by 2002:a7b:cf23:: with SMTP id m3mr25335320wmg.24.1622446761289;
        Mon, 31 May 2021 00:39:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb6o1VPKOFpplOXi79XWh6sSwmdcjRCTi34hGnidyYynLUfs94/VRLJuSItxs2w47msn94Yg==
X-Received: by 2002:a7b:cf23:: with SMTP id m3mr25335309wmg.24.1622446761179;
        Mon, 31 May 2021 00:39:21 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id a1sm9168911wrg.92.2021.05.31.00.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 00:39:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Mon, 31 May 2021 09:38:59 +0200
Message-Id: <20210531073902.7111-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210531073522.6720-1-krzysztof.kozlowski@canonical.com>
References: <20210531073522.6720-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: PPFQBD2TBGVU3UNZHXNRB3RTJJLEMDRF
X-Message-ID-Hash: PPFQBD2TBGVU3UNZHXNRB3RTJJLEMDRF
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [RESEND PATCH 08/11] nfc: pn544: drop ftrace-like debugging messages
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/PPFQBD2TBGVU3UNZHXNRB3RTJJLEMDRF/>
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
 drivers/nfc/pn544/i2c.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/nfc/pn544/i2c.c b/drivers/nfc/pn544/i2c.c
index aac778c5ddd2..de59e439c369 100644
--- a/drivers/nfc/pn544/i2c.c
+++ b/drivers/nfc/pn544/i2c.c
@@ -241,8 +241,6 @@ static int pn544_hci_i2c_enable(void *phy_id)
 {
 	struct pn544_i2c_phy *phy = phy_id;
 
-	pr_info("%s\n", __func__);
-
 	pn544_hci_i2c_enable_mode(phy, PN544_HCI_MODE);
 
 	phy->powered = 1;
@@ -875,9 +873,6 @@ static int pn544_hci_i2c_probe(struct i2c_client *client,
 	struct pn544_i2c_phy *phy;
 	int r = 0;
 
-	dev_dbg(&client->dev, "%s\n", __func__);
-	dev_dbg(&client->dev, "IRQ: %d\n", client->irq);
-
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		nfc_err(&client->dev, "Need I2C_FUNC_I2C\n");
 		return -ENODEV;
@@ -937,8 +932,6 @@ static int pn544_hci_i2c_remove(struct i2c_client *client)
 {
 	struct pn544_i2c_phy *phy = i2c_get_clientdata(client);
 
-	dev_dbg(&client->dev, "%s\n", __func__);
-
 	cancel_work_sync(&phy->fw_work);
 	if (phy->fw_work_state != FW_WORK_STATE_IDLE)
 		pn544_hci_i2c_fw_work_complete(phy, -ENODEV);
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
