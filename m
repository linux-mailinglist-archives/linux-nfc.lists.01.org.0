Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA033C3F00
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:21:37 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 368A5100EB858;
	Sun, 11 Jul 2021 13:21:34 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B0815100EB83B
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:21:31 -0700 (PDT)
Received: from mail-wr1-f71.google.com ([209.85.221.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2fxC-0001Zb-DW
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:21:30 +0000
Received: by mail-wr1-f71.google.com with SMTP id h15-20020adffd4f0000b0290137e68ed637so6115152wrs.22
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SArb25whloNBdJWgw1z7OZAbnHCUugxhiEH6Lhl8bZc=;
        b=QuSfdANrZdodGHVfVwLqmibEbb4D5o9BkDAx6LTS8o/232KuIJffbyGLZ1A18ra8BN
         v9rszVMGFzH148xp4sHrs1c/k1QN0lnhDLQf5rPG3oHGhvvFTVML/fgFyzPfLyxgwzFW
         beCQEpY5ZIddXPF3ZQ42JFlPos2/97tl/mVlHgOFS/zRql7yh+diiKTwC5ef/idBYGcX
         KyhW610mXvVw/lcAVtZ/obgi3KcZTj8Lk63lcB1ZDuM3ViU3QHTEjQbZpOFp6Pk+UWuO
         ei4A/8tIhnupGcyHx0RdtNNnCX3DH0+syeA5JVcr4r5IuaMOffoHMTl8kWuS6Dv0DZ08
         katw==
X-Gm-Message-State: AOAM533MyBM/egKSL23+PwfVhE5ExbJ1xneqW1/DoQjCUx8vBfQWv8JG
	jkzaHhUNIoKh+ZFxspOtJnluEfuSKBixBeDGraUjBAALnr7P0dK6NLjF2n6ns8oif2BUwc3mJfY
	hwROpfvoMOdCIpqDxc2K8bmHlli+WmTBVAg==
X-Received: by 2002:a05:600c:2302:: with SMTP id 2mr51711429wmo.188.1626034889826;
        Sun, 11 Jul 2021 13:21:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDe6LdGFLUx33laqj/bmwqVa5A/a+cMz/hOQCE18wIe9UrFC9YuFavuXXMlLYu370O2xAApA==
X-Received: by 2002:a05:600c:2302:: with SMTP id 2mr51711422wmo.188.1626034889664;
        Sun, 11 Jul 2021 13:21:29 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id d14sm1503256wrs.49.2021.07.11.13.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:21:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:20:33 +0200
Message-Id: <20210711202102.18094-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: XMFMPACXODGNCE434NSCPRT6DIYZC2HZ
X-Message-ID-Hash: XMFMPACXODGNCE434NSCPRT6DIYZC2HZ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 05/34] ci: run unit tests
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/XMFMPACXODGNCE434NSCPRT6DIYZC2HZ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Although unit tests are executed as part of distcheck, but add it as a
dedicated step to make it explicit with getting the logs afterwards.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 8160aada2042..7daccd2672fd 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -245,6 +245,23 @@ jobs:
     - name: Compile
       run: make -j$(nproc)
 
+    - name: Run unit tests
+      id: unit_tests
+      run: |
+        make check
+      if: ${{ (matrix.env['ARCH'] == 'x86-64') || (matrix.env['ARCH'] == 'i386') }}
+
+    - name: Get unit tests logs
+      run: |
+        for i in unit/*log
+        do
+          echo "#######################"
+          echo "LOG: $i"
+          cat $i
+        done
+      if: ${{ always() && ((steps.unit_tests.outcome == 'failure') ||
+                           (steps.unit_tests.outcome == 'success')) }}
+
     - name: Check final binary
       run: |
         file src/neard
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
