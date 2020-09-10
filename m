Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D251B26496B
	for <lists+linux-nfc@lfdr.de>; Thu, 10 Sep 2020 18:12:44 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 8E6C61426341A;
	Thu, 10 Sep 2020 09:12:43 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=krzk@kernel.org; receiver=<UNKNOWN> 
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 4EFDF14263412
	for <linux-nfc@lists.01.org>; Thu, 10 Sep 2020 09:12:41 -0700 (PDT)
Received: from localhost.localdomain (unknown [194.230.155.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1AD9320C09;
	Thu, 10 Sep 2020 16:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599754361;
	bh=ipXNcf/TRHvf+ZR7u/TpP2y/IWKhoPj+ksZzOBS6oeY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LYXD5L1KnSWu9wrTfZpVm7D0GGZfWKqF4E7VDT6pnjMpouWEamKmpdlvM9ijAK/eK
	 QWcRPcCAl9HaufFaAOA6s3msHheRw5l3FQYUlnMKmaZaNs/xUcfX8EabfcmDlIgnvl
	 s8xz2tBfAXi54roPdCqIGRGBbxzRoAttSWCNarjA=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Opasiak <k.opasiak@samsung.com>,
	Kukjin Kim <kgene@kernel.org>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-nfc@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Date: Thu, 10 Sep 2020 18:12:14 +0200
Message-Id: <20200910161219.6237-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910161219.6237-1-krzk@kernel.org>
References: <20200910161219.6237-1-krzk@kernel.org>
Message-ID-Hash: RGAROD6JJ5YXIUQAAWUMFQ4IY5L6DDLC
X-Message-ID-Hash: RGAROD6JJ5YXIUQAAWUMFQ4IY5L6DDLC
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v3 3/8] nfc: s3fwrn5: Remove wrong vendor prefix from GPIOs
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/RGAROD6JJ5YXIUQAAWUMFQ4IY5L6DDLC/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The device tree property prefix describes the vendor, which in case of
S3FWRN5 chip is Samsung.  Therefore the "s3fwrn5" prefix for "en-gpios"
and "fw-gpios" is not correct and should be deprecated.  Introduce
properly named properties for these GPIOs but still support deprecated
ones.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/nfc/s3fwrn5/i2c.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
index b4eb926d220a..557279492503 100644
--- a/drivers/nfc/s3fwrn5/i2c.c
+++ b/drivers/nfc/s3fwrn5/i2c.c
@@ -200,13 +200,21 @@ static int s3fwrn5_i2c_parse_dt(struct i2c_client *client)
 	if (!np)
 		return -ENODEV;
 
-	phy->gpio_en = of_get_named_gpio(np, "s3fwrn5,en-gpios", 0);
-	if (!gpio_is_valid(phy->gpio_en))
-		return -ENODEV;
+	phy->gpio_en = of_get_named_gpio(np, "en-gpios", 0);
+	if (!gpio_is_valid(phy->gpio_en)) {
+		/* Support also deprecated property */
+		phy->gpio_en = of_get_named_gpio(np, "s3fwrn5,en-gpios", 0);
+		if (!gpio_is_valid(phy->gpio_en))
+			return -ENODEV;
+	}
 
-	phy->gpio_fw_wake = of_get_named_gpio(np, "s3fwrn5,fw-gpios", 0);
-	if (!gpio_is_valid(phy->gpio_fw_wake))
-		return -ENODEV;
+	phy->gpio_fw_wake = of_get_named_gpio(np, "wake-gpios", 0);
+	if (!gpio_is_valid(phy->gpio_fw_wake)) {
+		/* Support also deprecated property */
+		phy->gpio_fw_wake = of_get_named_gpio(np, "s3fwrn5,fw-gpios", 0);
+		if (!gpio_is_valid(phy->gpio_fw_wake))
+			return -ENODEV;
+	}
 
 	return 0;
 }
-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
