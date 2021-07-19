Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8C63CD346
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:10:03 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 73ED1100EAB4B;
	Mon, 19 Jul 2021 04:10:02 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id AEEA5100EAB48
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:59 -0700 (PDT)
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id B1A8A40207
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692998;
	bh=0yLbdPo3jrDIXhdPW0s8rpkD19VyXszTk9Y2FAilZLQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=GAm2S3yR0e7/EQvYFAlQbcRmKjJbILda6FDuWnxM5GAcPpaxJUMXYrf6XqvOgzIBv
	 1WQluV/hHH4iXNG9HdWX4Rukq8On4g/zMHgX3+GD6frdBDkQBoWjRedRkoQ6DpsKDa
	 oz2q6Xxil7D3sF5A8TvQun86G9j0s6FxZ1l1NCnwWGtvAOqZsYpMrZfLU5suaUGPST
	 VshfrGk/stxgdeCXh85XLBEWd3yYvFZCn47wup1em65YdA/PFw5jHsxam/2yLCvQb5
	 774L1LbWrswPE3xu/oEZTzpZTTjx1anqQ6q9kdNDZKSo+XJ0mKgg95UxHA7pJUlvLL
	 B47cFvzEaEiAQ==
Received: by mail-lj1-f197.google.com with SMTP id t1-20020a2e9d010000b02900f5b2b52da7so9343149lji.8
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0yLbdPo3jrDIXhdPW0s8rpkD19VyXszTk9Y2FAilZLQ=;
        b=TwKvEGQO/0GZE2iZOSmSto3woLhQ9OdTcSnPNBTGjZ3yyQ0j4SbK/S/h76F6dw//K6
         3DJGJqJccJB1h6U8Le62xJmJk436o48n79/ZSH8VqWYYEKiBxVH7HyQA9qY+mb9RUzM/
         96v3lQMkGmpDCWOH3lk7TFcuvnihGmhV31jjP1/gC4ZGXbgkusC3fp41bAYfIoUuHjpK
         pWRJ/cF0RsBXrwNhmBml8WcF9vNfDOzK00cKAH2skL7YQPo6Odlr4gnv8dla5k2Xcm2n
         fJbFL0xm0uq+FowYGyAkdymKsy7JaOEtlA8r7txLaIubV9Wkdq0bA38weA5OuCYPjtY4
         xSkQ==
X-Gm-Message-State: AOAM530+eNZPD2+SP/yHGbe80TJ1Bnplh30HYMqP5SwLcCzbkVb8K4tR
	Xe6hajDiwLffpp5nSSIzMLqrATT09pP0F8NtYe94BsfmDHrrK3AV77omj0itwRDOc5EvFR5TL+/
	4/GhkS9qc+YeL0zgstZeSvy0xwTyJwvpfMw==
X-Received: by 2002:a2e:9653:: with SMTP id z19mr21636186ljh.386.1626692998007;
        Mon, 19 Jul 2021 04:09:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7mzNHPgHEyisaYdbNoHSF0D/eO6cdESs2W5LoUJMvfnQ4OfIleDG0xKGqEo5x1UFYmpX3Ww==
X-Received: by 2002:a2e:9653:: with SMTP id z19mr21636180ljh.386.1626692997871;
        Mon, 19 Jul 2021 04:09:57 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:08:17 +0200
Message-Id: <20210719110819.27340-72-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 4GRFBCKAZICX4ZCCHBZQYCWVPONIBPTX
X-Message-ID-Hash: 4GRFBCKAZICX4ZCCHBZQYCWVPONIBPTX
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 71/73] build: fix missing usage of PIE check result
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/4GRFBCKAZICX4ZCCHBZQYCWVPONIBPTX/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The test result whether compiler accepts -fPIE in acinclude.m4 is stored
as neard_cv_prog_cc_pie variable.  Using wrong name of that variable in
a test for accepting '--enable-pie' configure argument caused PIE to be
never enabled (unless by default by compiler).

Fixes: 10c7e4a3cec3 ("build: Namespace local macros with NEARD_ instead of AC_ or nothing")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 configure.ac | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index b9419c1fad74..1ec6f4eb30ea 100644
--- a/configure.ac
+++ b/configure.ac
@@ -89,7 +89,7 @@ AC_ARG_ENABLE(debug, AS_HELP_STRING([--enable-debug],
 AC_ARG_ENABLE(pie, AS_HELP_STRING([--enable-pie],
 			[enable position independent executables flag]), [
 	if (test "${enableval}" = "yes" &&
-				test "${ac_cv_prog_cc_pie}" = "yes"); then
+				test "${neard_cv_prog_cc_pie}" = "yes"); then
 		CFLAGS="$CFLAGS -fPIE"
 		LDFLAGS="$LDFLAGS -pie"
 	fi
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
