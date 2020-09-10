Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C62FB26496C
	for <lists+linux-nfc@lfdr.de>; Thu, 10 Sep 2020 18:12:46 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id A3FDA14263420;
	Thu, 10 Sep 2020 09:12:45 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=krzk@kernel.org; receiver=<UNKNOWN> 
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 3FD3B141A76EE
	for <linux-nfc@lists.01.org>; Thu, 10 Sep 2020 09:12:44 -0700 (PDT)
Received: from localhost.localdomain (unknown [194.230.155.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8744221D90;
	Thu, 10 Sep 2020 16:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599754364;
	bh=zplVVIgMQojsbwVzaG1n4QTE3TMlBcAZb0xfKeub8eE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=p9Aps4ONeROFriwJ9u8H2cjA/DUEGWRKzoNnFEhQRzm20lKlg1F4hg8ZODe4lfyvA
	 hSobjF/nxCveprXcdjdJCZMp/51Xv7pRgUjZPxTwi0ZFYXc7udvs3NWsCssjExJ0pB
	 KFQLwO9iAu60t1Y4VrlazrSz2f2NIfyXSgQxCeM8=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Opasiak <k.opasiak@samsung.com>,
	Kukjin Kim <kgene@kernel.org>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-nfc@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Date: Thu, 10 Sep 2020 18:12:15 +0200
Message-Id: <20200910161219.6237-5-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910161219.6237-1-krzk@kernel.org>
References: <20200910161219.6237-1-krzk@kernel.org>
Message-ID-Hash: S5UGVVC22MIDWAWTPX5JPUPIQ4E3DGWB
X-Message-ID-Hash: S5UGVVC22MIDWAWTPX5JPUPIQ4E3DGWB
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v3 4/8] nfc: s3fwrn5: Remove unneeded 'ret' variable
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/S5UGVVC22MIDWAWTPX5JPUPIQ4E3DGWB/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The local variable 'ret' can be removed:

  drivers/nfc/s3fwrn5/i2c.c:167:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/nfc/s3fwrn5/i2c.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
index 557279492503..dc995286be84 100644
--- a/drivers/nfc/s3fwrn5/i2c.c
+++ b/drivers/nfc/s3fwrn5/i2c.c
@@ -164,7 +164,6 @@ static int s3fwrn5_i2c_read(struct s3fwrn5_i2c_phy *phy)
 static irqreturn_t s3fwrn5_i2c_irq_thread_fn(int irq, void *phy_id)
 {
 	struct s3fwrn5_i2c_phy *phy = phy_id;
-	int ret = 0;
 
 	if (!phy || !phy->ndev) {
 		WARN_ON_ONCE(1);
@@ -179,10 +178,9 @@ static irqreturn_t s3fwrn5_i2c_irq_thread_fn(int irq, void *phy_id)
 	switch (phy->mode) {
 	case S3FWRN5_MODE_NCI:
 	case S3FWRN5_MODE_FW:
-		ret = s3fwrn5_i2c_read(phy);
+		s3fwrn5_i2c_read(phy);
 		break;
 	case S3FWRN5_MODE_COLD:
-		ret = -EREMOTEIO;
 		break;
 	}
 
-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
