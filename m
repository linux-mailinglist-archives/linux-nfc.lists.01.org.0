Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD03408CDB
	for <lists+linux-nfc@lfdr.de>; Mon, 13 Sep 2021 15:21:02 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 3FC65100EB823;
	Mon, 13 Sep 2021 06:21:01 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id D84A6100EBB75
	for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 06:20:56 -0700 (PDT)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A4A4840282
	for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 13:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631539255;
	bh=alAZCnXDBZFqFGCWdjT1NtYwVcFPW4mHC6+AQVNQmag=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=DiHvUSDj8TvjNvAVoX5U6pEsOSih/KSUNCG94ei+WC8RkKpZl/xZuWDgoh3cMY/Ep
	 JKdnaO7seOPk3NEYLvXEllNk09mTGa/X9dk+40bPkX9bwGG8Rpp1o6blGAF7oSPcvm
	 4tHHFYNln/ws1PvF6kFez6nI6iFXfg5T+Jw5bBjD+v79hgkKKoNhSPMqb3FiLMXSti
	 yKHievZQXsE2WxPMQrw+pa7mcNQkOvUS2OUFJcnbHC3YOPrwjklgu8brVt+ZP0wCF8
	 SYNODSTLNCKDHMQ7mymSdbm5+Ni49s9rzyAJdi9Yyf2XoUVqe3sTz8qss+41jocfkg
	 aYpBH/RrjLQfA==
Received: by mail-wm1-f70.google.com with SMTP id j193-20020a1c23ca000000b00306cd53b671so1418287wmj.1
        for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 06:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=alAZCnXDBZFqFGCWdjT1NtYwVcFPW4mHC6+AQVNQmag=;
        b=f/cuMRRES9fXhbJ788uokAtqdb3QfcxPI+r0Sy0x62WmbylHiPk3230KNTCd0I4fp+
         ErbJYBPCnLIXH5+igPay6CLhT8JBnApwdqxpBzA2N58HUgd4NUuPvgcxGMr8wXMFX6t/
         l6ITtNrC0xXl/eO93KpnLqD0mP11ATZ3b9ESScltT2EjGpPomnhimh/uzyT/MTbHyP6X
         OV63QJ0IDp6n2pe8/LmFjgpsbJGF+pws6KMDjEt5co9Svmfrwh6cz2SimZ4aVMmOccDT
         vuynwEWpQwLy1/GJWHqruaWXHds1g0dfLdfi5zXFoCHe/nhm2Wo/C0Hew0PsNJsSmIBb
         Xq/w==
X-Gm-Message-State: AOAM530DBrAMHvTZmKevwenuixb7W+tRCQBrgoWXSGoJ4LJaSn+zUhma
	gbl+6kavPc2Xcf6O2j+euzcDixqP7p3bhNApwsh5NIDaM8c9xCshTV2qlltkNrDdvVeF31CSBEQ
	MEdHM7qIExFXf3Oli6XxeYGV/i2wj8xZq7g==
X-Received: by 2002:a5d:6792:: with SMTP id v18mr12576737wru.416.1631539255420;
        Mon, 13 Sep 2021 06:20:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwY6LXmCoBiMxgVg0ZBqajR5G6WaCpegfR/vq0xViC/Z1KjH8g67spH4c6MeVe7uNeK0A2zmQ==
X-Received: by 2002:a5d:6792:: with SMTP id v18mr12576720wru.416.1631539255299;
        Mon, 13 Sep 2021 06:20:55 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id n3sm7195888wmi.0.2021.09.13.06.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:20:54 -0700 (PDT)
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
Date: Mon, 13 Sep 2021 15:20:28 +0200
Message-Id: <20210913132035.242870-9-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
References: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: C2WLOXI2SFC6XLQBWE7EANDV6O2CYUZH
X-Message-ID-Hash: C2WLOXI2SFC6XLQBWE7EANDV6O2CYUZH
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 08/15] nfc: pn544: drop unneeded memory allocation fail messages
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/C2WLOXI2SFC6XLQBWE7EANDV6O2CYUZH/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

nfc_mei_phy_alloc() already prints an error message on memory allocation
failure.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/pn544/mei.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/nfc/pn544/mei.c b/drivers/nfc/pn544/mei.c
index a519fa0a53e2..c493f2dbd0e2 100644
--- a/drivers/nfc/pn544/mei.c
+++ b/drivers/nfc/pn544/mei.c
@@ -23,10 +23,8 @@ static int pn544_mei_probe(struct mei_cl_device *cldev,
 	int r;
 
 	phy = nfc_mei_phy_alloc(cldev);
-	if (!phy) {
-		pr_err("Cannot allocate memory for pn544 mei phy.\n");
+	if (!phy)
 		return -ENOMEM;
-	}
 
 	r = pn544_hci_probe(phy, &mei_phy_ops, LLC_NOP_NAME,
 			    MEI_NFC_HEADER_SIZE, 0, MEI_NFC_MAX_HCI_PAYLOAD,
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
