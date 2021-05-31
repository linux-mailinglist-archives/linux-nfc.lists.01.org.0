Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 809F8395639
	for <lists+linux-nfc@lfdr.de>; Mon, 31 May 2021 09:35:36 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4B8BA100EC1DA;
	Mon, 31 May 2021 00:35:35 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 6119C100EC1D7
	for <linux-nfc@lists.01.org>; Mon, 31 May 2021 00:35:33 -0700 (PDT)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lncSS-0002hj-1s
	for linux-nfc@lists.01.org; Mon, 31 May 2021 07:35:32 +0000
Received: by mail-wr1-f69.google.com with SMTP id f22-20020a5d58f60000b029011634e39889so475638wrd.7
        for <linux-nfc@lists.01.org>; Mon, 31 May 2021 00:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I8v9v1iXBx2jm0a7G/yvgftchrd3//zSZLWiRRhEhPU=;
        b=dpFxwILrAnYPBM6zh3p623ItP1ze0gUlghZq69SRzFuyfhuJGvgdu7vEWg1GdIx0sg
         wgCZL3g/s9oYY3Bdp1F6HgZycaLq5bcIfcRWqYtODH4QRvn5dKmysynK7IOGq/iXFXL0
         dMEHU3NGhQucVuewW1R1yWU/kPCw+5WHWH5Iwpc1EsiTEtv1UPNSleH65yF6S2Qoo4eE
         6g9W4UJrxkHc25gKK9AIL3536hxA/TDPb3oNpmfAyrYhlSWBJhO52qRNr6XJWykzujgC
         +Jm8ddeKRgJwjPkXJBWUodAWDE0oz/mSMGJh8frRe08Wf8YqG+haUNvunNSPqCX9ti2d
         ZIhw==
X-Gm-Message-State: AOAM5324VNsGJKgvgZijEVBXtdw2+zK3P/2EkdZY6SkTa9AtHCzxqpL8
	U868YOQOjztagM006GJ0YqkaeBm1co70GwjtMVpMgoxAkLOTGC34C2CtA1bUil0zf9h01U8fSPW
	T6pcJk5TNYs93r40j60K04c9fXY5IStMD1A==
X-Received: by 2002:a5d:638b:: with SMTP id p11mr20588808wru.90.1622446531826;
        Mon, 31 May 2021 00:35:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyN8l014nNSn/nR7ANz8+qDfBqJHPKgzAKmFbf7KYei5XSqunWARV9KN/pEJy19j+LeR5n4+w==
X-Received: by 2002:a5d:638b:: with SMTP id p11mr20588793wru.90.1622446531657;
        Mon, 31 May 2021 00:35:31 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id g10sm17217780wrq.12.2021.05.31.00.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 00:35:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Mon, 31 May 2021 09:35:15 +0200
Message-Id: <20210531073522.6720-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210531073522.6720-1-krzysztof.kozlowski@canonical.com>
References: <20210531073522.6720-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: YVVYAR2MXS3LD5545OFJYIBW7VL3PCYC
X-Message-ID-Hash: YVVYAR2MXS3LD5545OFJYIBW7VL3PCYC
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [RESEND PATCH 04/11] nfc: mrvl: correct minor coding style violations
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/YVVYAR2MXS3LD5545OFJYIBW7VL3PCYC/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Correct block comments and usage of tab in function definition.  No
functional change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/nfcmrvl/fw_dnld.c | 10 +++++-----
 drivers/nfc/nfcmrvl/nfcmrvl.h | 12 ++++++------
 drivers/nfc/nfcmrvl/uart.c    | 16 ++++++++--------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/fw_dnld.c b/drivers/nfc/nfcmrvl/fw_dnld.c
