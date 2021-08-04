Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFC63DFD29
	for <lists+linux-nfc@lfdr.de>; Wed,  4 Aug 2021 10:43:23 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id CB85E100EB82F;
	Wed,  4 Aug 2021 01:43:16 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 3F7BD100EBB7F
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 01:43:15 -0700 (PDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 1B7F53F07A
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 08:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1628066594;
	bh=TIkPrIBo7+cbidvUAoI9BkN+mHlNJKBXAFJuTZlva6s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=cOcNaMB3Q1FOquSaOSPrAQJIyqZ1FbhtZ6+ziZwaNQKmLTail+FKBXLdm0buPjodS
	 9EZlBYHKL6YFKrSsbECiLjfrEVeTpZnRFTwRwGsxwk4HXD2Yvho7bPa0b9Nm83hyWG
	 DNhfZD7PGnQZqjESLBEPhGDiaDFn2H9L99CpqP4TiJZsUNbAknfonQkQ1gYCjOAofc
	 OYYZcuePKLcaazLMbtjYGCcz7yhh8HDd6oEx2TLJFKHrykG2ij0xcDyVWKADBQEK7W
	 K7UL1v+BhD8sYh2djqAdGeNuyvOeuJaZdqRNP95WtmBSm59PJA84mmduVZYsjWg2lx
	 zMRnz9gR3vPLA==
Received: by mail-ed1-f69.google.com with SMTP id cm18-20020a0564020c92b02903bc7f21d540so1093305edb.13
        for <linux-nfc@lists.01.org>; Wed, 04 Aug 2021 01:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TIkPrIBo7+cbidvUAoI9BkN+mHlNJKBXAFJuTZlva6s=;
        b=NokKBjU2CfK06bgHaZX3RYMgWiNJB7g6A1W0YR0EHOIUxUHyl3fPWPua/kzvH+JqhZ
         W50n243ST4m7FPnCaVwueUtFwv2sVyzwibLDS2ULsZXaaDBuXD97tsPDIxW1WYRaLFTt
         D5mtgPtwUOKrNLlxq0vLJB+NBthUkA1zaPUpTaz2qMVNgriNai1qjD3VO/IEZx0N58KV
         lrNR5Ejt0Ghcz4Tg1x3Iadsygv679YRPmtbBZh7DCfPYDqoApTNC/Ymh4jxWmYgqA8m2
         /qw+rdEUeYMZsJNviToBbuPEp7/SpfEgzTnOdVLEx9atnO+gMNFLEtGLRKX7IL3+LRwq
         ZZQg==
X-Gm-Message-State: AOAM5326XOO/yybbKOy0XlqhYxkSb6j6xqI6MKwEeWQurRmraJsVKJmy
	uZK7qEaA9HaH2jMzr4FUFaLzyHwXIFTtOckmY+sQEHDJBfCuddFfhUzN/iTJr11GpUtDnVkeBYM
	JnrC2O9NAVQ233eySgu9K0f0ky6cCGmq3TQ==
X-Received: by 2002:a17:906:994b:: with SMTP id zm11mr24322475ejb.6.1628066593185;
        Wed, 04 Aug 2021 01:43:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyR6b3PZE/7sJ6k+DPixtUgURSlcMrNU3RioMUIKtcDckPfSgCqWeEUKEXndrLuQhscktTu/A==
X-Received: by 2002:a17:906:994b:: with SMTP id zm11mr24322467ejb.6.1628066593042;
        Wed, 04 Aug 2021 01:43:13 -0700 (PDT)
Received: from localhost.localdomain ([86.32.43.172])
        by smtp.gmail.com with ESMTPSA id lw22sm459968ejb.74.2021.08.04.01.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 01:43:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed,  4 Aug 2021 10:42:15 +0200
Message-Id: <20210804084218.14677-9-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
References: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: DN4N4DT3DUSCF4RX33OZN67WOT6KFUBM
X-Message-ID-Hash: DN4N4DT3DUSCF4RX33OZN67WOT6KFUBM
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 08/11] ci: add build with sanitizers (asan, lsan and ubsan)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/DN4N4DT3DUSCF4RX33OZN67WOT6KFUBM/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Check the results if sanitizers were correctly linked.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 44 ++++++++++++++++++++++++++++++++++++++--
 ci/debian.sanitizers.sh  | 18 ++++++++++++++++
 ci/ubuntu.sanitizers.sh  |  1 +
 3 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100755 ci/debian.sanitizers.sh
 create mode 120000 ci/ubuntu.sanitizers.sh

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index e8f507a128e0..b6f29cf9ddfb 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -70,6 +70,13 @@ jobs:
               CC: gcc
               MODE: maintainer
 
