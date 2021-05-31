Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E4C39563D
	for <lists+linux-nfc@lfdr.de>; Mon, 31 May 2021 09:35:47 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 8015D100ED48C;
	Mon, 31 May 2021 00:35:45 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 2FF33100EF267
	for <linux-nfc@lists.01.org>; Mon, 31 May 2021 00:35:43 -0700 (PDT)
Received: from mail-lj1-f200.google.com ([209.85.208.200])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lncSb-0002kL-TX
	for linux-nfc@lists.01.org; Mon, 31 May 2021 07:35:41 +0000
Received: by mail-lj1-f200.google.com with SMTP id j2-20020a2e6e020000b02900f2f75a122aso3111767ljc.19
        for <linux-nfc@lists.01.org>; Mon, 31 May 2021 00:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aZ/yEEfClIlXQJ5jqul7RvuQr6Fao3s7oVlySYMna4M=;
        b=KJdyTLO4LWeXUzoqcyDaUSmQ4KVF14vYvWx9r8cM/QgJbbunp3vJVk/imGL8/sOzly
         Z1fRybHhEGJ/FLBjz3XM9JcHWWcXvC0abyhG/xX1HCZwomKbLMK3YrZufvmT8pFLFBVL
         b+MeQy5o4rWud51haT4xJlSk7blzA1KCWndTe8ugy8jRKfD2Ys0kwZXgSrVB7+j+GCxJ
         /O5R5Epcd0T3h+knk6QhkXmdJEfJhBnj1W6Y5OJRKyiHO8mNjocHrfIfjAKydMpvp9/C
         +0qTuFTo3xJLBugiPLV2fV+o4Zo8QY+QqyKY96BJjjmODk5w5oB6kNLKPaXnTV8R3Ast
         w7bg==
X-Gm-Message-State: AOAM531HRy6Ob90+CHFPewFqsImSjPbS9xkt7BP1knUgLk4RrJWEbN2h
	wzcuJsUlJEyE0A9fMSmPUQXVPbzcALq9DEBpA3ZYsoif3PvaGW3mbStj8WKjdg0fmhjb93OwXZV
	AgNRtlqEaKTOGeWZcXUMphgQh08bW/HH5yQ==
X-Received: by 2002:a2e:9c05:: with SMTP id s5mr15325079lji.208.1622446541195;
        Mon, 31 May 2021 00:35:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+Tjd38dgYDCjWZAbxLIql+xzbe6YJpMcx4uGiK1i65n63byVeYJmdFScIYhnsVbjRxpSXzw==
X-Received: by 2002:adf:8bc9:: with SMTP id w9mr19323503wra.378.1622446530398;
        Mon, 31 May 2021 00:35:30 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id g10sm17217780wrq.12.2021.05.31.00.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 00:35:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Mon, 31 May 2021 09:35:13 +0200
Message-Id: <20210531073522.6720-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210531073522.6720-1-krzysztof.kozlowski@canonical.com>
References: <20210531073522.6720-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: P6VU654SGMRHQW3TDQKAEYYTOV24KHUM
X-Message-ID-Hash: P6VU654SGMRHQW3TDQKAEYYTOV24KHUM
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [RESEND PATCH 02/11] nfc: mei_phy: drop ftrace-like debugging messages
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/P6VU654SGMRHQW3TDQKAEYYTOV24KHUM/>
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
 drivers/nfc/mei_phy.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/nfc/mei_phy.c b/drivers/nfc/mei_phy.c
index 0f43bb389566..e56cea716cd2 100644
--- a/drivers/nfc/mei_phy.c
+++ b/drivers/nfc/mei_phy.c
@@ -98,8 +98,6 @@ static int mei_nfc_if_version(struct nfc_mei_phy *phy)
 	size_t if_version_length;
 	int bytes_recv, r;
 
-	pr_info("%s\n", __func__);
-
 	memset(&cmd, 0, sizeof(struct mei_nfc_cmd));
 	cmd.hdr.cmd = MEI_NFC_CMD_MAINTENANCE;
 	cmd.hdr.data_size = 1;
@@ -146,8 +144,6 @@ static int mei_nfc_connect(struct nfc_mei_phy *phy)
 	size_t connect_length, connect_resp_length;
 	int bytes_recv, r;
 
-	pr_info("%s\n", __func__);
-
 	connect_length = sizeof(struct mei_nfc_cmd) +
 			sizeof(struct mei_nfc_connect);
 
@@ -320,8 +316,6 @@ static int nfc_mei_phy_enable(void *phy_id)
 	int r;
 	struct nfc_mei_phy *phy = phy_id;
 
-	pr_info("%s\n", __func__);
-
 	if (phy->powered == 1)
 		return 0;
 
@@ -363,8 +357,6 @@ static void nfc_mei_phy_disable(void *phy_id)
 {
 	struct nfc_mei_phy *phy = phy_id;
 
-	pr_info("%s\n", __func__);
-
 	mei_cldev_disable(phy->cldev);
 
 	phy->powered = 0;
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
