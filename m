Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D15A6428E3C
	for <lists+linux-nfc@lfdr.de>; Mon, 11 Oct 2021 15:39:33 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 93768100F3FB9;
	Mon, 11 Oct 2021 06:39:31 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id D774A100F3FB0
	for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 06:39:29 -0700 (PDT)
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BC9EA3FFF0
	for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 13:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633959568;
	bh=Caod7f/lk82yPL9l72YPa9/xdZxrVhuurClzVai7YFo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=jJUAZSjsmDAE0kL5aiPuGE709vSLqwUiWLkGDVZMRMYdkcKMuAMSqlwKWW2LPAOJP
	 WUcJihliJQEJTl9+jDmOdBguCgxs9kSLhw5L0CdC+3kRvF4Nmeq5gSKW3NA1vHaMIP
	 MSW1GMm5IzWAopbmhCjB01Qy39gHDhXlwSsutpQvfdyNIbXTwjGELdf163QLeNrw1L
	 ONzvNRRmWEzBgcTNWNOvJRvTZ2UtKcGL4VKlY9BJZeoTjnzB/BlZM3TLVn6qVwNknO
	 331kqSYsWjQtEyyloJ/Zw3hN5S3hjtB/Ub3e9I3lxAOhIB++KYXg79jKscJo0spvRL
	 DQvKrI4vgMe0Q==
Received: by mail-lf1-f69.google.com with SMTP id g9-20020a0565123b8900b003f33a027130so12774309lfv.18
        for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 06:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Caod7f/lk82yPL9l72YPa9/xdZxrVhuurClzVai7YFo=;
        b=Z69O+EJFXL0b5O0hwSN6CChoPwOs7gGndLeUfu8AinCB85Q6rqeVY2kkfCmFvkvq4Q
         I5Qp5QLrYEJPQiU9dt93zIvMXe3nXJxQguQWM4aaXpRqKqr3GAx+Aa1p+lTKyIN43f5O
         2HIdoFg7muhDi2M1d2vYHcsxftpx8jz7J5J8dPLkghHaSRAxpQlUY/sdBGkHtMNWOMEj
         JQh/4D+u/73cWTnLeXyxnfM1RP69ErabAkNxNHEWwxhF0jJpn7yNi5NyUGPEU9FPy0dE
         UbMLUirwapDItLmy7iDroqQx99nCjme3+piaTiLPM9LJoDcvPpCyv49tEtTr2hHWwaoV
         9zyw==
X-Gm-Message-State: AOAM530Ttqsmb7+qkqxbzK/mdD2rxT/gsXhF0HlG9Sry4JHA3jkCx2QX
	o2RISYfOZfE7DS6gji4tJpYKerMQJqqW7mWUHAS9O4j67GI0ER1TgSIYuxR7fVDc/KdLLND2fcS
	jIJJDVC2iQjj1H1RUSKK+BOSDgM9koRr2Fw==
X-Received: by 2002:a05:6512:23a0:: with SMTP id c32mr28315077lfv.166.1633959568235;
        Mon, 11 Oct 2021 06:39:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZiDLQW+5zqCPlBUX+HccXn6LAIXSmaJCIzfqIdMJzGyKW6xXiv/0sl+AlXYBAwxKOQrbchw==
X-Received: by 2002:a05:6512:23a0:: with SMTP id c32mr28315053lfv.166.1633959568082;
        Mon, 11 Oct 2021 06:39:28 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a21sm738971lff.37.2021.10.11.06.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 06:39:25 -0700 (PDT)
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
Date: Mon, 11 Oct 2021 15:38:35 +0200
Message-Id: <20211011133835.236347-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211011133835.236347-1-krzysztof.kozlowski@canonical.com>
References: <20211011133835.236347-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: AVOBKLNBCSZM32B6ZVGHORD4T4N4OIBP
X-Message-ID-Hash: AVOBKLNBCSZM32B6ZVGHORD4T4N4OIBP
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: joe@perches.com
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v3 7/7] nfc: microread: drop unneeded debug prints
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/AVOBKLNBCSZM32B6ZVGHORD4T4N4OIBP/>
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
