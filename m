Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DC73CD348
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:10:05 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 82C83100EAB47;
	Mon, 19 Jul 2021 04:10:04 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 96022100F2275
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:10:01 -0700 (PDT)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 96A5740207
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626693000;
	bh=WwKjCMxzk6SDJNE+vTfFQfVfyKPBmMRS2OXM5JP3LdQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=qwz42TpuGXRDuvXcoxcAK9xqjyXUBj19VxH/4WsOZZKr8o3kuiKOwJQNf2bh2N6qP
	 C7YjAJaw6hJT5HiyV/lINq8mBJHDR91TlWI49zMZsL9UmJnm1yD3EKr75XDBnL8y26
	 2g3LLWt3Vl88ofzEMo3mwsBCGJAt0IAHQ41mNconJuvvxj6t3k+rYoNc0CErmNUq6+
	 /nJK5IlUBwZ4eZ8AGDP3ugNNNDamxAGZLw/qbo2bki+Nt9oO2Esse4xv4wNcV7iqYW
	 6pi+6pCVgXibcO/wblR8BGOKECFu2RPb95JclBGdfVMzjn2SNbU4c835+pxApXjYa/
	 i+O99mZhf+NBQ==
Received: by mail-lj1-f199.google.com with SMTP id y11-20020a2eb00b0000b0290194aa1ae3efso5327321ljk.18
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WwKjCMxzk6SDJNE+vTfFQfVfyKPBmMRS2OXM5JP3LdQ=;
        b=EaoBUAX51Prp+riSDC14XxbvM4YqzU8EUDzlFUkTdj0YbXNK2EjMgmrVTMrsmn7Qf6
         DaZADPfPXY91zRmKsTvzuYw+ff3qZdp5V7EWih7tvrkU6h7H1eVLFgnLVgGcIjoYVTMv
         CohCOTXfzKwUDfifmKpz2RSc7ONELUC/1mizSSyh51j3EWgaMfw3e6WHpxnIpoX+TDnR
         ObxkMVwz1tmjzNJ64XNsPMzqTLdH+/E6xzhU9UhMHsjcQZGCHTPmV4u0fE1y4X3JpjA5
         OdU7YUvfZrur3Esa2DhJP7jD5PjdInG74v+VFdXChyrQOTVqca+4idxcAltislw7SN9c
         FZbA==
X-Gm-Message-State: AOAM533vFoetMK9YlCJXwV+wkKx3kpNi8OWooFntOHkbBRVCCuJATj1x
	y+q+09PkJjGSrFFr49rYMUtQ4vMqpWJIwvC04CFhGLzjVBRTyE9CJzlFSZUVrUWjXYNiWwcC6eK
	TQ6HjnwjeOQuGo6kp6llglUbiPEwbiwHXoA==
X-Received: by 2002:a05:651c:b2b:: with SMTP id b43mr7988407ljr.476.1626692999649;
        Mon, 19 Jul 2021 04:09:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxk8j042psfvkDycI4VS/L4wv9bgxTyZiolT8k7rrlabA82hMlaYkfPDIhPcQZZSGT7/8hvKQ==
X-Received: by 2002:a05:651c:b2b:: with SMTP id b43mr7988378ljr.476.1626692999104;
        Mon, 19 Jul 2021 04:09:59 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:08:18 +0200
Message-Id: <20210719110819.27340-73-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: QOK3NF5BOLA4KFUUFUWQCQDYBVPISEV2
X-Message-ID-Hash: QOK3NF5BOLA4KFUUFUWQCQDYBVPISEV2
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 72/73] build: add support for GCC sanitizers (asan, lsan and ubsan)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/QOK3NF5BOLA4KFUUFUWQCQDYBVPISEV2/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add support for GCC sanitizers: address (asan), leak (lsan) and
undefined behavior (ubsan).  These can be toggled in ./configure with
--enable-asan, --enable-lsan and --enable-ubsan.

The autoconf code for this derived from ell (mostly authored by Mat
Martineau <mathew.j.martineau@linux.intel.com>):
https://git.kernel.org/pub/scm/libs/ell/ell.git

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 HACKING      |  5 ++++-
 acinclude.m4 | 36 ++++++++++++++++++++++++++++++++++++
 configure.ac | 45 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/HACKING b/HACKING
index 7326242506a6..40bde2fb3c8b 100644
--- a/HACKING
+++ b/HACKING
@@ -51,8 +51,11 @@ like this:
     # git clone git://git.kernel.org/pub/scm/network/.../neard.git
     # cd neard
 
-  Configure and build
+  Configure (choose only one)
     # ./bootstrap-configure
+    # ./bootstrap-configure --enable-asan --enable-lsan --enable-ubsan
+
+  Build
     # make
 
   Check installation
