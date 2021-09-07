Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FCD40286B
	for <lists+linux-nfc@lfdr.de>; Tue,  7 Sep 2021 14:18:50 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 1C335100EB835;
	Tue,  7 Sep 2021 05:18:44 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B22BD100EB339
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 05:18:41 -0700 (PDT)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A77A4407A7
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 12:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631017120;
	bh=IGi454bY1uM8p5QRZSKGDo9YXvHCL/LufQFtzz+SznM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=BKgQmkFGobUvYp4GFsCJgQW/pS4+dZHWtVS2CgD0+/SI7oAylF4qKPMClkPE2XS9K
	 KiZgUKdoGhiybUMClbmES0ASH/vud9PeZBpFkNjWyNt1E5o1XhJkp7Rpx++N8C3zW6
	 Ho1loJ4DQ2kx8RN6QMF24nvlqOSbTPQAKgfAid2UyNRputTZHAaoQs+OO5q23+jOtk
	 x6M9WFETDet2o8tUchLOwI9jxOtL8VKItU8ahicahuLk/ImV0VX/13u7+cHFhCxhbQ
	 ZXqRG6pQpbHxYhkM5caBjQto37Wy/nRNpkqVFkWT+0GhNR+RcCyPMu8vz/LMs5nc6E
	 2oXBE6+0V5CTw==
Received: by mail-wm1-f69.google.com with SMTP id x10-20020a7bc20a000000b002f8cf761457so496558wmi.1
        for <linux-nfc@lists.01.org>; Tue, 07 Sep 2021 05:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IGi454bY1uM8p5QRZSKGDo9YXvHCL/LufQFtzz+SznM=;
        b=VZrNpR5yjOPSWOoaHXQiJ8LkxxBU7XCmJdjRenPM48CbTuyIsq1uQqT//DxS/kMaIu
         4PMtQbKtTIBYUmJlE7Rv+WxYz2L0eAZ5V5M4fHq6TDSkJcACSaTrIUgzhQTMSYd5L8+U
         fTI95pp2C7kBB6+1wOqbnbLwULY5h5u8w3Eh9MSg4AnK+1eZoUvIykavzv//KhtSHPSd
         buEC4a/LcBLrsjW5k4cAawLLlxQlxkD0e7/OSDrbdaYejNZGM63XxoRFnA/FiRN9fgRz
         xc7s/2aWlDicJDqvOXWEh1V6EgbPc5+78N8Gwt8HF5srXKEBCYb2D7/39FKkSWuusp7o
         Ufzg==
X-Gm-Message-State: AOAM532Zb9OEQzjKJIXKiQO18EE2JHvhONR5uYoxwLUCipEttektq4Fh
	PkKNVxHQs3OmWdIvQ7rLW5X7W1iGjtYuqxYVPpA+DLCbmq22o9euGqLMjvinZI9rgOgs5xdZIvI
	XVuSLvJSsTChZftA/O0y5RcTIvg3UifNzxQ==
X-Received: by 2002:a05:600c:1d27:: with SMTP id l39mr3629439wms.146.1631017120415;
        Tue, 07 Sep 2021 05:18:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzkQReT6hqXvnsRi4xVMvPv5mwLHDY/KqHilLqyCDbOJpRRpQ8tjRRU7brxn8w70vPDRKkmA==
X-Received: by 2002:a05:600c:1d27:: with SMTP id l39mr3629425wms.146.1631017120289;
        Tue, 07 Sep 2021 05:18:40 -0700 (PDT)
Received: from kozik-lap.lan ([79.98.113.47])
        by smtp.gmail.com with ESMTPSA id m3sm13525216wrg.45.2021.09.07.05.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 05:18:39 -0700 (PDT)
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
Date: Tue,  7 Sep 2021 14:18:16 +0200
Message-Id: <20210907121816.37750-16-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
References: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: Y5CBEKYCN7U3YCSS3HJSAKHT6H4UTOQN
X-Message-ID-Hash: Y5CBEKYCN7U3YCSS3HJSAKHT6H4UTOQN
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 15/15] nfc: mrvl: drop unneeded memory allocation fail messages
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/Y5CBEKYCN7U3YCSS3HJSAKHT6H4UTOQN/>
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
