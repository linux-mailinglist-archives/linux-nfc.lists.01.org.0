Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68896408CD5
	for <lists+linux-nfc@lfdr.de>; Mon, 13 Sep 2021 15:20:52 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id C8E20100EBB9E;
	Mon, 13 Sep 2021 06:20:49 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id DD46C100EBB96
	for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 06:20:47 -0700 (PDT)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B75D240270
	for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 13:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631539246;
	bh=Lf3U+DHYhMpuIl7nTJH6GPAYe+llXfLG7+wtuS7r1DY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=C9UVcbIUq3O4jN/3iHXwE6SSuKueuzAPU+yMYAhssYEWhd+HFJKX9NQCyZeGXBBm0
	 i542P4TyYCPz9wzsaKw1+fcRKbXbNbDzmnsgaPX6BuyUYa8Hr+Bq+kRESdzohlzahQ
	 zzqQAtkNcArCVaQEdKTWb0HvdE/bhhQ4fkEG1Su94IviI5ofwt3RNBlTGsY1kLN+Xm
	 G5gh62mfmk1AcRG82xVUhZV+pb5cd7YldXe96TNdn8LBXR6zEx9Hf1f1lHL5gaY2hz
	 oYRQK7bN1s9aoNeXAb7oNZeAXtUYB54cpWYSIe0NfD9ynDM9aPioGj45N93QuqxO9G
	 +6TFKvJ63c5Fw==
Received: by mail-wr1-f69.google.com with SMTP id r7-20020a5d6947000000b0015e0f68a63bso459781wrw.22
        for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 06:20:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lf3U+DHYhMpuIl7nTJH6GPAYe+llXfLG7+wtuS7r1DY=;
        b=iBdUmuYha8SEvmzyVieugbCh9PuFuJkuK8baH0oA3gFB297Sc0jwki5LVzxfluDRSl
         LAh7vB6l1blIRvZ2ovH2CU33ppYRgXLE0TobAi0u3oZpY4bFksRfrLn8/8oxLIueaf7K
         TF/TKtNLWlOIa5ESC66fdkJwnuCwIX/hHxwrAeCkU5FREEzfWak5b1Z6caTtqjfdL1EU
         kqI9kTKJofOp0RU1u4e6cf8vRMAe2C2HV+LKISi+4R/gV37tYIPPc8N0D20DxN7dEiww
         yCpyyS28yI7TVAqXTB7Y/J19Bol9q0OO2f3/Qm/rxjp+pLyiG7LPziLeePOTWksbiSRb
         ZNcQ==
X-Gm-Message-State: AOAM531Jfno7ozxs/MVP84Ju+FCiCc7gDfJQuxElKwkJLSgquzWXwQAw
	oUlwtLu3LidRE/t7o7B0Vkhh4qHec9SWhg1ntaRPnNch2kXIPAbyZoTx67zaoE/7gNlqgT00Bv6
	Bmi6h837zYTmFUp9x5/2asiRQTVUKcQCuYQ==
X-Received: by 2002:adf:f90f:: with SMTP id b15mr12528811wrr.364.1631539246422;
        Mon, 13 Sep 2021 06:20:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwO4lsG5wdmhKIDutLLy9acqil5ZkWEOWZw6YwdcZcxBYqUrgu1dwPeeITR5yS7gtM6A2hFVg==
X-Received: by 2002:adf:f90f:: with SMTP id b15mr12528787wrr.364.1631539246274;
        Mon, 13 Sep 2021 06:20:46 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id n3sm7195888wmi.0.2021.09.13.06.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:20:45 -0700 (PDT)
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
Date: Mon, 13 Sep 2021 15:20:23 +0200
Message-Id: <20210913132035.242870-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
References: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: QCAAHR3XD4DNDLN6BB5O72YOLYFSZXAH
X-Message-ID-Hash: QCAAHR3XD4DNDLN6BB5O72YOLYFSZXAH
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 03/15] nfc: nci: replace GPLv2 boilerplate with SPDX
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/QCAAHR3XD4DNDLN6BB5O72YOLYFSZXAH/>
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
