Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB5A3C3EFF
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:21:36 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 18A5A100EB842;
	Sun, 11 Jul 2021 13:21:33 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id A2E6D100EB84D
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:21:30 -0700 (PDT)
Received: from mail-wr1-f72.google.com ([209.85.221.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2fxB-0001Yq-9p
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:21:29 +0000
Received: by mail-wr1-f72.google.com with SMTP id g4-20020a5d64e40000b029013398ce8904so6166285wri.16
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RTLKEZVF9alveoBn5ZhT7uWoYhibUTxv16kxPYYD9SY=;
        b=b3IFLuUOMenlKyQyYTt2brEUgg/AkoEhB/zYvimswIfFZxmdLjlfJLSGwmrgQMbqCg
         86DRHcOIxTFt6T4NMMK0EwzxE85HICib699tgv0DQpW/FQsgcqsZ5Nl1JqDaKpT5Bl9V
         0Y8DM8yETvjSN4i6Grogilgf2fm61biw3TtCF8DnHOs2ls6qG23lAQPsJ5Sxr/9U12en
         DxvtgTpnvoSTOFT5MYKP5sCXpPcQDtEw4bYmHavD6TlB8+Pr1onWV4WOfa1dQ648DI+e
         t2RSg3lVoV6jqe4ncZJx3aNVOadeH9K0aqjOg6e6RhS8/XEpsxZ7BmJtT58tK9Brv/IQ
         WCgw==
X-Gm-Message-State: AOAM530vrNtQxL2ZHeM2m924LG3gDvccTxQ5h4spB26PBPZBay1Z+UJ+
	euu8tvAi/QDTY4ENR8sbNBbeLJX4uhM+L+ViHRVWhTbwZfAikVxTIZXxCIrnjgdNnnRGsU0mLYy
	GipBih8q9Emyv3P0rHjjLKL9mVapXCpjxAw==
X-Received: by 2002:a05:600c:4e86:: with SMTP id f6mr10783070wmq.149.1626034888784;
        Sun, 11 Jul 2021 13:21:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIwCJ+5u6w+0euJJDB3nCyyBXYvXFl0OKXhKq9D4ZBVkx1aO2PYc2oxNOC5OvQED8Kxvgq/w==
X-Received: by 2002:a05:600c:4e86:: with SMTP id f6mr10783049wmq.149.1626034888549;
        Sun, 11 Jul 2021 13:21:28 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id d14sm1503256wrs.49.2021.07.11.13.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:21:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:20:32 +0200
Message-Id: <20210711202102.18094-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: UR4PRUFMJJSJX7WEMYTMR6734RG27LP7
X-Message-ID-Hash: UR4PRUFMJJSJX7WEMYTMR6734RG27LP7
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 04/34] ci: add more build configurations (Fedora, Alpine, Debian, cross-compile, i386)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/UR4PRUFMJJSJX7WEMYTMR6734RG27LP7/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The installation scripts were based on LTP project.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml   | 160 ++++++++++++++++++++++++++++++++++++-
 ci/alpine.sh               |  34 ++++++++
 ci/debian.cross-compile.sh |  40 ++++++++++
 ci/debian.i386.sh          |  31 +++++++
 ci/debian.sh               |  13 +--
 ci/fedora.sh               |  32 ++++++++
 ci/ubuntu.cross-compile.sh |   1 +
 ci/ubuntu.i386.sh          |   1 +
 8 files changed, 305 insertions(+), 7 deletions(-)
 create mode 100755 ci/alpine.sh
 create mode 100755 ci/debian.cross-compile.sh
 create mode 100755 ci/debian.i386.sh
 create mode 100755 ci/fedora.sh
 create mode 120000 ci/ubuntu.cross-compile.sh
 create mode 120000 ci/ubuntu.i386.sh

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 85821ee6617c..8160aada2042 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -16,45 +16,183 @@ jobs:
       fail-fast: false
       matrix:
         include:
-          # Ubuntu gcc
+          # Debian builds
+          # 32bit build
+          - container: "debian:stable"
+            env:
+              ARCH: i386
+              CC: gcc -m32
+              CROSS_COMPILE: i686-linux-gnu
+              VARIANT: i386
+              MODE: maintainer
+
+          # Debian cross compilation builds
+          - container: "debian:stable"
+            env:
+              ARCH: armel
+              CC: arm-linux-gnueabi-gcc
+              CROSS_COMPILE: arm-linux-gnueabi
+              VARIANT: cross-compile
+              MODE: maintainer
+
+          - container: "debian:stable"
+            env:
+              ARCH: arm64
+              CC: aarch64-linux-gnu-gcc
+              CROSS_COMPILE: aarch64-linux-gnu
+              VARIANT: cross-compile
+              MODE: maintainer
+
+          - container: "debian:stable"
+            env:
+              ARCH: ppc64el
+              CC: powerpc64le-linux-gnu-gcc
+              CROSS_COMPILE: powerpc64le-linux-gnu
+              VARIANT: cross-compile
+              MODE: maintainer
+
+          - container: "debian:stable"
+            env:
+              ARCH: s390x
+              CC: s390x-linux-gnu-gcc
+              CROSS_COMPILE: s390x-linux-gnu
+              VARIANT: cross-compile
+              MODE: maintainer
+
+          # Debian gcc
+          - container: "debian:stable"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              MODE: maintainer
+
+          - container: "debian:stable"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              MODE: no-maintainer
+
+          - container: "debian:testing"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              MODE: maintainer
+
+          - container: "debian:testing"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              MODE: no-maintainer
+
+          # Debian clang
+          - container: "debian:stable"
+            env:
+              ARCH: x86-64
+              CC: clang
+              MODE: maintainer
+
+          - container: "debian:stable"
+            env:
+              ARCH: x86-64
+              CC: clang
+              MODE: no-maintainer
+
+          - container: "debian:testing"
+            env:
+              ARCH: x86-64
+              CC: clang
+              MODE: maintainer
+
+          # musl (native)
+          - container: "alpine:latest"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              MODE: maintainer
+
+          # Fedora
+          - container: "fedora:latest"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              MODE: maintainer
+
+          - container: "fedora:latest"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              MODE: no-maintainer
+
+          - container: "fedora:latest"
+            env:
+              ARCH: x86-64
+              CC: clang
+              MODE: maintainer
+
+          # Ubuntu 32bit builds: gcc and clang
           - container: "ubuntu:hirsute"
             env:
+              ARCH: i386
+              CC: gcc -m32
+              CROSS_COMPILE: i686-linux-gnu
+              VARIANT: i386
+              MODE: maintainer
+
+          - container: "ubuntu:focal"
+            env:
+              ARCH: i386
+              CC: gcc -m32
+              CROSS_COMPILE: i686-linux-gnu
+              VARIANT: i386
+              MODE: maintainer
+
+          # Ubuntu x86-64 gcc
+          - container: "ubuntu:hirsute"
+            env:
+              ARCH: x86-64
               CC: gcc
               MODE: maintainer
 
           - container: "ubuntu:focal"
             env:
+              ARCH: x86-64
               CC: gcc
               MODE: maintainer
 
           - container: "ubuntu:focal"
             env:
+              ARCH: x86-64
               CC: gcc
               MODE: no-maintainer
 
           - container: "ubuntu:bionic"
             env:
+              ARCH: x86-64
               CC: gcc
               MODE: maintainer
 
           - container: "ubuntu:xenial"
             env:
+              ARCH: x86-64
               CC: gcc
               MODE: maintainer
 
-          # Ubuntu clang
+          # Ubuntu x86-64 clang
           - container: "ubuntu:hirsute"
             env:
+              ARCH: x86-64
               CC: clang
               MODE: maintainer
 
           - container: "ubuntu:focal"
             env:
+              ARCH: x86-64
               CC: clang
               MODE: maintainer
 
           - container: "ubuntu:focal"
             env:
+              ARCH: x86-64
               CC: clang
               MODE: no-maintainer
 
@@ -107,8 +245,26 @@ jobs:
     - name: Compile
       run: make -j$(nproc)
 
+    - name: Check final binary
+      run: |
+        file src/neard
+        ARCH_CHECK="$ARCH"
+        case "$ARCH" in
+          armel) ARCH_CHECK="ARM, EABI";;
+          arm64) ARCH_CHECK="aarch64";;
+          i386) ARCH_CHECK="Intel 80386";;
+          ppc64el) ARCH_CHECK="64-bit PowerPC";;
+          s390x) ARCH_CHECK="IBM S/390";;
+          *) ARCH_CHECK="x86-64";;
+        esac
+        echo "Checking for built matching architecture: $ARCH_CHECK"
+        file src/neard | grep "$ARCH_CHECK"
+
     - name: Install
       run: make install
 
     - name: Distribution check
       run: make distcheck
