Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AD4425449
	for <lists+linux-nfc@lfdr.de>; Thu,  7 Oct 2021 15:38:26 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 0F8A0100EA938;
	Thu,  7 Oct 2021 06:38:25 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 7B00A100EB842
	for <linux-nfc@lists.01.org>; Thu,  7 Oct 2021 06:38:22 -0700 (PDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B46D63FFD9
	for <linux-nfc@lists.01.org>; Thu,  7 Oct 2021 13:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633613900;
	bh=ndHuIo5nFcldvCZmAPd5aK6MbzHPb0ULZC78XTfsfz0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=ejVACtcB6Lvp3DfFGj1ooxJ6P8DG++Jh07uolRlkXDgyn1vKPZEVOAFwrlDk8NE0W
	 Z27lpvBytF3z0/SFJpxOj1MBb5X/OlWtm5M3XhSkcB1589dyI9IeEsi0iG13c4icBh
	 l1lXkATZCb18++QRKtVnUv+Hd3SIJ1evtxT4kP+kEKnRpfwv5bDquW9Ua+V53c1FIQ
	 CoFQ+fvfLPzlOeWxMD3DknNtmUkriTkyhP1nLok271GMKiwrAEfHliuf2PCwef5yqm
	 qxkeBML8okM393SigaGLLhBy61Xwd93JDOgruC8DO27Gvr/yKCWIzKW0pxwb7DHbHj
	 I6RhLvfKxdaMg==
Received: by mail-ed1-f71.google.com with SMTP id c8-20020a50d648000000b003daa53c7518so5864627edj.21
        for <linux-nfc@lists.01.org>; Thu, 07 Oct 2021 06:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ndHuIo5nFcldvCZmAPd5aK6MbzHPb0ULZC78XTfsfz0=;
        b=yvu9sMKp8U7/KhNmQfB75RmVitvIBC7oY9z9rQS49Y9hMO9zinsFjG7lOg8jMAUqvt
         0DQeUxcUXc7M3dD6JNA/60pcBA84u3FICRQF3Cb1PHiO9vfsJ4Noj7PMV8xRGXEneitP
         JGy7hrCP1Spp3oMhLa9iMPV/GJTcuRuPDOplSW1rUXzRSkSRlqBchpriNOGY03w35SJc
         xFEEMrdFu2Y+HWx6JimRYLHeiTcJ39Upg5GJ8VC6FtMcTBceAGrPJ4A9DNxjGG8fNeCg
         zL5FmqPnOqqSakUHNn3H3bogQKU/0LSzRvBgfpsZrTBa+gBA6oxe/94eNYT+saHLgc+5
         q4bw==
X-Gm-Message-State: AOAM532wScCy5EFASh3WOrdAG/3aJJCQYd2s7KQ3h7wi+ZwS5CB2cObn
	kFAyKxlyfNLXHVQm8HHJOeRmdjpr1ZcKjoGOhUKobvDTVmLlJ/HysmJXtQg9zo67r8pDGNe6hRi
	HLW4oeZ1IIhBLFous6ewAaFCpq5bp23B2lQ==
X-Received: by 2002:a50:9d83:: with SMTP id w3mr6348686ede.305.1633613900232;
        Thu, 07 Oct 2021 06:38:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+2lzbgrpSYf0Bm9+xaq9reHmRjzruQ6CbNPpq0yupA9/X4jgdCPRG3hOW296xgT5Jy74b9g==
X-Received: by 2002:a50:9d83:: with SMTP id w3mr6348661ede.305.1633613900031;
        Thu, 07 Oct 2021 06:38:20 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id ay19sm8585613edb.20.2021.10.07.06.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 06:38:19 -0700 (PDT)
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
Date: Thu,  7 Oct 2021 15:30:15 +0200
Message-Id: <20211007133021.32704-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211007133021.32704-1-krzysztof.kozlowski@canonical.com>
References: <20211007133021.32704-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 2OUPPUDU66J7DVQ2NBKYMM37SLJ5GXAH
X-Message-ID-Hash: 2OUPPUDU66J7DVQ2NBKYMM37SLJ5GXAH
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [RESEND PATCH v2 1/7] nfc: drop unneeded debug prints
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/2OUPPUDU66J7DVQ2NBKYMM37SLJ5GXAH/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

ftrace is a preferred and standard way to debug entering and exiting
functions so drop useless debug prints.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/hci/command.c   | 16 ----------------
 net/nfc/hci/llc_shdlc.c | 12 ------------
 net/nfc/llcp_commands.c |  8 --------
 net/nfc/llcp_core.c     |  5 +----
 net/nfc/nci/core.c      |  4 ----
 net/nfc/nci/hci.c       |  4 ----
 net/nfc/nci/ntf.c       |  9 ---------
 7 files changed, 1 insertion(+), 57 deletions(-)

diff --git a/net/nfc/hci/command.c b/net/nfc/hci/command.c
index 3a89bd9b89fc..af6bacb3ba98 100644
--- a/net/nfc/hci/command.c
+++ b/net/nfc/hci/command.c
@@ -114,8 +114,6 @@ int nfc_hci_send_cmd(struct nfc_hci_dev *hdev, u8 gate, u8 cmd,
 {
 	u8 pipe;
 
-	pr_debug("\n");
-
 	pipe = hdev->gate2pipe[gate];
 	if (pipe == NFC_HCI_INVALID_PIPE)
 		return -EADDRNOTAVAIL;
@@ -130,8 +128,6 @@ int nfc_hci_send_cmd_async(struct nfc_hci_dev *hdev, u8 gate, u8 cmd,
 {
 	u8 pipe;
 
-	pr_debug("\n");
-
 	pipe = hdev->gate2pipe[gate];
 	if (pipe == NFC_HCI_INVALID_PIPE)
 		return -EADDRNOTAVAIL;
@@ -205,8 +201,6 @@ static int nfc_hci_open_pipe(struct nfc_hci_dev *hdev, u8 pipe)
 
 static int nfc_hci_close_pipe(struct nfc_hci_dev *hdev, u8 pipe)
 {
-	pr_debug("\n");
-
 	return nfc_hci_execute_cmd(hdev, pipe, NFC_HCI_ANY_CLOSE_PIPE,
 				   NULL, 0, NULL);
 }
@@ -242,8 +236,6 @@ static u8 nfc_hci_create_pipe(struct nfc_hci_dev *hdev, u8 dest_host,
 
 static int nfc_hci_delete_pipe(struct nfc_hci_dev *hdev, u8 pipe)
 {
-	pr_debug("\n");
-
 	return nfc_hci_execute_cmd(hdev, NFC_HCI_ADMIN_PIPE,
 				   NFC_HCI_ADM_DELETE_PIPE, &pipe, 1, NULL);
 }
@@ -256,8 +248,6 @@ static int nfc_hci_clear_all_pipes(struct nfc_hci_dev *hdev)
 	/* TODO: Find out what the identity reference data is
 	 * and fill param with it. HCI spec 6.1.3.5 */
 
-	pr_debug("\n");
-
 	if (test_bit(NFC_HCI_QUIRK_SHORT_CLEAR, &hdev->quirks))
 		param_len = 0;
 
@@ -271,8 +261,6 @@ int nfc_hci_disconnect_gate(struct nfc_hci_dev *hdev, u8 gate)
 	int r;
 	u8 pipe = hdev->gate2pipe[gate];
 
-	pr_debug("\n");
-
 	if (pipe == NFC_HCI_INVALID_PIPE)
 		return -EADDRNOTAVAIL;
 
@@ -296,8 +284,6 @@ int nfc_hci_disconnect_all_gates(struct nfc_hci_dev *hdev)
 {
 	int r;
 
-	pr_debug("\n");
-
 	r = nfc_hci_clear_all_pipes(hdev);
 	if (r < 0)
 		return r;
@@ -314,8 +300,6 @@ int nfc_hci_connect_gate(struct nfc_hci_dev *hdev, u8 dest_host, u8 dest_gate,
 	bool pipe_created = false;
 	int r;
 
-	pr_debug("\n");
-
 	if (pipe == NFC_HCI_DO_NOT_CREATE_PIPE)
 		return 0;
 
diff --git a/net/nfc/hci/llc_shdlc.c b/net/nfc/hci/llc_shdlc.c
index 71e10347e6a9..e90f70385813 100644
--- a/net/nfc/hci/llc_shdlc.c
+++ b/net/nfc/hci/llc_shdlc.c
@@ -363,8 +363,6 @@ static int llc_shdlc_connect_initiate(const struct llc_shdlc *shdlc)
 {
 	struct sk_buff *skb;
 
-	pr_debug("\n");
-
 	skb = llc_shdlc_alloc_skb(shdlc, 2);
 	if (skb == NULL)
 		return -ENOMEM;
@@ -379,8 +377,6 @@ static int llc_shdlc_connect_send_ua(const struct llc_shdlc *shdlc)
 {
 	struct sk_buff *skb;
 
-	pr_debug("\n");
-
 	skb = llc_shdlc_alloc_skb(shdlc, 0);
 	if (skb == NULL)
 		return -ENOMEM;
@@ -570,8 +566,6 @@ static void llc_shdlc_connect_timeout(struct timer_list *t)
 {
 	struct llc_shdlc *shdlc = from_timer(shdlc, t, connect_timer);
 
-	pr_debug("\n");
-
 	schedule_work(&shdlc->sm_work);
 }
 
@@ -598,8 +592,6 @@ static void llc_shdlc_sm_work(struct work_struct *work)
 	struct llc_shdlc *shdlc = container_of(work, struct llc_shdlc, sm_work);
 	int r;
 
-	pr_debug("\n");
-
 	mutex_lock(&shdlc->state_mutex);
 
 	switch (shdlc->state) {
@@ -681,8 +673,6 @@ static int llc_shdlc_connect(struct llc_shdlc *shdlc)
 {
 	DECLARE_WAIT_QUEUE_HEAD_ONSTACK(connect_wq);
 
-	pr_debug("\n");
-
 	mutex_lock(&shdlc->state_mutex);
 
 	shdlc->state = SHDLC_CONNECTING;
@@ -701,8 +691,6 @@ static int llc_shdlc_connect(struct llc_shdlc *shdlc)
 
 static void llc_shdlc_disconnect(struct llc_shdlc *shdlc)
 {
-	pr_debug("\n");
-
 	mutex_lock(&shdlc->state_mutex);
 
 	shdlc->state = SHDLC_DISCONNECTED;
diff --git a/net/nfc/llcp_commands.c b/net/nfc/llcp_commands.c
index 3c4172a5aeb5..41e3a20c8935 100644
--- a/net/nfc/llcp_commands.c
+++ b/net/nfc/llcp_commands.c
@@ -337,8 +337,6 @@ int nfc_llcp_send_disconnect(struct nfc_llcp_sock *sock)
 	struct nfc_dev *dev;
 	struct nfc_llcp_local *local;
 
-	pr_debug("Sending DISC\n");
-
 	local = sock->local;
 	if (local == NULL)
 		return -ENODEV;
@@ -362,8 +360,6 @@ int nfc_llcp_send_symm(struct nfc_dev *dev)
 	struct nfc_llcp_local *local;
 	u16 size = 0;
 
-	pr_debug("Sending SYMM\n");
-
 	local = nfc_llcp_find_local(dev);
 	if (local == NULL)
 		return -ENODEV;
@@ -399,8 +395,6 @@ int nfc_llcp_send_connect(struct nfc_llcp_sock *sock)
 	u16 size = 0;
 	__be16 miux;
 
-	pr_debug("Sending CONNECT\n");
-
 	local = sock->local;
 	if (local == NULL)
 		return -ENODEV;
@@ -475,8 +469,6 @@ int nfc_llcp_send_cc(struct nfc_llcp_sock *sock)
 	u16 size = 0;
 	__be16 miux;
 
-	pr_debug("Sending CC\n");
-
 	local = sock->local;
 	if (local == NULL)
 		return -ENODEV;
diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index eaeb2b1cfa6a..5ad5157aa9c5 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -45,8 +45,6 @@ static void nfc_llcp_socket_purge(struct nfc_llcp_sock *sock)
 	struct nfc_llcp_local *local = sock->local;
 	struct sk_buff *s, *tmp;
 
-	pr_debug("%p\n", &sock->sk);
-
 	skb_queue_purge(&sock->tx_queue);
 	skb_queue_purge(&sock->tx_pending_queue);
 
@@ -1505,9 +1503,8 @@ void nfc_llcp_recv(void *data, struct sk_buff *skb, int err)
 {
 	struct nfc_llcp_local *local = (struct nfc_llcp_local *) data;
 
-	pr_debug("Received an LLCP PDU\n");
 	if (err < 0) {
-		pr_err("err %d\n", err);
+		pr_err("LLCP PDU receive err %d\n", err);
 		return;
 	}
 
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 82ab39d80726..6fd873aa86be 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -930,8 +930,6 @@ static void nci_deactivate_target(struct nfc_dev *nfc_dev,
 	struct nci_dev *ndev = nfc_get_drvdata(nfc_dev);
 	unsigned long nci_mode = NCI_DEACTIVATE_TYPE_IDLE_MODE;
 
-	pr_debug("entry\n");
-
 	if (!ndev->target_active_prot) {
 		pr_err("unable to deactivate target, no active target\n");
 		return;
@@ -977,8 +975,6 @@ static int nci_dep_link_down(struct nfc_dev *nfc_dev)
 	struct nci_dev *ndev = nfc_get_drvdata(nfc_dev);
 	int rc;
 
-	pr_debug("entry\n");
-
 	if (nfc_dev->rf_mode == NFC_RF_INITIATOR) {
 		nci_deactivate_target(nfc_dev, NULL, NCI_DEACTIVATE_TYPE_IDLE_MODE);
 	} else {
diff --git a/net/nfc/nci/hci.c b/net/nfc/nci/hci.c
index e199912ee1e5..19703a649b5a 100644
--- a/net/nfc/nci/hci.c
+++ b/net/nfc/nci/hci.c
@@ -432,8 +432,6 @@ void nci_hci_data_received_cb(void *context,
 	struct sk_buff *frag_skb;
 	int msg_len;
 
-	pr_debug("\n");
-
 	if (err) {
 		nci_req_complete(ndev, err);
 		return;
@@ -547,8 +545,6 @@ static u8 nci_hci_create_pipe(struct nci_dev *ndev, u8 dest_host,
 
 static int nci_hci_delete_pipe(struct nci_dev *ndev, u8 pipe)
 {
-	pr_debug("\n");
-
 	return nci_hci_send_cmd(ndev, NCI_HCI_ADMIN_GATE,
 				NCI_HCI_ADM_DELETE_PIPE, &pipe, 1, NULL);
 }
diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index c5eacaac41ae..282c51051dcc 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -738,8 +738,6 @@ static void nci_nfcee_discover_ntf_packet(struct nci_dev *ndev,
 	const struct nci_nfcee_discover_ntf *nfcee_ntf =
 				(struct nci_nfcee_discover_ntf *)skb->data;
 
-	pr_debug("\n");
-
 	/* NFCForum NCI 9.2.1 HCI Network Specific Handling
 	 * If the NFCC supports the HCI Network, it SHALL return one,
 	 * and only one, NFCEE_DISCOVER_NTF with a Protocol type of
@@ -751,12 +749,6 @@ static void nci_nfcee_discover_ntf_packet(struct nci_dev *ndev,
 	nci_req_complete(ndev, status);
 }
 
-static void nci_nfcee_action_ntf_packet(struct nci_dev *ndev,
-					const struct sk_buff *skb)
-{
-	pr_debug("\n");
-}
-
 void nci_ntf_packet(struct nci_dev *ndev, struct sk_buff *skb)
 {
 	__u16 ntf_opcode = nci_opcode(skb->data);
@@ -813,7 +805,6 @@ void nci_ntf_packet(struct nci_dev *ndev, struct sk_buff *skb)
 		break;
 
 	case NCI_OP_RF_NFCEE_ACTION_NTF:
-		nci_nfcee_action_ntf_packet(ndev, skb);
 		break;
 
 	default:
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
