Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC093C3260
	for <lists+linux-nfc@lfdr.de>; Sat, 10 Jul 2021 05:39:28 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id F3710100EB84D;
	Fri,  9 Jul 2021 20:39:21 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 148D7100EB83A
	for <linux-nfc@lists.01.org>; Fri,  9 Jul 2021 20:39:20 -0700 (PDT)
Received: from mail-wr1-f70.google.com ([209.85.221.70])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m23pm-0007U2-Tf
	for linux-nfc@lists.01.org; Sat, 10 Jul 2021 03:39:18 +0000
Received: by mail-wr1-f70.google.com with SMTP id x4-20020a5d60c40000b029013cfb5f33b0so1162237wrt.4
        for <linux-nfc@lists.01.org>; Fri, 09 Jul 2021 20:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KTCLFQs/HXlmmzOuSdvt1+2eXwb8NHprrVtb8IfGALA=;
        b=siaVXXZ1fOCwUs4Ok8Tj5cv8TVNf3AAZHeVkAR86EEVp9u3OHD0icSy++g3k6TjhtK
         30CFBRprgqTZzzPuhfa3lrljnnycleeFELtN3/W3dECDrxtFpS531F7klhRMAUeqAaBD
         ogt3Ib9cK+u4zXSkygb/COapsRWqLjjkXkM1zJdwSWffltSzyL9/zk6TqOdDT6TwUQzf
         lI7HQyO4lskjyTyfz/EHW8reV6ajnMcalrvA5G5DiJV+JU4duVFyc9vaJqBzwx4ud7vu
         0ZYD7VSBIXuwSwzZ96jKySqycIti9pJiQWnZ2OMk9paGYVQFEdkLfC2ZpQRo7WkLekIK
         uv8Q==
X-Gm-Message-State: AOAM531bFQk3eo7rs7A3tIaoW3BRrYJns0QVXyIFv+kjYwZaMCBT7tLx
	9lSpQnlHy23YJKTLHa+U9Hxdxzk99n3N9WkglKkyFLJoDOLliQ6gLhCZ21adp8nS5SH+eVgv3kM
	CQEOhCf+A0ZaFmGWKmEfOaDCCLHERC9FR3w==
X-Received: by 2002:a1c:1c7:: with SMTP id 190mr162040wmb.170.1625888358278;
        Fri, 09 Jul 2021 20:39:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbyHui721Od6lYE9nkXzNVX3XdqUOLOKkecI0VoPbZknh366AnZQQQUhMyNij57rA5Sro4KA==
X-Received: by 2002:a1c:1c7:: with SMTP id 190mr162031wmb.170.1625888358120;
        Fri, 09 Jul 2021 20:39:18 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id a12sm7444346wrh.26.2021.07.09.20.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 20:39:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sat, 10 Jul 2021 05:38:49 +0200
Message-Id: <20210710033859.3989-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
References: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: UT5TYPWR6ZLMKZHZNQX64I7BASZMMR45
X-Message-ID-Hash: UT5TYPWR6ZLMKZHZNQX64I7BASZMMR45
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 06/16] bootstrap: parse CROSS_COMPILE and set proper configure option
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/UT5TYPWR6ZLMKZHZNQX64I7BASZMMR45/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Makes cross compiling in CI easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 bootstrap-configure | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/bootstrap-configure b/bootstrap-configure
index 7cb14588f816..0652e3b223b6 100755
--- a/bootstrap-configure
+++ b/bootstrap-configure
@@ -4,6 +4,11 @@ if [ -f config.status ]; then
 	make maintainer-clean
 fi
 
+CONFIGURE_CROSS=""
+if [ "$CROSS_COMPILE" ]; then
+	CONFIGURE_CROSS="--host=${CROSS_COMPILE}"
+fi
+
 ./bootstrap && \
     ./configure --enable-maintainer-mode \
 		--enable-debug \
@@ -11,4 +16,5 @@ fi
 		--prefix=/usr \
 		--enable-ese \
 		--sysconfdir=/etc \
+		"$CONFIGURE_CROSS" \
 		--enable-tools "$@"
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
