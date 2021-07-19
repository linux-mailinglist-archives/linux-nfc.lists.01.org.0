Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE183CD32A
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:29 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 35D15100EB331;
	Mon, 19 Jul 2021 04:09:28 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 3C66C100EB345
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:26 -0700 (PDT)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 3C44040624
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692965;
	bh=AeqbaBEvvgaioAgWHC+su0eJHvutfGr8CYeymvTyKZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=h0Zz2Jv83YFbkMwQfvsz7no+8JGIqD5XCJxgWRnl94Hui9SJnI3ZWJFMmpBYjBkkB
	 5JOd5TPrHneZw39bRs9OlphLVklwM4ySYQ415C2GUsy8NQKQLhM34jnj/lnF5MXPli
	 aHsx0mlC4HcD0IqpXcF7fx+POOLBl+tsubQZRS1drRx4xSQ33hyTMMi5gvCD88aLRp
	 siLOOZcQJPkIgYEG48t8cgS3TLrNWgQYG0zTrjg1II18wnDrBMlkESj5hsk9KU8qdF
	 m+st9L2JoQTZzQQ0YrbicqnjpZdaYeOZNjnnQo+ePYWzpqbd5Fg3Fwo2slycBl1twE
	 5WcegJdAlEHHg==
Received: by mail-lj1-f198.google.com with SMTP id y11-20020a2eb00b0000b0290194aa1ae3efso5326547ljk.18
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AeqbaBEvvgaioAgWHC+su0eJHvutfGr8CYeymvTyKZ4=;
        b=slWbFRzugN7rm76Cz7t9gccHN6NVGcxDlWdmZfBcdam2V7Ic0Mrk0f4LLiXMfQ9FIH
         kj3POyK+ObrBl4gBesE+Z5Zd4vb/0ggXSN3rLzIFAxQ+7Vuud5hvfsX+gfaKQ4UWUImq
         KRCd48YK2W4CHyuUPk+XangUT0zIUIPBIQZenYyXDZDeTfogGVFsWdvtTXVLX0F1JUIn
         3HHfhG1I7heJW7ChoUPbg2G/INdKHlZz1hYKN/omUKoGxyjoDPcGMYNGenj9Tnp8uQKS
         jMnoH+bXFSROEKXjurhZR6yWm3d9DpzQ/w1og7/omZUY61kS/L7+9s75J9mexBEvTjp2
         C6qw==
X-Gm-Message-State: AOAM532GyyzENuvnhkR/6usjYMDWokcXbQU0xrr52h3BRYYsb8jEUiI9
	yAhsUPqugHwbpzdX94K/HcUcRs4GQ480/6wbtMvLBYHeF2HDB/VW3OcRX6fIsdoEfSbLYS5YzfR
	B+X2EaHDGeBZR4NJyx2W2b86vjEV34bMjbA==
X-Received: by 2002:ac2:4a8c:: with SMTP id l12mr18379658lfp.657.1626692964240;
        Mon, 19 Jul 2021 04:09:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4GTe3n2UtexSdsHf5UZw1bykoEwqS0roZHCOyT+VHQ3Iojq7Och857754k47NFWqo3g8gXg==
X-Received: by 2002:ac2:4a8c:: with SMTP id l12mr18379647lfp.657.1626692964028;
        Mon, 19 Jul 2021 04:09:24 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:49 +0200
Message-Id: <20210719110819.27340-44-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: WOU6Z5VT4WUSHNPLJXJS44OYE6ACAWGM
X-Message-ID-Hash: WOU6Z5VT4WUSHNPLJXJS44OYE6ACAWGM
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 43/73] snep: fix double free of GSList
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/WOU6Z5VT4WUSHNPLJXJS44OYE6ACAWGM/>
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
