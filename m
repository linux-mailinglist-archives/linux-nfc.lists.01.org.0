Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 322F63C3267
	for <lists+linux-nfc@lfdr.de>; Sat, 10 Jul 2021 05:39:36 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 9129A100EB333;
	Fri,  9 Jul 2021 20:39:27 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 7858C100EB328
	for <linux-nfc@lists.01.org>; Fri,  9 Jul 2021 20:39:24 -0700 (PDT)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m23pr-0007VC-A6
	for linux-nfc@lists.01.org; Sat, 10 Jul 2021 03:39:23 +0000
Received: by mail-wr1-f69.google.com with SMTP id h15-20020adffd4f0000b0290137e68ed637so3738975wrs.22
        for <linux-nfc@lists.01.org>; Fri, 09 Jul 2021 20:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l2+Jysct+crGfr5LDoG0wS4QtGLc48fArMEgld46mjU=;
        b=iNFpizNmyEl/Pl0bSM5JoOXIgAL1DK/2LW1GHnmiSjTFFiVl+VjI4c7f1Do2F3pqlR
         j0TF8+UzPkTTFQFEnH0tlZA91K/OpojKOFfOlNEU935RnHUK+q5t8rA0SzpjOl/Cu0Rk
         c8DXgGBZu7VjCqSu1N+/3xG4jSoNWwutIXmV9AyH5bVmMSl3TDv+82SRu//1GU4ltZVx
         OVeEHYFUn1HglVUcCotl4Hj0SjKMhtSIvdMij/AjzdZV5OIglKvJjNulmTJ3/oT3Mb5N
         NmxtZhFyvHpG1lvysm1wthTXU4/j/55RC58zbTd6v2aNuhTJF5kLliLxzqYa+SjEl+Do
         WEYw==
X-Gm-Message-State: AOAM533aparwB4liKnYEW4IXwz0NmfA2PLiKU6RzN53tQ4XlqkJL0urn
	VRcJOg2xSPYKOJJWtH7J52lQBBWubBUm7BEHpvoNR2yiByPXPdjj5OV0Nm9zLzX6dNDKulQJjuv
	1BbCCNMta7VuGfQcx+CB8l+g4Km0SSqT/Ng==
X-Received: by 2002:a7b:cd15:: with SMTP id f21mr6263753wmj.148.1625888362731;
        Fri, 09 Jul 2021 20:39:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDWVQ92ZAIS0CM6YvieqeIoOPGn46HJ4ZNfNcdSwK2zDl8GIppD07cAF9c3J9NhV6dU637CQ==
X-Received: by 2002:a7b:cd15:: with SMTP id f21mr6263745wmj.148.1625888362631;
        Fri, 09 Jul 2021 20:39:22 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id a12sm7444346wrh.26.2021.07.09.20.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 20:39:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sat, 10 Jul 2021 05:38:56 +0200
Message-Id: <20210710033859.3989-14-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
References: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: AZNTULJNOERN3Z2V3WYKMFCLNQ4W734U
X-Message-ID-Hash: AZNTULJNOERN3Z2V3WYKMFCLNQ4W734U
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 13/16] ndef: silence clang -Wcast-align warning
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/AZNTULJNOERN3Z2V3WYKMFCLNQ4W734U/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix clang warning:

    src/ndef.c:1196:28: error: cast from 'char *' to 'gunichar2 *' (aka 'unsigned short *') increases required alignment from 1 to 2 [-Werror,-Wcast-align]
                            g_str = g_utf16_to_utf8((gunichar2 *)txt, len, NULL,
                                                    ^~~~~~~~~~~~~~~~

The case is safe as length of string is an even number.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/ndef.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/src/ndef.c b/src/ndef.c
index fdd44b467027..13e3356c2c4c 100644
--- a/src/ndef.c
+++ b/src/ndef.c
@@ -1198,7 +1198,8 @@ parse_text_payload(uint8_t *payload, uint32_t length)
 		txt = (char *)(payload + offset);
 
 		if (status)
-			g_str = g_utf16_to_utf8((gunichar2 *)txt, len, NULL,
+			/* Cast to void to silence the 1-to-2 alignment warning */
+			g_str = g_utf16_to_utf8((gunichar2 *)(void *)txt, len, NULL,
 						NULL, NULL);
 		else
 			g_str = txt;
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
