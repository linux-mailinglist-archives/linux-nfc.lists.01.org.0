Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B683942C3
	for <lists+linux-nfc@lfdr.de>; Fri, 28 May 2021 14:42:25 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id AF7DD100EBBBD;
	Fri, 28 May 2021 05:42:21 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 9272A100ED4AE
	for <linux-nfc@lists.01.org>; Fri, 28 May 2021 05:42:18 -0700 (PDT)
Received: from mail-ua1-f69.google.com ([209.85.222.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lmbof-0007zF-4x
	for linux-nfc@lists.01.org; Fri, 28 May 2021 12:42:17 +0000
Received: by mail-ua1-f69.google.com with SMTP id c27-20020ab0079b0000b0290217cf59726cso1849475uaf.10
        for <linux-nfc@lists.01.org>; Fri, 28 May 2021 05:42:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L1E8+lV2yYHpfQvRilUCcibqrpA4/S/5sauZ+Rzzh9M=;
        b=XqpPcYzLRAnwfaBePGGie/pbVuHBmXIar0xeN/255jch8No9yvX5JZqMHzyu9IH3O/
         1uJjGJn/FzXHUAiXyc5KWmRuxbogkTse9f7MFWB1ETfVttzSKVNCIjgzXynMtiAHUP0G
         S4/nhL0l/Nfq/AAC32hGw/nocxw+Y6GRuXsQjZ4+fIjrgoXTUGOkc+657w9of5nxRFZj
         sVJEdLRQj3a22/28Rsxo7WLXe2JcL86RxYoNPWgRWKTVcvOHpxVcOQZonTiS3AcgOg73
         dEJ3tWdgxW+4zgXS0Myl+56A7y3tv/jK5MJxUW4LtMwAttba39TpkrVbX4QJ5X2t7Zmb
         q+tA==
X-Gm-Message-State: AOAM5322udhHlb/oN4KZcIaj9IbYeyjjBxzRDnzhjWzlz/f2RKeFfykl
	eNuM/oiPCsYqnjgDYWiKcRlZvBJ5s102VYz0fHtoHaHA4ggMd3m7k4aXXzXGSkgwVoJBzBMt8ip
	N5AUEfP2dnhvoQhBr53GX/+gEgGCbDmwhug==
X-Received: by 2002:a67:ef94:: with SMTP id r20mr6640876vsp.36.1622205736335;
        Fri, 28 May 2021 05:42:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzc3my6SxlXZaZfhHX7W+xfeFllcqLbI3WOn1B07accNkRCVFE7nIIADJby3arfB1ew53uXBw==
X-Received: by 2002:a67:ef94:: with SMTP id r20mr6640861vsp.36.1622205736180;
        Fri, 28 May 2021 05:42:16 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id b35sm782328uae.20.2021.05.28.05.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 05:42:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 28 May 2021 08:41:54 -0400
Message-Id: <20210528124200.79655-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
References: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: A62TJHTTBOFZ3DKY6ER56ADPRW5GECL4
X-Message-ID-Hash: A62TJHTTBOFZ3DKY6ER56ADPRW5GECL4
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 06/12] nfc: mrvl: skip impossible NCI_MAX_PAYLOAD_SIZE check
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/A62TJHTTBOFZ3DKY6ER56ADPRW5GECL4/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The nci_ctrl_hdr.plen field us u8, so checkign if it is bigger than
NCI_MAX_PAYLOAD_SIZE does not make any sense.  Fix warning reported by
Smatch:

    drivers/nfc/nfcmrvl/i2c.c:52 nfcmrvl_i2c_read() warn:
        impossible condition '(nci_hdr.plen > 255) => (0-255 > 255)'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/nfcmrvl/i2c.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/i2c.c b/drivers/nfc/nfcmrvl/i2c.c
index bafd9b500b2c..3c9bbee98237 100644
--- a/drivers/nfc/nfcmrvl/i2c.c
+++ b/drivers/nfc/nfcmrvl/i2c.c
@@ -49,11 +49,6 @@ static int nfcmrvl_i2c_read(struct nfcmrvl_i2c_drv_data *drv_data,
 		return -EBADMSG;
 	}
 
-	if (nci_hdr.plen > NCI_MAX_PAYLOAD_SIZE) {
-		nfc_err(&drv_data->i2c->dev, "invalid packet payload size\n");
-		return -EBADMSG;
-	}
-
 	*skb = nci_skb_alloc(drv_data->priv->ndev,
 			     nci_hdr.plen + NCI_CTRL_HDR_SIZE, GFP_KERNEL);
 	if (!*skb)
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
