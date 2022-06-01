Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C85953A4AE
	for <lists+linux-nfc@lfdr.de>; Wed,  1 Jun 2022 14:16:53 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 16F1B100EBB97;
	Wed,  1 Jun 2022 05:16:50 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN> 
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B3AA5100EBB94
	for <linux-nfc@lists.01.org>; Wed,  1 Jun 2022 05:16:47 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id jx22so3308561ejb.12
        for <linux-nfc@lists.01.org>; Wed, 01 Jun 2022 05:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jGHsmoEGs1YcLx746B4x1wjMz+Zlwyazt35/LAVEprc=;
        b=C/SOI37/fvg0u0KX3OdBH01KN8yx0KaASMRV23K2khdqGs2NHtGlCIBuAjx0LaBfrp
         BJU2+ghB5MvSpUpKTsFbEXG+mMTf1ZakSdPtJQUvixqe79BGe96AhokGAKMuP+kDzemT
         xgLNT4uLDtSYEeW+XVl66vGPWGv0lHkXfJ3wJBzkDPOdQNVZ25qX5EMSGSs/Bz9u3IXf
         EmMGQjQYMHSP91b0Op7M7GD/wbbX+SolZRIfy58OEwjM9T7zrbjKd02yDhArTEHXII7w
         HMuY8nr628sKO60DL32sCuv6trx4awrlJWTPj5C1tc3QsdqzD1QoVUFWtYkPKz8tdOqp
         IG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jGHsmoEGs1YcLx746B4x1wjMz+Zlwyazt35/LAVEprc=;
        b=7diHQXtb8lDrN3ZvylGpLMbMlmnOoyn4RO6NsdwNaF+W31wuc1Hf19o2sZdUSr4vTG
         nx3XDOYnD4xNfnz/y9nf+ECrgXRSk6fV9BJD0EySafc3RZzJ2cP/IPgTAx1fk0zA2us/
         hLKaA5lWNAMwCRt07Epg5MSC7eZvzNa3+vvudRR/obwPQWYm4T10r0Q/hGvccuvz4cy3
         dzp4LCOQcN7YQ4TSCIhPqvHPhDBgdZo79h7q4Dowv4weOs/PZYtahhPj0wlJzR4yAJ5W
         jH8q2hGrivdcl3/QpEnkVmTpzp7TNTaz/Bt5Z5SfCk/EUOFd7pBKPmUeX9PxhAdMLZod
         8dNQ==
X-Gm-Message-State: AOAM530Q3yBxa0QM6KXf0GusfXAFpkIdWf289Ipg4L5zaVNR7gcQIUKy
	Wri8U8C+VcA4os7SngBAiWLmI8O6P1EF9qvd
X-Google-Smtp-Source: ABdhPJxTMsR2+eZ9xgbXPmPnF0EO1QUXXvEj2Tpue64B7M4OGJ4E31qiijTO03NeC/HIshbxXzYqiA==
X-Received: by 2002:a17:907:7ea5:b0:6ff:1a57:28de with SMTP id qb37-20020a1709077ea500b006ff1a5728demr28004381ejc.60.1654085805086;
        Wed, 01 Jun 2022 05:16:45 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id w24-20020a17090633d800b006febc1e9fc8sm655673eja.47.2022.06.01.05.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 05:16:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-nfc@lists.01.org
Date: Wed,  1 Jun 2022 14:16:34 +0200
Message-Id: <20220601121634.192225-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Message-ID-Hash: VZG74EXAG3WYQRTU3FPKUSQ7UVJ7LIKH
X-Message-ID-Hash: VZG74EXAG3WYQRTU3FPKUSQ7UVJ7LIKH
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH] ci: build on newest Ubuntu Jammy Jellyfish (22.04)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/VZG74EXAG3WYQRTU3FPKUSQ7UVJ7LIKH/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add building under CI on Ubuntu Jammy Jellyfish (22.04).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .github/workflows/ci.yml | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 1759d6571e74..2adf6f102d36 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -34,6 +34,7 @@ jobs:
           - fedora:latest
           - fedora:35
           - fedora:34
+          - ubuntu:jammy
           - ubuntu:impish
           - ubuntu:hirsute
           - ubuntu:focal
@@ -177,6 +178,20 @@ jobs:
             variant: sanitizers
 
           # Ubuntu 32-bit builds
+          - container: "ubuntu:jammy"
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: maintainer
+            variant: i386
+
+          - container: "ubuntu:jammy"
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: no-maintainer
+            variant: i386
+
           - container: "ubuntu:impish"
             arch: i386
             compiler: gcc -m32
@@ -220,6 +235,12 @@ jobs:
             variant: i386
 
           # Ubuntu GCC sanitizer builds
+          - container: "ubuntu:jammy"
+            arch: x86-64
+            compiler: gcc
+            mode: maintainer
+            variant: sanitizers
+
           - container: "ubuntu:impish"
             arch: x86-64
             compiler: gcc
-- 
2.34.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
