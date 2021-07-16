Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 987133CB5B6
	for <lists+linux-nfc@lfdr.de>; Fri, 16 Jul 2021 12:09:04 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 230CF100F2243;
	Fri, 16 Jul 2021 03:09:03 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id D2546100EB826
	for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 03:09:00 -0700 (PDT)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id CDDC4408AB
	for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 10:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626430139;
	bh=Yug3gXn0YNQ7m5uJ/f7qBoB6X4J20MEB2ZyAMoJNO10=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=wXEUenvO1f6fCQVJfQ+kWxTfBqemBiwIpA5ozu2wuSoND2ENrYAA1O5qH5ehwj33p
	 YTrak5jpz9WXKjvaiaJqgbfWFbefslRmko+UYJUj3dSFqR3CdTNHBdstr/lZF31pSU
	 xgAaCugw/FEOaUN34IiZ9vf9vVafR7GQLFl9km+bmsMAh0q37VgyYzVXcyTxpliTit
	 Wx2LMJanjnbFc07p3EAYuXR4kcjt9l4a174jBwjoIYPaEyD6WNuqTh+v7MUqbUF39b
	 dmxETeKsiAQh13qAVAOkXMJyXAHdD3IsJHrCIDMTizLYDDPnP7YUG3Pdfvp+xBQZCr
	 yiLVwwwDEES7A==
Received: by mail-ej1-f70.google.com with SMTP id q8-20020a170906a088b02904be5f536463so3407696ejy.0
        for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 03:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yug3gXn0YNQ7m5uJ/f7qBoB6X4J20MEB2ZyAMoJNO10=;
        b=Cvy/4HgT4ylbizZ4czQpv6IT7e8Addweh+UP3wHaCkQYhQN2jdPI9Hvpo+DCDs7sK6
         2WR3tFWjFPwXBL9bIV625Mg9BDqy3xOcW4GwqED+7iNh7mMOzHQd6TcAo936dZH13UMl
         eMMOznnrCfXpKT99NvYhQJ1BNz7exDN/Bz3yW9O8N+oFv2OU1Og8BD+8ABfkLnQSopK4
         VgMMfWAly403F7D7RTGZuVrKQGT4nWXjjb7yZUXvCTOnBR9GQjNbJLJK4yRP9LdW8GjQ
         TTnRJYEbpkNHQCbfWNWBETZSq5DKST6mnKkEwWh0qDA7DQ1Ta2w7t2KbO/Z3Muvf+PUW
         YqSQ==
X-Gm-Message-State: AOAM53207eCStmwBDQ1zEpfFs0hbOFHz2/bfXgwT7omL3gfA9HsOwXD7
	appYaJYttt3+/MyAWTSw7gb5+uTaoiAtkYLTezxH2tlJZ5WWlsjgmclQ+Af1Yr0fjlYblp0L2I/
	ZnvTJqGU8UDyd/GWQuQNSCczGbfptFYgpKw==
X-Received: by 2002:aa7:c04e:: with SMTP id k14mr13316393edo.157.1626430139230;
        Fri, 16 Jul 2021 03:08:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyijX0/PMDpH40xhH3XDU8pKVM/6z+mL1zCzWqJTqhc93oZfGVd+PG9FuU5HLkji4PFCJdxxQ==
X-Received: by 2002:aa7:c04e:: with SMTP id k14mr13316384edo.157.1626430139118;
        Fri, 16 Jul 2021 03:08:59 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id u26sm2710389ejj.4.2021.07.16.03.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 03:08:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Fri, 16 Jul 2021 12:08:39 +0200
Message-Id: <20210716100844.51360-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210716100844.51360-1-krzysztof.kozlowski@canonical.com>
References: <20210716100844.51360-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: Y5IAJA25EQZLSZ372UWVCB55DDN5F2MZ
X-Message-ID-Hash: Y5IAJA25EQZLSZ372UWVCB55DDN5F2MZ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 2/7] unit: fix memory leaks in test-ndef-build
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/Y5IAJA25EQZLSZ372UWVCB55DDN5F2MZ/>
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
