Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 093483DBAD9
	for <lists+linux-nfc@lfdr.de>; Fri, 30 Jul 2021 16:42:23 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 7E39F100EB330;
	Fri, 30 Jul 2021 07:42:20 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id BF210100EB32D
	for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 07:42:18 -0700 (PDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id B25AA3F23D
	for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 14:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627656137;
	bh=uMkuh0xJL9kOCZ9QqooVEWp1gQQGTQsw+N/FjbB0TVA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=tdsIl1F2C47ydjGsKBjWDXUc2srpo4dZosHQppa6ow5YMmIXCxFvxA+O+OoEfRykj
	 aINYYbLZa5u3gzz9frmruAmL/MCbOr7w2DWb9u5C9QXtW+7cZY2KzB1F9ZECrCPc30
	 M8Ldr4mjbySshS+Nz2vNVO+RecSnj4DDItfAtJZMGddsyXsETe+DufK7A+jXa0myB0
	 odGHNN12B8MdnXSaCthvFhh/MUyljb6HL5b2gARaeSFly+kiFwhMqmCJfJexKEpg1j
	 CgXPvdX2PyWo6HUSBF9xVHbYfKlge/sSx4Y2jDhQCJdGzU+mY8Edah6aV37LlCplrf
	 cnd/FsM3aYwBw==
Received: by mail-ed1-f72.google.com with SMTP id y39-20020a50bb2a0000b02903bc05daccbaso4717309ede.5
        for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 07:42:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uMkuh0xJL9kOCZ9QqooVEWp1gQQGTQsw+N/FjbB0TVA=;
        b=jLSIw5iJMn5FLa+swmrkx5pCM+TxkvjZJvtu2yylGqPupjEejNmf494Qblmnhn5kjy
         wUDFKpmYWUy0pGyN3IAxo6/+ZPmPS6vZ0D++KyEGMKSsCKUY+CuyBxk00HxPwBwxT3Dq
         cOOd+1hAHPsWL2xpSeTsU4fGqPg3X1mxye341W8yK0FCDDi8EK+ozV4350eU4+cn5wO4
         YMh76W1vI+0B3rgF4fTJMfotfg5KCAzmsRr/JR3StgSNZnk2vnNhNU5NS27OePMqrCiz
         IKFob3eVtUDb55ngOCMQzT/LLmN/397RWTFtQPV7DhuU0N3YPlKc08PJ9kXZTUSByCRW
         H6uQ==
X-Gm-Message-State: AOAM531YwQwdA1c9j1nhh6DjsiZksUrIT8Th347neEehI2usW8Amt5Yf
	Y1xp/UQTZGHxHwHdEc/hCYpuilRzn//dvKMZhmN4Nqlq7z70M6UOJKOSBv7YdBrx3BrpqMYZa75
	lN61Y7neKHjTEbk1D20TfhavZO+XX674GiA==
X-Received: by 2002:a17:906:2844:: with SMTP id s4mr2817681ejc.263.1627656137273;
        Fri, 30 Jul 2021 07:42:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFu8Ou+A1YvDdpCP2dPzhaXodssuElr9cWADOdGaAVhA9M+eDCgLRrNwcWbJ6y8R3wYsYyiA==
X-Received: by 2002:a17:906:2844:: with SMTP id s4mr2817666ejc.263.1627656137065;
        Fri, 30 Jul 2021 07:42:17 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id z8sm626325ejd.94.2021.07.30.07.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:42:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 30 Jul 2021 16:41:59 +0200
Message-Id: <20210730144202.255890-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210730144202.255890-1-krzysztof.kozlowski@canonical.com>
References: <20210730144202.255890-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 3GMPFJU4YVRJAOPKWVNBRQXRXP3RPNKQ
X-Message-ID-Hash: 3GMPFJU4YVRJAOPKWVNBRQXRXP3RPNKQ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v3 4/7] nfc: constify several pointers to u8, char and sk_buff
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/3GMPFJU4YVRJAOPKWVNBRQXRXP3RPNKQ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Several functions receive pointers to u8, char or sk_buff but do not
modify the contents so make them const.  This allows doing the same for
local variables and in total makes the code a little bit safer.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 include/net/nfc/nfc.h   |  4 ++--
 net/nfc/core.c          |  4 ++--
 net/nfc/hci/llc_shdlc.c | 10 ++++-----
 net/nfc/llcp.h          |  8 +++----
 net/nfc/llcp_commands.c | 46 ++++++++++++++++++++++-------------------
 net/nfc/llcp_core.c     | 44 +++++++++++++++++++++------------------
 net/nfc/nfc.h           |  2 +-
 7 files changed, 63 insertions(+), 55 deletions(-)

