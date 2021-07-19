Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A163CD345
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:10:02 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 67576100EAB53;
	Mon, 19 Jul 2021 04:10:01 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id EAEF2100EAB62
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:58 -0700 (PDT)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id EC29E40334
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692997;
	bh=Rh/QcZl0YJ3xFLkYpvUV7nz6p1mNkKwNhlIJoaNEb+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=KK2Deghpii4TEfDc0dezM/620XXJ2cPKZgP+b9u6XSVlWq2ywR9URY6Fdg/wNYO1V
	 tgZGnMTSZ9QOa9bKr7f2zZWteH+sezZhzuU78WsyWUzGNta54gx2G7b26qLdqPCKkL
	 FMekKkYNDMKU7UtOO5Q5NDhqJy2AyFeNn5UsdppB5TxsRaqOXv5rmgzzlZMl+ixjLl
	 WcHT5uUr81bmTOPJkpHYqnVeu4LoV11nMsCgOfU+t4XND+T+fJ4fSnokv9WUgTS19g
	 4qQN7VPJ09Hs6LhVWuOIdK/Pk6v2heAYcC9RHgwcIaVC1GcUE3VjnZclNg2+uKymhI
	 NPy+16oQk9D+Q==
Received: by mail-lj1-f199.google.com with SMTP id 5-20020a05651c12c5b0290193ec0f79ceso5913354lje.20
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rh/QcZl0YJ3xFLkYpvUV7nz6p1mNkKwNhlIJoaNEb+Y=;
        b=VdMrdDGou5iAvP8xn9t7Cvd0ixzkaGKwUK3yqxUxGIgP5cgzcYwYM+C77iMrC7rlMZ
         WGMWhYM2jN3HyM/HrajuwsuG3lKL8ZDxcKr8PVQ1g6sookTxin6TLTby9Mn2s5obJIrd
         jU1X6quIgdwOSW9HrV91fn0s167c/igWu+3pYMGzOQl+9oKimUWKYoddDPDYUNOM4R2p
         mlij1Ui+EVjJzgY5eDE0U2PvFNJEQQi6bKidTEjQ+WfF9/ajuc53V6zqIS+KOjhKQq8D
         iNTfO6bbyee5auZZYsMgsuvKthLjAEPGxe0D2FzEbi8VD80qLKjiyB/GZlUurfJKQmw1
         Jo3w==
X-Gm-Message-State: AOAM533BUWigUaUKkdGpU0sgW4xVvcm61wyCPn1gh+xqsVjFnQ2+BLtJ
	G1McJD3i5oqdjvA09llROon3PyoPDO8cJtBvNPdOSnxFs5MwRuqugwlgB/4QzJf6palX7T1EI/n
	dNgJEOPO3umPUy6uu5XOAUv2Z3lcBbSGeng==
X-Received: by 2002:a2e:82c4:: with SMTP id n4mr21823457ljh.472.1626692997214;
        Mon, 19 Jul 2021 04:09:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHAljkOfehlcHNZez0vh5RNjruOls6tdFQoncmBY8ABbyjMEeGL2lB8qJA4R0lhUPAXdxwSQ==
X-Received: by 2002:a2e:82c4:: with SMTP id n4mr21823432ljh.472.1626692996768;
        Mon, 19 Jul 2021 04:09:56 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:08:16 +0200
Message-Id: <20210719110819.27340-71-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 22D4EG5FJNLL357EF3FPN3UZRSPBAD4F
X-Message-ID-Hash: 22D4EG5FJNLL357EF3FPN3UZRSPBAD4F
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 70/73] build: enable -Wunsafe-loop-optimizations and -Wstrict-overflow=2 warnings
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/22D4EG5FJNLL357EF3FPN3UZRSPBAD4F/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Enable basic overflow in optimization checks (portability related) and
missed loop optimizations.  The latter (-Wunsafe-loop-optimizations)
does not work well with GCC v7.5 so simply skip it there.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 accflags.m4 | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/accflags.m4 b/accflags.m4
index 57cc48beecc2..0030ac339c86 100644
--- a/accflags.m4
+++ b/accflags.m4
@@ -24,6 +24,7 @@ AC_DEFUN([NEARD_COMPILER_FLAGS], [
 		AX_CHECK_COMPILE_FLAG([-Wjump-misses-init], [CFLAGS="$CFLAGS -Wjump-misses-init"])
 		AX_CHECK_COMPILE_FLAG([-Wpointer-arith], [CFLAGS="$CFLAGS -Wpointer-arith"])
 		AX_CHECK_COMPILE_FLAG([-Wshadow], [CFLAGS="$CFLAGS -Wshadow"])
+		AX_CHECK_COMPILE_FLAG([-Wstrict-overflow=2], [CFLAGS="$CFLAGS -Wstrict-overflow=2"])
 
 		# GCC v5.0
 		AX_CHECK_COMPILE_FLAG([-Wformat-signedness], [CFLAGS="$CFLAGS -Wformat-signedness"])
@@ -36,10 +37,16 @@ AC_DEFUN([NEARD_COMPILER_FLAGS], [
 		AX_CHECK_COMPILE_FLAG([-Walloc-zero], [CFLAGS="$CFLAGS -Walloc-zero"])
 		# GCC v8.0
 		AX_CHECK_COMPILE_FLAG([-Wstringop-truncation], [CFLAGS="$CFLAGS -Wstringop-truncation"])
+
+		# GCC v7.5 from Ubuntu Bionic incorrectly assumes several loops can overflow, so enable
+		# -Wunsafe-loop-optimizations only on newer GCC.
+		CC_VERSION=`$CC --version | head -n 1 | sed -e 's/.*\ \(@<:@0-9@:>@\+\.@<:@0-9@:>@\+\.@<:@0-9@:>@\+\)\(-@<:@0-9@:>@\+\)\?$/\1/'`
+		AX_COMPARE_VERSION([$CC_VERSION],[ge],[8.0.0],
+			[AX_CHECK_COMPILE_FLAG([-Wunsafe-loop-optimizations], [CFLAGS="$CFLAGS -Wunsafe-loop-optimizations"])], [])
 	fi
 	if (test "$USE_MAINTAINER_MODE" = "pedantic"); then
-		AX_CHECK_COMPILE_FLAG([-Wstrict-overflow=3], [CFLAGS="$CFLAGS -Wstrict-overflow=3"])
 		AX_CHECK_COMPILE_FLAG([-Wcast-qual], [CFLAGS="$CFLAGS -Wcast-qual"])
-		AX_CHECK_COMPILE_FLAG([-Wunsafe-loop-optimizations], [CFLAGS="$CFLAGS -Wunsafe-loop-optimizations"])
+		# Instead of -Wstrict-overflow=2
+		AX_CHECK_COMPILE_FLAG([-Wstrict-overflow=3], [CFLAGS="$CFLAGS -Wstrict-overflow=3"])
 	fi
 ])
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
