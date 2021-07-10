Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F543C3261
	for <lists+linux-nfc@lfdr.de>; Sat, 10 Jul 2021 05:39:29 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 129BB100EB857;
	Fri,  9 Jul 2021 20:39:22 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 54EAB100EB826
	for <linux-nfc@lists.01.org>; Fri,  9 Jul 2021 20:39:20 -0700 (PDT)
Received: from mail-wm1-f69.google.com ([209.85.128.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m23pn-0007U8-5F
	for linux-nfc@lists.01.org; Sat, 10 Jul 2021 03:39:19 +0000
Received: by mail-wm1-f69.google.com with SMTP id p6-20020a05600c3586b029020b46124c2eso2508427wmq.1
        for <linux-nfc@lists.01.org>; Fri, 09 Jul 2021 20:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BMyR61I/AXlrVAQ8LV90GWRBXqaXRgaYKXjKVBWCMQw=;
        b=gc1VU5Osq6tMLOmZMTLXzpQ391Ex8a0e2On6ZwLbz5OFIcJr9IS1hf4BvssL+xNAH6
         GFZ6DFdGdsrTTMOyEAH7AqndK7VWX0Ex7jX2QQe3+u3UeahAhIH5Ih0BgDM7tKnJ3mtO
         bSIU+LQ/IAtZXWcZgHmr674liqMkUfOFMaddRHHLUm4T6GFRCKKyGuwVAEqnr2ErNk7M
         bKiUEyLRN5B9muhuJr3tfY0Cwlxrb0EtqW73cHG42vE6CjNWoqe/YI5yVLLmHY+mHp/E
         3xJbbrFn6G1lJxlxHn5sjEzq46YaOJa7X56tnDMDkihyvGVkeHQ/LLAKMn4S12xUaowk
         KvTA==
X-Gm-Message-State: AOAM5321cf7TszjpzJf8XX69obbHJKJwvlwa2q0LaqcIeCJWHExRlKzs
	85pxZRR+2Jk9Pn14V9pkKPdfO2WrzstJmzH76ULNOOLXZvTX1aEDu88RaoE0O5OBOn5S/Y9mgT0
	kQ8b07eUIy7kC71MaTFWoPDsWqClLjD2Kgw==
X-Received: by 2002:a05:600c:22c2:: with SMTP id 2mr1993248wmg.51.1625888358752;
        Fri, 09 Jul 2021 20:39:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOGOby8D6EfPtxqvplKOpU8T4cD7NYXRSu7rb5obBWBdiZkKZTRrbfjnsEevv4QEslWPq5vg==
X-Received: by 2002:a05:600c:22c2:: with SMTP id 2mr1993242wmg.51.1625888358652;
        Fri, 09 Jul 2021 20:39:18 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id a12sm7444346wrh.26.2021.07.09.20.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 20:39:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sat, 10 Jul 2021 05:38:50 +0200
Message-Id: <20210710033859.3989-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
References: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: JLWB36FQ4IRZK4FIPD7737OXLH73J2WE
X-Message-ID-Hash: JLWB36FQ4IRZK4FIPD7737OXLH73J2WE
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 07/16] ci: add SPDX and copyright notes to ci.yml
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/JLWB36FQ4IRZK4FIPD7737OXLH73J2WE/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index fb754ac78038..266b93ff9895 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -1,3 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2021 Canonical Ltd.
+# Author: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+#                             <krzk@kernel.org>
+# Loosely based on https://github.com/linux-test-project/ltp
+#
 name: "CI: docker based builds"
 on: [push, pull_request]
 
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
