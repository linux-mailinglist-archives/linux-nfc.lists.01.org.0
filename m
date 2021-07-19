Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF79F3CD33A
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:48 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 70A95100EAB47;
	Mon, 19 Jul 2021 04:09:47 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 85D9D100EAB44
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:45 -0700 (PDT)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 88273409F6
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692984;
	bh=uE9gvSukCm0JMgVQLZQoHcKdaYWnFCEvuOoYT2LkZwM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=QffplDPML8EK/oSnBme8yFJVgwmm5kWfMztmpzR12321xVbTd/7KPA9KQgqeklWfG
	 vit4Y2aTJd1ZFeRuqW/1C7WC5V332Kszve060XEjqDgfX44IQ5oet2szWJJt2JnvYI
	 qHzD5/kkZvguBDTx7TeNuo3QLxtSC6xsT0JEziMuvyBBFaLQluSblIgL87x013VJhN
	 3bIAVY07O6YNBHBsr054+tAatL8VU4wx6ZpfbK8GmAmLtKJ2a0VLslK8n7ZXgVOKnt
	 bAI8FpnYZuQubb9p+coOElGHSkd/jvCCYOc1vY3NRQX6V/3hS6HVkstxlDflxdwAsJ
	 4fXJycvf/RpAw==
Received: by mail-lj1-f198.google.com with SMTP id y7-20020a2e97870000b029018bc821fd31so9300753lji.11
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uE9gvSukCm0JMgVQLZQoHcKdaYWnFCEvuOoYT2LkZwM=;
        b=rFKOxYLoKsbwjfig9WLRASuGXmGgRUpn569OViROq+pIZrAoaizqweoH7Y+Gfa5QT2
         o72TwOVBOqcxoCMgkYXLWgENC+8TZMieuI8co1obwqMGQkQG7V6J853mVdh7znh3+d+J
         S1ElUdWX+x64WfTcdrtBU4VNHPPYiNC5P/QPQmn9035LdTFfe+jwXYq9sAMuxfG0mgYh
         xv0NrCaZVFAM0FD+khYbuhf7yyaVuQQ0QrB1WImfQ2TdE7Di+hs/V8kbvs0850ARaU18
         2mzykTKOYdsBpOwlTaAanAfRWkA47jK7xmBt0yRkyRxI+DOP9iUnZM23M1wKvSuIvK99
         mP+A==
X-Gm-Message-State: AOAM533GNFsqTBAMrx9OzLeGoF7nDSJM08AnqWyzbP8NMjk7QTYyIOcF
	b60GpZn1saEj10ToIRR3lYGcEx0z7OrZXqWZs9rSyKxnsw46iimcCslvyQb+dPcnm4xoiXZQ/bh
	qwyxCkVp6V7w8hyU99Qypa0qY+kzAvSEZNQ==
X-Received: by 2002:a2e:85d8:: with SMTP id h24mr15968325ljj.365.1626692983784;
        Mon, 19 Jul 2021 04:09:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxA8cXd6WymJiooX8RugZPK9/CW6x1xK75KQYQB3zXXMnvf3QFY6Qap10MIZ2N7mvfVuZgLTA==
X-Received: by 2002:a2e:85d8:: with SMTP id h24mr15968311ljj.365.1626692983642;
        Mon, 19 Jul 2021 04:09:43 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:08:05 +0200
Message-Id: <20210719110819.27340-60-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: SKSE5T7ONNFFUVBXCSLZDXM2ETABWEPX
X-Message-ID-Hash: SKSE5T7ONNFFUVBXCSLZDXM2ETABWEPX
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 59/73] unit: fix records GList memory leak in test-snep-read
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/SKSE5T7ONNFFUVBXCSLZDXM2ETABWEPX/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The test_snep_dummy_req_put() stores one record in global stored_recd
pointer, so the GList itself should be freed.  This fixes Valgrind
warning:

  24 bytes in 1 blocks are definitely lost in loss record 21 of 30
    at 0x483C7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
    by 0x48CA698: g_malloc (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48E2CF1: g_slice_alloc (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48BFF07: g_list_append (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x11E68A: near_ndef_parse_msg (ndef.c:2964)
    by 0x122A23: test_snep_dummy_req_put (test-snep-read.c:131)
    by 0x122005: snep_core_process_request (snep.c:397)
    by 0x122005: near_snep_core_read (snep.c:617)
    by 0x123042: test_snep_read_req_common.constprop.0 (test-snep-read.c:352)
    by 0x1234E0: test_snep_read_put_req_ok (test-snep-read.c:500)
    by 0x1234E0: test_snep_read_get_req_ok (test-snep-read.c:644)
    by 0x48ECDCD: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ECBCA: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2B9: g_test_run_suite (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-snep-read.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/unit/test-snep-read.c b/unit/test-snep-read.c
index f64ef0c6fce2..128937ed910f 100644
--- a/unit/test-snep-read.c
+++ b/unit/test-snep-read.c
@@ -142,6 +142,7 @@ static bool test_snep_dummy_req_put(int fd, void *data)
 	g_free(nfc_data);
 
 	stored_recd = records->data;
+	g_list_free(records);
 
 	TEST_SNEP_LOG("\t\tdummy_req_put STORED REC data=%p length=%zu\n",
 			stored_recd->data, stored_recd->data_len);
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
