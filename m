Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9AA3DBADF
	for <lists+linux-nfc@lfdr.de>; Fri, 30 Jul 2021 16:42:25 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id A78CC100EB856;
	Fri, 30 Jul 2021 07:42:24 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 10267100EB846
	for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 07:42:22 -0700 (PDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id E2B923F22A
	for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 14:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627656140;
	bh=/uZ7GGYjb69fRChDKaIr5owuTWgZmcD786EMnbSXD8g=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=sVPeDc6PJsHLvb6f2Lc+VqpbG5Ily8eb5cV5LyGlJmBkzy1Yf+O54YwRvIw7HCVr+
	 0q4blCO1NUmA8aRuX1J1TljbEWi1ggXC8tTbjXhQfDnLJqzv+1PTfP6QiPBOe2bnOI
	 /Wbn1lK6eYyo7WlIRv8S7cIzxsuxRpL8uVd0TEUngOPzhsilUPYM7xgJ26OQ+iUQUo
	 XppAbu3ayp3fKYV3TLmY8yzzsrl/gZVmAt3HWcStB5od5F0SSsDEIgfhBg3CHWJDlt
	 5iXeHp9oUY/KJo/+GZ60VMYrXIILInM41nM4Maacq/CBfeJjcHo9hGj/dp3513in6M
	 24zutrvrF5w8w==
Received: by mail-ed1-f71.google.com with SMTP id h16-20020aa7de100000b02903a6620f87feso4736718edv.18
        for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 07:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/uZ7GGYjb69fRChDKaIr5owuTWgZmcD786EMnbSXD8g=;
        b=Q6cJ7qAakSBYP+K6k7i1gfxWTMlLe/+XG/oD5H/9ml21SCHQKVgio0gFjMMe3+Izne
         rc8g4xtXaMAPjJqNKntznrVtsQsXsNJhmiQTIRTfXL9/c4n7pk0XAyTKJDRAtatrJpyC
         z6JQt97g8292rZe9PUWJGfgc+s3ZESotOTCYRFBOpJe9eTLwQKI+QF+8X5jCy47rU/q4
         1+rcjqgaxB9Kjwk4daFqHh3LA0TMM5l2X4TgUQsxhW/1lqD78XUDsG1ZbfBXNkcYYH/M
         lF2uMtdrl5t7jPZ4Q79oJYKmW4RSF45yH6M9NVLaWHf+JY7nusHPCUXWvBk8j3DJfFTc
         43IQ==
X-Gm-Message-State: AOAM530blbcX5YLgGRtX//8r/PFhROCByz4CN6w3fdEkNj9ikiKgzRTX
	+fY+MYrARWp9q0bdOvXRDCNfJyYI5Fel+FopPIR1ii/ySJFmDfRxg0/OVXD63G7Umh7v+wTp6bN
	go7BdUQFAo09fBIPnr6vJm16rMCDZSa7Kzg==
X-Received: by 2002:a05:6402:254b:: with SMTP id l11mr3285957edb.157.1627656140453;
        Fri, 30 Jul 2021 07:42:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOjmkrF5MCONiuWmJZJNOYXOAv41T/PMT+CaDUr8f5h4vdfLCZX2y8ydesm0yKKwBQ0qoQpQ==
X-Received: by 2002:a05:6402:254b:: with SMTP id l11mr3285924edb.157.1627656140099;
        Fri, 30 Jul 2021 07:42:20 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id z8sm626325ejd.94.2021.07.30.07.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:42:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 30 Jul 2021 16:42:01 +0200
Message-Id: <20210730144202.255890-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210730144202.255890-1-krzysztof.kozlowski@canonical.com>
References: <20210730144202.255890-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: EJ42IUPZPYZ47KBQHEIVTEWLOLFPG2IZ
X-Message-ID-Hash: EJ42IUPZPYZ47KBQHEIVTEWLOLFPG2IZ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v3 6/7] nfc: nci: constify several pointers to u8, sk_buff and other structs
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/EJ42IUPZPYZ47KBQHEIVTEWLOLFPG2IZ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Several functions receive pointers to u8, sk_buff or other structs but
do not modify the contents so make them const.  This allows doing the
same for local variables and in total makes the code a little bit safer.

This makes const also data passed as "unsigned long opt" argument to
nci_request() function.  Usual flow for such functions is:
1. Receive "u8 *" and store it (the pointer) in a structure
   allocated on stack (e.g. struct nci_set_config_param),
2. Call nci_request() or __nci_request() passing a callback function an
   the pointer to the structure via an "unsigned long opt",
3. nci_request() calls the callback which dereferences "unsigned long
   opt" in a read-only way.

