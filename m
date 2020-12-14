Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE112D979E
	for <lists+linux-nfc@lfdr.de>; Mon, 14 Dec 2020 12:47:12 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 6E571100ED487;
	Mon, 14 Dec 2020 03:47:11 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 38152100ED482
	for <linux-nfc@lists.01.org>; Mon, 14 Dec 2020 03:47:10 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id q22so11913628pfk.12
        for <linux-nfc@lists.01.org>; Mon, 14 Dec 2020 03:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=/sj5dLXt24sh61lvcsgpABuLIqlJqFU1rHY/mqcSIRs=;
        b=frhHmzOc78dpdY1fADjgVo/mxFIHVbEU45s7IyfZGPQVvWXx0j5l0SCs5C/M+soRMd
         ZIt76MoWwLaVYJep7A86+QgVB5W6hMn23rzTDfu76lh3LB8irMhbVN7xStLIG4ORGt7M
         95u5QbAH9gH6CRbylNLDQaeOhQKsuev0YNY5KepbOMeZksdYHps+o9dYoqFY0iuwP8zO
         JCunHZqKYOmg62jH68SknpbPyqDVpD7JdOJ5L+hO1R160imwBZHTOYzeTKZXrjoH5xVQ
         mwZwmvpOr/XRUbaqheAOeklqKSAe2VlVDQGcm6Mc6msUn+6oJP93O0+KjEsg6ofO2pRq
         /W2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/sj5dLXt24sh61lvcsgpABuLIqlJqFU1rHY/mqcSIRs=;
        b=X1RwkPMGvBBgIBlCxe/UCqHpQikW4YE4pYDBFvmvf55bdg4q6Oa6Go2ASgRY/P73jO
         4RXTGl1R+cL8O3OyRb6SUoqGNxGNusm8ci105/EEdcluky9XLeYzSHfA4bR1sOVJc3tp
         Rh0t/sFlMdNkEW0b8EIPxzZ0swYx/z3miomJU8tq9Fk6MCskUVyPOyhlxLRd1U3KES4y
         +Y+zfVh4zAYdr3Ie6lcvVO186DsbdmjRZ2hbk6+DH9NLpRVO2+x4Vbwm74oBxTaoZbYe
         MllVlEZQp6kdFm96Z2HxZkpv7UJOOGyMsBLHwVz1tPiTDlAr2cwKioLk5Xgm65Of9+nt
         sVKQ==
X-Gm-Message-State: AOAM531qWkAuPsojlAXPuFbR+M6AV1m1dAOOV7qD9bR9J4YeGXeDcn/y
	Io3ReyukVIqaO4CtbZVYzykeS4m4Scw=
X-Google-Smtp-Source: ABdhPJxUEEax5L2fx/qRE2NzO+kFIVY2bl1ZbTZrfXfq6QuwFn9jjM+qgx9cYb5Jr30J+L3o03Kv9Q==
X-Received: by 2002:a63:eb4b:: with SMTP id b11mr23926208pgk.351.1607946429816;
        Mon, 14 Dec 2020 03:47:09 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id h18sm2294116pfo.172.2020.12.14.03.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 03:47:08 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: krzk@kernel.org
Date: Mon, 14 Dec 2020 20:46:58 +0900
Message-Id: <20201214114658.27771-1-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 2.17.1
Message-ID-Hash: WL23LKBYIJ4S2ZFAP4BAPMC5IRKCOVEO
X-Message-ID-Hash: WL23LKBYIJ4S2ZFAP4BAPMC5IRKCOVEO
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH net-next] nfc: s3fwrn5: Remove unused nci prop commands
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/WL23LKBYIJ4S2ZFAP4BAPMC5IRKCOVEO/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

remove the unused nci prop commands that samsung driver doesn't use.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/s3fwrn5/nci.c | 25 -------------------------
 drivers/nfc/s3fwrn5/nci.h | 22 ----------------------
 2 files changed, 47 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/nci.c b/drivers/nfc/s3fwrn5/nci.c
