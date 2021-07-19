Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C87F3CD341
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:57 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 2000A100EAB4B;
	Mon, 19 Jul 2021 04:09:56 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 7440C100EAB5E
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:53 -0700 (PDT)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 85B2B40624
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692992;
	bh=L5sYfQmOQZZK9zZ7L+ADWovIY4knVrPdSm8W055GQiQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=MJ+UBL62iiE9fCX5GObJjM27yoEJLz8uDiClN6y3+PQPwOHQtpfO7fquv9yrpLwOU
	 Ygl9kHWtphrlXH4e0oipSP91Uq+u/7/YTkfGV+n875195nT7fxJiHSpa64n+T4Jsfu
	 rTTSKkC/+UDynACq78fXQuyGrdRCXErqleS68P4tTNmG74+Dj1/heAWnFkQ/slQkMB
	 dd+yxMdXaBuk2wQ6n9ANKH0elhkYeV8GNQ3ctC8UmZTnYjlyigM9Tto0sbfPYC8tFK
	 tY1rQFGOB8fezS970X0KsniwURVD+fK5yM3JbmF/UpHRPHvoBPMffbm7fxga3dOM9J
	 9afY+pWfoKBaQ==
Received: by mail-lf1-f71.google.com with SMTP id u2-20020ac248a20000b0290384997a48fcso3241460lfg.21
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L5sYfQmOQZZK9zZ7L+ADWovIY4knVrPdSm8W055GQiQ=;
        b=Uhtj1CJQBGDN+0SGPg8C4RxTS0bTO6EwrbD+uZu7bQxXB+zYHUiSAcCzjP/Ip6X0dO
         QCnWPGlp7LPu8BOdTJygkNpSt90x/5VOQc8E9FT42eVMII4+vWHPJUusqNjD8DJXvu4C
         22SlGcLrmKyXPkuoWaf3bDJT3GEqmb+Oawy1WygspNKiUiX+6yegZywJssUIsuZAPJc6
         IIY2uqKzu6K2RCbO+TakA14KZdxB6ote5mI0xeEvJCCR+av7tkHO9DuhcNq4oogx82v5
         xns6Vbq1crnNgJfppTg51cU6Zsj3x9YRGHlIafgsqqtLH0Nci7tdErzXxFz3WHGKtZdd
         u54Q==
X-Gm-Message-State: AOAM531x5L35r0eJ1I6RnltzLqKjjCSRpPYkfN1AlhZIWy049abfILiK
	6EKPao+B1Kyeb1npvKh1qJUfsgIWK/XE82MRQfjLtSXqLbD+z1spQx6CuCoiC5hb07ob+8DOFSY
	sqjQcm2sNkdZUNdKjIOP0hWisOjLGOfXHOw==
X-Received: by 2002:ac2:547b:: with SMTP id e27mr18468748lfn.200.1626692991799;
        Mon, 19 Jul 2021 04:09:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwooJ88k01Fc+pyLrLnFIPtO5hsLQ5EliBrUZfC2WRkms3cERu/bHBf0oUKlIL1Qo8htEKLuw==
X-Received: by 2002:ac2:547b:: with SMTP id e27mr18468739lfn.200.1626692991651;
        Mon, 19 Jul 2021 04:09:51 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:08:12 +0200
Message-Id: <20210719110819.27340-67-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: ZHH4B3XEGE5WCARI3WZGVIWZXZLPGXVF
X-Message-ID-Hash: ZHH4B3XEGE5WCARI3WZGVIWZXZLPGXVF
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 66/73] build: fix setting CFLAGS on dash shell (Alpine Linux)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ZHH4B3XEGE5WCARI3WZGVIWZXZLPGXVF/>
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
