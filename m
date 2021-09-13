Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 02943408CEE
	for <lists+linux-nfc@lfdr.de>; Mon, 13 Sep 2021 15:21:16 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E00B9100EB831;
	Mon, 13 Sep 2021 06:21:14 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id E8048100EB847
	for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 06:21:11 -0700 (PDT)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CC4C240297
	for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 13:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631539270;
	bh=IGi454bY1uM8p5QRZSKGDo9YXvHCL/LufQFtzz+SznM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=TVKJmnVJLRM5Hrah7bOUMODh5Vj2a4tf0Uy/kSSXkYAij64cluvAPFXi9l5UMOY/O
	 OzZT4Wm0ftonrNR7Jor0StEYPT1X2eBJUxa4T/ErI7IlACiUqY1tNNsbcT/DDiRzG3
	 ygtg3Z3K94aM2EKy6GSEbL9mbC/qvY765Slj0Y2JFuAyfJNLJ3dA1YGtJ+HiulRJ6Q
	 eGct19qat+WAYVzla/3csbW3Axocc7aKnQ0mSsHA3Fka/yfLHXGnKFNT1eA7OReb59
	 D1ez94Rqp+yp2GA7NVKe11Fcr+qXKANEg8ExV+puCigQCoHYA0VNqv14iJiWq66q9I
	 WiFe9/ooT2jFg==
Received: by mail-wm1-f69.google.com with SMTP id w25-20020a1cf6190000b0290252505ddd56so4919544wmc.3
        for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 06:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IGi454bY1uM8p5QRZSKGDo9YXvHCL/LufQFtzz+SznM=;
        b=8DegF5xAyZw5B92Pfh0V8ItJOfnjqKqbhBZ6vM8jESi+G9K2O5pW9xMi5BITwf+ctF
         le/267x5ww5F8oP/FpUtqE60CmbLHDiNDo+1k/Hm+9N/kPlk/CQJcMG/VKL8NsTrwDtO
         a230e0B/ARe+mAlppsmKWcuUd2xWi05nzvCM1tcGyzXeUx2ifgkaafdCtsh/M0OmO3Zb
         TREVJbSYbaQsLlHVehlWCdelklr/Z6F1GP3KHvu7d4H8FyBoAg7LzvVJoSZtsfm+KgDr
         WZ9y40NO2y2uhcqGbhLTDp9sfq07nQoEEeZgnzu+3JRVhVq5b75NfoRede534J6hpnFO
         L4kg==
X-Gm-Message-State: AOAM5318D56j37pLlAqbrkfj62YlRjWoGBHjdFWKB8GvLhzM2MeAc9Ab
	N31quqy4ODKZh9UnIDXvNXRklto2t+KKGIFGxQ7cnHFRZRh1Egl8IX8L7jRPAj0g3uNopmMeOs9
	DCBOubVB72ieDPPOqpxutvEtrXCqJOdIVzQ==
X-Received: by 2002:a7b:cc94:: with SMTP id p20mr10982106wma.75.1631539270108;
        Mon, 13 Sep 2021 06:21:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzcTw8iBQqSZqojTcM4kP7OKiemOCKYYc0KcyxRfeOMDAJB3GM+IUl88UZvA8hAphcWLUGHQ==
X-Received: by 2002:a7b:cc94:: with SMTP id p20mr10982078wma.75.1631539269943;
        Mon, 13 Sep 2021 06:21:09 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id n3sm7195888wmi.0.2021.09.13.06.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:21:09 -0700 (PDT)
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
Date: Mon, 13 Sep 2021 15:20:35 +0200
Message-Id: <20210913132035.242870-16-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
References: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: TQ4CKIDOODTASRPHJSEYVFDM6RY7S5HH
X-Message-ID-Hash: TQ4CKIDOODTASRPHJSEYVFDM6RY7S5HH
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 15/15] nfc: mrvl: drop unneeded memory allocation fail messages
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/TQ4CKIDOODTASRPHJSEYVFDM6RY7S5HH/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

nci_skb_alloc() already prints an error message on memory allocation
failure.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/nfcmrvl/fw_dnld.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/fw_dnld.c b/drivers/nfc/nfcmrvl/fw_dnld.c
index edac56b01fd1..e83f65596a88 100644
--- a/drivers/nfc/nfcmrvl/fw_dnld.c
+++ b/drivers/nfc/nfcmrvl/fw_dnld.c
@@ -76,10 +76,8 @@ static struct sk_buff *alloc_lc_skb(struct nfcmrvl_private *priv, uint8_t plen)
 	struct nci_data_hdr *hdr;
 
 	skb = nci_skb_alloc(priv->ndev, (NCI_DATA_HDR_SIZE + plen), GFP_KERNEL);
-	if (!skb) {
-		pr_err("no memory for data\n");
+	if (!skb)
 		return NULL;
-	}
 
 	hdr = skb_put(skb, NCI_DATA_HDR_SIZE);
 	hdr->conn_id = NCI_CORE_LC_CONNID_PROP_FW_DL;
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
