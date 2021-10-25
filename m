Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2F8439913
	for <lists+linux-nfc@lfdr.de>; Mon, 25 Oct 2021 16:48:04 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E395D100F2271;
	Mon, 25 Oct 2021 07:48:00 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 8765C100EB34D
	for <linux-nfc@lists.01.org>; Mon, 25 Oct 2021 07:47:57 -0700 (PDT)
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AD4F23FFFE
	for <linux-nfc@lists.01.org>; Mon, 25 Oct 2021 14:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1635173275;
	bh=NUqLZxU+ETk1A/0vgN0aobJH+DUj6dc03Bn80L2dseI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=jOVK95wy48uN8jEHTUsC7zESOq8CFcquyE1YE+NK9S2t0yW2RSi1S0OZrUQhD8tDq
	 pbCmB6XyaCZVTL78SqxXx8hpn7wpDUPA67nQ1t72qSVUhM+kYbYTU4tj+hwS+R3Se3
	 SnzQW+yLTroWC/YpPz5m2MihYI8dx1StaE30NdtUO336fQSsB1a9sM+wDOUzL1FCxQ
	 eCKplzfdm+goe6c0q4dOtXkScEusy1BQc1NaBewNy/wSu8bzvfkcNpts2JCxM+EemE
	 PcGxoWVj3CzDQf/Dn6hmLd1mllTn1cXguldQQCl5rFLl1zy9EQdYv9C0bM2S+nQFaT
	 RUDimQn0LiX6Q==
Received: by mail-lj1-f197.google.com with SMTP id s5-20020a2e98c5000000b002112895b3f6so2849440ljj.21
        for <linux-nfc@lists.01.org>; Mon, 25 Oct 2021 07:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NUqLZxU+ETk1A/0vgN0aobJH+DUj6dc03Bn80L2dseI=;
        b=08E2JSVFFH52Lx6QwReYrUG2Z7rbqCE9BdzOGkATZn76g06NIk77IqZEuQbk/jv98n
         /uEhfMUtDMu9emXJSDnWlPzPcLnABv6Ay/JgXVXc/Sn+9sH2VW+f25nMWtxsCAPSiuqL
         kDG8zkHg0pDIkJBHo1lGMGy4dLHangMRQV3278wGb3HQXh6r+aKYJk2/VRDM0xPani3h
         c4H5N3wG4Sb4L42+CMOXMLSzMjTjXVoMTR/vJmEJUb+VssBX3W/ImtUDu3rr9aArcDTh
         xL0A1BU5fR5pE89JuM3E07LhLumWg9KyyLY26KCdMKb4NVC+uyUUqCQAnNfw8tcwOlEo
         5Zrg==
X-Gm-Message-State: AOAM532mwefukZvwKlZvB+goQp4lV3RXE0I7Br0zkfmhHkVFoy4TMvM0
	JthdN5CiLRA8dptYYHBszfvV0OKGu7GYZCO1JkrZdwG48WYUcl1gcWPevLtD/vyCgvYC07loEAt
	agyrC2sEX8LyPrtQtyRn3f8Jwfyvb2i9LIA==
X-Received: by 2002:a05:6512:308b:: with SMTP id z11mr17209837lfd.330.1635173275165;
        Mon, 25 Oct 2021 07:47:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUji5AP34DKoiisxlbORPMw/PjYNY6RglMukjmgVGmeTMdxfjMOwhZDUsizlxDHiW1aa+/0g==
X-Received: by 2002:a05:6512:308b:: with SMTP id z11mr17209803lfd.330.1635173274797;
        Mon, 25 Oct 2021 07:47:54 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id w19sm1757832ljd.84.2021.10.25.07.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 07:47:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Thierry Escande <thierry.escande@linux.intel.com>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Mon, 25 Oct 2021 16:47:51 +0200
Message-Id: <20211025144751.555551-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Message-ID-Hash: 47SOKU2BDVHBXPVBGDGGSR4MOTIEUHK2
X-Message-ID-Hash: 47SOKU2BDVHBXPVBGDGGSR4MOTIEUHK2
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: stable@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH] nfc: port100: fix using -ERRNO as command type mask
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/47SOKU2BDVHBXPVBGDGGSR4MOTIEUHK2/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

During probing, the driver tries to get a list (mask) of supported
command types in port100_get_command_type_mask() function.  The value
is u64 and 0 is treated as invalid mask (no commands supported).  The
function however returns also -ERRNO as u64 which will be interpret as
valid command mask.

Return 0 on every error case of port100_get_command_type_mask(), so the
probing will stop.

Cc: <stable@vger.kernel.org>
Fixes: 0347a6ab300a ("NFC: port100: Commands mechanism implementation")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/port100.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/nfc/port100.c b/drivers/nfc/port100.c
index 1296148b4566..ec1630bfedf4 100644
--- a/drivers/nfc/port100.c
+++ b/drivers/nfc/port100.c
@@ -1109,15 +1109,11 @@ static u64 port100_get_command_type_mask(struct port100 *dev)
 
 	skb = port100_alloc_skb(dev, 0);
 	if (!skb)
-		return -ENOMEM;
+		return 0;
 
-	nfc_err(&dev->interface->dev, "%s:%d\n", __func__, __LINE__);
 	resp = port100_send_cmd_sync(dev, PORT100_CMD_GET_COMMAND_TYPE, skb);
-	if (IS_ERR(resp)) {
-		nfc_err(&dev->interface->dev, "%s:%d\n", __func__, __LINE__);
-		return PTR_ERR(resp);
-	}
-	nfc_err(&dev->interface->dev, "%s:%d\n", __func__, __LINE__);
+	if (IS_ERR(resp))
+		return 0;
 
 	if (resp->len < 8)
 		mask = 0;
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
