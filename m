Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9949A402867
	for <lists+linux-nfc@lfdr.de>; Tue,  7 Sep 2021 14:18:45 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 9A94D100EB332;
	Tue,  7 Sep 2021 05:18:39 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id CE811100EB32F
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 05:18:36 -0700 (PDT)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C59514079E
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 12:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631017115;
	bh=Puh8mRYPY/DpKQ/I9uyYNXcSBWp/u+3lkb87itcd3n8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=uUM0PGv4Rfv1eIcr/jyhIigDDP8aHrh/h5BVxfaJ8Y/CnfjE8YPeL7liuR927Teqq
	 STekRzWqNFsFiHoLo5t/iynyWYXVdQ0HGA5UBL6syWw1UeEWS+ORr/8D7DEu4OLJmW
	 ZDegXvvAx1ePauQZeHS74aULclKv5J+6S8N3GUkIGtCMEAPt8hydng134zw5kYMc2S
	 8H912pfWb6qtYXviPK2WAMfiWwzJCQfuzaAGYfjPqE6xf3FqovXyzbd/lzwFplv1Es
	 2L/oX5igL3KDFVgiCFEUnR5ClL8RhnvuKBRKkZ9TcB8yHNTBCTVCY1s7+y2G6Jhg45
	 TkVBqvd3XDtRA==
Received: by mail-wm1-f69.google.com with SMTP id n17-20020a7bc5d1000000b002f8ca8bacdeso751192wmk.3
        for <linux-nfc@lists.01.org>; Tue, 07 Sep 2021 05:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Puh8mRYPY/DpKQ/I9uyYNXcSBWp/u+3lkb87itcd3n8=;
        b=lJM/d4OIIkPLMGPiOzqV8nBUis1fuOkEKfLJ+FQG8EdYtLazXydR5+n9K5lNxjwKbR
         6Nc7C0gRgBeyA5GGUwrfWfMBKdqQYycilV1sHmqOyTX95rjWibJRz/TKNkM/XPw0i/2L
         1a9Sd7pummkv2pE4C31XY+4tQFxTHZmlcM5u7rmslANbpfqYf0O6E5c/iRLq4gfWbMSA
         ZjpR7sZ+a71gC6MCyQ7h9JvtghtSKmsEEG5CcCibIuKz5tf8kGILUc+FubTjNGJlPYWP
         5mUUawkWHsplmrwc0efdtYNUx6LxhwcCJCEm56kl8rVt2q5k3yVb7Yazjzx7XUIJt12V
         3e6w==
X-Gm-Message-State: AOAM530V4lcl23uBXPz9uTKfKLWLF03Bp+dBliNjOoHhwYKoRxv38+2g
	1NFjMzeovHNoLYguY8Wfsn/yzM6WO8kdjgIoqpNzyamSRFpKuEmoB4/PGDHtk3Ppfz8lXQqyvSU
	aAoivRFnATJlXULm62CLGXulhvYNDG1nikQ==
X-Received: by 2002:adf:f490:: with SMTP id l16mr18418670wro.136.1631017115522;
        Tue, 07 Sep 2021 05:18:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLMJx55+Q/WM79I6j8ltV38paMRUj8UUI3CoLPAg5wP7ajpWFYZY+esfWvjPdv6zq3PNmHWg==
X-Received: by 2002:adf:f490:: with SMTP id l16mr18418651wro.136.1631017115342;
        Tue, 07 Sep 2021 05:18:35 -0700 (PDT)
Received: from kozik-lap.lan ([79.98.113.47])
        by smtp.gmail.com with ESMTPSA id m3sm13525216wrg.45.2021.09.07.05.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 05:18:35 -0700 (PDT)
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
Date: Tue,  7 Sep 2021 14:18:12 +0200
Message-Id: <20210907121816.37750-12-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
References: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: ZNUS77NLD5Y5H7XXBNKUZ2ADF6YLFQU6
X-Message-ID-Hash: ZNUS77NLD5Y5H7XXBNKUZ2ADF6YLFQU6
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 11/15] nfc: st21nfca: drop unneeded debug prints
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ZNUS77NLD5Y5H7XXBNKUZ2ADF6YLFQU6/>
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
