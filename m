Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D1C3CD343
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:59 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4C6B0100EAB5E;
	Mon, 19 Jul 2021 04:09:58 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 49DD7100EAB55
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:56 -0700 (PDT)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 5C83440334
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692995;
	bh=o+0JsZkcZ6je4k+kt/7PMOYwvUi2agQ2fL4tG+LwqR4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=RNR+7wkkbgHVu+dPYsL4M1LlA5lWS08C67Z9lsZiwto4b49nW1ciN4Gxan+iAIODF
	 l+4Lm++jp4yrKauAUxyGc7HtnyDY6dM3ZDDV+UMItfPulRjo+nSrqpv3hom/xUTTF9
	 3ut+usiPypS4T0mjyFHLMFP1P9742YJKrppkNzVhYynHQt0kEKbh/cQgeWKZ4MZCNZ
	 GeOr0rpNNmMbez+rlt7Jp6uNiDry6ximxSublbCOwQ71Kdc3VcFdRNZGkDOIxycRqn
	 ck+O+Tw0PAM+RfrmKGp4IF94H5olPaTO289pvBiWPu5037c0io/9ayfax4Tj+cSGk5
	 57nzWRXp6Ru0w==
Received: by mail-lj1-f198.google.com with SMTP id v10-20020a2ea60a0000b029017fd05dc0aaso9303240ljp.1
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o+0JsZkcZ6je4k+kt/7PMOYwvUi2agQ2fL4tG+LwqR4=;
        b=SAebuB2ggz7z9J+18n34TMzq+cCiI6m3jNdZQbbnQ3cIjUSsj5A0ADw1robRmRcakD
         TkRnvOsS15HRQROOmnYmY4OzOr9T57gCTsmDbXvx6JMkCKvh3h1TAf2cWu696jltuhmc
         auZ9IB3UoqJrl/Hbva1wGqkDMPN9P/ErQVIwjsLLiSHY029LJ1mAKWi29wFWviKrZ0GB
         PSMZZ7MNRcz2fLoBScerpW/0fPmb6cgsMRKGgcYcVnsWEl1Jc9scdCNE296WE0Dtzz9I
         jd5KyoljoEFWaks3aMvGIL9IyJL5xDDEtUjl6ikCaD31yxE+yDWFr6gl07gh6n6kCFtI
         KoRw==
X-Gm-Message-State: AOAM5331+41rOQCrgdsJGL+e6GEA9XI8bc3Sjp3DzQPqnWAMp2XQfg+g
	XVYyt8PYJd39/YqGbtBJZR4erN934+PxcqUjO1qzd0kcLOTIYGhB2mrI0fHr8+ammvaTulTecHF
	/ecAN1muLbk1gLaUEXIZD+EycQWgGxldbJg==
X-Received: by 2002:a2e:a23b:: with SMTP id i27mr21334578ljm.176.1626692994650;
        Mon, 19 Jul 2021 04:09:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcsAFXD42E1aycinaOm4jblBbEzH8r1ungo7NAshUjo281WATr3HNPolQrNIONqyHH2ZHvUQ==
X-Received: by 2002:a2e:a23b:: with SMTP id i27mr21334571ljm.176.1626692994511;
        Mon, 19 Jul 2021 04:09:54 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:08:14 +0200
Message-Id: <20210719110819.27340-69-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: IZQ6YXJYKZOW5DGDSFIC3IOU5ZNJUBDO
X-Message-ID-Hash: IZQ6YXJYKZOW5DGDSFIC3IOU5ZNJUBDO
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 68/73] build: enable -Wshadow and -Wformat-signedness compiler warnings
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/IZQ6YXJYKZOW5DGDSFIC3IOU5ZNJUBDO/>
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
