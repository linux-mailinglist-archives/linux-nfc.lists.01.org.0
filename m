Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCA43DFD2A
	for <lists+linux-nfc@lfdr.de>; Wed,  4 Aug 2021 10:43:23 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id DE535100EBB98;
	Wed,  4 Aug 2021 01:43:18 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 25036100EB82E
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 01:43:16 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id E81E83F332
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 08:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1628066594;
	bh=1BZGdLxPfjPxO3pnV5SCU0P4xXKz8ycwLAz9/yVuFUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=hTL8O0U2/B7WLleQWIChbIU1kdv8+ncG8exx9/UndPfJLSJZlJhojEFvuz40Dri/2
	 5uHxAJrH1L5s0zOQ2gbvdl+R24XpNvBjbJ5Zzf502CF1FIrWZElgRMEyBGamLZse35
	 QG5bJdAfJHRpId38bTziatoohpS9RipbQI830BKHJfMhU7rvzZ/hmsxNNRh1w7Vv6o
	 dNq1HxX17aAcOVdQGum9Ms37lRTYJKe94r1QwIank+EdfLkFLRWHOHLOCeskE0kJFx
	 r+5pC2y1UDb2fAOLE7PACt+Y+oJMUNit4A+PhEso1eh+/2HeGE2zXE+IRHVPClQvdJ
	 KErlSKdJv8jHQ==
Received: by mail-ed1-f70.google.com with SMTP id u4-20020a50eac40000b02903bddc52675eso941072edp.4
        for <linux-nfc@lists.01.org>; Wed, 04 Aug 2021 01:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1BZGdLxPfjPxO3pnV5SCU0P4xXKz8ycwLAz9/yVuFUw=;
        b=MlsMK3hGnS29QpQ8wQwMEsCZMU0AzulnbBcVKm9P430wusfTPKjNt/yZwBNKTxNBGY
         m6wppDsq1hyusrjlJchPLI0qTtTvmR5PuHPpP92FkcjGxRHUqBiLsseQKe9GbP7E1/4+
         wM68YzIw168ppMJaX+AYLfTnWBMLa3tT6LCeWE8IKX9XAUVfjPKMamzMa9CVMmWLp8is
         SBQmT/1SzVfGy67WAvP1N+eH2PJNgRojcK+uLN8DZd3suY5ubDI/8kYA9ptnKDnNLC1n
         sk4dtDuFXzKT/kF+scINm+XH+keLeAduNKjWrmLLjnIwMEkwU5HyjOA+xr4jmdHhyCWD
         icoA==
X-Gm-Message-State: AOAM531YkllzVhJKygj3S2gyd1P/sonNxD7CKJhRJKGe08asBoQvRxrR
	ZGTjcBaue7RM+M9zNyZbhMNTa3mt4jBDNWqJY1J+xa6ZSB4PXBQjadqkQouRl/d0DXfzHKnO9lo
	woKZphVlR5AnR2155fVTshhHzE4ceKkG1cg==
X-Received: by 2002:a17:906:f1c4:: with SMTP id gx4mr24888184ejb.410.1628066594516;
        Wed, 04 Aug 2021 01:43:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCAWM5UHMg8NymJVAu03P2w9D8TWfeGYJjIkaMM1cj6GFFaNY9bFLBx/RbCKZzZ/y5Fgwzhw==
X-Received: by 2002:a17:906:f1c4:: with SMTP id gx4mr24888180ejb.410.1628066594407;
        Wed, 04 Aug 2021 01:43:14 -0700 (PDT)
Received: from localhost.localdomain ([86.32.43.172])
        by smtp.gmail.com with ESMTPSA id lw22sm459968ejb.74.2021.08.04.01.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 01:43:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed,  4 Aug 2021 10:42:16 +0200
Message-Id: <20210804084218.14677-10-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
References: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: GWLZUNXZ3FP3LR4XDSXH5HSDUE5JMJML
X-Message-ID-Hash: GWLZUNXZ3FP3LR4XDSXH5HSDUE5JMJML
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 09/11] ci: add CodeQL static analysis
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/GWLZUNXZ3FP3LR4XDSXH5HSDUE5JMJML/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add Github CodeQL static analysis workflow.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/codeql-analysis.yml | 45 +++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 .github/workflows/codeql-analysis.yml

diff --git a/.github/workflows/codeql-analysis.yml b/.github/workflows/codeql-analysis.yml
new file mode 100644
index 000000000000..66ad27d5eca0
--- /dev/null
+++ b/.github/workflows/codeql-analysis.yml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2021 Canonical Ltd.
+# Author: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+#                             <krzk@kernel.org>
+#
+name: "CodeQL"
+on: [push, pull_request]
+
+jobs:
+  analyze:
+    name: Analyze
+    runs-on: ubuntu-latest
+    permissions:
+      actions: read
+      contents: read
+      security-events: write
+
+    strategy:
+      fail-fast: false
+      matrix:
+        language: [ 'cpp', 'python' ]
+
+    steps:
+    - name: Checkout repository
+      uses: actions/checkout@v2
+
+    - name: Initialize CodeQL
+      uses: github/codeql-action/init@v1
+      with:
+        languages: ${{ matrix.language }}
+
+    - name: Install additional packages
+      run: sudo ./ci/ubuntu.sh
+
+    - name: Configure
+      run: ./bootstrap-configure
+
+    - name: Compile
+      run: |
+        make -j$(nproc)
+        make check
+
+    - name: Perform CodeQL Analysis
+      uses: github/codeql-action/analyze@v1
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
