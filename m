Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6C43DFD25
	for <lists+linux-nfc@lfdr.de>; Wed,  4 Aug 2021 10:43:18 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id B1E40100EB825;
	Wed,  4 Aug 2021 01:43:15 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id D1475100EBB7F
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 01:43:13 -0700 (PDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id AF0C83F10B
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 08:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1628066592;
	bh=437JVB8OHmg4PQpI3VUPckalE/lTx2W5dV0qEcohHP4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=glY/rVwrNi4Z3pk0GNztqvfMVfjAbRojy8RAnpx+dxu4PWqBt5MQuMLMOpE3FJ5ps
	 GvcWIJYihNdr8cff9Spi2sw+oMgybpb7z4QIsqNTXu4jekTWPfGXFtfael/Lnuv+dx
	 pkvEl6DDbxusL2/U4zYB0l/zEPZbG53+id9VRPf2PdGcAhSb0rAQsQujT+ANKuWR1Q
	 NnXUO9GDs6Om0Tu1A112OnCm8N8LEf2G2JSB6QOGNFAa+fCrwWZpjtWVbHdx+LN4qL
	 5LA/lA6vGHy51GHo3zA0lN68YkJOCzxuW8RH2WhmLEJOvxDO0gtRgaNNeDZaNQOVb3
	 yROQjDt7hwwJw==
Received: by mail-ed1-f72.google.com with SMTP id s10-20020a05640217cab02903bddc3e8fb3so948914edy.0
        for <linux-nfc@lists.01.org>; Wed, 04 Aug 2021 01:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=437JVB8OHmg4PQpI3VUPckalE/lTx2W5dV0qEcohHP4=;
        b=qITSZrQAWH/2Bb4oZaH0FOJOB5S+irSY6it32MgR++683+EqKq7y1Yrgxuxtz+qTu2
         ltIhobnHn1uNtMgSMrRPUJqPblgIuR4b2K0jcVqvCfhXxcgYtzmxiK5IDfGg33DWfr5p
         jkyk+3eiMWKVKl2BJDp6P8J3BQJ4Jct6aq2sjHaQLXird0PDVZgC3nGOiQgvZVgaX3u/
         v0ltG6379nrt8W4YlYy+v0Hz5Y2OzGYHeZmuZx6qUg3n7SGjA8r3CXIvkQ96GiXvRpPQ
         gDDEUHqJN4prv92Z93B6srScZ+3dwYfIL3U33jzXVZ68I6+JYZBVmQb/ptH/CmZwF7cT
         REfQ==
X-Gm-Message-State: AOAM531HcXBpLhIvk3L9mlJcfnW46V+MaCpzIyh2j3TExTlzkMqilrbx
	ucJkFV0vfcbzyaK3rRzNehyppoFbWv6+Sh4cPfBAu06CfryCrReP9sKHNMZO17wClYWoOQorpq+
	fLAMkV1Czt4Ct0MvLcjMg7y5ilWxn/4G3GQ==
X-Received: by 2002:a17:906:1691:: with SMTP id s17mr24774925ejd.297.1628066592180;
        Wed, 04 Aug 2021 01:43:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7lGGP49pTnxSFxobNP/fFW2nStbknxjts9pumUdpHVLHVOJN1h7Y0qxGgaJmLN2jtd5Am7Q==
X-Received: by 2002:a17:906:1691:: with SMTP id s17mr24774919ejd.297.1628066592064;
        Wed, 04 Aug 2021 01:43:12 -0700 (PDT)
Received: from localhost.localdomain ([86.32.43.172])
        by smtp.gmail.com with ESMTPSA id lw22sm459968ejb.74.2021.08.04.01.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 01:43:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed,  4 Aug 2021 10:42:14 +0200
Message-Id: <20210804084218.14677-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
References: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: ORGIIOTMGC3YX6NFGL2A2UJ2QPBWXULT
X-Message-ID-Hash: ORGIIOTMGC3YX6NFGL2A2UJ2QPBWXULT
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 07/11] ci: run unit tests
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ORGIIOTMGC3YX6NFGL2A2UJ2QPBWXULT/>
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
 .github/workflows/ci.yml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index c8e3fb8fb10b..e8f507a128e0 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -256,6 +256,17 @@ jobs:
     - name: Compile
       run: make -j$(nproc)
 
+    - name: Run unit tests
+      id: unit_tests
+      run: |
+        make check
+      if: ${{ (matrix.env['ARCH'] == 'x86-64') || (matrix.env['ARCH'] == 'i386') }}
+
+    - name: Get unit tests logs
+      run: cat test-suite.log
+      if: ${{ always() && ((steps.unit_tests.outcome == 'failure') ||
+                           (steps.unit_tests.outcome == 'success')) }}
+
     - name: Check final binary
       run: |
         file src/neard
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
