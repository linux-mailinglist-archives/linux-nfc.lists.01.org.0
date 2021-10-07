Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF43425451
	for <lists+linux-nfc@lfdr.de>; Thu,  7 Oct 2021 15:38:31 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 63E2A100EA939;
	Thu,  7 Oct 2021 06:38:28 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 110BD100EA2A2
	for <linux-nfc@lists.01.org>; Thu,  7 Oct 2021 06:38:26 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DF60140003
	for <linux-nfc@lists.01.org>; Thu,  7 Oct 2021 13:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633613904;
	bh=Puh8mRYPY/DpKQ/I9uyYNXcSBWp/u+3lkb87itcd3n8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=YMmqJynP/vK/w0b9UD580d8EvmF5Vq6I4K+18JlB2rswk1NUiEKQT8sby584hYdLB
	 c9+k5lc5xvl6bYWPzdRAS84qDa3vf0QGXLGaTql8+BMSi1FKiNm2/lBXEOInPLuOB1
	 wlr0sAJBWxHyY5OSeEjhvLq4y7ZV7sxVDd0z6M9sb3pognPxIkj8pJZU+QZo1tti9z
	 v+6AO2ff9NbfSJvivsSPW9EB9lePpHP0iZQfa3FuBUOuPa/LA0HwxjBs6BhiCpDe5t
	 izV7VHcq4OVON8QoRtBC8tL+060/hIZQ2XnfZqUvXFwFG9RQB8EDxWYCBk4W+3G3dD
	 OYNKe1Gb1aSYA==
Received: by mail-ed1-f70.google.com with SMTP id 1-20020a508741000000b003da559ba1eeso5918014edv.13
        for <linux-nfc@lists.01.org>; Thu, 07 Oct 2021 06:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Puh8mRYPY/DpKQ/I9uyYNXcSBWp/u+3lkb87itcd3n8=;
        b=7DN3vJyUUsT5xTTEeveWFqWZBiq3y/ZTvLK+Yjfzi6pWQYYzMexbxkkO00wr1CW/FR
         OVCpBxIkf9ACZsnfQ5j3XJCNXpzSzlfkxe8I5USTg1t1o7zjbHRC48ZUoiEuC5dyvNSo
         aFXAHHZl6e4l6OiZUUNLiKbKZxz5MSu6yMEFztzfXqMV66M1O1OXDptwCHukfoHCVS/4
         zZW9G8Iw8oPv3ag5lZkmdToZsZmtsLFVEXcBRyY1bMDrLbDvH0kw6oAXbIHNtmGsW+QA
         0RE+C51uV4N+g7F2BxmUOoKaKb5O285cXFQ1kaCCpFZZK0bIL1bur9yzMZCk9Gifu0Ob
         xmKQ==
X-Gm-Message-State: AOAM530fdlQgLqHlEhWtpEp55rL3cfOvZDY3VXLnx1GAyXHcbxqxL1OZ
	t0DlrEYxKQpDzJ6lcutckt10Lhu+9zzM7A8x3SiQtjzeR5IeV9i3mVvzWl02CRoyPDxiwNWAivP
	UkDx3Dh5rSVd2/WitDm36S/sVPKOXXetCKg==
X-Received: by 2002:a17:906:3a0f:: with SMTP id z15mr5941393eje.42.1633613904633;
        Thu, 07 Oct 2021 06:38:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVZsfRsmZOsEhr/fwES6UsllaiU8YmaLl7naS0VLYqarKwWGbgvqdOR+dFnFEt2mVLnmtVKg==
X-Received: by 2002:a17:906:3a0f:: with SMTP id z15mr5941370eje.42.1633613904460;
        Thu, 07 Oct 2021 06:38:24 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id ay19sm8585613edb.20.2021.10.07.06.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 06:38:23 -0700 (PDT)
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
Date: Thu,  7 Oct 2021 15:30:19 +0200
Message-Id: <20211007133021.32704-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211007133021.32704-1-krzysztof.kozlowski@canonical.com>
References: <20211007133021.32704-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: WLSNHTTYMIO5XIHRY5HH63Z2YLKDQADS
X-Message-ID-Hash: WLSNHTTYMIO5XIHRY5HH63Z2YLKDQADS
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [RESEND PATCH v2 5/7] nfc: st21nfca: drop unneeded debug prints
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/WLSNHTTYMIO5XIHRY5HH63Z2YLKDQADS/>
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
