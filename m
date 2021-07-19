Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EA43CD32E
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:35 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 883EC100F2275;
	Mon, 19 Jul 2021 04:09:33 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 24452100EB333
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:31 -0700 (PDT)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 27A70408B5
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692970;
	bh=oh93DlynbywoI3a9ffyxKiL+vJUpioFpD9IA1vYJDcI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=gCpNWLLpszpoTlXGGsTgnPHccVfqhv1fMP9Z11vMQkgB+ik+n+cXdIG0LQIIxsydN
	 vQF1+7BylHHWKR0B6A2w32M+lvCQT+wRUMSDmYkNWo3GvQRDu99NHUxclbIoxM6ZsM
	 s7goJCeCnNRt2rDVutH8uzBFc3YVclhsUiWODV9Zlg2OccCsilnXyd/MdqkBiF84Ij
	 vnEMtJ3SeM1VT/1mp18v/X1A2zVJ2nzcuqOaz8jvVP2FGptIX8pd5Uy6R29xWeOWv+
	 v6Spa2Olmy5ltL5JZ/unjFQbLW8Kk/HjRX++rpyudi2R5F23Mzua6t5JjJzgVDSwUu
	 BeBW7ZhFTWIeg==
Received: by mail-lj1-f198.google.com with SMTP id y7-20020a2e97870000b029018bc821fd31so9300461lji.11
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oh93DlynbywoI3a9ffyxKiL+vJUpioFpD9IA1vYJDcI=;
        b=MoLvSSkc52iMTSd3RNZbToMYX6gTEqcrG1KqWY7kjICgX2P8DZWuxoHu6ry1MHQpi+
         Z87VKkXRndwS0h1bjC4PfDTsXQTX5LHwCyRBz0OBU05WaKqdyZS79FuSizXonfj6MgIU
         Dt302lSKBqQTr5IQDTadaiRQrNhfKA9MGJhmHbxh5nsn/YecT3AvSGc42rEpunvFe+bh
         ifo5pG/6YngdUOSeT5dH7FtlHgoGQ7XcxyH80sV3KdiEl4N10REMI4Vrr44xMHwKLudY
         XhDjVH/BKc2enicFNP4HmnfFzOulR61IdjowUECTQ4tE2w47agLRSfvZFadaTAryb4ZE
         LU7g==
X-Gm-Message-State: AOAM531YVsPEnu8GPIow7y798tWrilS2/bI6ZH27U6dVwHhldF0a83d3
	QKpKOINT6aMLdHGiY4bcIfCq59Ig/9kIZQQBWOLqNFeKvc00/vAYZ7puwzZd2KXh4UfGguW3RC7
	HIRpUjFKZoHcRxR7UgbEt3IiahYzkXLErvA==
X-Received: by 2002:a05:651c:513:: with SMTP id o19mr22755588ljp.35.1626692969431;
        Mon, 19 Jul 2021 04:09:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyk0b0cOtJLPSw9vDDEQEQ2fQtw7vLwI7CDUvMnq+VVd+/zj7P0ho72XaMS+4k/367OLYEaSA==
X-Received: by 2002:a05:651c:513:: with SMTP id o19mr22755578ljp.35.1626692969283;
        Mon, 19 Jul 2021 04:09:29 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:53 +0200
Message-Id: <20210719110819.27340-48-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: XFZES6BYV4BYF3GTT3UQDUGTFG5IFINY
X-Message-ID-Hash: XFZES6BYV4BYF3GTT3UQDUGTFG5IFINY
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 47/73] unit: fix recv() and send() return types
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/XFZES6BYV4BYF3GTT3UQDUGTFG5IFINY/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The recv() and send() return negative number on errors, the return value
should be stored in integer or ssize_t.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-snep-read.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/unit/test-snep-read.c b/unit/test-snep-read.c
index 802451e8ee18..1871bac5038a 100644
--- a/unit/test-snep-read.c
+++ b/unit/test-snep-read.c
@@ -337,10 +337,11 @@ static bool test_snep_read_req_common(
 			near_server_io req_get, near_server_io req_put)
 {
 	bool ret;
-	size_t nbytes;
+	ssize_t nbytes;
 
 	nbytes = send(sockfd[client], req, frame_len, 0);
-	g_assert(nbytes == frame_len);
+	g_assert_cmpint(nbytes, >, 0);
+	g_assert_cmpuint(nbytes, ==, frame_len);
 
 	TEST_SNEP_LOG("sent 0x%02X request\n", req->request);
 
@@ -364,9 +365,10 @@ static bool test_snep_read_req_common(
 static bool test_snep_read_send_fragment(size_t frag_len,
 						uint8_t *data)
 {
-	size_t nbytes;
+	ssize_t nbytes;
 
 	nbytes = send(sockfd[client], data, frag_len, 0);
+	g_assert_cmpint(nbytes, >, 0);
 	g_assert_cmpuint(nbytes, ==, frag_len);
 
 	near_snep_core_read(sockfd[server], 0, 0, NULL,
@@ -439,7 +441,7 @@ static void test_snep_read_verify_resp(int exp_resp_code,
 		uint32_t exp_resp_info_len, uint8_t *exp_resp_info)
 {
 	struct p2p_snep_resp_frame *resp;
-	size_t nbytes, frame_len;
+	ssize_t nbytes, frame_len;
 
 	frame_len = NEAR_SNEP_RESP_HEADER_LENGTH + exp_resp_info_len;
 	resp = test_snep_build_resp_frame(frame_len, 0, 0, 0, NULL);
@@ -713,7 +715,7 @@ static void test_snep_read_get_req_frags_client_resp(gpointer context,
 	struct p2p_snep_resp_frame *resp;
 	uint32_t frame_len, payload_len;
 	bool ret;
-	size_t nbytes;
+	ssize_t nbytes;
 	uint8_t *data_recvd;
 	uint32_t offset;
 	uint32_t frag_len, info_len;
@@ -750,6 +752,7 @@ static void test_snep_read_get_req_frags_client_resp(gpointer context,
 
 	/* start receiving fragments */
 	nbytes = recv(sockfd[client], resp, frame_len, 0);
+	g_assert_cmpint(nbytes, >=, 0);
 	g_assert_cmpuint(nbytes, ==, frag_len);
 	g_assert_cmpuint(resp->length, ==, GUINT_TO_BE(ctx->req_info_len));
 	g_assert(resp->info);
@@ -829,7 +832,7 @@ static void test_snep_response_noinfo(gpointer context, gconstpointer gp)
 static void test_snep_response_put_get_ndef(gpointer context,
 						gconstpointer gp)
 {
-	size_t nbytes;
+	ssize_t nbytes;
 
 	struct p2p_snep_req_frame *req;
 	struct p2p_snep_resp_frame *resp;
@@ -855,6 +858,7 @@ static void test_snep_response_put_get_ndef(gpointer context,
 
 	/* Send PUT request with text record */
 	nbytes = send(sockfd[server], req, frame_len, 0);
+	g_assert_cmpint(nbytes, >=, 0);
 	g_assert_cmpuint(nbytes, ==, frame_len);
 
 	/* UUT */
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
