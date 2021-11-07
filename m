Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DE0447483
	for <lists+linux-nfc@lfdr.de>; Sun,  7 Nov 2021 18:26:32 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id B79FB100F47B3;
	Sun,  7 Nov 2021 09:26:28 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 49C76100F47AD
	for <linux-nfc@lists.01.org>; Sun,  7 Nov 2021 09:26:26 -0800 (PST)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C1DA43F1B3
	for <linux-nfc@lists.01.org>; Sun,  7 Nov 2021 17:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1636305984;
	bh=XoNaXdoMELjp7YvRENBwZULqeuXerEmKN1JKrEDAd7w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=EQKRzjyeEAmbfYNSdsseiwQ10BKcF7fux2S89cS4GqXg7yLDkFuhXPHY8j4vH0AUh
	 sIOW447VTtBRCi5imDNQsTw/voblMSLXnzNcpQiLIRlzQzuOlfLcFzn6anCMfzKsIU
	 of4cwnChzUuIQxXuScwnV+w/QjsKc2XEw/HhVul7nxgOABdQ02gfMwOamEJcJfp3zf
	 0CaslsghRPAM0gMfMSszcI2PZMeMbHqZF3at9J0EdvdjvD4Jq8oZokhIrkRS/fBKMP
	 yJwORfzp6lf8ZLfISdQbcuXwWous7vYmJPdWvhMFWD4kj0Tzz0OJ8nE9P4PGbMF6no
	 ktVpaXlBiq8DA==
Received: by mail-lj1-f199.google.com with SMTP id y23-20020a2e3217000000b00218c6ede162so571283ljy.23
        for <linux-nfc@lists.01.org>; Sun, 07 Nov 2021 09:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XoNaXdoMELjp7YvRENBwZULqeuXerEmKN1JKrEDAd7w=;
        b=EVPE2L8Q8obn6qQksEEDB8FzEoLwBICgyHj/oA9ncNdC60kqB5z/sgc2LIVd52+6Gb
         ap4lSjYW9iYv75oHQ6fsuPae81LYSxavIVL1B2rDpGkot+lGO9grXYuAmWuKsumIwE0D
         L/ueosBV4lvLSWmorof0lg3xg3bOXZdpQ93y+Cgi+3O/RtlJKyHM4TXhI69OS1ivBdQg
         al8QOgOBPD9qeWOFKQdb+QXxAkVMRm3QGrhzgMMTZKBxqOTyPz9Lnl64OZbvCcap027A
         KH7YUACE1gGdXPU/gh/TjXbJeJUQxbzsGuFdv0UDkVhZcAj7DaoF45hfpSSmZSRVOFr+
         i5Hw==
X-Gm-Message-State: AOAM532bobH1RJxZmGgAXL8DhwIrjZMiX9xGklpqktjkA7EAdoXrWxCD
	ZAsEcuOn0hHWOqFEvZU1DhwW5+cM/2BFvwy5K6IqunFAMart1XKxJwKzdqh5+AFTYj9JvTz+UKj
	zsu47rOQm1xb5ZvlxiHQ0YCvCXv7OfsRIEg==
X-Received: by 2002:ac2:4e47:: with SMTP id f7mr30652406lfr.248.1636305983827;
        Sun, 07 Nov 2021 09:26:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylHUkwp8uzZL6Ze1fX0OWb0g1tyNb4hfcNZxSiEN0kMeh+zFN0+Wewk6GYFjHyhv37kzk20A==
X-Received: by 2002:ac2:4e47:: with SMTP id f7mr30652394lfr.248.1636305983663;
        Sun, 07 Nov 2021 09:26:23 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id b17sm618433lfv.264.2021.11.07.09.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 09:26:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun,  7 Nov 2021 18:26:17 +0100
Message-Id: <20211107172619.13560-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211107172619.13560-1-krzysztof.kozlowski@canonical.com>
References: <20211107172619.13560-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 6553GMFJBPGBL3JZ4SS55PLRPZGXTXTL
X-Message-ID-Hash: 6553GMFJBPGBL3JZ4SS55PLRPZGXTXTL
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 2/4] ci: add Ubuntu Impish (21.10)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/6553GMFJBPGBL3JZ4SS55PLRPZGXTXTL/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Build on newest Ubuntu 21.10.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 734969325692..5540ad2ebc39 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -31,6 +31,7 @@ jobs:
           - fedora:latest
           - fedora:33
           - fedora:32
+          - ubuntu:impish
           - ubuntu:hirsute
           - ubuntu:focal
           - ubuntu:bionic
@@ -97,6 +98,20 @@ jobs:
             variant: sanitizers
 
           # Ubuntu 32-bit builds
+          - container: "ubuntu:impish"
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: maintainer
+            variant: i386
+
+          - container: "ubuntu:impish"
+            arch: i386
+            compiler: gcc -m32
+            cross_compile: i686-linux-gnu
+            mode: no-maintainer
+            variant: i386
+
           - container: "ubuntu:hirsute"
             arch: i386
             compiler: gcc -m32
@@ -126,6 +141,12 @@ jobs:
             variant: i386
 
           # Ubuntu GCC sanitizer builds
+          - container: "ubuntu:impish"
+            arch: x86-64
+            compiler: gcc
+            mode: maintainer
+            variant: sanitizers
+
           - container: "ubuntu:hirsute"
             arch: x86-64
             compiler: gcc
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
