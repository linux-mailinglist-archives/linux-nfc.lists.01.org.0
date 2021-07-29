Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C14553DA166
	for <lists+linux-nfc@lfdr.de>; Thu, 29 Jul 2021 12:42:52 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 6C7AB100EBB6A;
	Thu, 29 Jul 2021 03:42:51 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id BA044100EBBBB
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:42:49 -0700 (PDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 9C9213F231
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 10:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627555368;
	bh=1aqWonZ1UVeYrgP40WWguDTIwwMWBTXMW2a73Xqk2/I=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=fTaOL6yTA1N+j0b4PUpgzWYos85Rpw0HlW0/TgjfeqewNixyjGNfObfDbsVVve1bV
	 yydbMj9K5Ccic8BYEPXdTA4fkQWUWx7oJkgK/ZE65F4lEb/LuC3WVjJmC1AffOmwA1
	 sGu1k8b6HYE9IzZyrbjGgGc+UubqOQ2+eXU6evx/KPw39ESOd7+97h8+GRCB06Mrl7
	 +igO0k3WafwE2vQOrr3evhhnc/jFz2vKZ4rOP/1zt5kbkapY8/rZSQ3V7pAeoLDpbz
	 Wz7HRQtEPwtjuNJStAMXPRCC/E2OFNve8/u1A5YWbdQJm8IQeyp/KlLsZmT8d9XkZS
	 vHHNwVaZWX8vA==
Received: by mail-ed1-f69.google.com with SMTP id n24-20020aa7c7980000b02903bb4e1d45aaso2727109eds.15
        for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1aqWonZ1UVeYrgP40WWguDTIwwMWBTXMW2a73Xqk2/I=;
        b=fzES7X8kT+MszoE6ko35ItjYaUYGtikryspQImQFRAnmrjXjRwSwDXgT3ES7wEESxF
         FBButZ6QEj2qptZkuWJzAf4C3MN3oeDU2Xi2wsUwAkg9jN/d6rvTzBd+W+lY+gj7lOXq
         3PO8JgaHL/aUsY1dB6dNCeZ2QyfWGPFPxqgQIbke1+zOJ3v3tr2v5D+VDA/fdsKrIb/A
         RFvIzbQ3XLscJ2SnJKxPgINkWuh41QxlYRt4YcLfGecV+pxsncQImkESINX0XjdauvGf
         8c+3c2rVkqfvNTMxrJJSC/wMtBdRIkmlokCkZhxMAvC45kKlZQdBlwSj5yWnXiT4iyuj
         C31Q==
X-Gm-Message-State: AOAM530AM5LiI7yXr+tyyCUF/OF9ZictXrtJHutnRU2fArnR2Cowv5Y2
	oz0zfqUkWhbaYrPEhWbnqXIOW6ami5P6WOjc04ORM0CCZmBcd7SSZU+1TzyVcj75Taf6E869dXJ
	5mXhJOaafMrccVWp38sD7ZxoSMLsSo8RhEA==
X-Received: by 2002:a17:907:1b02:: with SMTP id mp2mr4104321ejc.196.1627555368311;
        Thu, 29 Jul 2021 03:42:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7aV8dzqZZfnsgycbu2nLiwhd9HngRE7rGbZygUqpYd4zH2xG3lNFXnZlVjoxsJ3E/BKLvUA==
X-Received: by 2002:a17:907:1b02:: with SMTP id mp2mr4104308ejc.196.1627555368118;
        Thu, 29 Jul 2021 03:42:48 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id e7sm1048472edk.3.2021.07.29.03.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 03:42:47 -0700 (PDT)
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
Date: Thu, 29 Jul 2021 12:42:41 +0200
Message-Id: <20210729104241.48086-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
References: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: U557XZYCESI55R6FW3Q3FGME36J55EHY
X-Message-ID-Hash: U557XZYCESI55R6FW3Q3FGME36J55EHY
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 12/12] nfc: mrvl: constify static nfcmrvl_if_ops
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/U557XZYCESI55R6FW3Q3FGME36J55EHY/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

File-scope struct nfcmrvl_if_ops is not modified so can be made const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/nfcmrvl/i2c.c     | 2 +-
 drivers/nfc/nfcmrvl/main.c    | 2 +-
 drivers/nfc/nfcmrvl/nfcmrvl.h | 4 ++--
 drivers/nfc/nfcmrvl/spi.c     | 2 +-
 drivers/nfc/nfcmrvl/uart.c    | 2 +-
 drivers/nfc/nfcmrvl/usb.c     | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/i2c.c b/drivers/nfc/nfcmrvl/i2c.c
