Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C762A3C8368
	for <lists+linux-nfc@lfdr.de>; Wed, 14 Jul 2021 13:05:45 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 209CC100F2262;
	Wed, 14 Jul 2021 04:05:41 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id C723F100EB350
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:38 -0700 (PDT)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 9542E40616
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 11:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626260737;
	bh=vlhToTal4nyPt3TGVt1UrGInfgaUj6zs7k6whUlPfc4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=HY9Ss4TUbqeVI5HS/iY5zbJITvnyLI297oIDl/jMT6jFpZ4uOjumPVBPdKd+rbZBC
	 pRWZrXXwM13gL6GsEmHtOxeS07hxmh7HSlmwT+GIlByQJYwfDeGzgtsCF/8+S9Xe3o
	 HIsY6y2XlhKpvkaqNp5+SDJ2eBPFqVy1Ay6aR9f4+VfF7ReWgyq6ZZURnclrhaIBZZ
	 mkByYZaZGiFdHEJfr2B+QktnVMzY3uasleJvnxW+TccLrjJZwSa9RdpY6n/8RRoG3i
	 HysZ+umN3noz+ewYPdUVmXi73T+SsSFBxuSTe6rNmbwd6+3gyMf7jEbJfNe7mORJVp
	 hczufQtY+c4xg==
Received: by mail-ej1-f71.google.com with SMTP id br1-20020a170906d141b02905119310d7b9so641999ejb.23
        for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vlhToTal4nyPt3TGVt1UrGInfgaUj6zs7k6whUlPfc4=;
        b=UtoXmUKV1rNXx4YzPr1RBQam8EqB6Ga2JXV+6UB0m77S6VoFGYksFfNQLZFcauKmjw
         1k0GBHed9+VyuvD6Y0VNF1tmv4tKMOk7PyFpxxHH7tOA1NvzAAKdtRZkNVuuCQSyr+tE
         gdtUI1utsK2ksryM30eX4pSbjeLlAZ7DeQinEGB4gqQKL6WXN6LLUHi6mgsB7vYX3tEi
         yTcJtwvN0ZxN7s5H2+5T/Rfy2LI8voLKFyTKqWqt0l5c7Zx10YL3lIahbM6lYE6EmkZY
         UQnFmPJIC3L1XiAYHP+9jFNiTcmxhFRyMMU94D7d1LrOEc2TA1xgj0b9vTQd/4/Z+yZu
         PB6A==
X-Gm-Message-State: AOAM530ojFx2WDrwiMl4AQm5kKrxjBGnx+UobaedOflnMAlL8HKBrQyz
	AUzK3YOO6AjVGvDRfaYhl4QfTDDGA2P5Po9+BlqsmMqbONaI/UJ0QGipD8BTyn9zbEGgmtrWTtF
	HG0+O43hSy4see5ob9NBAtMTiBgQiguxKjA==
X-Received: by 2002:a17:906:a0a:: with SMTP id w10mr11640779ejf.416.1626260737147;
        Wed, 14 Jul 2021 04:05:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxl6c5Alb2YlskIPPppWO4VIxtB7shJMXyi1BBhbq7XWgqFPAlWka4iwI9PtOpMUA7MG6rl/Q==
X-Received: by 2002:a17:906:a0a:: with SMTP id w10mr11640758ejf.416.1626260736918;
        Wed, 14 Jul 2021 04:05:36 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id qp12sm637689ejb.90.2021.07.14.04.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 04:05:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed, 14 Jul 2021 13:05:10 +0200
Message-Id: <20210714110518.104655-9-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
References: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: VPXS3LCTOLSDZMBVGZSRHOMZCQXM7OTZ
X-Message-ID-Hash: VPXS3LCTOLSDZMBVGZSRHOMZCQXM7OTZ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 08/16] ci: simplify getting test logs
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/VPXS3LCTOLSDZMBVGZSRHOMZCQXM7OTZ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

make check-TESTS stores the logs in one file, so no need to get them one
by one.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 6ecd38177bde..14cc4306de23 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -259,13 +259,7 @@ jobs:
       if: ${{ (matrix.env['ARCH'] == 'x86-64') || (matrix.env['ARCH'] == 'i386') }}
 
     - name: Get unit tests logs
-      run: |
-        for i in unit/*log
-        do
-          echo "#######################"
-          echo "LOG: $i"
-          cat $i
-        done
+      run: cat test-suite.log
       if: ${{ always() && ((steps.unit_tests.outcome == 'failure') ||
                            (steps.unit_tests.outcome == 'success')) }}
 
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
