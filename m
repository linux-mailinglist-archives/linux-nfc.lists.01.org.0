Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 246DE3DC593
	for <lists+linux-nfc@lfdr.de>; Sat, 31 Jul 2021 12:22:01 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 8C928100EBBD9;
	Sat, 31 Jul 2021 03:21:58 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 8068A100EBBBD
	for <linux-nfc@lists.01.org>; Sat, 31 Jul 2021 03:21:55 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 31D833F22A
	for <linux-nfc@lists.01.org>; Sat, 31 Jul 2021 10:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627726913;
	bh=ltYbfqvbRro/k7U4AnnyPJDfBJIDJtfs3AYgaRXxzh8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=oeGdb7a0LTC12Y67HxTTVFvzEkbFtdRiMMbOd3INgwFO9SwbAZEuUn5lFVIQh+mjB
	 ikjxIHoTpGBFQvxyw9gxfoMEQyEQU5A2yqgHfkuYt1jW/aRARRC9SoKX1W8eqRMxkm
	 VdYY5spCmAGtZky6uftBqBSHJrBbV/oHAY6OazuXnG4DCdtI/DYPWr3S1y93J7IaJN
	 3h//xq23tYnjv/A0Cf30sUOQNYyhSUSetX2XvGoRub7U0NH0ImDbtTYzYvTRvmdI+k
	 whOyr1EY8nBoFyfmNtNLQXWXPgr8D1zlhplNM9cxZi8bSmFgrvRA22TQ/pmaxsCGLm
	 pkOj+OlG/e8PQ==
Received: by mail-ed1-f70.google.com with SMTP id b88-20020a509f610000b02903ab1f22e1dcso5951693edf.23
        for <linux-nfc@lists.01.org>; Sat, 31 Jul 2021 03:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ltYbfqvbRro/k7U4AnnyPJDfBJIDJtfs3AYgaRXxzh8=;
        b=RqwA1N4s8iTJKPS49vLCCWV5nvOz8i3oMyPDwnPVOszPW/pW131WR289dXIFdGbHY2
         Or8mGH9kQBMt+k8qrqjUZmDYHc/MtzeEhpM2NPmeJpTR0LbWa1mq+YInHYKyYaCSctGg
         +cg6NDsy/prnpKkD4we13Lvbw20VhtGaT6XPaZQ8d450j31/OykQQwUyBjFinJxXYKRf
         Bvu/daocvKIeqdLX85fdn/NOPc+85OKmQQ70QCb17PoO/2MDpLzPOiEuoT70yhgdxLvA
         kcA702dGY7w69vioo/l2wJp7uF3hSUJ3oxT3BdOrFG+i3RWQcfnelb2RHceimdMY+5IA
         HsiA==
X-Gm-Message-State: AOAM532jTvYdlC6+yZ9kvHeHpLe7J0SKlM+uWRbKTvMOi3p15Zvb/dhc
	QTscdYnUTIW+/SbWqQXFxNeP2xBpxE+/OXt8bcOGn0CkMeLxHP12AMDrL/CeeL/K7gVOKarTo2j
	VUbA1U2v71Tme43KxTUzPIPS+el1mbbL2EA==
X-Received: by 2002:a17:906:6009:: with SMTP id o9mr6921498ejj.266.1627726912119;
        Sat, 31 Jul 2021 03:21:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJya8Lz/ENyVCD/m31OsS+lVS97MVl9IeTTCY2l/Mhg7adWoz4GGv3wliUUDixDrWZxxXj2f9g==
X-Received: by 2002:a17:906:6009:: with SMTP id o9mr6921481ejj.266.1627726911766;
        Sat, 31 Jul 2021 03:21:51 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id b19sm2026736edt.53.2021.07.31.03.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 03:21:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Bongsu Jeon <bongsu.jeon@samsung.com>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Sat, 31 Jul 2021 12:21:44 +0200
