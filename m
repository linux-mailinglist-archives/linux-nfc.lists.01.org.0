Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E42A39449B
	for <lists+linux-nfc@lfdr.de>; Fri, 28 May 2021 16:56:34 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4AECB100EC1C8;
	Fri, 28 May 2021 07:56:33 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 76E44100EC1E3
	for <linux-nfc@lists.01.org>; Fri, 28 May 2021 07:56:31 -0700 (PDT)
Received: from mail-vs1-f72.google.com ([209.85.217.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lmduY-0004DZ-4N
	for linux-nfc@lists.01.org; Fri, 28 May 2021 14:56:30 +0000
Received: by mail-vs1-f72.google.com with SMTP id p14-20020a67e94e0000b029023fa53ce6e9so1087489vso.14
        for <linux-nfc@lists.01.org>; Fri, 28 May 2021 07:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4J89KlzzqThKgmZLnM37DvaB3SqI47fv9hR1FCtpA64=;
        b=pEAM3lqGU+RJ92aB76rUwosSIO8yztDtCeq3ITyDgN1m7hmYanTyLyL4koxjtu1ytj
         QIOAQ9CK3MHLT7g35VlU51xwe9Mvt3/lq2B7GBYt3V78Rpvx+Kh4rxlJa0q5v6BqYEFD
         a1+IyTHceoMBjqL8DGNsMJmmO1ptVhyYAsSg0DmbMv2JigVoJ0trXDfJggFy+8rZ25Dy
         ChZgdgdwoyBfs3w9C6fM+D58cU96GMRUKWoHQFEhmMJ/AmNT/6zYsQLcB0w4TPcBgARD
         fBIwn5mp1WWDsBJx6ulvra9/mOpvP9XyjOeKiFfq7boJW8nuqf0brw5jXf+CXVsbOk/i
         Xpag==
X-Gm-Message-State: AOAM5308NtWKC328d33YsAz11AMUPZjgrBeurMO+tqMWOZYRe16mFd4k
	yWjQy5j9fEIit8cBSa5cs2n22aBJhibx1KVfARWXTQND6H29Y1Druey01icO0oMK0KIoTDPKk3d
	RDW048FHLW26cJjpvS1Xvuu3Fv9hgkBZxbw==
X-Received: by 2002:a67:fe57:: with SMTP id m23mr7736107vsr.47.1622213788966;
        Fri, 28 May 2021 07:56:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfP6IRN4IcIxf2t6eEShocPoP23xgflYrdiX1LN2LPsh2qCqRV1RB9l96ev0kp0bJKZkT0Qw==
X-Received: by 2002:a67:fe57:: with SMTP id m23mr7736079vsr.47.1622213788791;
        Fri, 28 May 2021 07:56:28 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c15sm743661vko.15.2021.05.28.07.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 07:56:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 28 May 2021 10:55:32 -0400
Message-Id: <20210528145534.125460-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210528145534.125460-1-krzysztof.kozlowski@canonical.com>
References: <20210528145330.125055-1-krzysztof.kozlowski@canonical.com>
 <20210528145534.125460-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: W7P4UPUUHF35VGYLHBVI2MIPDSV55II6
X-Message-ID-Hash: W7P4UPUUHF35VGYLHBVI2MIPDSV55II6
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 09/11] nfc: st21nfca: drop ftrace-like debugging messages
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/W7P4UPUUHF35VGYLHBVI2MIPDSV55II6/>
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