+      # distcheck runs unit tests so no point for cross compile
+      # TODO: figure out how to re-configure during distcheck with --host for i386 (DISTCHECK_CONFIGURE_FLAGS)
+      if: ${{ (matrix.env['ARCH'] == 'x86-64')}}
diff --git a/ci/alpine.sh b/ci/alpine.sh
new file mode 100755
index 000000000000..006dca22aaf9
--- /dev/null
+++ b/ci/alpine.sh
@@ -0,0 +1,34 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2019-2021 Petr Vorel <petr.vorel@gmail.com>
+# Copyright (c) 2021 Canonical Ltd.
+# Author: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+#                             <krzk@kernel.org>
+#
+
+set -ex
+
+apk update
+
+PKGS_CC="gcc"
+
+# gzip: for distcheck
+apk add \
+	autoconf \
+	automake \
+	gcc \
+	gzip \
+	dbus-dev \
+	glib-dev \
+	libnl3-dev \
+	libtool \
+	make \
+	musl-dev \
+	$PKGS_CC
+
+# Packages needed by CI
+apk add \
+	file
+
+echo "Install finished: $0"
diff --git a/ci/debian.cross-compile.sh b/ci/debian.cross-compile.sh
new file mode 100755
index 000000000000..13d0c5eb1cbd
--- /dev/null
+++ b/ci/debian.cross-compile.sh
@@ -0,0 +1,40 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2018-2020 Petr Vorel <pvorel@suse.cz>
+# Copyright (c) 2021 Canonical Ltd.
+# Author: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+#                             <krzk@kernel.org>
+#
+
+set -ex
+
+if [ -z "$ARCH" ]; then
+	echo "missing \$ARCH!" >&2
+	exit 1
+fi
+
+case "$ARCH" in
+	armel) PKGS_CC="gcc-arm-linux-gnueabi libc6-dev-${ARCH}-cross";;
+	arm64) PKGS_CC="gcc-aarch64-linux-gnu libc6-dev-${ARCH}-cross";;
+	ppc64el) PKGS_CC="gcc-powerpc64le-linux-gnu libc6-dev-${ARCH}-cross";;
+	# TODO: libraries for riscv?
+	#riscv64) PKGS_CC="gcc-riscv64-linux-gnu libc6-dev-${ARCH}-cross";;
+	s390x) PKGS_CC="gcc-${ARCH}-linux-gnu libc6-dev-${ARCH}-cross";;
+	*) echo "unsupported arch: '$ARCH'!" >&2; exit 1;;
+esac
+
+dpkg --add-architecture $ARCH
+apt update
+
+apt install -y --no-install-recommends \
+	autoconf:${ARCH} \
+	automake:${ARCH} \
+	libdbus-1-dev:${ARCH} \
+	libglib2.0-dev:${ARCH} \
+	libnl-3-dev:${ARCH} \
+	libnl-genl-3-dev:${ARCH} \
+	libtool:${ARCH} \
+	$PKGS_CC
+
+echo "Install finished: $0"
diff --git a/ci/debian.i386.sh b/ci/debian.i386.sh
new file mode 100755
index 000000000000..db00cab37ad5
--- /dev/null
+++ b/ci/debian.i386.sh
@@ -0,0 +1,31 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2018-2020 Petr Vorel <pvorel@suse.cz>
+# Copyright (c) 2021 Canonical Ltd.
+# Author: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+#                             <krzk@kernel.org>
+#
+
+set -ex
+
+dpkg --add-architecture i386
+apt update
+
+# gcc-multilib are also needed for clang 32-bit builds
+PKGS_CC="gcc-multilib"
+
+apt install -y --no-install-recommends \
+	linux-libc-dev:i386
+
+apt install -y --no-install-recommends \
+	autoconf:i386 \
+	automake:i386 \
+	libdbus-1-dev:i386 \
+	libglib2.0-dev:i386 \
+	libnl-3-dev:i386 \
+	libnl-genl-3-dev:i386 \
+	libtool:i386 \
+	$PKGS_CC
+
+echo "Install finished: $0"
diff --git a/ci/debian.sh b/ci/debian.sh
index 6f407a8f26fc..dc2beecd8849 100755
--- a/ci/debian.sh
+++ b/ci/debian.sh
@@ -6,7 +6,7 @@
 #                             <krzk@kernel.org>
 #
 
