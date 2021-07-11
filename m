Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EC23C3F07
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:21:45 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id B9365100EB330;
	Sun, 11 Jul 2021 13:21:41 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 83E48100EB330
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:21:39 -0700 (PDT)
Received: from mail-wr1-f72.google.com ([209.85.221.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2fxK-0001cw-8X
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:21:38 +0000
Received: by mail-wr1-f72.google.com with SMTP id r11-20020a5d52cb0000b02901309f5e7298so6169138wrv.0
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mmZjoH0UFe1TBWlhYgAwugZHmrdlH3EEVP0X6buWdvU=;
        b=jgfKh9VmqcMSSek8W6E78nj5oQ/BPeMGCG7c0Yetz8AV4Ctjsto2HqqkBVqZLRX3i6
         vm+PzVrJv/2UjKOX62539S1Mlvhk5Owa4/XSPy0+epmxOTzW2JFMv9C3jL8tWcGzkewB
         xDP+6pb0MTZidbq2EQXCRwZApahy546O50ZwpwrlpIRAErZGGlAdmxd/9lBUSP9a9cmM
         w5vCC2w7ahLSlBY3klE0t1llE3T9y6RkhBiYjh4eWCrDFHuvvl+r8uny/bSpopU03dZK
         ichO5az+CpqiKHHf3lvbQ6jyKbWFR+Edq62VZsQB1Mbr7s3TLqxGYjYj62Ec3bRqw+3o
         nsMg==
X-Gm-Message-State: AOAM531to8glx94tavllWD/PcT/6lwK/Rkwx2xppqBLXuMbD2j9pKG7W
	bIJf0MCWPlngi3KwvvqhdDFX0IEfMkmwCFBYkzMonyD6awhW2QxxmsI///ajIIT18A5HB0gwyBM
	s+drhjO4MOONO5ebAAovGOAbNvNojJNh4cg==
X-Received: by 2002:adf:e3cf:: with SMTP id k15mr1206078wrm.60.1626034897241;
        Sun, 11 Jul 2021 13:21:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAIdBnTjrSEZuow1g0MVrn1ifTOjyjYGlz09Mi1VJDiU0zeCoWV0F6rJuGWZJ/zLr/Us0WVw==
X-Received: by 2002:adf:e3cf:: with SMTP id k15mr1206074wrm.60.1626034897107;
        Sun, 11 Jul 2021 13:21:37 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id d14sm1503256wrs.49.2021.07.11.13.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:21:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:20:40 +0200
Message-Id: <20210711202102.18094-13-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: YSQ3NXROYDDLHACGIJRC4BU77GE2CX76
X-Message-ID-Hash: YSQ3NXROYDDLHACGIJRC4BU77GE2CX76
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 12/34] build: add more compiler warnings
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/YSQ3NXROYDDLHACGIJRC4BU77GE2CX76/>
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
 ci/alpine.sh |  1 +
 ci/debian.sh |  1 +
 ci/fedora.sh |  1 +
 configure.ac |  5 +++--
 7 files changed, 52 insertions(+), 19 deletions(-)
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
diff --git a/ci/alpine.sh b/ci/alpine.sh
index 006dca22aaf9..81b5c72a392e 100755
--- a/ci/alpine.sh
+++ b/ci/alpine.sh
@@ -16,6 +16,7 @@ PKGS_CC="gcc"
 # gzip: for distcheck
 apk add \
 	autoconf \
+	autoconf-archive \
 	automake \
 	gcc \
 	gzip \
diff --git a/ci/debian.sh b/ci/debian.sh
index dc2beecd8849..962e554304ee 100755
--- a/ci/debian.sh
+++ b/ci/debian.sh
@@ -28,6 +28,7 @@ esac
 
 apt install -y --no-install-recommends \
 	autoconf \
+	autoconf-archive \
 	automake \
 	libdbus-1-dev \
 	libglib2.0-dev \
diff --git a/ci/fedora.sh b/ci/fedora.sh
index ea6e8a5f5b16..c5a67d237e91 100755
--- a/ci/fedora.sh
+++ b/ci/fedora.sh
@@ -17,6 +17,7 @@ esac
 
 yum -y install \
 	autoconf \
+	autoconf-archive \
 	automake \
 	dbus-devel \
 	glib2-devel \
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
