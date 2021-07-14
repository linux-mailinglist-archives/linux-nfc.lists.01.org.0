Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 517D43C836B
	for <lists+linux-nfc@lfdr.de>; Wed, 14 Jul 2021 13:05:49 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4F35F100F2274;
	Wed, 14 Jul 2021 04:05:43 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 15CB9100EB34F
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:41 -0700 (PDT)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 0748C4054A
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 11:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626260740;
	bh=pSE6g8t6ca+6ENY83DlZlDCva2yuzVNKwl55VM8hCMc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=mbRsbJjbva7AWcSIkgFE8xQyyJ19pQ6zAsXAR5AOYJk5wf7xW/1IeoI2iBLdg/+0s
	 xeZgpC7HaSG+G7Yx+GSMdQcHLKUejBpo89zvC2veCqQrRWCNj9OLVZ0xGFmeF8xG/W
	 JJmjwiHTi5g5JAjEZ7WPAnkZSHnNqDRMpumYiswHUA2T6qzTECBmNm6O7SDMAXHP48
	 E3jcz/TslsJzBJjzim6+ib2OvHWGYsR4cVUQ8KdEqE0b74+Q9eYE7KoxqHe/dzqwql
	 ZUepZo/KAaBybTwa6OQcShseJlXVVR3kFyTORdiWYV0Tp/5lQ8+4IjsUcBnyLPqACC
	 7MkH9pKE6rElg==
Received: by mail-ej1-f70.google.com with SMTP id u12-20020a17090617ccb029051ab3a0d553so648866eje.6
        for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pSE6g8t6ca+6ENY83DlZlDCva2yuzVNKwl55VM8hCMc=;
        b=Ou8s5UAHtQSQ0ERgXpPZcq5DS+BBWTubCC5H7pzV6GoKjnqTcD7ZJs1RVp1BRsvmqf
         nwY+3gN24e08xkT6DrhZyrxXjwc3C2e9OMiMZ9YVHnLLKRk8VOClSFj5SBOpmBjQuAz2
         CJf7T2HW/3X0l0uJk3EtF+1YQd//CV7hPC/tOpSbWxuTrTD6LgnFBHBVi7k46GbmFVXm
         2eLy2JjuuBzIum3E+Nk1VNB8sTgsUpjufTTSeZRiWEkO9bzriKm1zZc9ZQ6kwfQxSmsc
         qYFTaXhw7bG1deIvq3xA5BCDJZHx5jgZfigmgoXuWG9KKDC9fRgU4m2vOkABrUPgaw3O
         XNAQ==
X-Gm-Message-State: AOAM530+dJt7szxcHX7yW5gdFiqReItOqpQSVwfSnIegB6QMwg0pa3fy
	3HGkE1lRZNNX7SNNro4xh8VombmAvnTFJ6VQFu+XgM66KYdASr9QmgPFjHgTD3Ou8YlQS2rbaUR
	rhBVo5YkUQpVTpIgtvAqDmd2RajQoyU7PDQ==
X-Received: by 2002:a17:906:544f:: with SMTP id d15mr11634315ejp.520.1626260739340;
        Wed, 14 Jul 2021 04:05:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8+T6j3x1S1hOj4oItAOKadHMHe+gVTRUMd6vSPhG3smNGF97m4YgSnXv9/HzQpJuR6Tvcpw==
X-Received: by 2002:a17:906:544f:: with SMTP id d15mr11634307ejp.520.1626260739171;
        Wed, 14 Jul 2021 04:05:39 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id qp12sm637689ejb.90.2021.07.14.04.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 04:05:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed, 14 Jul 2021 13:05:12 +0200
Message-Id: <20210714110518.104655-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
References: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: MJCDUSAY3QTMJAI76T7F6GLMA7W5FC3J
X-Message-ID-Hash: MJCDUSAY3QTMJAI76T7F6GLMA7W5FC3J
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 10/16] build: add support for GCC sanitizers (asan, lsan and ubsan)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/MJCDUSAY3QTMJAI76T7F6GLMA7W5FC3J/>
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
 acinclude.m4 | 36 ++++++++++++++++++++++++++++++++++++
 configure.ac | 45 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)

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
