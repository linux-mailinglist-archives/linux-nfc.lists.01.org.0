Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6CC3CD330
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:37 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id AF9E3100EB353;
	Mon, 19 Jul 2021 04:09:35 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 8AC4B100F227A
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:33 -0700 (PDT)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 8C6DA408B5
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692972;
	bh=Mfxr7CVbvQWZa4c9+yS4o1QAnSMbi2fHH2VqfyViLWA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=AXCCTPJRRMe86GIV/V1HpcmY6yyVaZVmNSr1Qy9VnXIHXkW00UEm1/21eGhtzPY12
	 Ws8kLcTvr4YVU7N4HZUcVNTrLwEVMu85ObdGKEz6nXugf7evBWSs3VmU/WXXyDtmMl
	 ntv2wxClrpclqQ+4Al04ZXXSIgiclim/iAipmbXRUZjicm/GbeM0ioRPrV//waso+h
	 b82RPelNwr620oaNOtGUtWa973mqdnoNCwtU7NkgY8E9/1SNLsRqDYi/Nyp8mNJvNn
	 glS3R5UojR1HFz9imTFFFT72X0RdTyh3qbPQTJCW0Gg3vDGoRfJL+kIyDR9bFGxO2j
	 aqZ3I8d4mD6RQ==
Received: by mail-lj1-f198.google.com with SMTP id 5-20020a05651c12c5b0290193ec0f79ceso5912812lje.20
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mfxr7CVbvQWZa4c9+yS4o1QAnSMbi2fHH2VqfyViLWA=;
        b=B/v3u/iNiKTOA57ayxpGutA6s7GNwbz2DqF19KQcCWSStkaUsfoeNnJZO0IvKMDKJ1
         mJ5JonJQGRG9DSQxqijxAlJZqcexdPS17dKx6NFsz84i+JrmfDB3E55u9OBh7AF7qt8f
         ubUSqEXyVWVx0jiIXE+pj9iWSX7ZSwiJJjNJ44V0Rye3EC+w14gMkwQu29J6xClwDERJ
         pJZbueJV75ZY5K8IzAAXvaG51SrLrP+HCNo4Z765f9bIDR8vVubNb3eJ+dy0/17AX2Dt
         gisi1wn1OTw2RsKbT2QXJ2mmBKG3MHS4lKvUfyocoicu8ewBPQMOvXCjX2aVooynEMLw
         rBJQ==
X-Gm-Message-State: AOAM531cug+7zyA+NtmWk7vZiQOHLl4dqGCAR8/56+HafMxSNGgs0ZOF
	vDhMeAj9dVUEN9Hs+kEXDe4RGXP0FLmjFpj2hPDBqThQYny6DMVPQTpC1YVGvL4q8Oz08ywADXy
	KiVQ2YjltyBNmOKtyO4HMpE3H7XxoorxHzQ==
X-Received: by 2002:a19:6a10:: with SMTP id u16mr17676432lfu.107.1626692971750;
        Mon, 19 Jul 2021 04:09:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKY4nVZPetyRGZRLZ81BcZ6qaIZQ07EQmrES3ulYcGRp67EZKuClPfMJV6Syo1y1/nwS31XA==
X-Received: by 2002:a19:6a10:: with SMTP id u16mr17676424lfu.107.1626692971592;
        Mon, 19 Jul 2021 04:09:31 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:55 +0200
Message-Id: <20210719110819.27340-50-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 3NQPNLEYU6AZCOY7TPRVULIHSIODYWDL
X-Message-ID-Hash: 3NQPNLEYU6AZCOY7TPRVULIHSIODYWDL
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 49/73] unit: use g_assert_cmpmem()
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/3NQPNLEYU6AZCOY7TPRVULIHSIODYWDL/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Comparisons of simple values should use test macros instead of checking
standard library call return value.  This prints more information on
failure - the actual values used for comparisons.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-ndef-build.c | 6 +++---
 unit/test-ndef-parse.c | 2 +-
 unit/test-snep-read.c  | 9 +++++----
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/unit/test-ndef-build.c b/unit/test-ndef-build.c
index bf77fdd42165..44dce4bf9aef 100644
--- a/unit/test-ndef-build.c
+++ b/unit/test-ndef-build.c
@@ -64,7 +64,7 @@ static void test_ndef_text_build(void)
 
 	g_assert(ndef);
 	g_assert_cmpuint(ndef->length, ==, ARRAY_SIZE(text));
