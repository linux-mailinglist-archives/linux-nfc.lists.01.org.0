Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFE7394497
	for <lists+linux-nfc@lfdr.de>; Fri, 28 May 2021 16:56:30 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 2911C100EC1DA;
	Fri, 28 May 2021 07:56:29 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 7C68F100EC1D3
	for <linux-nfc@lists.01.org>; Fri, 28 May 2021 07:56:27 -0700 (PDT)
Received: from mail-ua1-f71.google.com ([209.85.222.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lmduU-0004C9-6h
	for linux-nfc@lists.01.org; Fri, 28 May 2021 14:56:26 +0000
Received: by mail-ua1-f71.google.com with SMTP id i8-20020a9f3b080000b029023c932e01b8so2032292uah.3
        for <linux-nfc@lists.01.org>; Fri, 28 May 2021 07:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rqhoxm5CLlbJM/5GAddet7UbrdiBVjWGcbVsawnnnn4=;
        b=FzO7qFjez/FUbGHXJCiXsgZjCZPGKOKHI+2NXFego65OpvaYgpoJI1ZWSMIP8mW8U6
         SDGXsONHahWT1jd1yCBu46vuabtrTfdVoXIwgbl1+PSG8tTV3p598BvQFWZomiz5hDz2
         wNZBuJtM90ZO81avpPi1edZLBu7t5GrKXDWGj8UzGvDJZirkJX4zRdL0cKtL/ZmjyQQH
         wjtAbo4CGc4KwX7wtBkp2EsAhfy+8sE6naGG4aLXrniekvlW1k641ZJiiFVXYbPZMAnQ
         R/l0OT3HD5xpI5VdXZpSAY5U4FNzgFXtiTmNbNf9cUdaY2gucocpu3WyTVmdN3iIXbJX
         i/pA==
X-Gm-Message-State: AOAM533ID2SyDGqAUesWvgvLNlMl5CkgeUbjnkv2Sxa8Guzt6r5EayR2
	KtwX0pN48Y04cafERCejiimIS9ioVNzzrrgpwe90XW7he0eHIFNWwXsl+szINXZhudyC/JF2WjD
	ZTo4m1d11vCQQsZT2g80ARCdo4aOG533vfA==
X-Received: by 2002:a67:1502:: with SMTP id 2mr7636622vsv.54.1622213785091;
        Fri, 28 May 2021 07:56:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb8OO4o34xFfvAGeZ0PYHDdIKkTWfBSnGw+mGLR8E4cGsVQB+Bf0IFKJj9Fq2M/cw1lgOsWw==
X-Received: by 2002:a67:1502:: with SMTP id 2mr7636598vsv.54.1622213784821;
        Fri, 28 May 2021 07:56:24 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c15sm743661vko.15.2021.05.28.07.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 07:56:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 28 May 2021 10:55:30 -0400
Message-Id: <20210528145534.125460-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210528145534.125460-1-krzysztof.kozlowski@canonical.com>
References: <20210528145330.125055-1-krzysztof.kozlowski@canonical.com>
 <20210528145534.125460-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: ICRFPSBANIW6M3LGLZVCS2VUHY2LGJFY
X-Message-ID-Hash: ICRFPSBANIW6M3LGLZVCS2VUHY2LGJFY
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 07/11] nfc: pn533: drop unneeded braces {} in if
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ICRFPSBANIW6M3LGLZVCS2VUHY2LGJFY/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

{} braces are not needed over single if-statement.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/pn533/i2c.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/nfc/pn533/i2c.c b/drivers/nfc/pn533/i2c.c
index bb04fddb0504..e6bf8cfe3aa7 100644
--- a/drivers/nfc/pn533/i2c.c
+++ b/drivers/nfc/pn533/i2c.c
@@ -192,9 +192,8 @@ static int pn533_i2c_probe(struct i2c_client *client,
 				phy, &i2c_phy_ops, NULL,
 				&phy->i2c_dev->dev);
 
-	if (IS_ERR(priv)) {
+	if (IS_ERR(priv))
 		return PTR_ERR(priv);
-	}
 
 	phy->priv = priv;
 	r = pn532_i2c_nfc_alloc(priv, PN533_NO_TYPE_B_PROTOCOLS, &client->dev);
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
