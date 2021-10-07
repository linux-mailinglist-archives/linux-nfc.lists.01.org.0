Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3F3425455
	for <lists+linux-nfc@lfdr.de>; Thu,  7 Oct 2021 15:38:34 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 7B25C100EA2AA;
	Thu,  7 Oct 2021 06:38:30 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id D0C94100EA934
	for <linux-nfc@lists.01.org>; Thu,  7 Oct 2021 06:38:28 -0700 (PDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 39A563FFF5
	for <linux-nfc@lists.01.org>; Thu,  7 Oct 2021 13:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633613907;
	bh=Caod7f/lk82yPL9l72YPa9/xdZxrVhuurClzVai7YFo=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=wNNOXXlUwtFaXTccXUa4tqqTzfXMxsemp87Xwj23vUQ5ne22j84qPlN6VGN4iZOqY
	 qLtwj+0JrpLosbJGup63J5OKwLm0QXilUxALXquwHarMmHj+6s8EDjztpTaiRQ+FpG
	 BrfHzOBQ6lEz22HK7tK7I92K1gTkEmFDmYxG45jVurM9Cjq+2aRTJ1KQ1chqE/Rs6j
	 qrYuHO48O5dLXQKbhZ3aHYQLW3CLJBn9U2LV0uNTgmfUxCwO9s67CGru28dDDaQL+E
	 NnVLbU9h9sOIXmwDzUwQw/KdoWq2aqzQF00rB332BRyke3aVpmhT1cj9bMYFp29ur6
	 Noiza3ShjE0Aw==
Received: by mail-ed1-f69.google.com with SMTP id x5-20020a50f185000000b003db0f796903so5887270edl.18
        for <linux-nfc@lists.01.org>; Thu, 07 Oct 2021 06:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Caod7f/lk82yPL9l72YPa9/xdZxrVhuurClzVai7YFo=;
        b=PHh+6Q2jGXNbDydUFGLTfzZDj/fIJYFs+TojzDZsrHsh4mMFWfRJQlKNx52dBJdjLY
         v+AR1/VYXoaY44z7LKNiQY6d6f0YBsANxqw0+jxlD0bt3A+mgABm8TUj0Prb+RecSIeH
         /xg7OSsS1YqafP+/tBiUCpO2w2tGTu0+m0+DG4HT8rguO4kjgvlyDRPYjo07+SmlUcte
         KRGqRkEXmbKsAi1SDT1PEqlNrjW8GkQn8Gu2O7uv1xxKJXhzKC26eMs5Ypm+2yM6GZL2
         +85iqCldOzVtymFXB+X60C9TX75dbC5yMbKDlqCp4KZHE03q6lYxlKuOP01r0Ekfj+no
         upGQ==
X-Gm-Message-State: AOAM533uY9SYLLU5Eu+tlmbsQQrkmAINm8v1bE3DjxKNPQD/gN9ShsFi
	RujTOtVvJMuMAcC+zgIdXDvvV1B0lza76s5YQW0eY7/vTxm4Otd8MoU4XBOONf0Qe0tVslw4Zhy
	gR5Zx7znaCGjTMx2BU8bdBcnXS2QA42IjMQ==
X-Received: by 2002:a17:906:ae14:: with SMTP id le20mr5850201ejb.89.1633613906950;
        Thu, 07 Oct 2021 06:38:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhM44QMJ2eosub/50WjbhCTf/eolBEhiGbo3QX3lfBJRMrgvITyIbkdtt7+Q73mJANGS4yFA==
X-Received: by 2002:a17:906:ae14:: with SMTP id le20mr5850180ejb.89.1633613906761;
        Thu, 07 Oct 2021 06:38:26 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id ay19sm8585613edb.20.2021.10.07.06.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 06:38:26 -0700 (PDT)
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
Date: Thu,  7 Oct 2021 15:30:21 +0200
Message-Id: <20211007133021.32704-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211007133021.32704-1-krzysztof.kozlowski@canonical.com>
References: <20211007133021.32704-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: TL7TYV7ZQTDJAM6HXFREJLOMJMNR62GI
X-Message-ID-Hash: TL7TYV7ZQTDJAM6HXFREJLOMJMNR62GI
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [RESEND PATCH v2 7/7] nfc: microread: drop unneeded debug prints
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/TL7TYV7ZQTDJAM6HXFREJLOMJMNR62GI/>
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
 drivers/nfc/microread/i2c.c | 4 ----
 drivers/nfc/microread/mei.c | 2 --
 2 files changed, 6 deletions(-)

diff --git a/drivers/nfc/microread/i2c.c b/drivers/nfc/microread/i2c.c
index 86f593c73ed6..067295124eb9 100644
--- a/drivers/nfc/microread/i2c.c
+++ b/drivers/nfc/microread/i2c.c
@@ -237,8 +237,6 @@ static int microread_i2c_probe(struct i2c_client *client,
 	struct microread_i2c_phy *phy;
 	int r;
 
-	dev_dbg(&client->dev, "client %p\n", client);
-
 	phy = devm_kzalloc(&client->dev, sizeof(struct microread_i2c_phy),
 			   GFP_KERNEL);
 	if (!phy)
@@ -262,8 +260,6 @@ static int microread_i2c_probe(struct i2c_client *client,
 	if (r < 0)
 		goto err_irq;
 
-	nfc_info(&client->dev, "Probed\n");
-
 	return 0;
 
 err_irq:
diff --git a/drivers/nfc/microread/mei.c b/drivers/nfc/microread/mei.c
index 00689e18dc46..e2a77a5fc887 100644
--- a/drivers/nfc/microread/mei.c
+++ b/drivers/nfc/microread/mei.c
@@ -23,8 +23,6 @@ static int microread_mei_probe(struct mei_cl_device *cldev,
 	struct nfc_mei_phy *phy;
 	int r;
 
-	pr_info("Probing NFC microread\n");
-
 	phy = nfc_mei_phy_alloc(cldev);
 	if (!phy)
 		return -ENOMEM;
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
