Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E64993DA145
	for <lists+linux-nfc@lfdr.de>; Thu, 29 Jul 2021 12:40:53 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id C11CE100EBB78;
	Thu, 29 Jul 2021 03:40:49 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 89F95100EBB7D
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:40:47 -0700 (PDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 5EC973F224
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 10:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627555246;
	bh=BZIMPFV8uXC9L/K0xzDgkM9m6seQbMO32c9dNbfWa80=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=BTaP1d8ydrV0hgqkvf/+UhufeiCSWdGIGAW4o196Prd6ZEqDC2WF3iYjM848wn9Dj
	 VPKZ8ix+0RfiaO26QLgqT7Z/1agpsiRaeCzPIDc0jHdLJiHnmltOES+3nX113AcY88
	 +9XVJP0/1JjYJRM/nSMyX2LE7f615J6AwEZ5nXupdTkR5itCw5mz66kXyZpHPcGBLf
	 7rS9vDW9u8VlblQ0tv8KO25uGVKV/GU21bs4JxY77fjIaBCJ+MIo8nWAzep7v78vAn
	 zsvgWkvLVPIgGMNqKzHht81g6NPRQxwWcEhaWWYlvOLySc15W0153dZ6YFCDSDaOt+
	 mclQZNrRELrLA==
Received: by mail-ed1-f72.google.com with SMTP id x1-20020a05640218c1b02903bc7f97f858so1145444edy.2
        for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BZIMPFV8uXC9L/K0xzDgkM9m6seQbMO32c9dNbfWa80=;
        b=ae1ZfDqh40+Oc+8Fuj8usALDU+SRYTx+jkTRzKjb4vtvCQJZp5jwOmEZUkZruUq9pz
         ol17tHN/fU6XFc5Ri1SuDy8tsDbAh9krqEyzhOu5UOV2BYuUr4G4ymOyk2RuRtJ0qYeU
         ytIjAvJiajuY2ZVtPcESmI2w5hxqKuS4e65pnIdE8kAa27p6nkZoVjtWrotlbtYSGa4R
         /YsSKBjDupQ4INVKgLoP9YP9HGeF0lLM6kRtOjpU/I5Ayn1Pj/u8732OPC6SBQPUqo7g
         B0gDf10gWen02TQ2Z80I3Yy7ch+qenK9773IB50Mkfiq9iCU8RdLSusUCsrwAm1yHwdE
         envQ==
X-Gm-Message-State: AOAM531QVUpqSIMpWp1iVaPr1vz27Iiz7E+cJp+CZVg3mB/LYqV3F7mJ
	b1s2V8o+UndNZRXwVW4HyZxAuDmnH2Tf4g5QFg4A6IzNg3FO7SR68wfJO0BqdQdzpsMwal1UOcx
	U1gaeOUgES8vDRvGqSOYmkVmZor7TrF3xiA==
X-Received: by 2002:a17:906:b0c5:: with SMTP id bk5mr3881341ejb.428.1627555246144;
        Thu, 29 Jul 2021 03:40:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygcbnz2mL1I+EM9Bv/vZsYeICNIGIdcaZXywSSZmph4zECffAhqDCrnUSC3LB/1TyQegjgiQ==
X-Received: by 2002:a17:906:b0c5:: with SMTP id bk5mr3881326ejb.428.1627555246020;
        Thu, 29 Jul 2021 03:40:46 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id c14sm824475ejb.78.2021.07.29.03.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 03:40:45 -0700 (PDT)
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
Date: Thu, 29 Jul 2021 12:40:20 +0200
Message-Id: <20210729104022.47761-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
References: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: MYL6T4U4DH6T5WPJIU3DSRAEISD3KZQF
X-Message-ID-Hash: MYL6T4U4DH6T5WPJIU3DSRAEISD3KZQF
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 10/12] nfc: microread: constify several pointers
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/MYL6T4U4DH6T5WPJIU3DSRAEISD3KZQF/>
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
 drivers/nfc/microread/i2c.c       | 2 +-
 drivers/nfc/microread/microread.c | 4 ++--
 drivers/nfc/microread/microread.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/nfc/microread/i2c.c b/drivers/nfc/microread/i2c.c
index f91760c78455..86f593c73ed6 100644
--- a/drivers/nfc/microread/i2c.c
+++ b/drivers/nfc/microread/i2c.c
@@ -73,7 +73,7 @@ static void microread_i2c_remove_len_crc(struct sk_buff *skb)
 	skb_trim(skb, MICROREAD_I2C_FRAME_TAILROOM);
 }
 
-static int check_crc(struct sk_buff *skb)
+static int check_crc(const struct sk_buff *skb)
 {
 	int i;
 	u8 crc = 0;
diff --git a/drivers/nfc/microread/microread.c b/drivers/nfc/microread/microread.c
index 8e847524937c..9d83ccebd434 100644
--- a/drivers/nfc/microread/microread.c
+++ b/drivers/nfc/microread/microread.c
@@ -358,7 +358,7 @@ static int microread_complete_target_discovered(struct nfc_hci_dev *hdev,
 static void microread_im_transceive_cb(void *context, struct sk_buff *skb,
 				       int err)
 {
-	struct microread_info *info = context;
+	const struct microread_info *info = context;
 
 	switch (info->async_cb_type) {
 	case MICROREAD_CB_TYPE_READER_ALL:
@@ -642,7 +642,7 @@ static const struct nfc_hci_ops microread_hci_ops = {
 };
 
 int microread_probe(void *phy_id, const struct nfc_phy_ops *phy_ops,
-		    char *llc_name, int phy_headroom, int phy_tailroom,
+		    const char *llc_name, int phy_headroom, int phy_tailroom,
 		    int phy_payload, struct nfc_hci_dev **hdev)
 {
 	struct microread_info *info;
diff --git a/drivers/nfc/microread/microread.h b/drivers/nfc/microread/microread.h
index 76152d7aa53c..2ee7ccfa22dd 100644
--- a/drivers/nfc/microread/microread.h
+++ b/drivers/nfc/microread/microread.h
@@ -11,7 +11,7 @@
 #define DRIVER_DESC "NFC driver for microread"
 
 int microread_probe(void *phy_id, const struct nfc_phy_ops *phy_ops,
-		    char *llc_name, int phy_headroom, int phy_tailroom,
+		    const char *llc_name, int phy_headroom, int phy_tailroom,
 		    int phy_payload, struct nfc_hci_dev **hdev);
 
 void microread_remove(struct nfc_hci_dev *hdev);
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
