Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCD7402864
	for <lists+linux-nfc@lfdr.de>; Tue,  7 Sep 2021 14:18:41 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 59865100EB82E;
	Tue,  7 Sep 2021 05:18:35 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id BAF39100EB82F
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 05:18:32 -0700 (PDT)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C3D0E40779
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 12:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631017111;
	bh=alAZCnXDBZFqFGCWdjT1NtYwVcFPW4mHC6+AQVNQmag=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=trlr4oC8LLuY5GeQkmvHgbJsYUtlqK9BukxXXgZehcZTvW+lLylO5H1FoHfVU4RHQ
	 qIAb7rHlZFUJpfMJuHiwXDYuDjjdWh1S0TeH6qjenACrNrzK2JJdwuRtUjLa0vh4Z7
	 PdVmQEJz8PFLICWDV1BkzqRHkM9deQdBgPYvdrlHngODvLJxksmuJhe8rivaeuCod3
	 34LP/rzzXApaDTTc8nvyAD/xoeDhGnVjjncnRFaKSGr6jh9moGDyUqGrJax0j+tDIL
	 KabZ+QGFTrv0SML9Uk+unL1eM6+kSoMmjRxkwStkkSwNzq97krA5Ikz/qvd+7PeEok
	 bsEIbaJyLIVLw==
Received: by mail-wm1-f71.google.com with SMTP id p5-20020a7bcc85000000b002e7563efc4cso1035233wma.4
        for <linux-nfc@lists.01.org>; Tue, 07 Sep 2021 05:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=alAZCnXDBZFqFGCWdjT1NtYwVcFPW4mHC6+AQVNQmag=;
        b=Zt+yKngggbAAJoUWr9PHAqiq/woGlufAZdNTW+ULCPb8KHMbBY576EGe39+qezg7cZ
         AgJZOxWUVD82B26UX8JIlPnvdicx9gr1qOBX7zBy+RJPB79Vd903kc/7z9772anebAKt
         22M9FYkj7LQNNCrW95XFovdK1si+uUVMAkzEySQkvK70WSfROkqJAaSCXqE/YzRtxE3n
         YzIpn7BtjaEIDLxhJLgfn0+wuDzjqk27HnLXV6zTxVJZvTY5oP/rNywhMuEgvSgKzQzO
         FJBXe702RwF96gqXRsVmHHNqZiRtG2/nx+pxmqfvZHjaPdzOEe1Pnh2P8Lk3CesAjUoD
         3x0A==
X-Gm-Message-State: AOAM531IhwYKFL+WdMGXQCrg4vQdGvlLaP8Qk0kSC+VZ/+Z4WvQI5fTy
	CiKLrQPoD9FJbRF8H+7KNDrANAsqwBoYYdZPgSjcXskzHD76jWd8A2STgsd4/OKi7BuXWKuOfXg
	J4HAWQLAU/K4L876U71+xLnJMIvhq004mEQ==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr3717614wmk.135.1631017111458;
        Tue, 07 Sep 2021 05:18:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSzLNNlEK8DFo/MnzQggQYeVU3xGdFUyuK/8MdNZjNchdqevSP20XoztHRWZaK3JDeEdaRWA==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr3717597wmk.135.1631017111286;
        Tue, 07 Sep 2021 05:18:31 -0700 (PDT)
Received: from kozik-lap.lan ([79.98.113.47])
        by smtp.gmail.com with ESMTPSA id m3sm13525216wrg.45.2021.09.07.05.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 05:18:30 -0700 (PDT)
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
Date: Tue,  7 Sep 2021 14:18:09 +0200
Message-Id: <20210907121816.37750-9-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
References: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: V7KKGQ7ALYL46N46TASIASE7VGITGAMH
X-Message-ID-Hash: V7KKGQ7ALYL46N46TASIASE7VGITGAMH
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 08/15] nfc: pn544: drop unneeded memory allocation fail messages
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/V7KKGQ7ALYL46N46TASIASE7VGITGAMH/>
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
 drivers/nfc/pn544/mei.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/nfc/pn544/mei.c b/drivers/nfc/pn544/mei.c
index a519fa0a53e2..c493f2dbd0e2 100644
--- a/drivers/nfc/pn544/mei.c
+++ b/drivers/nfc/pn544/mei.c
@@ -23,10 +23,8 @@ static int pn544_mei_probe(struct mei_cl_device *cldev,
 	int r;
 
 	phy = nfc_mei_phy_alloc(cldev);
-	if (!phy) {
-		pr_err("Cannot allocate memory for pn544 mei phy.\n");
+	if (!phy)
 		return -ENOMEM;
-	}
 
 	r = pn544_hci_probe(phy, &mei_phy_ops, LLC_NOP_NAME,
 			    MEI_NFC_HEADER_SIZE, 0, MEI_NFC_MAX_HCI_PAYLOAD,
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
