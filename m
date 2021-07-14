Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D9D3C8369
	for <lists+linux-nfc@lfdr.de>; Wed, 14 Jul 2021 13:05:47 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 2DC63100F226E;
	Wed, 14 Jul 2021 04:05:41 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id A87D6100F2262
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:39 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 7BCA64054A
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 11:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626260738;
	bh=j/o1hmO7RiYw4SrYnE9hfPveWI6bzRspyYFKT7+NPmc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=nnnZfAf8VPG2xhjXreeFjJj+u8zu01g07HScLivuaxloOAP1Uxdjk+QKfhNOEEip2
	 /TindPqGZ8P0hc9dM7BKE1xu4T+VaSy12+0SlAGdr8j78JMzJa9XYCUDkuVbrcJOnR
	 adq+h4oosx1ZSkpYK3EPXE28lFp79PYHQeIZTfb/8bNuIK52LxOJvbDI3ybZ+TPDvl
	 lGYC/035KEIyC+xp6R5Y/YDKPeGtKxmvNxTxj2vlyr0Olnc1ALfEoopZHq7Xtf7d7g
	 dL8Rp+ueKODhyZjlVCfjKJU0OPNZtIE0BgtVKZQPCnW/fxMm36upaNM7PN/KoMCpOU
	 LyKGn6QLrYsDg==
Received: by mail-ed1-f70.google.com with SMTP id i19-20020a05640200d3b02903948b71f25cso1066360edu.4
        for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j/o1hmO7RiYw4SrYnE9hfPveWI6bzRspyYFKT7+NPmc=;
        b=D7QqX6eMAByNv58H6tqYeEwzgy9ByCIguODOnBA+q/I1oNynvxRsZwgjXcHKQTZEN/
         tZM4DlF9ySPB+zmtxJ5mG5gomjbvgA3NY0TfHy2DYif1aUIoPKQaBpoHqYsmkFVpdbUB
         KDTI7fyCsvfVs/x6DWshI0wLXd/K9DvZ0++UCU1XBIumg9UYDcj52PjVQTH6Gch3LX89
         F3fMbAy6UsDTbDSjzF1mPVv8TJcyGf3x4IcohwB5h01v6Ioqe9nkBuPmAMJV77EGQHLS
         /+4ikC5bVhbKFxQpcXwgLegaNQjWo3T808r0mB6p66rr0ixBLzauSqzr2Rh/2UGQ5+Hu
         WK/Q==
X-Gm-Message-State: AOAM532j3ocjFq9d+3fCpHOIztM6xkyhl4QK63fZsCdnKukXvu5mmUEE
	dsrntdRRRU/iUzVXGDMwLDXxBaTcDyQ07ym5sxoWt9j5KOL67K5Lu4hKRzWh2vYHSevIVI18xsl
	C+OZPPvvFW573aJ7fMXMQ8iEXZAE/xx0vqw==
X-Received: by 2002:a17:906:3555:: with SMTP id s21mr11493133eja.394.1626260731078;
        Wed, 14 Jul 2021 04:05:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAp3lWrLuw1YDfzSuMXZr7mcOexm6/tg8oaX0ZhpUSLFV43fmfrLoAaLsTGRCPq0GcACzCDg==
X-Received: by 2002:a17:906:3555:: with SMTP id s21mr11493089eja.394.1626260730568;
        Wed, 14 Jul 2021 04:05:30 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id qp12sm637689ejb.90.2021.07.14.04.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 04:05:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed, 14 Jul 2021 13:05:06 +0200
Message-Id: <20210714110518.104655-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
References: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: YT2UYH3BW3HK2CISMXTFNTEO5F3UF5OH
X-Message-ID-Hash: YT2UYH3BW3HK2CISMXTFNTEO5F3UF5OH
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 04/16] build: enable -Wformat=2 warnings
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/YT2UYH3BW3HK2CISMXTFNTEO5F3UF5OH/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The -Wformat=2 compiler warning can detect potentials errors when using
printf-like functions.  It is supported by GCC and clang.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 accflags.m4 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accflags.m4 b/accflags.m4
index e4df62c13cf3..57cc48beecc2 100644
--- a/accflags.m4
+++ b/accflags.m4
@@ -14,6 +14,7 @@ AC_DEFUN([NEARD_COMPILER_FLAGS], [
 		CFLAGS="$CFLAGS -Wmissing-declarations"
 		CFLAGS="$CFLAGS -Wredundant-decls"
 		CFLAGS="$CFLAGS -Wcast-align"
+		CFLAGS="$CFLAGS -Wformat=2"
 		CFLAGS="$CFLAGS -DG_DISABLE_DEPRECATED"
 
 		AX_CHECK_COMPILE_FLAG([-Wdouble-promotion], [CFLAGS="$CFLAGS -Wdouble-promotion"])
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
