Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EA23CD342
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:58 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 36DCD100EAB56;
	Mon, 19 Jul 2021 04:09:57 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id E98D1100F227A
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:54 -0700 (PDT)
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id EB26440624
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692993;
	bh=OHc7UrLCodHsTV6dGY2k9VVgImg0PN9b/+EubUPOIOg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=ZNCyXqMqsvfK8UJTbJ6L2Wi+sN3jgbT0ENL4WZYhsFbSaF1aGdK9ipIv992uYfe40
	 L7ENcsYh1T6ssKCB5l2FuM/L+axkkOhDhOCNc3ejDE1kncxgyoqrQqCpL6lS6dZ+6n
	 sRKqqAssAfKaAtPygpOQm/Yp9ykg8Egan9o8EKXbfanJOuPcLSwWU/yjGrI0FnCTWS
	 RbIpRXxshdJP3YPJZ/MfzZpapVHqq1NmRXlhL5ZBJmCoaAj86uPTjrn8Q75FIqYfPP
	 oD4WcQj95tgy4QkdL/tFgoSf6dgewEA17fU+KxaVQLRRVV3MkKME5VZq9HrWMeupwa
	 4sPLvXHpWq8RQ==
Received: by mail-lj1-f200.google.com with SMTP id q123-20020a2e2a810000b02901990f5ca735so479312ljq.22
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OHc7UrLCodHsTV6dGY2k9VVgImg0PN9b/+EubUPOIOg=;
        b=WQ2igwRXNAVm2iJ9l1VD9vgiM7MYMCayUaSG6r+cOXfsgq9CBhgK1kL7JKhDzlYXIk
         iiErbh1TstFE1UmiVjbysYD1pgqAaoBS6V5JRw6GC/Jjz+yVRE+FdWYFMANYUozdtA7U
         gvVTEH8rb2H4MPxGA66ZnWQuiB1cv8hfC1Gel8e0TvrzABIPNIFwlOdERteKbBZ9wjjg
         NaUvBl46mC8ouQzhgEflv1lV/SMWac7VUhplGpFNCPa2olId6ErFyYusNiQo8VXQUKsg
         Akgk0Ex7gQp14DGn7Go3HEYIZTiaSsl+VX+JChplrkpJEoFMMXdgnrvP1DPrNi66J8eg
         erlg==
X-Gm-Message-State: AOAM531bi6HHHQEOvQTjWziTBYlBn8F/f83Rkfq5w531EMVEKh64NABI
	pjrfD5LoL4kCg79GYPD1yVJmygjgl+NGVgWXVWLTUju1LmY5g0gKij6RrCGfIAfFN4TG+iaQ22Y
	1i7VIW6DZSdD/MJClBjHqnLWaCuLMKAlPwg==
X-Received: by 2002:a05:6512:33d3:: with SMTP id d19mr17924008lfg.114.1626692993200;
        Mon, 19 Jul 2021 04:09:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylcfw8GqV+1vf6EFmhOiMnQP18NrM1VmCQwJOPRWMEn7jNgf/8MRMNhrEn01rSeZ1ckT/2/Q==
X-Received: by 2002:a05:6512:33d3:: with SMTP id d19mr17923996lfg.114.1626692993008;
        Mon, 19 Jul 2021 04:09:53 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:08:13 +0200
Message-Id: <20210719110819.27340-68-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: FTW7UL5WZCJ62DJSKO2GSZATIVWCPDX7
X-Message-ID-Hash: FTW7UL5WZCJ62DJSKO2GSZATIVWCPDX7
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 67/73] build: add more compiler warnings
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/FTW7UL5WZCJ62DJSKO2GSZATIVWCPDX7/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use the AX_CHECK_COMPILE_FLAG() macro from autoconf-archive to check for
support for more compiler warning flags (not enabled via -Wall and
-Wextra) and enable these which pass.

These flags are warning for:
1. Code bugs like dereferencing NULL or truncating string operations
   functions.

2. Minor code quality or portability issues like using undefined
   defines, wrong casts of functions, missing global function
   declarations, skipping variable initializations, duplicated if
   conditions or branches, usage of variable-length arrays.

3. Portability issues like implicit promoting float to double,
   allocating zero bytes or depending of size of void *.

Keep more warnings for later, because the code does not build with them.

The AX_CHECK_COMPILE_FLAG() macro tries to compile C code with given
flag, so move the code from acinclude.m4 (executed early, before AC_LANG
and others) to separate accflags.m4.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 HACKING      |  1 +
 accflags.m4  | 45 +++++++++++++++++++++++++++++++++++++++++++++
 acinclude.m4 | 17 -----------------
 configure.ac |  5 +++--
 4 files changed, 49 insertions(+), 19 deletions(-)
 create mode 100644 accflags.m4

diff --git a/HACKING b/HACKING
index c1eb6d6189a6..7326242506a6 100644
--- a/HACKING
+++ b/HACKING
@@ -7,6 +7,7 @@ Build tools requirements
 
 Required packages and tools:
   autoconf
+  autoconf-archive
   automake
   dbus
   gcc/clang