diff --git a/include/net/nfc/nfc.h b/include/net/nfc/nfc.h
index 901779138e2b..5dee575fbe86 100644
--- a/include/net/nfc/nfc.h
+++ b/include/net/nfc/nfc.h
@@ -266,7 +266,7 @@ struct sk_buff *nfc_alloc_send_skb(struct nfc_dev *dev, struct sock *sk,
 struct sk_buff *nfc_alloc_recv_skb(unsigned int size, gfp_t gfp);
 
 int nfc_set_remote_general_bytes(struct nfc_dev *dev,
-				 u8 *gt, u8 gt_len);
+				 const u8 *gt, u8 gt_len);
 u8 *nfc_get_local_general_bytes(struct nfc_dev *dev, size_t *gb_len);
 
 int nfc_fw_download_done(struct nfc_dev *dev, const char *firmware_name,
@@ -280,7 +280,7 @@ int nfc_dep_link_is_up(struct nfc_dev *dev, u32 target_idx,
 		       u8 comm_mode, u8 rf_mode);
 
 int nfc_tm_activated(struct nfc_dev *dev, u32 protocol, u8 comm_mode,
-		     u8 *gb, size_t gb_len);
+		     const u8 *gb, size_t gb_len);
 int nfc_tm_deactivated(struct nfc_dev *dev);
 int nfc_tm_data_received(struct nfc_dev *dev, struct sk_buff *skb);
 
diff --git a/net/nfc/core.c b/net/nfc/core.c
index 6ade54149b73..08182e209144 100644
--- a/net/nfc/core.c
+++ b/net/nfc/core.c
@@ -636,7 +636,7 @@ int nfc_disable_se(struct nfc_dev *dev, u32 se_idx)
 	return rc;
 }
 
-int nfc_set_remote_general_bytes(struct nfc_dev *dev, u8 *gb, u8 gb_len)
+int nfc_set_remote_general_bytes(struct nfc_dev *dev, const u8 *gb, u8 gb_len)
 {
 	pr_debug("dev_name=%s gb_len=%d\n", dev_name(&dev->dev), gb_len);
 
@@ -665,7 +665,7 @@ int nfc_tm_data_received(struct nfc_dev *dev, struct sk_buff *skb)
 EXPORT_SYMBOL(nfc_tm_data_received);
 
 int nfc_tm_activated(struct nfc_dev *dev, u32 protocol, u8 comm_mode,
-		     u8 *gb, size_t gb_len)
+		     const u8 *gb, size_t gb_len)
 {
 	int rc;
 
diff --git a/net/nfc/hci/llc_shdlc.c b/net/nfc/hci/llc_shdlc.c
index 6b747856d095..aef750d7787c 100644
--- a/net/nfc/hci/llc_shdlc.c
+++ b/net/nfc/hci/llc_shdlc.c
@@ -123,7 +123,7 @@ static bool llc_shdlc_x_lteq_y_lt_z(int x, int y, int z)
 		return ((y >= x) || (y < z)) ? true : false;
 }
 