Message-Id: <20210731102144.57764-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Message-ID-Hash: WTKV3OGDXPDMQRUS6AXIGATX47XXUM66
X-Message-ID-Hash: WTKV3OGDXPDMQRUS6AXIGATX47XXUM66
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v3] nfc: hci: pass callback data param as pointer in nci_request()
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/WTKV3OGDXPDMQRUS6AXIGATX47XXUM66/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The nci_request() receives a callback function and unsigned long data
argument "opt" which is passed to the callback.  Almost all of the
nci_request() callers pass pointer to a stack variable as data argument.
Only few pass scalar value (e.g. u8).

All such callbacks do not modify passed data argument and in previous
commit they were made as const.  However passing pointers via unsigned
long removes the const annotation.  The callback could simply cast
unsigned long to a pointer to writeable memory.

Use "const void *" as type of this "opt" argument to solve this and
prevent modifying the pointed contents.  This is also consistent with
generic pattern of passing data arguments - via "void *".  In few places
which pass scalar values, use casts via "unsigned long" to suppress any
warnings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v2:
1. Cast all constants to (void *) to avoid sparse warning "warning:
   Using plain integer as NULL pointer"
---
 include/net/nfc/nci_core.h |   4 +-
 net/nfc/nci/core.c         | 119 ++++++++++++++++++-------------------
 net/nfc/nci/hci.c          |  16 +++--
 3 files changed, 67 insertions(+), 72 deletions(-)

diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 4770a81f4aa7..a964daedc17b 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -276,8 +276,8 @@ int nci_register_device(struct nci_dev *ndev);
 void nci_unregister_device(struct nci_dev *ndev);
 int nci_request(struct nci_dev *ndev,
 		void (*req)(struct nci_dev *ndev,
-			    unsigned long opt),
-		unsigned long opt, __u32 timeout);
+			    const void *opt),
+		const void *opt, __u32 timeout);
 int nci_prop_cmd(struct nci_dev *ndev, __u8 oid, size_t len,
 		 const __u8 *payload);
 int nci_core_cmd(struct nci_dev *ndev, __u16 opcode, size_t len,
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 80a5c2a8e9fa..82ab39d80726 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -95,8 +95,8 @@ static void nci_req_cancel(struct nci_dev *ndev, int err)
 
 /* Execute request and wait for completion. */
 static int __nci_request(struct nci_dev *ndev,
-			 void (*req)(struct nci_dev *ndev, unsigned long opt),
-			 unsigned long opt, __u32 timeout)
+			 void (*req)(struct nci_dev *ndev, const void *opt),
+			 const void *opt, __u32 timeout)
 {
 	int rc = 0;
 	long completion_rc;
@@ -139,8 +139,8 @@ static int __nci_request(struct nci_dev *ndev,
 
 inline int nci_request(struct nci_dev *ndev,
 		       void (*req)(struct nci_dev *ndev,
-				   unsigned long opt),
-		       unsigned long opt, __u32 timeout)
+				   const void *opt),
+		       const void *opt, __u32 timeout)
 {
 	int rc;
 
@@ -155,7 +155,7 @@ inline int nci_request(struct nci_dev *ndev,
 	return rc;
 }
 
-static void nci_reset_req(struct nci_dev *ndev, unsigned long opt)
+static void nci_reset_req(struct nci_dev *ndev, const void *opt)
 {
 	struct nci_core_reset_cmd cmd;
 
@@ -163,17 +163,17 @@ static void nci_reset_req(struct nci_dev *ndev, unsigned long opt)
 	nci_send_cmd(ndev, NCI_OP_CORE_RESET_CMD, 1, &cmd);
 }
 
-static void nci_init_req(struct nci_dev *ndev, unsigned long opt)
+static void nci_init_req(struct nci_dev *ndev, const void *opt)
 {
 	u8 plen = 0;
 
 	if (opt)
 		plen = sizeof(struct nci_core_init_v2_cmd);
 
-	nci_send_cmd(ndev, NCI_OP_CORE_INIT_CMD, plen, (void *)opt);
+	nci_send_cmd(ndev, NCI_OP_CORE_INIT_CMD, plen, opt);
 }
 
-static void nci_init_complete_req(struct nci_dev *ndev, unsigned long opt)
+static void nci_init_complete_req(struct nci_dev *ndev, const void *opt)
 {
 	struct nci_rf_disc_map_cmd cmd;
 	struct disc_map_config *cfg = cmd.mapping_configs;
@@ -215,10 +215,9 @@ struct nci_set_config_param {
 	const __u8	*val;
 };
 
-static void nci_set_config_req(struct nci_dev *ndev, unsigned long opt)
+static void nci_set_config_req(struct nci_dev *ndev, const void *opt)
 {
-	const struct nci_set_config_param *param =
-		(struct nci_set_config_param *)opt;
+	const struct nci_set_config_param *param = opt;
 	struct nci_core_set_config_cmd cmd;
 
 	BUG_ON(param->len > NCI_MAX_PARAM_LEN);
@@ -236,10 +235,9 @@ struct nci_rf_discover_param {
 	__u32	tm_protocols;
 };
 
-static void nci_rf_discover_req(struct nci_dev *ndev, unsigned long opt)
+static void nci_rf_discover_req(struct nci_dev *ndev, const void *opt)
 {
-	const struct nci_rf_discover_param *param =
-		(struct nci_rf_discover_param *)opt;
+	const struct nci_rf_discover_param *param = opt;
 	struct nci_rf_disc_cmd cmd;
 
 	cmd.num_disc_configs = 0;
@@ -302,10 +300,9 @@ struct nci_rf_discover_select_param {
 	__u8	rf_protocol;
 };
 
-static void nci_rf_discover_select_req(struct nci_dev *ndev, unsigned long opt)
+static void nci_rf_discover_select_req(struct nci_dev *ndev, const void *opt)
 {
-	const struct nci_rf_discover_select_param *param =
-		(struct nci_rf_discover_select_param *)opt;
+	const struct nci_rf_discover_select_param *param = opt;
 	struct nci_rf_discover_select_cmd cmd;
 
 	cmd.rf_discovery_id = param->rf_discovery_id;
@@ -329,11 +326,11 @@ static void nci_rf_discover_select_req(struct nci_dev *ndev, unsigned long opt)
 		     sizeof(struct nci_rf_discover_select_cmd), &cmd);
 }
 
-static void nci_rf_deactivate_req(struct nci_dev *ndev, unsigned long opt)
+static void nci_rf_deactivate_req(struct nci_dev *ndev, const void *opt)
 {
 	struct nci_rf_deactivate_cmd cmd;
 
-	cmd.type = opt;
+	cmd.type = (unsigned long)opt;
 
 	nci_send_cmd(ndev, NCI_OP_RF_DEACTIVATE_CMD,
 		     sizeof(struct nci_rf_deactivate_cmd), &cmd);
@@ -345,10 +342,9 @@ struct nci_cmd_param {
 	const __u8 *payload;
 };
 
-static void nci_generic_req(struct nci_dev *ndev, unsigned long opt)
+static void nci_generic_req(struct nci_dev *ndev, const void *opt)
 {
-	const struct nci_cmd_param *param =
-		(struct nci_cmd_param *)opt;
+	const struct nci_cmd_param *param = opt;
 
 	nci_send_cmd(ndev, param->opcode, param->len, param->payload);
 }
@@ -361,7 +357,7 @@ int nci_prop_cmd(struct nci_dev *ndev, __u8 oid, size_t len, const __u8 *payload
 	param.len = len;
 	param.payload = payload;
 
-	return __nci_request(ndev, nci_generic_req, (unsigned long)&param,
+	return __nci_request(ndev, nci_generic_req, &param,
 			     msecs_to_jiffies(NCI_CMD_TIMEOUT));
 }
 EXPORT_SYMBOL(nci_prop_cmd);
@@ -375,21 +371,21 @@ int nci_core_cmd(struct nci_dev *ndev, __u16 opcode, size_t len,
 	param.len = len;
 	param.payload = payload;
 
-	return __nci_request(ndev, nci_generic_req, (unsigned long)&param,
+	return __nci_request(ndev, nci_generic_req, &param,
 			     msecs_to_jiffies(NCI_CMD_TIMEOUT));
 }
 EXPORT_SYMBOL(nci_core_cmd);
 
 int nci_core_reset(struct nci_dev *ndev)
 {
-	return __nci_request(ndev, nci_reset_req, 0,
+	return __nci_request(ndev, nci_reset_req, (void *)0,
 			     msecs_to_jiffies(NCI_RESET_TIMEOUT));
 }
 EXPORT_SYMBOL(nci_core_reset);
 
 int nci_core_init(struct nci_dev *ndev)
 {
-	return __nci_request(ndev, nci_init_req, 0,
+	return __nci_request(ndev, nci_init_req, (void *)0,
 			     msecs_to_jiffies(NCI_INIT_TIMEOUT));
 }
 EXPORT_SYMBOL(nci_core_init);
@@ -399,9 +395,9 @@ struct nci_loopback_data {
 	struct sk_buff *data;
 };
 
-static void nci_send_data_req(struct nci_dev *ndev, unsigned long opt)
+static void nci_send_data_req(struct nci_dev *ndev, const void *opt)
 {
-	const struct nci_loopback_data *data = (struct nci_loopback_data *)opt;
+	const struct nci_loopback_data *data = opt;
 
 	nci_send_data(ndev, data->conn_id, data->data);
 }
@@ -462,7 +458,7 @@ int nci_nfcc_loopback(struct nci_dev *ndev, const void *data, size_t data_len,
 	loopback_data.data = skb;
 
 	ndev->cur_conn_id = conn_id;
-	r = nci_request(ndev, nci_send_data_req, (unsigned long)&loopback_data,
+	r = nci_request(ndev, nci_send_data_req, &loopback_data,
 			msecs_to_jiffies(NCI_DATA_TIMEOUT));
 	if (r == NCI_STATUS_OK && resp)
 		*resp = conn_info->rx_skb;
@@ -495,7 +491,7 @@ static int nci_open_device(struct nci_dev *ndev)
 		rc = ndev->ops->init(ndev);
 
 	if (!rc) {
-		rc = __nci_request(ndev, nci_reset_req, 0,
+		rc = __nci_request(ndev, nci_reset_req, (void *)0,
 				   msecs_to_jiffies(NCI_RESET_TIMEOUT));
 	}
 
@@ -508,10 +504,10 @@ static int nci_open_device(struct nci_dev *ndev)
 			.feature1 = NCI_FEATURE_DISABLE,
 			.feature2 = NCI_FEATURE_DISABLE
 		};
-		unsigned long opt = 0;
+		const void *opt = NULL;
 
 		if (ndev->nci_ver & NCI_VER_2_MASK)
-			opt = (unsigned long)&nci_init_v2_cmd;
+			opt = &nci_init_v2_cmd;
 
 		rc = __nci_request(ndev, nci_init_req, opt,
 				   msecs_to_jiffies(NCI_INIT_TIMEOUT));
@@ -521,7 +517,7 @@ static int nci_open_device(struct nci_dev *ndev)
 		rc = ndev->ops->post_setup(ndev);
 
 	if (!rc) {
-		rc = __nci_request(ndev, nci_init_complete_req, 0,
+		rc = __nci_request(ndev, nci_init_complete_req, (void *)0,
 				   msecs_to_jiffies(NCI_INIT_TIMEOUT));
 	}
 
@@ -571,7 +567,7 @@ static int nci_close_device(struct nci_dev *ndev)
 	atomic_set(&ndev->cmd_cnt, 1);
 
 	set_bit(NCI_INIT, &ndev->flags);
-	__nci_request(ndev, nci_reset_req, 0,
+	__nci_request(ndev, nci_reset_req, (void *)0,
 		      msecs_to_jiffies(NCI_RESET_TIMEOUT));
 
 	/* After this point our queues are empty
@@ -637,15 +633,15 @@ int nci_set_config(struct nci_dev *ndev, __u8 id, size_t len, const __u8 *val)
 	param.len = len;
 	param.val = val;
 
-	return __nci_request(ndev, nci_set_config_req, (unsigned long)&param,
+	return __nci_request(ndev, nci_set_config_req, &param,
 			     msecs_to_jiffies(NCI_SET_CONFIG_TIMEOUT));
 }
 EXPORT_SYMBOL(nci_set_config);
 
-static void nci_nfcee_discover_req(struct nci_dev *ndev, unsigned long opt)
+static void nci_nfcee_discover_req(struct nci_dev *ndev, const void *opt)
 {
 	struct nci_nfcee_discover_cmd cmd;
-	__u8 action = opt;
+	__u8 action = (unsigned long)opt;
 
 	cmd.discovery_action = action;
 
@@ -654,15 +650,16 @@ static void nci_nfcee_discover_req(struct nci_dev *ndev, unsigned long opt)
 
 int nci_nfcee_discover(struct nci_dev *ndev, u8 action)
 {
-	return __nci_request(ndev, nci_nfcee_discover_req, action,
+	unsigned long opt = action;
+
+	return __nci_request(ndev, nci_nfcee_discover_req, (void *)opt,
 				msecs_to_jiffies(NCI_CMD_TIMEOUT));
 }
 EXPORT_SYMBOL(nci_nfcee_discover);
 
-static void nci_nfcee_mode_set_req(struct nci_dev *ndev, unsigned long opt)
+static void nci_nfcee_mode_set_req(struct nci_dev *ndev, const void *opt)
 {
-	const struct nci_nfcee_mode_set_cmd *cmd =
-					(struct nci_nfcee_mode_set_cmd *)opt;
+	const struct nci_nfcee_mode_set_cmd *cmd = opt;
 
 	nci_send_cmd(ndev, NCI_OP_NFCEE_MODE_SET_CMD,
 		     sizeof(struct nci_nfcee_mode_set_cmd), cmd);
@@ -675,16 +672,14 @@ int nci_nfcee_mode_set(struct nci_dev *ndev, u8 nfcee_id, u8 nfcee_mode)
 	cmd.nfcee_id = nfcee_id;
 	cmd.nfcee_mode = nfcee_mode;
 
-	return __nci_request(ndev, nci_nfcee_mode_set_req,
-			     (unsigned long)&cmd,
+	return __nci_request(ndev, nci_nfcee_mode_set_req, &cmd,
 			     msecs_to_jiffies(NCI_CMD_TIMEOUT));
 }
 EXPORT_SYMBOL(nci_nfcee_mode_set);
 
-static void nci_core_conn_create_req(struct nci_dev *ndev, unsigned long opt)
+static void nci_core_conn_create_req(struct nci_dev *ndev, const void *opt)
 {
-	const struct core_conn_create_data *data =
-					(struct core_conn_create_data *)opt;
+	const struct core_conn_create_data *data = opt;
 
 	nci_send_cmd(ndev, NCI_OP_CORE_CONN_CREATE_CMD, data->length, data->cmd);
 }
@@ -721,24 +716,26 @@ int nci_core_conn_create(struct nci_dev *ndev, u8 destination_type,
 	}
 	ndev->cur_dest_type = destination_type;
 
-	r = __nci_request(ndev, nci_core_conn_create_req, (unsigned long)&data,
+	r = __nci_request(ndev, nci_core_conn_create_req, &data,
 			  msecs_to_jiffies(NCI_CMD_TIMEOUT));
 	kfree(cmd);
 	return r;
 }
 EXPORT_SYMBOL(nci_core_conn_create);
 
-static void nci_core_conn_close_req(struct nci_dev *ndev, unsigned long opt)
+static void nci_core_conn_close_req(struct nci_dev *ndev, const void *opt)
 {
-	__u8 conn_id = opt;
+	__u8 conn_id = (unsigned long)opt;
 
 	nci_send_cmd(ndev, NCI_OP_CORE_CONN_CLOSE_CMD, 1, &conn_id);
 }
 
 int nci_core_conn_close(struct nci_dev *ndev, u8 conn_id)
 {
+	unsigned long opt = conn_id;
+
 	ndev->cur_conn_id = conn_id;
-	return __nci_request(ndev, nci_core_conn_close_req, conn_id,
+	return __nci_request(ndev, nci_core_conn_close_req, (void *)opt,
 			     msecs_to_jiffies(NCI_CMD_TIMEOUT));
 }
 EXPORT_SYMBOL(nci_core_conn_close);
@@ -758,14 +755,14 @@ static int nci_set_local_general_bytes(struct nfc_dev *nfc_dev)
 
 	param.id = NCI_PN_ATR_REQ_GEN_BYTES;
 
-	rc = nci_request(ndev, nci_set_config_req, (unsigned long)&param,
+	rc = nci_request(ndev, nci_set_config_req, &param,
 			 msecs_to_jiffies(NCI_SET_CONFIG_TIMEOUT));
 	if (rc)
 		return rc;
 
 	param.id = NCI_LN_ATR_RES_GEN_BYTES;
 
-	return nci_request(ndev, nci_set_config_req, (unsigned long)&param,
+	return nci_request(ndev, nci_set_config_req, &param,
 			   msecs_to_jiffies(NCI_SET_CONFIG_TIMEOUT));
 }
 
@@ -815,7 +812,7 @@ static int nci_start_poll(struct nfc_dev *nfc_dev,
 		pr_debug("target active or w4 select, implicitly deactivate\n");
 
 		rc = nci_request(ndev, nci_rf_deactivate_req,
-				 NCI_DEACTIVATE_TYPE_IDLE_MODE,
+				 (void *)NCI_DEACTIVATE_TYPE_IDLE_MODE,
 				 msecs_to_jiffies(NCI_RF_DEACTIVATE_TIMEOUT));
 		if (rc)
 			return -EBUSY;
@@ -837,7 +834,7 @@ static int nci_start_poll(struct nfc_dev *nfc_dev,
 
 	param.im_protocols = im_protocols;
 	param.tm_protocols = tm_protocols;
-	rc = nci_request(ndev, nci_rf_discover_req, (unsigned long)&param,
+	rc = nci_request(ndev, nci_rf_discover_req, &param,
 			 msecs_to_jiffies(NCI_RF_DISC_TIMEOUT));
 
 	if (!rc)
@@ -856,7 +853,8 @@ static void nci_stop_poll(struct nfc_dev *nfc_dev)
 		return;
 	}
 
-	nci_request(ndev, nci_rf_deactivate_req, NCI_DEACTIVATE_TYPE_IDLE_MODE,
+	nci_request(ndev, nci_rf_deactivate_req,
+		    (void *)NCI_DEACTIVATE_TYPE_IDLE_MODE,
 		    msecs_to_jiffies(NCI_RF_DEACTIVATE_TIMEOUT));
 }
 
@@ -915,8 +913,7 @@ static int nci_activate_target(struct nfc_dev *nfc_dev,
 		else
 			param.rf_protocol = NCI_RF_PROTOCOL_NFC_DEP;
 
-		rc = nci_request(ndev, nci_rf_discover_select_req,
-				 (unsigned long)&param,
+		rc = nci_request(ndev, nci_rf_discover_select_req, &param,
 				 msecs_to_jiffies(NCI_RF_DISC_SELECT_TIMEOUT));
 	}
 
@@ -931,7 +928,7 @@ static void nci_deactivate_target(struct nfc_dev *nfc_dev,
 				  __u8 mode)
 {
 	struct nci_dev *ndev = nfc_get_drvdata(nfc_dev);
-	u8 nci_mode = NCI_DEACTIVATE_TYPE_IDLE_MODE;
+	unsigned long nci_mode = NCI_DEACTIVATE_TYPE_IDLE_MODE;
 
 	pr_debug("entry\n");
 
@@ -949,7 +946,7 @@ static void nci_deactivate_target(struct nfc_dev *nfc_dev,
 	}
 
 	if (atomic_read(&ndev->state) == NCI_POLL_ACTIVE) {
-		nci_request(ndev, nci_rf_deactivate_req, nci_mode,
+		nci_request(ndev, nci_rf_deactivate_req, (void *)nci_mode,
 			    msecs_to_jiffies(NCI_RF_DEACTIVATE_TIMEOUT));
 	}
 }
@@ -987,8 +984,8 @@ static int nci_dep_link_down(struct nfc_dev *nfc_dev)
 	} else {
 		if (atomic_read(&ndev->state) == NCI_LISTEN_ACTIVE ||
 		    atomic_read(&ndev->state) == NCI_DISCOVERY) {
-			nci_request(ndev, nci_rf_deactivate_req, 0,
-				msecs_to_jiffies(NCI_RF_DEACTIVATE_TIMEOUT));
+			nci_request(ndev, nci_rf_deactivate_req, (void *)0,
+				    msecs_to_jiffies(NCI_RF_DEACTIVATE_TIMEOUT));
 		}
 
 		rc = nfc_tm_deactivated(nfc_dev);
diff --git a/net/nfc/nci/hci.c b/net/nfc/nci/hci.c
index a8ff794a8084..e199912ee1e5 100644
--- a/net/nfc/nci/hci.c
+++ b/net/nfc/nci/hci.c
@@ -195,9 +195,9 @@ static int nci_hci_send_data(struct nci_dev *ndev, u8 pipe,
 	return i;
 }
 
-static void nci_hci_send_data_req(struct nci_dev *ndev, unsigned long opt)
+static void nci_hci_send_data_req(struct nci_dev *ndev, const void *opt)
 {
-	const struct nci_data *data = (struct nci_data *)opt;
+	const struct nci_data *data = opt;
 
 	nci_hci_send_data(ndev, data->pipe, data->cmd,
 			  data->data, data->data_len);
@@ -240,7 +240,7 @@ int nci_hci_send_cmd(struct nci_dev *ndev, u8 gate, u8 cmd,
 	data.data = param;
 	data.data_len = param_len;
 
-	r = nci_request(ndev, nci_hci_send_data_req, (unsigned long)&data,
+	r = nci_request(ndev, nci_hci_send_data_req, &data,
 			msecs_to_jiffies(NCI_DATA_TIMEOUT));
 	if (r == NCI_STATUS_OK) {
 		message = (struct nci_hcp_message *)conn_info->rx_skb->data;
@@ -511,9 +511,8 @@ int nci_hci_open_pipe(struct nci_dev *ndev, u8 pipe)
 	data.data = NULL;
 	data.data_len = 0;
 
-	return nci_request(ndev, nci_hci_send_data_req,
-			(unsigned long)&data,
-			msecs_to_jiffies(NCI_DATA_TIMEOUT));
+	return nci_request(ndev, nci_hci_send_data_req, &data,
+			   msecs_to_jiffies(NCI_DATA_TIMEOUT));
 }
 EXPORT_SYMBOL(nci_hci_open_pipe);
 
@@ -587,8 +586,7 @@ int nci_hci_set_param(struct nci_dev *ndev, u8 gate, u8 idx,
 	data.data = tmp;
 	data.data_len = param_len + 1;
 
-	r = nci_request(ndev, nci_hci_send_data_req,
-			(unsigned long)&data,
+	r = nci_request(ndev, nci_hci_send_data_req, &data,
 			msecs_to_jiffies(NCI_DATA_TIMEOUT));
 	if (r == NCI_STATUS_OK) {
 		message = (struct nci_hcp_message *)conn_info->rx_skb->data;
@@ -627,7 +625,7 @@ int nci_hci_get_param(struct nci_dev *ndev, u8 gate, u8 idx,
 	data.data = &idx;
 	data.data_len = 1;
 
-	r = nci_request(ndev, nci_hci_send_data_req, (unsigned long)&data,
+	r = nci_request(ndev, nci_hci_send_data_req, &data,
 			msecs_to_jiffies(NCI_DATA_TIMEOUT));
 
 	if (r == NCI_STATUS_OK) {
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
