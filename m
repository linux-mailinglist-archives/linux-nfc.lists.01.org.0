Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 783243C3F06
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:21:44 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id A961C100EB32F;
	Sun, 11 Jul 2021 13:21:40 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 19C50100EB855
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:21:38 -0700 (PDT)
Received: from mail-wr1-f71.google.com ([209.85.221.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2fxI-0001cO-Qh
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:21:36 +0000
Received: by mail-wr1-f71.google.com with SMTP id h11-20020adffa8b0000b029013a357d7bdcso5781232wrr.18
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L5sYfQmOQZZK9zZ7L+ADWovIY4knVrPdSm8W055GQiQ=;
        b=aAwhAqERDILH2ic9LdvLdfIWRsTx7/2psMXLK77Acc8/VLy25+CEIN0k5U+BXZ80oA
         e1dGmzBDf8asB9ACMUEiFt7Ue4u7eHVdKcb9L11aMXIX11mzCmiTbYGv1Dzr2zLW2zWr
         lB0up/gimz7qn3RfE7JhmexwoszBbJ6AVaOebRw7PZN7FuFimCMuyRfGhpshi6LfFrbr
         ybjBycRM8JUz+BT+JK36fnLkX3gqJSSuQ2T4+CeBDCPUB+u01+c9YLMwGUOHLEwJXeU/
         awaGxxtaT54fKrOhdirVG0iLOPCnm2r/Em4QOpoZZRFVwPPNEGZelNB6T8LloBRLOEWi
         D5yQ==
X-Gm-Message-State: AOAM533+cL43LM3OpEVtecH5dJ6wj/jnsvqvjhJIY9+TlUtYzBRC+6B8
	6GHvN8i60KxMzmm7N0/VvHWcZPIwh5/6CoIvTfMb+XLSiVaYh6iBvWrog/VUNykjgq1Va1ZUZg6
	Ub48i/c4mRNIA7HHmiAOrRPQZoKf6xkGRYg==
X-Received: by 2002:a5d:4e05:: with SMTP id p5mr27114052wrt.322.1626034896379;
        Sun, 11 Jul 2021 13:21:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyY0qzLgkNDApYLifgf8MhguauBcCLvh9YdR3mJqCGabedLRwFxCKh5+JO4CsMJb0CxwbLCFQ==
X-Received: by 2002:a5d:4e05:: with SMTP id p5mr27114043wrt.322.1626034896277;
        Sun, 11 Jul 2021 13:21:36 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id d14sm1503256wrs.49.2021.07.11.13.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:21:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:20:39 +0200
Message-Id: <20210711202102.18094-12-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: MCWZOACH6W6RO4GVX5FC5Y55DMMNEMZP
X-Message-ID-Hash: MCWZOACH6W6RO4GVX5FC5Y55DMMNEMZP
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 11/34] build: fix setting CFLAGS on dash shell (Alpine Linux)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/MCWZOACH6W6RO4GVX5FC5Y55DMMNEMZP/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Syntax like "CFLAGS+=" does not work on simple shells, e.g. dash from
BusyBox.  This seems to fail to properly configure CFLAGS on Alpine
Linux:

    checking for pkg-config... /usr/bin/pkg-config
    checking pkg-config is at least version 0.9.0... yes
    ./configure: line 3441: CFLAGS+= -Werror -Wextra: not found
    ./configure: line 3442: CFLAGS+= -Wno-unused-parameter: not found
    ./configure: line 3443: CFLAGS+= -Wno-missing-field-initializers: not found
    ./configure: line 3444: CFLAGS+= -Wdeclaration-after-statement: not found
    ./configure: line 3445: CFLAGS+= -Wmissing-declarations: not found
    ./configure: line 3446: CFLAGS+= -Wredundant-decls: not found
    ./configure: line 3447: CFLAGS+= -Wcast-align: not found
    ./configure: line 3448: CFLAGS+= -DG_DISABLE_DEPRECATED: not found
    checking for gcc... gcc

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 acinclude.m4 | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/acinclude.m4 b/acinclude.m4
index fbc7660dfb67..027ed69977db 100644
--- a/acinclude.m4
+++ b/acinclude.m4
@@ -15,13 +15,14 @@ AC_DEFUN([NEARD_COMPILER_FLAGS], [
 		CFLAGS="-Wall -O2 -D_FORTIFY_SOURCE=2"
 	fi
 	if (test "$USE_MAINTAINER_MODE" = "yes"); then
-		CFLAGS+=" -Werror -Wextra"
-		CFLAGS+=" -Wno-unused-parameter"
-		CFLAGS+=" -Wno-missing-field-initializers"
-		CFLAGS+=" -Wdeclaration-after-statement"
-		CFLAGS+=" -Wmissing-declarations"
-		CFLAGS+=" -Wredundant-decls"
-		CFLAGS+=" -Wcast-align"
-		CFLAGS+=" -DG_DISABLE_DEPRECATED"
+		CFLAGS="$CFLAGS -Werror -Wextra"
+		CFLAGS="$CFLAGS -Werror -Wextra"
+		CFLAGS="$CFLAGS -Wno-unused-parameter"
+		CFLAGS="$CFLAGS -Wno-missing-field-initializers"
+		CFLAGS="$CFLAGS -Wdeclaration-after-statement"
+		CFLAGS="$CFLAGS -Wmissing-declarations"
+		CFLAGS="$CFLAGS -Wredundant-decls"
+		CFLAGS="$CFLAGS -Wcast-align"
+		CFLAGS="$CFLAGS -DG_DISABLE_DEPRECATED"
 	fi
 ])
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
