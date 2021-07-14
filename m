Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5824B3C8361
	for <lists+linux-nfc@lfdr.de>; Wed, 14 Jul 2021 13:05:38 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id A4635100EB358;
	Wed, 14 Jul 2021 04:05:34 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 9E712100EB34D
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:32 -0700 (PDT)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 500DF4054E
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 11:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626260729;
	bh=aTj2OUkn/x8AGitoyMAN+BHpFwMpwL55l9Q3aKdbGZg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=IdF8XFeL0POwBYImLeQV2SEOOANwVNs/sdfGA8mtPdxSIgbkxKjLMwpv5Rhk+h4uU
	 s9hm6NGElMGbx7xX4U2+gjtLekVbOG+M9OTK5sarOU66bKk/odRjPIgxFVVXlKmWDo
	 Rdd9T9kvs2fbEvlCYVan7sEbtlqA4g9KODnZdI0iK0TvNLn3rpLfWH54pnkhfBPfr7
	 eZ1nHi74aJEkUuHFxdwpi2CoON258JjdwjUXjVJ0AuMXFsX8Nd1vxdil7m4GN6glGe
	 1VYjSavf1AtBXF69P+BB73/XMoNtF6P40vaVvFXjIksyfTqoNVDuEkUp3l2j0bgVVL
	 +z/WbDC+t3lLQ==
Received: by mail-ej1-f70.google.com with SMTP id rl7-20020a1709072167b02904f7606bd58fso644356ejb.11
        for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aTj2OUkn/x8AGitoyMAN+BHpFwMpwL55l9Q3aKdbGZg=;
        b=RRKh0z5TRs2R4inBWyES/GeY3HEuahxUlUHUZaTricfRQdox01imMuVKlg9KBTaZvV
         C+DGQzW3tDh3smNfBPPEqpC8J2zUasDoR+D7xACp1dd4yltSILGOmQUw21JJrUqCJmVI
         T7Bg629ilK9bPEa+qY1UdV/1Dm/3IyIq5y5JuuPn/koyR8aewnpXxS0PXdyR686tmk5k
         xZfdlGAWYHuaPitTkq6r7VtQdFLoU30GxJYT32Km11Dh9Yb+flpDdR8AAEigrQuow3m9
         m12oqTDJVNNzMv7tkSlsfiVQlUzhy/GXDQd6uhhJveY0KO4A0RGcI0mattuyrsUVV0LH
         Y41g==
X-Gm-Message-State: AOAM532KAD3O7fnCgq6OOC4c9lDvbQMHIUety7sxY1/6aGjreC/dntYt
	X3OBCHoiSP2tULqbxFpJTmSfetR+UKw+pkk4XSkS8IAi/zD2QaACHmgWaEMrVEBl9TE/Y30dtsu
	EUEG209l0o/ImUumBYMBQbrY+TXfwi8MHkQ==
X-Received: by 2002:a17:906:af0e:: with SMTP id lx14mr3473580ejb.54.1626260728708;
        Wed, 14 Jul 2021 04:05:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHWhAPohZkwmkZEbferB1gxto4eqMGga31Af2w58IcuDN448TR0LLQu96y/wxX8haku5NQrA==
X-Received: by 2002:a17:906:af0e:: with SMTP id lx14mr3473465ejb.54.1626260727304;
        Wed, 14 Jul 2021 04:05:27 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id qp12sm637689ejb.90.2021.07.14.04.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 04:05:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed, 14 Jul 2021 13:05:04 +0200
Message-Id: <20210714110518.104655-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
References: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: UQG4JFOKKHWKW76ZWHUA57NDTM6355T5
X-Message-ID-Hash: UQG4JFOKKHWKW76ZWHUA57NDTM6355T5
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 02/16] nfctool: annotate printf-like functions as accepting format
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/UQG4JFOKKHWKW76ZWHUA57NDTM6355T5/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Printf-like functions should have the "format" argument annotated to:
1. Help in detection of format string vulnerabilities (and mistakes).
2. Satisfy -Wformat-nonliteral (-Wformat=2) warning.

This fixes clang warnings like:

    tools/nfctool/sniffer.c:206:18: error: format string is not a string literal [-Werror,-Wformat-nonliteral]
                        sprintf(line, fmt, offset);
                                      ^~~

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 tools/nfctool/sniffer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/nfctool/sniffer.c b/tools/nfctool/sniffer.c
index 3d1d230a50c5..6a38a213c74d 100644
--- a/tools/nfctool/sniffer.c
+++ b/tools/nfctool/sniffer.c
@@ -168,7 +168,6 @@ void sniffer_print_hexdump(FILE *file, guint8 *data, guint32 len,
 	gchar *hexa = NULL, *human = NULL;
 	guint8 offset_len;
 	guint8 human_offset;
-	gchar *fmt;
 
 	if (len == 0)
 		return;
@@ -185,11 +184,9 @@ void sniffer_print_hexdump(FILE *file, guint8 *data, guint32 len,
 	if (output_len > 0xFFFF) {
 		offset_len = 8;
 		human_offset = HUMAN_READABLE_OFFSET + 4;
-		fmt = "%08X: ";
 	} else {
 		offset_len = 4;
 		human_offset = HUMAN_READABLE_OFFSET;
-		fmt = "%04X: ";
 	}
 
 	if (print_len) {
@@ -203,7 +200,10 @@ void sniffer_print_hexdump(FILE *file, guint8 *data, guint32 len,
 		if (digits == 0) {
 			memset(line, ' ', human_offset);
 
-			sprintf(line, fmt, offset);
+			if (offset_len == 8)
+				sprintf(line, "%08X: ", offset);
+			else
+				sprintf(line, "%04X: ", offset);
 
 			offset += 16;
 
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
