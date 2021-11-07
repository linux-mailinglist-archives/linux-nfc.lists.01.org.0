Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB2A447340
	for <lists+linux-nfc@lfdr.de>; Sun,  7 Nov 2021 15:14:12 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 7A745100F479D;
	Sun,  7 Nov 2021 06:14:09 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B93FB100EAAFE
	for <linux-nfc@lists.01.org>; Sun,  7 Nov 2021 06:14:06 -0800 (PST)
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 46EDC3F1A0
	for <linux-nfc@lists.01.org>; Sun,  7 Nov 2021 14:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1636294444;
	bh=O9pqCgMsXCaNEj0SpUPq8dlJCX+c7h9cDUUijvaulx0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=mAdRykuFTYV4poZFUyWqpRB30FtJu9uB7stMGEqJ1HAX+rA/qbBY123phz6Ywf98Z
	 CKjJQ8EQqJiQBLJ6jN8ysuLAsanmjVzrF5y0xY1ZlQt1Y5OA1TlHdqDNcGO715YhnD
	 uGT0a0heigRODYhG2iqfKDAT9M6OhcJq01Nz5mfLfzBV+kczcgzshXn14eqpcF5ZGH
	 N4kn7ZNIgr5d0zMYh3Mq2NmqX77scUKCD2d+WXzkQd7ovOIfXteHt4r0IeKnR+vDUC
	 RepjA6hNJbYfhjsmzZ4B/SGv7wDsD88R4iAL0gav86Q/LIr/3LVVEkOrV9qWfYKoif
	 ix3wPKDxHyiLw==
Received: by mail-lf1-f72.google.com with SMTP id z12-20020a0565120c0c00b004037427efb7so86783lfu.1
        for <linux-nfc@lists.01.org>; Sun, 07 Nov 2021 06:14:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O9pqCgMsXCaNEj0SpUPq8dlJCX+c7h9cDUUijvaulx0=;
        b=BI7Ggz2TNew6h42m8uNlvW83AqCD8BOVYUd/9SGSCbhMByn2tGejx4zQirljRqK4rx
         G37rUzyshKzrsJ2fjthtmUMZPZCrU/1VwkkBhaNSbcyCErqHp0kAGZZxgKykfAqv5rlH
         Ub5u7aiDMp5HN2cbUsZY6knVkKzbc7cxl6sIzJm8AtqlJl4genoHtVTNOPM/KWhW0dSh
         06BhEh0XquiZPdzd0P5LYkPtUe6JMvcJxZy3DDmVmpvhEsq6yIsTRe2Hsrk6G2q3hEDm
         TwW3PB37dUThJ33WzUsyvm4Rzfu/q0EYw2ZQUmUcFXbQWNFNZWbgAbrYN5v/E5dVcJ8V
         bwEA==
X-Gm-Message-State: AOAM531o2eL61XxPA2sKAcb4/DIe6qbyfqhBNtCUUDkkFNMUKs1bc7SH
	cEJ8aCFKt02ySrxWazEz45WsEjwyAoEDrcEbpfUTs26qaixcnivVYFXo7qL9VWQNvFElDpTjneQ
	Z8tKsNZEJFxfEYZ78fw77TDcdzif+UVP2Mw==
X-Received: by 2002:a05:6512:388e:: with SMTP id n14mr19430185lft.72.1636294443601;
        Sun, 07 Nov 2021 06:14:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuH1fKHFHacU0lmRyB5Colku3qqo+9IOCcLj0U1LZ/I5Q+tnSl6nsY4lQLrZ5FxRoPfk/71A==
X-Received: by 2002:a05:6512:388e:: with SMTP id n14mr19430164lft.72.1636294443378;
        Sun, 07 Nov 2021 06:14:03 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id d16sm285435ljj.87.2021.11.07.06.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 06:14:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Sun,  7 Nov 2021 15:14:00 +0100
Message-Id: <20211107141400.523651-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Message-ID-Hash: KDDZMSVNNWE2PKFXGEJYP5CNTAFVFSZR
X-Message-ID-Hash: KDDZMSVNNWE2PKFXGEJYP5CNTAFVFSZR
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH] nfc: port100: lower verbosity of cancelled URB messages
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/KDDZMSVNNWE2PKFXGEJYP5CNTAFVFSZR/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It is not an error to receive an URB with -ENOENT because it can come
from regular user operations, e.g. pressing CTRL+C when running nfctool
from neard.  Make it a debugging message, not an error.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/port100.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/port100.c b/drivers/nfc/port100.c
index 16ceb763594f..d7db1a0e6be1 100644
--- a/drivers/nfc/port100.c
+++ b/drivers/nfc/port100.c
@@ -624,7 +624,7 @@ static void port100_recv_response(struct urb *urb)
 		break; /* success */
 	case -ECONNRESET:
 	case -ENOENT:
-		nfc_err(&dev->interface->dev,
+		nfc_dbg(&dev->interface->dev,
 			"The urb has been canceled (status %d)\n", urb->status);
 		goto sched_wq;
 	case -ESHUTDOWN:
@@ -678,7 +678,7 @@ static void port100_recv_ack(struct urb *urb)
 		break; /* success */
 	case -ECONNRESET:
 	case -ENOENT:
-		nfc_err(&dev->interface->dev,
+		nfc_dbg(&dev->interface->dev,
 			"The urb has been stopped (status %d)\n", urb->status);
 		goto sched_wq;
 	case -ESHUTDOWN:
@@ -942,7 +942,7 @@ static void port100_send_complete(struct urb *urb)
 		break; /* success */
 	case -ECONNRESET:
 	case -ENOENT:
-		nfc_err(&dev->interface->dev,
+		nfc_dbg(&dev->interface->dev,
 			"The urb has been stopped (status %d)\n", urb->status);
 		break;
 	case -ESHUTDOWN:
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
