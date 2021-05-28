Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E51539449A
	for <lists+linux-nfc@lfdr.de>; Fri, 28 May 2021 16:56:32 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 39B6A100EBBA2;
	Fri, 28 May 2021 07:56:31 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id E9EE8100EC1CC
	for <linux-nfc@lists.01.org>; Fri, 28 May 2021 07:56:28 -0700 (PDT)
Received: from mail-ua1-f71.google.com ([209.85.222.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lmduV-0004Ci-CL
	for linux-nfc@lists.01.org; Fri, 28 May 2021 14:56:27 +0000
Received: by mail-ua1-f71.google.com with SMTP id k38-20020ab04d660000b0290244c015d9e8so31941uag.5
        for <linux-nfc@lists.01.org>; Fri, 28 May 2021 07:56:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j+dadvxhKr9M8DJyOltCeC2IGkgvG/BUqwA8QIFSNMA=;
        b=FcIAKiM40KtmcKuX4wMGHdGByqX++rtnml2hllHoi8NhgD411Hm0wXo45RhAmoeMFW
         skB9SYk9XlkUqyzomAzle0h3Yd4aP+n0E3jAQ3pTIcuu22RcBuyoK6JfNkND4C09XAsy
         mZ0jKQb429v5daCTxNz6HSP0bSN1JKIErFBL1lFoBb5tbCHahNVjhmqebuSUPSpx12Lq
         mL/H4kLLoQ5gruoo33liyYpPJb9HNUDmZFsYTwOJ6YkwgnqGqfzh16XS5VIqrxCds0f0
         XQLlz3mQtEf3YKpXodSQeAFb4icXCFpKqG7TWO1kTQufUuX2wiSqJYTLtoQB4bWaInLh
         LHTg==
X-Gm-Message-State: AOAM533G0eCL0MmNJ0xJCN+bHsMD772yc9hrxCm5HJiuS0euxBvhgSQZ
	Yem9Z7h0VH+2LbMM2g3ouK4NEGltu1G1W0xhHnHmzp4pmUi7TRMYmIsM+2ybPhRoaeZF6AE9a18
	3hiGrZOYZAqLABYKHMR+1G45YYjKd8fpZPQ==
X-Received: by 2002:ab0:784f:: with SMTP id y15mr1771857uaq.60.1622213786528;
        Fri, 28 May 2021 07:56:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyHSIj3RddiIF4GdX53OPJYJVeWiyudWqy6hwbTM0Ky1LEO3HZhHoiUl8wApzZ3ufLbvD2yw==
X-Received: by 2002:ab0:784f:: with SMTP id y15mr1771838uaq.60.1622213786400;
        Fri, 28 May 2021 07:56:26 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c15sm743661vko.15.2021.05.28.07.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 07:56:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 28 May 2021 10:55:31 -0400
Message-Id: <20210528145534.125460-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210528145534.125460-1-krzysztof.kozlowski@canonical.com>
References: <20210528145330.125055-1-krzysztof.kozlowski@canonical.com>
 <20210528145534.125460-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 5LHQQ6MPYQ4JCPW635BBB6HXUNBM4AXQ
X-Message-ID-Hash: 5LHQQ6MPYQ4JCPW635BBB6HXUNBM4AXQ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 08/11] nfc: pn544: drop ftrace-like debugging messages
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/5LHQQ6MPYQ4JCPW635BBB6HXUNBM4AXQ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that the kernel has ftrace, any debugging calls that just do "made
it to this function!" and "leaving this function!" can be removed.
Better to use standard debugging tools.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/pn544/i2c.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/nfc/pn544/i2c.c b/drivers/nfc/pn544/i2c.c
index aac778c5ddd2..de59e439c369 100644
--- a/drivers/nfc/pn544/i2c.c
+++ b/drivers/nfc/pn544/i2c.c
@@ -241,8 +241,6 @@ static int pn544_hci_i2c_enable(void *phy_id)
 {
 	struct pn544_i2c_phy *phy = phy_id;
 
-	pr_info("%s\n", __func__);
-
 	pn544_hci_i2c_enable_mode(phy, PN544_HCI_MODE);
 
 	phy->powered = 1;
@@ -875,9 +873,6 @@ static int pn544_hci_i2c_probe(struct i2c_client *client,
 	struct pn544_i2c_phy *phy;
 	int r = 0;
 
-	dev_dbg(&client->dev, "%s\n", __func__);
-	dev_dbg(&client->dev, "IRQ: %d\n", client->irq);
-
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		nfc_err(&client->dev, "Need I2C_FUNC_I2C\n");
 		return -ENODEV;
@@ -937,8 +932,6 @@ static int pn544_hci_i2c_remove(struct i2c_client *client)
 {
 	struct pn544_i2c_phy *phy = i2c_get_clientdata(client);
 
-	dev_dbg(&client->dev, "%s\n", __func__);
-
 	cancel_work_sync(&phy->fw_work);
 	if (phy->fw_work_state != FW_WORK_STATE_IDLE)
 		pn544_hci_i2c_fw_work_complete(phy, -ENODEV);
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