-set -eEx
+set -ex
 
 apt update
 
@@ -20,10 +20,11 @@ tzdata tzdata/Zones/Europe select Berlin
 debconf-set-selections /tmp/tzdata-preseed.txt
 
 PKGS_CC="build-essential"
-if [ "$CC" = "clang" ]; then
-	PKGS_CC="clang"
-fi
-
+case $CC in
+	clang*)
+		PKGS_CC="clang"
+	;;
+esac
 
 apt install -y --no-install-recommends \
 	autoconf \
@@ -35,3 +36,5 @@ apt install -y --no-install-recommends \
 	libtool \
 	make \
 	$PKGS_CC
+
+echo "Install finished: $0"
diff --git a/ci/fedora.sh b/ci/fedora.sh
new file mode 100755
index 000000000000..ea6e8a5f5b16
--- /dev/null
+++ b/ci/fedora.sh
@@ -0,0 +1,32 @@
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
+PKGS_CC="gcc"
+case $CC in
+	clang*)
+		PKGS_CC="clang"
+	;;
+esac
+
+yum -y install \
+	autoconf \
+	automake \
+	dbus-devel \
+	glib2-devel \
+	libnl3-devel \
+	libtool \
+	make \
+	$PKGS_CC
+
+# Packages needed by CI
+yum -y install \
+	file
+
+echo "Install finished: $0"
diff --git a/ci/ubuntu.cross-compile.sh b/ci/ubuntu.cross-compile.sh
new file mode 120000
index 000000000000..18f77ad009bb
--- /dev/null
+++ b/ci/ubuntu.cross-compile.sh
@@ -0,0 +1 @@
+debian.cross-compile.sh
\ No newline at end of file
diff --git a/ci/ubuntu.i386.sh b/ci/ubuntu.i386.sh
new file mode 120000
index 000000000000..813bdf90e6ec
--- /dev/null
+++ b/ci/ubuntu.i386.sh
@@ -0,0 +1 @@
+debian.i386.sh
\ No newline at end of file
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
