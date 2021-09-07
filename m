Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DCD402868
	for <lists+linux-nfc@lfdr.de>; Tue,  7 Sep 2021 14:18:46 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id B3BD7100EBB92;
	Tue,  7 Sep 2021 05:18:40 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 391F9100EBB97
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 05:18:38 -0700 (PDT)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 341FA40795
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 12:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631017117;
	bh=vC5ZeeYLEo1QgnDozyJaTYMB8bYZWzk5ZY30xgpVgcM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=aGsw/0nfg0vKVcgQVi+aaj/+ZGMJNtZKdjbUyFIwcWDfu0/prPMgVxXgo0zEa2/b9
	 ye+zWiC0Blem/o98F8xeeJ+N1HwqQA2Xf7BPPfv28sIcqCahXy7fgSFsC3g2YBoQol
	 wflGy1JOY6TTumoXw6W9Q2BLIqcnLLLEdZI8uvYSHvuwnDIvDV+Jz01ZLOdMDrDxLb
	 IDPTsNGsNgppg6G+PqtQ6a0XY8ck2IVqmrT2IpmXZmwoyO/44hB9KGjqL7hGneASRc
	 j7b05UKMUg/8kJJBDXaGVHTQhpbjcJZWTEmIStiu4vKDoHQmqhtVcxjAiAQyaqkdYy
	 G4MP/tqRIRS1A==
Received: by mail-wm1-f70.google.com with SMTP id e33-20020a05600c4ba100b002f8993a54f8so1106799wmp.7
        for <linux-nfc@lists.01.org>; Tue, 07 Sep 2021 05:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vC5ZeeYLEo1QgnDozyJaTYMB8bYZWzk5ZY30xgpVgcM=;
        b=tfXlsdiNGR/jECRwNuJniA3ewsgzbGlxnDPha9F3LXOVZbXMHDQlaf5CK8E5L4ZBlJ
         NVwBYCGFu7cWnSUlY7KhgBLi8S//3uVcfWiMCWaHM5fYl19KIF0OXrd18+ej5za78ICj
         SbTQGFAn8vR6usCGLF5YxXBUV5E2ZqiRJbFQvu5YEeoaeI/V040785mNW2J8docwhjhD
         T82hvYV82yhfD/T00Hj0we8qjEXcsmd0N0XF7nuxHWKjk4JqTmJ9KcqhfozEFP48GxJl
         tNWex1id5PC7yXWp2bojJfZKKc3xPHIBKdB9oPzVnL5aUQ88RqWnN7qVo9tL/7dwECDG
         Ty+w==
X-Gm-Message-State: AOAM531R5xjvUyJFPjqt7F0CdBWDQ8kCwO+wYQ634ACF5/6x0lpATFr5
	hBW/5nIE2Xkf4swOC1rL86kXlDNnwK1h0c4pesC44aw+eQvfpz2WNbk62zojUUny3fX4ooeUWRQ
	0K4PyXFhb0JfKxHxDnW3USDJVuS+Iy4lgHg==
X-Received: by 2002:a05:600c:350b:: with SMTP id h11mr3654651wmq.101.1631017116588;
        Tue, 07 Sep 2021 05:18:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1nc8FfA3NegAiSteStJpWLEeZZ3ZcnTr4pnxkPwnCbeOusix2fXAFJixkw6WN/2ypjZQRhw==
X-Received: by 2002:a05:600c:350b:: with SMTP id h11mr3654639wmq.101.1631017116468;
        Tue, 07 Sep 2021 05:18:36 -0700 (PDT)
Received: from kozik-lap.lan ([79.98.113.47])
        by smtp.gmail.com with ESMTPSA id m3sm13525216wrg.45.2021.09.07.05.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 05:18:36 -0700 (PDT)
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
Date: Tue,  7 Sep 2021 14:18:13 +0200
Message-Id: <20210907121816.37750-13-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
References: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: TSP4ALLQCPKBOOD5LR2N7F3RVSF2I6ZU
X-Message-ID-Hash: TSP4ALLQCPKBOOD5LR2N7F3RVSF2I6ZU
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 12/15] nfc: trf7970a: drop unneeded debug prints
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/TSP4ALLQCPKBOOD5LR2N7F3RVSF2I6ZU/>
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
 drivers/nfc/trf7970a.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
index 8890fcd59c39..29ca9c328df2 100644
--- a/drivers/nfc/trf7970a.c
+++ b/drivers/nfc/trf7970a.c
@@ -2170,8 +2170,6 @@ static int trf7970a_suspend(struct device *dev)
 	struct spi_device *spi = to_spi_device(dev);
 	struct trf7970a *trf = spi_get_drvdata(spi);
 
-	dev_dbg(dev, "Suspend\n");
-
 	mutex_lock(&trf->lock);
 
 	trf7970a_shutdown(trf);
@@ -2187,8 +2185,6 @@ static int trf7970a_resume(struct device *dev)
 	struct trf7970a *trf = spi_get_drvdata(spi);
 	int ret;
 
-	dev_dbg(dev, "Resume\n");
-
 	mutex_lock(&trf->lock);
 
 	ret = trf7970a_startup(trf);
@@ -2206,8 +2202,6 @@ static int trf7970a_pm_runtime_suspend(struct device *dev)
 	struct trf7970a *trf = spi_get_drvdata(spi);
 	int ret;
 
-	dev_dbg(dev, "Runtime suspend\n");
-
 	mutex_lock(&trf->lock);
 
 	ret = trf7970a_power_down(trf);
@@ -2223,8 +2217,6 @@ static int trf7970a_pm_runtime_resume(struct device *dev)
 	struct trf7970a *trf = spi_get_drvdata(spi);
 	int ret;
 
-	dev_dbg(dev, "Runtime resume\n");
-
 	ret = trf7970a_power_up(trf);
 	if (!ret)
 		pm_runtime_mark_last_busy(dev);
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
