Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5A33CD306
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:08:51 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 79674100EB323;
	Mon, 19 Jul 2021 04:08:48 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 0EE04100EB323
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:45 -0700 (PDT)
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 0EB88408B5
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692925;
	bh=E/8nrHmuMCe3nCvLSxKPOYFpYy9ZqKOICh7dOMTPOZQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=lT/dsvU8qz4WnN4vPeVuS2r4KmKUq4KXizM6AtVhc8FQBA9XwJiO3CQJUQs0KVY0G
	 uXcwIgADc2qLexQBjUVFSi248duss3KEAUQjhUEUDgBL8ImE/pS4dpLUINf1bFahrs
	 tJgWYaNYlOA88WcjLVeL07u2UFlzZxHaFjm6a4/tgo57QD9jCD0AvE4+BvR0tE1lCu
	 Uu8m5hIRCehprzB1j9RJb04OfdkccbKyyQTJ1TSpENRcpVRVSR5p3SD0O8x4EgLBnq
	 LX4UaIElMzaDPG/pCQpCuxOcCc0z92z+bW7Fo5KGqrp5txpUKSpe5crFAJ0Qhmg6Ug
	 oIm9QLnKi4JiA==
Received: by mail-lj1-f197.google.com with SMTP id y11-20020a2eb00b0000b0290194aa1ae3efso5325728ljk.18
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E/8nrHmuMCe3nCvLSxKPOYFpYy9ZqKOICh7dOMTPOZQ=;
        b=gw4Ejo5Xjg7ZgxAr6dGr2frnZmo5gpKBJdMPWPrgA6IIjW8OlLSzCUT/V1hzIDbw8o
         VF5LYrAreuprKmEByziGTL3tOaahF9PoXj7XiWBNL9/fxS0OqmocV9vS7acMQSX/jIUY
         MJEC0BDgIPBxruQ+PK6QZmII0bw79pLSirRzrGNMCbpdMhjxNlJz3dq3JzgNjRVYUs0J
         l8GopehxrGtFIcxJTvPAoRFYfD5NyEaavgJBsHlhSfYMMVHqG4/fRUe/YexWk24CTIPt
         46l7lmjrgO3TmrszUz8pZn4Gn9Ce6vhdGzdTE/Qf7O8WKtA4/wZ7SXhDOsg4W1hORJZU
         uavg==
X-Gm-Message-State: AOAM5300a6+sQ45NJc0W6MH6s+jbbiRUT9hhns+APRJg64Ci4DSF40+a
	QmFbMRTavMaUr3ACg22NeLd245fRXekD53wMNDOyqJeOps0TtcsEJBnrh1JsEj0E/X0gC7efof+
	2To9DiZo0oXsDlDhbTigLS08Gv59+C9FyLQ==
X-Received: by 2002:a05:6512:3709:: with SMTP id z9mr17599228lfr.182.1626692924303;
        Mon, 19 Jul 2021 04:08:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzw2zoddct5agl/ed5NQN7Ez3IvfKXeiWvB5h1j2uCBg89ezhCRkuEA7Kg+4JVgdEluS4hfbQ==
X-Received: by 2002:a05:6512:3709:: with SMTP id z9mr17599226lfr.182.1626692924155;
        Mon, 19 Jul 2021 04:08:44 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:08:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:15 +0200
Message-Id: <20210719110819.27340-10-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: VEQOYKNP2V2YCPKLM36HGMITNZ2QKB6S
X-Message-ID-Hash: VEQOYKNP2V2YCPKLM36HGMITNZ2QKB6S
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 09/73] nfctool: pass the format as string literal
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/VEQOYKNP2V2YCPKLM36HGMITNZ2QKB6S/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

clang v11 has troubles detecting that sprintf() format is passed in
sniffer_print_hexdump() as string literal.  Remove the local "fmt"
variable and call sprintf() in two branches of if, to satisfy clang and
fix warnings like:

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
