Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7050408CD9
	for <lists+linux-nfc@lfdr.de>; Mon, 13 Sep 2021 15:20:58 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 19CDA100EB831;
	Mon, 13 Sep 2021 06:20:55 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 33D7E100EBB75
	for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 06:20:53 -0700 (PDT)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1805640268
	for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 13:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631539252;
	bh=YdMV9AtCFFKriT3c6sHpvFf+xJsEOIFlGHmRsaTySis=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=HOAAKwvdpdmyH4tdpGVLfBqD7m7LYolgeZaXaejKnCYlIkAt+0WOppnAKz2z1uvmy
	 lRxcsgqJWAwqztZgs00xu+3VwdmR9CGLiuhoKii77BVNDeUHux8Meo/97gXwRRJPEM
	 PwgTSn2e9HlmD9jc03v9jgYNaB9RaT78pBDzO2uqEodYlGCIBj0zWUVLHhJl58x3Qe
	 MsMZwM5ixJ0ZBKcn92c9ite40yrYPNabkOeaOqkx1eM/WTvsjHnLQXxPjA7ggLekS0
	 MaA5GKbH0bFRmdgzhJ9EMJBf4BIGTPTUIP/kzuz7ZdA55D2tYE6xcoqiqEmzzdm+NX
	 Pw18Y5UF936AA==
Received: by mail-wm1-f69.google.com with SMTP id z18-20020a1c7e120000b02902e69f6fa2e0so4910648wmc.9
        for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 06:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YdMV9AtCFFKriT3c6sHpvFf+xJsEOIFlGHmRsaTySis=;
        b=vQKcnEoqVs6Rr8n0t+smIcBSI0EhTRTK1cHphW9sVB+apenmzStademRj8i94V1UgM
         kcHrFmnprjN3/SIOFW66xkgz9PDnQHe9LDtUbiqiJW2SOXmn+Ae5YNsUB002VuVau+0I
         StwXdRNFE3lBLRkatYvUxljtIvKsjFjiS6Y1HhILK7sg5D58X5TyccHIpXOmuRbvBZqz
         flQdmti2Ch6atEvy2sXtgi3vm2oupsHwUpvOlMAT4XojicvwS+psK6q2/NMSpxE1w4N5
         NjATfpbhMIT09IogTv7xWlI0Gxjydzfo1GDTzR0I7PMm30mpq9Z095Sn4Nip/DKnj8Kd
         tVpA==
X-Gm-Message-State: AOAM533iUsqZ05tcacnrdSUWcij2+Ig6DdzNZmGz6lJqyOukZVAecTJ6
	rqoTME4VZx4Ie8eqsm/zFA392SIVOeccai9C+OjHxnHOYJkDOoPc5LX1ujvQchhwva+VTzwNJYH
	Gnzv56WudYmKzfx7m/BkX6WEuf9kPCETQIA==
X-Received: by 2002:a1c:a911:: with SMTP id s17mr11244116wme.84.1631539251774;
        Mon, 13 Sep 2021 06:20:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDKCa2J0aDKEwfGljc8lrJwSBXahWxEFgvrIqIssT5ml8sBzDELvL1CsHBBwjLD7+R1dAL1A==
X-Received: by 2002:a1c:a911:: with SMTP id s17mr11244098wme.84.1631539251649;
        Mon, 13 Sep 2021 06:20:51 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id n3sm7195888wmi.0.2021.09.13.06.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:20:51 -0700 (PDT)
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
Date: Mon, 13 Sep 2021 15:20:26 +0200
Message-Id: <20210913132035.242870-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
References: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: F7UMVH5OKXY2IYZZGUE7CH3JCBDSEOTC
X-Message-ID-Hash: F7UMVH5OKXY2IYZZGUE7CH3JCBDSEOTC
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 06/15] nfc: pn533: use dev_err() instead of pr_err()
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/F7UMVH5OKXY2IYZZGUE7CH3JCBDSEOTC/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Print error message with reference to a device.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/pn533/pn533.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index c5f127fe2d45..da180335422c 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -2171,7 +2171,7 @@ void pn533_recv_frame(struct pn533 *dev, struct sk_buff *skb, int status)
 	}
 
 	if (skb == NULL) {
-		pr_err("NULL Frame -> link is dead\n");
+		dev_err(dev->dev, "NULL Frame -> link is dead\n");
 		goto sched_wq;
 	}
 
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
