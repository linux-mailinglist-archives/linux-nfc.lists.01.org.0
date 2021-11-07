Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5EF447484
	for <lists+linux-nfc@lfdr.de>; Sun,  7 Nov 2021 18:26:33 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id D7877100F47BA;
	Sun,  7 Nov 2021 09:26:30 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 5938E100EB82B
	for <linux-nfc@lists.01.org>; Sun,  7 Nov 2021 09:26:28 -0800 (PST)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B78083F1A4
	for <linux-nfc@lists.01.org>; Sun,  7 Nov 2021 17:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1636305986;
	bh=WKd56Fkd2RTHRoc/D4kKu52NurWjYJRKFatRgtuz+LI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=WHu0aYbWT6J8Jg7Y9X0MZ7y4z5lDVdCe+ICnMDVav6elFagxK9iNLA8aMJHfyM8S8
	 LBdkSBfmqPXcBiucyGRUeIJm9oFzluYOcwuMEmSk1koF6ISz8cOl1x7ILevsvodZj3
	 DbOVWnplrTdyjboI4hMb4AfGAUSCtvECP6XJ3Vd46IhZiluXSFISLF5wXKi9yRhEou
	 AYqds+CSzMGtEUjKW1nQ3ThXKp18rhkuYnUhZiQsg2Lq0l7C81XS/TVHpJHg6JPqKw
	 lbH9MsHQd7biUb/mVyXdeaeCElDSQl30taP96I++OePU95kkrDX6QeyLuUyN831Wiz
	 VR6YtZ+y8DnWw==
Received: by mail-lj1-f199.google.com with SMTP id e13-20020a2e9e0d000000b00216ace8e8e5so4562222ljk.10
        for <linux-nfc@lists.01.org>; Sun, 07 Nov 2021 09:26:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WKd56Fkd2RTHRoc/D4kKu52NurWjYJRKFatRgtuz+LI=;
        b=eh71fh71xcjcugDXMyq1sJVRWF0i2gUBEHwAkRgGAaCquGTNaLFyreJ8DQDU8NvthR
         z/a6/hgccGsR9C+9BhaGlzxzpnwpJ+zWhkqHhwmJp6sbqwkJ8Bys/RxWWEr27/k3P65N
         j594HunWpk2/nmy6H++pUj7/s6Wqfev9DGX8uIHKvjPzakxvkZkZXhKD7cG5biUwd4Q5
         z83ND4LUyG/EciCztImtfCoh5eQFoyWoFRB4H2SQVbXM4YLSN0w7rDsRVxiKLdkCrIuD
         gNLqSBlGrcwoWwm4qGWR5Z2tkQZUuDH5SDH4KsT1+f0zejJaX5tfPzUpGWh+iXNIgtdQ
         HfRg==
X-Gm-Message-State: AOAM533GvD8l3m+Rn5umyMDb2T65lnDd4DWXKScMHqTxNLWwiVGrjK/X
	HWJzXA46mFPFsN0M4XzdQx60m2nn5HmhJNWdtC0Z7i8K6RVyPhCviGaxbpNuHfaM90vi1P62QIu
	qYjt0OYhVAJPFReOwNgJXND18N8wBy8lraA==
X-Received: by 2002:a05:6512:2213:: with SMTP id h19mr65955723lfu.576.1636305985681;
        Sun, 07 Nov 2021 09:26:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwY/V0u32dDsatqpp3WB0Sh0kbtmk1U9MR4BYm7zF1QMBltKR2kgiviyhnM7Qz5K79M75Ky/g==
X-Received: by 2002:a05:6512:2213:: with SMTP id h19mr65955713lfu.576.1636305985535;
        Sun, 07 Nov 2021 09:26:25 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id b17sm618433lfv.264.2021.11.07.09.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 09:26:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun,  7 Nov 2021 18:26:19 +0100
Message-Id: <20211107172619.13560-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211107172619.13560-1-krzysztof.kozlowski@canonical.com>
References: <20211107172619.13560-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: H4NDX5SM6Y3MLK35ZZFDWG5CYNHAEEUU
X-Message-ID-Hash: H4NDX5SM6Y3MLK35ZZFDWG5CYNHAEEUU
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 4/4] ci: add Debian Testing for i386 and cross compile
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/H4NDX5SM6Y3MLK35ZZFDWG5CYNHAEEUU/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Build also Debian Testing on i386 and cross compile configurations.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 42 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index aed8c089351d..2e1ad40debb9 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -44,6 +44,20 @@ jobs:
         variant: [""]
         include:
           # Debian 32-bit builds
+          - container: "debian:testing"
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: maintainer
+            variant: i386
+
+          - container: "debian:testing"
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: no-maintainer
+            variant: i386
+
           - container: "debian:stable"
             arch: i386
             compiler: gcc -m32
@@ -87,6 +101,34 @@ jobs:
             variant: i386
 
           # Debian cross compilation builds
+          - container: "debian:testing"
+            arch: armel
+            compiler: arm-linux-gnueabi-gcc
+            cross_compile: arm-linux-gnueabi
+            mode: maintainer
+            variant: cross-compile
+
+          - container: "debian:testing"
+            arch: arm64
+            compiler: aarch64-linux-gnu-gcc
+            cross_compile: aarch64-linux-gnu
+            mode: maintainer
+            variant: cross-compile
+
+          - container: "debian:testing"
+            arch: ppc64el
+            compiler: powerpc64le-linux-gnu-gcc
+            cross_compile: powerpc64le-linux-gnu
+            mode: maintainer
+            variant: cross-compile
+
+          - container: "debian:testing"
+            arch: s390x
+            compiler: s390x-linux-gnu-gcc
+            cross_compile: s390x-linux-gnu
+            mode: maintainer
+            variant: cross-compile
+
           - container: "debian:stable"
             arch: armel
             compiler: arm-linux-gnueabi-gcc
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
