Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F29303CD30B
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:08:56 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E8BE4100EB859;
	Mon, 19 Jul 2021 04:08:53 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 0E829100EBB94
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:51 -0700 (PDT)
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id ECADB40207
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692930;
	bh=znbiXFb7dWqK7TmOZDCj160BRgHgKCCCmEgROnedCOg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=i7HnDSI84dyamnnQCAJPPTW06JemLP6eDxQhi1MRmgHjSchYT96G5MNjdhb3RozDq
	 Qt/lupuJfE96Q03Jg/GafRf9Ch/y3e3ftAunuX5pggXK/rAg0hjaYE04pZgaGRdZme
	 vD3HJRGmefV7r1U+EbBxTc73HtP9TR1s3Ont1Ax8fgw/TGNyBqzA1bi3OVCTc3BkiA
	 CMlrdxAFw+5y693HiMkuuqTXm2MBDABfgfBGd9MTHwnpl/IMGhFH+agvF8fiNeTtcm
	 kWsJZPycCsWbiXmGqcfN+QhpI9APUx2HZdqTXnfLovmltfQ1NEBbjmM/j2VXnMWOrN
	 qbej8nXA+0xjg==
Received: by mail-lj1-f200.google.com with SMTP id z18-20020a2e96520000b0290178006de192so9320275ljh.3
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=znbiXFb7dWqK7TmOZDCj160BRgHgKCCCmEgROnedCOg=;
        b=WLZRHNvui3cjkU8qdB43B9a+ntplCajsHC8Zn01LmlqYFDfO5xeWfVkTptm3xVIJfp
         br6RfayW6v24wMrt+V47F4mqvoq4qJ7TAgM8zpwgqQFAARA5kmoPeM4UuKydJdTxM4op
         W5Rm4nyR24Vwhqh1XijrI3qukBtvS/oejSxT+Sbmk7HFxGrzb37xgZ0q4af0kfSnRsoP
         Q4oqi0ccWoXiCk/v6Armgs9/91pHWJD8aHssmC4q05UpRY5/2iTWKVxxQ1ohPLKM4AnO
         s0iDTV7ibhQXUWxYL/HDk7sp04EMwT1T1m2+Jxv1DLQ4RfiYkHpzgVKtXk5247USwi5z
         s1TQ==
X-Gm-Message-State: AOAM5306eWc1mgpgl9wZBhDfF0cLF5pePVNHAjbfTMiLq3RppkD8raDT
	0i8YdTk4J1mDNLBBQ0FdutQ3wjHykxLWpT8I+Od/2Vkjd2vplKOCHaRDM9bRDTE+X3SayEdDZDr
	u7rIxf71+8wiiqofI3SQX4bBcO9gPc0jxJA==
X-Received: by 2002:ac2:4107:: with SMTP id b7mr17686944lfi.609.1626692930231;
        Mon, 19 Jul 2021 04:08:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyArYfUkZvMVXV45LrS6eatpY4m4zW/0n3uphgz1i0Qatuyi/nfBXCwcD3moTGtIijVut9cNQ==
X-Received: by 2002:ac2:4107:: with SMTP id b7mr17686938lfi.609.1626692930078;
        Mon, 19 Jul 2021 04:08:50 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:08:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:20 +0200
Message-Id: <20210719110819.27340-15-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: DJXKREBOHCNHGLTSAW6WGPKMY5SP2GZ4
X-Message-ID-Hash: DJXKREBOHCNHGLTSAW6WGPKMY5SP2GZ4
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 14/73] ndef: use NDEF_TEXT_RECORD_UTF16_STATUS define
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/DJXKREBOHCNHGLTSAW6WGPKMY5SP2GZ4/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Don't hard-code 0x80 because there is a define for it.  No functional
change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/ndef.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/ndef.c b/src/ndef.c
index 13e3356c2c4c..928e6a10a999 100644
--- a/src/ndef.c
+++ b/src/ndef.c
@@ -1164,8 +1164,8 @@ parse_text_payload(uint8_t *payload, uint32_t length)
 	if (!text_payload)
 		return NULL;
 
-	/* 0x80 is used to get 7th bit value (0th bit is LSB) */
-	status = ((payload[offset] & 0x80) >> 7);
+	/* 0th bit is LSB */
+	status = ((payload[offset] & NDEF_TEXT_RECORD_UTF16_STATUS) >> 7);
 
 	text_payload->encoding = (status == 0) ?
 					g_strdup("UTF-8") : g_strdup("UTF-16");
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
