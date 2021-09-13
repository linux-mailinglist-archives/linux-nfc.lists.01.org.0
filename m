Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3D4408CE6
	for <lists+linux-nfc@lfdr.de>; Mon, 13 Sep 2021 15:21:07 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 87056100EB83E;
	Mon, 13 Sep 2021 06:21:05 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id A11FD100EBB96
	for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 06:21:03 -0700 (PDT)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 837264026D
	for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 13:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631539262;
	bh=Puh8mRYPY/DpKQ/I9uyYNXcSBWp/u+3lkb87itcd3n8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=uLvp7vZqM1PzcVV1bWXHT0vsi4fjOP7t/AwL+w+L5kpIfHIkG9q9kt3rcDRjPcN0w
	 oG2c6lj5RkLdCg3walId7JQHq1Skpa17JA6+pk6Nmvo8TAY6neYCcv0HUKL429toMy
	 WZyQUj6MqN2XpQNQF5jq5L8BBQEH07nOFFk4WRCrDPmVyM05sLWHd33/SBjk7Na28+
	 Ojo9N3rKktZLrm9Dq2THtdAtxT6Ig9SDPaAQw3H2OHbE2kAznmYUsPYzM9O7kD3MfQ
	 wZPiUvBf9pikq1wjqGUpOb6XUNoDyHdi3TZeeQLpF4POto5BmqpjnRNQuOkn+DsSpe
	 4e+vwAfsk8PJg==
Received: by mail-wm1-f72.google.com with SMTP id y23-20020a05600c365700b003015b277f98so1302480wmq.2
        for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 06:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Puh8mRYPY/DpKQ/I9uyYNXcSBWp/u+3lkb87itcd3n8=;
        b=lZx6Cmh/8TEXcoaQNMONqsdgH+vpEbnxZcO9VaBrTp9EsG+cpTS32TXyc6qf3fEKDA
         f5+X+F7AJEkoaGuOp9xr2XYs9Dtb/0cInipSXoBtxYqOFnnssKcySTlwtElCB4+xtXY4
         yo5UeTwLuzZg/zM1n1X2sWgFmg6yRdmy69ZqTuxg11SuCiW+uccwrpqjTIc98+TWO5cX
         /IOC5xrLamWzjfJ8z7QLUsBNTaZBha7U4eu+aDl5KeRFPKsRQ9CEgM7+kkMN29O/E10v
         710h6ZNpD0Cmc+U285/H4j+v9ZXlMJ5bAIbDXCUgcG/BcEmnqd9uh/c0l/8mUht8Qyp+
         xZtg==
X-Gm-Message-State: AOAM531K5Vh41i7wacDNTIMikGP1c4/SEzM2nymNluqya5x3UlWlhArZ
	1OMnW6jMzw9Zhtr3Taf5lxzUUMg4UVfHMGS+sJ5xOoKAuwcr+0dOjA5CxL9Tf69QM2urQLh2qop
	UxFbU8nP5wCgGflp2nANfNbZSbnh42BI71g==
X-Received: by 2002:adf:e603:: with SMTP id p3mr12101600wrm.357.1631539262217;
        Mon, 13 Sep 2021 06:21:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygqJruRSYR9Q9zBFsSsLJSWGwT+Q/2eIRUa8zP6I8mSGmE1siN2j4h18qxV+UlfZLC8c6o7Q==
X-Received: by 2002:adf:e603:: with SMTP id p3mr12101586wrm.357.1631539262084;
        Mon, 13 Sep 2021 06:21:02 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id n3sm7195888wmi.0.2021.09.13.06.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:21:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Krzysztof Opasiak <k.opasiak@samsung.com>,
	Mark Greer <mgreer@animalcreek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Date: Mon, 13 Sep 2021 15:20:31 +0200
Message-Id: <20210913132035.242870-12-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
References: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 3H4MLR3XAIWDBCP6SH5PDQUT7B3I5CM3
X-Message-ID-Hash: 3H4MLR3XAIWDBCP6SH5PDQUT7B3I5CM3
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 11/15] nfc: st21nfca: drop unneeded debug prints
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/3H4MLR3XAIWDBCP6SH5PDQUT7B3I5CM3/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

ftrace is a preferred and standard way to debug entering and exiting
functions so drop useless debug prints.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/st21nfca/i2c.c | 4 ----
 drivers/nfc/st21nfca/se.c  | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index 279d88128b2e..f126ce96a7df 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -421,7 +421,6 @@ static int st21nfca_hci_i2c_read(struct st21nfca_i2c_phy *phy,
 static irqreturn_t st21nfca_hci_irq_thread_fn(int irq, void *phy_id)
 {
 	struct st21nfca_i2c_phy *phy = phy_id;
-	struct i2c_client *client;
 
 	int r;
 
@@ -430,9 +429,6 @@ static irqreturn_t st21nfca_hci_irq_thread_fn(int irq, void *phy_id)
 		return IRQ_NONE;
 	}
 
-	client = phy->i2c_dev;
-	dev_dbg(&client->dev, "IRQ\n");
-
 	if (phy->hard_fault != 0)
 		return IRQ_HANDLED;
 
diff --git a/drivers/nfc/st21nfca/se.c b/drivers/nfc/st21nfca/se.c
index c8bdf078d111..a43fc4117fa5 100644
--- a/drivers/nfc/st21nfca/se.c
+++ b/drivers/nfc/st21nfca/se.c
@@ -257,8 +257,6 @@ static void st21nfca_se_wt_timeout(struct timer_list *t)
 	struct st21nfca_hci_info *info = from_timer(info, t,
 						    se_info.bwi_timer);
 
-	pr_debug("\n");
-
 	info->se_info.bwi_active = false;
 
 	if (!info->se_info.xch_error) {
@@ -278,8 +276,6 @@ static void st21nfca_se_activation_timeout(struct timer_list *t)
 	struct st21nfca_hci_info *info = from_timer(info, t,
 						    se_info.se_active_timer);
 
-	pr_debug("\n");
-
 	info->se_info.se_active = false;
 
 	complete(&info->se_info.req_completion);
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
