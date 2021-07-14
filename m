Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 513DE3C836A
	for <lists+linux-nfc@lfdr.de>; Wed, 14 Jul 2021 13:05:48 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 42639100F2275;
	Wed, 14 Jul 2021 04:05:42 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id C1749100F226A
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:39 -0700 (PDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id A766D40596
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 11:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626260738;
	bh=TzgPDAwjdP90+A72dMzuSxu5O1xPbO0mSjsy0+fTYvI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=HS7IdwckrKBL9AuVDEW2UJ/HLnUo9fXUd/Gkm1N8yjR+x8kVWwpAQBhki1+kYxETZ
	 IVxMfv1y+7EPaxXkd7E9Ld8Kgw82+Beu5Kmw/Dm+aJMTIWpPuyh2i7IaoZRAgfgiPa
	 f58FC6s+1aOIQgCyYhIqhkKcx9ygMwY2f53mqp6GEghmEV2jN17tsRMqYtXF2FO9oA
	 irOt9laNtZDdOWbgdtB03F9v5yuJHOiUvR/5wzqzscEk+pQP5UHhu8fOY2l8qsmY2S
	 yazrHog3Ohkt3jdaUlDhhCSMV2YGrS15OVPDmS7OSFs8tmkqaG472DNQs/yKNP10W2
	 /Ao50ySqiPqKQ==
Received: by mail-ed1-f69.google.com with SMTP id ee46-20020a056402292eb02903a1187e547cso1083787edb.0
        for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TzgPDAwjdP90+A72dMzuSxu5O1xPbO0mSjsy0+fTYvI=;
        b=VGCCuxQykfWHtyMkydrDBmt48FU3V8WgCB3z1ODzJqMqlaBALXmgxz8/7s4gdRdS/Z
         Nl9RLCeob9ZWkRR45Z9FS2F2tQvfSz+nZJ7kzM23iYlJLhSh8kaYber1PmsIlrfINR28
         wCK3uaRpUbLR6RiFqBWkFJyHgmiAeR9o2giI1P1PeReFOCWqYVrO38QPmPFu+IR6Uwwi
         Cv4MxXzT2s8hfeVAHLS9aTDFO5JPYRw24XtOzTZXw+Ho+oAFXCvFZUHGIM0ql/E5gSaj
         v+HlxFsTT8HmJ9WkMcdY5UwG6JeCbvVKgw9KBqtec0pJwQMAOyPEpuzEJ7c+vurgnBK2
         kDfQ==
X-Gm-Message-State: AOAM533VM7qrkqG0Uyv1W6BVhLMKUHTl0ujBvKa5j/JNvZP5Zm6JpMTm
	D/SP7CmPzW50xgNGXKamRkbt6eutyR1hTtnkzrzl5o8J1DL8L7ig9wSXQI2bs82seO+1AG/2ySB
	d2xgyl8fV0LuZqRCMIHbunxm55IPaka99iw==
X-Received: by 2002:a05:6402:138c:: with SMTP id b12mr13045635edv.268.1626260738212;
        Wed, 14 Jul 2021 04:05:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7WAOkOYJFwkUvxci1YVWncI6CP3YpdWvVY8A1VLxdF824zQsRoCm56fwkNYkOnYcuA65SKw==
X-Received: by 2002:a05:6402:138c:: with SMTP id b12mr13045614edv.268.1626260738031;
        Wed, 14 Jul 2021 04:05:38 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id qp12sm637689ejb.90.2021.07.14.04.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 04:05:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed, 14 Jul 2021 13:05:11 +0200
Message-Id: <20210714110518.104655-10-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
References: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: XM2DJ4SD5NAMTZNSO6244GHD3EW5QCMA
X-Message-ID-Hash: XM2DJ4SD5NAMTZNSO6244GHD3EW5QCMA
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 09/16] build: fix missing usage of PIE check result
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/XM2DJ4SD5NAMTZNSO6244GHD3EW5QCMA/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The test whether compiler accepts -fPIE in acinclude.m4 is stored as
neard_cv_prog_cc_pie variable.  Refering wrong name in test for
accepting '--enable-pie' configure argument caused PIE to be never
enabled (unless by default by compiler).

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
