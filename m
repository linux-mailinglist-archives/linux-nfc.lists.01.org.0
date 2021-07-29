Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCE03DA139
	for <lists+linux-nfc@lfdr.de>; Thu, 29 Jul 2021 12:40:46 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 55B0B100EB822;
	Thu, 29 Jul 2021 03:40:42 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 53C91100EBB72
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:40:40 -0700 (PDT)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 3A4953F110
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 10:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627555239;
	bh=8EDO8hbetO1mnknXtDL482rftlukDehwkpBsBwJNSdE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=a9F9Kuf66F9m9f0E1H1Fa3W/FWi3TamL+faA3Li+zhob/81THfDgi5d6UrSWYnTz+
	 Epj85cJSFPTD4FemAEJGSNzDjKlqCoCeYIoMWHNy8mhSrP3380vwgSz1z7yCgkZ5qq
	 L0Yf/IJ4az5joXWgMzfKVpRJbJvHUPPLj6kxUDr+yVaoNazvpQ0UGVJiAC9JvlSHFj
	 QOkskfNV1eCNBMMPT8ZNrHVGF63xCJ/R6r6wYc2yzmlPu2ItAyKmfoZpOXpemevB4j
	 W5hSqHwJMTpOMGtPI2S9hWleughg8Z6+PRvYN1dSJlCqRtCmlSpi1Mrg/Pd4pFHW87
	 desx4dr4FIJRA==
Received: by mail-ej1-f72.google.com with SMTP id ne21-20020a1709077b95b029057eb61c6fdfso1823757ejc.22
        for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8EDO8hbetO1mnknXtDL482rftlukDehwkpBsBwJNSdE=;
        b=lljFI3+uoOWJ0ZBuChU5rvdVo2yXgbt779QuR8QRVDu8CVAsDujuJKQ3IJsZCrABhK
         JXgIJUTeEom7MqEaOYsM9ncx6qTbfRhTAzKzKj2Lj8X5h8mIwsrQw3KgmRo26wak3pTh
         eFZ/7UNjFbBMA2blZCFiTGG4bTt2b+3QpC+qy+G3Vz1xwc9NC2rAxN7pOsnDT8ol+RZ+
         XqYuEdo1D2iBK6PjWCDPCIDV6PAL+DrBpWnkJwHzOAIbB1AxkgJdCz7XaZM78MgjyYi4
         eNx3OfpAnidfsOs9AF7SOI63CRCqRmLgGCaW/LwmZ16T+eKvwz+JOXqOV2jytAebiXGT
         i8pg==
X-Gm-Message-State: AOAM53259sLXBMtW/7qYQUmzYOyvliwCiFG6Po1G5FAl3em+DJDTiI2+
	av4Od0phQKZiwaAfSeCfZtesy5kgCkAOFQzT2s4l2PKiR6FhYmxaRDXnEgYvpfycVix/1p+Fpsh
	dOPgjgFIj8IklZdz+14FeyT4Os6EXx3SjDA==
X-Received: by 2002:a17:907:364:: with SMTP id rs4mr4101076ejb.56.1627555238863;
        Thu, 29 Jul 2021 03:40:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZOu9E6xI3XjXcxdCN71pcdo7KIqUHufVdue1M53+xuTdudckjsCWW6eu5CVaY3Tc87olLnA==
X-Received: by 2002:a17:907:364:: with SMTP id rs4mr4101068ejb.56.1627555238733;
        Thu, 29 Jul 2021 03:40:38 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id c14sm824475ejb.78.2021.07.29.03.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 03:40:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Bongsu Jeon <bongsu.jeon@samsung.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Date: Thu, 29 Jul 2021 12:40:14 +0200
