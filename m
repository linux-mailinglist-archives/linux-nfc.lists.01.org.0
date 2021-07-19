Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AF63CD30A
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:08:56 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id DBA4A100EB32C;
	Mon, 19 Jul 2021 04:08:51 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 83FC5100EB85D
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:50 -0700 (PDT)
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 97E8C40207
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692929;
	bh=l2+Jysct+crGfr5LDoG0wS4QtGLc48fArMEgld46mjU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=rn9XtjX5wAyTAPEnFoelcvl/glPN+N/PK42TVnnuFN+4gVnBtiFRuzDNOIKYk147Q
	 6Vog4WTfQtvpzFKBf+WrXNbCJiP9EwqZQWTR7N3rw6c3TuN9CQNQi7gu7ricFqZQOv
	 kzoq42nfwzW2847MO9r8CCyfTAhDblYpvlOGTcSR3TkRWy5a6xAb9O86EXlEAtRVcb
	 e9y34FI2QEmqMWe3rpeMPvddEvdGga6SsEWBMzisHd+ezXaunzCdX4RDqyBYCItMLt
	 AeOLZAMnXgsTokKsWjJIHvrQUeDL4+VgBnH+hjRojOzkW2T6gK9AsAlK5khQRZMeDu
	 v9YtTbVDDZRQA==
Received: by mail-lf1-f69.google.com with SMTP id bt32-20020a0565122620b029030e2ef98a19so3240800lfb.22
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l2+Jysct+crGfr5LDoG0wS4QtGLc48fArMEgld46mjU=;
        b=BU+mofq5HH72Yz7L1e/0bBOZ9DHbMzFo6vEf4BUeoCTEZhg7S33M3tuWDApnfUJ30L
         SI66ZveZSbcZowcQEg7OSGVm0IYwIbNYuBRqfl5T+6cD1NxcilUpKKRNexMR9QKUaORR
         hX3ZKVRqMUAGDhyhOQWFbZcnMG2mPVL7RE5kmJQpJ8LQ0uEsq3Q8S8/isc08jOaSdM/B
         xKkp9rmkgkTIjpPI67FIgHEOq5Y+DtevqYDInrwyGfpvWYpQyfZe5P1g1Ibw+NfwJslp
         ufulFKVdayZMfCJBMoTfO616ot6frfgyMNrmn9FK7XkaIBN545CXFAY7u/3wWB4sbzwA
         GI7Q==
X-Gm-Message-State: AOAM533xt5cs8/bICBAL1qam5xHm5BDo0jocfN4t/E6C/M6Gpd8nLAeQ
	CfKfKbJgMwuod5SovMkYa8Dpgl9gYycJv006JdZ+dfk+JV/ps1EqXaJYjfxk38il9Lnm6OGLT+4
	fptl18tF/6OEhpyXc58n87Znax7CVumoiOQ==
X-Received: by 2002:a2e:2286:: with SMTP id i128mr21728958lji.260.1626692928894;
        Mon, 19 Jul 2021 04:08:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqvBHqBiPE8qChEye3MH37nazuSiOH3twfcvhQAKzt1SpEoAQImdRi6xwQzFxWUgMTI14M6w==
X-Received: by 2002:a2e:2286:: with SMTP id i128mr21728950lji.260.1626692928765;
        Mon, 19 Jul 2021 04:08:48 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:08:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:19 +0200
Message-Id: <20210719110819.27340-14-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: SM6RX4UTQEO3SVNNJU4IULX3FZF7MM63
X-Message-ID-Hash: SM6RX4UTQEO3SVNNJU4IULX3FZF7MM63
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 13/73] ndef: silence clang -Wcast-align warning
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/SM6RX4UTQEO3SVNNJU4IULX3FZF7MM63/>
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
