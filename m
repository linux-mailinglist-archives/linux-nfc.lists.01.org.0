Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB79428E30
	for <lists+linux-nfc@lfdr.de>; Mon, 11 Oct 2021 15:39:25 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 37B4A100F3FAE;
	Mon, 11 Oct 2021 06:39:22 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id E738D100F3FA0
	for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 06:39:19 -0700 (PDT)
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A3CF13FFFE
	for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 13:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633959558;
	bh=8wnvnlFr7Z9I1aV6d98j8RCw9C64nkeTjGiPt6idSBY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=Kg6M+/VzyrruV4oqFThM1uruFoMVzBOuK6fGtBZP3yn3/lQBzUqAKLBivqqUvvTrP
	 W8MrmzUfqZnr9rvenkEdJZLcZoHwLGXppKVzvA444H93Tuvbk6oh0BA9b2E5OVu7xo
	 IWb0+cGBcg/yIHWqUZFEs+cFCEEWMgh/B2N1qr8ZIrDfCGsu7My0usP2dv+wGXcHHq
	 G+kTRvYJOuIRDa1PU9ZKJk855UlwJeBiOU+MkrrUJBkpyl44Lm96ztBi3JUhjp1Jg8
	 qO/kvQm1Tda/aiPDENqTWTaaSbLwoDchQQY6dId0AGsJ13GKxwbtbdzWcwWyOdFkNh
	 CIY1vbcde+Tog==
Received: by mail-lf1-f69.google.com with SMTP id v2-20020ac25582000000b003fd1c161a31so12692974lfg.15
        for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 06:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8wnvnlFr7Z9I1aV6d98j8RCw9C64nkeTjGiPt6idSBY=;
        b=T8bBSLpxBHZQu7GTs/84KcwDyuNDqclALtxKtGA2E2/KAlt4usSv1EZfUDORmqIwUg
         WN7yI5Tddt4g86PmwGFkpXyn10oz1g8+9M9ynGPAgmAEONynqPK1+6paOu/9/0AmQX/r
         H9xVlWWRboPyk3Nb1v477Y7sRl/FnUdIGIgcdaxhaHeaGsKeNDnBo3jbYXlG8EY7kqID
         PxGFLm17SmX15qve2wcBkeq/Nb/7JDfnn4fmHeSDu/vOxMisa/R5j2YLi0xHAp15CwJ0
         2hblN7bgh+R4ZTZS7NW8+l/vQj1mxBBhF6p5AZffh02C6IJM7yk2mAcVkKPrD1Dh/OPV
         pEHg==
X-Gm-Message-State: AOAM530mWRp4U3yxCaJFSPA+R0cX9p+u9eHqjrsl7d/tUWzsvpQ+rqGo
	g8E76aYYU44h29V3ReJtAE6LjT/g0Q/iRoXfbjxT5xhfNFap1doZkcvxNoMDRFfNix6n6EoWCq6
	j1CorEpO2qa/C8WeZyLmkUecIRuwUI9cSVA==
X-Received: by 2002:a2e:6e0d:: with SMTP id j13mr23981194ljc.91.1633959558151;
        Mon, 11 Oct 2021 06:39:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1mjKnXef4PGGuh6A2lQ0EMTl+ZwPQ5YLz++4hccLWfHMjPwyjX1r4pco9/JD2L+P+ga9cPg==
X-Received: by 2002:a2e:6e0d:: with SMTP id j13mr23981169ljc.91.1633959557980;
        Mon, 11 Oct 2021 06:39:17 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a21sm738971lff.37.2021.10.11.06.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 06:39:16 -0700 (PDT)
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
Date: Mon, 11 Oct 2021 15:38:30 +0200
Message-Id: <20211011133835.236347-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211011133835.236347-1-krzysztof.kozlowski@canonical.com>
References: <20211011133835.236347-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: SW4XFNZSZQWQETK3DLP5TPYFDTIDVKSD
X-Message-ID-Hash: SW4XFNZSZQWQETK3DLP5TPYFDTIDVKSD
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: joe@perches.com
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v3 2/7] nfc: nci: replace GPLv2 boilerplate with SPDX
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/SW4XFNZSZQWQETK3DLP5TPYFDTIDVKSD/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Replace standard GPLv2 license text with SPDX tag.  Although the comment
mentions GPLv2-only, it refers to the full license file which allows
later GPL versions.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/nci/uart.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/net/nfc/nci/uart.c b/net/nfc/nci/uart.c
index 9bdd9a7d187e..c027c76d493c 100644
--- a/net/nfc/nci/uart.c
+++ b/net/nfc/nci/uart.c
@@ -1,20 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
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