diff --git a/accflags.m4 b/accflags.m4
new file mode 100644
index 000000000000..b1bb1500324f
--- /dev/null
+++ b/accflags.m4
@@ -0,0 +1,45 @@
+AC_DEFUN([NEARD_COMPILER_FLAGS], [
+	# AX_CHECK_COMPILE_FLAG comes from autoconf-archive
+	AC_REQUIRE([AC_PROG_CC])
+	AC_REQUIRE([AX_CHECK_COMPILE_FLAG])
+
+	if (test "${CFLAGS}" = ""); then
+		CFLAGS="-Wall -O2 -D_FORTIFY_SOURCE=2"
+	fi
+	if (test "$USE_MAINTAINER_MODE" = "yes"); then
+		CFLAGS="$CFLAGS -Werror -Wextra"
+		CFLAGS="$CFLAGS -Wno-unused-parameter"
+		CFLAGS="$CFLAGS -Wno-missing-field-initializers"
+		CFLAGS="$CFLAGS -Wdeclaration-after-statement"
+		CFLAGS="$CFLAGS -Wmissing-declarations"
+		CFLAGS="$CFLAGS -Wredundant-decls"
+		CFLAGS="$CFLAGS -Wcast-align"
+		CFLAGS="$CFLAGS -DG_DISABLE_DEPRECATED"
+
+		AX_CHECK_COMPILE_FLAG([-Wdouble-promotion], [CFLAGS="$CFLAGS -Wdouble-promotion"])
+		AX_CHECK_COMPILE_FLAG([-Wundef], [CFLAGS="$CFLAGS -Wundef"])
+		AX_CHECK_COMPILE_FLAG([-Wbad-function-cast], [CFLAGS="$CFLAGS -Wbad-function-cast"])
+		AX_CHECK_COMPILE_FLAG([-Wmissing-prototypes], [CFLAGS="$CFLAGS -Wmissing-prototypes"])
+		AX_CHECK_COMPILE_FLAG([-Wjump-misses-init], [CFLAGS="$CFLAGS -Wjump-misses-init"])
+		AX_CHECK_COMPILE_FLAG([-Wpointer-arith], [CFLAGS="$CFLAGS -Wpointer-arith"])
+
+		# GCC v6.0
+		AX_CHECK_COMPILE_FLAG([-Wnull-dereference], [CFLAGS="$CFLAGS -Wnull-dereference"])
+		AX_CHECK_COMPILE_FLAG([-Wduplicated-cond], [CFLAGS="$CFLAGS -Wduplicated-cond"])
+		# GCC v7.0
+		AX_CHECK_COMPILE_FLAG([-Wduplicated-branches], [CFLAGS="$CFLAGS -Wduplicated-branches"])
+		AX_CHECK_COMPILE_FLAG([-Wvla-larger-than=1], [CFLAGS="$CFLAGS -Wvla-larger-than=1"])
+		AX_CHECK_COMPILE_FLAG([-Walloc-zero], [CFLAGS="$CFLAGS -Walloc-zero"])
+		# GCC v8.0
+		AX_CHECK_COMPILE_FLAG([-Wstringop-truncation], [CFLAGS="$CFLAGS -Wstringop-truncation"])
+	fi
+	if (test "$USE_MAINTAINER_MODE" = "pedantic"); then
+		AX_CHECK_COMPILE_FLAG([-Wstrict-overflow=3], [CFLAGS="$CFLAGS -Wstrict-overflow=3"])
+		AX_CHECK_COMPILE_FLAG([-Wshadow], [CFLAGS="$CFLAGS -Wshadow"])
+		AX_CHECK_COMPILE_FLAG([-Wcast-qual], [CFLAGS="$CFLAGS -Wcast-qual"])
+		AX_CHECK_COMPILE_FLAG([-Wunsafe-loop-optimizations], [CFLAGS="$CFLAGS -Wunsafe-loop-optimizations"])
+
+		# GCC v5.0
+		AX_CHECK_COMPILE_FLAG([-Wformat-signedness], [CFLAGS="$CFLAGS -Wformat-signedness"])
+	fi
+])
diff --git a/acinclude.m4 b/acinclude.m4
index 027ed69977db..a12b93972cfa 100644
--- a/acinclude.m4
+++ b/acinclude.m4
@@ -9,20 +9,3 @@ AC_DEFUN([NEARD_PROG_CC_PIE], [
 		rm -rf conftest*
 	])
 ])
-
-AC_DEFUN([NEARD_COMPILER_FLAGS], [
-	if (test "${CFLAGS}" = ""); then
-		CFLAGS="-Wall -O2 -D_FORTIFY_SOURCE=2"
-	fi
-	if (test "$USE_MAINTAINER_MODE" = "yes"); then
-		CFLAGS="$CFLAGS -Werror -Wextra"
-		CFLAGS="$CFLAGS -Werror -Wextra"
-		CFLAGS="$CFLAGS -Wno-unused-parameter"
-		CFLAGS="$CFLAGS -Wno-missing-field-initializers"
-		CFLAGS="$CFLAGS -Wdeclaration-after-statement"
-		CFLAGS="$CFLAGS -Wmissing-declarations"
-		CFLAGS="$CFLAGS -Wredundant-decls"
-		CFLAGS="$CFLAGS -Wcast-align"
-		CFLAGS="$CFLAGS -DG_DISABLE_DEPRECATED"
-	fi
-])
diff --git a/configure.ac b/configure.ac
index c4e8993305b1..b9419c1fad74 100644
--- a/configure.ac
+++ b/configure.ac
@@ -22,8 +22,6 @@ AC_SUBST(se_plugindir)
 
 PKG_PROG_PKG_CONFIG
 
-NEARD_COMPILER_FLAGS
-
 AC_LANG([C])
 
 AC_PROG_CC
@@ -34,6 +32,9 @@ AC_PROG_MKDIR_P
 m4_define([_LT_AC_TAGCONFIG], [])
 m4_ifdef([AC_LIBTOOL_TAGS], [AC_LIBTOOL_TAGS([])])
 
+m4_include([accflags.m4])
+NEARD_COMPILER_FLAGS
+
 LT_INIT([disable-static])
 
 AM_CONDITIONAL(READLINE, test "${enable_readline}" = "yes")
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
