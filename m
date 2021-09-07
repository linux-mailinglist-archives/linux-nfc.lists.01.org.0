Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FAC40286A
	for <lists+linux-nfc@lfdr.de>; Tue,  7 Sep 2021 14:18:49 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id F321D100EB339;
	Tue,  7 Sep 2021 05:18:41 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 6CD04100EBB78
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 05:18:40 -0700 (PDT)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 66D023F329
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 12:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631017119;
	bh=KQ0ijwIeFsveeXdiNAQIdSvmUM7JWh6ALRqQaOVckDE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=wdnn4Cu+1kPZwLD8NSz8v4+gilcSmMUNzV19dgbI8z7OTYIm2VXD0H26q7CVS0LZj
	 yljS/ufJWBhbS/vOu54tXmjjowYXkYptc6MqU18Wu+GLPJlOKcSag9KpzRK6VWHUI5
	 1UaA7r+j6H8qnaWHjz902P+1V2FL2pYJB1kMH6o2b57CIKo7Lj8XUYHNk8EUlefj4Z
	 /dqXgfX117aM2QSFadNarzKjSA520y5UEYG2gUt+GsfJge7We8YCLW+HoMusrEaUJP
	 0Glsx42KKI0/e3z4u5KoSbsxyo9sqE8RhUF9U//V8EP2zp3H+3p6wXArsOsrhXbo54
	 dTAhJ7X/hTHqA==
Received: by mail-wm1-f71.google.com with SMTP id p29-20020a1c545d000000b002f88d28e1f1so3319355wmi.7
        for <linux-nfc@lists.01.org>; Tue, 07 Sep 2021 05:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KQ0ijwIeFsveeXdiNAQIdSvmUM7JWh6ALRqQaOVckDE=;
        b=CUzP0Zvh2UzEtXbFMviRgQkTAS9i/tQkEA9eWCAY8ymCdn5OHv+kdhx0Pwq1LoClAW
         YmoLH/PlAsb9y/rdesTS5eLe+EW+Hx2L30Gu5h2GE1HnxpK/XSN766ek/+qG/5fcTAKT
         1m/ujZWwT9npflEcxWGIG9yUaiyiyuj1317BLC3e/VLoA3KprM+nytplpKXUoxMO4vFN
         L+wxePTwaCvxwXWlSsSacRYpCHfGOIlc1BdweIhDSQ63DTFk8rUXaAkKJSwTLjbgZDKo
         V0JUEJZWfTX8MIPYa8XZgkMlaubuLIC5AKL+4u5K4atXFcUY4cocQ1Hl0txQcSGaWVs5
         oT0A==
X-Gm-Message-State: AOAM532+6U17CBZl/SDpN7r7rBSwCQyUcFINmQdExZpAx8tmqaFMnJUo
	aektpPT1FuZMbf5XtR+7be7914gQ4Oajs/p+dw12G9E9FOGbrkpHHR61TsL6bxVeWBfMuXQ+ZCp
	cse9fKecHYLS83qeVlC52MU0eAYfMzeaTHw==
X-Received: by 2002:a1c:4e02:: with SMTP id g2mr3721763wmh.64.1631017119172;
        Tue, 07 Sep 2021 05:18:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQnetzmuiPkZxY5ujifiMc0ZSDMSRGclmWVVBN7PzhHJltL2XOpfe1Q53piPXGFgUJqPpP0w==
X-Received: by 2002:a1c:4e02:: with SMTP id g2mr3721745wmh.64.1631017119053;
        Tue, 07 Sep 2021 05:18:39 -0700 (PDT)
Received: from kozik-lap.lan ([79.98.113.47])
        by smtp.gmail.com with ESMTPSA id m3sm13525216wrg.45.2021.09.07.05.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 05:18:38 -0700 (PDT)
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
Date: Tue,  7 Sep 2021 14:18:15 +0200
Message-Id: <20210907121816.37750-15-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
References: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: DQGP3GOYGTZLKIVKXMCZYFFDKWO5PIAN
X-Message-ID-Hash: DQGP3GOYGTZLKIVKXMCZYFFDKWO5PIAN
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 14/15] nfc: microread: drop unneeded memory allocation fail messages
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/DQGP3GOYGTZLKIVKXMCZYFFDKWO5PIAN/>
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
 drivers/nfc/microread/mei.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/nfc/microread/mei.c b/drivers/nfc/microread/mei.c
index 686be3381727..e2a77a5fc887 100644
--- a/drivers/nfc/microread/mei.c
+++ b/drivers/nfc/microread/mei.c
@@ -24,10 +24,8 @@ static int microread_mei_probe(struct mei_cl_device *cldev,
 	int r;
 
 	phy = nfc_mei_phy_alloc(cldev);
-	if (!phy) {
-		pr_err("Cannot allocate memory for microread mei phy.\n");
+	if (!phy)
 		return -ENOMEM;
-	}
 
 	r = microread_probe(phy, &mei_phy_ops, LLC_NOP_NAME,
 			    MEI_NFC_HEADER_SIZE, 0, MEI_NFC_MAX_HCI_PAYLOAD,
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
