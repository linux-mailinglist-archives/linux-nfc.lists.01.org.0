Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9CB402863
	for <lists+linux-nfc@lfdr.de>; Tue,  7 Sep 2021 14:18:39 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4D2E3100EB846;
	Tue,  7 Sep 2021 05:18:33 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B09A9100EB831
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 05:18:31 -0700 (PDT)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A89D240798
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 12:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631017110;
	bh=NBr1U4LAwKajfkWi8d66f/F7DJmWNcP01ndf/w7qpqs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=PN/OgM3lunGwgycn8et2C4vNacltmKKfNlmUUFbrGWpS3C4ybrYeybVbCB/ociM15
	 VLBswpaUVEvRR0gwRmEj3dCotqrvlEyrfcj14XqtadaRbGxwS3qUFo7aICSgeBuCoX
	 gFcwDXEiX1EV0u/N5vHhjtIUiBUK57RfB9T/EpYdAKw7Wv23EtsUp3+hM0Z1Sw6gnv
	 WlWNQh3kTXj/28whJnw4wecELya0uzowKAHYiScEd67ter83Xv5duSVX1p5ba6qgJp
	 g6bXfmpT+fIXZ1toEkaAnobqxkzbD/SFzMvTcVFPTUYNd7kxLZOGBEroQPovrASCbF
	 BlAgAQV2cX9dQ==
Received: by mail-wm1-f70.google.com with SMTP id m22-20020a7bcb96000000b002f7b840d9dcso1040224wmi.1
        for <linux-nfc@lists.01.org>; Tue, 07 Sep 2021 05:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NBr1U4LAwKajfkWi8d66f/F7DJmWNcP01ndf/w7qpqs=;
        b=uEbwO6QJhHZ8LBk5M/1GWzikLlN1Drt863vPO+rx9JcNHHQUws9zcTV2mt0Dx5XHgd
         Ux5XCYO9EJ3z8s2169FEk7HV/uEw/TSFfqep5amd1WQdAvINR2UrYv2ohiAloU0IQ8PZ
         2wtKduVoPlWL29k+/ymQfaVq8l++eUK9KG+Prfnu3M8DyBy5KJKsyzqxILehTwgEO4qo
         scVm1KZuk5ZiyGNXeHx5OLPUjc4ltKnfVZmNUjHxwjD31ojkpHOkAwuFpXlgTInFltOo
         K3qRoj5bQb8ccB5tuL6k0Z3yejee1KkLbXzn6ks9c1Jqk9mB612/zCCrcgzNS5lJDrQc
         Iodw==
X-Gm-Message-State: AOAM531VHstC26CCUYXcJv4DyfM6krH4TC4Q8ULx2IyqpoMk/h83/HBT
	AgUPGK0X56F2Wdjc/Wz3mmiVPtX78zFg57/RJGf33pmLTiyIwz8gd90eehHUKVYSkhvPnNPVx2/
	h9v26IBEYSUHz2r59xhozYFv9JpbDWv8OaA==
X-Received: by 2002:a05:600c:210a:: with SMTP id u10mr3577105wml.127.1631017110348;
        Tue, 07 Sep 2021 05:18:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpmN+J+nVSHJybMfzx2E98USXqdlKN6XTJk2Iwf0j0Co7NOrQuorgTzMhtPjYxrxKxWVDRvA==
X-Received: by 2002:a05:600c:210a:: with SMTP id u10mr3577088wml.127.1631017110234;
        Tue, 07 Sep 2021 05:18:30 -0700 (PDT)
Received: from kozik-lap.lan ([79.98.113.47])
        by smtp.gmail.com with ESMTPSA id m3sm13525216wrg.45.2021.09.07.05.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 05:18:29 -0700 (PDT)
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
Date: Tue,  7 Sep 2021 14:18:08 +0200
Message-Id: <20210907121816.37750-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
References: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: NVTBSLZ6BWJAXKR2WF5U5V2UIPSOESBN
X-Message-ID-Hash: NVTBSLZ6BWJAXKR2WF5U5V2UIPSOESBN
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 07/15] nfc: pn544: drop unneeded debug prints
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/NVTBSLZ6BWJAXKR2WF5U5V2UIPSOESBN/>
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
