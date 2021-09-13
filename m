Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1503A408CDA
	for <lists+linux-nfc@lfdr.de>; Mon, 13 Sep 2021 15:21:00 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 30AF0100EBB81;
	Mon, 13 Sep 2021 06:20:58 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id AD226100EBB75
	for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 06:20:55 -0700 (PDT)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5CD964027B
	for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 13:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631539254;
	bh=NBr1U4LAwKajfkWi8d66f/F7DJmWNcP01ndf/w7qpqs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=eKne7l7JsWA9Oyqv1ej25m2CyAPojw00ksawllNBhUEzH0ZbiNYz83s/f9tfqky5F
	 nIdM5nruK+ENQJgamMXhOKzqvqbmCXZ0H7gNdv623agZNW7W2TuB96pz0byZuS9kyg
	 1gIsNpbQ/fU/u2CvHGQ7E4mmq4mZF83AJeCB6w2dhSVcMdPe8ZpB4/rbC/mVA9BAH3
	 jRY1ekDZCtXtrgeMFeSLZzbPulME9H2eq2URilg78BcpkGrFBSPkCj3QHpTJIw+OJb
	 fpCvjHdVDEuROrY95Re+jRus9/7YOom1q421gYqjLlWq7zNYRyfRgH8AR48iUwxE9P
	 KRmlgh5GimozA==
Received: by mail-wm1-f69.google.com with SMTP id u14-20020a7bcb0e0000b0290248831d46e4so1654506wmj.6
        for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 06:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NBr1U4LAwKajfkWi8d66f/F7DJmWNcP01ndf/w7qpqs=;
        b=guV3oVD4cxBlnN2hYfFK25HOgV/BcH+ile2t8Unaly7ezK3JUigOSurpk2k4M078RJ
         Xujdize82LY3f2L/NfLYZxwPa1pkj6ARuMQZlpaQ2YN3Hqxo8MpGsFE8gd98LIepTm7P
         dlx9N9qM6nTQirIR3ecBkpEk1t5kGB76RcEiOiFhIMxty1sfopXBEvLZD7K5Fsl/5yFI
         Kr5fDJBPvLFI32Y3yx8iv32Rnk4OXiGJA7EYGWzXJUUXtSA4poYYnz1K1oHNn5UPqJ6N
         XDV7bbYYc90M0iaAa6oDUnqBscxzKnTQJTsAWTJwuufDGvyxF2joXJo3h7jwEhPcFHX2
         gNNQ==
X-Gm-Message-State: AOAM533SNRdS7CeGx6vgZWRPOLrqSPV6LYmMymjyFSWzjGGHuwOgW/zb
	5OXm+5ubX1F0TrHPsGPjZBJDaMmUK30GUmDTGMUcoJyBRGisGsVaaMaPkkNGCj/s/EY9bXxt/4C
	w+MVrDgdmqp9Vv9/oc5nGyvX7SP/PxVuRPg==
X-Received: by 2002:a1c:f60c:: with SMTP id w12mr11300818wmc.3.1631539253790;
        Mon, 13 Sep 2021 06:20:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4mhlijtrqBRrwe325QIJTV+NH9oRbw4vOfFD3MMxQ/lm7QV3e8395RpL+PFPpNFF13sZ40A==
X-Received: by 2002:a1c:f60c:: with SMTP id w12mr11300790wmc.3.1631539253600;
        Mon, 13 Sep 2021 06:20:53 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id n3sm7195888wmi.0.2021.09.13.06.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:20:53 -0700 (PDT)
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
Date: Mon, 13 Sep 2021 15:20:27 +0200
Message-Id: <20210913132035.242870-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
References: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: DHDCXHYX2ZAZWWJW3ERXVIH6CKHALQZI
X-Message-ID-Hash: DHDCXHYX2ZAZWWJW3ERXVIH6CKHALQZI
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 07/15] nfc: pn544: drop unneeded debug prints
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/DHDCXHYX2ZAZWWJW3ERXVIH6CKHALQZI/>
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
 drivers/nfc/pn544/mei.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/nfc/pn544/mei.c b/drivers/nfc/pn544/mei.c
index 5c10aac085a4..a519fa0a53e2 100644
--- a/drivers/nfc/pn544/mei.c
+++ b/drivers/nfc/pn544/mei.c
@@ -22,8 +22,6 @@ static int pn544_mei_probe(struct mei_cl_device *cldev,
 	struct nfc_mei_phy *phy;
 	int r;
 
-	pr_info("Probing NFC pn544\n");
-
 	phy = nfc_mei_phy_alloc(cldev);
 	if (!phy) {
 		pr_err("Cannot allocate memory for pn544 mei phy.\n");
@@ -46,8 +44,6 @@ static void pn544_mei_remove(struct mei_cl_device *cldev)
 {
 	struct nfc_mei_phy *phy = mei_cldev_get_drvdata(cldev);
 
-	pr_info("Removing pn544\n");
-
 	pn544_hci_remove(phy->hdev);
 
 	nfc_mei_phy_free(phy);
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
