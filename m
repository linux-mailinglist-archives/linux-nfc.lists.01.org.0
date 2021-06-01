Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3F7397781
	for <lists+linux-nfc@lfdr.de>; Tue,  1 Jun 2021 18:07:23 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id C1E55100EF267;
	Tue,  1 Jun 2021 09:07:20 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 1002F100EF25B
	for <linux-nfc@lists.01.org>; Tue,  1 Jun 2021 09:07:18 -0700 (PDT)
Received: from mail-ed1-f70.google.com ([209.85.208.70])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lo6vF-0006pK-1A
	for linux-nfc@lists.01.org; Tue, 01 Jun 2021 16:07:17 +0000
Received: by mail-ed1-f70.google.com with SMTP id c21-20020a0564021015b029038c3f08ce5aso8147536edu.18
        for <linux-nfc@lists.01.org>; Tue, 01 Jun 2021 09:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NG5lMIADTn8CON0lTv5ao0jAEzyt4S1tTd5JRxguyoQ=;
        b=eJkNAobEnPqhy39b90ugvhLCk4brWv9lkJfD4ymFSyT/pVd3SLwe+oLWpTbJ+UjWiE
         cG0znOgO5c3P5nN1J7aTq49sSS1PfKcRj+ZFxvqzI2srk9HFnWVGNZdP+9QkpmRAjjbN
         /a4/gqIVPkFke7hjaBJILWrLbRQqnKYAfo6iSABqs4F9mKgod2sQohf9QpG/jyqQml3q
         tub6RfIcm2dhC3GJbM+jALfAdSPUQzYDP3nVnPs4j4FcFm6ELSMyJ6uNPp8vnRw9o+8/
         3zQRphiHWnTmFNM6calja9EqutALGIa+AoxPb8HbINV/Pr4071LrIYxdyZCUA7muuwTv
         WTVg==
X-Gm-Message-State: AOAM533/lAw3pO2HBlXUXFptjDI2sXfK5vwlJwNt1lcbOw6qpEvt0xYv
	+NyNPXp9FFY7uhbLYS1OHzHXSWKjVrm+BX2gGaNtuQ9b1d3dKWq5GFswuxQkv/4yFR7Sx77hqT7
	OB/pDMf7QsomyikeEI0yVne5cf1Y7FKPekA==
X-Received: by 2002:aa7:c359:: with SMTP id j25mr32834982edr.171.1622563636773;
        Tue, 01 Jun 2021 09:07:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXuDJan1liufQhFoz7cUP5EJTQ5z9AdgUXI1Nfs/cIJjXy6zEGa76y2xp/KLXolqsq/Wozgw==
X-Received: by 2002:aa7:c359:: with SMTP id j25mr32834972edr.171.1622563636677;
        Tue, 01 Jun 2021 09:07:16 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id dk12sm3382668ejb.84.2021.06.01.09.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 09:07:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Tue,  1 Jun 2021 18:07:13 +0200
Message-Id: <20210601160713.312622-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Message-ID-Hash: UDLUFLTEKMTQS73D3GESXB7Q456RJB4E
X-Message-ID-Hash: UDLUFLTEKMTQS73D3GESXB7Q456RJB4E
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH] nfc: mrvl: remove useless "continue" at end of loop
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/UDLUFLTEKMTQS73D3GESXB7Q456RJB4E/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The "continue" statement at the end of a for loop does not have an
effect.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/nfcmrvl/usb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
index bcd563cb556c..433bdc37ba91 100644
--- a/drivers/nfc/nfcmrvl/usb.c
+++ b/drivers/nfc/nfcmrvl/usb.c
@@ -325,7 +325,6 @@ static int nfcmrvl_probe(struct usb_interface *intf,
 		if (!drv_data->bulk_rx_ep &&
 		    usb_endpoint_is_bulk_in(ep_desc)) {
 			drv_data->bulk_rx_ep = ep_desc;
-			continue;
 		}
 	}
 
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
