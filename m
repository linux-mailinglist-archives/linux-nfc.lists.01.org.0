Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1881A3C3F27
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:25:05 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id D7047100EB338;
	Sun, 11 Jul 2021 13:25:03 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 364AE100EB337
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:25:01 -0700 (PDT)
Received: from mail-wr1-f72.google.com ([209.85.221.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2g0Z-0001xF-Sn
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:24:59 +0000
Received: by mail-wr1-f72.google.com with SMTP id r18-20020adfce920000b029013bbfb19640so4601515wrn.17
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o+0JsZkcZ6je4k+kt/7PMOYwvUi2agQ2fL4tG+LwqR4=;
        b=jqdw2VStS52ERqOJERRC/wkR95J6V748oXX3BEHhzDrWpuSLXnosqgrgsWIYhuXcK5
         neefChi2aPoJ35Ov4wLgMQm8079/tTQ0V3NlvLuZXDA8h+sQJ5gZ8tKKIULuoZdGja7L
         hl1bOp//3wAbAYTSP5S0xlhpUOoQuObg01wG4detov4oLAgZo8sFGTeQ0Uvg/9pVDY7B
         cY4Dx+q7HSgw+mcm0SyWjQTDsbC9r6azi3q1QYwIH0YkFbQtYd/vNvJ9KCrHMfo1VsVz
         bHoI7dgQbDZMGq+mNYalWiP29iF5VS12hXobnVW2eEIzqpqnN4NTEBu2pDS/EFM1poiR
         ouvA==
X-Gm-Message-State: AOAM533aTeazfkX7Fq8O9x6xa0lEF5zpHDDKe5e2/TocC5Bg8yW9CSUr
	28Pthcv8Q3jaOte9aAmgg48PSLSrnZURbrXo5b5ndY5GEwI+v7V6LQN9DAZWID+E5QCBgYziJiH
	fSxdoStqjJAD9ZQtw4hGAmMrsg+Dq7p0jJQ==
X-Received: by 2002:a05:600c:1992:: with SMTP id t18mr10841220wmq.165.1626035099490;
        Sun, 11 Jul 2021 13:24:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmv4bJAHUXTySxrB2xiK2GuYoBKBJyNawUKPKcEIMQmpyuT/3hrsmIY83JqoJsfbItpYyEEg==
X-Received: by 2002:a05:600c:1992:: with SMTP id t18mr10841215wmq.165.1626035099368;
        Sun, 11 Jul 2021 13:24:59 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id n12sm12501575wmq.5.2021.07.11.13.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:24:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:23:50 +0200
Message-Id: <20210711202351.18363-21-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: GGPKKOGCPAHMGBHIF3EI4FSRRU3SKN6B
X-Message-ID-Hash: GGPKKOGCPAHMGBHIF3EI4FSRRU3SKN6B
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 33/34] build: enable -Wshadow and -Wformat-signedness compiler warnings
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/GGPKKOGCPAHMGBHIF3EI4FSRRU3SKN6B/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Enable code quality warnings - shadowing variables and using wrong
signed data in formats (leading to conversions).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 accflags.m4 | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/accflags.m4 b/accflags.m4
index b1bb1500324f..e4df62c13cf3 100644
--- a/accflags.m4
+++ b/accflags.m4
@@ -22,7 +22,10 @@ AC_DEFUN([NEARD_COMPILER_FLAGS], [
 		AX_CHECK_COMPILE_FLAG([-Wmissing-prototypes], [CFLAGS="$CFLAGS -Wmissing-prototypes"])
 		AX_CHECK_COMPILE_FLAG([-Wjump-misses-init], [CFLAGS="$CFLAGS -Wjump-misses-init"])
 		AX_CHECK_COMPILE_FLAG([-Wpointer-arith], [CFLAGS="$CFLAGS -Wpointer-arith"])
+		AX_CHECK_COMPILE_FLAG([-Wshadow], [CFLAGS="$CFLAGS -Wshadow"])
 
+		# GCC v5.0
+		AX_CHECK_COMPILE_FLAG([-Wformat-signedness], [CFLAGS="$CFLAGS -Wformat-signedness"])
 		# GCC v6.0
 		AX_CHECK_COMPILE_FLAG([-Wnull-dereference], [CFLAGS="$CFLAGS -Wnull-dereference"])
 		AX_CHECK_COMPILE_FLAG([-Wduplicated-cond], [CFLAGS="$CFLAGS -Wduplicated-cond"])
@@ -35,11 +38,7 @@ AC_DEFUN([NEARD_COMPILER_FLAGS], [
 	fi
 	if (test "$USE_MAINTAINER_MODE" = "pedantic"); then
 		AX_CHECK_COMPILE_FLAG([-Wstrict-overflow=3], [CFLAGS="$CFLAGS -Wstrict-overflow=3"])
-		AX_CHECK_COMPILE_FLAG([-Wshadow], [CFLAGS="$CFLAGS -Wshadow"])
 		AX_CHECK_COMPILE_FLAG([-Wcast-qual], [CFLAGS="$CFLAGS -Wcast-qual"])
 		AX_CHECK_COMPILE_FLAG([-Wunsafe-loop-optimizations], [CFLAGS="$CFLAGS -Wunsafe-loop-optimizations"])
-
-		# GCC v5.0
-		AX_CHECK_COMPILE_FLAG([-Wformat-signedness], [CFLAGS="$CFLAGS -Wformat-signedness"])
 	fi
 ])
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
