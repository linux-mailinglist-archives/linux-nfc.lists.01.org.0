Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B34093DB40B
	for <lists+linux-nfc@lfdr.de>; Fri, 30 Jul 2021 08:57:09 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 58112100EB32D;
	Thu, 29 Jul 2021 23:57:05 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 580BC100EB325
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 23:57:03 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 26A653F10B
	for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 06:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627628222;
	bh=y9Uo/os+3OziqdNdxRl0CGuCizZoyhHNVP1pooBGgac=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=uBXvW9MWOczwFySCI4NDwt2ZPDMyW451Vys3Q514BRAhJJ/l4uULjLAFH/iNlLwe8
	 i2Vob0SHAEG/GnyeS/eQ8EYQpMDwBi4BMhTFCPQNGAzsuqwrWHS7vQAlyvxzGhbGSD
	 uDejQS+QeWytxVi7J1JRjYqGdxg06MAZMTYkdl29vyiuOpERjKFqIVwaMzEToyyVPq
	 F0jphNQ40XJDCy5I5GKV9ha2L7n6knRKcvbVH9JDcKmwfg5SgHJCxClv1LlCHiRaGa
	 /jht3jYt87hwT6tj+SO10TABexe4cpu+6L0ZWQ5gW++n4E4SDzxx48eDlC0g5Y0OIM
	 PJ9ZN30j2asbw==
Received: by mail-ed1-f70.google.com with SMTP id l3-20020aa7c3030000b02903bccf1897f9so545648edq.19
        for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 23:57:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y9Uo/os+3OziqdNdxRl0CGuCizZoyhHNVP1pooBGgac=;
        b=R/3ixryl5O4n8MQW8783VPPGw0Yg+HgPAQnKp+GjbLrBvpkFhm5UltqyLq9G1nNYr5
         moVMORDtm+SuNmDazGLqMoiXOeyKgeo66OIgs1/zHy5NmEvWSbp/ajhKxc/mlCoTa7Ud
         hWf84kqUQjCVbXzvnRw38uPwlmW0Qg5OMYnOqaGgJtXawMg2AMHX67kQVaM6T58owcoP
         yYgoS+r5a7QINSrFVzIVsHtkxov10UPGkqfWqpEppzK2kbUhjIw9mn3Cc49b7f0+eCmW
         uJYsIDf7ITjTsacaAlwcEnc7wT6icmRcAw8rF3f7pTQG4cDKfy0NnX63Zu0HwxCR9bRi
         indw==
X-Gm-Message-State: AOAM530UVsuuq6l5sSuacrEDrHgnwRw0QDWAXEN7nwWbS0wwDeKzGdrC
	eiFNZ1vfDD8J5Lu5s+lccfTqisfWGlj7ioHdDo11hDWMuJbDWH7w09DolnsEpr0j6SXL4/lbhQn
	m6Lp41RjH3pjhRWTBnVB2bcn5Bv7wSn0z4Q==
X-Received: by 2002:a17:907:1c21:: with SMTP id nc33mr1135599ejc.436.1627628221831;
        Thu, 29 Jul 2021 23:57:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz89YqE2coEuxrHG66HbiJMUGqlqHkcPyCTLLvJ2b6xbRP9Loj3KGN/HienVTCbi1eYYbPvvQ==
X-Received: by 2002:a17:907:1c21:: with SMTP id nc33mr1135591ejc.436.1627628221721;
        Thu, 29 Jul 2021 23:57:01 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id m9sm238518ejn.91.2021.07.29.23.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 23:57:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 30 Jul 2021 08:56:22 +0200
Message-Id: <20210730065625.34010-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210730065625.34010-1-krzysztof.kozlowski@canonical.com>
References: <20210730065625.34010-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: KW77YRL7SACI56XFT34HO75LZTY247EB
X-Message-ID-Hash: KW77YRL7SACI56XFT34HO75LZTY247EB
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 5/8] nfc: constify local pointer variables
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/KW77YRL7SACI56XFT34HO75LZTY247EB/>
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