diff --git a/acinclude.m4 b/acinclude.m4
index a12b93972cfa..e9ad0d63cc8c 100644
--- a/acinclude.m4
+++ b/acinclude.m4
@@ -9,3 +9,39 @@ AC_DEFUN([NEARD_PROG_CC_PIE], [
 		rm -rf conftest*
 	])
 ])
+
+AC_DEFUN([NEARD_PROG_CC_ASAN], [
+AC_CACHE_CHECK([whether ${CC-cc} accepts -fsanitize=address], neard_cv_prog_cc_asan, [
+	echo 'void f(){}' > conftest.c
+	if test -z "`${CC-cc} -fsanitize=address -c conftest.c 2>&1`"; then
+		neard_cv_prog_cc_asan=yes
+	else
+		neard_cv_prog_cc_asan=no
+	fi
+	rm -rf conftest*
+])
+])
+
+AC_DEFUN([NEARD_PROG_CC_LSAN], [
+AC_CACHE_CHECK([whether ${CC-cc} accepts -fsanitize=leak], neard_cv_prog_cc_lsan, [
+	echo 'void f(){}' > conftest.c
+	if test -z "`${CC-cc} -fsanitize=leak -c conftest.c 2>&1`"; then
+		neard_cv_prog_cc_lsan=yes
+	else
+		neard_cv_prog_cc_lsan=no
+	fi
+	rm -rf conftest*
+])
+])
+
+AC_DEFUN([NEARD_PROG_CC_UBSAN], [
+AC_CACHE_CHECK([whether ${CC-cc} accepts -fsanitize=undefined], neard_cv_prog_cc_ubsan, [
+	echo 'void f(){}' > conftest.c
+	if test -z "`${CC-cc} -fsanitize=undefined -c conftest.c 2>&1`"; then
+		neard_cv_prog_cc_ubsan=yes
+	else
+		neard_cv_prog_cc_ubsan=no
+	fi
+	rm -rf conftest*
+])
+])
diff --git a/configure.ac b/configure.ac
index 1ec6f4eb30ea..c1fdc44ae02d 100644
--- a/configure.ac
+++ b/configure.ac
@@ -26,6 +26,9 @@ AC_LANG([C])
 
 AC_PROG_CC
 NEARD_PROG_CC_PIE
+NEARD_PROG_CC_ASAN
+NEARD_PROG_CC_LSAN
+NEARD_PROG_CC_UBSAN
 AC_PROG_INSTALL
 AC_PROG_MKDIR_P
 
@@ -98,6 +101,48 @@ AC_ARG_ENABLE(pie, AS_HELP_STRING([--enable-pie],
 AC_CHECK_LIB(dl, dlopen, dummy=yes,
 			AC_MSG_ERROR(dynamic linking loader is required))
 
+save_LIBS=$LIBS
+AC_CHECK_LIB(asan, _init)
+LIBS=$save_LIBS
+
+AC_ARG_ENABLE(asan, AC_HELP_STRING([--enable-asan],
+			[enable linking with address sanitizer]), [
+	if (test "${enableval}" = "yes" &&
+				test "${ac_cv_lib_asan__init}" = "yes" &&
+				test "${neard_cv_prog_cc_asan}" = "yes"); then
+		CFLAGS="$CFLAGS -fsanitize=address";
+		LDFLAGS="$LDFLAGS -fsanitize=address"
+	fi
+])
+
+save_LIBS=$LIBS
+AC_CHECK_LIB(lsan, _init)
+LIBS=$save_LIBS
+
+AC_ARG_ENABLE(lsan, AC_HELP_STRING([--enable-lsan],
+			[enable linking with leak sanitizer]), [
+	if (test "${enableval}" = "yes" &&
+				test "${ac_cv_lib_lsan__init}" = "yes" &&
+				test "${neard_cv_prog_cc_lsan}" = "yes"); then
+		CFLAGS="$CFLAGS -fsanitize=leak";
+		LDFLAGS="$LDFLAGS -fsanitize=leak"
+	fi
+])
+
+save_LIBS=$LIBS
+AC_CHECK_LIB(ubsan, _init)
+LIBS=$save_LIBS
+
+AC_ARG_ENABLE(ubsan, AC_HELP_STRING([--enable-ubsan],
+			[enable linking with undefined behavior sanitizer]), [
+	if (test "${enableval}" = "yes" &&
+				test "${ac_cv_lib_ubsan__init}" = "yes" &&
+				test "${neard_cv_prog_cc_ubsan}" = "yes"); then
+		CFLAGS="$CFLAGS -fsanitize=undefined";
+		LDFLAGS="$LDFLAGS -fsanitize=undefined"
+	fi
+])
+
 GLIB_DEPS="glib-2.0 >= 2.28"
 PKG_CHECK_MODULES(GLIB, [${GLIB_DEPS}], dummy=yes,
 				AC_MSG_ERROR(GLib >= 2.28 is required))
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
