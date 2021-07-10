Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 480733C3269
	for <lists+linux-nfc@lfdr.de>; Sat, 10 Jul 2021 05:39:38 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id B9869100EB33B;
	Fri,  9 Jul 2021 20:39:27 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 2133D100EB32C
	for <linux-nfc@lists.01.org>; Fri,  9 Jul 2021 20:39:26 -0700 (PDT)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m23ps-0007VX-Tn
	for linux-nfc@lists.01.org; Sat, 10 Jul 2021 03:39:24 +0000
Received: by mail-wr1-f69.google.com with SMTP id z6-20020a5d4c860000b029013a10564614so3452590wrs.15
        for <linux-nfc@lists.01.org>; Fri, 09 Jul 2021 20:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aafqwuHFC+YBeehE6oFzN5Ioiw+WVNSKdQ5P6Ti6a0Y=;
        b=WZ6sorTwoMX09Zen5kfuAgaIUgZOO5n7J2yCC1R1/tK6v+dyjynpj/bf0tysBQQiSx
         Lz9FjZ+VWrylxS2HHNFp4cH/1tciFKBkvKScR15mPKvdTSGMAAFvTPbBCY3poA2mFfJh
         oH5qVdryltZ+DrCKE3B+2ur0rzRT7mNhGydazklc2GG5mSLHySOjxN193T61153mYmb3
         zvgo5k7VMTpfRZTCB1Vdp+CDEQYeHR8AIrD99yV1lc7S03G8IAj9RBzX0RFXBKRSWOt/
         CQ0xnolcG6q3agBq8JD5JYDxde55GQvj7LC3CRdRlxF0wCHoZzKsBby4Iz8TvyHWqcIT
         Rsig==
X-Gm-Message-State: AOAM532Lsdm8rNYkul9FebYq2m7hxbmbN0NaOIAW6e0d+5tbusdQaw82
	jJaUJpScVqj1asXPFMg1JAkrXgrQAW+HEmHM88qu3zczYUKelwWciMiUMI3NWt+bx0+1RLCZgJe
	kyH8GowuFV/wVrzHytLRRkz2j/X0nrnPsbw==
X-Received: by 2002:a7b:ce98:: with SMTP id q24mr12015406wmj.73.1625888364172;
        Fri, 09 Jul 2021 20:39:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4CqJtbcnRv4qZlT1LyjhDQzdnnbWL5J+VIPR/GOHVIeNm7NgIU86RYeoOjCxP5eahJqLTGg==
X-Received: by 2002:a7b:ce98:: with SMTP id q24mr12015398wmj.73.1625888364065;
        Fri, 09 Jul 2021 20:39:24 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id a12sm7444346wrh.26.2021.07.09.20.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 20:39:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sat, 10 Jul 2021 05:38:58 +0200
Message-Id: <20210710033859.3989-16-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
References: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: WJJ4XXYA4OXESXABQYBW4FLJGG4RM4VS
X-Message-ID-Hash: WJJ4XXYA4OXESXABQYBW4FLJGG4RM4VS
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 15/16] nfctype5: fix returning uninitialized stack value in t5_tag_is_ti_pro()
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/WJJ4XXYA4OXESXABQYBW4FLJGG4RM4VS/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The return value was not initialized so if tag was not matching, random
stack value (usually true) was returned instead of false.

This fixes clang warning:

    plugins/nfctype5.c:257:6: error: variable 'ret' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
            if ((uid[5] == 0xc4) || (uid[5] == 0xc5))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    plugins/nfctype5.c:261:9: note: uninitialized use occurs here
            return ret;
                   ^~~
    plugins/nfctype5.c:257:2: note: remove the 'if' if its condition is always true
            if ((uid[5] == 0xc4) || (uid[5] == 0xc5))
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    plugins/nfctype5.c:248:10: note: initialize the variable 'ret' to silence this warning
            bool ret;
                    ^
                     = false

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 plugins/nfctype5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/plugins/nfctype5.c b/plugins/nfctype5.c
index 3d2cdf030d4f..b7d240e519be 100644
--- a/plugins/nfctype5.c
+++ b/plugins/nfctype5.c
@@ -245,7 +245,7 @@ static bool t5_tag_is_ti_std(struct near_tag *tag)
 static bool t5_tag_is_ti_pro(struct near_tag *tag)
 {
 	uint8_t *uid;
-	bool ret;
+	bool ret = false;
 
 	uid = near_tag_get_iso15693_uid(near_tag_get_adapter_idx(tag),
 					near_tag_get_target_idx(tag));
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
