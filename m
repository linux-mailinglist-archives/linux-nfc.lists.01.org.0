Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F3B3CD30F
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:01 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 32886100EB85D;
	Mon, 19 Jul 2021 04:08:59 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id A8FE7100EB855
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:56 -0700 (PDT)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id A8F6540207
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692935;
	bh=jPq0N3pn7/rLirS7qKwLuHNCcR8YUP82b47/74QczFQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=EUWhI4uEvVlLBxkn+hHTV3L6lag2cAmsj3qONFIrC55mPRtU/fBTxL9fkKBxnmD0d
	 C75BGTnrQhMw8AEUYhmYL2qlNeMt6VJkVfa65LelzWY/BgsTicWoTxP9E9jNA6DeBN
	 MoCBYKtEOL+F9gb+Ds1oSL4naZHY1ddulkgyT1qeU370bH7YZJDd1C28TnCPzbxqKe
	 GWWN8IdRtMzdcuDxpyhRjkzylo9Qw6ewHf1+oEuy0BCJei4Z5YwICvD2rvXlsuGSX3
	 7MNhxPEBTlJIfJEhXZVDtXlkf1lGUbIVNIEmScFYO8bScioMB5a/Pb/7IhI2PNJhA4
	 j8vqKd3hzgujg==
Received: by mail-lj1-f199.google.com with SMTP id d1-20020a2e81010000b0290196925bc674so3205748ljg.10
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jPq0N3pn7/rLirS7qKwLuHNCcR8YUP82b47/74QczFQ=;
        b=rcTBbXWplVVfYqVK0pspN8JKh/WXvfoRqNNUy/OerdpbAc27X5Z8Wz1fZp3LeGDdBv
         +rK3tgjf6VZ6zkDSSJIdxMOw8ArbNwo/3i0u8GEt5wiezHdn7o3o7H0xwRNCJ+pmLccc
         MYLyyiCEN8/EsSYXoZih2tDr2sLzboE0DLI59T03HZfpYA6/Xz9l8VxkzmrBqUq/D0N0
         e+jyple+chxTJeQSpelWGieL0sDlhpm48f5J+YifCn4WERDsLfb+Q8eJm+cs9e88Wzkr
         yLKuadd0xK3Pae4JMo6B+2rO2x4Alv0OVxAAWo+KxsnQJ9Rx1sgzdKggrkgFDVg1hB++
         NRqw==
X-Gm-Message-State: AOAM532DJIa1wFk2jNo/wSSHJGv0iUMYOAk+QapjSIbHwA+lchVPm0j/
	Abakdn/+4bSBdForzJqgiO0kw8KQkzcTD0HsHMmDW38zzBi7hYKwjhM3dAiLeUJCHsN40comibE
	jKNi2PQYysJ12G8j4l1hZGaqKZSA4kSzlLw==
X-Received: by 2002:a2e:a23b:: with SMTP id i27mr21331611ljm.176.1626692934936;
        Mon, 19 Jul 2021 04:08:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3WDBYoGxRAEk9DWaGXQPkdnSUSapF0jsxYRNzSpUoVnpl3vpUz2xlD3k24GaGhOJqOrOSvQ==
X-Received: by 2002:a2e:a23b:: with SMTP id i27mr21331607ljm.176.1626692934779;
        Mon, 19 Jul 2021 04:08:54 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:08:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:24 +0200
Message-Id: <20210719110819.27340-19-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: F5GEHN4UGXTB2DLTOZ5VPAQUCODJKYDV
X-Message-ID-Hash: F5GEHN4UGXTB2DLTOZ5VPAQUCODJKYDV
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 18/73] se: silence clang -Wcast-align warning
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/F5GEHN4UGXTB2DLTOZ5VPAQUCODJKYDV/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix clang warnings:

    se/ace.c:147:15: error: cast from 'uint8_t *' (aka 'unsigned char *') to 'struct seel_ace_apdu_rule *' increases required alignment from 1 to 4 [-Werror,-Wcast-align]
                    apdu_rule = (struct seel_ace_apdu_rule *)rule->apdu_rules;
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    se/ace.c:790:18: error: cast from 'uint8_t *' (aka 'unsigned char *') to 'uint32_t *' (aka 'unsigned int *') increases required alignment from 1 to 4 [-Werror,-Wcast-align]
            apdu_header = *((uint32_t *) apdu);
                            ^~~~~~~~~~~~~~~~~
    se/ace.c:791:14: error: cast from 'uint8_t *' (aka 'unsigned char *') to 'struct seel_ace_apdu_rule *' increases required alignment from 1 to 4 [-Werror,-Wcast-align]
            apdu_rule = (struct seel_ace_apdu_rule *)rule->apdu_rules;
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Increasing alignment should be fine for most of the platforms (maybe
except some performance penalty), although there are such which might
not handle it and raise CPU exception.  I am not sure whether the code
is actually safe, but proper fixing would require bigger changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 se/ace.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/se/ace.c b/se/ace.c
index c1561abae8c1..ef0e7e15fbf7 100644
--- a/se/ace.c
+++ b/se/ace.c
@@ -144,7 +144,18 @@ static void dump_rule(gpointer data, gpointer user_data)
 		uint8_t *header, *mask;
 		size_t n_rules;
 
-		apdu_rule = (struct seel_ace_apdu_rule *)rule->apdu_rules;
+		/*
+		 * (void *) to silence -Wcast-align. Code should be safe
+		 * (assuming platform handles unaliagned access) as iterations
+		 * go up to n_rules.
+		 *
+		 * TODO: Fix the problem instead of silencing with cast, so
+		 * the code would be porable.
+		 */
+		if (rule->apdu_rules_len % sizeof(struct seel_ace_apdu_rule *)) {
+			DBG("  APDU: wrong alignment (Bug, code needs fixing)");
+		}
+		apdu_rule = (struct seel_ace_apdu_rule *)(void *)rule->apdu_rules;
 		n_rules = rule->apdu_rules_len /
 				sizeof(struct seel_ace_apdu_rule);
 
@@ -787,8 +798,21 @@ static bool apdu_allowed(struct seel_ace_rule *rule,
 
 	n_rules = rule->apdu_rules_len /
 				sizeof(struct seel_ace_apdu_rule);
-	apdu_header = *((uint32_t *) apdu);
-	apdu_rule = (struct seel_ace_apdu_rule *)rule->apdu_rules;
+	/*
+	 * FIXME: apdu comes from message and where is checking for apdu_len?
+	 * The (void *) is to fix -Wcast-align but the actual problem is
+	 * whether the apdu contains enough of data.
+	 */
+	apdu_header = *((uint32_t *)(void *) apdu);
+	/*
+	 * (void *) to silence -Wcast-align. Code should be safe
+	 * (assuming platform handles unaliagned access) as iterations
+	 * go up to n_rules.
+	 *
+	 * TODO: Fix the problem instead of silencing with cast, so
+	 * the code would be porable.
+	 */
+	apdu_rule = (struct seel_ace_apdu_rule *)(void *)rule->apdu_rules;
 
 	for (i = 0; i < n_rules; i++) {
 		if ((apdu_header & apdu_rule->mask) == apdu_rule->header)
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