index 6e659e77c8a2..c38b228006fd 100644
--- a/drivers/nfc/nfcmrvl/i2c.c
+++ b/drivers/nfc/nfcmrvl/i2c.c
@@ -146,7 +146,7 @@ static void nfcmrvl_i2c_nci_update_config(struct nfcmrvl_private *priv,
 {
 }
 
-static struct nfcmrvl_if_ops i2c_ops = {
+static const struct nfcmrvl_if_ops i2c_ops = {
 	.nci_open = nfcmrvl_i2c_nci_open,
 	.nci_close = nfcmrvl_i2c_nci_close,
 	.nci_send = nfcmrvl_i2c_nci_send,
diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
index d8e48bdaf652..2fcf545012b1 100644
--- a/drivers/nfc/nfcmrvl/main.c
+++ b/drivers/nfc/nfcmrvl/main.c
@@ -91,7 +91,7 @@ static const struct nci_ops nfcmrvl_nci_ops = {
 
 struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
 				void *drv_data,
-				struct nfcmrvl_if_ops *ops,
+				const struct nfcmrvl_if_ops *ops,
 				struct device *dev,
 				const struct nfcmrvl_platform_data *pdata)
 {
diff --git a/drivers/nfc/nfcmrvl/nfcmrvl.h b/drivers/nfc/nfcmrvl/nfcmrvl.h
index 84fafa95965e..165bd0a95190 100644
--- a/drivers/nfc/nfcmrvl/nfcmrvl.h
+++ b/drivers/nfc/nfcmrvl/nfcmrvl.h
@@ -77,7 +77,7 @@ struct nfcmrvl_private {
 	/* PHY type */
 	enum nfcmrvl_phy phy;
 	/* Low level driver ops */
-	struct nfcmrvl_if_ops *if_ops;
+	const struct nfcmrvl_if_ops *if_ops;
 };
 
 struct nfcmrvl_if_ops {
@@ -92,7 +92,7 @@ void nfcmrvl_nci_unregister_dev(struct nfcmrvl_private *priv);
 int nfcmrvl_nci_recv_frame(struct nfcmrvl_private *priv, struct sk_buff *skb);
 struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
 				void *drv_data,
-				struct nfcmrvl_if_ops *ops,
+				const struct nfcmrvl_if_ops *ops,
 				struct device *dev,
 				const struct nfcmrvl_platform_data *pdata);
 
diff --git a/drivers/nfc/nfcmrvl/spi.c b/drivers/nfc/nfcmrvl/spi.c
index 7b015bb33fc9..d64abd0c4df3 100644
--- a/drivers/nfc/nfcmrvl/spi.c
+++ b/drivers/nfc/nfcmrvl/spi.c
@@ -99,7 +99,7 @@ static void nfcmrvl_spi_nci_update_config(struct nfcmrvl_private *priv,
 	drv_data->nci_spi->xfer_speed_hz = config->clk;
 }
 
-static struct nfcmrvl_if_ops spi_ops = {
+static const struct nfcmrvl_if_ops spi_ops = {
 	.nci_open = nfcmrvl_spi_nci_open,
 	.nci_close = nfcmrvl_spi_nci_close,
 	.nci_send = nfcmrvl_spi_nci_send,
diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index 63ac434675c8..9c92cbdc42f0 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -49,7 +49,7 @@ static void nfcmrvl_uart_nci_update_config(struct nfcmrvl_private *priv,
 			    config->flow_control);
 }
 
-static struct nfcmrvl_if_ops uart_ops = {
+static const struct nfcmrvl_if_ops uart_ops = {
 	.nci_open = nfcmrvl_uart_nci_open,
 	.nci_close = nfcmrvl_uart_nci_close,
 	.nci_send = nfcmrvl_uart_nci_send,
diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
index 9d649b45300b..a99aedff795d 100644
--- a/drivers/nfc/nfcmrvl/usb.c
+++ b/drivers/nfc/nfcmrvl/usb.c
@@ -264,7 +264,7 @@ static int nfcmrvl_usb_nci_send(struct nfcmrvl_private *priv,
 	return err;
 }
 
-static struct nfcmrvl_if_ops usb_ops = {
+static const struct nfcmrvl_if_ops usb_ops = {
 	.nci_open = nfcmrvl_usb_nci_open,
 	.nci_close = nfcmrvl_usb_nci_close,
 	.nci_send = nfcmrvl_usb_nci_send,
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
