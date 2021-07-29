Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0F43DA142
	for <lists+linux-nfc@lfdr.de>; Thu, 29 Jul 2021 12:40:50 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 96F50100EB82F;
	Thu, 29 Jul 2021 03:40:46 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 74D23100EBB97
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:40:44 -0700 (PDT)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 5DA383F22A
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 10:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627555242;
	bh=Cti8DGqbNI8YPSuGsMvGoiLdXe5FLuXImkkJsU3HkS0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=QfKl/5/vgZQOC1MHdycPjE1604IA3JTWMoIzYTcgwP5e05j/fMVDgxF9t2Hpz7mAk
	 LIgdnX4v/wGazTZuSQVgx92W2VTpGqKlxXabf7utO5hPfWUgwgyrevR8W0+uDd/QkH
	 MouboZLdzIa0ghrTM63aQKrlTm8JoSqCcPCBiWU4weSp8oBvZBW/qUWZ2DCEuTdU9M
	 BBeXcGOG3rdMktyXdhtBpfb1XVxmj3+yKYRPeVMmtR746JrrmZmN1n0MaL/Gy9/1hc
	 wJ0dzgtQnmNs4qrZP38737BvuSz2vfbl8Y5C98wjmAH/wRWktL+oQE/CWFRlJvWPvg
	 HQmEtURtVLhnw==
Received: by mail-ej1-f70.google.com with SMTP id kf3-20020a17090776c3b0290536d9b62eb6so1843757ejc.2
        for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cti8DGqbNI8YPSuGsMvGoiLdXe5FLuXImkkJsU3HkS0=;
        b=MX0TNAiToeaGhok2ncPumf6su5plmjMxxu5JV/PLkHtSRGWyu42iGC8lfvo4V+aJE+
         9XH24fdP4JM7KWmd9j6sEdQEGjL3MbxP6yJ79RczgqXm+sC4mssroUtQ1R/iSjWivyt0
         8Wk4cXHIaixtNl2npmT+Jr+vsZ+0LTDDRtQALsu7kH2l8M5NA+mC29uCaSfqHA78ECnt
         IWZm6r1kqptN8g1SxVOAlL1CCZYUcNApKicI3Z9gaVNQRD5a17t6NmjUVUjiJUq0TSQl
         DexOwh+Vy64cK7tDfdFhSvGqy+hHH1JnO7z161PXroHn1rLtlt0N4MGSGkzMjynuC83K
         EfrQ==
X-Gm-Message-State: AOAM5334oNAsMb3J4hMowFt5jOyQkpASPwIX0/6mtkC6DTzO9QrHZDv8
	tgrbGo94x6xbCduD4ip9xy7cpBn6/2EC3JHlc8tflfioOdhVgHmLyZn0t6jtBv2wcOWaFjR/BBj
	z3+R7yGlPl/mVpULdE5M7b0WxhKyjdMVc0A==
X-Received: by 2002:aa7:d342:: with SMTP id m2mr5302485edr.40.1627555241263;
        Thu, 29 Jul 2021 03:40:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjxgKl6WmnwX+WqFoKb6oCeo3LEsCBOoKuWEW0W2jjhEWMO4WBVPwCw/S6BOn4eM0m2lGmgg==
X-Received: by 2002:aa7:d342:: with SMTP id m2mr5302475edr.40.1627555241166;
        Thu, 29 Jul 2021 03:40:41 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id c14sm824475ejb.78.2021.07.29.03.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 03:40:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Bongsu Jeon <bongsu.jeon@samsung.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Date: Thu, 29 Jul 2021 12:40:16 +0200
Message-Id: <20210729104022.47761-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
References: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 5QKN2ZPY73BYIRUFG5LBQ57DSEPGUZKK
X-Message-ID-Hash: 5QKN2ZPY73BYIRUFG5LBQ57DSEPGUZKK
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 06/12] nfc: nfcsim: constify drvdata (struct nfcsim)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/5QKN2ZPY73BYIRUFG5LBQ57DSEPGUZKK/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

nfcsim_abort_cmd() does not modify struct nfcsim, so local variable
can be a pointer to const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/nfcsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/nfcsim.c b/drivers/nfc/nfcsim.c
index 143dc49b815b..15754671eb4d 100644
--- a/drivers/nfc/nfcsim.c
+++ b/drivers/nfc/nfcsim.c
@@ -240,7 +240,7 @@ static int nfcsim_send(struct nfc_digital_dev *ddev, struct sk_buff *skb,
 
 static void nfcsim_abort_cmd(struct nfc_digital_dev *ddev)
 {
-	struct nfcsim *dev = nfc_digital_get_drvdata(ddev);
+	const struct nfcsim *dev = nfc_digital_get_drvdata(ddev);
 
 	nfcsim_link_recv_cancel(dev->link_in);
 }
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
