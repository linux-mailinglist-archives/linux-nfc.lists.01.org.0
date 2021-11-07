Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F4B447481
	for <lists+linux-nfc@lfdr.de>; Sun,  7 Nov 2021 18:26:32 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id CAEE6100F47B7;
	Sun,  7 Nov 2021 09:26:29 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 69C18100EB82B
	for <linux-nfc@lists.01.org>; Sun,  7 Nov 2021 09:26:27 -0800 (PST)
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 150EE3F337
	for <linux-nfc@lists.01.org>; Sun,  7 Nov 2021 17:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1636305986;
	bh=UrbkfvRqmiC9NprGL45Gr1sO117qk5oY3yUU/FEJQ2M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=JhYNMCABjYUncJIzjcrUrnsGtaN5onkRsFEFBO4L6ANtYzruCC6IaMYcLyyHQgw9v
	 xPhfZFj/AtNTuzH9s+on8SSg5kW4lnf9AMVD/VcsE9OW8PMvF6VZxIfdEHUmxDTl3O
	 8aoo2xWrRDuO4Q2859kYQTPL8lkaOnyH/wKn65Uso6eJpqEmZy7P3FTrFLD+UfEsXd
	 8f+BRnt1u7aYCIZyfBOgYwMBtTaYm440V/WY2jbjpENZowq4hiApPe2fq0LtRHCSup
	 cr4q8X1baCaTC2JcFj61XCLr2W6FpVRMbRVs258FsTfKb/jMvFjfZvsbk5qTf3wll4
	 Z40nTF1H4sXsg==
Received: by mail-lj1-f197.google.com with SMTP id f6-20020a2e9e86000000b00211349f9ce3so4549005ljk.3
        for <linux-nfc@lists.01.org>; Sun, 07 Nov 2021 09:26:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UrbkfvRqmiC9NprGL45Gr1sO117qk5oY3yUU/FEJQ2M=;
        b=i8OUsaVG3GEgMZFYr5qvxuiOn7ZeZQ7VLI4/zTsymT6iFO59pG3VbOeGNwOI95ejNV
         lhSLWlnKI3d5PbUee/YoaPBu/jxd0TUqfGMAkBtE3K7HtIfcfd8q+VS2vw8SDJwfHM6x
         SRHeZo4Qg2bmFq2ZxPu0HsNeBo+Hz3FElX5zN+t1XLQqFjvizgbGx9Jptvxpr3L0V6en
         dNCtzrHtHVZaienUJmDN2noC6WgyFOj0is3vNJ/3qzVrK/PzPiu2Sa8aC4VkYIRJdAJK
         vYOJfGghgpWnfzEXBL87ewlXcA1VJW9GSrUXcMbl74UWuei8OxW4SsVWoqZvIAfL8mv/
         /j/A==
X-Gm-Message-State: AOAM531u5BBcdMM1zT+49a3gy8C1Lz0eUfz+wGwBQW1+/yKoSveq7+ap
	joaXETd8nvZgpDqwB2bjSTsUv4Xg8Tt6AElCuaCDMd84z3qBFE4Zz50w9PY4nw0VEXaW4CVRN41
	DxfAnPr2udWWUbBFfK8bTsYMfExm4mnHLog==
X-Received: by 2002:a2e:9b41:: with SMTP id o1mr72079100ljj.499.1636305984925;
        Sun, 07 Nov 2021 09:26:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuQjMT0HhTTWvfalZigS20Ewblb1eAguXwEXPBPKFplRpMXCppj+oAkHjY7auOtPzxWu3URg==
X-Received: by 2002:a2e:9b41:: with SMTP id o1mr72079078ljj.499.1636305984751;
        Sun, 07 Nov 2021 09:26:24 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id b17sm618433lfv.264.2021.11.07.09.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 09:26:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun,  7 Nov 2021 18:26:18 +0100
Message-Id: <20211107172619.13560-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211107172619.13560-1-krzysztof.kozlowski@canonical.com>
References: <20211107172619.13560-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: RBVZXJFMUABHCQNBZ3HRRTSR2WEEJUW7
X-Message-ID-Hash: RBVZXJFMUABHCQNBZ3HRRTSR2WEEJUW7
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 3/4] ci: add Debian Buster and Stretch
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/RBVZXJFMUABHCQNBZ3HRRTSR2WEEJUW7/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add older releases of Debian: Buster and Stretch.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 5540ad2ebc39..aed8c089351d 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -26,6 +26,9 @@ jobs:
           - archlinux:latest
           - debian:testing
           - debian:stable
+          - debian:bullseye
+          - debian:buster
+          - debian:stretch
           # Fails on configure on GCC and clang (process restrictions?)
           # - fedora:rawhide
           - fedora:latest
@@ -55,6 +58,34 @@ jobs:
             mode: no-maintainer
             variant: i386
 
+          - container: "debian:buster"
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: maintainer
+            variant: i386
+
+          - container: "debian:buster"
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: no-maintainer
+            variant: i386
+
+          - container: "debian:stretch"
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: maintainer
+            variant: i386
+
+          - container: "debian:stretch"
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: no-maintainer
+            variant: i386
+
           # Debian cross compilation builds
           - container: "debian:stable"
             arch: armel
@@ -85,13 +116,19 @@ jobs:
             variant: cross-compile
 
           # Debian GCC sanitizer builds
+          - container: "debian:testing"
+            arch: x86-64
+            compiler: gcc
+            mode: maintainer
+            variant: sanitizers
+
           - container: "debian:stable"
             arch: x86-64
             compiler: gcc
             mode: maintainer
             variant: sanitizers
 
-          - container: "debian:testing"
+          - container: "debian:buster"
             arch: x86-64
             compiler: gcc
             mode: maintainer
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