Message-Id: <20210729104022.47761-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
References: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: XDKRUX5KZZPJ6MXD63OYIACSAHHUGD6A
X-Message-ID-Hash: XDKRUX5KZZPJ6MXD63OYIACSAHHUGD6A
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 04/12] nfc: trf7970a: constify several pointers
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/XDKRUX5KZZPJ6MXD63OYIACSAHHUGD6A/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Several functions do not modify pointed data so arguments and local
variables can be const for correctness and safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/trf7970a.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
index 1aed44629aaa..8890fcd59c39 100644
--- a/drivers/nfc/trf7970a.c
+++ b/drivers/nfc/trf7970a.c
@@ -643,7 +643,7 @@ static void trf7970a_send_err_upstream(struct trf7970a *trf, int errno)
 }
 
 static int trf7970a_transmit(struct trf7970a *trf, struct sk_buff *skb,
-			     unsigned int len, u8 *prefix,
+			     unsigned int len, const u8 *prefix,
 			     unsigned int prefix_len)
 {
 	struct spi_transfer t[2];
@@ -1387,9 +1387,10 @@ static int trf7970a_is_iso15693_write_or_lock(u8 cmd)
 	}
 }
 
-static int trf7970a_per_cmd_config(struct trf7970a *trf, struct sk_buff *skb)
+static int trf7970a_per_cmd_config(struct trf7970a *trf,
+				   const struct sk_buff *skb)
 {
-	u8 *req = skb->data;
+	const u8 *req = skb->data;
 	u8 special_fcn_reg1, iso_ctrl;
 	int ret;
 
@@ -1791,7 +1792,7 @@ static int _trf7970a_tg_listen(struct nfc_digital_dev *ddev, u16 timeout,
 static int trf7970a_tg_listen(struct nfc_digital_dev *ddev, u16 timeout,
 			      nfc_digital_cmd_complete_t cb, void *arg)
 {
-	struct trf7970a *trf = nfc_digital_get_drvdata(ddev);
+	const struct trf7970a *trf = nfc_digital_get_drvdata(ddev);
 
 	dev_dbg(trf->dev, "Listen - state: %d, timeout: %d ms\n",
 		trf->state, timeout);
@@ -1803,7 +1804,7 @@ static int trf7970a_tg_listen_md(struct nfc_digital_dev *ddev,
 				 u16 timeout, nfc_digital_cmd_complete_t cb,
 				 void *arg)
 {
-	struct trf7970a *trf = nfc_digital_get_drvdata(ddev);
+	const struct trf7970a *trf = nfc_digital_get_drvdata(ddev);
 	int ret;
 
 	dev_dbg(trf->dev, "Listen MD - state: %d, timeout: %d ms\n",
@@ -1824,7 +1825,7 @@ static int trf7970a_tg_listen_md(struct nfc_digital_dev *ddev,
 
 static int trf7970a_tg_get_rf_tech(struct nfc_digital_dev *ddev, u8 *rf_tech)
 {
-	struct trf7970a *trf = nfc_digital_get_drvdata(ddev);
+	const struct trf7970a *trf = nfc_digital_get_drvdata(ddev);
 
 	dev_dbg(trf->dev, "Get RF Tech - state: %d, rf_tech: %d\n",
 		trf->state, trf->md_rf_tech);
@@ -1974,7 +1975,7 @@ static void trf7970a_shutdown(struct trf7970a *trf)
 	trf7970a_power_down(trf);
 }
 
-static int trf7970a_get_autosuspend_delay(struct device_node *np)
+static int trf7970a_get_autosuspend_delay(const struct device_node *np)
 {
 	int autosuspend_delay, ret;
 
@@ -1987,7 +1988,7 @@ static int trf7970a_get_autosuspend_delay(struct device_node *np)
 
 static int trf7970a_probe(struct spi_device *spi)
 {
-	struct device_node *np = spi->dev.of_node;
+	const struct device_node *np = spi->dev.of_node;
 	struct trf7970a *trf;
 	int uvolts, autosuspend_delay, ret;
 	u32 clk_freq = TRF7970A_13MHZ_CLOCK_FREQUENCY;
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
