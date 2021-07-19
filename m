Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D673CD31C
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:15 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4AEA1100EB32A;
	Mon, 19 Jul 2021 04:09:14 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id ABA8A100EB329
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:11 -0700 (PDT)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id BD0FA4060A
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692950;
	bh=vuxvHipAjlpPyDlVfSroyLrU4I8zV+ZPo5R1TOLojug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=nmGqqXWf8eF45yvbh9WYsrEjcaqK6cfTs72sBMGCOeCsoY1e0m1zTip+aks9J6ViY
	 WZRXNPEBs2Csi5lBw11GC4eVE792OpM5AVRyJGz00exjHRLQP7aixL+X4ata57Hakw
	 Q2FWrhBco0qUxKh4lhK3/CfhOVcZcDxSOUeOLKpU+P8vaFcwzi/7GKf0sPiMG40bWp
	 82PKkL0UZZktn4tYMKLxO7Fj6S2ETzrcNfbqDbY9sW8pHHsE9W+ze9TQs+4SluzEZ8
	 BwtNScpdw3gdCJZXScK7tAHIGb4OTkHICTOQ1pzb1TaVAsF8c8bhZkmG2LkSZbWChc
	 2d+gi4xLZT0uw==
Received: by mail-lf1-f71.google.com with SMTP id x5-20020a0565121305b029032696702876so3251778lfu.5
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vuxvHipAjlpPyDlVfSroyLrU4I8zV+ZPo5R1TOLojug=;
        b=SduDm37/Qo1at9gFDeYLoxRRtCPfG+2nxdDqRIGkHHTP9cxqj2+P3Etvq2xU8OOpKz
         DK0XuoYQtcDn2JjiaW1yF4cFlazOTra6BCyTeHBx80Wdl0+7WJMj6rKx7BUlj4ExpT9G
         k5/ngzhV5WvwnmLI4cwINU0ucumzgihdSEfdr/CwjKOdYiMLn8gCadfEv/mG8DE3EoKP
         XWvmmYdxG4LNhs/vBuyvnUaUBJcrVUy//ZcVwy9Km4MerExMJM5eq4TtcBbhgBGQOYwr
         u6R2s7PuXzI+ADY0PCZB1+08A4CTonkv1ofQJpy4vM7bi7wyJicOXbRG3BWiaCzzwtYQ
         BF/g==
X-Gm-Message-State: AOAM530i8f9iEVlTvHyhCtFpNeB8s0Hh8jsJuVwIHSJdk7r46+qi8t3y
	hjhUEwmeMO1NlxUIwEk7MtFzfElLUkooezFAnG+SKMXH2DiSYI9mFGmjKFzSUhsDiF9wd8M5SG/
	wsqrmfibrZ8poEQJ7J/VznJk8DRPATpfrhg==
X-Received: by 2002:a05:6512:3447:: with SMTP id j7mr17079616lfr.558.1626692950029;
        Mon, 19 Jul 2021 04:09:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxA/bsjlpdVEkiBWiRRmEneLcLkiN2NsUmmKrkeA23ryVicYjKSs45G4qovsBtNzEAqdKsTNQ==
X-Received: by 2002:a05:6512:3447:: with SMTP id j7mr17079612lfr.558.1626692949844;
        Mon, 19 Jul 2021 04:09:09 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:37 +0200
Message-Id: <20210719110819.27340-32-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: AG2OUA7O5VNRVFUAX3WBBIZ4ZX24FYSH
X-Message-ID-Hash: AG2OUA7O5VNRVFUAX3WBBIZ4ZX24FYSH
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 31/73] mifare: use unsigned int to suppress compiler -Wstrict-overflow
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/AG2OUA7O5VNRVFUAX3WBBIZ4ZX24FYSH/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

GCC v7.5 (Ubuntu Bionic) with optimizations has trouble spotting lack of
possible overflow of a signed integer.  There is no overflow possible
so this is a false positive which can be suppressed by simply using
unsigned integer.  Unsigned also has more sense in that context.

This fixes GCC 7.5 warning:

    plugins/mifare.c: In function 'mifare_process_MADs':
    plugins/mifare.c:626:5: error: assuming signed overflow does not occur when simplifying conditional to constant [-Werror=strict-overflow]
      if (global_tag_size == 0) {
         ^

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 plugins/mifare.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/plugins/mifare.c b/plugins/mifare.c
index a4e4ba443995..f42007d5dfd7 100644
--- a/plugins/mifare.c
+++ b/plugins/mifare.c
@@ -560,7 +560,7 @@ static int mifare_process_MADs(void *data)
 	struct mifare_cookie *mf_ck = data;
 	int err;
 	int i;
-	int global_tag_size = 0;
+	unsigned int global_tag_size = 0;
 	int ioffset;
 	uint8_t *tag_data;
 	size_t data_size;
@@ -626,13 +626,13 @@ done_mad:
 	if (global_tag_size == 0) {
 
 		/* no NFC sectors - mark tag as blank */
-		near_error("TAG Global size: [%d], not valid NFC tag.",
+		near_error("TAG Global size: [%u], not valid NFC tag.",
 				global_tag_size);
 		return -ENODEV;
 	}
 
 	/* n sectors, each sector is 3 blocks, each block is 16 bytes */
-	DBG("TAG Global size: [%d]", global_tag_size);
+	DBG("TAG Global size: [%u]", global_tag_size);
 
 	mf_ck->tag = near_tag_get_tag(mf_ck->adapter_idx, mf_ck->target_idx);
 	if (!mf_ck->tag) {
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
