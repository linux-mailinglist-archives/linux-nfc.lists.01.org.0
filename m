Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F723DA146
	for <lists+linux-nfc@lfdr.de>; Thu, 29 Jul 2021 12:40:55 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id DB11A100EB82B;
	Thu, 29 Jul 2021 03:40:52 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id D82D7100EBBBB
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:40:50 -0700 (PDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id AC7E53F235
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 10:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627555249;
	bh=6LhaqEyE6YM7qc+DvvBC/izK9f7my9CENZwOkswScoM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=pCYFcLJxKT89TDwTk0M8wOK5c1x26ozPyWOD6ZU25R6PpydbnVjOHI7Y0WRqyi2gp
	 QkoZMvNN6kXZf1+MKk1z8kSeN5qZ5UfDq2Cbn2yw/ahNiUV3ZuV8NPkUeBDS75S1Xo
	 KXRTsx6YkPBE1gQ5HpATaOptgOGNgYn6v7W+QbHO6qplXXqJceHBUfwyyRfyiwltH8
	 uoKC5DGL7izx9dh17V9FKnH2Q2foaSQxkZ/4Vu/tujJpvPgkUA6Rdqwu6KgQ7IPgL5
	 nGcg5Po0pCuHnp82haOExEamXWwFXONQQ7cbdhKjAvgyCn1jiq0GuQ9iEcT73a9+Ng
	 6Z+Y/SztD1wwA==
Received: by mail-ed1-f71.google.com with SMTP id ay20-20020a0564022034b02903bc515b673dso2749242edb.3
        for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6LhaqEyE6YM7qc+DvvBC/izK9f7my9CENZwOkswScoM=;
        b=LQtxh7/A/O6bG/6Zc2wLCCgRHGga6p+1SpTWJUjUGQIHfeDoqL3KRTRjpjBXhwxFqS
         HLlXuzze87HEbAVUKx+FaQUZXv+SEp5Fwv4YEpFQkq0wNubOKek1V3f7SXkNF7ivbXW6
         hkN0QnMTi+K4zb5OBY7ADcG03WbrUXtzUJo+CnVWOo8GJ8NP7Kl8LH0ixkX52EYGWN+H
         gET5+PRSzypRFXZA3USBEiH5uMaMXxjRxMqnAvK63v4gNVAfdM7zwNEc4iH8Q0hNgtPg
         bdJN6VYo5Bae89yinFSGQIspeflr4WD6BNDPyIm3J6S1La2IvrZvy+/cEpToXkWCX9i7
         15BA==
X-Gm-Message-State: AOAM531dS/skyWK+dhMqbqdFeqW4x6my5IUmyhrv0ZdkGNclLDJweKtM
	6DHhghO5+aaCWdGmh2pdmx5vAZa17yS2XwcyaO1Zxv0sTJ2+OFsOgSmDpqOrqNTwz3wu7M81CJT
	eB3HS+/CEU7kNxKNbm0HrWDa2490NS4kKjQ==
X-Received: by 2002:a05:6402:d2:: with SMTP id i18mr5264566edu.17.1627555247739;
        Thu, 29 Jul 2021 03:40:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyU2Ka89Z3Qjr8Tzvk3IIGX+JEzwdx0FNyuEdwHjyphht6T2bpxMENgCaQjv8QxWPsttQOLJw==
X-Received: by 2002:a05:6402:d2:: with SMTP id i18mr5264543edu.17.1627555247595;
        Thu, 29 Jul 2021 03:40:47 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id c14sm824475ejb.78.2021.07.29.03.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 03:40:46 -0700 (PDT)
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
Date: Thu, 29 Jul 2021 12:40:21 +0200
Message-Id: <20210729104022.47761-12-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
References: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: WNAQD4FRLNRXWLNLVPSLBHFGT4VRJZYV
X-Message-ID-Hash: WNAQD4FRLNRXWLNLVPSLBHFGT4VRJZYV
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 11/12] nfc: mrvl: constify several pointers
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/WNAQD4FRLNRXWLNLVPSLBHFGT4VRJZYV/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Several functions do not modify pointed data so arguments and local
variables can be const for correctness and safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/nfcmrvl/fw_dnld.c | 16 +++++++++-------
 drivers/nfc/nfcmrvl/i2c.c     |  2 +-
 drivers/nfc/nfcmrvl/main.c    |  2 +-
 drivers/nfc/nfcmrvl/nfcmrvl.h |  2 +-
 drivers/nfc/nfcmrvl/spi.c     |  4 ++--
 drivers/nfc/nfcmrvl/uart.c    |  2 +-
 6 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/fw_dnld.c b/drivers/nfc/nfcmrvl/fw_dnld.c
