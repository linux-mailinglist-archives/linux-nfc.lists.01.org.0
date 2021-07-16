Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E723CB5B9
	for <lists+linux-nfc@lfdr.de>; Fri, 16 Jul 2021 12:09:09 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4E7F8100F2255;
	Fri, 16 Jul 2021 03:09:07 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id F0101100F2255
	for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 03:09:03 -0700 (PDT)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id EED82408AC
	for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 10:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626430142;
	bh=AeqbaBEvvgaioAgWHC+su0eJHvutfGr8CYeymvTyKZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=trXy6lbE3DPq2pbi4wccjZIGSlkCWYKYwpe8DShq5YzS5ZyZWRTL5i7IFbrRUNoq/
	 qMbVHWl2Yx9HCcgQk1dX2Jr+ZEyiueVHVz8N+O0uh/YRyM5ubirUrC6gBV2pvqX98V
	 +hdne+ZOj4jLHWXoDSEfJFQkVYaFpiv54yAkBxHmSYOsu8W35ybcnw1OncTN1pEIY+
	 BXg+CUWm9NdOiVA5fQRe7HTWeog9nRI2O0/Xi/jsZa4/K+ctKGvXMF1BR/0VFwTOSh
	 GhoapS/ZEDKJoQvVEQ+QXxiehKAgLLpu0Uzg6v64kODTY4O7Uuc7G+D0znxeW2nF8u
	 CABa3sxVO1Ung==
Received: by mail-ej1-f72.google.com with SMTP id jr6-20020a170906a986b029051b3550f911so3427660ejb.18
        for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 03:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AeqbaBEvvgaioAgWHC+su0eJHvutfGr8CYeymvTyKZ4=;
        b=aGjLWrSQ1k5jrHwK06kOgjlSvacYGX4zqTTyZdYNr4ubOMOZX2h+pR6eBej/p3B3aT
         rhruM4XrTDvPZQYVAKyRSlba2F0HFHwteD+N3itb72D/dXpqEhlpxoT8NACwIXrx9PCc
         HL3PWYRlfYzTo5R4CHvKhMe2yhfKbxiBIeUqEUcnZLkNCxgqdZhi1W+ISsXXc0SwauAF
         fplj+Anw4fBuK6bWbhu/24iI6V3SA7KB8WDG4lGIvnFkbCBxoBqIBE2jxPm4yqgBL2sF
         yY8HbXxtHZL6kzS8RCkkKFzIMs/K0V69SPBgIAdGUCQvow8HcMpbdI7zraeXwNJYyv+w
         etrg==
X-Gm-Message-State: AOAM530gQz/rNCHOIy0Gvi9WspE5xYBiKZ/6EYjYBOizbO1p32rd7Z6W
	E6Zbetz7G1WKxc8mKDg9j1Y7ZSNhA1w+ZYSdHmucwECKal0Oat3eAUiIQkCMvvPSLl2k7ya4f4K
	z6W5E59aWZKzB+HfH79hQdzV6HhIL2B8tUQ==
X-Received: by 2002:a50:d642:: with SMTP id c2mr13450801edj.22.1626430142392;
        Fri, 16 Jul 2021 03:09:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSybitrk/l0R28IFQ3SxyD+l2P9NYwg6Wln45/vBstfESLmGIke286iXtZDzmkTQchKOQPrA==
X-Received: by 2002:a50:d642:: with SMTP id c2mr13450781edj.22.1626430142229;
        Fri, 16 Jul 2021 03:09:02 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id u26sm2710389ejj.4.2021.07.16.03.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 03:09:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Fri, 16 Jul 2021 12:08:41 +0200
Message-Id: <20210716100844.51360-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210716100844.51360-1-krzysztof.kozlowski@canonical.com>
References: <20210716100844.51360-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: VUML24DS2MR7M5QDNOPEKSV7N5I74MNM
X-Message-ID-Hash: VUML24DS2MR7M5QDNOPEKSV7N5I74MNM
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 4/7] snep: fix double free of GSList
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/VUML24DS2MR7M5QDNOPEKSV7N5I74MNM/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

g_slist_free_full() already frees entire GSList so calling it with
g_slist_free causes a double free and memory corruption.

