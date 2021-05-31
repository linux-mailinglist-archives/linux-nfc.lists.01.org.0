Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C229395652
	for <lists+linux-nfc@lfdr.de>; Mon, 31 May 2021 09:39:25 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 0BCBF100EC1DA;
	Mon, 31 May 2021 00:39:24 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 3371F100ED48C
	for <linux-nfc@lists.01.org>; Mon, 31 May 2021 00:39:22 -0700 (PDT)
Received: from mail-wm1-f71.google.com ([209.85.128.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lncW8-000389-MW
	for linux-nfc@lists.01.org; Mon, 31 May 2021 07:39:20 +0000
Received: by mail-wm1-f71.google.com with SMTP id 128-20020a1c04860000b0290196f3c0a927so2688730wme.3
        for <linux-nfc@lists.01.org>; Mon, 31 May 2021 00:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rqhoxm5CLlbJM/5GAddet7UbrdiBVjWGcbVsawnnnn4=;
        b=pnTB52DDIybfFXfwDGun/pJf+BqsKEh+/vJDXCSeDQbWTLCU36ZGWWbt+VgaiheHQq
         QUH+RsPi2/zonfdNVkWBLdV6wk+MXCcYHz0zWte8pWQBEE0zqlIMOUYiiXRTJbtcQHnL
         dFyisD1OpAI2xBooEBUnPRk5QV0beisCJ2zFjKE5nnaW06kiXMATuqF/cYTkqv9yYNuM
         890JH7XH8UFwMQQyMUmbn8HIunXztfA4V2pvJq5ILsFwdF2cL/J8HbbzLyPHM4FX+lXz
         EOx8Y2bVZqCWWpyBYKyuQI3MRc7J/8DHVSpZoih+3yylCMvd47YFedZ6OmIUFy/ktWgh
         OdYg==
X-Gm-Message-State: AOAM531pHaH4bzyQqV43JR35obGaC/AwIh1GYAV8cCbEGZU26qCpcqUZ
	03A6E/LNUXv/JOAphxA1G4CZLQfkNWvJHp6cO7zvc3QJ7uFjQ2GR8hw7ND1e0E9q1bmmF90a830
	kkpz4DOfDE+7abPLRD2JgoXOp/gcD5aQilg==
X-Received: by 2002:a1c:4304:: with SMTP id q4mr4723195wma.89.1622446760489;
        Mon, 31 May 2021 00:39:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3sisp3Wo09P8lmTnXy6HbSldTGXnsq3kSNvNn0N2+ZhFPrlfzfkHfeYDOg39Tl+QlYG3WJQ==
X-Received: by 2002:a1c:4304:: with SMTP id q4mr4723180wma.89.1622446760345;
        Mon, 31 May 2021 00:39:20 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id a1sm9168911wrg.92.2021.05.31.00.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 00:39:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Mon, 31 May 2021 09:38:58 +0200
Message-Id: <20210531073902.7111-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210531073522.6720-1-krzysztof.kozlowski@canonical.com>
References: <20210531073522.6720-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: SO2GBKFGPFIWHSD7OBDZA3CVZMK2DGVJ
X-Message-ID-Hash: SO2GBKFGPFIWHSD7OBDZA3CVZMK2DGVJ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [RESEND PATCH 07/11] nfc: pn533: drop unneeded braces {} in if
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/SO2GBKFGPFIWHSD7OBDZA3CVZMK2DGVJ/>
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
