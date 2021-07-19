Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6468A3CD335
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:43 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 1787D100EAB47;
	Mon, 19 Jul 2021 04:09:42 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 8F174100F2275
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:39 -0700 (PDT)
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 9F17140334
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692978;
	bh=gCNnFUCnQhuIcqzD4H0CPl+LpUh0h+uXFBp3zOj6bTc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=ua+GP7qgxpPABbU0EQ/5GrhDvA6S+CvH3PnJJlScJvlEjaMW5o66V23gqBUSQYDDc
	 XL9cqVBGkWgKg7dIZTbUtNMzpYZXNE+yiDJwziODrexHSxkLcfuTxhVb3vOHOn/lji
	 ycbDe1SOVn+oRM5PG9iaU99QpwSY8ByfvSIPa2UTODneJuTH+d4l2k4QJ8Tc6HyhuU
	 QdMkIy63A4meZRpQbR7QcUsUeANDwayjMrZWQyo8OXhfSIn+POetLBsqBSLEL7LwfP
	 WiQo7uBa7ULXGXIASjZ6hi/8Er+DY/TW3Bqgj/QHl34ekmzdUB16C33GDX6mE7j964
	 wFVW4CnZhQG2Q==
Received: by mail-lj1-f200.google.com with SMTP id y11-20020a2eb00b0000b0290194aa1ae3efso5326833ljk.18
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gCNnFUCnQhuIcqzD4H0CPl+LpUh0h+uXFBp3zOj6bTc=;
        b=mhCHAkpQtL6OBEnjfjagWlaCwRBKlKR1e/7l14l0YVBk6UVEuNZQDJPK1mliHgWRfE
         DXMbOS/FbeAgFGliMo7zVLtPLMzHj/WdcDCQHYjpDY6x1klHPr/1DPSK2RpgE6qL9lvP
         T2cc1tku1N3+J2qW5EJNrGWkifl8FC8XipV6JZqUaKNdZefEEW2TrKRvhe0YIsiwZylS
         gEoolWOJ1iMEoe7QtdoKwQxBJAWLjGDTHmBeBllTVyY+g8sG/KYhZZqzVHzpF0UTom/t
         SBdsCYUQ8PEWKISsfwO0y+/wGXYGJdnxSfeCxn39NDz+U12QjQJ+pB41cur2NqsaSdsf
         vnXg==
X-Gm-Message-State: AOAM533mgfA3m316fU39tya/z1zPd5xtnjnCtACUI5ij0wdtgeejyWAP
	m40pGoOFocMLyKKH45XA3LwHd0/utSsIs91UpgKBzDT3pZ30dmaG/n3tcR+VSxX1ufFJWyUV9i6
	LhGk/kI2GAbSqNpHWnKhnvfBxI4YSbZeAvw==
X-Received: by 2002:ac2:5e7a:: with SMTP id a26mr17894672lfr.446.1626692977885;
        Mon, 19 Jul 2021 04:09:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx86FL9atoNJ0e9s80mbGlG99supRjLfReJp/hNiPvT++1uS2kY8tDtOMUw+iKEpBjYVW4ghw==
X-Received: by 2002:ac2:5e7a:: with SMTP id a26mr17894666lfr.446.1626692977727;
        Mon, 19 Jul 2021 04:09:37 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:08:00 +0200
Message-Id: <20210719110819.27340-55-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: VXZGLMVC5YDO4ABL5EI57TPSTMEBSLVU
X-Message-ID-Hash: VXZGLMVC5YDO4ABL5EI57TPSTMEBSLVU
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 54/73] unit: fix memory leaks in test-ndef-parse
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/VXZGLMVC5YDO4ABL5EI57TPSTMEBSLVU/>
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
index 24f7d2f2c3ac..ace0f9038ad9 100644
--- a/unit/test-ndef-parse.c
+++ b/unit/test-ndef-parse.c
@@ -189,15 +189,6 @@ static uint8_t ho_hs_bt[] = {0x91, 0x02, 0x0A, 0x48, 0x73, 0x12, 0xD1, 0x02,
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
@@ -222,9 +213,7 @@ static void test_ndef_uri(void)
 	if (g_test_verbose())
 		g_print("NDEF URI field: %s\n", record->uri->field);
 
-	g_free(record->uri->field);
-	g_free(record->uri);
-	test_ndef_free_record(record);
+	near_ndef_records_free(records);
 }
 
 static void test_ndef_text(void)
@@ -255,11 +244,7 @@ static void test_ndef_text(void)
 						record->text->language_code);
 	}
 
-	g_free(record->text->data);
-	g_free(record->text->encoding);
-	g_free(record->text->language_code);
-	g_free(record->text);
-	test_ndef_free_record(record);
+	near_ndef_records_free(records);
 }
 
 static void test_ndef_text_invalid_utf16(void)
@@ -305,10 +290,7 @@ static void test_ndef_single_sp(void)
 		g_print("NDEF SP URI field: %.*s\n", (int)uri->field_length,
 			(char *) uri->field);
 
-	g_free(uri->field);
-	g_free(uri);
-	g_free(record->sp);
-	test_ndef_free_record(record);
+	near_ndef_records_free(records);
 }
 
 static void test_ndef_title_sp(void)
@@ -359,16 +341,7 @@ static void test_ndef_title_sp(void)
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
@@ -395,9 +368,7 @@ static void test_ndef_aar(void)
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
