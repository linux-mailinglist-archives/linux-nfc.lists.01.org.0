Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C54E03CB5BB
	for <lists+linux-nfc@lfdr.de>; Fri, 16 Jul 2021 12:09:11 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 7D4B0100EB35A;
	Fri, 16 Jul 2021 03:09:10 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id D4BA4100F2268
	for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 03:09:07 -0700 (PDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 92083408AC
	for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 10:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626430146;
	bh=zXMdoqKe2JrAMT4RBgqrZIubL2jRbMbrxY8o3vGW6kE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=YntRdq8r/jleW8JuGPYIVOsDJ62lkfrxMSXqsrrM+KrBDyanKbnqORRSDghkk3EKS
	 Ufe+DK6ww4emgbfAOX82kp0S4V6wAV4yv2sTQHXLFUh3GxzbugUlk11DKlVqFMVDH0
	 EdNN6M3DmcVfSkkzbEj2Y96NQJiUy6Etst3c6azra3tbEOXLyBosdguBA0WhBV4H0s
	 BTQQddWxR3dEM/U+EzjTyy3DRjVGrtBVrzpx5ZMHWVgneVdI5Z6mDRuoz0afcwf0ME
	 EpN8UTcTTNoB1zIJY/aiPolyqKbvKj9dbzEYDtYYD12/D7mYS95Wp8PPTnLM0Xl93c
	 mHc6N2HbP2DyQ==
Received: by mail-ed1-f71.google.com with SMTP id j25-20020aa7ca590000b029039c88110440so4565587edt.15
        for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 03:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zXMdoqKe2JrAMT4RBgqrZIubL2jRbMbrxY8o3vGW6kE=;
        b=Dz0s/SCEkrdcQnSlDlqLveFlUHczFCMSl3M6tRqfn6dDIsQp51BSyiGoihftSvAr54
         +bCCfczHGeo/kJMUdYQ1vVa/4Ano/yjmBo9XBiMvBvIfoZB1x18/MBxBsl8Gbnc+Ul2V
         kPNg97YtetcZDqZNAGeiHg5WhavvZ0rbRmygkhU5uGUz2+XTX1MtJ3uNDVCu9cyBDazP
         vT/B5rwEltBJdk/aTTMU3qQf6Eu+nMZSAonz8Qfn6+xdVKgbN55/VDsbCgWhAerixktd
         Tsh0RDEqU59RJ93+h7TMW0K4lTj2rrNRKvZ8sG8JTmaOPfzwCptuYezPYBs+ByTu9RRI
         Cw1w==
X-Gm-Message-State: AOAM5303k2OrwROwXl7a5vTF2MSIlWL/8uretZD5yH7hg2uavoMVmHnE
	vc/or7r0UppF+fNBQL3Ezj2xuj9dC9H08w4J4PRoGvAUe8Lt0qW1yTDXA5WduroiBcxM+/U7LAl
	h0KkT4lXGcAg3kVJjDKWzC/a5gJcEg1G/5A==
X-Received: by 2002:aa7:d514:: with SMTP id y20mr13575966edq.371.1626430145876;
        Fri, 16 Jul 2021 03:09:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJGDx59pjS0auKfFIEQ35CKAdaOGqMmkAweqDSJmpd37TGjfDLIK3DJuqT15gGQ+nhzBNDlg==
X-Received: by 2002:aa7:d514:: with SMTP id y20mr13575944edq.371.1626430145708;
        Fri, 16 Jul 2021 03:09:05 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id u26sm2710389ejj.4.2021.07.16.03.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 03:09:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Fri, 16 Jul 2021 12:08:43 +0200
Message-Id: <20210716100844.51360-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210716100844.51360-1-krzysztof.kozlowski@canonical.com>
References: <20210716100844.51360-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: DCHYE2ONYSCHPWNMBASXNJ6A6Y6Y672K
X-Message-ID-Hash: DCHYE2ONYSCHPWNMBASXNJ6A6Y6Y672K
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 6/7] unit: fix record memory leak in test-snep-read
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/DCHYE2ONYSCHPWNMBASXNJ6A6Y6Y672K/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of open-coding __near_ndef_record_free() with mistakes, use it
directly to fix memory leaks like:

  2 bytes in 1 blocks are definitely lost in loss record 2 of 36
    at 0x483C7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
    by 0x48CA698: g_malloc (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48E4B3D: g_strndup (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x11CB66: parse_record_header (ndef.c:1122)
    by 0x11CB66: parse_record_header (ndef.c:1029)
    by 0x11E549: near_ndef_parse_msg (ndef.c:2846)
    by 0x122A23: test_snep_dummy_req_put (test-snep-read.c:131)
    by 0x122005: snep_core_process_request (snep.c:397)
    by 0x122005: near_snep_core_read (snep.c:617)
    by 0x123042: test_snep_read_req_common.constprop.0 (test-snep-read.c:352)
    by 0x1234E0: test_snep_read_put_req_ok (test-snep-read.c:500)
    by 0x1234E0: test_snep_read_get_req_ok (test-snep-read.c:644)
    by 0x48ECDCD: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ECBCA: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2B9: g_test_run_suite (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)

  15 bytes in 1 blocks are definitely lost in loss record 13 of 36
    at 0x483ED99: calloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
    by 0x11E65F: near_ndef_parse_msg (ndef.c:2958)
    by 0x122A23: test_snep_dummy_req_put (test-snep-read.c:131)
    by 0x122005: snep_core_process_request (snep.c:397)
    by 0x122005: near_snep_core_read (snep.c:617)
    by 0x123042: test_snep_read_req_common.constprop.0 (test-snep-read.c:352)
    by 0x1234E0: test_snep_read_put_req_ok (test-snep-read.c:500)
    by 0x1234E0: test_snep_read_get_req_ok (test-snep-read.c:644)
    by 0x48ECDCD: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ECBCA: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2B9: g_test_run_suite (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2D4: g_test_run (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x10F784: main (test-snep-read.c:967)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-snep-read.c | 2 +-
 unit/test-utils.c     | 8 --------
 unit/test-utils.h     | 2 --
 3 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/unit/test-snep-read.c b/unit/test-snep-read.c
index 3bc1a9fad7df..a4df6ec95f8f 100644
--- a/unit/test-snep-read.c
+++ b/unit/test-snep-read.c
@@ -224,7 +224,7 @@ static void test_snep_cleanup(gpointer context, gconstpointer data)
 	__near_snep_core_cleanup();
 
 	if (stored_recd)
-		test_ndef_free_record(stored_recd);
+		__near_ndef_record_free(stored_recd);
 
 	if (ctx->test_recd_msg) {
 		g_free(ctx->test_recd_msg->data);
diff --git a/unit/test-utils.c b/unit/test-utils.c
index fe256561821f..369437421971 100644
--- a/unit/test-utils.c
+++ b/unit/test-utils.c
@@ -20,14 +20,6 @@
 
 #include "test-utils.h"
 
-void test_ndef_free_record(struct near_ndef_record *record)
-{
-	g_free(record->header);
-	g_free(record->type);
-	g_free(record->data);
-	g_free(record);
-}
-
 struct near_ndef_message *test_ndef_create_test_record(const char *str)
 {
 	struct near_ndef_message *ndef;
diff --git a/unit/test-utils.h b/unit/test-utils.h
index c371d566a573..108f2a1fb139 100644
--- a/unit/test-utils.h
+++ b/unit/test-utils.h
@@ -143,8 +143,6 @@ struct near_ndef_record {
 	size_t data_len;
 };
 
-void test_ndef_free_record(struct near_ndef_record *record);
-
 struct near_ndef_message *test_ndef_create_test_record(const char *str);
 
 #endif
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
