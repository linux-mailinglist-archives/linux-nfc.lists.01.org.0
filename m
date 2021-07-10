Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D46253C3264
	for <lists+linux-nfc@lfdr.de>; Sat, 10 Jul 2021 05:39:32 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4B631100EB84F;
	Fri,  9 Jul 2021 20:39:24 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 71BF4100EB83B
	for <linux-nfc@lists.01.org>; Fri,  9 Jul 2021 20:39:22 -0700 (PDT)
Received: from mail-wr1-f72.google.com ([209.85.221.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m23pp-0007Ui-8Y
	for linux-nfc@lists.01.org; Sat, 10 Jul 2021 03:39:21 +0000
Received: by mail-wr1-f72.google.com with SMTP id g4-20020a5d64e40000b029013398ce8904so3770923wri.16
        for <linux-nfc@lists.01.org>; Fri, 09 Jul 2021 20:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t/+V2+QtpwKa3blFl84kSd+0w6L9btvrGJZpxGTrwSI=;
        b=SvTRTvuMeAuLooqetnLOLdiboe4GEDUASNbuiO+ZozNpyj0IQ7qW28kNnthMgsPLs5
         mnXxzM2jiiLEf1d4uhm/aN+UQgBZ8UTGNLRYPWBIRnOp/aKbqkjm6Tb5KVxCwpw8wDeX
         Gawl7FSLH4oJrY0dpwIvrFA1d9KBTRoj5ll8rvMo7ncAxS1AG089us0ng+3YmTTBo/8J
         BSBDKgJ6ZYjFodLkzJB5AqYC+gLrnQQcPZ5ckhyF7HV7mU/xH++MyD72w2tF0H9tAj+y
         fareaDUA2pDtkjNV5I34sznBOJX5hVM/IiGrMxWzu43LHfiZNHjgdABv9x7bjx7j8v7J
         07Uw==
X-Gm-Message-State: AOAM532P3AazhnTGKA2s912e2Xigg3vH1R/cYAkKPUNXoBV7pB7ikPR5
	y+y3+Js0lY/F3CwukZp5WJBz2LoNrfgmCVoiBOz//Ldvg5SQmhmNlgvKIrMNv8u6wepG8lfiGhx
	RdkzpNulR7VzMJ5K/z6bJydwy1/1dAFEnug==
X-Received: by 2002:a5d:6caf:: with SMTP id a15mr26247312wra.313.1625888360873;
        Fri, 09 Jul 2021 20:39:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGW4eDqlhrqNMg3GLIQcFJ3zuapSCMzcClLKgbPc6bvekSyHqB4Bmq08uqxVIY+2ggr1hucQ==
X-Received: by 2002:a5d:6caf:: with SMTP id a15mr26247302wra.313.1625888360787;
        Fri, 09 Jul 2021 20:39:20 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id a12sm7444346wrh.26.2021.07.09.20.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 20:39:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sat, 10 Jul 2021 05:38:53 +0200
Message-Id: <20210710033859.3989-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
References: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 4PVL3GDNUWY5NAXNKEMMQXKFAVWCLNWC
X-Message-ID-Hash: 4PVL3GDNUWY5NAXNKEMMQXKFAVWCLNWC
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 10/16] ci: no need to print twice compiler version
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/4PVL3GDNUWY5NAXNKEMMQXKFAVWCLNWC/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There is separate step for showing compiler version.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 866fa846c7f8..e746eb67df29 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -60,8 +60,6 @@ jobs:
         lsb_release -a || true
         uname -a
         cat /proc/cmdline
-        gcc --version || true
-        clang --version || true
 
     - name: Configure
       run: ./bootstrap-configure
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
