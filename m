Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 380192B5AB4
	for <lists+linux-nfc@lfdr.de>; Tue, 17 Nov 2020 09:08:35 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id C60A2100EC1EF;
	Tue, 17 Nov 2020 00:08:33 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=203.254.224.34; helo=mailout4.samsung.com; envelope-from=bongsu.jeon@samsung.com; receiver=<UNKNOWN> 
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 6EB4E100EC1DE
	for <linux-nfc@lists.01.org>; Tue, 17 Nov 2020 00:08:30 -0800 (PST)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20201117080827epoutp04f2c95c588ab1ef3571220686bc5aa4af~IPSepp5Mg0693506935epoutp04T
	for <linux-nfc@lists.01.org>; Tue, 17 Nov 2020 08:08:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20201117080827epoutp04f2c95c588ab1ef3571220686bc5aa4af~IPSepp5Mg0693506935epoutp04T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1605600507;
	bh=zJSngcK/bFdgmZup9U49BIcrgy3X3io44G95eX4tVAc=;
	h=Subject:Reply-To:From:To:CC:Date:References:From;
	b=vb+nLj+zJOXKX3mM9A8l4cpTJW8LpRmoFBDCI+05Zu178SthlWVW2YqQ8fqbi71MK
	 Wk7eI3gh0jWSUoNS7bANu+dKAAIdYxznxf9SD31BGHnkWrFhDoIXjny/LnDDUr84bw
	 VhMWFnD6wEqvIo6y7o0JqkrEJI1/W3ecbmfhyQR8=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20201117080827epcas2p391726673adeb25b98f6733fcd99e36e1~IPSeTqOs42488224882epcas2p3d;
	Tue, 17 Nov 2020 08:08:27 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.182]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4CZz8n2xRPzMqYkg; Tue, 17 Nov
	2020 08:08:25 +0000 (GMT)
X-AuditID: b6c32a47-715ff7000000d2c4-8d-5fb384f84339
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	EA.C5.53956.8F483BF5; Tue, 17 Nov 2020 17:08:24 +0900 (KST)
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
Message-ID: <20201117080824epcms2p36f70e06e2d8bd51d1af278b26ca65725@epcms2p3>
Date: Tue, 17 Nov 2020 17:08:24 +0900
X-CMS-MailID: 20201117080824epcms2p36f70e06e2d8bd51d1af278b26ca65725
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDKsWRmVeSWpSXmKPExsWy7bCmme6Pls3xBh/ua1lsaZ7EbnF74jQ2
	i/PnN7BbXN41h81izobN7BbHFog5sHlsWtXJ5tE9+x+LR9+WVYwenzfJBbBE5dhkpCampBYp
	pOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5+AToumXmAO1WUihLzCkFCgUkFhcr
	6dvZFOWXlqQqZOQXl9gqpRak5BQYGhboFSfmFpfmpesl5+daGRoYGJkCVSbkZJydc5Cp4I9w
	xasDd5gbGB8IdDFyckgImEh82nCMvYuRi0NIYAejxOV7O1i6GDk4eAUEJf7uEAapERZwldh8
	fSUbiC0koCjxv+McG0RcV+LF36NgNpuAtsTao41MIK0iAiESH/tqQUYyC6xmlOj82ckMsYtX
	Ykb7UxYIW1pi+/KtjBC2hsSPZb1QNaISN1e/ZYex3x+bD1UjItF67yxUjaDEg5+7oeKSEm/3
	zQO7X0KgnVHi/M8fbBDODEaJU5v/QnXoSyw+t4IJxOYV8JX41/UHLM4ioCrR0n+IDeRqCQEX
	ib1rFUDCzALyEtvfzmEGCTMLaEqs36UPUaEsceQWC0QFn0TH4b/sMG/tmPeECcJWleht/sIE
	8+Lk2S1QZ3pIfJtwiQUShIESv//eYpzAqDALEdCzkOydhbB3ASPzKkax1ILi3PTUYqMCY+S4
	3cQIToZa7jsYZ7z9oHeIkYmD8RCjBAezkgivi8nGeCHelMTKqtSi/Pii0pzU4kOMpkAPT2SW
	Ek3OB6bjvJJ4Q1MjMzMDS1MLUzMjCyVx3tCVffFCAumJJanZqakFqUUwfUwcnFINTOm1+ekb
	pXjfaH9wyQyYc0htOdfHBxFP/VPvzM3l/1/247ybTuL37bOTq+/d+ZdlVVMql1kV9u7T7yNn
	zxd1vXVetX/LT1cPLqull51C41Y8vsfj94JT6774swreawIKKffWdsTO4FL4cYX50CPXzQ4T
	1e3EFjRZLpxreuXVvYs8h3T6364RUme/0DBZdYdOgJeD9NWALd4qktdVy2bJTGY12tJgcGjl
	5cQlD2yyTU+ZreQ8bi+QvuOhorn20ZiYMOPwj361P79mSWswf5pp2+WvfIBtznxGXqWXs/OO
	VuzaInot1vzd5O1X85wnmrgnMD3O6eDRfZ1qckayVT1IZrN4XqiV7A6HfP5v+3jylFiKMxIN
	tZiLihMBHW8PgQ8EAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201117080824epcms2p36f70e06e2d8bd51d1af278b26ca65725
References: <CGME20201117080824epcms2p36f70e06e2d8bd51d1af278b26ca65725@epcms2p3>
Message-ID-Hash: GKZ2AVWF5GQT5LCK4CMGEWD7YX4WMHTF
X-Message-ID-Hash: GKZ2AVWF5GQT5LCK4CMGEWD7YX4WMHTF
X-MailFrom: bongsu.jeon@samsung.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.1.1
Precedence: list
Reply-To: bongsu.jeon@samsung.com
Subject: [linux-nfc] [PATCH net-next v2 1/3] nfc: s3fwrn5: Remove the max_payload
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/GKZ2AVWF5GQT5LCK4CMGEWD7YX4WMHTF/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

max_payload is unused.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
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
