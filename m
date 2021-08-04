Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 244C53DFD27
	for <lists+linux-nfc@lfdr.de>; Wed,  4 Aug 2021 10:43:23 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 12182100EBB96;
	Wed,  4 Aug 2021 01:43:20 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 4D949100EB829
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 01:43:18 -0700 (PDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 21E903F328
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 08:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1628066597;
	bh=uH+2W24yG3WCvwHGC+mtPONeDoxLN8X3D/lcAF7OvG8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=haFvVnHma/3GGrbzHNEszQMI/xgETWzKrgXqDd6ZbqPwrUEWWLZUFznh1Y88qh0lv
	 tvrrw1CyNA4tzH4iVrGPjI1FDkbpVRrvfkSRf1aebJWZ331J4BmUvr6pqk8Tuq8NT8
	 pPhErexqd7RnrWblCLe3+fGJuB1AWlVx5CJlvcZRRAQsE6qvZ804UwlyAkUoG7z1KO
	 Kee3Sc5ZWHflXjqEWBDM4MG0ALxKwFh1UFjS0LNdv6U+YeoyCEkhWVF+hoR83W1h+x
	 WRjN+INHK5EbJPO0wDyVWll7vCyuz2Z0p0/we6fj5az8lX4eNXvf2vwYEbtMgPdPZp
	 z4APIz/AWhkUg==
Received: by mail-ed1-f71.google.com with SMTP id s10-20020a05640217cab02903bddc3e8fb3so948976edy.0
        for <linux-nfc@lists.01.org>; Wed, 04 Aug 2021 01:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uH+2W24yG3WCvwHGC+mtPONeDoxLN8X3D/lcAF7OvG8=;
        b=ESwl9TAmBEBogvt3mGg9qJPGH8Iz0rn9bTGMiLCnHknqsq+Ly3I0Yy9tggxqpZXw+O
         FY5/A17u0zqY/OwNAXNWRVGAOXwKYXyvf2eyOW+eFw7rAD3+2+hWY1JSLFlvyi9WqRxa
         +QIHSByP905US4lr2FD+g0pNuFh2ZvlqiBKU8IN76jmEpdpOURsk7b25s16vopHmLVkn
         cXp3Jihrc6prvI9ASNUmJNrUUTAlNu7PIMUHvKBd2EYx6AY4IysbQLkgtQt0jORkvWkP
         Shn2XXTAu7MwBkNGJF1TXT4o0gr5SwVIh6kyvglsBtvH9pg2y0yC5cICtRgiCvWl1A8B
         yeJw==
X-Gm-Message-State: AOAM533/UPP1yMx6lqFezaZJCVCn8KIOwQTrASdrqG6dEekBTAHzjkBj
	fjRy0UxrBKvDAiNsTnyjKgrCzl4w/h2ROxDRdzJhGHAhepf+eDyCPKnaHaa4dwgKRIkVdR3aRx2
	jqBPTGPCZtOr3de5kK3T+8fqb35AVAtX/6Q==
X-Received: by 2002:a50:d6cf:: with SMTP id l15mr21998682edj.319.1628066596668;
        Wed, 04 Aug 2021 01:43:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJLg/t6IRoKyjbXBvGUEmJ+z2wuJ3q5aLg5Oq0fUI6Yhrk4cEbPmpdNUy0f5Mj5oN2CFx0Pg==
X-Received: by 2002:a50:d6cf:: with SMTP id l15mr21998665edj.319.1628066596471;
        Wed, 04 Aug 2021 01:43:16 -0700 (PDT)
Received: from localhost.localdomain ([86.32.43.172])
        by smtp.gmail.com with ESMTPSA id lw22sm459968ejb.74.2021.08.04.01.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 01:43:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed,  4 Aug 2021 10:42:18 +0200
Message-Id: <20210804084218.14677-12-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
References: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 5KP65VYEL4IADOP6HISODYY37XYYSMXR
X-Message-ID-Hash: 5KP65VYEL4IADOP6HISODYY37XYYSMXR
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 11/11] ci: use matrix instead of duplicating each build configuration
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/5KP65VYEL4IADOP6HISODYY37XYYSMXR/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use matrix to list all typical configurations which allows easily to
build different distros with clang and maintainer mode.  This extends
the number of jobs considerably but makes the entire CI YAML file
smaller and easier to understand.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 295 ++++++++++++++-------------------------
 ci/alpine.sh             |   9 +-
 2 files changed, 114 insertions(+), 190 deletions(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index d4ddcdd3f8f4..6a4eeedf3d66 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -19,229 +19,141 @@ jobs:
     strategy:
       fail-fast: false
       matrix:
+        arch: [x86-64]
+        compiler: [gcc, clang]
+        container:
+          - alpine:latest
+          - debian:testing
+          - debian:stable
+          - fedora:latest
+          - ubuntu:hirsute
+          - ubuntu:focal
+          - ubuntu:bionic
+          - ubuntu:xenial
+        cross_compile: [""]
+        mode: [maintainer, no-maintainer]
+        variant: [""]
         include:
-          # Debian builds
-          # 32bit build
+          # Debian 32-bit builds
           - container: "debian:stable"
-            env:
-              ARCH: i386
-              CC: gcc -m32
-              CROSS_COMPILE: i686-linux-gnu
-              VARIANT: i386
-              MODE: maintainer
-
-          # Debian cross compilation builds
-          - container: "debian:stable"
-            env:
-              ARCH: armel
-              CC: arm-linux-gnueabi-gcc
-              CROSS_COMPILE: arm-linux-gnueabi
-              VARIANT: cross-compile
-              MODE: maintainer
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: maintainer
+            variant: i386
 
           - container: "debian:stable"
-            env:
-              ARCH: arm64
-              CC: aarch64-linux-gnu-gcc
-              CROSS_COMPILE: aarch64-linux-gnu
-              VARIANT: cross-compile
-              MODE: maintainer
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: no-maintainer
+            variant: i386
 
+          # Debian cross compilation builds
           - container: "debian:stable"
-            env:
-              ARCH: ppc64el
-              CC: powerpc64le-linux-gnu-gcc
-              CROSS_COMPILE: powerpc64le-linux-gnu
-              VARIANT: cross-compile
-              MODE: maintainer
+            arch: armel
+            compiler: arm-linux-gnueabi-gcc
+            cross_compile: arm-linux-gnueabi
+            mode: maintainer
+            variant: cross-compile
 
           - container: "debian:stable"
-            env:
-              ARCH: s390x
-              CC: s390x-linux-gnu-gcc
-              CROSS_COMPILE: s390x-linux-gnu
-              VARIANT: cross-compile
-              MODE: maintainer
+            arch: arm64
+            compiler: aarch64-linux-gnu-gcc
+            cross_compile: aarch64-linux-gnu
+            mode: maintainer
+            variant: cross-compile
 
-          # Debian gcc
           - container: "debian:stable"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: maintainer
+            arch: ppc64el
+            compiler: powerpc64le-linux-gnu-gcc
+            cross_compile: powerpc64le-linux-gnu
+            mode: maintainer
+            variant: cross-compile
 
           - container: "debian:stable"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              VARIANT: sanitizers
-              MODE: maintainer
+            arch: s390x
+            compiler: s390x-linux-gnu-gcc
+            cross_compile: s390x-linux-gnu
+            mode: maintainer
+            variant: cross-compile
 
+          # Debian GCC sanitizer builds
           - container: "debian:stable"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: no-maintainer
+            arch: x86-64
+            compiler: gcc
+            mode: maintainer
+            variant: sanitizers
 
           - container: "debian:testing"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: maintainer
-
-          - container: "debian:testing"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              VARIANT: sanitizers
-              MODE: maintainer
-
-          - container: "debian:testing"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: no-maintainer
-
-          # Debian clang
-          - container: "debian:stable"
-            env:
-              ARCH: x86-64
-              CC: clang
-              MODE: maintainer
-
-          - container: "debian:stable"
-            env:
-              ARCH: x86-64
-              CC: clang
-              MODE: no-maintainer
-
-          - container: "debian:testing"
-            env:
-              ARCH: x86-64
-              CC: clang
-              MODE: maintainer
-
-          # musl (native)
-          - container: "alpine:latest"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: maintainer
-
-          # Fedora
-          - container: "fedora:latest"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: maintainer
-
-          - container: "fedora:latest"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: no-maintainer
-
-          - container: "fedora:latest"
-            env:
-              ARCH: x86-64
-              CC: clang
-              MODE: maintainer
-
-          # Ubuntu 32bit builds: gcc and clang
-          - container: "ubuntu:hirsute"
-            env:
-              ARCH: i386
-              CC: gcc -m32
-              CROSS_COMPILE: i686-linux-gnu
-              VARIANT: i386
-              MODE: maintainer
-
-          - container: "ubuntu:focal"
-            env:
-              ARCH: i386
-              CC: gcc -m32
-              CROSS_COMPILE: i686-linux-gnu
-              VARIANT: i386
-              MODE: maintainer
-
-          # Ubuntu x86-64 gcc
-          - container: "ubuntu:hirsute"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: maintainer
+            arch: x86-64
+            compiler: gcc
+            mode: maintainer
+            variant: sanitizers
 
+          # Ubuntu 32-bit builds
           - container: "ubuntu:hirsute"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              VARIANT: sanitizers
-              MODE: maintainer
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: maintainer
+            variant: i386
 
           - container: "ubuntu:hirsute"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: no-maintainer
-
-          - container: "ubuntu:focal"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: maintainer
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: no-maintainer
+            variant: i386
 
           - container: "ubuntu:focal"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              VARIANT: sanitizers
-              MODE: maintainer
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: maintainer
+            variant: i386
 
           - container: "ubuntu:focal"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: no-maintainer
-
-          - container: "ubuntu:bionic"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: maintainer
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: no-maintainer
+            variant: i386
 
-          - container: "ubuntu:xenial"
-            env:
-              ARCH: x86-64
-              CC: gcc
-              MODE: maintainer
-
-          # Ubuntu x86-64 clang
+          # Ubuntu GCC sanitizer builds
           - container: "ubuntu:hirsute"
-            env:
-              ARCH: x86-64
-              CC: clang
-              MODE: maintainer
-
-          - container: "ubuntu:focal"
-            env:
-              ARCH: x86-64
-              CC: clang
-              MODE: maintainer
+            arch: x86-64
+            compiler: gcc
+            mode: maintainer
+            variant: sanitizers
 
           - container: "ubuntu:focal"
-            env:
-              ARCH: x86-64
-              CC: clang
-              MODE: no-maintainer
+            arch: x86-64
+            compiler: gcc
+            mode: maintainer
+            variant: sanitizers
 
     container:
       image: ${{ matrix.container }}
-      env: ${{ matrix.env }}
+      env:
+        ARCH: ${{ matrix.arch }}
+        CC: ${{ matrix.compiler }}
+        CROSS_COMPILE: ${{ matrix.cross_compile }}
+        MODE: ${{ matrix.mode }}
+        VARIANT: ${{ matrix.variant }}
 
     steps:
     - name: Show OS
       run: cat /etc/os-release
 
+    - name: Show env (matrix settings)
+      run: |
+        echo "ARCH: $ARCH"
+        echo "CC: $CC"
+        echo "CROSS_COMPILE: $CROSS_COMPILE"
+        echo "MODE: $MODE"
+        echo "VARIANT: $VARIANT"
+
     - name: Git checkout
       uses: actions/checkout@v2
 
@@ -272,11 +184,16 @@ jobs:
         if [ "$VARIANT" = "sanitizers" ]; then
           CONFIGURE_ARGS="--enable-asan --enable-lsan --enable-ubsan --enable-pie"
         fi
+        CONFIGURE_CROSS=""
+        if [ "$CROSS_COMPILE" ]; then
+          CONFIGURE_CROSS="--host=${CROSS_COMPILE}"
+        fi
         if [ "$MODE" = "maintainer" ]; then
           ./bootstrap-configure \
             --disable-silent-rules \
             $CONFIGURE_ARGS
         else
+          CONFIGURE_ARGS="$CONFIGURE_ARGS $CONFIGURE_CROSS"
           ./bootstrap && \
             ./configure \
             --disable-systemd \
@@ -300,7 +217,7 @@ jobs:
       id: unit_tests
       run: |
         make check
-      if: ${{ (matrix.env['ARCH'] == 'x86-64') || (matrix.env['ARCH'] == 'i386') }}
+      if: ${{ (matrix.arch == 'x86-64') || (matrix.arch == 'i386') }}
 
     - name: Get unit tests logs
       run: cat test-suite.log
@@ -335,4 +252,4 @@ jobs:
       run: make distcheck
       # distcheck runs unit tests so no point for cross compile
       # TODO: figure out how to re-configure during distcheck with --host for i386 (DISTCHECK_CONFIGURE_FLAGS)
-      if: ${{ (matrix.env['ARCH'] == 'x86-64')}}
+      if: ${{ (matrix.arch == 'x86-64')}}
diff --git a/ci/alpine.sh b/ci/alpine.sh
index 81b5c72a392e..56449dd7c969 100755
--- a/ci/alpine.sh
+++ b/ci/alpine.sh
@@ -12,13 +12,20 @@ set -ex
 apk update
 
 PKGS_CC="gcc"
+case $CC in
+	clang*)
+		# On Alpine v3.14 clang fails without gcc:
+		# cannot find crtbeginS.o: No such file or directory
+		PKGS_CC="clang gcc"
+	;;
+esac
 
 # gzip: for distcheck
 apk add \
 	autoconf \
 	autoconf-archive \
 	automake \
-	gcc \
+	binutils \
 	gzip \
 	dbus-dev \
 	glib-dev \
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
