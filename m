Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7412B5619
	for <lists+linux-nfc@lfdr.de>; Tue, 17 Nov 2020 02:16:23 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4A604100EC1E8;
	Mon, 16 Nov 2020 17:16:22 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=203.254.224.34; helo=mailout4.samsung.com; envelope-from=bongsu.jeon@samsung.com; receiver=<UNKNOWN> 
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id A21FD100EC1CB
	for <linux-nfc@lists.01.org>; Mon, 16 Nov 2020 17:16:19 -0800 (PST)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20201117011616epoutp04f0e4b745cdff122e52588ee6e9537c1f~IJqllTiG13133731337epoutp04Z
	for <linux-nfc@lists.01.org>; Tue, 17 Nov 2020 01:16:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20201117011616epoutp04f0e4b745cdff122e52588ee6e9537c1f~IJqllTiG13133731337epoutp04Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1605575776;
	bh=JHbfhQmZY2Kdf9uCqVWWi/pKiuSfpP7K0ZJj50SZUM0=;
	h=Subject:Reply-To:From:To:CC:Date:References:From;
	b=ZnUyLObvDW1gdN6IzQCUNArBCn2SCsKdKFSgX0GPRot4UeGfIwG43tPykMWH1X5kv
	 t65NzE9krznNYJU8fEkg9inWSE3WQUf5DSUscWpIuGWyB5dM3z2iY/8ht1/sEC3swT
	 8GoR0CR811KCVBNm3h2FjOR1K3RoacJrGsngW6GI=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20201117011615epcas2p209777b38dfd23e07fee8a9a06af390dd~IJqlUGGmv2294422944epcas2p2e;
	Tue, 17 Nov 2020 01:16:15 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.186]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4CZp1B1WVGzMqYkq; Tue, 17 Nov
	2020 01:16:14 +0000 (GMT)
X-AuditID: b6c32a47-72bff7000000d2c4-52-5fb3245c58b0
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	7C.49.53956.C5423BF5; Tue, 17 Nov 2020 10:16:12 +0900 (KST)
Mime-Version: 1.0
Sender: Bongsu Jeon <bongsu.jeon@samsung.com>
From: Bongsu Jeon <bongsu.jeon@samsung.com>
To: "krzk@kernel.org" <krzk@kernel.org>, Krzysztof Opasiak
	<k.opasiak@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20201117011611epcms2p22fb0315814144e94856a96014c376a04@epcms2p2>
Date: Tue, 17 Nov 2020 10:16:11 +0900
X-CMS-MailID: 20201117011611epcms2p22fb0315814144e94856a96014c376a04
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLKsWRmVeSWpSXmKPExsWy7bCmmW6MyuZ4g89LJCy2NE9it7g9cRqb
	xfnzG9gtLu+aw2YxZ8NmdotjC8Qc2Dw2repk8+ie/Y/Fo2/LKkaPz5vkAliicmwyUhNTUosU
	UvOS81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJzgHYrKZQl5pQChQISi4uV
	9O1sivJLS1IVMvKLS2yVUgtScgoMDQv0ihNzi0vz0vWS83OtDA0MjEyBKhNyMjpmNjAVnBCu
	eH9jLWMD40aBLkZODgkBE4lHd1pZuhi5OIQEdjBKvH07na2LkYODV0BQ4u8OYZAaYQFXic3X
	V7KB2EICihL/O86xQcR1JV78PQpmswloS6w92sgE0ioiECLxsa8WZCSzwGpGic6fncwQu3gl
	ZrQ/ZYGwpSW2L9/KCGFrSPxY1gtVIypxc/Vbdhj7/bH5UDUiEq33zkLVCEo8+LkbKi4p8Xbf
	PHaQZRIC7YwS53/+YINwZjBKnNr8F6pDX2LxuRVMIDavgK9E+7LXYHEWAVWJZd2zWCFqXCTW
	9t0Gs5kF5CW2v53DDPINs4CmxPpd+iCmhICyxJFbLBAVfBIdh/+yw/y1Y94TJghbVaK3+QsT
	zI+TZ7dA3ekhcbO/nwUShoESC5ZvYZnAqDALEdKzkOydhbB3ASPzKkax1ILi3PTUYqMCY+TI
	3cQIToda7jsYZ7z9oHeIkYmD8RCjBAezkgivi8nGeCHelMTKqtSi/Pii0pzU4kOMpkAfT2SW
	Ek3OBybkvJJ4Q1MjMzMDS1MLUzMjCyVx3tCVffFCAumJJanZqakFqUUwfUwcnFINTArv54gX
	PzIWOc94RLs1uyjbzHydUvIGjSihr3c1rnz+XNP76l+rEdt36V9fb+XdsJDe/bb79QvOePPd
	UzxnflNaVbD43d+W6Ue6iiR5f662Tm39qajhKb3aedtfgYcrI9Lyjri83St+Q271tPnJR6wM
	NJkf1lS5CO8P3MgbsnTW2SRzvte8/SzHWNqMlM8tny+kLTux78X99YdTGzJlL//45rV8umbp
	1tnqZ89UyMxaef7cbeOj056zCX6bZyN+tmX28h87zFwD7dv7LVvyT+6WnLxU/5hwcFhj7dRV
	fc+UUmOzlNmctL60erJ/Ebk+qZDnv2nK3EsJMR6GB8+/+L5LbtZLvZQS5ajT1gxpS5RYijMS
	DbWYi4oTAUAa2goQBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201117011611epcms2p22fb0315814144e94856a96014c376a04
