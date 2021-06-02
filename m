Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 563CC3987EC
	for <lists+linux-nfc@lfdr.de>; Wed,  2 Jun 2021 13:20:30 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 79A97100ED4A0;
	Wed,  2 Jun 2021 04:20:28 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 2D0E1100EF267
	for <linux-nfc@lists.01.org>; Wed,  2 Jun 2021 04:20:27 -0700 (PDT)
Received: from mail-ed1-f71.google.com ([209.85.208.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1loOvB-0005Ei-NL
	for linux-nfc@lists.01.org; Wed, 02 Jun 2021 11:20:25 +0000
Received: by mail-ed1-f71.google.com with SMTP id j13-20020aa7de8d0000b029038fc8e57037so1229422edv.0
        for <linux-nfc@lists.01.org>; Wed, 02 Jun 2021 04:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dg5RWJfPVjGhObprFebAP1b6q7PFdTvgviRzWEXH+s0=;
        b=kagtdByxQGoG/KJbv4Hwa35O4e16tfnAzyKl3L6XNQeD2JnYMR0XEOeQDALvMJvrzg
         jSsck8xc8YcfMKn5yzE70RQd94KVicOaG/2M8hSJ6Syi6hIi41T5zQhMw0CsL5FCghAx
         k0RBgfEbjOmL3+PWLR+tbxV62gffCko2DrptPCpfiolryWCMPpycf+oxcLM9/fF+l9lS
         lPcMol6txUCF+IqK3BIOOstVNi4ffj1kb3Z6lUMnbS5TF5vvPNY8d6EnlD+DOCZzOomN
         /43Ol+Gz/WMKtSmgSKnpEdnJIdQo3N9nB6SME9W7Q3K5pbQT6ZRMj3pz4bLsC8FvZAsB
         2Big==
X-Gm-Message-State: AOAM531WQ0ESUnRA2CBBI5QxCDpg5ItPCqa5Yh9wHq4b95znTjzzvkp+
	Mr3mppTUXBzBQMfUyywibXmA24xx93YEMQ6SVRVf+6DhfLv74aGPP/gYVTg0wo+RGoqNRNanSda
	2sgp+21ow9M2juv6AHoCShVnLOtkdjUEcag==
X-Received: by 2002:a17:906:b6c5:: with SMTP id ec5mr33858442ejb.290.1622632825448;
        Wed, 02 Jun 2021 04:20:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrFvwwDfEpK0N6mkxbqvhu2A9BYNI8VLGHKVpdxBN1fSXzF09em7UedqZPCBKEEY+ClkDoQw==
X-Received: by 2002:a17:906:b6c5:: with SMTP id ec5mr33858433ejb.290.1622632825310;
        Wed, 02 Jun 2021 04:20:25 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id jp6sm3699705ejb.85.2021.06.02.04.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 04:20:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed,  2 Jun 2021 13:20:11 +0200
Message-Id: <20210602112011.44473-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210602112011.44473-1-krzysztof.kozlowski@canonical.com>
References: <20210602112011.44473-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 2DTSDM6LLBOGD4UZNSAXCB2C7II7NRWM
X-Message-ID-Hash: 2DTSDM6LLBOGD4UZNSAXCB2C7II7NRWM
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Joe Perches <joe@perches.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 2/2] nfc: mrvl: reduce the scope of local variables
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/2DTSDM6LLBOGD4UZNSAXCB2C7II7NRWM/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In two places the 'ep_desc' and 'skb' local variables are used only
within if() or for() block, so they scope can be reduced which makes the
entire code slightly easier to follow.  No functional change.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. New patch
---
 drivers/nfc/nfcmrvl/usb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
index 6fec20abfd1e..ec6fd7a3f31f 100644
--- a/drivers/nfc/nfcmrvl/usb.c
+++ b/drivers/nfc/nfcmrvl/usb.c
@@ -68,7 +68,6 @@ static int nfcmrvl_inc_tx(struct nfcmrvl_usb_drv_data *drv_data)
 static void nfcmrvl_bulk_complete(struct urb *urb)
 {
 	struct nfcmrvl_usb_drv_data *drv_data = urb->context;
-	struct sk_buff *skb;
 	int err;
 
 	dev_dbg(&drv_data->udev->dev, "urb %p status %d count %d\n",
@@ -78,6 +77,8 @@ static void nfcmrvl_bulk_complete(struct urb *urb)
 		return;
 
 	if (!urb->status) {
+		struct sk_buff *skb;
+
 		skb = nci_skb_alloc(drv_data->priv->ndev, urb->actual_length,
 				    GFP_ATOMIC);
 		if (!skb) {
@@ -296,7 +297,6 @@ static void nfcmrvl_waker(struct work_struct *work)
 static int nfcmrvl_probe(struct usb_interface *intf,
 			 const struct usb_device_id *id)
 {
-	struct usb_endpoint_descriptor *ep_desc;
 	struct nfcmrvl_usb_drv_data *drv_data;
 	struct nfcmrvl_private *priv;
 	int i;
@@ -314,6 +314,8 @@ static int nfcmrvl_probe(struct usb_interface *intf,
 		return -ENOMEM;
 
 	for (i = 0; i < intf->cur_altsetting->desc.bNumEndpoints; i++) {
+		struct usb_endpoint_descriptor *ep_desc;
+
 		ep_desc = &intf->cur_altsetting->endpoint[i].desc;
 
 		if (!drv_data->bulk_tx_ep &&
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
