Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B99A394495
	for <lists+linux-nfc@lfdr.de>; Fri, 28 May 2021 16:56:27 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 01B15100EC1D7;
	Fri, 28 May 2021 07:56:25 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 3444E100ED4AB
	for <linux-nfc@lists.01.org>; Fri, 28 May 2021 07:56:24 -0700 (PDT)
Received: from mail-ua1-f69.google.com ([209.85.222.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lmduQ-0004Ao-PL
	for linux-nfc@lists.01.org; Fri, 28 May 2021 14:56:22 +0000
Received: by mail-ua1-f69.google.com with SMTP id o7-20020ab01e870000b029020d37e3e144so2039147uak.1
        for <linux-nfc@lists.01.org>; Fri, 28 May 2021 07:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kOll6TKQbDWTse8M6wamAPtyvMVGYz69R1ORjx1lV/0=;
        b=ps+ax8iOUp6kLcdESIkxGyKz/G9W0+FG6U3B3/NatND48sZscgvlNPx0FM5hGp/shD
         lNzMuuhA7D+2GRrBJtf6hRL2aFJTlFAw308xmEkAsRsWzWsyqXS0sguD/kEIK4RUOuGc
         dbgUuGw7ylzbzTJCxLDam552HfWLds9jL4nO8zAB9oivK+6QGJegriFTEHbesOc56IIH
         +JWGq8Di3jABEYWER9v3tH8zOl7e/QMi4IcKG3qsQzbKhdgkWzLZW7E8MMO5zvr8j7xl
         WduIOiem5RPzdxSRASjXFO9wAUmxNKKiptv0s0W6+j08xE36IRLZoFTBGN9N0j+FXjbq
         DhTQ==
X-Gm-Message-State: AOAM532FCP2sdg8woHbvcdgLwgAKXexOgEtBL9WYnO/0iRZJ//f0Moej
	3GXxo2jcRmpCZxXWAXyq+l10lKv5+IXhmcbJbzQGKp64snin/SUU3J1RTQS1TduPLxqIKvVAwsL
	LEjAwNcqN6W/zE+WyqlUOSrHPyZ0pqllCyA==
X-Received: by 2002:a1f:a910:: with SMTP id s16mr6919066vke.10.1622213781949;
        Fri, 28 May 2021 07:56:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4AhxZK2XYM4OiqRRBIBQMjJThDP+GKPg/Kb1XvgWUz6kwSBd+aWgoZQ6H46zZdH9u+CAu3w==
X-Received: by 2002:a1f:a910:: with SMTP id s16mr6919045vke.10.1622213781776;
        Fri, 28 May 2021 07:56:21 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c15sm743661vko.15.2021.05.28.07.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 07:56:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 28 May 2021 10:55:28 -0400
Message-Id: <20210528145534.125460-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210528145534.125460-1-krzysztof.kozlowski@canonical.com>
References: <20210528145330.125055-1-krzysztof.kozlowski@canonical.com>
 <20210528145534.125460-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 5S7YLFV553CTXPIEVYG4QDUWORRPPKU7
X-Message-ID-Hash: 5S7YLFV553CTXPIEVYG4QDUWORRPPKU7
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 05/11] nfc: mrvl: simplify with module_driver
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/5S7YLFV553CTXPIEVYG4QDUWORRPPKU7/>
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
