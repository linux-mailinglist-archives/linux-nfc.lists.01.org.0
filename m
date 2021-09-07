Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C329F402859
	for <lists+linux-nfc@lfdr.de>; Tue,  7 Sep 2021 14:18:33 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id F0CE0100EBB9F;
	Tue,  7 Sep 2021 05:18:29 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 822B5100EBB8F
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 05:18:27 -0700 (PDT)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EB21F40191
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 12:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631017105;
	bh=Lf3U+DHYhMpuIl7nTJH6GPAYe+llXfLG7+wtuS7r1DY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=nnymz8kp/mgzjScIEynJSLO0Mz2YcEfaFbhDyohlg4NxN8OWavup8s34wsYvdgt2+
	 Sps/J7Upxp7riu4drfB6OlQ9kwBSRfv1vcMAC34509xEIQP/iIXsiOkOpZooL7VArD
	 HOgmVq12UXlLzuv8bmtgbjWS4u4JvsVGkEhTtk33yWchKmOd53MjTAZoPMCqy/0MJX
	 uTJMSQHAKzLaTBfMUoMGXJM4qfk9lWxSis1yxZb+GRjzQMlAXJq+uaF4I7Ta5JqG4I
	 yyQAfDyorNATsnr2h4eNVIuoif7U9ZdVPQToTbUgRGs09JsFAHamlvtuk6VW+ryl3y
	 hVs99MdtojFoA==
Received: by mail-wm1-f72.google.com with SMTP id 5-20020a1c00050000b02902e67111d9f0so3318673wma.4
        for <linux-nfc@lists.01.org>; Tue, 07 Sep 2021 05:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lf3U+DHYhMpuIl7nTJH6GPAYe+llXfLG7+wtuS7r1DY=;
        b=sp04yOc556OY010VCglDpLfLmEpOcsPqlIy0zjaBzdKq56jssuRvYimg19qVGdfB33
         mVN7dFq2ijCQgSGL8BvfA27mx7/AX3Mw06+RbTWgCAy16ZcN+o+yXQMLZsrp8CwU83jH
         BcA18vH5gMtq/PnQ9FbmlfJ0y/Bt1tW77s6IsHRpaWK7jwezz8ITBjm3I1fRKRIrn7qs
         wOgEglynbNJ7AbjsRv7AqishaE+fUVtzVEXeVP7qeyBc1O2TpO/QJRs0G+c4sZ7Xx5+a
         EJa1c5g4WNu0ceuxJTkDvAG6LtkNPZ+3du3wvYLMPvsgqNuxr3+Kx4nA3hfK5zWuQ5tI
         7y+Q==
X-Gm-Message-State: AOAM531AVQerqhWxcIr8V26eczWRXJYY/A9ULAUhV4DrHkqHKJWcDUXY
	TPn/pY2ioSozLTH4nEOg3RoRU3/mScyMB2HElOCxwimTXQnPCFT2h5H30D3CNz2LVJ3+7/YpERu
	4mHlhkmSKHjZIJxdX6hcZjd7L7Sa/iqMe1g==
X-Received: by 2002:a05:600c:a49:: with SMTP id c9mr3543978wmq.159.1631017105645;
        Tue, 07 Sep 2021 05:18:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGnITbLQyBPqv15Y5qGEl25iI8Aaoxxgo0CFdcBuZBhKAuVcx8mn1j6CPUzijO1vm85/0Uww==
X-Received: by 2002:a05:600c:a49:: with SMTP id c9mr3543965wmq.159.1631017105503;
        Tue, 07 Sep 2021 05:18:25 -0700 (PDT)
Received: from kozik-lap.lan ([79.98.113.47])
        by smtp.gmail.com with ESMTPSA id m3sm13525216wrg.45.2021.09.07.05.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 05:18:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Krzysztof Opasiak <k.opasiak@samsung.com>,
	Mark Greer <mgreer@animalcreek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Date: Tue,  7 Sep 2021 14:18:04 +0200
Message-Id: <20210907121816.37750-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
References: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: DOAIHOFZVKS7A6TXBBOAUESPSFKDUFRP
X-Message-ID-Hash: DOAIHOFZVKS7A6TXBBOAUESPSFKDUFRP
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 03/15] nfc: nci: replace GPLv2 boilerplate with SPDX
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/DOAIHOFZVKS7A6TXBBOAUESPSFKDUFRP/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Replace standard GPLv2 only license text with SPDX tag.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/nci/uart.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/net/nfc/nci/uart.c b/net/nfc/nci/uart.c
index 502e7a3f8948..65814dd72618 100644
--- a/net/nfc/nci/uart.c
+++ b/net/nfc/nci/uart.c
@@ -1,20 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2015, Marvell International Ltd.
  *
- * This software file (the "File") is distributed by Marvell International
- * Ltd. under the terms of the GNU General Public License Version 2, June 1991
- * (the "License").  You may use, redistribute and/or modify this File in
- * accordance with the terms and conditions of the License, a copy of which
- * is available on the worldwide web at
- * http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
- *
- * THE FILE IS DISTRIBUTED AS-IS, WITHOUT WARRANTY OF ANY KIND, AND THE
- * IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE
- * ARE EXPRESSLY DISCLAIMED.  The License provides additional details about
- * this warranty disclaimer.
- */
-
-/* Inspired (hugely) by HCI LDISC implementation in Bluetooth.
+ * Inspired (hugely) by HCI LDISC implementation in Bluetooth.
  *
  *  Copyright (C) 2000-2001  Qualcomm Incorporated
  *  Copyright (C) 2002-2003  Maxim Krasnyansky <maxk@qualcomm.com>
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
