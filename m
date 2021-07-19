Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 425F23CD337
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:45 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 40866100F226E;
	Mon, 19 Jul 2021 04:09:43 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 1D8E8100EAB4B
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:42 -0700 (PDT)
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 1C6E840334
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692981;
	bh=Yug3gXn0YNQ7m5uJ/f7qBoB6X4J20MEB2ZyAMoJNO10=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=dRBAAJ8o0UsyqVo8ql8tT7o5k6ED4IN1UMwY170ulHGTXRZ4QKiBgohSa3ifGyXfQ
	 1cxn0KQBXtJhWC7UpZkgkGiPdiGpSecorJ2TvpY9g958g+6845L+JkKaSlVWToFDQC
	 7YIgMDEPWV8i0mnB1Tv/cwfDERosXz90JK99ActBzWXkC3FdumwzglyrPOQgCo2CnZ
	 9awQ0YnUL6c9xjwKkSrJggR/U/+5/imtTQcxeEEqLyfolTyN7K34vHD+MPe4saZwlo
	 /hwquyY4A97PoZ5+RtAQYiBTkP9EV+gUQGvWKIbC76gyGVbeIz4he8sNwvgDfXrrZT
	 1tjJIxCcmUjzg==
Received: by mail-lj1-f197.google.com with SMTP id d1-20020a2e81010000b0290196925bc674so3206675ljg.10
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yug3gXn0YNQ7m5uJ/f7qBoB6X4J20MEB2ZyAMoJNO10=;
        b=qzxGwkAMiKX+E9SDUqBZWgTl3tWrxlXetvEDYpGcvk/8gdSxB9iEOW2JOppB5cUD/D
         EYCGyLK3GoTEb0Er19CMb7VmGyAgRuap6ckbaklK0juOaKNjA16WgLYp9+ph8eVLTXJy
         16G81JdZ3Ailu5YmQqMZLZofXZzFioC5RyOruf6yJTVLtxepoD21Ccp85ZRNjP0Uck5I
         VBZCzutQFDXVz6lbESLPcb7YfYyjQI7maqT2wEQp1i7dkGW7niRNc923qgiXDh3XEBVH
         2taMRQYMNvKoo5t0LNd1gd806dm+4Pvpm+LyBD1GVdHm174cEF47KBp5igy1a/fsO/1p
         6nVw==
X-Gm-Message-State: AOAM532mVtZvEaMp9EBzayjasyOtgE9z0HoXV5mpdyag2/nLvg0pTQud
	d/pgEFgPRoEV/8H2KEs4lgpzE2TF5oHAovh0izuGHGhUF1RqgWk+gjaoDvZ5PkIY4Dw31C1B5+0
	EIWw0hRlpF/B49KNFbgcCxPgxUqpepG9HOQ==
X-Received: by 2002:a05:6512:990:: with SMTP id w16mr2536692lft.346.1626692980357;
        Mon, 19 Jul 2021 04:09:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZA7YZKnuYmMc/QbWQ/BIB3JlWZPQoXfcMCz8/j7Bwb9P9reOe1gJIvUoR96kbMSb5hPfr7A==
X-Received: by 2002:a05:6512:990:: with SMTP id w16mr2536682lft.346.1626692980210;
        Mon, 19 Jul 2021 04:09:40 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:08:02 +0200
Message-Id: <20210719110819.27340-57-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: UH6THIBLPA45RL6Z2N6IJYPNH7N5CO3T
X-Message-ID-Hash: UH6THIBLPA45RL6Z2N6IJYPNH7N5CO3T
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 56/73] unit: fix memory leaks in test-ndef-build
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/UH6THIBLPA45RL6Z2N6IJYPNH7N5CO3T/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

test-ndef-build.c was not freeing the ndef records it got leading to
memory leaks.  Report by valgrind:

  (24 direct, 15 indirect) bytes in 1 blocks are definitely lost in loss record 24 of 38
    at 0x483ED99: calloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
    by 0x11C176: ndef_message_alloc_complete.constprop.0 (ndef.c:1654)
    by 0x11FEC5: ndef_message_alloc (ndef.c:1760)
    by 0x11FEC5: near_ndef_prepare_text_record (ndef.c:3142)
    by 0x121676: test_ndef_text_build (test-ndef-build.c:63)
    by 0x48ECDCD: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ECBCA: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2B9: g_test_run_suite (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2D4: g_test_run (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x10F5A1: main (test-ndef-build.c:113)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-ndef-build.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/unit/test-ndef-build.c b/unit/test-ndef-build.c
index 44dce4bf9aef..54b502f4a40b 100644
--- a/unit/test-ndef-build.c
+++ b/unit/test-ndef-build.c
@@ -65,6 +65,8 @@ static void test_ndef_text_build(void)
 	g_assert(ndef);
 	g_assert_cmpuint(ndef->length, ==, ARRAY_SIZE(text));
 	g_assert_cmpmem(ndef->data, ARRAY_SIZE(text), text, ARRAY_SIZE(text));
+
+	near_ndef_msg_free(ndef);
 }
 
 static void test_ndef_wsc_with_passphrase_build(void)
@@ -76,6 +78,8 @@ static void test_ndef_wsc_with_passphrase_build(void)
 	g_assert(ndef);
 	g_assert_cmpuint(ndef->length, ==, ARRAY_SIZE(wsc));
 	g_assert_cmpmem(ndef->data, ARRAY_SIZE(wsc), wsc, ARRAY_SIZE(wsc));
+
+	near_ndef_msg_free(ndef);
 }
 
 static void test_ndef_wsc_with_out_passphrase_build(void)
@@ -87,6 +91,8 @@ static void test_ndef_wsc_with_out_passphrase_build(void)
 	g_assert(ndef);
 	g_assert_cmpuint(ndef->length, ==, ARRAY_SIZE(wsc_wo));
 	g_assert_cmpmem(ndef->data, ARRAY_SIZE(wsc_wo), wsc_wo, ARRAY_SIZE(wsc_wo));
+
+	near_ndef_msg_free(ndef);
 }
 
 static void test_ndef_wsc_with_out_ssid_build(void)
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
