Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A015D3CD344
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:10:00 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 58E48100EAB61;
	Mon, 19 Jul 2021 04:09:59 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 8B9BE100EAB5E
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:57 -0700 (PDT)
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 8F552409F6
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692996;
	bh=j/o1hmO7RiYw4SrYnE9hfPveWI6bzRspyYFKT7+NPmc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=XfJbbDVtqXX2O58X/ntBvGS8jFOcRoUzFFG32JRFSp47pqtgZmvFFIRtn6F4l8YBn
	 XkEf4SSgrDZbgMgWBIdDv9jCOLPeTg/DAcRoeskHDZR6DdK/edmhUawwM/is/l6iG/
	 38DHaunfK9n5xe//QXleT/TFBEucMmUmXpU+chvrDxr0SUyYM79pDAkoLnUyN/3R+9
	 QctUctZ142oot1808EekuyMypbgnN4A40zuSPGCz3ID9kN4Mqh0LEM0G5g79vxkRPX
	 C4Ll3nEtnDPqEi8r2b3/EGpYCBb1V5TWkDXpJe8K+FcmEs5eQgHgtEcN6kLkzo+QTd
	 CS6r8Mj77oLAQ==
Received: by mail-lf1-f69.google.com with SMTP id i13-20020a196d0d0000b029034f05dc854aso3265746lfc.1
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j/o1hmO7RiYw4SrYnE9hfPveWI6bzRspyYFKT7+NPmc=;
        b=DT0IkR2mFUc09pfUeN14UR4lpTnanPFZY9TixWjavhqQPUV7i/fbj4MQDMlODDmjQ6
         lI51IKU/OghPH5bWdxGLJZ6ogUesqxuygZ/2IOogBIxvk2oTcRLMHkK2QXEdURDNZ9ze
         FFKjj3QC6wJiYlL/0wqP5ENr9HPTH2x6fJK4ObUxYpJIysgT3/ML4bwC5KSstIyudSNS
         nwzZ0/DTI3C6lzCb5EtDZ+hc6Ovz/Rt75LqW/fgJRFweeiET4d4jIsn+FQ/GwkIIDw2o
         5JixOofWidyjldDDgif7N20oT3XwK1mBpelYoiqC/plVJa1QhtUmHOKDn5So/7JS9/cp
         gpiw==
X-Gm-Message-State: AOAM533W+LJBwwjYW9PO6z3qYsk0I7gF8CnVDtxFAkvgmBY9O93GA4bp
	6AxU9wgOsDTYNEsdP12Q4Cl9NQwfVZgeAatUM9/K1nsN1EJ14aEAuTqGl4540HnSpUXx+CDUDVx
	6RLA2oLiR5EtcME1ON4yKMkkv6CF2QoNfNw==
X-Received: by 2002:ac2:538c:: with SMTP id g12mr14289221lfh.245.1626692995840;
        Mon, 19 Jul 2021 04:09:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqr8OK/4khQspD2sZgv6jHsUnVBgoyn8mjwbkcvpurBWX5eV79U4fd0OshHL+nbCvme75pqA==
X-Received: by 2002:ac2:538c:: with SMTP id g12mr14289213lfh.245.1626692995703;
        Mon, 19 Jul 2021 04:09:55 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:08:15 +0200
Message-Id: <20210719110819.27340-70-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: RXHB7QBOT3RGNOGXXXUNGN2UUT2TUNNZ
X-Message-ID-Hash: RXHB7QBOT3RGNOGXXXUNGN2UUT2TUNNZ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 69/73] build: enable -Wformat=2 warnings
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/RXHB7QBOT3RGNOGXXXUNGN2UUT2TUNNZ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The -Wformat=2 compiler warning can detect potentials errors when using
printf-like functions.  It is supported by GCC and clang.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 accflags.m4 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accflags.m4 b/accflags.m4
index e4df62c13cf3..57cc48beecc2 100644
--- a/accflags.m4
+++ b/accflags.m4
@@ -14,6 +14,7 @@ AC_DEFUN([NEARD_COMPILER_FLAGS], [
 		CFLAGS="$CFLAGS -Wmissing-declarations"
 		CFLAGS="$CFLAGS -Wredundant-decls"
 		CFLAGS="$CFLAGS -Wcast-align"
+		CFLAGS="$CFLAGS -Wformat=2"
 		CFLAGS="$CFLAGS -DG_DISABLE_DEPRECATED"
 
 		AX_CHECK_COMPILE_FLAG([-Wdouble-promotion], [CFLAGS="$CFLAGS -Wdouble-promotion"])
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
