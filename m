Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58652408CEB
	for <lists+linux-nfc@lfdr.de>; Mon, 13 Sep 2021 15:21:09 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 9ABCE100EBB96;
	Mon, 13 Sep 2021 06:21:07 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 65652100EBB98
	for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 06:21:05 -0700 (PDT)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3330C40289
	for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 13:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631539264;
	bh=vC5ZeeYLEo1QgnDozyJaTYMB8bYZWzk5ZY30xgpVgcM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=NxX+W5q53mrv7BPf8fvhZP5qOOJVjz3Wz9gK16ncuOso7L44VDHCJf0DySMSRR2Xe
	 wAJKoHZCyNFwJdQqRegd6j9Yp0p1FsCOrqmUHuEvcsc2V/O0KNmKnP9gPMTpYqpraS
	 LIhpMMCdxh9xsPZ6QoFfKQLcnFAYuI+svYJBZ0QImfsl3kJxufz7F3Nt5aVywavsYc
	 uVytcCuV9dHurAy1TmeW9nN9tNqcKfoY811qfz803MdSt1rA+dTrEsgYnMYoFxl+Qa
	 8m1KMYG4QP79+VlSLqn/M5f38evu+Ss2gogjQ4h06HTWmMGvUtdNohmXdeMJqmyjjd
	 VdNrJda/oL6IQ==
Received: by mail-wr1-f70.google.com with SMTP id u30-20020adfa19e000000b00159aba4fe42so2659192wru.9
        for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 06:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vC5ZeeYLEo1QgnDozyJaTYMB8bYZWzk5ZY30xgpVgcM=;
        b=Qca/M7wYb1U8sfDSHeg0KO/mCFcOyMRG87Q1NtgYNkqsL5qcEappTvSElN7390npmc
         YtPTKMeGK1N2B55QwD0fjSuW0KegtqDdqNaAW5bHfQRSGo7EDNB3xYxm72odO5HitZJ6
         L36GY5uGcqHX+4/zF7S5R+DgVSQKKH1G92301H55fSs9VWS6KGjbfUwPacd8VmI3Ot/S
         eM47Cx2BlhyBnnX+1dgfwZbTMOnSXJYGzK4nL1RUBdDbMUEQ5LDI6JFuMzHQfLxOz8J0
         PjSuTC6Rxj1lP9KJzZY2vYGZfYPrC9WsT3Nc9bRWFXbOaF/fv3ZkFTo3RRxfUSp/He8+
         /3kA==
X-Gm-Message-State: AOAM532oRVjxM8QPRyIklA4fu8awd2N+aClOln0FAyMf0n2OE3H+G6/A
	bgu3rExOW58nvjZxg2sxCQfika0AHeIxolIgdFR5Vk6l/cHoCQU5q3EtShVz0vxxa1HHGPagIoG
	WmE6ZgWZb26JOFIx3ry4hVMC17qzQslhy+w==
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr11405615wmj.144.1631539263848;
        Mon, 13 Sep 2021 06:21:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/izsu1khftAkG5C5T0/hXLkw7auLof1x9kSlmEPTvEP1I+LgccfCmnvu7rQjvYP7wlALVsg==
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr11405588wmj.144.1631539263665;
        Mon, 13 Sep 2021 06:21:03 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id n3sm7195888wmi.0.2021.09.13.06.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:21:03 -0700 (PDT)
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
Date: Mon, 13 Sep 2021 15:20:32 +0200
Message-Id: <20210913132035.242870-13-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
References: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: BAJDSHCIXDXKMCKUNYLHCA24YXSG3PZN
X-Message-ID-Hash: BAJDSHCIXDXKMCKUNYLHCA24YXSG3PZN
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 12/15] nfc: trf7970a: drop unneeded debug prints
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/BAJDSHCIXDXKMCKUNYLHCA24YXSG3PZN/>
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
