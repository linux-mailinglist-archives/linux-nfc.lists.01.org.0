Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 965163CD32B
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:33 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 47E45100EB333;
	Mon, 19 Jul 2021 04:09:32 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 3D1A1100EB32F
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:27 -0700 (PDT)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 3FB1240325
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692966;
	bh=19y7Le2BxMbMSWdWjGtGkr07bFAVESWjj4f9Q3FC7wo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=MrMV1oi1xqKzQJjxHI93CJpspv4HTpkgEAFd5H+DBBfpuUsbZ1NsX2F6Pg1KiHN+E
	 KrGAE17/8VCfj/iGTFvOpiNbVmN50r+K2jf+HAkJpYkZtKAR+Db29rBSo/hvyCvyWa
	 o/Y8Ed/xVLRiv3ejlEiogHrOz+PnrTU3EZB5R6fgPQo7Op6DHdDIjQyVCF+kvq581/
	 jeEhFmFh5l1jmuAhm+y4MCXcgVGctwZwI1l4OuKwo1zvay0LnTMQzec5x+pmb96hX6
	 CJveWPWu74YXdBGUNr2bKTPgzwpG1f1UVM+hI1t4qKBg6CCPJx5EYq+4IPlsu24x4m
	 oXvfXBN5OLuKQ==
Received: by mail-lj1-f199.google.com with SMTP id y7-20020a2e97870000b029018bc821fd31so9300376lji.11
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=19y7Le2BxMbMSWdWjGtGkr07bFAVESWjj4f9Q3FC7wo=;
        b=qs2l0iBKzvpyYWswVA1/ULEQMVnduMznCdbSLvDxaCqW3rZhXCJyvtmBruB3Groyqe
         1kjq/ZDaC4BbE2H0KVTGs2QikOdKxVo32jwJPCT8NzDv0QR+uORUm8pkHlTL5HjLhm1t
         ENHPUBN3nnJ8b9/YeT/4UOski3lECwGuukZfg0K28cXTmHnH8BReK4Q9Zh6k/r8Gnaog
         CSx07MsrXefFukmtrim0XAM4W/uhNNwaH4VhBdegetG3c9aJsbWjdLSM8TIo/hNxcbe4
         yZ6ldV8uh3lLMEXUSvhpqWQNdaDLvH15tXuSYdX4TDsQM1G1Acm+gEdgIcrHy8gW/5Yg
         Z6lg==
X-Gm-Message-State: AOAM533/bHhcFDWhvJ5FZuRfSeP/B4lXyT0L9yGrY5QbpxdSYrw2Fm0b
	401UW2527DxmJh9FLvhK4ynrLyGLZbLUycG1NzwCoaud8eq/9uyHWoZ2JgfcYXic5L1gZtCqotA
	+u1VJe7xEOuLkNxPF8BvgC4kgOrNCStatHg==
X-Received: by 2002:a2e:a484:: with SMTP id h4mr14556264lji.180.1626692965538;
        Mon, 19 Jul 2021 04:09:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxO9xsJq1PewuZdIB0MAwqSc1FiEPoUP6eyXmC3wBUbgpOHflGcT/nEzOq2pDNvfIDv6/EjZg==
X-Received: by 2002:a2e:a484:: with SMTP id h4mr14556255lji.180.1626692965402;
        Mon, 19 Jul 2021 04:09:25 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:50 +0200
Message-Id: <20210719110819.27340-45-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: YKPKQVOD677BHX7JO3ZHYM2VFI47RL3D
X-Message-ID-Hash: YKPKQVOD677BHX7JO3ZHYM2VFI47RL3D
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 44/73] snep: fix fragmented response memory leaks
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/YKPKQVOD677BHX7JO3ZHYM2VFI47RL3D/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sending long response might cause frame fragmentation and
near_snep_core_response_with_info() does not free such 'struct
p2p_snep_put_req_data'.  It looks like freeing the fragmented response
is task for snep_core_process_request as it already frees the fragments.
Add also freeing the response itself to fix Valgrind (and ASAN) reported
memory leaks:

  $ valgrind  --leak-check=full unit/test-snep-read

  80 bytes in 2 blocks are definitely lost in loss record 55 of 60
    at 0x483ED99: calloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
    by 0x122496: near_snep_core_response_with_info (snep.c:762)
    by 0x122E21: test_snep_dummy_req_get (test-snep-read.c:179)
    by 0x121FF3: snep_core_process_request (snep.c:411)
    by 0x121FF3: near_snep_core_read (snep.c:616)
    by 0x122CC4: test_snep_read_req_common (test-snep-read.c:355)
    by 0x124792: test_snep_read_get_req_frags_client_resp (test-snep-read.c:760)
    by 0x48ECDCD: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ECBCA: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2B9: g_test_run_suite (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2D4: g_test_run (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x10F982: main (test-snep-read.c:976)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/snep.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/src/snep.c b/src/snep.c
index bac93c115cb3..d4692c522df3 100644
--- a/src/snep.c
+++ b/src/snep.c
@@ -436,6 +436,8 @@ static bool snep_core_process_request(int client_fd,
 
 		g_slist_free_full(snep_data->req->fragments,
 						free_snep_core_fragment);
+		g_free(snep_data->req);
+		snep_data->req = NULL;
 
 		g_hash_table_remove(snep_client_hash,
 						GINT_TO_POINTER(client_fd));
@@ -475,6 +477,8 @@ leave_cont:
 		/* No more fragment to send, clean memory */
 		g_slist_free_full(snep_data->req->fragments,
 						free_snep_core_fragment);
+		g_free(snep_data->req);
+		snep_data->req = NULL;
 
 		g_hash_table_remove(snep_client_hash,
 						GINT_TO_POINTER(client_fd));
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
