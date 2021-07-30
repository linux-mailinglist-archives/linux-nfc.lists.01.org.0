Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AD53DBADB
	for <lists+linux-nfc@lfdr.de>; Fri, 30 Jul 2021 16:42:24 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 8D920100EB325;
	Fri, 30 Jul 2021 07:42:22 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 5067A100EB847
	for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 07:42:20 -0700 (PDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 420C83F23D
	for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 14:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627656139;
	bh=y9Uo/os+3OziqdNdxRl0CGuCizZoyhHNVP1pooBGgac=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=SvmNlYfO1T9YpcWhHz55l6E2AKU5Vwq+wL3UTYyhBlzikGj5kii+hg/tRlTYDjrkZ
	 6hKIDXQoJ9a7he3I+i6tLykgAJIuTjCyJP9DWvnfFXD4ToVV532BUjPBmTakkF6ZIE
	 IksZ1zAank8t0af1rS5vUzI17UopCLp2w+aRbWtL6K5PnivWZ/V3qt8BqFegZ21T18
	 k6qIoVLL0gUUj+QfFiT4KCe6DX69n2Ek+vIPBDEyaNK0DcY9l6pSxhK5UM1DIfqWoa
	 FwgaphuTCu9Oy7wxnL642ibJ+M7E4hqCZ7ODKjwTGR64lM0P7ml10rBspcacZY7FmD
	 Nrcc6RImxvCxg==
Received: by mail-ed1-f69.google.com with SMTP id c1-20020aa7df010000b02903bb5c6f746eso4689369edy.10
        for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 07:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y9Uo/os+3OziqdNdxRl0CGuCizZoyhHNVP1pooBGgac=;
        b=t0eXKmkWuSJNYfy4bYzL2RnI8oPsDIF79bZv27b3AyB3cFvTj/j5ZLupqt1ANTMch6
         8rn/sblEuW+6fne/5ZGPGgptTmn4UMKNNCjGsA0g7SRsoPQvvGkIvrsc0bnXQeVjRtAA
         +9/7BHFW4NNvOUSZSk2353mMMxwFpDTGHITJSzeavYUsWuDOWTsRR3I+ZIqpvRTzwqwh
         ZSzAYXr39XeV14SH7yQGDXHzxJuwQExBUBb0gIb/0tX9yXy6ytYV0a9seDiqQc79UJDn
         pMVE9h72se/xUXY2kJTGv8YYb0ta5RAIEEMlN4wEgXn44Hm/CcPdDtVpBkRZeHAxJx1U
         9FIw==
X-Gm-Message-State: AOAM531RqQCRyUL+V4crArlD4jv69pQ2IOX+rnT/eYo7kuCCYlkjGqWr
	n+nIIz3RK6RvMEELCUqc+Idk5ehMkHZsoIoAfGYDjIiFytEiHvA3IhxG2aIVF7byf1mRHEanjqk
	qIVbVbEJ/nwwob9YhqvWHW8ri43Mk0dbL2Q==
X-Received: by 2002:a17:907:2d28:: with SMTP id gs40mr2904574ejc.193.1627656138738;
        Fri, 30 Jul 2021 07:42:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYC1VofAfZY3hhBV10+K4sh3QRT8py2x7b+JMzQrNK6xJ2n3VaOY7deB9lkFNxeE52DKW/7g==
X-Received: by 2002:a17:907:2d28:: with SMTP id gs40mr2904558ejc.193.1627656138597;
        Fri, 30 Jul 2021 07:42:18 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id z8sm626325ejd.94.2021.07.30.07.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:42:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 30 Jul 2021 16:42:00 +0200
Message-Id: <20210730144202.255890-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210730144202.255890-1-krzysztof.kozlowski@canonical.com>
References: <20210730144202.255890-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: FRR3OM6F4KSL7AHYLOR4K5KK4DYRHGLY
X-Message-ID-Hash: FRR3OM6F4KSL7AHYLOR4K5KK4DYRHGLY
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v3 5/7] nfc: constify local pointer variables
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/FRR3OM6F4KSL7AHYLOR4K5KK4DYRHGLY/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Few pointers to struct nfc_target and struct nfc_se can be made const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/pn544/pn544.c | 4 ++--
 net/nfc/core.c            | 2 +-
 net/nfc/hci/core.c        | 8 ++++----
 net/nfc/netlink.c         | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/nfc/pn544/pn544.c b/drivers/nfc/pn544/pn544.c
