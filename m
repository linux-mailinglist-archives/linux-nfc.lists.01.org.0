Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EC62DA844
	for <lists+linux-nfc@lfdr.de>; Tue, 15 Dec 2020 07:54:46 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id C2762100EBBA7;
	Mon, 14 Dec 2020 22:54:44 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B6016100EBBA2
	for <linux-nfc@lists.01.org>; Mon, 14 Dec 2020 22:54:42 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id v29so14585390pgk.12
        for <linux-nfc@lists.01.org>; Mon, 14 Dec 2020 22:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=29XGAclPGmuftpF/yRuuyN4mHi9SUrsaBzPMlpIbVk4=;
        b=Y0sWTMz3GtOW+SmGW4/kBQJooG9l5zU2ce4DP/GKIYB+vbXPrAH41sdsKeo8StG2eX
         D9aMgLppBy3WnWpz3ZPZ/sCD6cu5FNjJJIriBodjw2Fg9XZRKywOKgPF9/Y8ksiEsBtC
         Fb8AftFmxDA/c66vElS+bcBszXqyyh7YLHIxQdsnJoTwb6AgCK7C6Kk8ecJo0V0uuYbb
         MTaMLK3zo9/Z5ndLVpk/JcRcww+cIR5WKh9wZolHRjA2ezytLPfkeZ1iiO60x4T5ODlb
         c3oW5ZqQftlnbrcTpA4cTS1m+ufokdEDI6s05q6dyI9AavCbRV7blRHIVecmIdgNpZTq
         Fi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=29XGAclPGmuftpF/yRuuyN4mHi9SUrsaBzPMlpIbVk4=;
        b=nsuWb0Yiu9/K+4ihJm5tQXYVnur276c6zNy/aHD1iGR1cT/3KR1xPM+RIniGoEDXbI
         yjlRLGBoYnI2kHvwBJOIcg8PzwvyhKvif0gJbzkei3uaUXlY1ktvnBWVMKPr8J+KYFdQ
         LTOPDK1KAyNPvU526uiC7ouWA/uQJwJPXrWR8FsriG/eJI87O6bXv6mnoyjSuto9MaP3
         rUs6JLC1n33Kmjgde9rMnG13NFLHM2uD2k9E84W78mL3yECJDTshlEfIpy688amzraBP
         FWnpNuoyUC+TY57vZVjoHxxGHFzyFYBwKcVetI2SOFxkbAIatM9td923L96AzpwnhwuX
         lpwA==
X-Gm-Message-State: AOAM531UCM+vlDbvwgcRBOyPuAxASysIApuynXhh71+XewNqCnJIv8Co
	IaiaklltpDgy31TMeKUnnIw=
X-Google-Smtp-Source: ABdhPJz37IEUIyxeO+UQiYDgMJuF4g8CxUpaxXTiy5jOZ9RjJYgHKKxuGBsDrHgSR/uAKnRnWfrAag==
X-Received: by 2002:a63:d542:: with SMTP id v2mr27601912pgi.250.1608015282364;
        Mon, 14 Dec 2020 22:54:42 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id na6sm19124134pjb.12.2020.12.14.22.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 22:54:41 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: krzk@kernel.org
Date: Tue, 15 Dec 2020 15:54:01 +0900
Message-Id: <20201215065401.3220-3-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201215065401.3220-1-bongsu.jeon@samsung.com>
References: <20201215065401.3220-1-bongsu.jeon@samsung.com>
Message-ID-Hash: 2SNHJU5THZQKR4HPV3RSB47P4ZFPOK5W
X-Message-ID-Hash: 2SNHJU5THZQKR4HPV3RSB47P4ZFPOK5W
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 net-next 2/2] nfc: s3fwrn5: Remove unused NCI prop commands
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/2SNHJU5THZQKR4HPV3RSB47P4ZFPOK5W/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

Remove the unused NCI prop commands that s3fwrn5 driver doesn't use.

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
