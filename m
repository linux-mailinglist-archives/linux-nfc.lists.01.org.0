Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5678A42544E
	for <lists+linux-nfc@lfdr.de>; Thu,  7 Oct 2021 15:38:30 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 52242100EA2A1;
	Thu,  7 Oct 2021 06:38:27 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id E33F3100EA936
	for <linux-nfc@lists.01.org>; Thu,  7 Oct 2021 06:38:24 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BF1653FFF5
	for <linux-nfc@lists.01.org>; Thu,  7 Oct 2021 13:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633613903;
	bh=i5yc8KqEKBR9h1kRXiKNI/2N/o+Yq4m6PQJBbQ1oeXs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=ZKCdnfjfJXarBeCrT86YsAboUdcpzldopXsDk2aG/rcu7izeL5/wHetBxmm9zkTHK
	 zhjTrinyyKwW4uGgKHo35Wp7goPMhtEbczNV9ITVnk2WOZaEIJVkRjXP3/fSm4bP4B
	 C6aLRVxULoZ2UIZ6zA/CoDa6KWfDiNOQe1Ax+semL1fPZOXvXO3/FYvnbjzOtUvIyS
	 g7x/hUObyqCEEnJkgPkdQg/vnW453cU03xajVQfOEZTroLP39f/F37FkOkbpFKHhZi
	 pOulJfln5LFSxabyLV7eeRcThHaU6ZYCJfXS4zSXyHYtO+10i/mbvTJ6j3M3/GHecy
	 vKpyXXh9eEJHw==
Received: by mail-ed1-f70.google.com with SMTP id p13-20020a056402044d00b003db3256e4f2so5969231edw.3
        for <linux-nfc@lists.01.org>; Thu, 07 Oct 2021 06:38:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i5yc8KqEKBR9h1kRXiKNI/2N/o+Yq4m6PQJBbQ1oeXs=;
        b=RAtPevBwlB+Cq9FrzABbEvXgPJydHKHHH/pGRsfI1Pe42V59ReAIu9pAqShCMLJecJ
         MpPyCnyBNzFMJxL61dXXRGfNsbLXADZtVuqs7fzXHXIl7uaJAfIZz19tyWP0niVKsFR1
         tFMTNaqKHUOt99deEL+Rt0wm6r2iONtcfp2XXT30gXV3ljd83kjR1mYBPcxK2H40AtZw
         Ag3ZeLWTwezUcDLBJET85qXp/up1808KcvXDFSJW5zsQF1CL5dJFD7XqlWYtqS251wyc
         yZHIFiaX8lSqQW/zAvnYpKxSGIdrPqiBqwYVBda8u8MUzIG92TFdUwsVwqSsFM2cI5So
         duQw==
X-Gm-Message-State: AOAM532BP96JVimTLD+ZKt6v50Bd6vEk3P9Jan3Sw8Sg1iI7DmjfP23x
	uulJVxnUyv3t82m2HxP/UxKv3UPUCFHGMQBaJ3AugJR13aS2LYpTkoDYZLWwfyfOhIJkjmMy8/P
	iXE14LD2YOod6JuJa6IDp7sx8uTTCmfA4/g==
X-Received: by 2002:a17:906:c0d4:: with SMTP id bn20mr5857706ejb.360.1633613903416;
        Thu, 07 Oct 2021 06:38:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGs83pPcxwRjT8XZwuGT/4eMaNDYr0PKnMg7lCK+FLOnIuti4ghrKQPTbVDfP50A00g7hgAg==
X-Received: by 2002:a17:906:c0d4:: with SMTP id bn20mr5857680ejb.360.1633613903222;
        Thu, 07 Oct 2021 06:38:23 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id ay19sm8585613edb.20.2021.10.07.06.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 06:38:22 -0700 (PDT)
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
Date: Thu,  7 Oct 2021 15:30:18 +0200
Message-Id: <20211007133021.32704-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211007133021.32704-1-krzysztof.kozlowski@canonical.com>
References: <20211007133021.32704-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 4SHJDUTF522DU3FWZ3WIJN4Q3OKWXW6H
X-Message-ID-Hash: 4SHJDUTF522DU3FWZ3WIJN4Q3OKWXW6H
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [RESEND PATCH v2 4/7] nfc: st-nci: drop unneeded debug prints
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/4SHJDUTF522DU3FWZ3WIJN4Q3OKWXW6H/>
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
 drivers/nfc/st-nci/i2c.c  | 4 ----
 drivers/nfc/st-nci/ndlc.c | 4 ----
 drivers/nfc/st-nci/se.c   | 6 ------
 drivers/nfc/st-nci/spi.c  | 4 ----
 4 files changed, 18 deletions(-)

diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
index ccf6152ebb9f..cbd968f013c7 100644
--- a/drivers/nfc/st-nci/i2c.c
+++ b/drivers/nfc/st-nci/i2c.c
@@ -157,7 +157,6 @@ static int st_nci_i2c_read(struct st_nci_i2c_phy *phy,
 static irqreturn_t st_nci_irq_thread_fn(int irq, void *phy_id)
 {
 	struct st_nci_i2c_phy *phy = phy_id;
-	struct i2c_client *client;
 	struct sk_buff *skb = NULL;
 	int r;
 
@@ -166,9 +165,6 @@ static irqreturn_t st_nci_irq_thread_fn(int irq, void *phy_id)
 		return IRQ_NONE;
 	}
 
-	client = phy->i2c_dev;
-	dev_dbg(&client->dev, "IRQ\n");
-
 	if (phy->ndlc->hard_fault)
 		return IRQ_HANDLED;
 
diff --git a/drivers/nfc/st-nci/ndlc.c b/drivers/nfc/st-nci/ndlc.c
index e9dc313b333e..755460a73c0d 100644
--- a/drivers/nfc/st-nci/ndlc.c
+++ b/drivers/nfc/st-nci/ndlc.c
@@ -239,8 +239,6 @@ static void ndlc_t1_timeout(struct timer_list *t)
 {
 	struct llt_ndlc *ndlc = from_timer(ndlc, t, t1_timer);
 
-	pr_debug("\n");
-
 	schedule_work(&ndlc->sm_work);
 }
 
@@ -248,8 +246,6 @@ static void ndlc_t2_timeout(struct timer_list *t)
 {
 	struct llt_ndlc *ndlc = from_timer(ndlc, t, t2_timer);
 
-	pr_debug("\n");
-
 	schedule_work(&ndlc->sm_work);
 }
 
diff --git a/drivers/nfc/st-nci/se.c b/drivers/nfc/st-nci/se.c
index 5fd89f72969d..7764b1a4c3cf 100644
--- a/drivers/nfc/st-nci/se.c
+++ b/drivers/nfc/st-nci/se.c
@@ -638,8 +638,6 @@ int st_nci_se_io(struct nci_dev *ndev, u32 se_idx,
 {
 	struct st_nci_info *info = nci_get_drvdata(ndev);
 
-	pr_debug("\n");
-
 	switch (se_idx) {
 	case ST_NCI_ESE_HOST_ID:
 		info->se_info.cb = cb;
@@ -671,8 +669,6 @@ static void st_nci_se_wt_timeout(struct timer_list *t)
 	u8 param = 0x01;
 	struct st_nci_info *info = from_timer(info, t, se_info.bwi_timer);
 
-	pr_debug("\n");
-
 	info->se_info.bwi_active = false;
 
 	if (!info->se_info.xch_error) {
@@ -692,8 +688,6 @@ static void st_nci_se_activation_timeout(struct timer_list *t)
 	struct st_nci_info *info = from_timer(info, t,
 					      se_info.se_active_timer);
 
-	pr_debug("\n");
-
 	info->se_info.se_active = false;
 
 	complete(&info->se_info.req_completion);
diff --git a/drivers/nfc/st-nci/spi.c b/drivers/nfc/st-nci/spi.c
index 0875b773fb41..4e723992e74c 100644
--- a/drivers/nfc/st-nci/spi.c
+++ b/drivers/nfc/st-nci/spi.c
@@ -169,7 +169,6 @@ static int st_nci_spi_read(struct st_nci_spi_phy *phy,
 static irqreturn_t st_nci_irq_thread_fn(int irq, void *phy_id)
 {
 	struct st_nci_spi_phy *phy = phy_id;
-	struct spi_device *dev;
 	struct sk_buff *skb = NULL;
 	int r;
 
@@ -178,9 +177,6 @@ static irqreturn_t st_nci_irq_thread_fn(int irq, void *phy_id)
 		return IRQ_NONE;
 	}
 
-	dev = phy->spi_dev;
-	dev_dbg(&dev->dev, "IRQ\n");
-
 	if (phy->ndlc->hard_fault)
 		return IRQ_HANDLED;
 
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
