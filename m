Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB533CD32F
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:36 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 977F0100EB342;
	Mon, 19 Jul 2021 04:09:34 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 4C5D4100EB345
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:32 -0700 (PDT)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 5066F418CF
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692971;
	bh=cFQrYmXe45bkWgFvhYphfkGbxPQRoU2aLrj88ipRKtI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=rUA704Vn3fOQTNZSpgWnJAK1etPJckOXKF1k9qKqEZoSOvdMXwmIeWvKjh/SeUAIr
	 20XOZ6VAq/bQ/RPJ/hRloLu7XB689nhi4MUx68LeoausxxZBrrYp5GqP0i5AxpY2Ah
	 o3oimAZd7lE2mA8cJ0TcCdCRHEXX7S7a9HFZBu0cYynJV4QECDPR2lQ4HEQEryMukc
	 JXfg9b8R3IwWyeFH/36bg81T5WNXoWUzMfqIU/1Kdw4F0PQ4TAoVUPrJACqQG8DFbj
	 w060ioN3+WIbXawe1kx8MYV2sBfngzVl66bBDen1V5hLj0IYsGR7MMkuc8I9EOWC7S
	 IWJrCYvPslNng==
Received: by mail-lj1-f198.google.com with SMTP id d1-20020a2e81010000b0290196925bc674so3206493ljg.10
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cFQrYmXe45bkWgFvhYphfkGbxPQRoU2aLrj88ipRKtI=;
        b=DIvM+Kwo3/KjOmsqUJ9RuP5U2FJlGd0KKf5ix98Fw+XE30uwMNyFAHbWvwENhAwqyr
         kM8h8f5jhQrcOlRknhhh3vYSkfbR2SaX5eiJeHLWFyvwPiuirLZK4XGIkFQNTWIb4Zc9
         JzQpAPIHMz3H27gQGb9VWYXyBBZA76wQ0mNrzuvf1Y/eCmDRlYEexz6QG2aTcL8MGM4N
         bUaBLey/oUzFFGCH2B48LMHawhbPpsVmq1dENrWDHsH5kFm9Hp8jrniB+Che8Tm0rYhv
         xA+FYFUz0V274v84ZCTeJHhL8oAFOMM0Y3FJ5ljpgN+A1KvgIVONXkeby2NBwsmN6GLK
         UNvg==
X-Gm-Message-State: AOAM533DtetJQXA0Zmb+3zDZ7jIiivNequarmIlKfP/TjrRmwip/aClw
	1j0OE+kjkhT4w05u+gfPqvjzKycpMMaoFvplWdqm5lD5AueKFThJ2NCrlsHPuJ6EeicujqMEeyk
	m68nB7TjmO5bW1/jcV9wfDCD8Bnmq9VwiBg==
X-Received: by 2002:a19:4916:: with SMTP id w22mr18634803lfa.374.1626692970594;
        Mon, 19 Jul 2021 04:09:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwN0kxryCrW2if4sa2w0UMuPQwYdAsSTB+mBfaCaOF7xMvT4iT7a76HP5SgKZ2JsYDpT9M+sQ==
X-Received: by 2002:a19:4916:: with SMTP id w22mr18634797lfa.374.1626692970449;
        Mon, 19 Jul 2021 04:09:30 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:54 +0200
Message-Id: <20210719110819.27340-49-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: CMXS4QMKNBSDFGJ54WVSAN2JRF3PWZMR
X-Message-ID-Hash: CMXS4QMKNBSDFGJ54WVSAN2JRF3PWZMR
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 48/73] unit: use g_assert_null()
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/CMXS4QMKNBSDFGJ54WVSAN2JRF3PWZMR/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It's more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-ndef-build.c | 2 +-
 unit/test-ndef-parse.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/unit/test-ndef-build.c b/unit/test-ndef-build.c
index e83f7a8075df..bf77fdd42165 100644
--- a/unit/test-ndef-build.c
+++ b/unit/test-ndef-build.c
@@ -95,7 +95,7 @@ static void test_ndef_wsc_with_out_ssid_build(void)
 
 	ndef = near_ndef_prepare_wsc_record(NULL, NULL);
 
-	g_assert(!ndef);
+	g_assert_null(ndef);
 }
 
 int main(int argc, char **argv)
diff --git a/unit/test-ndef-parse.c b/unit/test-ndef-parse.c
index 9d68a6a77c64..a4f1ab3d0df4 100644
--- a/unit/test-ndef-parse.c
+++ b/unit/test-ndef-parse.c
@@ -290,8 +290,8 @@ static void test_ndef_single_sp(void)
 
 	g_assert(record->sp);
 	g_assert_cmpuint(record->sp->number_of_title_records, ==, 0);
-	g_assert(!record->sp->type);
-	g_assert(!record->sp->action);
+	g_assert_null(record->sp->type);
+	g_assert_null(record->sp->action);
 	g_assert_cmpuint(record->sp->size, ==, 0);
 	g_assert(record->sp->uri);
 
@@ -332,8 +332,8 @@ static void test_ndef_title_sp(void)
 
 	g_assert(record->sp);
 	g_assert_cmpuint(record->sp->number_of_title_records, ==, 1);
-	g_assert(!record->sp->type);
-	g_assert(!record->sp->action);
+	g_assert_null(record->sp->type);
+	g_assert_null(record->sp->action);
 	g_assert_cmpuint(record->sp->size, ==, 0);
 	g_assert(record->sp->uri);
 	g_assert(record->sp->title_records[0]);
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