index 103bf5c92bdc..f042d3eaf8f6 100644
--- a/drivers/nfc/s3fwrn5/nci.c
+++ b/drivers/nfc/s3fwrn5/nci.c
@@ -21,31 +21,11 @@ static int s3fwrn5_nci_prop_rsp(struct nci_dev *ndev, struct sk_buff *skb)
 }
 
 static struct nci_driver_ops s3fwrn5_nci_prop_ops[] = {
-	{
-		.opcode = nci_opcode_pack(NCI_GID_PROPRIETARY,
-				NCI_PROP_AGAIN),
-		.rsp = s3fwrn5_nci_prop_rsp,
-	},
-	{
-		.opcode = nci_opcode_pack(NCI_GID_PROPRIETARY,
-				NCI_PROP_GET_RFREG),
-		.rsp = s3fwrn5_nci_prop_rsp,
-	},
 	{
 		.opcode = nci_opcode_pack(NCI_GID_PROPRIETARY,
 				NCI_PROP_SET_RFREG),
 		.rsp = s3fwrn5_nci_prop_rsp,
 	},
-	{
-		.opcode = nci_opcode_pack(NCI_GID_PROPRIETARY,
-				NCI_PROP_GET_RFREG_VER),
-		.rsp = s3fwrn5_nci_prop_rsp,
-	},
-	{
-		.opcode = nci_opcode_pack(NCI_GID_PROPRIETARY,
-				NCI_PROP_SET_RFREG_VER),
-		.rsp = s3fwrn5_nci_prop_rsp,
-	},
 	{
 		.opcode = nci_opcode_pack(NCI_GID_PROPRIETARY,
 				NCI_PROP_START_RFREG),
@@ -61,11 +41,6 @@ static struct nci_driver_ops s3fwrn5_nci_prop_ops[] = {
 				NCI_PROP_FW_CFG),
 		.rsp = s3fwrn5_nci_prop_rsp,
 	},
-	{
-		.opcode = nci_opcode_pack(NCI_GID_PROPRIETARY,
-				NCI_PROP_WR_RESET),
-		.rsp = s3fwrn5_nci_prop_rsp,
-	},
 };
 
 void s3fwrn5_nci_get_prop_ops(struct nci_driver_ops **ops, size_t *n)
diff --git a/drivers/nfc/s3fwrn5/nci.h b/drivers/nfc/s3fwrn5/nci.h
index 23c0b28f247a..a80f0fb082a8 100644
--- a/drivers/nfc/s3fwrn5/nci.h
+++ b/drivers/nfc/s3fwrn5/nci.h
@@ -11,9 +11,6 @@
 
 #include "s3fwrn5.h"
 
-#define NCI_PROP_AGAIN		0x01
-
-#define NCI_PROP_GET_RFREG	0x21
 #define NCI_PROP_SET_RFREG	0x22
 
 struct nci_prop_set_rfreg_cmd {
@@ -25,23 +22,6 @@ struct nci_prop_set_rfreg_rsp {
 	__u8 status;
 };
 
-#define NCI_PROP_GET_RFREG_VER	0x24
-
-struct nci_prop_get_rfreg_ver_rsp {
-	__u8 status;
-	__u8 data[8];
-};
-
-#define NCI_PROP_SET_RFREG_VER	0x25
-
-struct nci_prop_set_rfreg_ver_cmd {
-	__u8 data[8];
-};
-
-struct nci_prop_set_rfreg_ver_rsp {
-	__u8 status;
-};
-
 #define NCI_PROP_START_RFREG	0x26
 
 struct nci_prop_start_rfreg_rsp {
@@ -70,8 +50,6 @@ struct nci_prop_fw_cfg_rsp {
 	__u8 status;
 };
 
-#define NCI_PROP_WR_RESET	0x2f
-
 void s3fwrn5_nci_get_prop_ops(struct nci_driver_ops **ops, size_t *n);
 int s3fwrn5_nci_rf_configure(struct s3fwrn5_info *info, const char *fw_name);
 
-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
