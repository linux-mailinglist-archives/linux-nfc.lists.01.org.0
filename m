Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8BB3C3EFC
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:21:33 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 044FE100EB846;
	Sun, 11 Jul 2021 13:21:30 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 5902A100EBB6A
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:21:28 -0700 (PDT)
Received: from mail-wr1-f71.google.com ([209.85.221.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2fx9-0001Y1-3Q
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:21:27 +0000
Received: by mail-wr1-f71.google.com with SMTP id p4-20020a5d63840000b0290126f2836a61so6174195wru.6
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AM/anVo+rm6X01ChNwtZQlYFrpRUB351+czBkr9bYa0=;
        b=Ohcu4Od2gl6FrCq/YinFytre+U0dsmJSeWt/tk9OjNGuXhh3NMZgeFbwFw4UXaZqz0
         zzgqIPjyTVtXFmwH3uVbExSA0LwLC3fImt467wOjgcz0Z80ojHrZkIekztSBuENTO+wZ
         JAla5ehbeRWkG9pWz7MlDoqfCEvlfm4ftrjhnGsMB1iQteZ2Z0loCbHtqygHBxuVK9Zz
         VjtugWSjQjfgfNQqYeXImynhPIP2JmFVGYY+dhvLZpzejFwYUiDVxexaYp+VERoAh2cz
         hMh12a8lgW3SW4Na5Acq9/HnXFsRIlhBHXSlHeLCgTdmQXp/u+yxips3O9lgnCa7Fymy
         oBpw==
X-Gm-Message-State: AOAM530nj/EhEelENkdHGkSo1xAjH0lj4VFGh3k5ARnEk1myn0xWan5X
	q8HVO2IPRwmiUL7qEA7fAamukfofNfwHOj1HnSkwMI1BvMlOHm3Dk+znX2Z1D99vOCqgrxU7tOh
	6Awoz/fkSrz6rX6vmDK+MFTnSePCvBJK3FQ==
X-Received: by 2002:a1c:4c15:: with SMTP id z21mr15132068wmf.114.1626034886467;
        Sun, 11 Jul 2021 13:21:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVhDsq9zPKkX5d01erJtGai65KiP312315lsKUTmRtxUhEAku+Qxj/CmeWfEjiMCivbeY+pw==
X-Received: by 2002:a1c:4c15:: with SMTP id z21mr15132060wmf.114.1626034886309;
        Sun, 11 Jul 2021 13:21:26 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id d14sm1503256wrs.49.2021.07.11.13.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:21:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:20:30 +0200
Message-Id: <20210711202102.18094-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 6TY5RRJZDBUFZODNS2GUPOEOVGQ3W6TQ
X-Message-ID-Hash: 6TY5RRJZDBUFZODNS2GUPOEOVGQ3W6TQ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 02/34] ci: add building without maintainer options
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/6TY5RRJZDBUFZODNS2GUPOEOVGQ3W6TQ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Check also silent builds.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index fb322381e7f5..ecd0683f6c79 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -20,27 +20,43 @@ jobs:
           - container: "ubuntu:hirsute"
             env:
               CC: gcc
+              MODE: maintainer
 
           - container: "ubuntu:focal"
             env:
               CC: gcc
+              MODE: maintainer
+
+          - container: "ubuntu:focal"
+            env:
+              CC: gcc
+              MODE: no-maintainer
 
           - container: "ubuntu:bionic"
             env:
               CC: gcc
+              MODE: maintainer
 
           - container: "ubuntu:xenial"
             env:
               CC: gcc
+              MODE: maintainer
 
           # Ubuntu clang
           - container: "ubuntu:hirsute"
             env:
               CC: clang
+              MODE: maintainer
 
           - container: "ubuntu:focal"
             env:
               CC: clang
+              MODE: maintainer
+
+          - container: "ubuntu:focal"
+            env:
+              CC: clang
+              MODE: no-maintainer
 
     container:
       image: ${{ matrix.container }}
@@ -72,7 +88,19 @@ jobs:
         cat /proc/cmdline
 
     - name: Configure
-      run: ./bootstrap-configure
+      run: |
+        echo "Bootstraping in mode: $MODE"
+        if [ "$MODE" = "maintainer" ]; then
+          ./bootstrap-configure
+        else
+          ./bootstrap && \
+            ./configure \
+            --disable-systemd \
+            --prefix=/usr \
+            --enable-ese \
+            --sysconfdir=/etc \
+            --enable-tools
+        fi
 
     - name: Compile
       run: make -j$(nproc)
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
