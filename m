Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BAF3C836E
	for <lists+linux-nfc@lfdr.de>; Wed, 14 Jul 2021 13:05:52 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 85DB3100F2253;
	Wed, 14 Jul 2021 04:05:46 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id D12D3100F225F
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:44 -0700 (PDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id B598240596
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 11:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626260743;
	bh=NTa05OQfhOQSsJKW22lfIuCT4kgzRpKArN0kjfsqe9U=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=vvMwvs1bvE2OKVx6xJY3x9sbrM77NU43+ouPJgpeV4nUp7ovJkYcwDBUbE5oZcjO5
	 W8ZSELdLV7U++T/x87sC4mTFtoGYHD9wpHXyNVc34FmWOFvUudr/l0OnKdqKFMSAvO
	 mq8VGQuMYfrV95d+zsUhjdYhorpS9DuJvC99uD3viA862+SOGF4/8DrhuPFSN2yDDv
	 vonznPPM4T0dH8TvWC1jFzPBZ3LsRBy2JnOnapJmMzzezjvWpDNS8MhWbpQ7bARFq0
	 FOnWZfJR/P7+Et9zORb/zGwCszq9P8jw3aNa4s0roeV+8dfl5SuN29Th306pg2wTcR
	 sHbP48eCc5N0Q==
Received: by mail-ed1-f72.google.com with SMTP id m21-20020a50ef150000b029039c013d5b80so1064231eds.7
        for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NTa05OQfhOQSsJKW22lfIuCT4kgzRpKArN0kjfsqe9U=;
        b=Uyav/H4NUZQOIP9DUoJscfq+5f+PHXhxVafzuL4VhE5PHMQXPdsrn7+2SmtWkbNjoS
         9azzFuXftF+6e0sI2GjGTu9kOaERugXswGu9zH4vrp6Chu1HpOzMLsrrlaJIWE3E/zTl
         wSuGtHAxjuMc3GtC31bRAuj03R0gTbXQ+tMl2fVYkPX8Tkr9gyW48XkCkz5hvtd7N5JK
         2PKwi11El5jgL4h/FtL14Mx854A6mBtS9QDmWP/J8lBQkahmGs2nkegq7MGiVbYE4rql
         2+NO5C6IE2oUYKBbIg4O7sQVk/EXmRHi9tl/47aainYCMPbtqoJwmVYuSJ3DhRpxWuTc
         a+4A==
X-Gm-Message-State: AOAM531nDbKt/zc82LWxTpxnb3NZ59bhmO788FKnoGSZgEGBKHXWZF6D
	GKglYba2ieCILL+CH7BSoOjpW/wc4Ee9IAon/BAzTgqemAlHlA8ERxRTrSVILU+Purpi/tt4Ng9
	rQrvuO9OaWIogqjqMeMn44UGy4IFv01HXbQ==
X-Received: by 2002:a17:907:7708:: with SMTP id kw8mr12080014ejc.111.1626260742983;
        Wed, 14 Jul 2021 04:05:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKn3H5x4rVPZhMOQy8OKISbzDJVLrGEsL4AvZDkYi1J7lRHPJ2rHHCoYK4g+SAdKQT+DLdFw==
X-Received: by 2002:a17:907:7708:: with SMTP id kw8mr12079995ejc.111.1626260742813;
        Wed, 14 Jul 2021 04:05:42 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id qp12sm637689ejb.90.2021.07.14.04.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 04:05:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed, 14 Jul 2021 13:05:15 +0200
Message-Id: <20210714110518.104655-14-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
References: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: LCXEZS5WOGNOCPGWBKKAK2TKNRUPGORJ
X-Message-ID-Hash: LCXEZS5WOGNOCPGWBKKAK2TKNRUPGORJ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 13/16] unit: fix memory leaks in test-ndef-parse
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/LCXEZS5WOGNOCPGWBKKAK2TKNRUPGORJ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

