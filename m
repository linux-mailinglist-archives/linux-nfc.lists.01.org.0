Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E09414DCE
	for <lists+linux-nfc@lfdr.de>; Wed, 22 Sep 2021 18:12:10 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 6D9E3100EB84F;
	Wed, 22 Sep 2021 09:12:08 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 07D64100EBBC4
	for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 09:12:06 -0700 (PDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3A5EB3F4BC
	for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 16:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1632327125;
	bh=B2j3ytjlhPWW8P09M8QKTsnYcwI+yrsB4wd4NjdG+Cc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=AGnugPyyDkSRlCM/IG8xb7JXHcSl/1k0fn/fMKzgHZU4NvEUcbkSXRDULcALOWlA1
	 Kw2CyGo9Rz5SaWcDLRHycIt0ARhMq0R5x17c2G8VYWfccLL0qQjQywGhcUJD1zUf/e
	 sc/BjFWYI515xyiMArpnDTAN5QYfpB9O3DClisr9ZPQoU3vxnHCJN+Tbads+dkokhx
	 NF+W8qTUQiqpOAXfuyjSIwcQb6yLEd7nbWfbiZppl5tP20ocqJ8aqgCsEx9qwMdaIk
	 SgfdPig/f2QgOtc5hqlLzD6TbFwHSzZpIP8Wae5Dc5xhmx9At+rxYCXv9ioCx9Ut4D
	 pCif6My45XB6A==
Received: by mail-ed1-f72.google.com with SMTP id h24-20020a50cdd8000000b003d8005fe2f8so3648820edj.6
        for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 09:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B2j3ytjlhPWW8P09M8QKTsnYcwI+yrsB4wd4NjdG+Cc=;
        b=rwZChCpFTTjP5nvKy4aBh6VWWKCim9PzbkH2kTclQBclMTKvM50R76psTwScJEah4u
         pWaF9VFSpUJzCBk0qPkobQMP5xccEMlvi9s73EN4ee5KsS9lng56LpauuRLIgNe2cY2E
         5UWAZOkjJt/hH2zZ4X1bIbigI96NBTQaFXPSrvUIKtGp4Yzq7RCv//Fi8tWbVjmOlWxX
         fbusB9NQUWwKyJJYZqZOQKk6S45yR1vMXGXk0kMtoW7jwWHGmR70l8zrNPH365T3yMSZ
         xUV0NI7QsiDf0ojyv29Kazlvy7kWDP96rZMyhCAhAvmOnuppGHjGdYxe1PdZK9xDG0pt
         VtJQ==
X-Gm-Message-State: AOAM530cIub+wyMYg++aHvJsJWCC9j8WCAtlfCH9OpSI09Eh+D+kkOG/
	FSDA7ou5UxH+YxlS7KmM6UiLFHpM1Yl5HDvxlPRw+wLXT1ULTW537Ur8DjISq+pN0We4F6jzTPH
	O3OMA7qE2Q3SaoDNLYZZmDbnr4kbGu3HjFQ==
X-Received: by 2002:a17:906:144e:: with SMTP id q14mr370981ejc.19.1632327124639;
        Wed, 22 Sep 2021 09:12:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4gZrcnR+yS5YNdw4VN1wt5imSxHxaroxwDHqYfLU4ecim1DUkeLU9/xylz7zOPZjr+SB0Nw==
X-Received: by 2002:a17:906:144e:: with SMTP id q14mr370962ejc.19.1632327124462;
        Wed, 22 Sep 2021 09:12:04 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id b38sm1409122edf.46.2021.09.22.09.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 09:12:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed, 22 Sep 2021 18:11:07 +0200
Message-Id: <20210922161113.142758-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210922161113.142758-1-krzysztof.kozlowski@canonical.com>
References: <20210922161113.142758-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: WYJAS4SG252PKCS2WSCH5N3OTWDHEN4H
X-Message-ID-Hash: WYJAS4SG252PKCS2WSCH5N3OTWDHEN4H
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 2/8] build: replace deprecated AC_HELP_STRING
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/WYJAS4SG252PKCS2WSCH5N3OTWDHEN4H/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

AC_HELP_STRING is deprecated in favor of AS_HELP_STRING at least since
autoconf v2.60.  In autoconf v2.71 (used on current ArchLinux and Fedora
Rawhide) this causes error:

  configure.ac:112: warning: The macro `AC_HELP_STRING' is obsolete.
  configure.ac:112: You should run autoupdate.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 configure.ac | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure.ac b/configure.ac
index a1f7bd8bf56a..2cf9a19e4fab 100644
--- a/configure.ac
+++ b/configure.ac
@@ -109,7 +109,7 @@ save_LIBS=$LIBS
 AC_CHECK_LIB(asan, _init)
 LIBS=$save_LIBS
 
-AC_ARG_ENABLE(asan, AC_HELP_STRING([--enable-asan],
+AC_ARG_ENABLE(asan, AS_HELP_STRING([--enable-asan],
 			[enable linking with address sanitizer]), [
 	if (test "${enableval}" = "yes" &&
 				test "${ac_cv_lib_asan__init}" = "yes" &&
@@ -123,7 +123,7 @@ save_LIBS=$LIBS
 AC_CHECK_LIB(lsan, _init)
 LIBS=$save_LIBS
 
-AC_ARG_ENABLE(lsan, AC_HELP_STRING([--enable-lsan],
+AC_ARG_ENABLE(lsan, AS_HELP_STRING([--enable-lsan],
 			[enable linking with leak sanitizer]), [
 	if (test "${enableval}" = "yes" &&
 				test "${ac_cv_lib_lsan__init}" = "yes" &&
@@ -137,7 +137,7 @@ save_LIBS=$LIBS
 AC_CHECK_LIB(ubsan, _init)
 LIBS=$save_LIBS
 
-AC_ARG_ENABLE(ubsan, AC_HELP_STRING([--enable-ubsan],
+AC_ARG_ENABLE(ubsan, AS_HELP_STRING([--enable-ubsan],
 			[enable linking with undefined behavior sanitizer]), [
 	if (test "${enableval}" = "yes" &&
 				test "${ac_cv_lib_ubsan__init}" = "yes" &&
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
