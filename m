Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D927D408CEC
	for <lists+linux-nfc@lfdr.de>; Mon, 13 Sep 2021 15:21:11 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id AD1F6100EB83A;
	Mon, 13 Sep 2021 06:21:10 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id BBF60100EB839
	for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 06:21:07 -0700 (PDT)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 552474026D
	for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 13:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631539266;
	bh=AKOLSiNotprej29rkzU07CereuPK7jDMwjY+iTyzzwA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=miQX3ZyO2Si5M88Eae3XDTF1Zuq3JQtQFn4dHRPuWtVZ0a3shezfpZsaqxMC60Y42
	 OC0Q+6gM7+qpFhUyVTuz02UC5OyAXCjXrxtEaPLFJMrjstWWHvIpaMfqIXGdMmzhYO
	 TdSlPqRyGtITbYiXZc9ACAV/N7brxABfE5qdcBiTYODuF0yvLnYGzXHohiSPtxBTDn
	 PKSMfpjg7g/AZTvEznopOGUCMIIz4XmrIDQxScqnWVlMAw8nns+oo2YWXxLYR7xHyR
	 jkle5qe0LoxjoZzcxNlGMHaS43rvNdT+GLwKgVXkMjVjD62MGYJAvzvZtsf0gu15q4
	 oL8tprYBu+gdg==
Received: by mail-wr1-f71.google.com with SMTP id i16-20020adfded0000000b001572ebd528eso2646871wrn.19
        for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 06:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AKOLSiNotprej29rkzU07CereuPK7jDMwjY+iTyzzwA=;
        b=cLs1cYjSKxN00lFWULkAOl1mR84d7BHD9yM+ymylf4PjsC8g8ewZqXIJmCXaXU/4hM
         ffPHpyHTCKqyYRHwEzb0IxRLj2X0WqXW1R0fQ8CijM4vP7blJg3z1jrefskBebG7ndlk
         mSf4bousJHDYahXdvxU3FchsaJe5yhrsrVLmgLawYbMem73O7s90PHgbLkelzVFmfqx5
         MUR0JpQq2gzLbxxvDKUABX7GmUkq+4NHXO9Cvx9wDIkyRKX7qMAeCpt9DMuIoceY9dkv
         XanQWYQEREDybftvBiEngyC5q+e8x05Oihi8YTGtpWcUq7fm9JaOEo+En+HLqnqLxz6o
         gzuQ==
X-Gm-Message-State: AOAM5307Ggf57ohfAK4YSygaMoO8jc5/26eKufSANyyDIgnCSDORhkfh
	/Sp+rcUnilF5SPfrUcfsXhPYBiZeuIAriySISfLClCMxHUpMITAbgG11QSXxBkbseqo0EB4aA+g
	w2dQG1bzVRDLDIeF14Q0ciYkcvxARVSWgGA==
X-Received: by 2002:a05:600c:896:: with SMTP id l22mr11120623wmp.173.1631539265713;
        Mon, 13 Sep 2021 06:21:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGKB8zsRCueVcnv/F/wvUaRLWvDTsfD6029ziTjUpm5OT7cpm9fnOgAqV38PdDEO3snD2i1w==
X-Received: by 2002:a05:600c:896:: with SMTP id l22mr11120577wmp.173.1631539265398;
        Mon, 13 Sep 2021 06:21:05 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id n3sm7195888wmi.0.2021.09.13.06.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:21:04 -0700 (PDT)
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
Date: Mon, 13 Sep 2021 15:20:33 +0200
Message-Id: <20210913132035.242870-14-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
References: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: MI65T7SBLMZQHYTXHXYGTOYG3X53VDJ7
X-Message-ID-Hash: MI65T7SBLMZQHYTXHXYGTOYG3X53VDJ7
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 13/15] nfc: microread: drop unneeded debug prints
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/MI65T7SBLMZQHYTXHXYGTOYG3X53VDJ7/>
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
index 8edf761a6b2a..686be3381727 100644
--- a/drivers/nfc/microread/mei.c
+++ b/drivers/nfc/microread/mei.c
@@ -23,8 +23,6 @@ static int microread_mei_probe(struct mei_cl_device *cldev,
 	struct nfc_mei_phy *phy;
 	int r;
 
-	pr_info("Probing NFC microread\n");
-
 	phy = nfc_mei_phy_alloc(cldev);
 	if (!phy) {
 		pr_err("Cannot allocate memory for microread mei phy.\n");
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
