Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCEB39564F
	for <lists+linux-nfc@lfdr.de>; Mon, 31 May 2021 09:39:21 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id EE5CE100EC1D5;
	Mon, 31 May 2021 00:39:19 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 39854100ED497
	for <linux-nfc@lists.01.org>; Mon, 31 May 2021 00:39:18 -0700 (PDT)
Received: from mail-wm1-f72.google.com ([209.85.128.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lncW4-00037d-RI
	for linux-nfc@lists.01.org; Mon, 31 May 2021 07:39:16 +0000
Received: by mail-wm1-f72.google.com with SMTP id 128-20020a1c04860000b0290196f3c0a927so2688663wme.3
        for <linux-nfc@lists.01.org>; Mon, 31 May 2021 00:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YZNBNLLuM7Y420WwKOJBdrZZvuC/Ic8dNT+7222oonE=;
        b=sJUsVwBVHQxxzxr/NcjQNOKSl0qVO873k7whW3AoX7OGJpZlRV+7mPZGyIp9ohInwC
         RvMvpNeGCsRgOScU1FHXcPUMwaR0fmhWGj1ddhGhiL6VLLhk+xyFA1ekJ4LAAD5163/A
         JT3nFUXdRu4UB8gHG0HYNVA/wnuPssljDlchDo+s+8bMzBqhWsByuLh1hhI5zM7RG1a+
         Ba7tYMBs1Es+S+OEwCxQeEsC76W+j8YO4GfGSeLhLVUNmnVY/SuQH/l8x1SXSw7oAdxJ
         E5K/ADoZTZANdMKcWXYOlFL+O/WseQLwlESApKpmXFNiAYBZ/nCO8SAbrlMyRNwvHPFH
         7XyQ==
X-Gm-Message-State: AOAM531cyEEYoQwwH9qnI4pJNJQZdDJwgZlroaD0up0z+kd4ki0w2vxe
	gv6usa5BPP/+XY/qRaav3u5tcUiVWbmMDZsEhgHvpV9SQqyVDWnQekDUY4xYnmi8DwSYRnz5aOc
	Y9/4+Mi9X0Dtigq3qq+5aVtONo+xY08OP0g==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr21254531wrt.189.1622446756159;
        Mon, 31 May 2021 00:39:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnFcoMnrJnMBkjW5xup7s16dMzXQ/Yiluqq5JY19k+TOj/ag6ZcdukR/bpD673OLg4e1bM5Q==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr21254511wrt.189.1622446755950;
        Mon, 31 May 2021 00:39:15 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id a1sm9168911wrg.92.2021.05.31.00.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 00:39:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Mon, 31 May 2021 09:38:57 +0200
Message-Id: <20210531073902.7111-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210531073522.6720-1-krzysztof.kozlowski@canonical.com>
References: <20210531073522.6720-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 4ONAC7LN6AS5RHSBJPGHFWF3SYJNCUXX
X-Message-ID-Hash: 4ONAC7LN6AS5RHSBJPGHFWF3SYJNCUXX
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [RESEND PATCH 06/11] nfc: pn533: drop ftrace-like debugging messages
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/4ONAC7LN6AS5RHSBJPGHFWF3SYJNCUXX/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that the kernel has ftrace, any debugging calls that just do "made
it to this function!" and "leaving this function!" can be removed.
Better to use standard debugging tools.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/pn533/i2c.c   |  5 -----
 drivers/nfc/pn533/pn533.c | 46 ---------------------------------------
 drivers/nfc/pn533/usb.c   |  4 ----
 3 files changed, 55 deletions(-)

diff --git a/drivers/nfc/pn533/i2c.c b/drivers/nfc/pn533/i2c.c
index bfc617acabae..bb04fddb0504 100644
--- a/drivers/nfc/pn533/i2c.c
+++ b/drivers/nfc/pn533/i2c.c
@@ -174,9 +174,6 @@ static int pn533_i2c_probe(struct i2c_client *client,
 	struct pn533 *priv;
 	int r = 0;
 
-	dev_dbg(&client->dev, "%s\n", __func__);
-	dev_dbg(&client->dev, "IRQ: %d\n", client->irq);
-
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		nfc_err(&client->dev, "Need I2C_FUNC_I2C\n");
 		return -ENODEV;
@@ -239,8 +236,6 @@ static int pn533_i2c_remove(struct i2c_client *client)
 {
 	struct pn533_i2c_phy *phy = i2c_get_clientdata(client);
 
-	dev_dbg(&client->dev, "%s\n", __func__);
-
 	free_irq(client->irq, phy);
 
 	pn53x_unregister_nfc(phy->priv);
diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index 2c7f9916f206..cd64bfe20402 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -1075,8 +1075,6 @@ static int pn533_tm_get_data_complete(struct pn533 *dev, void *arg,
 	u8 status, ret, mi;
 	int rc;
 
-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	if (IS_ERR(resp)) {
 		skb_queue_purge(&dev->resp_q);
 		return PTR_ERR(resp);
@@ -1124,8 +1122,6 @@ static void pn533_wq_tm_mi_recv(struct work_struct *work)
 	struct sk_buff *skb;
 	int rc;
 
-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	skb = pn533_alloc_skb(dev, 0);
 	if (!skb)
 		return;
@@ -1148,8 +1144,6 @@ static void pn533_wq_tm_mi_send(struct work_struct *work)
 	struct sk_buff *skb;
 	int rc;
 
-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	/* Grab the first skb in the queue */
 	skb = skb_dequeue(&dev->fragment_skb);
 	if (skb == NULL) {	/* No more data */
@@ -1186,8 +1180,6 @@ static void pn533_wq_tg_get_data(struct work_struct *work)
 	struct sk_buff *skb;
 	int rc;
 
-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	skb = pn533_alloc_skb(dev, 0);
 	if (!skb)
 		return;
@@ -1206,8 +1198,6 @@ static int pn533_init_target_complete(struct pn533 *dev, struct sk_buff *resp)
 	size_t gb_len;
 	int rc;
 
-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	if (resp->len < ATR_REQ_GB_OFFSET + 1)
 		return -EINVAL;
 
@@ -1260,8 +1250,6 @@ static int pn533_rf_complete(struct pn533 *dev, void *arg,
 {
 	int rc = 0;
 
-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	if (IS_ERR(resp)) {
 		rc = PTR_ERR(resp);
 
@@ -1283,8 +1271,6 @@ static void pn533_wq_rf(struct work_struct *work)
 	struct sk_buff *skb;
 	int rc;
 
-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	skb = pn533_alloc_skb(dev, 2);
 	if (!skb)
 		return;
@@ -1360,8 +1346,6 @@ static int pn533_poll_dep(struct nfc_dev *nfc_dev)
 	u8 *next, nfcid3[NFC_NFCID3_MAXSIZE];
 	u8 passive_data[PASSIVE_DATA_LEN] = {0x00, 0xff, 0xff, 0x00, 0x3};
 
-	dev_dbg(dev->dev, "%s", __func__);
-
 	if (!dev->gb) {
 		dev->gb = nfc_get_local_general_bytes(nfc_dev, &dev->gb_len);
 
@@ -1511,8 +1495,6 @@ static int pn533_poll_complete(struct pn533 *dev, void *arg,
 	struct pn533_poll_modulations *cur_mod;
 	int rc;
 
-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	if (IS_ERR(resp)) {
 		rc = PTR_ERR(resp);
 
@@ -1783,8 +1765,6 @@ static int pn533_activate_target_nfcdep(struct pn533 *dev)
 	struct sk_buff *skb;
 	struct sk_buff *resp;
 
-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	skb = pn533_alloc_skb(dev, sizeof(u8) * 2); /*TG + Next*/
 	if (!skb)
 		return -ENOMEM;
@@ -1866,8 +1846,6 @@ static int pn533_deactivate_target_complete(struct pn533 *dev, void *arg,
 {
 	int rc = 0;
 
-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	if (IS_ERR(resp)) {
 		rc = PTR_ERR(resp);
 
@@ -1892,8 +1870,6 @@ static void pn533_deactivate_target(struct nfc_dev *nfc_dev,
 	struct sk_buff *skb;
 	int rc;
 
-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	if (!dev->tgt_active_prot) {
 		nfc_err(dev->dev, "There is no active target\n");
 		return;
@@ -1988,8 +1964,6 @@ static int pn533_dep_link_up(struct nfc_dev *nfc_dev, struct nfc_target *target,
 	u8 *next, *arg, nfcid3[NFC_NFCID3_MAXSIZE];
 	u8 passive_data[PASSIVE_DATA_LEN] = {0x00, 0xff, 0xff, 0x00, 0x3};
 
-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	if (dev->poll_mod_count) {
 		nfc_err(dev->dev,
 			"Cannot bring the DEP link up while polling\n");
@@ -2067,8 +2041,6 @@ static int pn533_dep_link_down(struct nfc_dev *nfc_dev)
 {
 	struct pn533 *dev = nfc_get_drvdata(nfc_dev);
 
-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	pn533_poll_reset_mod_list(dev);
 
 	if (dev->tgt_mode || dev->tgt_active_prot)
@@ -2092,8 +2064,6 @@ static struct sk_buff *pn533_build_response(struct pn533 *dev)
 	struct sk_buff *skb, *tmp, *t;
 	unsigned int skb_len = 0, tmp_len = 0;
 
-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	if (skb_queue_empty(&dev->resp_q))
 		return NULL;
 
@@ -2133,8 +2103,6 @@ static int pn533_data_exchange_complete(struct pn533 *dev, void *_arg,
 	int rc = 0;
 	u8 status, ret, mi;
 
-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	if (IS_ERR(resp)) {
 		rc = PTR_ERR(resp);
 		goto _error;
@@ -2288,8 +2256,6 @@ static int pn533_transceive(struct nfc_dev *nfc_dev,
 	struct pn533_data_exchange_arg *arg = NULL;
 	int rc;
 
-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	if (!dev->tgt_active_prot) {
 		nfc_err(dev->dev,
 			"Can't exchange data if there is no active target\n");
@@ -2356,8 +2322,6 @@ static int pn533_tm_send_complete(struct pn533 *dev, void *arg,
 {
 	u8 status;
 
-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	if (IS_ERR(resp))
 		return PTR_ERR(resp);
 
@@ -2388,8 +2352,6 @@ static int pn533_tm_send(struct nfc_dev *nfc_dev, struct sk_buff *skb)
 	struct pn533 *dev = nfc_get_drvdata(nfc_dev);
 	int rc;
 
-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	/* let's split in multiple chunks if size's too big */
 	if (skb->len > PN533_CMD_DATAEXCH_DATA_MAXLEN) {
 		rc = pn533_fill_fragment_skbs(dev, skb);
@@ -2426,8 +2388,6 @@ static void pn533_wq_mi_recv(struct work_struct *work)
 	struct sk_buff *skb;
 	int rc;
 
-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	skb = pn533_alloc_skb(dev, PN533_CMD_DATAEXCH_HEAD_LEN);
 	if (!skb)
 		goto error;
@@ -2476,8 +2436,6 @@ static void pn533_wq_mi_send(struct work_struct *work)
 	struct sk_buff *skb;
 	int rc;
 
-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	/* Grab the first skb in the queue */
 	skb = skb_dequeue(&dev->fragment_skb);
 
@@ -2533,8 +2491,6 @@ static int pn533_set_configuration(struct pn533 *dev, u8 cfgitem, u8 *cfgdata,
 	struct sk_buff *resp;
 	int skb_len;
 
-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	skb_len = sizeof(cfgitem) + cfgdata_len; /* cfgitem + cfgdata */
 
 	skb = pn533_alloc_skb(dev, skb_len);
@@ -2580,8 +2536,6 @@ static int pn533_pasori_fw_reset(struct pn533 *dev)
 	struct sk_buff *skb;
 	struct sk_buff *resp;
 
-	dev_dbg(dev->dev, "%s\n", __func__);
-
 	skb = pn533_alloc_skb(dev, sizeof(u8));
 	if (!skb)
 		return -ENOMEM;
diff --git a/drivers/nfc/pn533/usb.c b/drivers/nfc/pn533/usb.c
index 84d2bfabf42b..bd7f7478d189 100644
--- a/drivers/nfc/pn533/usb.c
+++ b/drivers/nfc/pn533/usb.c
@@ -354,8 +354,6 @@ static void pn533_acr122_poweron_rdr_resp(struct urb *urb)
 {
 	struct pn533_acr122_poweron_rdr_arg *arg = urb->context;
 
-	dev_dbg(&urb->dev->dev, "%s\n", __func__);
-
 	print_hex_dump_debug("ACR122 RX: ", DUMP_PREFIX_NONE, 16, 1,
 		       urb->transfer_buffer, urb->transfer_buffer_length,
 		       false);
@@ -375,8 +373,6 @@ static int pn533_acr122_poweron_rdr(struct pn533_usb_phy *phy)
 	void *cntx;
 	struct pn533_acr122_poweron_rdr_arg arg;
 
-	dev_dbg(&phy->udev->dev, "%s\n", __func__);
-
 	buffer = kmemdup(cmd, sizeof(cmd), GFP_KERNEL);
 	if (!buffer)
 		return -ENOMEM;
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
