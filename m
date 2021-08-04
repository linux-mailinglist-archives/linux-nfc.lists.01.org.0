Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A8A3DFD24
	for <lists+linux-nfc@lfdr.de>; Wed,  4 Aug 2021 10:43:17 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id A2C23100EBB7F;
	Wed,  4 Aug 2021 01:43:15 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B8BAD100EBB61
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 01:43:12 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id A87193F328
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 08:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1628066591;
	bh=aYJEky9Y1UKZxfEkwDvzLNfoqSwGPIgYHjHQdzH0Z7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=jtLn+Wsez6R+MmGrTbQwQU2j5IU/GjfZV0WEYjJCeGRbZ6vOb7CzPeHUie6ZgMjGK
	 B3FbjMBAlSISpPIe+xMyC5o/Lv94hNTI7nzBs0V0/ba40Tz+47gu8B7DGdF1fw2N8H
	 ji3p9vEl7cFgB24wqoabTjK/4ogMC7s+mTLOoJ8NRBQ0wIrx3zIJ77ZTikHDitF3Gb
	 nU4K6/IBBk4gKWaEykSRu9Yb+a3h80ro9P5ZRK44+0/i/7mYx9YPX9VICEXL47SBQ8
	 1lF+ItDaDMW/K30YAHyPN/ylhLI+k5imi12KY7FUuJThR0fusPkamYt6BO1KjM21S/
	 Jicl9P6NX/3YQ==
Received: by mail-ed1-f70.google.com with SMTP id n24-20020aa7c7980000b02903bb4e1d45aaso1087523eds.15
        for <linux-nfc@lists.01.org>; Wed, 04 Aug 2021 01:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aYJEky9Y1UKZxfEkwDvzLNfoqSwGPIgYHjHQdzH0Z7Q=;
        b=FE7p3OYTE8HtSSPo8TIIE6IO+GFd+FIlVo+H/GNd3SsKue+6iiyxhoGGTtgNryDvLp
         uPCCSFVTAk/MQlwlJxcrHqcBAgXOrKaQsJlMgHspZ8VFKxaK0SJMpTg/K2fveAiFTQMe
         N2JxFv2ZahN+eJ6gUHDzZRnZ91/GiQmgeW914sU5BLXoVI/JOqwrMVGjPt4q6tj14WQ4
         KhwMiN2sUdZ0GaPkRZZ6qFzNCKsOHqIyv8Flrr+oYUF0Kc4oOf22NbtZswvVk1TtAh+E
         HBqw30sEK5FToPYLaXrOJ1ZHMaXGzEqNtlC1XeXPHke7U35hhqDhCyK8Gp/iCNwIW4gs
         qvHg==
X-Gm-Message-State: AOAM532G7/zyyDI65kz0TUPk/jo7M2iFuTZGvHdj/mtyIyZZUTRUHjMI
	fRRocy/HkfUshNq0HHrD2g31DSpS3777XEPpXvs2EjAt7b9+G0iL5TWkt8hzgXn8BicecB/wtGU
	NF02P3LFB59A08hhTeHarml0dxYQosP9Rpg==
X-Received: by 2002:a17:906:1412:: with SMTP id p18mr24407168ejc.545.1628066591160;
        Wed, 04 Aug 2021 01:43:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXg3SSwzSGFPWCUmmNAHtcBHaFu4LOwUtj84Cy3/yt6pkJxBKz7O1Rd4B6yaRDTIEfzhQl7Q==
X-Received: by 2002:a17:906:1412:: with SMTP id p18mr24407159ejc.545.1628066590973;
        Wed, 04 Aug 2021 01:43:10 -0700 (PDT)
Received: from localhost.localdomain ([86.32.43.172])
        by smtp.gmail.com with ESMTPSA id lw22sm459968ejb.74.2021.08.04.01.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 01:43:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed,  4 Aug 2021 10:42:13 +0200
Message-Id: <20210804084218.14677-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
References: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: TQBCA6PT5VNMIZ74I65F2TTJINXIFQOY
X-Message-ID-Hash: TQBCA6PT5VNMIZ74I65F2TTJINXIFQOY
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 06/11] ci: add more build configurations (Fedora, Alpine, Debian, cross-compile, i386)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/TQBCA6PT5VNMIZ74I65F2TTJINXIFQOY/>
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
 ci/alpine.sh               |  35 ++++++++
 ci/debian.cross-compile.sh |  41 ++++++++++
 ci/debian.i386.sh          |  32 ++++++++
 ci/debian.sh               |  13 +--
 ci/fedora.sh               |  33 ++++++++
 ci/ubuntu.cross-compile.sh |   1 +
 ci/ubuntu.i386.sh          |   1 +
 8 files changed, 309 insertions(+), 7 deletions(-)
 create mode 100755 ci/alpine.sh
 create mode 100755 ci/debian.cross-compile.sh
 create mode 100755 ci/debian.i386.sh
 create mode 100755 ci/fedora.sh
 create mode 120000 ci/ubuntu.cross-compile.sh
 create mode 120000 ci/ubuntu.i386.sh

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 389c47dcd781..c8e3fb8fb10b 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -20,9 +20,140 @@ jobs:
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
+          - container: "ubuntu:hirsute"
+            env:
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
           - container: "ubuntu:hirsute"
             env:
+              ARCH: x86-64
               CC: gcc
               MODE: maintainer
 
@@ -34,37 +165,44 @@ jobs:
 
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
 
@@ -118,8 +256,26 @@ jobs:
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
index 000000000000..81b5c72a392e
--- /dev/null
+++ b/ci/alpine.sh
@@ -0,0 +1,35 @@
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
+	autoconf-archive \
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
index 000000000000..8d4c5bb38cfd
--- /dev/null
+++ b/ci/debian.cross-compile.sh
@@ -0,0 +1,41 @@
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
+	autoconf-archive \
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
index 000000000000..8d154412e3b7
--- /dev/null
+++ b/ci/debian.i386.sh
@@ -0,0 +1,32 @@
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
+	autoconf-archive \
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
index 8cc4d307cccf..962e554304ee 100755
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
@@ -36,3 +37,5 @@ apt install -y --no-install-recommends \
 	libtool \
 	make \
 	$PKGS_CC
+
+echo "Install finished: $0"
diff --git a/ci/fedora.sh b/ci/fedora.sh
new file mode 100755
index 000000000000..c5a67d237e91
--- /dev/null
+++ b/ci/fedora.sh
@@ -0,0 +1,33 @@
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
+	autoconf-archive \
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
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