index c2b4555ab4b7..092f03b80a78 100644
--- a/drivers/nfc/pn544/pn544.c
+++ b/drivers/nfc/pn544/pn544.c
@@ -809,7 +809,7 @@ static int pn544_hci_discover_se(struct nfc_hci_dev *hdev)
 #define PN544_SE_MODE_ON	0x01
 static int pn544_hci_enable_se(struct nfc_hci_dev *hdev, u32 se_idx)
 {
-	struct nfc_se *se;
+	const struct nfc_se *se;
 	u8 enable = PN544_SE_MODE_ON;
 	static struct uicc_gatelist {
 		u8 head;
@@ -864,7 +864,7 @@ static int pn544_hci_enable_se(struct nfc_hci_dev *hdev, u32 se_idx)
 
 static int pn544_hci_disable_se(struct nfc_hci_dev *hdev, u32 se_idx)
 {
-	struct nfc_se *se;
+	const struct nfc_se *se;
 	u8 disable = PN544_SE_MODE_OFF;
 
 	se = nfc_find_se(hdev->ndev, se_idx);
diff --git a/net/nfc/core.c b/net/nfc/core.c
index 08182e209144..3c645c1d99c9 100644
--- a/net/nfc/core.c
+++ b/net/nfc/core.c
@@ -824,7 +824,7 @@ EXPORT_SYMBOL(nfc_targets_found);
  */
 int nfc_target_lost(struct nfc_dev *dev, u32 target_idx)
 {
-	struct nfc_target *tg;
+	const struct nfc_target *tg;
 	int i;
 
 	pr_debug("dev_name %s n_target %d\n", dev_name(&dev->dev), target_idx);
diff --git a/net/nfc/hci/core.c b/net/nfc/hci/core.c
index ff94ac774937..ceb87db57cdb 100644
--- a/net/nfc/hci/core.c
+++ b/net/nfc/hci/core.c
@@ -128,7 +128,7 @@ static void nfc_hci_msg_rx_work(struct work_struct *work)
 	struct nfc_hci_dev *hdev = container_of(work, struct nfc_hci_dev,
 						msg_rx_work);
 	struct sk_buff *skb;
-	struct hcp_message *message;
+	const struct hcp_message *message;
 	u8 pipe;
 	u8 type;
 	u8 instruction;
@@ -182,9 +182,9 @@ void nfc_hci_cmd_received(struct nfc_hci_dev *hdev, u8 pipe, u8 cmd,
 			  struct sk_buff *skb)
 {
 	u8 status = NFC_HCI_ANY_OK;
-	struct hci_create_pipe_resp *create_info;
-	struct hci_delete_pipe_noti *delete_info;
-	struct hci_all_pipe_cleared_noti *cleared_info;
+	const struct hci_create_pipe_resp *create_info;
+	const struct hci_delete_pipe_noti *delete_info;
+	const struct hci_all_pipe_cleared_noti *cleared_info;
 	u8 gate;
 
 	pr_debug("from pipe %x cmd %x\n", pipe, cmd);
diff --git a/net/nfc/netlink.c b/net/nfc/netlink.c
index 70467a82be8f..49089c50872e 100644
--- a/net/nfc/netlink.c
+++ b/net/nfc/netlink.c
@@ -530,7 +530,7 @@ int nfc_genl_se_transaction(struct nfc_dev *dev, u8 se_idx,
 
 int nfc_genl_se_connectivity(struct nfc_dev *dev, u8 se_idx)
 {
-	struct nfc_se *se;
+	const struct nfc_se *se;
 	struct sk_buff *msg;
 	void *hdr;
 
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