+          - container: "debian:stable"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              VARIANT: sanitizers
+              MODE: maintainer
+
           - container: "debian:stable"
             env:
               ARCH: x86-64
@@ -82,6 +89,13 @@ jobs:
               CC: gcc
               MODE: maintainer
 
+          - container: "debian:testing"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              VARIANT: sanitizers
+              MODE: maintainer
+
           - container: "debian:testing"
             env:
               ARCH: x86-64
@@ -157,6 +171,13 @@ jobs:
               CC: gcc
               MODE: maintainer
 
+          - container: "ubuntu:hirsute"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              VARIANT: sanitizers
+              MODE: maintainer
+
           - container: "ubuntu:hirsute"
             env:
               ARCH: x86-64
@@ -169,6 +190,13 @@ jobs:
               CC: gcc
               MODE: maintainer
 
+          - container: "ubuntu:focal"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              VARIANT: sanitizers
+              MODE: maintainer
+
           - container: "ubuntu:focal"
             env:
               ARCH: x86-64
@@ -239,9 +267,14 @@ jobs:
     - name: Configure
       run: |
         echo "Bootstraping in mode: $MODE"
+        CONFIGURE_ARGS=""
+        if [ "$VARIANT" = "sanitizers" ]; then
+          CONFIGURE_ARGS="--enable-asan --enable-lsan --enable-ubsan --enable-pie"
+        fi
         if [ "$MODE" = "maintainer" ]; then
           ./bootstrap-configure \
-            --disable-silent-rules
+            --disable-silent-rules \
+            $CONFIGURE_ARGS
         else
           ./bootstrap && \
             ./configure \
@@ -250,7 +283,8 @@ jobs:
             --prefix=/usr \
             --enable-ese \
             --sysconfdir=/etc \
-            --enable-tools
+            --enable-tools \
+            $CONFIGURE_ARGS
         fi
 
     - name: Compile
@@ -281,6 +315,12 @@ jobs:
         esac
         echo "Checking for built matching architecture: $ARCH_CHECK"
         file src/neard | grep "$ARCH_CHECK"
+        if [ "$VARIANT" = "sanitizers" ]; then
+          echo "Checking for linking against sanitizer libraries"
+          ldd src/neard | grep libasan.so
+          # liblsan won't appear if asan is used
+          ldd src/neard | grep libubsan.so
+        fi
 
     - name: Install
       run: make install
diff --git a/ci/debian.sanitizers.sh b/ci/debian.sanitizers.sh
new file mode 100755
index 000000000000..40dc1f44b55a
--- /dev/null
+++ b/ci/debian.sanitizers.sh
@@ -0,0 +1,18 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2021 Canonical Ltd.
+# Author: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+#                             <krzk@kernel.org>
+#
+
+set -ex
+
+apt install -y --no-install-recommends \
+	liblsan0 \
+	libubsan1
+
+apt install -y --no-install-recommends libasan6 || \
+	apt install -y --no-install-recommends libasan5
+
+echo "Install finished: $0"
diff --git a/ci/ubuntu.sanitizers.sh b/ci/ubuntu.sanitizers.sh
new file mode 120000
index 000000000000..53cd9418ed35
--- /dev/null
+++ b/ci/ubuntu.sanitizers.sh
@@ -0,0 +1 @@
+debian.sanitizers.sh
\ No newline at end of file
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