index 05df7ad224d5..c84658448415 100644
--- a/drivers/nfc/nfcmrvl/fw_dnld.c
+++ b/drivers/nfc/nfcmrvl/fw_dnld.c
@@ -39,8 +39,8 @@ enum {
 };
 
 /*
-** Patterns for responses
-*/
+ * Patterns for responses
+ */
 
 static const uint8_t nci_pattern_core_reset_ntf[] = {
 	0x60, 0x00, 0x02, 0xA0, 0x01
@@ -440,7 +440,7 @@ static void fw_dnld_rx_work(struct work_struct *work)
 	}
 }
 
-int	nfcmrvl_fw_dnld_init(struct nfcmrvl_private *priv)
+int nfcmrvl_fw_dnld_init(struct nfcmrvl_private *priv)
 {
 	char name[32];
 
@@ -454,12 +454,12 @@ int	nfcmrvl_fw_dnld_init(struct nfcmrvl_private *priv)
 	return 0;
 }
 
-void	nfcmrvl_fw_dnld_deinit(struct nfcmrvl_private *priv)
+void nfcmrvl_fw_dnld_deinit(struct nfcmrvl_private *priv)
 {
 	destroy_workqueue(priv->fw_dnld.rx_wq);
 }
 
-void	nfcmrvl_fw_dnld_recv_frame(struct nfcmrvl_private *priv,
+void nfcmrvl_fw_dnld_recv_frame(struct nfcmrvl_private *priv,
 				   struct sk_buff *skb)
 {
 	/* Discard command timer */
diff --git a/drivers/nfc/nfcmrvl/nfcmrvl.h b/drivers/nfc/nfcmrvl/nfcmrvl.h
index 0b4220bb91bc..a715543bc9bf 100644
--- a/drivers/nfc/nfcmrvl/nfcmrvl.h
+++ b/drivers/nfc/nfcmrvl/nfcmrvl.h
@@ -25,16 +25,16 @@
 #define NFCMRVL_NCI_MAX_EVENT_SIZE		260
 
 /*
-** NCI FW Parmaters
-*/
+ * NCI FW Parameters
+ */
 
 #define NFCMRVL_PB_BAIL_OUT			0x11
 #define NFCMRVL_PROP_REF_CLOCK			0xF0
 #define NFCMRVL_PROP_SET_HI_CONFIG		0xF1
 
 /*
-** HCI defines
-*/
+ * HCI defines
+ */
 
 #define NFCMRVL_HCI_EVENT_HEADER_SIZE		0x04
 #define NFCMRVL_HCI_EVENT_CODE			0x04
@@ -67,8 +67,8 @@ struct nfcmrvl_private {
 	bool support_fw_dnld;
 
 	/*
-	** PHY related information
-	*/
+	 * PHY related information
+	 */
 
 	/* PHY driver context */
 	void *drv_data;
diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index d7ba5b5c653c..ed85645eb885 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -18,8 +18,8 @@ static unsigned int break_control;
 static int reset_n_io = -EINVAL;
 
 /*
-** NFCMRVL NCI OPS
-*/
+ * NFCMRVL NCI OPS
+ */
 
 static int nfcmrvl_uart_nci_open(struct nfcmrvl_private *priv)
 {
@@ -92,8 +92,8 @@ static int nfcmrvl_uart_parse_dt(struct device_node *node,
 }
 
 /*
-** NCI UART OPS
-*/
+ * NCI UART OPS
+ */
 
 static int nfcmrvl_nci_uart_open(struct nci_uart *nu)
 {
@@ -167,10 +167,10 @@ static void nfcmrvl_nci_uart_tx_done(struct nci_uart *nu)
 		return;
 
 	/*
-	** To ensure that if the NFCC goes in DEEP SLEEP sate we can wake him
-	** up. we set BREAK. Once we will be ready to send again we will remove
-	** it.
-	*/
+	 * To ensure that if the NFCC goes in DEEP SLEEP sate we can wake him
+	 * up. we set BREAK. Once we will be ready to send again we will remove
+	 * it.
+	 */
 	if (priv->config.break_control && nu->tty->ops->break_ctl) {
 		nu->tty->ops->break_ctl(nu->tty, -1);
 		usleep_range(1000, 3000);
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
