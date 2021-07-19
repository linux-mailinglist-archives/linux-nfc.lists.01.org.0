Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF88F3CD339
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:47 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 60DFE100F2257;
	Mon, 19 Jul 2021 04:09:46 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 76515100F227C
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:44 -0700 (PDT)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 78BBD40207
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692983;
	bh=1wHi5tZ+98Y3G0pFyPOGYrAV+hnDbHNAiwblLCoyzWs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=TQjXRGQZcSv3iGGFCz5sjRgV8D7CI2KXEP0qaym/iQ64xYvjY9SEBkLGdnMeXwOqn
	 6WVWviVZ/BxKsW9FD7TCS5y5ojB/3jlUMfq45+0ekQTYU84hs4IJOCcxl4nxcdAt2a
	 vwEsTa9xzKKq97TJ6xpP6VeVxNuYAEIjrfYZtSKKCkF7Zo6x7MFQNrqFKuVrrl7TtK
	 dRH8R+6r1v/vltfdkqxFcyo7AeyNdwA+9ZpGjMZ6i5ikgcOrav9E1EzR409yxjS1sJ
	 rTXvLzAKmTlML3knQWtfEdT8yNETfQFsnYsfzDjAAIh0fNcw3/CXEGTjmA8/i3dE/f
	 BAGHb54rpaOrw==
Received: by mail-lj1-f199.google.com with SMTP id j2-20020a2e6e020000b02900f2f75a122aso9283791ljc.19
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1wHi5tZ+98Y3G0pFyPOGYrAV+hnDbHNAiwblLCoyzWs=;
        b=FqvV51NfQ9LdDQVdD4oTyMZYr40JEaf0h57CH/5v7pdrML3MvSoDM0Q+NkhssXJu9k
         kVRHWKSis+VNEU+GhCswU+uJjTqipIYbxPBUiJw4iv4RI3Wov98bzz6IkU0eRSIV+nJw
         u/cmjUR7LPY+ubr/QqyodyusTxuh8pNuceJjEgWId5EO8b4OXUWrVXl+8sMw0mNFbpoj
         GZKLdi20UJ3X3A/5Y7lYvTVvwhmpWMBhUncyuj0N5D4kQkXNgBJ+acEe2j0t8mdCADNb
         IbaeIS5I5uz7QAdSygU2YAGlSoiVFrIzxay/0xfIhrLzxE428BI0UHA1HRkVKKfJE2eg
         MEpg==
X-Gm-Message-State: AOAM532eNR8H+x4ZYiv1q5yBChgzncRCMdggCShUFFFLw4TeTE+xe7fA
	Z2J6YOTwbBKKqIZ70HLyggRQabCV7qc1FtFPIs0V4548E8AYPpFiicvxtVGJIbFMy4vhI006o0L
	nNDDp1Nd5NEOAqfxuTmsR5VsKcSNdf1D4Dw==
X-Received: by 2002:a05:6512:3b20:: with SMTP id f32mr18317240lfv.279.1626692982734;
        Mon, 19 Jul 2021 04:09:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYPeW0mB9+BWnsPc1H1RuHnW/2gn4az+HtROj9m0jRe1wLeDuldVPHi8syb88xzdUxaO2/aQ==
X-Received: by 2002:a05:6512:3b20:: with SMTP id f32mr18317233lfv.279.1626692982536;
        Mon, 19 Jul 2021 04:09:42 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:08:04 +0200
Message-Id: <20210719110819.27340-59-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: AJVYZ6AFRM43V7A4VUO6OWLV6GRU2M2D
X-Message-ID-Hash: AJVYZ6AFRM43V7A4VUO6OWLV6GRU2M2D
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 58/73] unit: fix record memory leak in test-snep-read
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/AJVYZ6AFRM43V7A4VUO6OWLV6GRU2M2D/>
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
index a463c1df30b8..f64ef0c6fce2 100644
--- a/unit/test-snep-read.c
+++ b/unit/test-snep-read.c
@@ -224,7 +224,7 @@ static void test_snep_cleanup(gpointer context, gconstpointer data)
 	__near_snep_core_cleanup();
 
 	if (stored_recd)
-		test_ndef_free_record(stored_recd);
+		__near_ndef_record_free(stored_recd);
 
 	if (ctx->test_recd_msg)
 		near_ndef_msg_free(ctx->test_recd_msg);
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
