Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7943DA143
	for <lists+linux-nfc@lfdr.de>; Thu, 29 Jul 2021 12:40:51 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id A2C5A100EB839;
	Thu, 29 Jul 2021 03:40:46 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 1943B100EBB97
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:40:45 -0700 (PDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id E3DB73F115
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 10:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627555243;
	bh=vQB6RRzmQQRlWh6S5blKR75hWps+lidsZcEbJz9OF3k=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=nml0jDSXVy3lXLhxTJ8QN4KV0wYeNSWSr68dcZw6YBXHAj3kOn5Wdr7b2OBtWDLhZ
	 4CmrfjLIEmWIF0CDcXcU2pqGh87u0rIhe9+fDPv0J5OUdZNra7JuYnr0+FFqHHK2Yn
	 l4Z6sZp3SvVsi5BYE0/GPZQjjriuj2nY+zETK8CNo0GlqEx1uBfwAT1MhH3899+cyQ
	 fnqJs5qMwxPnj0tVkXnSqAADuzI/aTemgJaJJkK+utVvbUT46CPwEQIooZNGe6LgF0
	 7mfdfd5stXg/O5HnVDsmz0q51+j1sXhjV7qVE7wgMl3Lfmvg1uogOVwW94LiEsE5tQ
	 yOEMgSm/rfMhQ==
Received: by mail-ed1-f71.google.com with SMTP id k14-20020a05640212ceb02903bc50d32c17so2756697edx.12
        for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vQB6RRzmQQRlWh6S5blKR75hWps+lidsZcEbJz9OF3k=;
        b=jU7TTYxpsjjVXPvW1jKB2loosPZmqXY4ei8fqRvnysF+J2GYaJ4qbOUpVomec0UCdk
         PvyTx2c6i8u+tP6Se9zCcIJbav85s+whX+M4wAsuTo1UZLIxBud168EgWML2+4GzffQP
         KjGM4557fX8SGRxwFMqhnVu+Jlie2TRdXm6+a9mjpPjjmMCZSqzMkpaQme3MHaBzcglr
         OP8A0aCQgEpaSb1+HaMghQWrHxovKeI0vyHga0SpszWX9wuHv5DBUVgG2fJ2Vq1AO+eL
         UMEJF9/yHMplpIXQEd81x6FXMZOmLP+77FHyqbIxmYzkig6rW86ZnBpACuyRoAfvuEHV
         PSig==
X-Gm-Message-State: AOAM533+Kh0rcN8tB9o+OzZJNvS6C99Kpr2qp5Bfq2it8NiCP/lNGZwW
	hOVvAnrt/uSfqh6Kx9prSOa9IIT3vqmyjS+SSyoIC/ukkjOdw9FWqGxlRTqIsOy3t4G/uMlmoU/
	iZMS8xh9QBYXenpfA8/gMeYJyBiyul6LEZw==
X-Received: by 2002:a50:da0e:: with SMTP id z14mr5301138edj.73.1627555243671;
        Thu, 29 Jul 2021 03:40:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwijoO/q/+k8GRTBBEBcEUFMonWljYAnQQgqcZHQasMq3+MlfMPzmN1xs3UX4P2zxHnMrP0CQ==
X-Received: by 2002:a50:da0e:: with SMTP id z14mr5301127edj.73.1627555243524;
        Thu, 29 Jul 2021 03:40:43 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id c14sm824475ejb.78.2021.07.29.03.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 03:40:43 -0700 (PDT)
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
Date: Thu, 29 Jul 2021 12:40:18 +0200
Message-Id: <20210729104022.47761-9-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
References: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: H2ZOCVLGUUWCMGC7BDIXGJYFRKDVSFCS
X-Message-ID-Hash: H2ZOCVLGUUWCMGC7BDIXGJYFRKDVSFCS
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 08/12] nfc: fdp: use unsigned int as loop iterator
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/H2ZOCVLGUUWCMGC7BDIXGJYFRKDVSFCS/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Loop iterators are simple integers, no point to optimize the size and
use u8.  It only raises the question whether the variable is used in
some other context.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/fdp/fdp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/fdp/fdp.c b/drivers/nfc/fdp/fdp.c
index 650a140bea46..3f5fba922c4d 100644
--- a/drivers/nfc/fdp/fdp.c
+++ b/drivers/nfc/fdp/fdp.c
@@ -611,7 +611,8 @@ static int fdp_nci_core_get_config_rsp_packet(struct nci_dev *ndev,
 	struct fdp_nci_info *info = nci_get_drvdata(ndev);
 	struct device *dev = &info->phy->i2c_dev->dev;
 	struct nci_core_get_config_rsp *rsp = (void *) skb->data;
-	u8 i, *p;
+	unsigned int i;
+	u8 *p;
 
 	if (rsp->status == NCI_STATUS_OK) {
 
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
