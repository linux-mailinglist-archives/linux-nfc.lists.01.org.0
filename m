Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF4C3CD31A
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:13 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 2BD91100EB331;
	Mon, 19 Jul 2021 04:09:12 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 73469100EB855
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:09 -0700 (PDT)
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 862E9418CF
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692948;
	bh=3iC04QJk/BrzoT9ZfV7JKi3Kz+BZHNatlPYWc+4xbkY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=MOfwEBIbwvMDJhoCDu4H9h7ty1zYh9p3adBjG2Pmg7fFvFu4s9bxYci0cxT1943SU
	 eVvkrSzd/FyKAAlQaWjMTgc9gtcqrNVDlhuWHeyrl8idZJ/fKExX1HrSzyo2olvHzf
	 PI8OOA+8hBqjL1SRr9MEu6gUotLpPqzYVtDGJkEV7BvsmCiLLYxVod12UeSWsiwRLG
	 /47CJhzM+qyQCgZoU9F1YHasyaz2IvW/OCrZVsd2ZeGpXuVtLbS7rglr5Tig7NuGuQ
	 CG4S790m+kbVXkHCXUxv00QNm6VmE+3IIv942oMyKX1vapUXWdyx/eDO/x3AOHFCxq
	 lS/uU8CRZRMFg==
Received: by mail-lj1-f197.google.com with SMTP id e9-20020a2e98490000b029018c799ba37bso9287456ljj.6
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3iC04QJk/BrzoT9ZfV7JKi3Kz+BZHNatlPYWc+4xbkY=;
        b=jwmsWh+3c/XFs5M6CvCw5OBaTJOcKGYirxsln8J0bdmUkgmDiUJnNYdGoQrGR0cReA
         GFvRhDN4tijOf0qlrr4QxGU4BIxm43/betrXQBVIlvAAcJTbJ4bzpNvMFhgRydKCeySi
         TXfYCYkvOjZ9jdkl0brFkyTbjhcQmBQe2qxT+Oksmq0XLWcZBT7/vXTaRMkZOo/rVdj1
         CHlMsLAoSHKIjNWgk1Fi2R2YQ676J1kYGHFbr9H7wIOD6vkSaJ421WP7z9VkqhoyLJV/
         honSU+NKypTUrXUQ0TU+KRY0FHbxYhtmKgYgUybEgKu/7xJ8nIsqTt/SWjYzatbGbLaZ
         tYIg==
X-Gm-Message-State: AOAM532Y8P+AahROBmCBZ1McramYNlIYEz01H58rNZMZKNuE+6xNsnj9
	XUfbbtm5K80fMadXY1HzJhVpaA3qP68oMh1lUDKfTwBrd4tCIY3AiHy83dJKMnmmskBjD1f5K3f
	gkPeJ7IZa+QAlCqWfHTcJgHupe7agBZzVoQ==
X-Received: by 2002:a19:4950:: with SMTP id l16mr18147662lfj.4.1626692947731;
        Mon, 19 Jul 2021 04:09:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy1js/PHsilBbVvFQMAuL8T0lXasDJo8UFYgRuQeTFFFOGreXcorbSz8UlQas7AxGls5Buww==
X-Received: by 2002:a19:4950:: with SMTP id l16mr18147649lfj.4.1626692947506;
        Mon, 19 Jul 2021 04:09:07 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:35 +0200
Message-Id: <20210719110819.27340-30-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 5UELVWZQ4AOBOGVCXIUGMV34RTO2K2I7
X-Message-ID-Hash: 5UELVWZQ4AOBOGVCXIUGMV34RTO2K2I7
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 29/73] nfctype5: fix returning uninitialized stack value in t5_tag_is_ti_pro()
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/5UELVWZQ4AOBOGVCXIUGMV34RTO2K2I7/>
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
index 0f90e55ab268..eef2afe9f6d0 100644
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
