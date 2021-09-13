Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C00A408CED
	for <lists+linux-nfc@lfdr.de>; Mon, 13 Sep 2021 15:21:13 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id C19BF100EBB98;
	Mon, 13 Sep 2021 06:21:11 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 04E3B100EB829
	for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 06:21:10 -0700 (PDT)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DD7084026D
	for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 13:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631539268;
	bh=KQ0ijwIeFsveeXdiNAQIdSvmUM7JWh6ALRqQaOVckDE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=JHdhHlDpHlmfCOtBj4u//FCtXZVMIbqJ8nG62pu7fkbiYuIe+to5PFM4koDu2R5hf
	 5eAFOsEJ8DfgGwXWgF7fNVnn6+cEbJ528cLveqke1SukjiR9pSI2otxORjjbEvR6dK
	 KXMiyZVTXWktZ2SuSDQk2/RI7wak+XxT7mmM3Y4JCwx0c0CVWNsLchlITPTyuhBkem
	 cu2Lv0Hka5xyBx38WrP1RH5Sq5qWxkd10CD76aw0ZjeZH6O/5x27Kgh9Bk+R7BwhM5
	 w9FO48hcUS4Cjo7b6LbuD4ZH0fnAbwCa+NuuQFzwIsyqz32g8pn6/FM/NuUQLhgPGu
	 IGoWV76ycLkJQ==
Received: by mail-wr1-f72.google.com with SMTP id a27-20020a5d457b000000b0015b11fccc5eso2659628wrc.10
        for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 06:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KQ0ijwIeFsveeXdiNAQIdSvmUM7JWh6ALRqQaOVckDE=;
        b=TEn78+KfgtiMY7s/zWKD14nclnzfxTn7g6N/qG3FBvp7wPO4zKnsFyfPj1EtJLrXWz
         He+ICGd09I9SU39ezXrQF0pTQPwL5Vme4e9XDoP2tKwZBYQcN21bopmWXX3fXZNOsEIp
         N8jaJNMgfkgalmOcaLmeSY//Lk6O/zUvxHAU+RTpOOntJCZTjbZ7mV1k0JpDzTT7NcpQ
         W+x3nbzGQtMccLtP8otewhaGVcryVweEgsGi82DYEEjmoCpGZPdKr+zKIZ1gfw0nNkEm
         QZ2elhlTKo86wkUWQfjbyuQ77fXJXDdYtMee3ppHI6OHdKhWiiZodAIkveeOGdlrimOy
         L7ZQ==
X-Gm-Message-State: AOAM531/C2Z0njOLPOWs1jJv2OcSuKT3qBPL+hYvL+0Q/tuweAYpoYiw
	txvZWKg6qj+D/kFbzt7NrYfn+afrlARn4XSZYW/XvEP8BhqHSOcu3NMrs1l6c82HQOKgg1uXA6L
	huR7MiI6Wt2qmGp91gY3g3OVv45kQUMMIKg==
X-Received: by 2002:adf:b319:: with SMTP id j25mr8072584wrd.256.1631539268293;
        Mon, 13 Sep 2021 06:21:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXQGN4lsPt3X80FcvViXLzjEb2mk7vyuKiz1WyuQZmj2rN0DA8sZRymOZ4nkeEBwSNZW4Pfw==
X-Received: by 2002:adf:b319:: with SMTP id j25mr8072562wrd.256.1631539268146;
        Mon, 13 Sep 2021 06:21:08 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id n3sm7195888wmi.0.2021.09.13.06.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:21:07 -0700 (PDT)
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
Date: Mon, 13 Sep 2021 15:20:34 +0200
Message-Id: <20210913132035.242870-15-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
References: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: W2QCLDLMBNIPDAD3YPK7VVEFAJTM24RS
X-Message-ID-Hash: W2QCLDLMBNIPDAD3YPK7VVEFAJTM24RS
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 14/15] nfc: microread: drop unneeded memory allocation fail messages
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/W2QCLDLMBNIPDAD3YPK7VVEFAJTM24RS/>
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