This can be seen with Valgrind:

  Invalid read of size 8
    at 0x48E3980: g_slice_free_chain_with_offset (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x122075: snep_core_process_request (snep.c:481)
    by 0x122075: near_snep_core_read (snep.c:620)
    by 0x122CE4: test_snep_read_req_common (test-snep-read.c:348)
    by 0x12457A: test_snep_read_get_req_frags_client_resp (test-snep-read.c:775)
    by 0x48ECDCD: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ECBCA: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2B9: g_test_run_suite (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2D4: g_test_run (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x10F982: main (test-snep-read.c:960)
   Address 0x501e198 is 8 bytes inside a block of size 16 free'd
    at 0x483DA3F: free (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
    by 0x48E3971: g_slice_free_chain_with_offset (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x122068: snep_core_process_request (snep.c:479)
    by 0x122068: near_snep_core_read (snep.c:620)
    by 0x122CE4: test_snep_read_req_common (test-snep-read.c:348)
    by 0x12457A: test_snep_read_get_req_frags_client_resp (test-snep-read.c:775)
    by 0x48ECDCD: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ECBCA: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2B9: g_test_run_suite (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2D4: g_test_run (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x10F982: main (test-snep-read.c:960)
   Block was alloc'd at
    at 0x483C7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
    by 0x48CA698: g_malloc (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48E2CF1: g_slice_alloc (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48E4407: g_slist_append (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x121AC7: snep_core_push_prepare_fragments (snep.c:377)
    by 0x121AC7: near_snep_core_response (snep.c:695)
    by 0x1224DB: near_snep_core_response_with_info (snep.c:779)
    by 0x122E41: test_snep_dummy_req_get (test-snep-read.c:172)
    by 0x121FF3: snep_core_process_request (snep.c:413)
    by 0x121FF3: near_snep_core_read (snep.c:620)
    by 0x122CE4: test_snep_read_req_common (test-snep-read.c:348)
    by 0x124449: test_snep_read_get_req_frags_client_resp (test-snep-read.c:746)
    by 0x48ECDCD: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ECBCA: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)

  Invalid free() / delete / delete[] / realloc()
    at 0x483DA3F: free (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
    by 0x48E3971: g_slice_free_chain_with_offset (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x122075: snep_core_process_request (snep.c:481)
    by 0x122075: near_snep_core_read (snep.c:620)
    by 0x122CE4: test_snep_read_req_common (test-snep-read.c:348)
    by 0x12457A: test_snep_read_get_req_frags_client_resp (test-snep-read.c:775)
    by 0x48ECDCD: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ECBCA: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2B9: g_test_run_suite (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2D4: g_test_run (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x10F982: main (test-snep-read.c:960)
   Address 0x501e190 is 0 bytes inside a block of size 16 free'd
    at 0x483DA3F: free (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
    by 0x48E3971: g_slice_free_chain_with_offset (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x122068: snep_core_process_request (snep.c:479)
    by 0x122068: near_snep_core_read (snep.c:620)
    by 0x122CE4: test_snep_read_req_common (test-snep-read.c:348)
    by 0x12457A: test_snep_read_get_req_frags_client_resp (test-snep-read.c:775)
    by 0x48ECDCD: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ECBCA: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2B9: g_test_run_suite (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2D4: g_test_run (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x10F982: main (test-snep-read.c:960)
   Block was alloc'd at
    at 0x483C7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
    by 0x48CA698: g_malloc (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48E2CF1: g_slice_alloc (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48E4407: g_slist_append (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x121AC7: snep_core_push_prepare_fragments (snep.c:377)
    by 0x121AC7: near_snep_core_response (snep.c:695)
    by 0x1224DB: near_snep_core_response_with_info (snep.c:779)
    by 0x122E41: test_snep_dummy_req_get (test-snep-read.c:172)
    by 0x121FF3: snep_core_process_request (snep.c:413)
    by 0x121FF3: near_snep_core_read (snep.c:620)
    by 0x122CE4: test_snep_read_req_common (test-snep-read.c:348)
    by 0x124449: test_snep_read_get_req_frags_client_resp (test-snep-read.c:746)
    by 0x48ECDCD: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ECBCA: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/snep.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/src/snep.c b/src/snep.c
index 737060139b07..bac93c115cb3 100644
--- a/src/snep.c
+++ b/src/snep.c
@@ -436,7 +436,6 @@ static bool snep_core_process_request(int client_fd,
 
 		g_slist_free_full(snep_data->req->fragments,
 						free_snep_core_fragment);
-		g_slist_free(snep_data->req->fragments);
 
 		g_hash_table_remove(snep_client_hash,
 						GINT_TO_POINTER(client_fd));
@@ -476,7 +475,6 @@ leave_cont:
 		/* No more fragment to send, clean memory */
 		g_slist_free_full(snep_data->req->fragments,
 						free_snep_core_fragment);
-		g_slist_free(snep_data->req->fragments);
 
 		g_hash_table_remove(snep_client_hash,
 						GINT_TO_POINTER(client_fd));
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
