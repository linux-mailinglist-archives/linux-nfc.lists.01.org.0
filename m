Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD79439935
	for <lists+linux-nfc@lfdr.de>; Mon, 25 Oct 2021 16:49:56 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 2DB11100EA910;
	Mon, 25 Oct 2021 07:49:55 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 8B1A8100F227A
	for <linux-nfc@lists.01.org>; Mon, 25 Oct 2021 07:49:52 -0700 (PDT)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 826DC3F332
	for <linux-nfc@lists.01.org>; Mon, 25 Oct 2021 14:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1635173390;
	bh=KricW4D7VolKL3JPfDUExtQxStN8Nau+m8lKmFDnDuQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=f8KTU5sgHG/SgF5CRj6zA5LjHshGBwrZM3hY3wUp6wuK76W67OpsV82HUbW8UZ2Xa
	 H7lqO2odLSOcjEw4F/bFT/eE1WYLR5pArXz46UxoyI9EmIEOi5mS7F0woS0qSzsOgB
	 hoAWspch+Sl62NaSv+DuARGSpSrG3q651WZI759Y6dn64SGq4SJ6L2sbbJf1cSO62G
	 NAOGHNfIvd5LwLPaIsdF6bPCd9C8Xx32LcR6EhRvFmpwikec6OUchk9+rSLYHHwSiN
	 dUGPYsF4Hq8Df4k8wft0Z3BoUDI9XUgHwv3UHEYO7DveIUOz7JkFMZwJ173nuioI02
	 svBfQjkLKl8xg==
Received: by mail-lj1-f198.google.com with SMTP id h5-20020a2e9005000000b00210d01099b3so2852002ljg.17
        for <linux-nfc@lists.01.org>; Mon, 25 Oct 2021 07:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KricW4D7VolKL3JPfDUExtQxStN8Nau+m8lKmFDnDuQ=;
        b=phlCrRPI59BL801eZgS4bcLXoV0bg2UvpQMrE5f5InBJtd6q+R+9GqX988Ysny9VoA
         /HY7rQePDqwZ/1IPo1WCaNsd8SFOPYpM+ot0dVZGryvSgAD+36E3Kl6GE/vtmyAPx1Or
         agPYzvw+nG7wqIrVMbYFi8cVl+Ea2UCkvnNEHpTPUtPJ5Mn3nZAx9uS0Wlx9rf4YVqiR
         oSRS47T5/dbvKz9Cqb1NvaSxS03T4Z1qPHEOI3FDeznrop6QsorG27qOfNSbUHKEFfrw
         dvfRe263XxZboHtT1L5xIqmpmDITz4o9N9boft9oK5WRDVd90Y9IecXNN1Z52Uv5qReN
         g/3Q==
X-Gm-Message-State: AOAM531kShQRDDn24aBlxNITvdtBtBX5tBXO1xm/1np6Lr9jUfTjM+MM
	ToYfN7NvNdPCNxd8xbz0ML4ojQTrILxdBjg2r1YhUFxTY0P9X4uBZs55Myvc2G111APgp71VfBI
	QkKX4jkwctzncgOm1J05LSIkESeCMqABl5g==
X-Received: by 2002:ac2:5d71:: with SMTP id h17mr14204465lft.642.1635173389990;
        Mon, 25 Oct 2021 07:49:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxRQErlF/R1paw1cLXY13RG/G2M/k1Cz7GJkjb23Wq22EpZlnXHsMIgnnBJ+035rSdh+yV5w==
X-Received: by 2002:ac2:5d71:: with SMTP id h17mr14204445lft.642.1635173389830;
        Mon, 25 Oct 2021 07:49:49 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id j15sm1660922lfe.252.2021.10.25.07.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 07:49:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Thierry Escande <thierry.escande@linux.intel.com>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Mon, 25 Oct 2021 16:49:36 +0200
Message-Id: <20211025144936.556495-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Message-ID-Hash: M67BLWK36SIE5RG5NKFRIUIABKHCUQ7O
X-Message-ID-Hash: M67BLWK36SIE5RG5NKFRIUIABKHCUQ7O
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: stable@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2] nfc: port100: fix using -ERRNO as command type mask
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/M67BLWK36SIE5RG5NKFRIUIABKHCUQ7O/>
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

Changes since v1:
1. Drop debug code.
---
 drivers/nfc/port100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/port100.c b/drivers/nfc/port100.c
index 517376c43b86..16ceb763594f 100644
--- a/drivers/nfc/port100.c
+++ b/drivers/nfc/port100.c
@@ -1006,11 +1006,11 @@ static u64 port100_get_command_type_mask(struct port100 *dev)
 
 	skb = port100_alloc_skb(dev, 0);
 	if (!skb)
-		return -ENOMEM;
+		return 0;
 
 	resp = port100_send_cmd_sync(dev, PORT100_CMD_GET_COMMAND_TYPE, skb);
 	if (IS_ERR(resp))
-		return PTR_ERR(resp);
+		return 0;
 
 	if (resp->len < 8)
 		mask = 0;
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
