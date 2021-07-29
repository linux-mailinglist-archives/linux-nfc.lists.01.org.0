Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 060AB3DA144
	for <lists+linux-nfc@lfdr.de>; Thu, 29 Jul 2021 12:40:53 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id AF5F3100EBB9E;
	Thu, 29 Jul 2021 03:40:48 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 61664100EBB97
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:40:46 -0700 (PDT)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 44CBB3F051
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 10:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627555245;
	bh=Sx96q8yhgGgqfl73oRuy2iNKHvqsaGaKbhbfDQ9JbsY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=D7FGa5TdVvn2PInqdMXQ5H23yiOBrCuY9YO0aailRj00NKMkq/BZsiaSh0KX0tpws
	 E7dMWTYE7Stn+ZBijsbUkcCTO9CqH7QUg+OjFOam8XfsbyBjq8BckfuRgJ2hrw63nB
	 n8GJpCvGWHJ93Um6fcpgotu5XgjjDNjdkoKFDMq2kabU8hcpFzd2dCwPv1HXC7Qk40
	 7+ceddb1tBphIl/5sQ4W5jz/ez2W4KE9NoLbKWTKyCUWazQFc25NZVHJMppGI7kJKl
	 U/0vW49+8UNRaxRWZ5rFp7DHdL7aM9GtzFyNmR/02QWQQhb1BgG07aPxdCQIAF3IpV
	 jfzJN1Qcucxmw==
Received: by mail-ej1-f69.google.com with SMTP id g21-20020a1709061e15b029052292d7c3b4so1835328ejj.9
        for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sx96q8yhgGgqfl73oRuy2iNKHvqsaGaKbhbfDQ9JbsY=;
        b=X1uIpVridrXkFnWcWD13gBIr6gCreX0+HqUZbPUuQSbVsInfN5Q4PVj05sybMhKTBm
         YeGSXsZX6w6N1oSw2Go7CyIk0GGIqKZZcWPuuNy/4zGRvkKbFkxBK+iW9Rz+/qfB9XYV
         /WSVLrQtJP8v5iFQ+qdzdcyYLVue4MMRsQmvXNerPZLHo2awt7LCC+Li6OqYRVbHTUK5
         Q1e+xbZWZskinoGsq1xdtujaRNVq7bAF/mE8m2hWF6ZZoi/SRSnw+9ZwO/oZNOGZzAZO
         qry/cLe/kb30APj4WUo452eExX/POgye4Sec14KHkHf112rg7x3chSkHMDZ4Ibvg3315
         Z2xw==
X-Gm-Message-State: AOAM532EZ6FV3cyebNGM/mWtBYKqHHOe1RDVaQGaQN9lhCqZ9AfiRYeh
	o3KkdN1E2Xk38+h2V8aeLEIZ/zi6vIBjGZaO9bk8KZ0sVuTmIHPAk/s0mV16v0ggzKUkXaXuEen
	XEaVCwK2RgauYLr+yzR/8TZ9HcEK4P2V9pQ==
X-Received: by 2002:aa7:d899:: with SMTP id u25mr5235995edq.151.1627555244991;
        Thu, 29 Jul 2021 03:40:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMKAksyF3AW0hIGXPExSWFsWMbbCfBv5+3b/l89XwAlprPzNEk1BKJXCgyG6dSfPdtfqSgng==
