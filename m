Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD0A3C8370
	for <lists+linux-nfc@lfdr.de>; Wed, 14 Jul 2021 13:05:55 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id A232B100F2243;
	Wed, 14 Jul 2021 04:05:49 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 80FA9100F2242
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:47 -0700 (PDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 68B8140616
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 11:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626260746;
	bh=tIs1xP5WKjh3R1onL5+YzsQBWrqDSAkUwxtRCjVdrcA=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=GzQFR9WhVU7O3fn0MJ1QKB8P2+z9YmUXKcsU7pB511JxXXz7kCs2GokqnwHsGsYBa
	 /UUtbG+pSDDssoWBzafrDYlKirACO3wVPKC3ulIY5nCRtoeA6sOlv72kzNvk3eYUsm
	 yLHEXioys9trqSnf74ToRakEv0Ft7aPB0yxulHrRVwDhnXCpZcP+S/QdFJkI2jAq99
	 wZpypjBZyIZK3SvIgJhfYIU+txiHDH5cyO+ILke+G9lWzwKjV7mOUqWK8aXST62q4g
	 6TNFfj1tU6FcZJ4SpnOLmedxNHtV783aJj21C9ygorRpNuImbGTmTqgdAoojVm3P4z
	 1K3AWS/OGziUg==
Received: by mail-ed1-f71.google.com with SMTP id i19-20020a05640200d3b02903948b71f25cso1066534edu.4
        for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tIs1xP5WKjh3R1onL5+YzsQBWrqDSAkUwxtRCjVdrcA=;
        b=ChDp6XmdogoyusYHhSrPGCOsKrcN+hl3J1apyt/uT32ZfusiIIWMJ85xK7cB7oZvE8
         avBKgn1Kxyr3jPOzZWI05BxLvvKc42HdP13qvwPHVg+PzMVjJQtoGlNQUv63KAm5xZNX
         j+JXO49ZMZjxTmQ6BSzyGwpNx/CH3mXplZ8OIvLaNN8wTPLLkEi71BVAcSgvQBDD5fOT
         2M4MFZysYCT/ra5xb7xWpdmEc6/fqSsixHRnhtaBuJCxg7ckpcTGN2kGVNeDKvCmbEkl
         sFVwdokE8AxMX/eZH7id3Rdj+5AZVjrXVVNYb45UI3N5cVcZtcfezgZbu74M4tA/SnoR
         Mr8Q==
X-Gm-Message-State: AOAM533U8KHuM/7YRKlLsBsya9seU8AOdLSwyD7GqSDMdAdkKz2+WAGq
	RJzvv4naiUer0uMAoUcPskjxW85Nn/YPvgLJUpdD1X1iyni7rSegF3MgTlBNK+1pMrR+4delBfM
	GkBy4ngLhcFmgrDQQvlXJnQxdk4HAfHjZEQ==
X-Received: by 2002:a17:906:2bc6:: with SMTP id n6mr11698984ejg.256.1626260745930;
        Wed, 14 Jul 2021 04:05:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyI4CvUYcTWl6G0R5zjAVAwdxWVjR/fPRrczk/Uq8Urf2oH2chqt5iHv9QEf93iQgcAJCs33A==
X-Received: by 2002:a17:906:2bc6:: with SMTP id n6mr11698975ejg.256.1626260745788;
        Wed, 14 Jul 2021 04:05:45 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id qp12sm637689ejb.90.2021.07.14.04.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 04:05:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed, 14 Jul 2021 13:05:17 +0200
Message-Id: <20210714110518.104655-16-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
References: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: WC35JYSQOCVMCIHZ63OL2LBC2E62JDNR
X-Message-ID-Hash: WC35JYSQOCVMCIHZ63OL2LBC2E62JDNR
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 15/16] unit: do not open-code freeing ndef message
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/WC35JYSQOCVMCIHZ63OL2LBC2E62JDNR/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use near_ndef_msg_free() instead of open-coding it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-snep-read.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/unit/test-snep-read.c b/unit/test-snep-read.c
index 414b801a5e71..0a2010a677e1 100644
--- a/unit/test-snep-read.c
+++ b/unit/test-snep-read.c
@@ -896,8 +896,7 @@ static void test_snep_response_put_get_ndef(gpointer context,
 
 	g_free(req);
 	g_free(resp);
-	g_free(ndef->data);
-	g_free(ndef);
+	near_ndef_msg_free(ndef);
 }
 
 int main(int argc, char **argv)
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
