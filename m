Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28311402869
	for <lists+linux-nfc@lfdr.de>; Tue,  7 Sep 2021 14:18:48 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E0B91100EB32D;
	Tue,  7 Sep 2021 05:18:41 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 25713100EBB92
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 05:18:39 -0700 (PDT)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1F3AA40815
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 12:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631017118;
	bh=AKOLSiNotprej29rkzU07CereuPK7jDMwjY+iTyzzwA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=HFklzmnP9rTq9LMetMxwEr9i1bDD5hHmIqw5uu274s1r8Uf+oLJTxZtOocBDrf5jm
	 yH1mhPaWN+VeYCAxy2sfZ7/aFp7MS2iojNdSAWeuPD9qAIAtNiBZxPtnW2Rca7yNRJ
	 AyEcYKW6rnsYpvCz6sSTykeW/xY5FLzvfYf/9ctdoeuZMjIECe3hPvdI6aDYwIossl
	 a8goohdPd/dnNfzWMR9NtfWhioG6ZiDu+R6W/mWuyIN13rYSF9Of6Zljy/PLpUwoYZ
	 XcMwvv0Egboeb1j7FctJqKa/AmN4oxJlbPDjOaHAacgbnAOVjBVQgtYWUjKO/imTi1
	 KqxV2Nps2WIQA==
Received: by mail-wm1-f72.google.com with SMTP id c4-20020a1c9a04000000b002e864b7edd1so3320333wme.6
        for <linux-nfc@lists.01.org>; Tue, 07 Sep 2021 05:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AKOLSiNotprej29rkzU07CereuPK7jDMwjY+iTyzzwA=;
        b=qUwkTgzjvaQ2ONUyr6IYMa9utgP1MFILXF3NhR8fRpDzoKM4Cib/NF7MqLc58OhCR1
         cxoLtRzHWu8gcVtvI0wrPNkqTzIGC8L2QRfftWqVr9Pu46XxWLgJ2efx2Eosnw2/xhjR
         YBKeJb61q3BjP1KsPPkpmD6jM5oX9y6sKzfL+TdfRVFrHhLY9jQqzczgib7tCxJTMw3h
         KPpyleGpSqlXKkOZx7TDkWJKjbFIy5WYnODWlMYL99TAVWcjP+fSQLX5F+PQqeGSoJ5u
         rv9wibIDETXg3FSwq76M6FWbnmLQzIALuW/Aj4FETyYaxXF4zgslVMkXyHjfxZOsJkik
         AOOA==
X-Gm-Message-State: AOAM532PTixR6RgFiSdDE0509G2gV3AI/7edINeCPbJYyYqjguAIvTw2
	D82JHtUWg8fjWUxy13LbN5hfVLQDiAV5Yy+SF3tWGPXiNxRbt6d+6qWKhhOWT1gn1NuPYgL/dPc
	GbhCQfzVrzf6mwM0MdPCBze8ObHe6SwdLXg==
X-Received: by 2002:a5d:4ec5:: with SMTP id s5mr18813217wrv.267.1631017117795;
        Tue, 07 Sep 2021 05:18:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVLcRdCI3iDjK/G4gORzXajvhzjEDqB6WvYfzQBGQHCjdeU0byAvmPWP02UqU4TwnqzrjuVw==
X-Received: by 2002:a5d:4ec5:: with SMTP id s5mr18813203wrv.267.1631017117668;
        Tue, 07 Sep 2021 05:18:37 -0700 (PDT)
Received: from kozik-lap.lan ([79.98.113.47])
        by smtp.gmail.com with ESMTPSA id m3sm13525216wrg.45.2021.09.07.05.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 05:18:37 -0700 (PDT)
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
Date: Tue,  7 Sep 2021 14:18:14 +0200
Message-Id: <20210907121816.37750-14-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
References: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: J3WHJ47WCQMI6RXU5TNQNO3QG5AATHT7
X-Message-ID-Hash: J3WHJ47WCQMI6RXU5TNQNO3QG5AATHT7
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 13/15] nfc: microread: drop unneeded debug prints
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/J3WHJ47WCQMI6RXU5TNQNO3QG5AATHT7/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

ftrace is a preferred and standard way to debug entering and exiting
functions so drop useless debug prints.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/microread/i2c.c | 4 ----
 drivers/nfc/microread/mei.c | 2 --
 2 files changed, 6 deletions(-)

diff --git a/drivers/nfc/microread/i2c.c b/drivers/nfc/microread/i2c.c
index 86f593c73ed6..067295124eb9 100644
--- a/drivers/nfc/microread/i2c.c
+++ b/drivers/nfc/microread/i2c.c
@@ -237,8 +237,6 @@ static int microread_i2c_probe(struct i2c_client *client,
 	struct microread_i2c_phy *phy;
 	int r;
 
-	dev_dbg(&client->dev, "client %p\n", client);
-
 	phy = devm_kzalloc(&client->dev, sizeof(struct microread_i2c_phy),
 			   GFP_KERNEL);
 	if (!phy)
@@ -262,8 +260,6 @@ static int microread_i2c_probe(struct i2c_client *client,
 	if (r < 0)
 		goto err_irq;
 
-	nfc_info(&client->dev, "Probed\n");
-
 	return 0;
 
 err_irq:
diff --git a/drivers/nfc/microread/mei.c b/drivers/nfc/microread/mei.c
index 8edf761a6b2a..686be3381727 100644
--- a/drivers/nfc/microread/mei.c
+++ b/drivers/nfc/microread/mei.c
@@ -23,8 +23,6 @@ static int microread_mei_probe(struct mei_cl_device *cldev,
 	struct nfc_mei_phy *phy;
 	int r;
 
-	pr_info("Probing NFC microread\n");
-
 	phy = nfc_mei_phy_alloc(cldev);
 	if (!phy) {
 		pr_err("Cannot allocate memory for microread mei phy.\n");
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
