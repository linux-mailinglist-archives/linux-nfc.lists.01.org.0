Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FE9428E39
	for <lists+linux-nfc@lfdr.de>; Mon, 11 Oct 2021 15:39:33 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 862EF100F3FB6;
	Mon, 11 Oct 2021 06:39:30 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 396C9100F3FA3
	for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 06:39:28 -0700 (PDT)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 013B73FFF5
	for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 13:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633959567;
	bh=7wHPc2hCaswmbEOYcj4jBzC9LLYp/Egl2xOhlhUQit0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=IIDAbFmfo+on0wenXNIyIIA3C3cjwufcW3E47szjGURObctCOtf1mTunobSVYaL3+
	 pwsrQpzoD/snymUV3117boNOlT1TZDi/8dUMB43+/lui4zjY8db+7ezA7D76RJzeTy
	 vHKDzeYxosEW43oajLPWp4hnkIrNTpnVE6S5zxivwdql0VZz0oBKJ8IhzhhPx1LFfK
	 V9e+51nxlBKEvITyeYm+GUwdepYOpdgCqfaD8DHrvOfD7nSGd5yXJwgExxUUimbyt8
	 sXA5+dODnnjOmGvX0EV7gBNUB+SQG0Isr/I9YxwOaw+OHD5cEY8aqozi2atVtsp+sq
	 KZsLGj2XJmKqw==
Received: by mail-lf1-f71.google.com with SMTP id k8-20020a0565123d8800b003fd6e160c77so7894694lfv.17
        for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 06:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7wHPc2hCaswmbEOYcj4jBzC9LLYp/Egl2xOhlhUQit0=;
        b=PRd/nJybFB1MvnuQI31EGcYckyjg3Bfknrp2pSvnmlrHKyoQ6i3DTnMJSL8APAg7jZ
         WDP1MKMtnhY+qRcsbwF1r2wN296KDd90qIBSvOTI9V4OMyrC+yUac0gs8wji2JX/DdS2
         bkAi4WGqV/SbXQi9BwIEiBn001lSv6dzqz2KrRngumSLtJLGB7Ukyx2anLbqoEpZ62+v
         5qBq31TNuZbvGAvQ+pNrIcQ4uvlmWC+ZBftmzhB7ZlFSP/DZJdbdfrPK6fGUqlRPtSSC
         pY5AJLBB/WIlvEuXxdWU/TcchGWucNtZ9lfCPk+AZIZMq81wFHX1njComt6/gNQXIfdV
         gAIw==
X-Gm-Message-State: AOAM531udKa5K9r0mpf4LnmgR/krN2lNDSATQiPv7hm4gCBXalXteCT6
	OpvhL4i5C2e0r3vsO4QEE4eaXlTWY2FOW1QKQ9I5kyOtInDSjATvppjfREjo8onSdio4VXnZQw6
	rXqdyOdc76lQoU93ZAJneh9hZ395pAVLIEg==
X-Received: by 2002:a2e:9a44:: with SMTP id k4mr14874398ljj.149.1633959564905;
        Mon, 11 Oct 2021 06:39:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQuusYej153D7T4843hgxhZnMn63CiNaU/WCoXvJeUKhYTRGz/hdmDHUziYWi9pV44z1agbQ==
X-Received: by 2002:a2e:9a44:: with SMTP id k4mr14874384ljj.149.1633959564729;
        Mon, 11 Oct 2021 06:39:24 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a21sm738971lff.37.2021.10.11.06.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 06:39:23 -0700 (PDT)
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
Date: Mon, 11 Oct 2021 15:38:34 +0200
Message-Id: <20211011133835.236347-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211011133835.236347-1-krzysztof.kozlowski@canonical.com>
References: <20211011133835.236347-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: X6HHRLYIL4CTSHP2Q6F3OMPTQQ4GN734
X-Message-ID-Hash: X6HHRLYIL4CTSHP2Q6F3OMPTQQ4GN734
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: joe@perches.com
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v3 6/7] nfc: trf7970a: drop unneeded debug prints
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/X6HHRLYIL4CTSHP2Q6F3OMPTQQ4GN734/>
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
