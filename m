Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C571E3CD33F
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:54 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 01846100EAB53;
	Mon, 19 Jul 2021 04:09:53 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 61D52100F2257
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:51 -0700 (PDT)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 5BBAC408B5
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692990;
	bh=nYV2pj1QjFIrDNXDKFerTjZnEuZ83nNbf8fdcrWy4OE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=Ay9i+k2Vtv5GopeCE3n8GlmNytmd33vcdHx3A7M1aKhtnqN3UkclFZjHnQ6WD2EIN
	 L6n1IrxfF3f8WDm6/hZ0YiCbRpoZm0dqZktFt3IEShUtXuW/jNNXG6FeD2cpasEljK
	 imiz+LsezyS6KwPl3hR9Y0rV6kIRQxPrKuc07MGLkF/HKkrlUuftkXTGHWEMrxhEdr
	 cxG91B9bfFWW3xLBw5oX3jlzZ3JFdV8SmZVvwzgTxr0T+BYCs3SQfVCJsWUqkBMSIj
	 SDWzCyyYOOEYa4++JFITuq2E1GrCkxzlVBh90PFNwwtBorawhM9y4EWe/+osc6IwY+
	 7FjSVlCaIMnhQ==
Received: by mail-lj1-f198.google.com with SMTP id z18-20020a2e96520000b0290178006de192so9321507ljh.3
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nYV2pj1QjFIrDNXDKFerTjZnEuZ83nNbf8fdcrWy4OE=;
        b=LEiMxP8duAvJZP3Hf+QvGNDZkNIB3IjBZIgpEZdpb5rbtN/JI79KUkWNObC89q17hg
         3fW95IGnS+aTi/1fD1I2Y+RSIxboIIFen4I+kqS8+GMRlDav02YnPg9ukQkeX2eaEJOa
         kXT77PxfxxdpPNE0svsQyc4DSgZRbXCeP4vnWWCHO2cEXGwxwaNGEFL27tyj4lyh6gl6
         /QZjrx4hMYiKfl1CVmpeOP+SakEL8NlKeqCYSzdi18Y8EBXEl9LtE9NTcphadyeq2PG6
         Bjrg09RcHHJlpetgeO/xIDHcIQISPKG7olRQdlzpu4oyWoE96ORJmUjB2TRgrEx8H4Oh
         qsmw==
X-Gm-Message-State: AOAM533SwNbUNmhELJicXOeIQ4vcZvYkzFw/o3azqQIS2sygkUHn/FK7
	isil8gMk9MMVU1TQMUpBP3Yfb8h3mTzR4YXimPA14laRv+1/l/k1orpR9sHLwqmAHdyp8otuPqE
	wzvM5cWyY8GRWhYJcZNHh1KGVPViLCCn6pg==
X-Received: by 2002:a2e:2ac5:: with SMTP id q188mr5866970ljq.168.1626692989627;
        Mon, 19 Jul 2021 04:09:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpO1JpP44nrNZSh79vz4AUo0PmBaY24/cGxTSI7gjItMxdH3ZPcczZZwqX3rkuqYJosPmvVg==
X-Received: by 2002:a2e:2ac5:: with SMTP id q188mr5866964ljq.168.1626692989472;
        Mon, 19 Jul 2021 04:09:49 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:08:10 +0200
Message-Id: <20210719110819.27340-65-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: OCWSYE5XK2F6WIMXA4OJABZZSRDX4OFF
X-Message-ID-Hash: OCWSYE5XK2F6WIMXA4OJABZZSRDX4OFF
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 64/73] unit: add few asserts in test-snep-read
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/OCWSYE5XK2F6WIMXA4OJABZZSRDX4OFF/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For consistency, check for returned values of
test_snep_build_req_frame()-like functions and __near_snep_core_init().
No functional change expected as all these are already tests.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-snep-read.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/unit/test-snep-read.c b/unit/test-snep-read.c
index 21be58785eda..6d144b22f4e9 100644
--- a/unit/test-snep-read.c
+++ b/unit/test-snep-read.c
@@ -205,7 +205,7 @@ static void test_snep_init(gpointer context, gconstpointer data)
 	if (ret != 0)
 		TEST_SNEP_LOG("set sock SO_RCVTIMEO failed");
 
-	__near_snep_core_init();
+	g_assert_cmpint(__near_snep_core_init(), ==, 0);
 
 	stored_recd = NULL;
 