References: <CGME20201117011611epcms2p22fb0315814144e94856a96014c376a04@epcms2p2>
Message-ID-Hash: T3XORCYRCFIAFOBYCM7RGRLJ5VLHA4GZ
X-Message-ID-Hash: T3XORCYRCFIAFOBYCM7RGRLJ5VLHA4GZ
X-MailFrom: bongsu.jeon@samsung.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.1.1
Precedence: list
Reply-To: bongsu.jeon@samsung.com
Subject: [linux-nfc] [PATCH net-next v2 1/3] nfc: s3fwrn5: Remove the max_payload
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/T3XORCYRCFIAFOBYCM7RGRLJ5VLHA4GZ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

max_payload is unused.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/s3fwrn5/core.c    | 3 +--
 drivers/nfc/s3fwrn5/i2c.c     | 4 +---
 drivers/nfc/s3fwrn5/s3fwrn5.h | 3 +--
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/core.c b/drivers/nfc/s3fwrn5/core.c
index ba6c486d6465..f8e5d78d9078 100644
--- a/drivers/nfc/s3fwrn5/core.c
+++ b/drivers/nfc/s3fwrn5/core.c
@@ -136,7 +136,7 @@ static struct nci_ops s3fwrn5_nci_ops = {
 };
 
 int s3fwrn5_probe(struct nci_dev **ndev, void *phy_id, struct device *pdev,
-	const struct s3fwrn5_phy_ops *phy_ops, unsigned int max_payload)
+	const struct s3fwrn5_phy_ops *phy_ops)
 {
 	struct s3fwrn5_info *info;
 	int ret;
@@ -148,7 +148,6 @@ int s3fwrn5_probe(struct nci_dev **ndev, void *phy_id, struct device *pdev,
 	info->phy_id = phy_id;
 	info->pdev = pdev;
 	info->phy_ops = phy_ops;
-	info->max_payload = max_payload;
 	mutex_init(&info->mutex);
 
 	s3fwrn5_set_mode(info, S3FWRN5_MODE_COLD);
diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
index dc995286be84..0ffa389066a0 100644
--- a/drivers/nfc/s3fwrn5/i2c.c
+++ b/drivers/nfc/s3fwrn5/i2c.c
@@ -19,7 +19,6 @@
 
 #define S3FWRN5_I2C_DRIVER_NAME "s3fwrn5_i2c"
 
-#define S3FWRN5_I2C_MAX_PAYLOAD 32
 #define S3FWRN5_EN_WAIT_TIME 150
 
 struct s3fwrn5_i2c_phy {
@@ -248,8 +247,7 @@ static int s3fwrn5_i2c_probe(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 
-	ret = s3fwrn5_probe(&phy->ndev, phy, &phy->i2c_dev->dev, &i2c_phy_ops,
-		S3FWRN5_I2C_MAX_PAYLOAD);
+	ret = s3fwrn5_probe(&phy->ndev, phy, &phy->i2c_dev->dev, &i2c_phy_ops);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/nfc/s3fwrn5/s3fwrn5.h b/drivers/nfc/s3fwrn5/s3fwrn5.h
index ede68bb5eeae..9d5f34759225 100644
--- a/drivers/nfc/s3fwrn5/s3fwrn5.h
+++ b/drivers/nfc/s3fwrn5/s3fwrn5.h
@@ -34,7 +34,6 @@ struct s3fwrn5_info {
 	struct device *pdev;
 
 	const struct s3fwrn5_phy_ops *phy_ops;
-	unsigned int max_payload;
 
 	struct s3fwrn5_fw_info fw_info;
 
@@ -79,7 +78,7 @@ static inline int s3fwrn5_write(struct s3fwrn5_info *info, struct sk_buff *skb)
 }
 
 int s3fwrn5_probe(struct nci_dev **ndev, void *phy_id, struct device *pdev,
-	const struct s3fwrn5_phy_ops *phy_ops, unsigned int max_payload);
+	const struct s3fwrn5_phy_ops *phy_ops);
 void s3fwrn5_remove(struct nci_dev *ndev);
 
 int s3fwrn5_recv_frame(struct nci_dev *ndev, struct sk_buff *skb,
-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
