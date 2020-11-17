Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8042B5AC4
	for <lists+linux-nfc@lfdr.de>; Tue, 17 Nov 2020 09:11:46 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 2FECC100EC1F1;
	Tue, 17 Nov 2020 00:11:45 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=203.254.224.25; helo=mailout2.samsung.com; envelope-from=bongsu.jeon@samsung.com; receiver=<UNKNOWN> 
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id BB447100EC1F0
	for <linux-nfc@lists.01.org>; Tue, 17 Nov 2020 00:11:42 -0800 (PST)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20201117081139epoutp022045153a6f0fac3888335557273927fd~IPVRkL53o3052530525epoutp02O
	for <linux-nfc@lists.01.org>; Tue, 17 Nov 2020 08:11:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20201117081139epoutp022045153a6f0fac3888335557273927fd~IPVRkL53o3052530525epoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1605600699;
	bh=4yuXaRyIkw7lnb4zJhKZ/Mit84x8WVY+2eudUg0qOyo=;
	h=Subject:Reply-To:From:To:CC:Date:References:From;
	b=Tgjr7HS6/g046xJBZ8GjL8WxSNUisCJHqt1vFM5jYij1TBQ+8mJW7ljMAxCy0E7bX
	 a56iyNcM2YieEgFIZLjMS666yCEaBZzssSi5uXxJKi4TecXpolyFC91QJ/KfXvwWGg
	 +uVz3J8xPAQBe/6STPk4Kl0vSjKz8lmO12c76iJU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20201117081139epcas2p2db4464cd223dbb80ab733a9721e190d0~IPVRNuedG1608616086epcas2p2e;
	Tue, 17 Nov 2020 08:11:39 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.187]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4CZzDV1YLpzMqYkZ; Tue, 17 Nov
	2020 08:11:38 +0000 (GMT)
X-AuditID: b6c32a46-1efff7000000dbf8-13-5fb385b9df33
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	67.9B.56312.9B583BF5; Tue, 17 Nov 2020 17:11:37 +0900 (KST)
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
Message-ID: <20201117081137epcms2p84b5dd8d84ca608f44b0bb722b48f50b1@epcms2p8>
Date: Tue, 17 Nov 2020 17:11:37 +0900
X-CMS-MailID: 20201117081137epcms2p84b5dd8d84ca608f44b0bb722b48f50b1
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLKsWRmVeSWpSXmKPExsWy7bCmqe7O1s3xBos3aFtsaZ7EbnF74jQ2
	i/PnN7BbXN41h81izobN7BbHFog5sHlsWtXJ5tE9+x+LR9+WVYwenzfJBbBE5dhkpCampBYp
	pOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5+AToumXmAO1WUihLzCkFCgUkFhcr
	6dvZFOWXlqQqZOQXl9gqpRak5BQYGhboFSfmFpfmpesl5+daGRoYGJkCVSbkZHw5vJa94BFP
	xbGzTxkbGG9zdTFyckgImEi8/bmEqYuRi0NIYAejxNPHh9m7GDk4eAUEJf7uEAapERZwkeh9
	cpUNxBYSUJT433GODSKuK/Hi71Ewm01AW2Lt0UYmkFYRgRCJj321ICOZBVYzSnT+7GSG2MUr
	MaP9KQuELS2xfflWRghbQ+LHsl6oGlGJm6vfssPY74/Nh6oRkWi9dxaqRlDiwc/dUHFJibf7
	5rGDLJMQaGeUOP/zBxuEM4NR4tTmv1Ad+hKLz61gArF5BXwl1r6YC7aBRUBVov35HKhtLhLX
	568Hm8osIC+x/e0cZpBvmAU0Jdbv0gcxJQSUJY7cYoGo4JPoOPyXHeavHfOeMEHYqhK9zV+Y
	YH6cPLsF6k4Pia1fjzFDwjBQYsXnDuYJjAqzECE9C8neWQh7FzAyr2IUSy0ozk1PLTYqMEKO
	3E2M4HSo5baDccrbD3qHGJk4GA8xSnAwK4nwuphsjBfiTUmsrEotyo8vKs1JLT7EaAr08URm
	KdHkfGBCziuJNzQ1MjMzsDS1MDUzslAS5w1d2RcvJJCeWJKanZpakFoE08fEwSnVwBT2u9Hc
	P09m1SHn/cxTnRnfs37YsEPnVuG8b98aLeeUCd+3O7hD7kiR9fMJKxglfbT5Jq63zkxr9fww
	f8WkhUEzZkbPb34xa+py02lhrkHFk/lPveZ8nW+mzabAozWnMCs1lGWWgV/ilsSwxPAl+fqq
	u3V+vTrqKlrh2B129f62t9Mqri58IZP7VDLz7QrHdndW35XzruTk/FhQfo7hVtU3ab71u5z8
	3XmPSP+aqrT5WvG5E4/XKs3TPSYn9IqnlNW4P3n2R4/7C3YEBT2IsTj32OuimnVH8YOPpy5l
	/TKoX5yy7mPlkdun89bKXq9aMUl7n9H61deKNIKjp9jO7WnQYkhv1GEU79y67pfEBFUlluKM
	REMt5qLiRABKcRNLEAQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201117081137epcms2p84b5dd8d84ca608f44b0bb722b48f50b1
References: <CGME20201117081137epcms2p84b5dd8d84ca608f44b0bb722b48f50b1@epcms2p8>
Message-ID-Hash: 22EMII55OYDZS2C4IFMUQIU2HWDBPWMK
X-Message-ID-Hash: 22EMII55OYDZS2C4IFMUQIU2HWDBPWMK
X-MailFrom: bongsu.jeon@samsung.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.1.1
Precedence: list
Reply-To: bongsu.jeon@samsung.com
Subject: [linux-nfc] [PATCH net-next v2 3/3] nfc: s3fwrn5: Change the error code
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/22EMII55OYDZS2C4IFMUQIU2HWDBPWMK/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/s3fwrn5/s3fwrn5.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/s3fwrn5.h b/drivers/nfc/s3fwrn5/s3fwrn5.h
index 9d5f34759225..bb8f936d13a2 100644
--- a/drivers/nfc/s3fwrn5/s3fwrn5.h
+++ b/drivers/nfc/s3fwrn5/s3fwrn5.h
@@ -44,7 +44,7 @@ static inline int s3fwrn5_set_mode(struct s3fwrn5_info *info,
 	enum s3fwrn5_mode mode)
 {
 	if (!info->phy_ops->set_mode)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	info->phy_ops->set_mode(info->phy_id, mode);
 
@@ -54,7 +54,7 @@ static inline int s3fwrn5_set_mode(struct s3fwrn5_info *info,
 static inline enum s3fwrn5_mode s3fwrn5_get_mode(struct s3fwrn5_info *info)
 {
 	if (!info->phy_ops->get_mode)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	return info->phy_ops->get_mode(info->phy_id);
 }
@@ -62,7 +62,7 @@ static inline enum s3fwrn5_mode s3fwrn5_get_mode(struct s3fwrn5_info *info)
 static inline int s3fwrn5_set_wake(struct s3fwrn5_info *info, bool wake)
 {
 	if (!info->phy_ops->set_wake)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	info->phy_ops->set_wake(info->phy_id, wake);
 
@@ -72,7 +72,7 @@ static inline int s3fwrn5_set_wake(struct s3fwrn5_info *info, bool wake)
 static inline int s3fwrn5_write(struct s3fwrn5_info *info, struct sk_buff *skb)
 {
 	if (!info->phy_ops->write)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	return info->phy_ops->write(info->phy_id, skb);
 }
-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
