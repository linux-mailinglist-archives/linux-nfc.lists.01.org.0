Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAAA3DFD1F
	for <lists+linux-nfc@lfdr.de>; Wed,  4 Aug 2021 10:43:12 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4AE45100EBB6C;
	Wed,  4 Aug 2021 01:43:10 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 0766C100EBBAF
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 01:43:07 -0700 (PDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 3D7683F10B
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 08:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1628066586;
	bh=GdZhTiIUkQhJuwNqKA9TDrdQKNG+IKzL2jT4Ec+abWc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=r8i6xLR4mGV9mX4TckzkQMA0dvx8hdNhfJ7K0Ep/UeiT6+ZvkGE7lA5oDE9/6B/Tp
	 MGdgyuy76xWsCEezr69cyJsffMjQ00qOXQxZzqPFkWRaOgMCKAeT5czmVfSKo8dNAS
	 BVThMX0n4+beehyScunTKrA6puM195GRRfVyu1AaZhU72hTT+2jXjrBdF/XPfKhtGe
	 zH4NCpu89lNqxBa29Zze6TopKdHMXQYkKACNgf9H+xFsbbhXUM7wMnGqhdYW6kU9Ds
	 5sGMew/oyJiNmm1n5xuXBXhJArOLNzeRBzQynRAjok4X4RbUlFBVMpXmvjP5eNuQyC
	 ulAR9njOlRdcA==
Received: by mail-ed1-f71.google.com with SMTP id c16-20020aa7d6100000b02903bc4c2a387bso1074330edr.21
        for <linux-nfc@lists.01.org>; Wed, 04 Aug 2021 01:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GdZhTiIUkQhJuwNqKA9TDrdQKNG+IKzL2jT4Ec+abWc=;
        b=XUe4nFc9qh0f7bmw3c0vWuTegtEGMl7hOwh9SnlP6tmZ7MW7v2psxr/dfQP/r5D16y
         GIXPz3waV1fQTApnFKXCTdF7fi8pTE9X5XPNpL9Qo4M2BkAanfky6J+r8U3gQjewd5ch
         8CjLZw2dVO1rbQGP07uxqCWcmFjAhIEiEM6p8CGtrPcEZxjXuQxOisItpi2I4DSNGKfG
         vOSTxTu6BfZoMgBEjZto1wJjeUEcIDx32di/N73gCWAHtm6RCvDhveWi7pCSvT87bVQF
         iEs+msvkJZIjwmVDM7nOy95zFVr7VNZ5jFgXKVDR7X1XqLK2+qZDOQy5ZAfvwAbppAWy
         kJcA==
X-Gm-Message-State: AOAM532RZis5F5dI900/RK7cjZhozon54dqblm0H7uqsW281Jobfd5iI
	qkm+XVXmWAOBmG6X+h8b3+OhGcB9nshcd2Ea/y2lo7J1BCSowG0Pr43HP6+4fCJvvnbX4hqP9Xo
	gAbneWO+WW+1ekt2bPO9vRS5EN+LpHtFDow==
X-Received: by 2002:a17:906:c9cb:: with SMTP id hk11mr24169632ejb.544.1628066585531;
        Wed, 04 Aug 2021 01:43:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFnBf/1sJxMwOQdBXcXWpVKIoAJIAOMwbCv8ldsoxTfjt8iuvytgdMWzC9k2nG6sDD8vIH1A==
X-Received: by 2002:a17:906:c9cb:: with SMTP id hk11mr24169628ejb.544.1628066585388;
        Wed, 04 Aug 2021 01:43:05 -0700 (PDT)
Received: from localhost.localdomain ([86.32.43.172])
        by smtp.gmail.com with ESMTPSA id lw22sm459968ejb.74.2021.08.04.01.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 01:43:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed,  4 Aug 2021 10:42:08 +0200
Message-Id: <20210804084218.14677-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
References: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: XQHXDLUMMCU3IGUL6WXWAP276CHVIVJR
X-Message-ID-Hash: XQHXDLUMMCU3IGUL6WXWAP276CHVIVJR
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 01/11] ci: add GitHub actions for building
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/XQHXDLUMMCU3IGUL6WXWAP276CHVIVJR/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 79 ++++++++++++++++++++++++++++++++++++++++
 ci/debian.sh             | 32 ++++++++++++++++
 ci/ubuntu.sh             |  1 +
 3 files changed, 112 insertions(+)
 create mode 100644 .github/workflows/ci.yml
 create mode 100755 ci/debian.sh
 create mode 120000 ci/ubuntu.sh

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
new file mode 100644
index 000000000000..e48ee0eb6815
--- /dev/null
+++ b/.github/workflows/ci.yml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2021 Canonical Ltd.
+# Author: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+#                             <krzk@kernel.org>
+# Loosely based on https://github.com/linux-test-project/ltp
+#
+name: "Builds"
+on: [push, pull_request]
+
+jobs:
+  job:
+    name: Build
+    runs-on: ubuntu-latest
+    permissions:
+      actions: read
+      contents: read
+
+    strategy:
+      fail-fast: false
+      matrix:
+        include:
+          - container: "ubuntu:hirsute"
+            env:
+              CC: gcc
+
+          - container: "ubuntu:focal"
+            env:
+              CC: gcc
+
+          - container: "ubuntu:bionic"
+            env:
+              CC: gcc
+
+          - container: "ubuntu:xenial"
+            env:
+              CC: gcc
+
+    container:
+      image: ${{ matrix.container }}
+      env: ${{ matrix.env }}
+
+    steps:
+    - name: Show OS
+      run: cat /etc/os-release
+
+    - name: Git checkout
+      uses: actions/checkout@v2
+
+    - name: Install additional packages
+      run: |
+        INSTALL=${{ matrix.container }}
+        INSTALL="${INSTALL%%:*}"
+        INSTALL="${INSTALL%%/*}"
+        ./ci/$INSTALL.sh
+        if [ "$VARIANT" ]; then ./ci/$INSTALL.$VARIANT.sh; fi
+
+    - name: Compiler version
+      run: $CC --version
+
+    - name: Display environment and Linux version
+      run: |
+        test -f /etc/issue && cat /etc/issue
+        lsb_release -a || true
+        uname -a
+        cat /proc/cmdline
+        printenv
+
+    - name: Configure
+      run: ./bootstrap-configure
+
+    - name: Compile
+      run: make -j$(nproc)
+
+    - name: Install
+      run: make install
+
+    - name: Distribution check
+      run: make distcheck
diff --git a/ci/debian.sh b/ci/debian.sh
new file mode 100755
index 000000000000..07b7c9305cdb
--- /dev/null
+++ b/ci/debian.sh
@@ -0,0 +1,32 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2021 Canonical Ltd.
+# Author: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+#                             <krzk@kernel.org>
+#
+
+set -eEx
+
+apt update
+
+# Some distros (e.g. Ubuntu Hirsute) might pull tzdata which asks questions
+export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true
+
+# Choose some random place in Europe
+echo "tzdata tzdata/Areas select Europe
+tzdata tzdata/Zones/Europe select Berlin
+" > /tmp/tzdata-preseed.txt
+debconf-set-selections /tmp/tzdata-preseed.txt
+
+apt install -y --no-install-recommends \
+	autoconf \
+	autoconf-archive \
+	automake \
+	build-essential \
+	libdbus-1-dev \
+	libglib2.0-dev \
+	libnl-3-dev \
+	libnl-genl-3-dev \
+	libtool \
+
diff --git a/ci/ubuntu.sh b/ci/ubuntu.sh
new file mode 120000
index 000000000000..0edcb8b838ca
--- /dev/null
+++ b/ci/ubuntu.sh
@@ -0,0 +1 @@
+debian.sh
\ No newline at end of file
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
