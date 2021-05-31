Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5DA39564D
	for <lists+linux-nfc@lfdr.de>; Mon, 31 May 2021 09:39:15 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id DC5DD100ED48C;
	Mon, 31 May 2021 00:39:13 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 3AD82100EF267
	for <linux-nfc@lists.01.org>; Mon, 31 May 2021 00:39:12 -0700 (PDT)
Received: from mail-wm1-f69.google.com ([209.85.128.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lncVy-00036Z-QN
	for linux-nfc@lists.01.org; Mon, 31 May 2021 07:39:10 +0000
Received: by mail-wm1-f69.google.com with SMTP id x20-20020a1c7c140000b029018f49a7efb7so4435745wmc.1
        for <linux-nfc@lists.01.org>; Mon, 31 May 2021 00:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kOll6TKQbDWTse8M6wamAPtyvMVGYz69R1ORjx1lV/0=;
        b=mNVUMmWYHlJmA+itklvqu5bFhvfR4twHQdgaI6EM20WwHos9zEiicl028anOEzpl3D
         EqmUXFfuzHVZVgASmkzKvd7sJQCcKLtfI5OXDUwVyRUfB5R8DUSQs+c3cBVfW1ms8z5s
         yAsM8YHVuC4WFkC3SkkIW1aSCJZxX6ey8a2eWXAOI/a7QEWcD6ghxhn+/I1WshhA0For
         zmmvR1v39iR5wRP/4cnSra0qTOplcPRrn2YwziyU8ap75D2t0VZx6XF+DAS63HlQDKwG
         eEgcrdoT+ewDmTpRAl8T8Lg+wvDnpdXTmLOv2ilTIG2jqRWBdAOhsPqYaUKNVHkqiD46
         8dLA==
X-Gm-Message-State: AOAM533pRusw9kxUxKDUt0bMg2ET/xhSk3SCnnlLlEwaj/lrPxgzOz4W
	tqrsbn+0UG+Q5msZ60Ghrv3I9A2jZmplFggBc7VWHFQfZo061g03/dROApekohQ68qvUkpuPdZt
	n+EkFItKttNnUFGJmIZEq642LQRH+fRmkOQ==
X-Received: by 2002:a05:600c:2059:: with SMTP id p25mr4703729wmg.56.1622446750622;
        Mon, 31 May 2021 00:39:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsIR56tR1+XGrfQapnZONUGR+r+w7KQN84keiQfNaaA1hDubeRB9qINkqZRXhWIEB3B3hmNA==
X-Received: by 2002:a05:600c:2059:: with SMTP id p25mr4703716wmg.56.1622446750484;
        Mon, 31 May 2021 00:39:10 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id a1sm9168911wrg.92.2021.05.31.00.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 00:39:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Mon, 31 May 2021 09:38:56 +0200
Message-Id: <20210531073902.7111-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210531073522.6720-1-krzysztof.kozlowski@canonical.com>
References: <20210531073522.6720-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: TGNJZWKNWAN5NVC47M7CMQO3FFBD5YAV
X-Message-ID-Hash: TGNJZWKNWAN5NVC47M7CMQO3FFBD5YAV
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [RESEND PATCH 05/11] nfc: mrvl: simplify with module_driver
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/TGNJZWKNWAN5NVC47M7CMQO3FFBD5YAV/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove standard module init/exit boilerplate with module_driver() which
also annotates the functions with __init.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/nfcmrvl/uart.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index ed85645eb885..50d86c90b9dd 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -189,23 +189,7 @@ static struct nci_uart nfcmrvl_nci_uart = {
 		.tx_done	= nfcmrvl_nci_uart_tx_done,
 	}
 };
-
-/*
-** Module init
-*/
-
-static int nfcmrvl_uart_init_module(void)
-{
-	return nci_uart_register(&nfcmrvl_nci_uart);
-}
-
-static void nfcmrvl_uart_exit_module(void)
-{
-	nci_uart_unregister(&nfcmrvl_nci_uart);
-}
-
-module_init(nfcmrvl_uart_init_module);
-module_exit(nfcmrvl_uart_exit_module);
+module_driver(nfcmrvl_nci_uart, nci_uart_register, nci_uart_unregister);
 
 MODULE_AUTHOR("Marvell International Ltd.");
 MODULE_DESCRIPTION("Marvell NFC-over-UART");
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