index aaccb8b76b3e..edac56b01fd1 100644
--- a/drivers/nfc/nfcmrvl/fw_dnld.c
+++ b/drivers/nfc/nfcmrvl/fw_dnld.c
@@ -129,7 +129,7 @@ static void fw_dnld_timeout(struct timer_list *t)
 }
 
 static int process_state_reset(struct nfcmrvl_private *priv,
-			       struct sk_buff *skb)
+			       const struct sk_buff *skb)
 {
 	if (sizeof(nci_pattern_core_reset_ntf) != skb->len ||
 	    memcmp(skb->data, nci_pattern_core_reset_ntf,
@@ -145,7 +145,8 @@ static int process_state_reset(struct nfcmrvl_private *priv,
 	return 0;
 }
 
-static int process_state_init(struct nfcmrvl_private *priv, struct sk_buff *skb)
+static int process_state_init(struct nfcmrvl_private *priv,
+			      const struct sk_buff *skb)
 {
 	struct nci_core_set_config_cmd cmd;
 
@@ -175,7 +176,7 @@ static void create_lc(struct nfcmrvl_private *priv)
 }
 
 static int process_state_set_ref_clock(struct nfcmrvl_private *priv,
-				       struct sk_buff *skb)
+				       const struct sk_buff *skb)
 {
 	struct nci_core_set_config_cmd cmd;
 
@@ -221,7 +222,7 @@ static int process_state_set_ref_clock(struct nfcmrvl_private *priv,
 }
 
 static int process_state_set_hi_config(struct nfcmrvl_private *priv,
-				       struct sk_buff *skb)
+				       const struct sk_buff *skb)
 {
 	if (sizeof(nci_pattern_core_set_config_rsp) != skb->len ||
 	    memcmp(skb->data, nci_pattern_core_set_config_rsp, skb->len))
@@ -232,7 +233,7 @@ static int process_state_set_hi_config(struct nfcmrvl_private *priv,
 }
 
 static int process_state_open_lc(struct nfcmrvl_private *priv,
-				 struct sk_buff *skb)
+				 const struct sk_buff *skb)
 {
 	if (sizeof(nci_pattern_core_conn_create_rsp) >= skb->len ||
 	    memcmp(skb->data, nci_pattern_core_conn_create_rsp,
@@ -347,7 +348,7 @@ static int process_state_fw_dnld(struct nfcmrvl_private *priv,
 }
 
 static int process_state_close_lc(struct nfcmrvl_private *priv,
-				  struct sk_buff *skb)
+				  const struct sk_buff *skb)
 {
 	if (sizeof(nci_pattern_core_conn_close_rsp) != skb->len ||
 	    memcmp(skb->data, nci_pattern_core_conn_close_rsp, skb->len))
@@ -358,7 +359,8 @@ static int process_state_close_lc(struct nfcmrvl_private *priv,
 	return 0;
 }
 
-static int process_state_boot(struct nfcmrvl_private *priv, struct sk_buff *skb)
+static int process_state_boot(struct nfcmrvl_private *priv,
+			      const struct sk_buff *skb)
 {
 	if (sizeof(nci_pattern_proprietary_boot_rsp) != skb->len ||
 	    memcmp(skb->data, nci_pattern_proprietary_boot_rsp, skb->len))
diff --git a/drivers/nfc/nfcmrvl/i2c.c b/drivers/nfc/nfcmrvl/i2c.c
index 59a529e72d96..6e659e77c8a2 100644
--- a/drivers/nfc/nfcmrvl/i2c.c
+++ b/drivers/nfc/nfcmrvl/i2c.c
@@ -182,8 +182,8 @@ static int nfcmrvl_i2c_parse_dt(struct device_node *node,
 static int nfcmrvl_i2c_probe(struct i2c_client *client,
 			     const struct i2c_device_id *id)
 {
+	const struct nfcmrvl_platform_data *pdata;
 	struct nfcmrvl_i2c_drv_data *drv_data;
-	struct nfcmrvl_platform_data *pdata;
 	struct nfcmrvl_platform_data config;
 	int ret;
 
diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
index 6e9e7ce8792c..d8e48bdaf652 100644
--- a/drivers/nfc/nfcmrvl/main.c
+++ b/drivers/nfc/nfcmrvl/main.c
@@ -93,7 +93,7 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
 				void *drv_data,
 				struct nfcmrvl_if_ops *ops,
 				struct device *dev,
-				struct nfcmrvl_platform_data *pdata)
+				const struct nfcmrvl_platform_data *pdata)
 {
 	struct nfcmrvl_private *priv;
 	int rc;
diff --git a/drivers/nfc/nfcmrvl/nfcmrvl.h b/drivers/nfc/nfcmrvl/nfcmrvl.h
index a715543bc9bf..84fafa95965e 100644
--- a/drivers/nfc/nfcmrvl/nfcmrvl.h
+++ b/drivers/nfc/nfcmrvl/nfcmrvl.h
@@ -94,7 +94,7 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
 				void *drv_data,
 				struct nfcmrvl_if_ops *ops,
 				struct device *dev,
-				struct nfcmrvl_platform_data *pdata);
+				const struct nfcmrvl_platform_data *pdata);
 
 
 void nfcmrvl_chip_reset(struct nfcmrvl_private *priv);
diff --git a/drivers/nfc/nfcmrvl/spi.c b/drivers/nfc/nfcmrvl/spi.c
index 66696321c645..7b015bb33fc9 100644
--- a/drivers/nfc/nfcmrvl/spi.c
+++ b/drivers/nfc/nfcmrvl/spi.c
@@ -106,7 +106,7 @@ static struct nfcmrvl_if_ops spi_ops = {
 	.nci_update_config = nfcmrvl_spi_nci_update_config,
 };
 
-static int nfcmrvl_spi_parse_dt(struct device_node *node,
+static int nfcmrvl_spi_parse_dt(const struct device_node *node,
 				struct nfcmrvl_platform_data *pdata)
 {
 	int ret;
@@ -129,7 +129,7 @@ static int nfcmrvl_spi_parse_dt(struct device_node *node,
 
 static int nfcmrvl_spi_probe(struct spi_device *spi)
 {
-	struct nfcmrvl_platform_data *pdata;
+	const struct nfcmrvl_platform_data *pdata;
 	struct nfcmrvl_platform_data config;
 	struct nfcmrvl_spi_drv_data *drv_data;
 	int ret = 0;
diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index 50d86c90b9dd..63ac434675c8 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -98,8 +98,8 @@ static int nfcmrvl_uart_parse_dt(struct device_node *node,
 static int nfcmrvl_nci_uart_open(struct nci_uart *nu)
 {
 	struct nfcmrvl_private *priv;
-	struct nfcmrvl_platform_data *pdata = NULL;
 	struct nfcmrvl_platform_data config;
+	const struct nfcmrvl_platform_data *pdata = NULL;
 	struct device *dev = nu->tty->dev;
 
 	/*
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
