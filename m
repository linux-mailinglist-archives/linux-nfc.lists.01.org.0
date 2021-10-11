Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3765428E35
	for <lists+linux-nfc@lfdr.de>; Mon, 11 Oct 2021 15:39:30 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 6E6FB100F3FAB;
	Mon, 11 Oct 2021 06:39:29 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 22C01100F3FA5
	for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 06:39:27 -0700 (PDT)
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A1DC03FFEF
	for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 13:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633959565;
	bh=Puh8mRYPY/DpKQ/I9uyYNXcSBWp/u+3lkb87itcd3n8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=GBOtz7AsG/vkM4KnYQ5v3ib258lLEMElMlknoaG6J/Hv6FIRTLteMFM0KWfqKiHTA
	 EpaINKBCJkt7A0Kh0TfPDZiJ5csQpiZd0ZswBMUXz4D9yLc7LnReoRiH8WKzN2+zVV
	 zdDU3XZzbDOuAe4ReWOtZvLhQ/lI3G7L7+xKfH4eqcg0W1c/T5B9ePDZFg7LpWvoNV
	 SgLxkpVugpD9gCXib+JhU7gILkT20epEA9uBHLJX62NZWhPhxS+8/wp3y8oDXiqQpJ
	 LRs81GqgP4P7lP2dQizeTfEisRgFshS0UdzMoe2ZBobc5xzovz28dNYNxmYDt/pWUq
	 uUJkcq6MZXGvQ==
Received: by mail-lf1-f70.google.com with SMTP id z18-20020a0565120c1200b003fd76d7ca21so5747507lfu.13
        for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 06:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Puh8mRYPY/DpKQ/I9uyYNXcSBWp/u+3lkb87itcd3n8=;
        b=goihUO4YVlhhAF3tcD/TuNL3wIEeVsAJFSBA9+3/df7arcpvuUvsJBpeP8ACA//mJE
         PPmV269yO7EqL/9Jung9Pw2GUT3/HOxnEPSjmk57GeN4ik2EvUlIF+sTjVO61hEGClak
         zD7Zf+DKUkyr8JXgZjS+uINGhivd9yDdwdsEUI3Wq5slYm3ndS7FB6SHOX5jeTWNkWQ+
         vtea3/b5m4Ecb2XjUr7k536ML2JO1nVUDI3s7CoC+iyvzoOcuYlTK75L8lh/WqO28EN3
         LYY25mfKDUYJ54YrliW6GpbjgvR52E/wIn4ykcHCJeBJLFK0q5YeDx7KJtSsx4OO63HF
         FGYg==
X-Gm-Message-State: AOAM531xoZ2Kuul1XzsPA2L6ivMIfaz+XHafNHK8UpsBRMcTgq6ezKUx
	2BrZN6ENgw9FyU6+cD0vS2Ock+wMDWGc1gMHlhM51+KllI9I3ch5WRcVuik1nmFqsSqRNzNsGgS
	GgIG2ivcKvhbD3Bzpl4bwhWmECF35iZloDA==
X-Received: by 2002:a2e:2f02:: with SMTP id v2mr22210439ljv.46.1633959564971;
        Mon, 11 Oct 2021 06:39:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsHtSdzR2RKXsyeIm4Ju2gl2Vpl3fdAIGqOrTAjyiVzZQlzK6SqwIND9M51s0GItDHKqvpwQ==
X-Received: by 2002:a2e:2f02:: with SMTP id v2mr22210288ljv.46.1633959563302;
        Mon, 11 Oct 2021 06:39:23 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a21sm738971lff.37.2021.10.11.06.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 06:39:22 -0700 (PDT)
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
Date: Mon, 11 Oct 2021 15:38:33 +0200
Message-Id: <20211011133835.236347-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211011133835.236347-1-krzysztof.kozlowski@canonical.com>
References: <20211011133835.236347-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: ZEO4LAOFPAU7IHRJTKIB37QDLFLGVEHV
X-Message-ID-Hash: ZEO4LAOFPAU7IHRJTKIB37QDLFLGVEHV
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: joe@perches.com
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v3 5/7] nfc: st21nfca: drop unneeded debug prints
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ZEO4LAOFPAU7IHRJTKIB37QDLFLGVEHV/>
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