test-ndef-parse.c was not freeing fully the ndef records it got.
Replace the open-coded freeing with usage of near_ndef_records_free() to
solve libasan errors like:

    Direct leak of 8 byte(s) in 1 object(s) allocated from:
        #0 0x7f678a64b518 in calloc (/usr/lib/x86_64-linux-gnu/libasan.so.5+0xe9518)
        #1 0x557597045e89 in parse_sp_payload src/ndef.c:1468
        #2 0x557597045e89 in near_ndef_parse_msg src/ndef.c:2921

and valgring errors like:

    2 bytes in 1 blocks are definitely lost in loss record 2 of 52
    at 0x483C7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
    by 0x48CA698: g_malloc (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48E4B3D: g_strndup (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x11C9F6: parse_record_header (ndef.c:1131)
    by 0x11C9F6: parse_record_header (ndef.c:1038)
    by 0x11E3D9: near_ndef_parse_msg (ndef.c:2855)
    by 0x121E6B: test_ndef_uri (test-ndef-parse.c:213)
    by 0x48ECDCD: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ECBCA: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2B9: g_test_run_suite (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2D4: g_test_run (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x10F61A: main (test-ndef-parse.c:467)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-ndef-parse.c | 39 +++++----------------------------------
 1 file changed, 5 insertions(+), 34 deletions(-)

diff --git a/unit/test-ndef-parse.c b/unit/test-ndef-parse.c
index 0bc53eeac125..743bfa638d24 100644
--- a/unit/test-ndef-parse.c
+++ b/unit/test-ndef-parse.c
@@ -196,15 +196,6 @@ static uint8_t ho_hs_bt[] = {0x91, 0x02, 0x0A, 0x48, 0x73, 0x12, 0xD1, 0x02,
 			      0x09, 0x44, 0x65, 0x79, 0x69, 0x63, 0x65, 0x4e,
 			      0x61, 0x6d, 0x65};
 
-static void test_ndef_free_record(struct near_ndef_record *record)
-{
-	g_free(record->header);
-	g_free(record->type);
-	g_free(record->data);
-	g_free(record);
-
-}
-
 static void test_ndef_uri(void)
 {
 	GList *records;
@@ -229,9 +220,7 @@ static void test_ndef_uri(void)
 	if (g_test_verbose())
 		g_print("NDEF URI field: %s\n", record->uri->field);
 
-	g_free(record->uri->field);
-	g_free(record->uri);
-	test_ndef_free_record(record);
+	near_ndef_records_free(records);
 }
 
 static void test_ndef_text_encoding(uint8_t *text, size_t len, const char *encoding, const char *expected)
@@ -262,11 +251,7 @@ static void test_ndef_text_encoding(uint8_t *text, size_t len, const char *encod
 						record->text->language_code);
 	}
 
-	g_free(record->text->data);
-	g_free(record->text->encoding);
-	g_free(record->text->language_code);
-	g_free(record->text);
-	test_ndef_free_record(record);
+	near_ndef_records_free(records);
 }
 
 static void test_ndef_text(void)
@@ -318,10 +303,7 @@ static void test_ndef_single_sp(void)
 		g_print("NDEF SP URI field: %.*s\n", (int)uri->field_length,
 			(char *) uri->field);
 
-	g_free(uri->field);
-	g_free(uri);
-	g_free(record->sp);
-	test_ndef_free_record(record);
+	near_ndef_records_free(records);
 }
 
 static void test_ndef_title_sp(void)
@@ -372,16 +354,7 @@ static void test_ndef_title_sp(void)
 		g_print("NDEF SP Title Language: %s\n", text->language_code);
 	}
 
-	g_free(uri->field);
-	g_free(uri);
-
-	g_free(text->data);
-	g_free(text->encoding);
-	g_free(text->language_code);
-	g_free(text);
-
-	g_free(record->sp);
-	test_ndef_free_record(record);
+	near_ndef_records_free(records);
 }
 
 static void test_ndef_aar(void)
@@ -408,9 +381,7 @@ static void test_ndef_aar(void)
 	if (g_test_verbose())
 		g_print("NDEF AAR package: %s\n", record->aar->package);
 
-	g_free(record->aar->package);
-	g_free(record->aar);
-	test_ndef_free_record(record);
+	near_ndef_records_free(records);
 }
 
 static void test_ndef_ho_hs_bt(void)
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
