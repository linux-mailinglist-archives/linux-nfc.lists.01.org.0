Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D85483CB5BC
	for <lists+linux-nfc@lfdr.de>; Fri, 16 Jul 2021 12:09:13 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 9014C100F2255;
	Fri, 16 Jul 2021 03:09:12 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id ECE32100EB35A
	for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 03:09:09 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id DF898408AC
	for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 10:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626430148;
	bh=GSRPfQR8I+lyy0FN8V3AJPSy72S1DdT6Md8zcP3JVLs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=uWSUrwD9bZMQu9dMkmetfpydJA4wmcBieLel5CAg5usuNtsi2R4BhS+/7tK2WwHlC
	 nK9LXXt8E1kbEnLU0D3TnGwGIpvQQhUzOHxbrV6l2roviQ1tGRi1qjzMXOqGC72b+g
	 uHlF0jPk+KXadPiZW8goAdNYA7Ln+AgPhD0wx8WbS+NfgK7Jj6acPk54Rbm1CztXvj
	 jXJoROJDzhAQ6CxeRSNDMSiwHp0LC1vhmYAKERLVddEgo4Pt+NdgH6LUW0+BK81OtL
	 UFpWCBC/Fcn628G/XT4FsttlaayWSrFFi+dfkMVoe6uksXvZWZNhLDzkQF7e3OKG1O
	 CejoEOngtGy5w==
Received: by mail-ed1-f70.google.com with SMTP id v2-20020a50c4020000b02903a6620f87feso4597073edf.18
        for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 03:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GSRPfQR8I+lyy0FN8V3AJPSy72S1DdT6Md8zcP3JVLs=;
        b=fkCBWtMXS8oaN/6Il3VXacer5MSU+4dQwq9fbFrZpX4Q+nOw4o1i0J7PebO+LOvgcZ
         W51RVYkwLzg984iI4SHvduOYlDMYdM2pdHcuYNEnmZ7s7WZklrVkwSUASglNxU4ed73w
         F2p68ysgO0C4iDKovNMXdfjTelzzo35Sn0fBz/sxyGxWJe+Bl6I0eFIXO3WKCavc+6Fq
         rkmMjSYbXQDfFjvF+b9o4HF/TFV2YI4kS8Oq60ScNlLGPmMCm7300NJ8Y3tGhheo23y4
         MFSaBsXtezlpGuYH/Ttqn35JvbxUAmFb7f55lcYKQNePetmjQ1ZDcgoxFqXVhsJ7tvqh
         eOsA==
X-Gm-Message-State: AOAM5304w6L8EOT9rzDd9sj9r5ztF14LBG1dx7yJYNV6VdQWAbqgQDAB
	DU8BldoGfZqjc33NXVIheBPgb5d4/3+CrWTrFIIcRY6Q9/cQq8Or4ZFzUIQa+0CTVaByhVAPZ5e
	HnSQKLLaNsu2pemmNQyhYW4ZSyIzCauCitg==
X-Received: by 2002:a17:906:9c84:: with SMTP id fj4mr10851510ejc.438.1626430148394;
        Fri, 16 Jul 2021 03:09:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYy+stmKX/H+vtiHVG6caR/nnXj5CEpS2zuhUfqbb1UkSiicR0T+EGFeQfXpPBQgtv1eKkuA==
X-Received: by 2002:a17:906:9c84:: with SMTP id fj4mr10851503ejc.438.1626430148259;
        Fri, 16 Jul 2021 03:09:08 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id u26sm2710389ejj.4.2021.07.16.03.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 03:09:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Fri, 16 Jul 2021 12:08:44 +0200
Message-Id: <20210716100844.51360-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210716100844.51360-1-krzysztof.kozlowski@canonical.com>
References: <20210716100844.51360-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: WLFGJBFAWYGUT5TYYURXLXKDM6CRAAVZ
X-Message-ID-Hash: WLFGJBFAWYGUT5TYYURXLXKDM6CRAAVZ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 7/7] unit: fix records GList memory leak in test-snep-read
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/WLFGJBFAWYGUT5TYYURXLXKDM6CRAAVZ/>
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
index a4df6ec95f8f..2e977f749610 100644
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
