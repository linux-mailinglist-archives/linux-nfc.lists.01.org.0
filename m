Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D8D402861
	for <lists+linux-nfc@lfdr.de>; Tue,  7 Sep 2021 14:18:37 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 323CC100EB823;
	Tue,  7 Sep 2021 05:18:32 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 1FA62100EB825
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 05:18:30 -0700 (PDT)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 14E0E401A9
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 12:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631017109;
	bh=ZvGFi5U4zjTh+pnHq+nIFd+NOwEdjR6IPvbXckjfAj8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=CYmZKOFezy++0nWrJ0qjVWtfMiOWvQOpGEgJa5q4iKLsqlpefchLg23Ub/gM222S0
	 vVQuzstVUJJ55pPsrhd1xq2Bx7rGzjV3gZf5/0vcrLWpY1pTp68cmr9PwYZvneF12y
	 N90H03myEkZCMusRkIjFmP5c0Dnc2pFnvISKyhwqp/WW9EJs8pQh2NwuaMiHRjeOjh
	 JuWtop/COEI8b9xCAayiM7NnQXoNSIJNfPkBgWdLk4Qs/0IPL6OH+fhIajKyuyUozE
	 2IZBIpGmOyTH56mhmHku0agMe+UzlEkyp7b19JWY4yJpn2TqVc9+6V8Ng0yZGs416V
	 mBUYOCCyXd9GA==
Received: by mail-wm1-f72.google.com with SMTP id v2-20020a7bcb420000b02902e6b108fcf1so1105378wmj.8
        for <linux-nfc@lists.01.org>; Tue, 07 Sep 2021 05:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZvGFi5U4zjTh+pnHq+nIFd+NOwEdjR6IPvbXckjfAj8=;
        b=tCVvajfpehxoq8fymuOtS2SidqcL6FM/yv+fRwsEJjHyymdITkQx9aqMAS+VQODDY3
         2yrzUAjOWyBroUp4bVUxsPACzVK32lFEJPnrOSW+uGxZAfnP9X5DjE9nEZLW/hH10C1M
         O0MS2JKz3kJvLH/KDB4uqhlk/TrU8550N/11Qg6oBsmcpxxU76iG57X0xjapU+RbFDME
         zZOMv+0CVP+OtFqtPrKCii+h9hld9q48p1I5zYHxfzIMpOtpjlht6DDYXcip7R/QiTpN
         yInvrfGfZIrfGviqeHFg5YCv5jGBHfMrD6DeDJa9xqf94Qdmgxv9lUgmZI9To2y5/K1p
         dmDg==
X-Gm-Message-State: AOAM530AouYQ9qsuwUpI1dDB1FWR0Nnz3hjxnrHJAtJTlU6WsCaU/Tuj
	t/W0xelw7PAPTf7DQS+bhtXlOFnPNngM6wk2ol0fsZkNRR8/lq3RLbB7t4HtiEwluEOKaH+pj1y
	W+zM/VDlFV30gFJcfrH5F7Pqur5LXT/Q7fw==
X-Received: by 2002:a05:6000:1623:: with SMTP id v3mr18866640wrb.288.1631017108011;
        Tue, 07 Sep 2021 05:18:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPP0rxMIlB99OlQytxsYXswgaB3Zazfam9ab+Im0W3DSjzmYqWwvuiOBFhSweZVXznCZOlRw==
X-Received: by 2002:a05:6000:1623:: with SMTP id v3mr18866621wrb.288.1631017107888;
        Tue, 07 Sep 2021 05:18:27 -0700 (PDT)
Received: from kozik-lap.lan ([79.98.113.47])
        by smtp.gmail.com with ESMTPSA id m3sm13525216wrg.45.2021.09.07.05.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 05:18:27 -0700 (PDT)
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
Date: Tue,  7 Sep 2021 14:18:06 +0200
Message-Id: <20210907121816.37750-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
References: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: KHMLO2N4K6HOC7DBH4YZEPFS32BIMVWR
X-Message-ID-Hash: KHMLO2N4K6HOC7DBH4YZEPFS32BIMVWR
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 05/15] nfc: pn533: drop unneeded debug prints
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/KHMLO2N4K6HOC7DBH4YZEPFS32BIMVWR/>
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
 drivers/nfc/pn533/i2c.c   | 1 -
 drivers/nfc/pn533/pn533.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/nfc/pn533/i2c.c b/drivers/nfc/pn533/i2c.c
index e6bf8cfe3aa7..91d4a035eb63 100644
--- a/drivers/nfc/pn533/i2c.c
+++ b/drivers/nfc/pn533/i2c.c
@@ -138,7 +138,6 @@ static irqreturn_t pn533_i2c_irq_thread_fn(int irq, void *data)
 	}
 
 	client = phy->i2c_dev;
-	dev_dbg(&client->dev, "IRQ\n");
 
 	if (phy->hard_fault != 0)
 		return IRQ_HANDLED;
diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index 2f3f3fe9a0ba..c5f127fe2d45 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -1235,8 +1235,6 @@ static void pn533_listen_mode_timer(struct timer_list *t)
 {
 	struct pn533 *dev = from_timer(dev, t, listen_timer);
 
-	dev_dbg(dev->dev, "Listen mode timeout\n");
-
 	dev->cancel_listen = 1;
 
 	pn533_poll_next_mod(dev);
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