-	g_assert(!memcmp(ndef->data, text, ARRAY_SIZE(text)));
+	g_assert_cmpmem(ndef->data, ARRAY_SIZE(text), text, ARRAY_SIZE(text));
 }
 
 static void test_ndef_wsc_with_passphrase_build(void)
@@ -75,7 +75,7 @@ static void test_ndef_wsc_with_passphrase_build(void)
 
 	g_assert(ndef);
 	g_assert_cmpuint(ndef->length, ==, ARRAY_SIZE(wsc));
-	g_assert(!memcmp(ndef->data, wsc, ARRAY_SIZE(wsc)));
+	g_assert_cmpmem(ndef->data, ARRAY_SIZE(wsc), wsc, ARRAY_SIZE(wsc));
 }
 
 static void test_ndef_wsc_with_out_passphrase_build(void)
@@ -86,7 +86,7 @@ static void test_ndef_wsc_with_out_passphrase_build(void)
 
 	g_assert(ndef);
 	g_assert_cmpuint(ndef->length, ==, ARRAY_SIZE(wsc_wo));
-	g_assert(!memcmp(ndef->data, wsc_wo, ARRAY_SIZE(wsc_wo)));
+	g_assert_cmpmem(ndef->data, ARRAY_SIZE(wsc_wo), wsc_wo, ARRAY_SIZE(wsc_wo));
 }
 
 static void test_ndef_wsc_with_out_ssid_build(void)
diff --git a/unit/test-ndef-parse.c b/unit/test-ndef-parse.c
index a4f1ab3d0df4..96288f29f44d 100644
--- a/unit/test-ndef-parse.c
+++ b/unit/test-ndef-parse.c
@@ -427,7 +427,7 @@ static void test_ndef_ho_hs_bt(void)
 	ac = ho->ac_payloads[0];
 
 	g_assert_cmpuint(ac->cdr_len, ==, 1);
-	g_assert(memcmp(ac->cdr, "0", ac->cdr_len) == 0);
+	g_assert_cmpmem(ac->cdr, ac->cdr_len, "0", sizeof("0"));
 
 	records = g_list_next(records);
 	record = records->data;
diff --git a/unit/test-snep-read.c b/unit/test-snep-read.c
index 1871bac5038a..5511fecf5c17 100644
--- a/unit/test-snep-read.c
+++ b/unit/test-snep-read.c
@@ -456,7 +456,8 @@ static void test_snep_read_verify_resp(int exp_resp_code,
 	g_assert_cmpuint(resp->version, ==, NEAR_SNEP_VERSION);
 	g_assert_cmpuint(resp->response, ==, exp_resp_code);
 	g_assert_cmpuint(resp->length, ==, GUINT_TO_BE(exp_resp_info_len));
-	g_assert(!memcmp(resp->info, exp_resp_info, exp_resp_info_len));
+	g_assert_cmpmem(resp->info, GUINT_FROM_BE(resp->length),
+			exp_resp_info, exp_resp_info_len);
 
 	g_free(resp);
 }
@@ -786,8 +787,8 @@ static void test_snep_read_get_req_frags_client_resp(gpointer context,
 					data_recvd + offset);
 
 		/* verify data */
-		g_assert(!memcmp(data_recvd, ctx->req_info,
-				ctx->req_info_len));
+		g_assert_cmpmem(data_recvd, ctx->req_info_len, ctx->req_info,
+				ctx->req_info_len);
 	}
 
 	g_free(data_recvd);
@@ -891,7 +892,7 @@ static void test_snep_response_put_get_ndef(gpointer context,
 	g_assert_cmpuint(resp->response, ==, NEAR_SNEP_RESP_SUCCESS);
 	g_assert_cmpint(resp->length, ==, GUINT_TO_BE(ndef->length));
 	g_assert_cmpuint(resp->length, ==, GUINT_TO_BE(ndef->length));
-	g_assert(!memcmp(resp->info, text, ndef->length));
+	g_assert_cmpmem(resp->info, GUINT_FROM_BE(resp->length), text, ndef->length);
 
 	g_free(req);
 	g_free(resp);
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
