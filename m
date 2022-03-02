Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3534CAEA1
	for <lists+linux-nfc@lfdr.de>; Wed,  2 Mar 2022 20:25:40 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 67D87100F3FB5;
	Wed,  2 Mar 2022 11:25:39 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 57D3F100F3FB5
	for <linux-nfc@lists.01.org>; Wed,  2 Mar 2022 11:25:36 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AEAD03F5F7
	for <linux-nfc@lists.01.org>; Wed,  2 Mar 2022 19:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1646249132;
	bh=15HOmnObJXsVXxZJ5x/3DtxcDfRhMgZoa5zrHrITnNA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=m2iWuTsbzZ0fn/Kxc87HP8Lc1/jvXzwP/jkvWD8zKwW1boaOo5y1hRgPW1wGYmJcc
	 ttXoRtM60lZ+cu1wGeS7r/MVffgFYd9DIMCN3etZVkNutEyKLBYdUnoIj7lckWI5MS
	 Vu4ER0iEbVek0XQiQqJewXSgWJvoNqnya3mMAyEos4G0XvvaLnQqPMxQDEDiXmWxSg
	 T/1nrCvTJuyNgnKVDC+liZ2RnE3c00Ai8xz8Obh3S+J2LsFd1Pyovca8QNQIY5EG1r
	 EBmQsy4uBTPm1Q2626iVkSCa+0/YKmyRStvRGLcwce4WMD2b59yV2Otv5idpMFyUqq
	 T1fEWaz8j53hQ==
Received: by mail-ej1-f70.google.com with SMTP id la22-20020a170907781600b006a7884de505so1495798ejc.7
        for <linux-nfc@lists.01.org>; Wed, 02 Mar 2022 11:25:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=15HOmnObJXsVXxZJ5x/3DtxcDfRhMgZoa5zrHrITnNA=;
        b=V8zyrxRAADP3qy3NT54t9JSoQ+zf0CBnKRysGXT2oFU1CaaDBWvzENdo6m6wbsPa1S
         oncewWKfTabw5Etyf72EAIT0Qr5Kcs3SWU35qk98Fl8/aIWIcV5XZGkHxhlAtxiAX5E6
         Mfoa2eO5OdmSYm8GBcEs7eujrjCmyqneDl6uaL8f4rYi2LfVSBDoV6zHpJS8zu1Mkbwn
         4ov7peauCPDXBDE83xc8O2id06RhgzfHqfvCUtlOqSCluv1xkOgqI9GkdZkfInI14mTk
         4yZGkFBb/71hdVvzu3feN/PEEU62VJoC0O33/sdB8d03gMmliXEijzYdy+uNCV6g7p4L
         SR2g==
X-Gm-Message-State: AOAM533xNImy0c8ib5D8XPbSb6XueS99Zx1hmMgVIstaYk+YZ+7vzlGR
	TnTHqZ92i7hLuLKWF3jiG7OEtrgkLcg5EigdZZgKStXzqdCeWbJRN5VpHsv9AsAy+E5KILWn4TI
	pjqeYTtw4znBcGhQJdQNvgpp7/4S92YXmgA==
X-Received: by 2002:a17:906:7751:b0:6ce:e3c:81a6 with SMTP id o17-20020a170906775100b006ce0e3c81a6mr23328453ejn.278.1646249132425;
        Wed, 02 Mar 2022 11:25:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzoNWOZ7D/uCsO1FWpSxrBelZ9YFjgouGbue8Nl1lS/Y1LnCK8P6xOlohDZjyDgtT/p5sfpXA==
X-Received: by 2002:a17:906:7751:b0:6ce:e3c:81a6 with SMTP id o17-20020a170906775100b006ce0e3c81a6mr23328438ejn.278.1646249132223;
        Wed, 02 Mar 2022 11:25:32 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id i14-20020a50cfce000000b00415b0730921sm1482765edk.42.2022.03.02.11.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 11:25:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed,  2 Mar 2022 20:25:21 +0100
Message-Id: <20220302192523.57444-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220302192523.57444-1-krzysztof.kozlowski@canonical.com>
References: <20220302192523.57444-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: ABXZZ7QDXSP6NIEHXBTRK3PAQFUSRYMW
X-Message-ID-Hash: ABXZZ7QDXSP6NIEHXBTRK3PAQFUSRYMW
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [RESEND PATCH v2 4/6] nfc: llcp: use test_bit()
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ABXZZ7QDXSP6NIEHXBTRK3PAQFUSRYMW/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use test_bit() instead of open-coding it, just like in other places
touching the bitmap.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/llcp_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 5ad5157aa9c5..b70d5042bf74 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -383,7 +383,7 @@ u8 nfc_llcp_get_sdp_ssap(struct nfc_llcp_local *local,
 			pr_debug("WKS %d\n", ssap);
 
 			/* This is a WKS, let's check if it's free */
-			if (local->local_wks & BIT(ssap)) {
+			if (test_bit(ssap, &local->local_wks)) {
 				mutex_unlock(&local->sdp_lock);
 
 				return LLCP_SAP_MAX;
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
