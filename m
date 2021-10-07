Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B27ED425453
	for <lists+linux-nfc@lfdr.de>; Thu,  7 Oct 2021 15:38:32 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 7078D100EA93D;
	Thu,  7 Oct 2021 06:38:30 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id A07AA100EA939
	for <linux-nfc@lists.01.org>; Thu,  7 Oct 2021 06:38:27 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1D2763FFF2
	for <linux-nfc@lists.01.org>; Thu,  7 Oct 2021 13:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633613906;
	bh=7wHPc2hCaswmbEOYcj4jBzC9LLYp/Egl2xOhlhUQit0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=bCkeO3ho4YrUR6lTkKn/tO58cFU212ssnq2pQ8FEdorzzaUIBaMRu6UKoftWX0EPm
	 7vAcYyU74h6nyl6O2ZRmLwUrEQHhyzUF7h40jzlfz0RsvjR5pAj7BDjq67pBKetJT5
	 UY9rBmr1nfbmy8oPtpdHFEuVI1vogY2SNQjbVZ4Ij74NF1e5hI8MOmaGlM6PpMNv1F
	 ueQ90By2iPioZ52b04wqf8z7h/beYZzbN+Yu50Fea3FWAVzlRZO26bHW3VNP96BqTo
	 /4cdhnCkixh+I65Obb3A0jMRuWB00EsJZVhvycsAyMhuYSFOgsTvF0zhpS32f1zWCI
	 jmCBOSDZdsCLA==
Received: by mail-ed1-f70.google.com with SMTP id r11-20020aa7cfcb000000b003d4fbd652b9so3879620edy.14
        for <linux-nfc@lists.01.org>; Thu, 07 Oct 2021 06:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7wHPc2hCaswmbEOYcj4jBzC9LLYp/Egl2xOhlhUQit0=;
        b=w8DMtamcd+3TumlkKzdPm810Py3ZvIjksuh4Z3H94A87kwZdz+pBPWvNtXWZXQfB2K
         8TJN9VaMcXAYOuia5U6iaFaYmrPe983QDx4ZoX6fk5cYAx4OhHJcWuKKjxO2Ttj2v2UG
         lpvhmyPmeGiqnES1Hpx+ZFkOVHCik0zhEPY/+O0BkogNqcm6Qpy/3jXzoh2F9Gd/IYrD
         1bnYLo664UzO1TlT7pddpZmAAhHrJweDYr0vxE2YOxojzufnQrqtoGe8mvgEsLdDzixX
         hNBk/8jYRMvU4HPC4siGtnJAVMKhw7UjuOLhoy2WNOUAS3NWpDWTL8f2i/jZdjPcoCcg
         q4Cw==
X-Gm-Message-State: AOAM533D1m61ySSP9i1jCkZJ3nbJRNR1g+Ljs1QO7YylevquCkQTNUiB
	dcw2kQyb6NpRhSfZpNlbmL+QZJKrUov8RHMkw2bXe2mfUndn6mFWaLzZkrLbUc0MuNJj97CEcKK
	h3hV2gOBMyVHunsLGpmCYC8JZ/Ivb2KGRnw==
X-Received: by 2002:a17:907:7691:: with SMTP id jv17mr5620865ejc.378.1633613905842;
        Thu, 07 Oct 2021 06:38:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwW6wSstelqxnszacAmVV1yOLN/Y4Rrb3LyOnmrOYct0SAg12rc5jiDQJPx5MKSQQJZNOEMxQ==
X-Received: by 2002:a17:907:7691:: with SMTP id jv17mr5620839ejc.378.1633613905666;
        Thu, 07 Oct 2021 06:38:25 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id ay19sm8585613edb.20.2021.10.07.06.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 06:38:24 -0700 (PDT)
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
Date: Thu,  7 Oct 2021 15:30:20 +0200
Message-Id: <20211007133021.32704-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211007133021.32704-1-krzysztof.kozlowski@canonical.com>
References: <20211007133021.32704-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: XLCKSKJHOB35DG3UBHXTPY55QQKMQHNH
X-Message-ID-Hash: XLCKSKJHOB35DG3UBHXTPY55QQKMQHNH
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [RESEND PATCH v2 6/7] nfc: trf7970a: drop unneeded debug prints
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/XLCKSKJHOB35DG3UBHXTPY55QQKMQHNH/>
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
Acked-by: Mark Greer <mgreer@animalcreek.com>
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
