Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3B0408CD8
	for <lists+linux-nfc@lfdr.de>; Mon, 13 Sep 2021 15:20:57 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 0E16C100EB82A;
	Mon, 13 Sep 2021 06:20:55 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 8D431100EBB75
	for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 06:20:51 -0700 (PDT)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 497793F30E
	for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 13:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631539250;
	bh=Fky4BN6I50Xw0PgUAedFiL1xcmFxZZIBVgJL+3QtpWs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=LDLkqs8XWdJPlHwSTXyxBqQgS9MUADcFkE2jeuQ1h1KLFFQr12xXbs0/xRC364wcl
	 sPciEhQIlfWS5UBUJ7ZaX0nxjDSekxJpqo03sLPA34Z9h5iqSShgjabo/B1nr7tAf2
	 9tMo6cIGW4/p+dywCEinGyvGkCgpmbLYQDgHPyNOxOHNdKcHc2+6i19KA8Vbv8vo1C
	 +H5SPzBhLdqVmvoa8OeThfp23B2pNz9oBEsZDxamVfUmeod6v0rakq0ugxbr69xQPh
	 mB43Yedahb3jr57kc96lcNW2j9sLMFGpfBPmOsbBg1nnrEIjdvgI5cGDRWjN8sL9Ev
	 N7Yq8xekTvcng==
Received: by mail-wr1-f70.google.com with SMTP id z2-20020a5d4c82000000b0015b140e0562so2675085wrs.7
        for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 06:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fky4BN6I50Xw0PgUAedFiL1xcmFxZZIBVgJL+3QtpWs=;
        b=Jq5ps1WWLW9o65S8gSpxcr4AX2xbM/g7GYbfQbtkCdkxA+JEg5tawUh7SKQKIMLajR
         VZOT3J5TAIeEtTEofCLjgng7V3bqMzNOgvoXW4b0zpKi2eEBSwwM4bklgBkmffgeFBqI
         nANJmB+Gp5wkrKL2OQGmxgIVTAm2BdYQ/D2qsEZiudnIHdt6dCPWtKSxJvqGnjyAHDCf
         bW/r63wHsisWm8Gifj/8Zn5ArWQkXMwpUSsa34cZI+O1s9HP8K50VTtnGsattgwkm3Wn
         jGRoWpwYaeqz9oV4xH3InxuDmPYfpISxOh5DbbjG3U/lW/SrMEJwgr9qhGhuEh9fXPJ5
         v3Vw==
X-Gm-Message-State: AOAM531uBgJknpiAGWIxWmPF4FhYG8quKPydXwM3v+snUtkjwKThq0cq
	xIjMcq30J7+qCB/Sd9UQ8xKFSv2gWxWl868M1Q78MeiOV0baJRRk7cKsrbV7GWu5JamRuTodtb6
	NbtRPgK7g3+64ALYCHJKA7OlCvm6cVBJxmw==
X-Received: by 2002:adf:8064:: with SMTP id 91mr12357525wrk.252.1631539249989;
        Mon, 13 Sep 2021 06:20:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5+h/fKlKQdXDMhGSM5nR9XBZObuvBHmrufg69rir3eN+eLiOg4WceN/MxX2SmmovwgHEcrQ==
X-Received: by 2002:adf:8064:: with SMTP id 91mr12357504wrk.252.1631539249872;
        Mon, 13 Sep 2021 06:20:49 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id n3sm7195888wmi.0.2021.09.13.06.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:20:49 -0700 (PDT)
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
Date: Mon, 13 Sep 2021 15:20:25 +0200
Message-Id: <20210913132035.242870-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
References: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: C3N3ZHUD5JIGDJ4HVKZNIP4VMI7SVODL
X-Message-ID-Hash: C3N3ZHUD5JIGDJ4HVKZNIP4VMI7SVODL
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 05/15] nfc: pn533: drop unneeded debug prints
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/C3N3ZHUD5JIGDJ4HVKZNIP4VMI7SVODL/>
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
 drivers/nfc/pn533/i2c.c   | 4 ----
 drivers/nfc/pn533/pn533.c | 2 --
 2 files changed, 6 deletions(-)

diff --git a/drivers/nfc/pn533/i2c.c b/drivers/nfc/pn533/i2c.c
index e6bf8cfe3aa7..f5610b6b9894 100644
--- a/drivers/nfc/pn533/i2c.c
+++ b/drivers/nfc/pn533/i2c.c
@@ -128,7 +128,6 @@ static int pn533_i2c_read(struct pn533_i2c_phy *phy, struct sk_buff **skb)
 static irqreturn_t pn533_i2c_irq_thread_fn(int irq, void *data)
 {
 	struct pn533_i2c_phy *phy = data;
-	struct i2c_client *client;
 	struct sk_buff *skb = NULL;
 	int r;
 
@@ -137,9 +136,6 @@ static irqreturn_t pn533_i2c_irq_thread_fn(int irq, void *data)
 		return IRQ_NONE;
 	}
 
-	client = phy->i2c_dev;
-	dev_dbg(&client->dev, "IRQ\n");
-
 	if (phy->hard_fault != 0)
 		return IRQ_HANDLED;
 
diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index 2f3f3fe9a0ba..c5f127fe2d45 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -1235,8 +1235,6 @@ static void pn533_listen_mode_timer(struct timer_list *t)
 {
 	struct pn533 *dev = from_timer(dev, t, listen_timer);
 
-	dev_dbg(dev->dev, "Listen mode timeout\n");
-
 	dev->cancel_listen = 1;
 
 	pn533_poll_next_mod(dev);
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
