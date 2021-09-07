Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5716F402866
	for <lists+linux-nfc@lfdr.de>; Tue,  7 Sep 2021 14:18:44 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 88DF8100EB82A;
	Tue,  7 Sep 2021 05:18:38 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id E9BE9100EB83C
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 05:18:35 -0700 (PDT)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B7D914079B
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 12:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631017114;
	bh=dm7SJ/bHwjEDyQ2RFr3SYt5wwlTFgyi3tJxfnWGO4aU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=P8NE7jktgFoRLcAw9YKtpxd9cyE05iHpHlXZKxAUKWliYfHfNx+dRXd5HrDcc+eN1
	 7hdkaH7Q1qRKVmOT9IyEaWQ+0p74/V9ICAYjpS+I11GDYZOI7IYYKZYLe2nDK+0qqE
	 Lxler81NbAzvSk7rcIFlf//Xxa+TcYFHWh81Dv1WzUTUWxR0BlgZdcrM0qGtEqkZyp
	 n00Wm9C5NZaKciupQNoBaRqeqCT8VYM57UD04Lh7oZ2W5S8fv3N+Q08FwOBgNAEm8U
	 /JGztzo5iSGrp06CAcqRGril2z+xNHQM2JmGvw8zSoY100B6Pfd73lHEggtbTBM9Uu
	 sJehb81J6fnjA==
Received: by mail-wr1-f70.google.com with SMTP id l12-20020a5d410c000000b00159aa62fbb2so636193wrp.3
        for <linux-nfc@lists.01.org>; Tue, 07 Sep 2021 05:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dm7SJ/bHwjEDyQ2RFr3SYt5wwlTFgyi3tJxfnWGO4aU=;
        b=IcEpKuyborg7O/C82WwVqw1depb6j7noTJI+eQ7pWg8+/1TdvHdS1gaRVf1dO3bqLW
         v9fTHfH4eMV3idxhL1WzgrdQO1jGnePRzebTw24MlRqvN1pDrZMDDWFD8VLjbghlXDwx
         ml7lzNQR3xc6h0Yk8KIJDECjFUNH5OM247lniX/9uC9T2TC3x3vo1HMZmQf1UA7m40ap
         X7CfVaxTsoasLZsV/lKswZWpNCGhuFqsUKFqlXSBQhlCz4GN1e4Cmd8L8bJ85n4Qh8gV
         6XSOVs8eZF2hTRszS0/C632Owr35bnWAHpJOUTnsH8IrvV+O7e68K0ULkSt7wPZsLsEg
         ugog==
X-Gm-Message-State: AOAM531fG04bPRW5/LnHRh7dkV92kUbI8H7d9+0uikAzdrbhMVn1ujOl
	LTfEcZfdO01wxk/sGncaP8E6LU/K0uICkQwqCaGmvhVAmkNfZsjF5XeFwvBKndGrnxMbUuqsR3W
	6rBx0TJgQpsVr392IX5SW1ZWDQfB7i1DS2g==
X-Received: by 2002:a05:600c:22d2:: with SMTP id 18mr3809629wmg.57.1631017114368;
        Tue, 07 Sep 2021 05:18:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5jtNrITmHBDgLaBbxdrMwDPzRPd9HWI65g33beGxYwDoKNU0TPfWLbynhjY+3UZBxDrACFA==
X-Received: by 2002:a05:600c:22d2:: with SMTP id 18mr3809616wmg.57.1631017114195;
        Tue, 07 Sep 2021 05:18:34 -0700 (PDT)
Received: from kozik-lap.lan ([79.98.113.47])
        by smtp.gmail.com with ESMTPSA id m3sm13525216wrg.45.2021.09.07.05.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 05:18:33 -0700 (PDT)
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
Date: Tue,  7 Sep 2021 14:18:11 +0200
Message-Id: <20210907121816.37750-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
References: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 5RZLR5YGZMS2E2MPGE7OQFNGTKT42ERO
X-Message-ID-Hash: 5RZLR5YGZMS2E2MPGE7OQFNGTKT42ERO
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 10/15] nfc: st-nci: drop unneeded debug prints
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/5RZLR5YGZMS2E2MPGE7OQFNGTKT42ERO/>
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
index a620c34790e6..af1f04c306cc 100644
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