This converts all above paths to use proper pointer to const data, so
entire flow is safer.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 include/net/nfc/nci_core.h | 14 ++++---
 net/nfc/nci/core.c         | 40 +++++++++---------
 net/nfc/nci/data.c         | 12 +++---
 net/nfc/nci/hci.c          | 24 +++++------
 net/nfc/nci/ntf.c          | 83 +++++++++++++++++++++-----------------
 net/nfc/nci/rsp.c          | 46 +++++++++++----------
 net/nfc/nci/spi.c          |  2 +-
 7 files changed, 118 insertions(+), 103 deletions(-)

diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 00f2c60971d7..4770a81f4aa7 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -278,23 +278,25 @@ int nci_request(struct nci_dev *ndev,
 		void (*req)(struct nci_dev *ndev,
 			    unsigned long opt),
 		unsigned long opt, __u32 timeout);
-int nci_prop_cmd(struct nci_dev *ndev, __u8 oid, size_t len, __u8 *payload);
-int nci_core_cmd(struct nci_dev *ndev, __u16 opcode, size_t len, __u8 *payload);
+int nci_prop_cmd(struct nci_dev *ndev, __u8 oid, size_t len,
+		 const __u8 *payload);
+int nci_core_cmd(struct nci_dev *ndev, __u16 opcode, size_t len,
+		 const __u8 *payload);
 int nci_core_reset(struct nci_dev *ndev);
 int nci_core_init(struct nci_dev *ndev);
 
 int nci_recv_frame(struct nci_dev *ndev, struct sk_buff *skb);
 int nci_send_frame(struct nci_dev *ndev, struct sk_buff *skb);
-int nci_set_config(struct nci_dev *ndev, __u8 id, size_t len, __u8 *val);
+int nci_set_config(struct nci_dev *ndev, __u8 id, size_t len, const __u8 *val);
 
 int nci_nfcee_discover(struct nci_dev *ndev, u8 action);
 int nci_nfcee_mode_set(struct nci_dev *ndev, u8 nfcee_id, u8 nfcee_mode);
 int nci_core_conn_create(struct nci_dev *ndev, u8 destination_type,
 			 u8 number_destination_params,
 			 size_t params_len,
-			 struct core_conn_create_dest_spec_params *params);
+			 const struct core_conn_create_dest_spec_params *params);
 int nci_core_conn_close(struct nci_dev *ndev, u8 conn_id);
