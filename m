Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93663395654
	for <lists+linux-nfc@lfdr.de>; Mon, 31 May 2021 09:39:28 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 3DF9B100EC1D5;
	Mon, 31 May 2021 00:39:27 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 0A424100EC1D7
	for <linux-nfc@lists.01.org>; Mon, 31 May 2021 00:39:23 -0700 (PDT)
Received: from mail-wr1-f72.google.com ([209.85.221.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lncWA-000394-Fz
	for linux-nfc@lists.01.org; Mon, 31 May 2021 07:39:22 +0000
Received: by mail-wr1-f72.google.com with SMTP id q15-20020adfc50f0000b0290111f48b865cso3643311wrf.4
        for <linux-nfc@lists.01.org>; Mon, 31 May 2021 00:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4J89KlzzqThKgmZLnM37DvaB3SqI47fv9hR1FCtpA64=;
        b=pWtmQPCkeKgAzspkqfcIMAFUpZkEbAvBGY+JSB/hY9B1uTr++XSyD/avbgJE6pxwKg
         a4ijjfwIcQYEyQ3VHOTLWEeiZcesCP0jwAR41R5MIZ7KE8xEu0PgO1FQR0+VW8owBNE7
         NLnuZY0tTulXY4CF9RUxxcZqfngglHHdel362tZdtPJEzk+pQA8qBo1swyZykbVnx1+N
         GgQ//mrir6tgKN1WcJ3uq+R4h43ZMlhIJObfmPgEuCEGUUIjftgY1R/ufLE2HmPY+/iE
         Zd6tftnZYoxc1AwJ1IQ8d5/AurAulw3ztbt2ord9DYj35pmQlFIpCgC3fum0W7RPyK/y
         tN6g==
X-Gm-Message-State: AOAM531ffSwgr+gegXyqKdXimTZajYIUrkBHgErI2UsBb6qAOzKSpEWE
	0E+5z/97MEvOYZYkucTRQZVRj0CqrCdZUqmGvyQ3+3krTT/eWOUTEwmzNwEkn4iIfwJ92CJ5VZR
	yXlkzK/RxiLPB2KViNfXXPakHV5fzLDWaUg==
X-Received: by 2002:a05:600c:2948:: with SMTP id n8mr24706753wmd.95.1622446762302;
        Mon, 31 May 2021 00:39:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoc0eYdm0Gad3jKfILWO0BlkrBHmb4+ihv28lP2KSvG+Az7qWFv7kizSOlAt+HwZQaPXWCeQ==
X-Received: by 2002:a05:600c:2948:: with SMTP id n8mr24706734wmd.95.1622446762165;
        Mon, 31 May 2021 00:39:22 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id a1sm9168911wrg.92.2021.05.31.00.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 00:39:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Mon, 31 May 2021 09:39:00 +0200
Message-Id: <20210531073902.7111-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210531073522.6720-1-krzysztof.kozlowski@canonical.com>
References: <20210531073522.6720-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: ZVJNNBRD3R7YUGD26HHO7FZNUT5RX2T7
X-Message-ID-Hash: ZVJNNBRD3R7YUGD26HHO7FZNUT5RX2T7
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [RESEND PATCH 09/11] nfc: st21nfca: drop ftrace-like debugging messages
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ZVJNNBRD3R7YUGD26HHO7FZNUT5RX2T7/>
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
 drivers/nfc/st21nfca/i2c.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index cebc6c06a1b6..7a9f4d71707e 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -502,9 +502,6 @@ static int st21nfca_hci_i2c_probe(struct i2c_client *client,
 	struct st21nfca_i2c_phy *phy;
 	int r;
 
-	dev_dbg(&client->dev, "%s\n", __func__);
-	dev_dbg(&client->dev, "IRQ: %d\n", client->irq);
-
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		nfc_err(&client->dev, "Need I2C_FUNC_I2C\n");
 		return -ENODEV;
@@ -568,8 +565,6 @@ static int st21nfca_hci_i2c_remove(struct i2c_client *client)
 {
 	struct st21nfca_i2c_phy *phy = i2c_get_clientdata(client);
 
-	dev_dbg(&client->dev, "%s\n", __func__);
-
 	st21nfca_hci_remove(phy->hdev);
 
 	if (phy->powered)
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