X-Received: by 2002:aa7:d899:: with SMTP id u25mr5235980edq.151.1627555244811;
        Thu, 29 Jul 2021 03:40:44 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id c14sm824475ejb.78.2021.07.29.03.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 03:40:44 -0700 (PDT)
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
Date: Thu, 29 Jul 2021 12:40:19 +0200
Message-Id: <20210729104022.47761-10-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
References: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 6EZPFVIJERGXNG22FENESX3Y6K2F7DN2
X-Message-ID-Hash: 6EZPFVIJERGXNG22FENESX3Y6K2F7DN2
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 09/12] nfc: fdp: constify several pointers
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/6EZPFVIJERGXNG22FENESX3Y6K2F7DN2/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Several functions do not modify pointed data so arguments and local
variables can be const for correctness and safety.  This allows also
making file-scope nci_core_get_config_otp_ram_version array const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/fdp/fdp.c | 18 +++++++++---------
 drivers/nfc/fdp/fdp.h |  2 +-
 drivers/nfc/fdp/i2c.c |  6 +++---
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/nfc/fdp/fdp.c b/drivers/nfc/fdp/fdp.c
index 3f5fba922c4d..c6b3334f24c9 100644
--- a/drivers/nfc/fdp/fdp.c
+++ b/drivers/nfc/fdp/fdp.c
@@ -52,7 +52,7 @@ struct fdp_nci_info {
 	u32 limited_otp_version;
 	u8 key_index;
 
-	u8 *fw_vsc_cfg;
+	const u8 *fw_vsc_cfg;
 	u8 clock_type;
 	u32 clock_freq;
 
@@ -65,7 +65,7 @@ struct fdp_nci_info {
 	wait_queue_head_t setup_wq;
 };
 
-static u8 nci_core_get_config_otp_ram_version[5] = {
+static const u8 nci_core_get_config_otp_ram_version[5] = {
 	0x04,
 	NCI_PARAM_ID_FW_RAM_VERSION,
 	NCI_PARAM_ID_FW_OTP_VERSION,
@@ -111,7 +111,7 @@ static inline int fdp_nci_patch_cmd(struct nci_dev *ndev, u8 type)
 }
 
 static inline int fdp_nci_set_production_data(struct nci_dev *ndev, u8 len,
-					      char *data)
+					      const char *data)
 {
 	return nci_prop_cmd(ndev, NCI_OP_PROP_SET_PDATA_OID, len, data);
 }
@@ -236,7 +236,7 @@ static int fdp_nci_send_patch(struct nci_dev *ndev, u8 conn_id, u8 type)
 
 static int fdp_nci_open(struct nci_dev *ndev)
 {
-	struct fdp_nci_info *info = nci_get_drvdata(ndev);
+	const struct fdp_nci_info *info = nci_get_drvdata(ndev);
 
 	return info->phy_ops->enable(info->phy);
 }
@@ -260,7 +260,7 @@ static int fdp_nci_request_firmware(struct nci_dev *ndev)
 {
 	struct fdp_nci_info *info = nci_get_drvdata(ndev);
 	struct device *dev = &info->phy->i2c_dev->dev;
-	u8 *data;
+	const u8 *data;
 	int r;
 
 	r = request_firmware(&info->ram_patch, FDP_RAM_PATCH_NAME, dev);
@@ -269,7 +269,7 @@ static int fdp_nci_request_firmware(struct nci_dev *ndev)
 		return r;
 	}
 
-	data = (u8 *) info->ram_patch->data;
+	data = info->ram_patch->data;
 	info->ram_patch_version =
 		data[FDP_FW_HEADER_SIZE] |
 		(data[FDP_FW_HEADER_SIZE + 1] << 8) |
@@ -610,9 +610,9 @@ static int fdp_nci_core_get_config_rsp_packet(struct nci_dev *ndev,
 {
 	struct fdp_nci_info *info = nci_get_drvdata(ndev);
 	struct device *dev = &info->phy->i2c_dev->dev;
-	struct nci_core_get_config_rsp *rsp = (void *) skb->data;
+	const struct nci_core_get_config_rsp *rsp = (void *) skb->data;
 	unsigned int i;
-	u8 *p;
+	const u8 *p;
 
 	if (rsp->status == NCI_STATUS_OK) {
 
@@ -691,7 +691,7 @@ static const struct nci_ops nci_ops = {
 int fdp_nci_probe(struct fdp_i2c_phy *phy, const struct nfc_phy_ops *phy_ops,
 			struct nci_dev **ndevp, int tx_headroom,
 			int tx_tailroom, u8 clock_type, u32 clock_freq,
-			u8 *fw_vsc_cfg)
+			const u8 *fw_vsc_cfg)
 {
 	struct device *dev = &phy->i2c_dev->dev;
 	struct fdp_nci_info *info;
diff --git a/drivers/nfc/fdp/fdp.h b/drivers/nfc/fdp/fdp.h
index dc048d4b977e..2e9161a4d7bf 100644
--- a/drivers/nfc/fdp/fdp.h
+++ b/drivers/nfc/fdp/fdp.h
@@ -23,7 +23,7 @@ struct fdp_i2c_phy {
 
 int fdp_nci_probe(struct fdp_i2c_phy *phy, const struct nfc_phy_ops *phy_ops,
 		  struct nci_dev **ndev, int tx_headroom, int tx_tailroom,
-		  u8 clock_type, u32 clock_freq, u8 *fw_vsc_cfg);
+		  u8 clock_type, u32 clock_freq, const u8 *fw_vsc_cfg);
 void fdp_nci_remove(struct nci_dev *ndev);
 
 #endif /* __LOCAL_FDP_H_ */
diff --git a/drivers/nfc/fdp/i2c.c b/drivers/nfc/fdp/i2c.c
index 98e1876c9468..051c43a2a52f 100644
--- a/drivers/nfc/fdp/i2c.c
+++ b/drivers/nfc/fdp/i2c.c
@@ -36,7 +36,7 @@
 	print_hex_dump(KERN_DEBUG, prefix": ", DUMP_PREFIX_OFFSET,	\
 		       16, 1, (skb)->data, (skb)->len, 0)
 
-static void fdp_nci_i2c_reset(struct fdp_i2c_phy *phy)
+static void fdp_nci_i2c_reset(const struct fdp_i2c_phy *phy)
 {
 	/* Reset RST/WakeUP for at least 100 micro-second */
 	gpiod_set_value_cansleep(phy->power_gpio, FDP_POWER_OFF);
@@ -47,7 +47,7 @@ static void fdp_nci_i2c_reset(struct fdp_i2c_phy *phy)
 
 static int fdp_nci_i2c_enable(void *phy_id)
 {
-	struct fdp_i2c_phy *phy = phy_id;
+	const struct fdp_i2c_phy *phy = phy_id;
 
 	fdp_nci_i2c_reset(phy);
 
@@ -56,7 +56,7 @@ static int fdp_nci_i2c_enable(void *phy_id)
 
 static void fdp_nci_i2c_disable(void *phy_id)
 {
-	struct fdp_i2c_phy *phy = phy_id;
+	const struct fdp_i2c_phy *phy = phy_id;
 
 	fdp_nci_i2c_reset(phy);
 }
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