@@ -499,6 +499,7 @@ static void test_snep_read_put_req_ok(gpointer context, gconstpointer gp)
 	req = test_snep_build_req_frame(frame_len, NEAR_SNEP_VERSION,
 					NEAR_SNEP_REQ_PUT, ctx->req_info_len,
 					ctx->req_info, payload_len);
+	g_assert(req);
 
 	ret = test_snep_read_req_common(req, frame_len, test_snep_dummy_req_get,
 					test_snep_dummy_req_put);
@@ -529,6 +530,7 @@ static void test_snep_read_put_req_unsupp_ver(gpointer context,
 
 	req = test_snep_build_req_frame(frame_len, 0xF8, NEAR_SNEP_REQ_PUT,
 				ctx->req_info_len, ctx->req_info, payload_len);
+	g_assert(req);
 
 	ret = test_snep_read_req_common(req, frame_len, test_snep_dummy_req_get,
 					test_snep_dummy_req_put);
@@ -562,6 +564,7 @@ static void test_snep_read_put_req_not_impl(gpointer context,
 	req = test_snep_build_req_frame(frame_len, NEAR_SNEP_VERSION,
 					NEAR_SNEP_REQ_PUT, ctx->req_info_len,
 					ctx->req_info, payload_len);
+	g_assert(req);
 
 	ret = test_snep_read_req_common(req, frame_len, test_snep_dummy_req_get,
 					NULL);
@@ -597,6 +600,7 @@ static void test_snep_read_put_req_fragmented(gpointer context,
 	req = test_snep_build_req_frame(frame_len, NEAR_SNEP_VERSION,
 					NEAR_SNEP_REQ_PUT, ctx->req_info_len,
 					ctx->req_info, payload_len);
+	g_assert(req);
 
 	/* send 1st fragment within PUT request */
 	ret = test_snep_read_req_common(req, frame_len, test_snep_dummy_req_get,
@@ -654,6 +658,7 @@ static void test_snep_read_get_req_ok(gpointer context, gconstpointer gp)
 	req = test_snep_build_req_get_frame(frame_len, NEAR_SNEP_VERSION,
 				NEAR_SNEP_REQ_GET, info_len,
 				ctx->acc_len, ctx->req_info, payload_len);
+	g_assert(req);
 
 	ret = test_snep_read_req_common(req, frame_len, test_snep_dummy_req_get,
 					test_snep_dummy_req_put);
@@ -693,6 +698,7 @@ static void test_snep_read_get_req_not_impl(gpointer context,
 	req = test_snep_build_req_get_frame(frame_len, NEAR_SNEP_VERSION,
 			NEAR_SNEP_REQ_GET, ctx->req_info_len, ctx->acc_len,
 			ctx->req_info, payload_len);
+	g_assert(req);
 
 	/* call snep_core_read with NULL req_get handler */
 	ret = test_snep_read_req_common(req, frame_len, NULL,
@@ -748,6 +754,7 @@ static void test_snep_read_get_req_frags_client_resp(gpointer context,
 	req = test_snep_build_req_get_frame(frame_len, NEAR_SNEP_VERSION,
 				NEAR_SNEP_REQ_GET, info_len,
 				ctx->acc_len, ctx->req_info, payload_len);
+	g_assert(req);
 
 	/* send GET request */
 	ret = test_snep_read_req_common(req, frame_len, test_snep_dummy_req_get,
@@ -757,6 +764,7 @@ static void test_snep_read_get_req_frags_client_resp(gpointer context,
 
 	frame_len = NEAR_SNEP_RESP_HEADER_LENGTH + payload_len;
 	resp = test_snep_build_resp_frame(frame_len, 0, 0, 0, NULL);
+	g_assert(resp);
 
 	/* start receiving fragments */
 	nbytes = recv(sockfd[client], resp, frame_len, 0);
@@ -778,6 +786,7 @@ static void test_snep_read_get_req_frags_client_resp(gpointer context,
 	frame_len = NEAR_SNEP_REQ_PUT_HEADER_LENGTH;
 	req = test_snep_build_req_frame(frame_len, NEAR_SNEP_VERSION,
 					client_resp, 0, NULL, 0);
+	g_assert(req);
 
 	ret = test_snep_read_req_common(req, frame_len, NULL, NULL);
 	g_free(req);
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
