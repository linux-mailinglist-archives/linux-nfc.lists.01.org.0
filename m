Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F05A3C8371
	for <lists+linux-nfc@lfdr.de>; Wed, 14 Jul 2021 13:05:56 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id AF48E100F2270;
	Wed, 14 Jul 2021 04:05:50 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 05F10100F2243
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:49 -0700 (PDT)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id F09AA40596
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 11:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626260747;
	bh=w7bnPaA72vOy3O8KJ4rRFanUcZPfCp5j76DqNtc3sOg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=rnjwsH7BzmRZ0mPxgRlc6/0RlBYluhOpDRbrnCUWh8g7dZmJKH8j+b7ETwGCKcTmS
	 aQJj8XqJAlwUsQOxsEg22fGCgn34VWW7OwGd/RC/7SOyWVljA4qD/0f3xkMZ56Xq2A
	 45f/U1q+e25eAgOptJjOrzM5RgyrGNR2H6qx9dcfEwz7fEL/Tc6Yr6sAuioaWvSSne
	 IvlcqTRzzb89k1EhQ6aAvLfrpGoJfrtVeUQqKuh4kLGGBCOaTpENKSD2iOelz2Qm/v
	 qmgjhT0bJ7htkluuRczydWdLGSXvYvwiPUBooSiwuWsN/nlry242brM91lO6oblcA/
	 a7BAvjnNNTIpg==
Received: by mail-ej1-f71.google.com with SMTP id r10-20020a170906350ab02904f12f4a8c69so649194eja.12
        for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w7bnPaA72vOy3O8KJ4rRFanUcZPfCp5j76DqNtc3sOg=;
        b=TI5aHKLZBOiuZV2UK1U2rdjcmM2MjJANyFzI1hW+562+sRqyCxzlIdErylbAAaZ6ee
         7Hy+Xp6lGLvICtXGAZ+9GMXvUnWZuE326lrXAf4VZFJRB2iSHsoCF05ulY1STC7e2x7/
         XiAQJg2nREHyXcyI6LimLR2usZizDzg8zS5kP2/pXHgXC2jRgnZbAM5ecYlTyTOOD1rM
         JqLDNOeC1U5V4B5HIVFGTOwtg2Lj3qJ+3S+CkwzpdqtCLhr7QQdMjvdTawsE9hqrWXWT
         ZhWLDjAL3E1XW9a6oADqrCpnIKMNCQbyiUDYVtJa2ZYQ7Y+11shH5bne6TLBRUn8vfST
         6NEw==
X-Gm-Message-State: AOAM5308kaCJnFFg3ESylo/nzSz10mHPsL75Tr2T/1M1EeezRhqckwmI
	9xDQ+IO9dgyyGWgnQeRbgqoJISk+YUpLhOaPrGYhtTu0ZKSWaANujl/zVjliEEpv1+8b0NwK9er
	uuJNqU9hn79XLyIRsknT3u+YEGNRQkevEvg==
X-Received: by 2002:a17:906:498b:: with SMTP id p11mr11829663eju.295.1626260747207;
        Wed, 14 Jul 2021 04:05:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7DYI2vDt7+Bq/It4lvZ+q6xWaQvQTtORz2UfvN3lFq1dRhZWBxN19o93xZQMpWp0VA8oE8g==
X-Received: by 2002:a17:906:498b:: with SMTP id p11mr11829646eju.295.1626260747016;
        Wed, 14 Jul 2021 04:05:47 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id qp12sm637689ejb.90.2021.07.14.04.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 04:05:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed, 14 Jul 2021 13:05:18 +0200
Message-Id: <20210714110518.104655-17-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
References: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 3AXSPQ3XNSX4ND4EO4UI74IOIYCSAGOL
X-Message-ID-Hash: 3AXSPQ3XNSX4ND4EO4UI74IOIYCSAGOL
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 16/16] ci: add build with sanitizers (asan, lsan and ubsan)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/3AXSPQ3XNSX4ND4EO4UI74IOIYCSAGOL/>
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
 HACKING                  |  5 ++++-
 ci/debian.sanitizers.sh  | 18 ++++++++++++++++
 ci/ubuntu.sanitizers.sh  |  1 +
 4 files changed, 65 insertions(+), 3 deletions(-)
 create mode 100755 ci/debian.sanitizers.sh
 create mode 120000 ci/ubuntu.sanitizers.sh

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 14cc4306de23..7c2eb3cb13f4 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -66,6 +66,13 @@ jobs:
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
@@ -78,6 +85,13 @@ jobs:
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
@@ -153,6 +167,13 @@ jobs:
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
@@ -165,6 +186,13 @@ jobs:
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
@@ -235,9 +263,14 @@ jobs:
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
@@ -246,7 +279,8 @@ jobs:
             --prefix=/usr \
             --enable-ese \
             --sysconfdir=/etc \
-            --enable-tools
+            --enable-tools \
+            $CONFIGURE_ARGS
         fi
 
     - name: Compile
@@ -277,6 +311,12 @@ jobs:
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
diff --git a/HACKING b/HACKING
index 7326242506a6..40bde2fb3c8b 100644
--- a/HACKING
+++ b/HACKING
@@ -51,8 +51,11 @@ like this:
     # git clone git://git.kernel.org/pub/scm/network/.../neard.git
     # cd neard
 
-  Configure and build
+  Configure (choose only one)
     # ./bootstrap-configure
+    # ./bootstrap-configure --enable-asan --enable-lsan --enable-ubsan
+
+  Build
     # make
 
   Check installation
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
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
