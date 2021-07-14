Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CDF3C8365
	for <lists+linux-nfc@lfdr.de>; Wed, 14 Jul 2021 13:05:41 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id DC714100F2250;
	Wed, 14 Jul 2021 04:05:34 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id A8AED100EB352
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:33 -0700 (PDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 8A66040616
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 11:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626260732;
	bh=Rh/QcZl0YJ3xFLkYpvUV7nz6p1mNkKwNhlIJoaNEb+Y=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=r3mb0XofOvQU+ziEw/zZvH0xaS4NMEWlee+g3k6jMlyocHMlh9jFfH7X7CmuH4vMy
	 P+R0HuxxY4jqfjgtionYq9aOSs57LTeiEN+t6GWypS5cP4Puo6o3sQdAP0/54MYLia
	 Bo8PaAIRqeWCmfTfPm1tfOKNxgVN0rSEQl2DoLyQ8R5c+POo7DwUsIli8N5V9ymYrn
	 FiqlCZSCdQOD7HrXpkuXNeSbEJv4slfhEU81AWW4oJMHrpZdOQ3jq52KnQ08a60kUZ
	 bmLvRVpsL9HILNMoEpgGcG44C2BsW6b+W/MDUvFGbVlTKRdzr1LRGzq4aJhRwhAh0J
	 Q3uHYu8jhsfwg==
Received: by mail-ed1-f71.google.com with SMTP id m21-20020a50ef150000b029039c013d5b80so1063954eds.7
        for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rh/QcZl0YJ3xFLkYpvUV7nz6p1mNkKwNhlIJoaNEb+Y=;
        b=DnIqPijD0w68yMleLWkvX4KSGTsfUdi/DDfcryQcF/V2aRE+yYkmANaZlbdLTAW3AL
         TorbbOpWfTQ2eciLTVxnL9tFK3QZnKKFamW3GpegQtFa3z7glpkscC5eERInO8dX5eGR
         ZAMRCVJD2kyB3TI712QLK6IHasZkxoSfPklwbOumA7S3XZJmoozF+/DCI1n6TMRRSB4P
         G1NsbAOr5oAkUvLMElXSYFWY+OxBSpigTNOGzxCnkbeVa8CRyqHj+g54pjbZQpFh52OA
         gsdCDZv/oppe0C+7yOydPteUcVCOVHl5nuh8Ai7GwyfkztfarC3Fei/HDubDH41urZUW
         b1BQ==
X-Gm-Message-State: AOAM5339cs1y5pArjf83N0U3q0oBcgKfaAB/IsBZls14H1pLD/9d26HH
	Jid3D8/7MyMmsQxUtRy4cR9SfPcJs9jDoY90Lah5wrhybiH/opfvrEx1Q5J36aFijii64VAVsp2
	/PAwqrLfeVBumi+NqcIc6RAeLPc/G7PQaqQ==
X-Received: by 2002:a17:906:60d3:: with SMTP id f19mr11926774ejk.413.1626260731860;
        Wed, 14 Jul 2021 04:05:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoMyS8QqTi8iv7rGpz5EcjhnOMvp578aKM6RnWHNSFgQwgDqq1odNRbHHP09kP2xAZwqSYZQ==
X-Received: by 2002:a17:906:60d3:: with SMTP id f19mr11926765ejk.413.1626260731717;
        Wed, 14 Jul 2021 04:05:31 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id qp12sm637689ejb.90.2021.07.14.04.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 04:05:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed, 14 Jul 2021 13:05:07 +0200
Message-Id: <20210714110518.104655-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
References: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: D4CHPKV6C3QAQK3WKARFQNLPAHAARXEX
X-Message-ID-Hash: D4CHPKV6C3QAQK3WKARFQNLPAHAARXEX
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 05/16] build: enable -Wunsafe-loop-optimizations and -Wstrict-overflow=2 warnings
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/D4CHPKV6C3QAQK3WKARFQNLPAHAARXEX/>
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
