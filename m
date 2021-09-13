Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 261D3408CD7
	for <lists+linux-nfc@lfdr.de>; Mon, 13 Sep 2021 15:20:56 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E8869100EBB98;
	Mon, 13 Sep 2021 06:20:54 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 255DC100EBB98
	for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 06:20:50 -0700 (PDT)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A8FE33F30E
	for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 13:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631539248;
	bh=hZ5N4zB6ne7AqKTWsazgl2eww5+7SrfSBiF0jiwRIRU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=V1WQ8oEoicl90mvQNd5qeVdtYBcGUzTnTBdbkiexfaoQVW3anJPjherjStF0XGr0n
	 XcnthW4fF+R5Z1Qfwov06Dg0CC/Vz4UCYpzlijha2Edn0zHU/JPvG/QU1Zb/q9pqnX
	 qRz0PfdjRJxcAgp4R4w7Nz+BH/AUiO7T7h3N7R4xEPccqgozuJG0thaGJ2fX1jg4Hz
	 p28zpnUJldrV+m4q4FvWan2YvAyvEEHkInelVt8xYyLC3z2Dix1bdrd/JfSlEhe7Qv
	 bpX/m0i7vaAyZMSnf7u3f3GBwEx/lZsANcfWoxbhLgGlDLM/wcasF0zYN+87b67gpp
	 oJGhQlKs9CDZQ==
Received: by mail-wm1-f71.google.com with SMTP id m4-20020a05600c3b0400b00303b904380dso2609457wms.6
        for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 06:20:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hZ5N4zB6ne7AqKTWsazgl2eww5+7SrfSBiF0jiwRIRU=;
        b=5pByHX5Z4sQRj+PhXohjISqlRPVvP/5f+fwQ80hlpxvbUAZtGzOfwaJG+7XuErJkif
         FVTq2Gx1kPq8fycPEjnS5wq21YcIHfudB7OQsgb4bJBZGyKyi5fwEV4R4Iu2JxQ48dax
         OeQyV/mR1gWcvr5oFsFxdX20gg2RABWBwIIYIdUbMVFDODIRxsCYzLmhwLXHC8FrxqHV
         KOdQnf5e9m0gdiRyTJG24psEYoJuOI8eDvgesVG1kDM9/tmmy99TcGcQBl+PnOfIfjjk
         vfDMbpHkjkUSpnj+iXHGosV1QGtghHwTPmnZgtSbWz7Db6ydEyel5VG0DUNahTeYs15p
         rApw==
X-Gm-Message-State: AOAM531grI9TTIU7T4xqoua5NxpEf9q+FJ4TaJBqDQaiWT9f95znHPxu
	gjU1nr9iRn7xGKMTprl4UIaJ1ZLSIBEmL15Tzy4eFrYsxgkD9BS7pCISxY4I2TJjNkSvo/cYb5u
	LcXvdPa20oR/2XP8gCn7ayVjAOBmlp2VP1g==
X-Received: by 2002:a7b:cbd4:: with SMTP id n20mr11406241wmi.136.1631539248170;
        Mon, 13 Sep 2021 06:20:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGW1ojaPyD1M/BS656w+4FJLzZXRQcOiJW5oHFj8BydpZT1RYPdlEY9jeHIFid1HBy2UQTIw==
X-Received: by 2002:a7b:cbd4:: with SMTP id n20mr11406199wmi.136.1631539247756;
        Mon, 13 Sep 2021 06:20:47 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id n3sm7195888wmi.0.2021.09.13.06.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:20:47 -0700 (PDT)
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
Date: Mon, 13 Sep 2021 15:20:24 +0200
Message-Id: <20210913132035.242870-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
References: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 73IXGH462KA4C36AP5US6WJG5POQFZOO
X-Message-ID-Hash: 73IXGH462KA4C36AP5US6WJG5POQFZOO
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 04/15] nfc: fdp: drop unneeded debug prints
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/73IXGH462KA4C36AP5US6WJG5POQFZOO/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

ftrace is a preferred and standard way to debug entering and exiting
functions so drop useless debug prints.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/fdp/i2c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nfc/fdp/i2c.c b/drivers/nfc/fdp/i2c.c
index 051c43a2a52f..f78670bf41e0 100644
--- a/drivers/nfc/fdp/i2c.c
+++ b/drivers/nfc/fdp/i2c.c
@@ -335,7 +335,6 @@ static int fdp_nci_i2c_probe(struct i2c_client *client)
 		return r;
 	}
 
-	dev_dbg(dev, "I2C driver loaded\n");
 	return 0;
 }
 
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