-static struct sk_buff *llc_shdlc_alloc_skb(struct llc_shdlc *shdlc,
+static struct sk_buff *llc_shdlc_alloc_skb(const struct llc_shdlc *shdlc,
 					   int payload_len)
 {
 	struct sk_buff *skb;
@@ -137,7 +137,7 @@ static struct sk_buff *llc_shdlc_alloc_skb(struct llc_shdlc *shdlc,
 }
 
 /* immediately sends an S frame. */
-static int llc_shdlc_send_s_frame(struct llc_shdlc *shdlc,
+static int llc_shdlc_send_s_frame(const struct llc_shdlc *shdlc,
 				  enum sframe_type sframe_type, int nr)
 {
 	int r;
@@ -159,7 +159,7 @@ static int llc_shdlc_send_s_frame(struct llc_shdlc *shdlc,
 }
 
 /* immediately sends an U frame. skb may contain optional payload */
-static int llc_shdlc_send_u_frame(struct llc_shdlc *shdlc,
+static int llc_shdlc_send_u_frame(const struct llc_shdlc *shdlc,
 				  struct sk_buff *skb,
 				  enum uframe_modifier uframe_modifier)
 {
@@ -361,7 +361,7 @@ static void llc_shdlc_connect_complete(struct llc_shdlc *shdlc, int r)
 	wake_up(shdlc->connect_wq);
 }
 
-static int llc_shdlc_connect_initiate(struct llc_shdlc *shdlc)
+static int llc_shdlc_connect_initiate(const struct llc_shdlc *shdlc)
 {
 	struct sk_buff *skb;
 
@@ -377,7 +377,7 @@ static int llc_shdlc_connect_initiate(struct llc_shdlc *shdlc)
 	return llc_shdlc_send_u_frame(shdlc, skb, U_FRAME_RSET);
 }
 
-static int llc_shdlc_connect_send_ua(struct llc_shdlc *shdlc)
+static int llc_shdlc_connect_send_ua(const struct llc_shdlc *shdlc)
 {
 	struct sk_buff *skb;
 
diff --git a/net/nfc/llcp.h b/net/nfc/llcp.h
index 97853c9cefc7..d49d4bf2e37c 100644
--- a/net/nfc/llcp.h
+++ b/net/nfc/llcp.h
@@ -221,15 +221,15 @@ struct sock *nfc_llcp_accept_dequeue(struct sock *sk, struct socket *newsock);
 
 /* TLV API */
 int nfc_llcp_parse_gb_tlv(struct nfc_llcp_local *local,
-			  u8 *tlv_array, u16 tlv_array_len);
+			  const u8 *tlv_array, u16 tlv_array_len);
 int nfc_llcp_parse_connection_tlv(struct nfc_llcp_sock *sock,
-				  u8 *tlv_array, u16 tlv_array_len);
+				  const u8 *tlv_array, u16 tlv_array_len);
 
 /* Commands API */
 void nfc_llcp_recv(void *data, struct sk_buff *skb, int err);
-u8 *nfc_llcp_build_tlv(u8 type, u8 *value, u8 value_length, u8 *tlv_length);
+u8 *nfc_llcp_build_tlv(u8 type, const u8 *value, u8 value_length, u8 *tlv_length);
 struct nfc_llcp_sdp_tlv *nfc_llcp_build_sdres_tlv(u8 tid, u8 sap);
-struct nfc_llcp_sdp_tlv *nfc_llcp_build_sdreq_tlv(u8 tid, char *uri,
+struct nfc_llcp_sdp_tlv *nfc_llcp_build_sdreq_tlv(u8 tid, const char *uri,
 						  size_t uri_len);
 void nfc_llcp_free_sdp_tlv(struct nfc_llcp_sdp_tlv *sdp);
 void nfc_llcp_free_sdp_tlv_list(struct hlist_head *sdp_head);
diff --git a/net/nfc/llcp_commands.c b/net/nfc/llcp_commands.c
index 475061c79c44..3c4172a5aeb5 100644
--- a/net/nfc/llcp_commands.c
+++ b/net/nfc/llcp_commands.c
@@ -15,7 +15,7 @@
 #include "nfc.h"
 #include "llcp.h"
 
-static u8 llcp_tlv_length[LLCP_TLV_MAX] = {
+static const u8 llcp_tlv_length[LLCP_TLV_MAX] = {
 	0,
 	1, /* VERSION */
 	2, /* MIUX */
@@ -29,7 +29,7 @@ static u8 llcp_tlv_length[LLCP_TLV_MAX] = {
 
 };
 
-static u8 llcp_tlv8(u8 *tlv, u8 type)
+static u8 llcp_tlv8(const u8 *tlv, u8 type)
 {
 	if (tlv[0] != type || tlv[1] != llcp_tlv_length[tlv[0]])
 		return 0;
@@ -37,7 +37,7 @@ static u8 llcp_tlv8(u8 *tlv, u8 type)
 	return tlv[2];
 }
 
-static u16 llcp_tlv16(u8 *tlv, u8 type)
+static u16 llcp_tlv16(const u8 *tlv, u8 type)
 {
 	if (tlv[0] != type || tlv[1] != llcp_tlv_length[tlv[0]])
 		return 0;
@@ -46,37 +46,37 @@ static u16 llcp_tlv16(u8 *tlv, u8 type)
 }
 
 
-static u8 llcp_tlv_version(u8 *tlv)
+static u8 llcp_tlv_version(const u8 *tlv)
 {
 	return llcp_tlv8(tlv, LLCP_TLV_VERSION);
 }
 
-static u16 llcp_tlv_miux(u8 *tlv)
+static u16 llcp_tlv_miux(const u8 *tlv)
 {
 	return llcp_tlv16(tlv, LLCP_TLV_MIUX) & 0x7ff;
 }
 
-static u16 llcp_tlv_wks(u8 *tlv)
+static u16 llcp_tlv_wks(const u8 *tlv)
 {
 	return llcp_tlv16(tlv, LLCP_TLV_WKS);
 }
 
-static u16 llcp_tlv_lto(u8 *tlv)
+static u16 llcp_tlv_lto(const u8 *tlv)
 {
 	return llcp_tlv8(tlv, LLCP_TLV_LTO);
 }
 
-static u8 llcp_tlv_opt(u8 *tlv)
+static u8 llcp_tlv_opt(const u8 *tlv)
 {
 	return llcp_tlv8(tlv, LLCP_TLV_OPT);
 }
 
-static u8 llcp_tlv_rw(u8 *tlv)
+static u8 llcp_tlv_rw(const u8 *tlv)
 {
 	return llcp_tlv8(tlv, LLCP_TLV_RW) & 0xf;
 }
 
-u8 *nfc_llcp_build_tlv(u8 type, u8 *value, u8 value_length, u8 *tlv_length)
+u8 *nfc_llcp_build_tlv(u8 type, const u8 *value, u8 value_length, u8 *tlv_length)
 {
 	u8 *tlv, length;
 
@@ -130,7 +130,7 @@ struct nfc_llcp_sdp_tlv *nfc_llcp_build_sdres_tlv(u8 tid, u8 sap)
 	return sdres;
 }
 
-struct nfc_llcp_sdp_tlv *nfc_llcp_build_sdreq_tlv(u8 tid, char *uri,
+struct nfc_llcp_sdp_tlv *nfc_llcp_build_sdreq_tlv(u8 tid, const char *uri,
 						  size_t uri_len)
 {
 	struct nfc_llcp_sdp_tlv *sdreq;
@@ -190,9 +190,10 @@ void nfc_llcp_free_sdp_tlv_list(struct hlist_head *head)
 }
 
 int nfc_llcp_parse_gb_tlv(struct nfc_llcp_local *local,
-			  u8 *tlv_array, u16 tlv_array_len)
+			  const u8 *tlv_array, u16 tlv_array_len)
 {
-	u8 *tlv = tlv_array, type, length, offset = 0;
+	const u8 *tlv = tlv_array;
+	u8 type, length, offset = 0;
 
 	pr_debug("TLV array length %d\n", tlv_array_len);
 
@@ -239,9 +240,10 @@ int nfc_llcp_parse_gb_tlv(struct nfc_llcp_local *local,
 }
 
 int nfc_llcp_parse_connection_tlv(struct nfc_llcp_sock *sock,
-				  u8 *tlv_array, u16 tlv_array_len)
+				  const u8 *tlv_array, u16 tlv_array_len)
 {
-	u8 *tlv = tlv_array, type, length, offset = 0;
+	const u8 *tlv = tlv_array;
+	u8 type, length, offset = 0;
 
 	pr_debug("TLV array length %d\n", tlv_array_len);
 
@@ -295,7 +297,7 @@ static struct sk_buff *llcp_add_header(struct sk_buff *pdu,
 	return pdu;
 }
 
-static struct sk_buff *llcp_add_tlv(struct sk_buff *pdu, u8 *tlv,
+static struct sk_buff *llcp_add_tlv(struct sk_buff *pdu, const u8 *tlv,
 				    u8 tlv_length)
 {
 	/* XXX Add an skb length check */
@@ -389,9 +391,10 @@ int nfc_llcp_send_connect(struct nfc_llcp_sock *sock)
 {
 	struct nfc_llcp_local *local;
 	struct sk_buff *skb;
-	u8 *service_name_tlv = NULL, service_name_tlv_length;
-	u8 *miux_tlv = NULL, miux_tlv_length;
-	u8 *rw_tlv = NULL, rw_tlv_length, rw;
+	const u8 *service_name_tlv = NULL;
+	const u8 *miux_tlv = NULL;
+	const u8 *rw_tlv = NULL;
+	u8 service_name_tlv_length, miux_tlv_length,  rw_tlv_length, rw;
 	int err;
 	u16 size = 0;
 	__be16 miux;
@@ -465,8 +468,9 @@ int nfc_llcp_send_cc(struct nfc_llcp_sock *sock)
 {
 	struct nfc_llcp_local *local;
 	struct sk_buff *skb;
-	u8 *miux_tlv = NULL, miux_tlv_length;
-	u8 *rw_tlv = NULL, rw_tlv_length, rw;
+	const u8 *miux_tlv = NULL;
+	const u8 *rw_tlv = NULL;
+	u8 miux_tlv_length, rw_tlv_length, rw;
 	int err;
 	u16 size = 0;
 	__be16 miux;
diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index cc997518f79d..eaeb2b1cfa6a 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -301,7 +301,7 @@ static char *wks[] = {
 	"urn:nfc:sn:snep",
 };
 
-static int nfc_llcp_wks_sap(char *service_name, size_t service_name_len)
+static int nfc_llcp_wks_sap(const char *service_name, size_t service_name_len)
 {
 	int sap, num_wks;
 
@@ -325,7 +325,7 @@ static int nfc_llcp_wks_sap(char *service_name, size_t service_name_len)
 
 static
 struct nfc_llcp_sock *nfc_llcp_sock_from_sn(struct nfc_llcp_local *local,
-					    u8 *sn, size_t sn_len)
+					    const u8 *sn, size_t sn_len)
 {
 	struct sock *sk;
 	struct nfc_llcp_sock *llcp_sock, *tmp_sock;
@@ -522,7 +522,7 @@ static int nfc_llcp_build_gb(struct nfc_llcp_local *local)
 {
 	u8 *gb_cur, version, version_length;
 	u8 lto_length, wks_length, miux_length;
-	u8 *version_tlv = NULL, *lto_tlv = NULL,
+	const u8 *version_tlv = NULL, *lto_tlv = NULL,
 	   *wks_tlv = NULL, *miux_tlv = NULL;
 	__be16 wks = cpu_to_be16(local->local_wks);
 	u8 gb_len = 0;
@@ -612,7 +612,7 @@ u8 *nfc_llcp_general_bytes(struct nfc_dev *dev, size_t *general_bytes_len)
 	return local->gb;
 }
 
-int nfc_llcp_set_remote_gb(struct nfc_dev *dev, u8 *gb, u8 gb_len)
+int nfc_llcp_set_remote_gb(struct nfc_dev *dev, const u8 *gb, u8 gb_len)
 {
 	struct nfc_llcp_local *local;
 
@@ -639,27 +639,27 @@ int nfc_llcp_set_remote_gb(struct nfc_dev *dev, u8 *gb, u8 gb_len)
 				     local->remote_gb_len - 3);
 }
 
-static u8 nfc_llcp_dsap(struct sk_buff *pdu)
+static u8 nfc_llcp_dsap(const struct sk_buff *pdu)
 {
 	return (pdu->data[0] & 0xfc) >> 2;
 }
 
-static u8 nfc_llcp_ptype(struct sk_buff *pdu)
+static u8 nfc_llcp_ptype(const struct sk_buff *pdu)
 {
 	return ((pdu->data[0] & 0x03) << 2) | ((pdu->data[1] & 0xc0) >> 6);
 }
 
-static u8 nfc_llcp_ssap(struct sk_buff *pdu)
+static u8 nfc_llcp_ssap(const struct sk_buff *pdu)
 {
 	return pdu->data[1] & 0x3f;
 }
 
-static u8 nfc_llcp_ns(struct sk_buff *pdu)
+static u8 nfc_llcp_ns(const struct sk_buff *pdu)
 {
 	return pdu->data[2] >> 4;
 }
 
-static u8 nfc_llcp_nr(struct sk_buff *pdu)
+static u8 nfc_llcp_nr(const struct sk_buff *pdu)
 {
 	return pdu->data[2] & 0xf;
 }
@@ -801,7 +801,7 @@ static struct nfc_llcp_sock *nfc_llcp_connecting_sock_get(struct nfc_llcp_local
 }
 
 static struct nfc_llcp_sock *nfc_llcp_sock_get_sn(struct nfc_llcp_local *local,
-						  u8 *sn, size_t sn_len)
+						  const u8 *sn, size_t sn_len)
 {
 	struct nfc_llcp_sock *llcp_sock;
 
@@ -815,9 +815,10 @@ static struct nfc_llcp_sock *nfc_llcp_sock_get_sn(struct nfc_llcp_local *local,
 	return llcp_sock;
 }
 
-static u8 *nfc_llcp_connect_sn(struct sk_buff *skb, size_t *sn_len)
+static const u8 *nfc_llcp_connect_sn(const struct sk_buff *skb, size_t *sn_len)
 {
-	u8 *tlv = &skb->data[2], type, length;
+	u8 type, length;
+	const u8 *tlv = &skb->data[2];
 	size_t tlv_array_len = skb->len - LLCP_HEADER_SIZE, offset = 0;
 
 	while (offset < tlv_array_len) {
@@ -875,7 +876,7 @@ static void nfc_llcp_recv_ui(struct nfc_llcp_local *local,
 }
 
 static void nfc_llcp_recv_connect(struct nfc_llcp_local *local,
-				  struct sk_buff *skb)
+				  const struct sk_buff *skb)
 {
 	struct sock *new_sk, *parent;
 	struct nfc_llcp_sock *sock, *new_sock;
@@ -893,7 +894,7 @@ static void nfc_llcp_recv_connect(struct nfc_llcp_local *local,
 			goto fail;
 		}
 	} else {
-		u8 *sn;
+		const u8 *sn;
 		size_t sn_len;
 
 		sn = nfc_llcp_connect_sn(skb, &sn_len);
@@ -1112,7 +1113,7 @@ static void nfc_llcp_recv_hdlc(struct nfc_llcp_local *local,
 }
 
 static void nfc_llcp_recv_disc(struct nfc_llcp_local *local,
-			       struct sk_buff *skb)
+			       const struct sk_buff *skb)
 {
 	struct nfc_llcp_sock *llcp_sock;
 	struct sock *sk;
@@ -1155,7 +1156,8 @@ static void nfc_llcp_recv_disc(struct nfc_llcp_local *local,
 	nfc_llcp_sock_put(llcp_sock);
 }
 
-static void nfc_llcp_recv_cc(struct nfc_llcp_local *local, struct sk_buff *skb)
+static void nfc_llcp_recv_cc(struct nfc_llcp_local *local,
+			     const struct sk_buff *skb)
 {
 	struct nfc_llcp_sock *llcp_sock;
 	struct sock *sk;
@@ -1188,7 +1190,8 @@ static void nfc_llcp_recv_cc(struct nfc_llcp_local *local, struct sk_buff *skb)
 	nfc_llcp_sock_put(llcp_sock);
 }
 
-static void nfc_llcp_recv_dm(struct nfc_llcp_local *local, struct sk_buff *skb)
+static void nfc_llcp_recv_dm(struct nfc_llcp_local *local,
+			     const struct sk_buff *skb)
 {
 	struct nfc_llcp_sock *llcp_sock;
 	struct sock *sk;
@@ -1226,12 +1229,13 @@ static void nfc_llcp_recv_dm(struct nfc_llcp_local *local, struct sk_buff *skb)
 }
 
 static void nfc_llcp_recv_snl(struct nfc_llcp_local *local,
-			      struct sk_buff *skb)
+			      const struct sk_buff *skb)
 {
 	struct nfc_llcp_sock *llcp_sock;
-	u8 dsap, ssap, *tlv, type, length, tid, sap;
+	u8 dsap, ssap, type, length, tid, sap;
+	const u8 *tlv;
 	u16 tlv_len, offset;
-	char *service_name;
+	const char *service_name;
 	size_t service_name_len;
 	struct nfc_llcp_sdp_tlv *sdp;
 	HLIST_HEAD(llc_sdres_list);
diff --git a/net/nfc/nfc.h b/net/nfc/nfc.h
index 889fefd64e56..de2ec66d7e83 100644
--- a/net/nfc/nfc.h
+++ b/net/nfc/nfc.h
@@ -48,7 +48,7 @@ void nfc_llcp_mac_is_up(struct nfc_dev *dev, u32 target_idx,
 			u8 comm_mode, u8 rf_mode);
 int nfc_llcp_register_device(struct nfc_dev *dev);
 void nfc_llcp_unregister_device(struct nfc_dev *dev);
-int nfc_llcp_set_remote_gb(struct nfc_dev *dev, u8 *gb, u8 gb_len);
+int nfc_llcp_set_remote_gb(struct nfc_dev *dev, const u8 *gb, u8 gb_len);
 u8 *nfc_llcp_general_bytes(struct nfc_dev *dev, size_t *general_bytes_len);
 int nfc_llcp_data_received(struct nfc_dev *dev, struct sk_buff *skb);
 struct nfc_llcp_local *nfc_llcp_find_local(struct nfc_dev *dev);
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