-int nci_nfcc_loopback(struct nci_dev *ndev, void *data, size_t data_len,
+int nci_nfcc_loopback(struct nci_dev *ndev, const void *data, size_t data_len,
 		      struct sk_buff **resp);
 
 struct nci_hci_dev *nci_hci_allocate(struct nci_dev *ndev);
@@ -378,7 +380,7 @@ void nci_req_complete(struct nci_dev *ndev, int result);
 struct nci_conn_info *nci_get_conn_info_by_conn_id(struct nci_dev *ndev,
 						   int conn_id);
 int nci_get_conn_info_by_dest_type_params(struct nci_dev *ndev, u8 dest_type,
-					  struct dest_spec_params *params);
+					  const struct dest_spec_params *params);
 
 /* ----- NCI status code ----- */
 int nci_to_errno(__u8 code);
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 400d66c4e210..774ddf957388 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -53,9 +53,9 @@ struct nci_conn_info *nci_get_conn_info_by_conn_id(struct nci_dev *ndev,
 }
 
 int nci_get_conn_info_by_dest_type_params(struct nci_dev *ndev, u8 dest_type,
-					  struct dest_spec_params *params)
+					  const struct dest_spec_params *params)
 {
-	struct nci_conn_info *conn_info;
+	const struct nci_conn_info *conn_info;
 
 	list_for_each_entry(conn_info, &ndev->conn_info_list, list) {
 		if (conn_info->dest_type == dest_type) {
@@ -210,14 +210,15 @@ static void nci_init_complete_req(struct nci_dev *ndev, unsigned long opt)
 }
 
 struct nci_set_config_param {
-	__u8	id;
-	size_t	len;
-	__u8	*val;
+	__u8		id;
+	size_t		len;
+	const __u8	*val;
 };
 
 static void nci_set_config_req(struct nci_dev *ndev, unsigned long opt)
 {
-	struct nci_set_config_param *param = (struct nci_set_config_param *)opt;
+	const struct nci_set_config_param *param =
+		(struct nci_set_config_param *)opt;
 	struct nci_core_set_config_cmd cmd;
 
 	BUG_ON(param->len > NCI_MAX_PARAM_LEN);
@@ -237,7 +238,7 @@ struct nci_rf_discover_param {
 
 static void nci_rf_discover_req(struct nci_dev *ndev, unsigned long opt)
 {
-	struct nci_rf_discover_param *param =
+	const struct nci_rf_discover_param *param =
 		(struct nci_rf_discover_param *)opt;
 	struct nci_rf_disc_cmd cmd;
 
@@ -303,7 +304,7 @@ struct nci_rf_discover_select_param {
 
 static void nci_rf_discover_select_req(struct nci_dev *ndev, unsigned long opt)
 {
-	struct nci_rf_discover_select_param *param =
+	const struct nci_rf_discover_select_param *param =
 		(struct nci_rf_discover_select_param *)opt;
 	struct nci_rf_discover_select_cmd cmd;
 
@@ -341,18 +342,18 @@ static void nci_rf_deactivate_req(struct nci_dev *ndev, unsigned long opt)
 struct nci_cmd_param {
 	__u16 opcode;
 	size_t len;
-	__u8 *payload;
+	const __u8 *payload;
 };
 
 static void nci_generic_req(struct nci_dev *ndev, unsigned long opt)
 {
-	struct nci_cmd_param *param =
+	const struct nci_cmd_param *param =
 		(struct nci_cmd_param *)opt;
 
 	nci_send_cmd(ndev, param->opcode, param->len, param->payload);
 }
 
-int nci_prop_cmd(struct nci_dev *ndev, __u8 oid, size_t len, __u8 *payload)
+int nci_prop_cmd(struct nci_dev *ndev, __u8 oid, size_t len, const __u8 *payload)
 {
 	struct nci_cmd_param param;
 
@@ -365,7 +366,8 @@ int nci_prop_cmd(struct nci_dev *ndev, __u8 oid, size_t len, __u8 *payload)
 }
 EXPORT_SYMBOL(nci_prop_cmd);
 
-int nci_core_cmd(struct nci_dev *ndev, __u16 opcode, size_t len, __u8 *payload)
+int nci_core_cmd(struct nci_dev *ndev, __u16 opcode, size_t len,
+		 const __u8 *payload)
 {
 	struct nci_cmd_param param;
 
@@ -399,7 +401,7 @@ struct nci_loopback_data {
 
 static void nci_send_data_req(struct nci_dev *ndev, unsigned long opt)
 {
-	struct nci_loopback_data *data = (struct nci_loopback_data *)opt;
+	const struct nci_loopback_data *data = (struct nci_loopback_data *)opt;
 
 	nci_send_data(ndev, data->conn_id, data->data);
 }
@@ -420,7 +422,7 @@ static void nci_nfcc_loopback_cb(void *context, struct sk_buff *skb, int err)
 	nci_req_complete(ndev, NCI_STATUS_OK);
 }
 
-int nci_nfcc_loopback(struct nci_dev *ndev, void *data, size_t data_len,
+int nci_nfcc_loopback(struct nci_dev *ndev, const void *data, size_t data_len,
 		      struct sk_buff **resp)
 {
 	int r;
@@ -624,7 +626,7 @@ static int nci_dev_down(struct nfc_dev *nfc_dev)
 	return nci_close_device(ndev);
 }
 
-int nci_set_config(struct nci_dev *ndev, __u8 id, size_t len, __u8 *val)
+int nci_set_config(struct nci_dev *ndev, __u8 id, size_t len, const __u8 *val)
 {
 	struct nci_set_config_param param;
 
@@ -659,7 +661,7 @@ EXPORT_SYMBOL(nci_nfcee_discover);
 
 static void nci_nfcee_mode_set_req(struct nci_dev *ndev, unsigned long opt)
 {
-	struct nci_nfcee_mode_set_cmd *cmd =
+	const struct nci_nfcee_mode_set_cmd *cmd =
 					(struct nci_nfcee_mode_set_cmd *)opt;
 
 	nci_send_cmd(ndev, NCI_OP_NFCEE_MODE_SET_CMD,
@@ -681,7 +683,7 @@ EXPORT_SYMBOL(nci_nfcee_mode_set);
 
 static void nci_core_conn_create_req(struct nci_dev *ndev, unsigned long opt)
 {
-	struct core_conn_create_data *data =
+	const struct core_conn_create_data *data =
 					(struct core_conn_create_data *)opt;
 
 	nci_send_cmd(ndev, NCI_OP_CORE_CONN_CREATE_CMD, data->length, data->cmd);
@@ -690,7 +692,7 @@ static void nci_core_conn_create_req(struct nci_dev *ndev, unsigned long opt)
 int nci_core_conn_create(struct nci_dev *ndev, u8 destination_type,
 			 u8 number_destination_params,
 			 size_t params_len,
-			 struct core_conn_create_dest_spec_params *params)
+			 const struct core_conn_create_dest_spec_params *params)
 {
 	int r;
 	struct nci_core_conn_create_cmd *cmd;
@@ -863,7 +865,7 @@ static int nci_activate_target(struct nfc_dev *nfc_dev,
 {
 	struct nci_dev *ndev = nfc_get_drvdata(nfc_dev);
 	struct nci_rf_discover_select_param param;
-	struct nfc_target *nci_target = NULL;
+	const struct nfc_target *nci_target = NULL;
 	int i;
 	int rc = 0;
 
diff --git a/net/nfc/nci/data.c b/net/nfc/nci/data.c
index ce3382be937f..6055dc9a82aa 100644
--- a/net/nfc/nci/data.c
+++ b/net/nfc/nci/data.c
@@ -26,7 +26,7 @@
 void nci_data_exchange_complete(struct nci_dev *ndev, struct sk_buff *skb,
 				__u8 conn_id, int err)
 {
-	struct nci_conn_info    *conn_info;
+	const struct nci_conn_info *conn_info;
 	data_exchange_cb_t cb;
 	void *cb_context;
 
@@ -80,7 +80,7 @@ static inline void nci_push_data_hdr(struct nci_dev *ndev,
 
 int nci_conn_max_data_pkt_payload_size(struct nci_dev *ndev, __u8 conn_id)
 {
-	struct nci_conn_info *conn_info;
+	const struct nci_conn_info *conn_info;
 
 	conn_info = nci_get_conn_info_by_conn_id(ndev, conn_id);
 	if (!conn_info)
@@ -93,9 +93,9 @@ EXPORT_SYMBOL(nci_conn_max_data_pkt_payload_size);
 static int nci_queue_tx_data_frags(struct nci_dev *ndev,
 				   __u8 conn_id,
 				   struct sk_buff *skb) {
-	struct nci_conn_info    *conn_info;
+	const struct nci_conn_info *conn_info;
 	int total_len = skb->len;
-	unsigned char *data = skb->data;
+	const unsigned char *data = skb->data;
 	unsigned long flags;
 	struct sk_buff_head frags_q;
 	struct sk_buff *skb_frag;
@@ -166,7 +166,7 @@ static int nci_queue_tx_data_frags(struct nci_dev *ndev,
 /* Send NCI data */
 int nci_send_data(struct nci_dev *ndev, __u8 conn_id, struct sk_buff *skb)
 {
-	struct nci_conn_info    *conn_info;
+	const struct nci_conn_info *conn_info;
 	int rc = 0;
 
 	pr_debug("conn_id 0x%x, plen %d\n", conn_id, skb->len);
@@ -269,7 +269,7 @@ void nci_rx_data_packet(struct nci_dev *ndev, struct sk_buff *skb)
 	__u8 pbf = nci_pbf(skb->data);
 	__u8 status = 0;
 	__u8 conn_id = nci_conn_id(skb->data);
-	struct nci_conn_info    *conn_info;
+	const struct nci_conn_info *conn_info;
 
 	pr_debug("len %d\n", skb->len);
 
diff --git a/net/nfc/nci/hci.c b/net/nfc/nci/hci.c
index d6732e5e8958..71a306b29735 100644
--- a/net/nfc/nci/hci.c
+++ b/net/nfc/nci/hci.c
@@ -142,7 +142,7 @@ static int nci_hci_send_data(struct nci_dev *ndev, u8 pipe,
 			     const u8 data_type, const u8 *data,
 			     size_t data_len)
 {
-	struct nci_conn_info    *conn_info;
+	const struct nci_conn_info *conn_info;
 	struct sk_buff *skb;
 	int len, i, r;
 	u8 cb = pipe;
@@ -197,7 +197,7 @@ static int nci_hci_send_data(struct nci_dev *ndev, u8 pipe,
 
 static void nci_hci_send_data_req(struct nci_dev *ndev, unsigned long opt)
 {
-	struct nci_data *data = (struct nci_data *)opt;
+	const struct nci_data *data = (struct nci_data *)opt;
 
 	nci_hci_send_data(ndev, data->pipe, data->cmd,
 			  data->data, data->data_len);
@@ -221,8 +221,8 @@ int nci_hci_send_cmd(struct nci_dev *ndev, u8 gate, u8 cmd,
 		     const u8 *param, size_t param_len,
 		     struct sk_buff **skb)
 {
-	struct nci_hcp_message *message;
-	struct nci_conn_info   *conn_info;
+	const struct nci_hcp_message *message;
+	const struct nci_conn_info *conn_info;
 	struct nci_data data;
 	int r;
 	u8 pipe = ndev->hci_dev->gate2pipe[gate];
@@ -406,7 +406,7 @@ static void nci_hci_msg_rx_work(struct work_struct *work)
 	struct nci_hci_dev *hdev =
 		container_of(work, struct nci_hci_dev, msg_rx_work);
 	struct sk_buff *skb;
-	struct nci_hcp_message *message;
+	const struct nci_hcp_message *message;
 	u8 pipe, type, instruction;
 
 	while ((skb = skb_dequeue(&hdev->msg_rx_queue)) != NULL) {
@@ -498,7 +498,7 @@ void nci_hci_data_received_cb(void *context,
 int nci_hci_open_pipe(struct nci_dev *ndev, u8 pipe)
 {
 	struct nci_data data;
-	struct nci_conn_info    *conn_info;
+	const struct nci_conn_info *conn_info;
 
 	conn_info = ndev->hci_dev->conn_info;
 	if (!conn_info)
@@ -523,7 +523,7 @@ static u8 nci_hci_create_pipe(struct nci_dev *ndev, u8 dest_host,
 	u8 pipe;
 	struct sk_buff *skb;
 	struct nci_hci_create_pipe_params params;
-	struct nci_hci_create_pipe_resp *resp;
+	const struct nci_hci_create_pipe_resp *resp;
 
 	pr_debug("gate=%d\n", dest_gate);
 
@@ -557,8 +557,8 @@ static int nci_hci_delete_pipe(struct nci_dev *ndev, u8 pipe)
 int nci_hci_set_param(struct nci_dev *ndev, u8 gate, u8 idx,
 		      const u8 *param, size_t param_len)
 {
-	struct nci_hcp_message *message;
-	struct nci_conn_info *conn_info;
+	const struct nci_hcp_message *message;
+	const struct nci_conn_info *conn_info;
 	struct nci_data data;
 	int r;
 	u8 *tmp;
@@ -605,8 +605,8 @@ EXPORT_SYMBOL(nci_hci_set_param);
 int nci_hci_get_param(struct nci_dev *ndev, u8 gate, u8 idx,
 		      struct sk_buff **skb)
 {
-	struct nci_hcp_message *message;
-	struct nci_conn_info    *conn_info;
+	const struct nci_hcp_message *message;
+	const struct nci_conn_info *conn_info;
 	struct nci_data data;
 	int r;
 	u8 pipe = ndev->hci_dev->gate2pipe[gate];
@@ -697,7 +697,7 @@ EXPORT_SYMBOL(nci_hci_connect_gate);
 
 static int nci_hci_dev_connect_gates(struct nci_dev *ndev,
 				     u8 gate_count,
-				     struct nci_hci_gate *gates)
+				     const struct nci_hci_gate *gates)
 {
 	int r;
 
diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index 98af04c86b2c..d6251363b72b 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -28,10 +28,10 @@
 /* Handle NCI Notification packets */
 
 static void nci_core_reset_ntf_packet(struct nci_dev *ndev,
-				      struct sk_buff *skb)
+				      const struct sk_buff *skb)
 {
 	/* Handle NCI 2.x core reset notification */
-	struct nci_core_reset_ntf *ntf = (void *)skb->data;
+	const struct nci_core_reset_ntf *ntf = (void *)skb->data;
 
 	ndev->nci_ver = ntf->nci_ver;
 	pr_debug("nci_ver 0x%x, config_status 0x%x\n",
@@ -80,7 +80,7 @@ static void nci_core_conn_credits_ntf_packet(struct nci_dev *ndev,
 }
 
 static void nci_core_generic_error_ntf_packet(struct nci_dev *ndev,
-					      struct sk_buff *skb)
+					      const struct sk_buff *skb)
 {
 	__u8 status = skb->data[0];
 
@@ -107,9 +107,10 @@ static void nci_core_conn_intf_error_ntf_packet(struct nci_dev *ndev,
 		nci_data_exchange_complete(ndev, NULL, ntf->conn_id, -EIO);
 }
 
-static __u8 *nci_extract_rf_params_nfca_passive_poll(struct nci_dev *ndev,
-			struct rf_tech_specific_params_nfca_poll *nfca_poll,
-						     __u8 *data)
+static const __u8 *
+nci_extract_rf_params_nfca_passive_poll(struct nci_dev *ndev,
+					struct rf_tech_specific_params_nfca_poll *nfca_poll,
+					const __u8 *data)
 {
 	nfca_poll->sens_res = __le16_to_cpu(*((__le16 *)data));
 	data += 2;
@@ -134,9 +135,10 @@ static __u8 *nci_extract_rf_params_nfca_passive_poll(struct nci_dev *ndev,
 	return data;
 }
 
-static __u8 *nci_extract_rf_params_nfcb_passive_poll(struct nci_dev *ndev,
-			struct rf_tech_specific_params_nfcb_poll *nfcb_poll,
-						     __u8 *data)
+static const __u8 *
+nci_extract_rf_params_nfcb_passive_poll(struct nci_dev *ndev,
+					struct rf_tech_specific_params_nfcb_poll *nfcb_poll,
+					const __u8 *data)
 {
 	nfcb_poll->sensb_res_len = min_t(__u8, *data++, NFC_SENSB_RES_MAXSIZE);
 
@@ -148,9 +150,10 @@ static __u8 *nci_extract_rf_params_nfcb_passive_poll(struct nci_dev *ndev,
 	return data;
 }
 
-static __u8 *nci_extract_rf_params_nfcf_passive_poll(struct nci_dev *ndev,
-			struct rf_tech_specific_params_nfcf_poll *nfcf_poll,
-						     __u8 *data)
+static const __u8 *
+nci_extract_rf_params_nfcf_passive_poll(struct nci_dev *ndev,
+					struct rf_tech_specific_params_nfcf_poll *nfcf_poll,
+					const __u8 *data)
 {
 	nfcf_poll->bit_rate = *data++;
 	nfcf_poll->sensf_res_len = min_t(__u8, *data++, NFC_SENSF_RES_MAXSIZE);
@@ -164,9 +167,10 @@ static __u8 *nci_extract_rf_params_nfcf_passive_poll(struct nci_dev *ndev,
 	return data;
 }
 
-static __u8 *nci_extract_rf_params_nfcv_passive_poll(struct nci_dev *ndev,
-			struct rf_tech_specific_params_nfcv_poll *nfcv_poll,
-						     __u8 *data)
+static const __u8 *
+nci_extract_rf_params_nfcv_passive_poll(struct nci_dev *ndev,
+					struct rf_tech_specific_params_nfcv_poll *nfcv_poll,
+					const __u8 *data)
 {
 	++data;
 	nfcv_poll->dsfid = *data++;
@@ -175,9 +179,10 @@ static __u8 *nci_extract_rf_params_nfcv_passive_poll(struct nci_dev *ndev,
 	return data;
 }
 
-static __u8 *nci_extract_rf_params_nfcf_passive_listen(struct nci_dev *ndev,
-			struct rf_tech_specific_params_nfcf_listen *nfcf_listen,
-						     __u8 *data)
+static const __u8 *
+nci_extract_rf_params_nfcf_passive_listen(struct nci_dev *ndev,
+					  struct rf_tech_specific_params_nfcf_listen *nfcf_listen,
+					  const __u8 *data)
 {
 	nfcf_listen->local_nfcid2_len = min_t(__u8, *data++,
 					      NFC_NFCID2_MAXSIZE);
@@ -198,12 +203,12 @@ static int nci_add_new_protocol(struct nci_dev *ndev,
 				struct nfc_target *target,
 				__u8 rf_protocol,
 				__u8 rf_tech_and_mode,
-				void *params)
+				const void *params)
 {
-	struct rf_tech_specific_params_nfca_poll *nfca_poll;
-	struct rf_tech_specific_params_nfcb_poll *nfcb_poll;
-	struct rf_tech_specific_params_nfcf_poll *nfcf_poll;
-	struct rf_tech_specific_params_nfcv_poll *nfcv_poll;
+	const struct rf_tech_specific_params_nfca_poll *nfca_poll;
+	const struct rf_tech_specific_params_nfcb_poll *nfcb_poll;
+	const struct rf_tech_specific_params_nfcf_poll *nfcf_poll;
+	const struct rf_tech_specific_params_nfcv_poll *nfcv_poll;
 	__u32 protocol;
 
 	if (rf_protocol == NCI_RF_PROTOCOL_T1T)
@@ -274,7 +279,7 @@ static int nci_add_new_protocol(struct nci_dev *ndev,
 }
 
 static void nci_add_new_target(struct nci_dev *ndev,
-			       struct nci_rf_discover_ntf *ntf)
+			       const struct nci_rf_discover_ntf *ntf)
 {
 	struct nfc_target *target;
 	int i, rc;
@@ -319,10 +324,10 @@ void nci_clear_target_list(struct nci_dev *ndev)
 }
 
 static void nci_rf_discover_ntf_packet(struct nci_dev *ndev,
-				       struct sk_buff *skb)
+				       const struct sk_buff *skb)
 {
 	struct nci_rf_discover_ntf ntf;
-	__u8 *data = skb->data;
+	const __u8 *data = skb->data;
 	bool add_target = true;
 
 	ntf.rf_discovery_id = *data++;
@@ -382,7 +387,8 @@ static void nci_rf_discover_ntf_packet(struct nci_dev *ndev,
 }
 
 static int nci_extract_activation_params_iso_dep(struct nci_dev *ndev,
-			struct nci_rf_intf_activated_ntf *ntf, __u8 *data)
+						 struct nci_rf_intf_activated_ntf *ntf,
+						 const __u8 *data)
 {
 	struct activation_params_nfca_poll_iso_dep *nfca_poll;
 	struct activation_params_nfcb_poll_iso_dep *nfcb_poll;
@@ -418,7 +424,8 @@ static int nci_extract_activation_params_iso_dep(struct nci_dev *ndev,
 }
 
 static int nci_extract_activation_params_nfc_dep(struct nci_dev *ndev,
-			struct nci_rf_intf_activated_ntf *ntf, __u8 *data)
+						 struct nci_rf_intf_activated_ntf *ntf,
+						 const __u8 *data)
 {
 	struct activation_params_poll_nfc_dep *poll;
 	struct activation_params_listen_nfc_dep *listen;
@@ -454,7 +461,7 @@ static int nci_extract_activation_params_nfc_dep(struct nci_dev *ndev,
 }
 
 static void nci_target_auto_activated(struct nci_dev *ndev,
-				      struct nci_rf_intf_activated_ntf *ntf)
+				      const struct nci_rf_intf_activated_ntf *ntf)
 {
 	struct nfc_target *target;
 	int rc;
@@ -477,7 +484,7 @@ static void nci_target_auto_activated(struct nci_dev *ndev,
 }
 
 static int nci_store_general_bytes_nfc_dep(struct nci_dev *ndev,
-		struct nci_rf_intf_activated_ntf *ntf)
+					   const struct nci_rf_intf_activated_ntf *ntf)
 {
 	ndev->remote_gb_len = 0;
 
@@ -519,11 +526,11 @@ static int nci_store_general_bytes_nfc_dep(struct nci_dev *ndev,
 }
 
 static void nci_rf_intf_activated_ntf_packet(struct nci_dev *ndev,
-					     struct sk_buff *skb)
+					     const struct sk_buff *skb)
 {
 	struct nci_conn_info    *conn_info;
 	struct nci_rf_intf_activated_ntf ntf;
-	__u8 *data = skb->data;
+	const __u8 *data = skb->data;
 	int err = NCI_STATUS_OK;
 
 	ntf.rf_discovery_id = *data++;
@@ -681,10 +688,10 @@ static void nci_rf_intf_activated_ntf_packet(struct nci_dev *ndev,
 }
 
 static void nci_rf_deactivate_ntf_packet(struct nci_dev *ndev,
-					 struct sk_buff *skb)
+					 const struct sk_buff *skb)
 {
-	struct nci_conn_info    *conn_info;
-	struct nci_rf_deactivate_ntf *ntf = (void *) skb->data;
+	const struct nci_conn_info *conn_info;
+	const struct nci_rf_deactivate_ntf *ntf = (void *)skb->data;
 
 	pr_debug("entry, type 0x%x, reason 0x%x\n", ntf->type, ntf->reason);
 
@@ -725,10 +732,10 @@ static void nci_rf_deactivate_ntf_packet(struct nci_dev *ndev,
 }
 
 static void nci_nfcee_discover_ntf_packet(struct nci_dev *ndev,
-					  struct sk_buff *skb)
+					  const struct sk_buff *skb)
 {
 	u8 status = NCI_STATUS_OK;
-	struct nci_nfcee_discover_ntf   *nfcee_ntf =
+	const struct nci_nfcee_discover_ntf *nfcee_ntf =
 				(struct nci_nfcee_discover_ntf *)skb->data;
 
 	pr_debug("\n");
@@ -745,7 +752,7 @@ static void nci_nfcee_discover_ntf_packet(struct nci_dev *ndev,
 }
 
 static void nci_nfcee_action_ntf_packet(struct nci_dev *ndev,
-					struct sk_buff *skb)
+					const struct sk_buff *skb)
 {
 	pr_debug("\n");
 }
diff --git a/net/nfc/nci/rsp.c b/net/nfc/nci/rsp.c
index e9605922a322..dbb0b55a1757 100644
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@ -25,9 +25,10 @@
 
 /* Handle NCI Response packets */
 
-static void nci_core_reset_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
+static void nci_core_reset_rsp_packet(struct nci_dev *ndev,
+				      const struct sk_buff *skb)
 {
-	struct nci_core_reset_rsp *rsp = (void *) skb->data;
+	const struct nci_core_reset_rsp *rsp = (void *)skb->data;
 
 	pr_debug("status 0x%x\n", rsp->status);
 
@@ -43,10 +44,11 @@ static void nci_core_reset_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
 	}
 }
 
-static u8 nci_core_init_rsp_packet_v1(struct nci_dev *ndev, struct sk_buff *skb)
+static u8 nci_core_init_rsp_packet_v1(struct nci_dev *ndev,
+				      const struct sk_buff *skb)
 {
-	struct nci_core_init_rsp_1 *rsp_1 = (void *) skb->data;
-	struct nci_core_init_rsp_2 *rsp_2;
+	const struct nci_core_init_rsp_1 *rsp_1 = (void *)skb->data;
+	const struct nci_core_init_rsp_2 *rsp_2;
 
 	pr_debug("status 0x%x\n", rsp_1->status);
 
@@ -81,10 +83,11 @@ static u8 nci_core_init_rsp_packet_v1(struct nci_dev *ndev, struct sk_buff *skb)
 	return NCI_STATUS_OK;
 }
 
-static u8 nci_core_init_rsp_packet_v2(struct nci_dev *ndev, struct sk_buff *skb)
+static u8 nci_core_init_rsp_packet_v2(struct nci_dev *ndev,
+				      const struct sk_buff *skb)
 {
-	struct nci_core_init_rsp_nci_ver2 *rsp = (void *)skb->data;
-	u8 *supported_rf_interface = rsp->supported_rf_interfaces;
+	const struct nci_core_init_rsp_nci_ver2 *rsp = (void *)skb->data;
+	const u8 *supported_rf_interface = rsp->supported_rf_interfaces;
 	u8 rf_interface_idx = 0;
 	u8 rf_extension_cnt = 0;
 
@@ -118,7 +121,7 @@ static u8 nci_core_init_rsp_packet_v2(struct nci_dev *ndev, struct sk_buff *skb)
 	return NCI_STATUS_OK;
 }
 
-static void nci_core_init_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
+static void nci_core_init_rsp_packet(struct nci_dev *ndev, const struct sk_buff *skb)
 {
 	u8 status = 0;
 
@@ -160,9 +163,9 @@ static void nci_core_init_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
 }
 
 static void nci_core_set_config_rsp_packet(struct nci_dev *ndev,
-					   struct sk_buff *skb)
+					   const struct sk_buff *skb)
 {
-	struct nci_core_set_config_rsp *rsp = (void *) skb->data;
+	const struct nci_core_set_config_rsp *rsp = (void *)skb->data;
 
 	pr_debug("status 0x%x\n", rsp->status);
 
@@ -170,7 +173,7 @@ static void nci_core_set_config_rsp_packet(struct nci_dev *ndev,
 }
 
 static void nci_rf_disc_map_rsp_packet(struct nci_dev *ndev,
-				       struct sk_buff *skb)
+				       const struct sk_buff *skb)
 {
 	__u8 status = skb->data[0];
 
@@ -179,7 +182,8 @@ static void nci_rf_disc_map_rsp_packet(struct nci_dev *ndev,
 	nci_req_complete(ndev, status);
 }
 
-static void nci_rf_disc_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
+static void nci_rf_disc_rsp_packet(struct nci_dev *ndev,
+				   const struct sk_buff *skb)
 {
 	struct nci_conn_info    *conn_info;
 	__u8 status = skb->data[0];
@@ -210,7 +214,7 @@ static void nci_rf_disc_rsp_packet(struct nci_dev *ndev, struct sk_buff *skb)
 }
 
 static void nci_rf_disc_select_rsp_packet(struct nci_dev *ndev,
-					  struct sk_buff *skb)
+					  const struct sk_buff *skb)
 {
 	__u8 status = skb->data[0];
 
@@ -222,7 +226,7 @@ static void nci_rf_disc_select_rsp_packet(struct nci_dev *ndev,
 }
 
 static void nci_rf_deactivate_rsp_packet(struct nci_dev *ndev,
-					 struct sk_buff *skb)
+					 const struct sk_buff *skb)
 {
 	__u8 status = skb->data[0];
 
@@ -238,9 +242,9 @@ static void nci_rf_deactivate_rsp_packet(struct nci_dev *ndev,
 }
 
 static void nci_nfcee_discover_rsp_packet(struct nci_dev *ndev,
-					  struct sk_buff *skb)
+					  const struct sk_buff *skb)
 {
-	struct nci_nfcee_discover_rsp *discover_rsp;
+	const struct nci_nfcee_discover_rsp *discover_rsp;
 
 	if (skb->len != 2) {
 		nci_req_complete(ndev, NCI_STATUS_NFCEE_PROTOCOL_ERROR);
@@ -255,7 +259,7 @@ static void nci_nfcee_discover_rsp_packet(struct nci_dev *ndev,
 }
 
 static void nci_nfcee_mode_set_rsp_packet(struct nci_dev *ndev,
-					  struct sk_buff *skb)
+					  const struct sk_buff *skb)
 {
 	__u8 status = skb->data[0];
 
@@ -264,11 +268,11 @@ static void nci_nfcee_mode_set_rsp_packet(struct nci_dev *ndev,
 }
 
 static void nci_core_conn_create_rsp_packet(struct nci_dev *ndev,
-					    struct sk_buff *skb)
+					    const struct sk_buff *skb)
 {
 	__u8 status = skb->data[0];
 	struct nci_conn_info *conn_info = NULL;
-	struct nci_core_conn_create_rsp *rsp;
+	const struct nci_core_conn_create_rsp *rsp;
 
 	pr_debug("status 0x%x\n", status);
 
@@ -319,7 +323,7 @@ static void nci_core_conn_create_rsp_packet(struct nci_dev *ndev,
 }
 
 static void nci_core_conn_close_rsp_packet(struct nci_dev *ndev,
-					   struct sk_buff *skb)
+					   const struct sk_buff *skb)
 {
 	struct nci_conn_info *conn_info;
 	__u8 status = skb->data[0];
diff --git a/net/nfc/nci/spi.c b/net/nfc/nci/spi.c
index 7d8e10e27c20..0935527d1d12 100644
--- a/net/nfc/nci/spi.c
+++ b/net/nfc/nci/spi.c
@@ -27,7 +27,7 @@
 
 #define CRC_INIT		0xFFFF
 
-static int __nci_spi_send(struct nci_spi *nspi, struct sk_buff *skb,
+static int __nci_spi_send(struct nci_spi *nspi, const struct sk_buff *skb,
 			  int cs_change)
 {
 	struct spi_message m;
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
