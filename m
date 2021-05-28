Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE74039448A
	for <lists+linux-nfc@lfdr.de>; Fri, 28 May 2021 16:54:27 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 8D4FB100EC1CC;
	Fri, 28 May 2021 07:54:26 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id C17A1100ED4AB
	for <linux-nfc@lists.01.org>; Fri, 28 May 2021 07:54:24 -0700 (PDT)
Received: from mail-ua1-f70.google.com ([209.85.222.70])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lmdsV-00040V-ED
	for linux-nfc@lists.01.org; Fri, 28 May 2021 14:54:23 +0000
Received: by mail-ua1-f70.google.com with SMTP id 5-20020ab004850000b029022e612041f6so2025098uaw.9
        for <linux-nfc@lists.01.org>; Fri, 28 May 2021 07:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aZ/yEEfClIlXQJ5jqul7RvuQr6Fao3s7oVlySYMna4M=;
        b=TrS7UALs1LbkWuDN6der2revkZax6g6gjnEK0c5wjnXJPizyCY4gODDcrBBId8zjH6
         ktcMCNOvq/p+VOOFHfJnvGgjSNowmSUSjKyb4uudBZvikxxBWmiO+ZgWWgYERfIdraPJ
         muc4kVwYbF4u0SGqIVLdzcOFroSAHHeMcWr9UIO2rzoyNDKIJhDACMybVqL7q85lllgN
         4VSP6l9ZnHq3p3cH9n2mO/Ssmd+py4XFDhw2CD6XrmuxjSSm3GYpk4IVSz2p9pSZlTY9
         rfYwP7WrZmUB4P8Zvr2wUcrzTi8M+PGdK/DJ6DWimKOrJfeAEv69WdtEHW66ed1Dqt3U
         7ToQ==
X-Gm-Message-State: AOAM530Yqf8FjIO3C/P45MdzTPFHh7MJVQUGIGMWu5uSjNDkQvHAXy1d
	PKUxctL6Bflw7LhWWSV/uLD7MR/GqXIz0cyprkX9iOdldSJR/uPW8HjlHtd9fTCHbjL2McCW54L
	ryoMfEFPZ/+y5iAwzD8301WjmcJlLO3paSA==
X-Received: by 2002:a05:6102:10d1:: with SMTP id t17mr7796939vsr.0.1622213662208;
        Fri, 28 May 2021 07:54:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkdAq4gRZn+/xWVZNC69A9lFxo0CNOXTTIt/ja4jcZ0FIGsH/Icj4ZQcpxEoounbYrk5FFZg==
X-Received: by 2002:a05:6102:10d1:: with SMTP id t17mr7796916vsr.0.1622213661990;
        Fri, 28 May 2021 07:54:21 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id v132sm737783vkd.1.2021.05.28.07.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 07:54:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 28 May 2021 10:53:21 -0400
Message-Id: <20210528145330.125055-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210528145330.125055-1-krzysztof.kozlowski@canonical.com>
References: <20210528145330.125055-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: JDATGCPRLG42OC6X44MU3GX6A444YEVO
X-Message-ID-Hash: JDATGCPRLG42OC6X44MU3GX6A444YEVO
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 02/11] nfc: mei_phy: drop ftrace-like debugging messages
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/JDATGCPRLG42OC6X44MU3GX6A444YEVO/>
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
