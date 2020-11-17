Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D990F2B5626
	for <lists+linux-nfc@lfdr.de>; Tue, 17 Nov 2020 02:18:58 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id AD660100EC1EC;
	Mon, 16 Nov 2020 17:18:57 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=203.254.224.34; helo=mailout4.samsung.com; envelope-from=bongsu.jeon@samsung.com; receiver=<UNKNOWN> 
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 48662100EC1EB
	for <linux-nfc@lists.01.org>; Mon, 16 Nov 2020 17:18:56 -0800 (PST)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20201117011853epoutp04fc37199eb01aa923b271d5f8505e5d9b~IJs4b4iVk0204302043epoutp04W
	for <linux-nfc@lists.01.org>; Tue, 17 Nov 2020 01:18:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20201117011853epoutp04fc37199eb01aa923b271d5f8505e5d9b~IJs4b4iVk0204302043epoutp04W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1605575933;
	bh=HH/NqwyXdWOgWXZb8phOo0tVJ5pPS37tojmhBry9IvY=;
	h=Subject:Reply-To:From:To:CC:Date:References:From;
	b=dIABx3ZAVyQqIVCFRLvyTCBEo1AQYREtSbgbHKV2aeDAZKdpM4eK+TChezUI12uDu
	 BVa/HQ6jFuTuHX0anXXgu3hYidWF2VqUOPa2/RovsgiGzobAHWAoJaDntu5iJWWKcW
	 CxarGIcr8wvpv0gAyKprowK9u6/YS2dWKQaNGfT0=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20201117011853epcas2p1054586c2198805cb91d5cd0fcbe745ab~IJs38VKQD0664006640epcas2p1J;
	Tue, 17 Nov 2020 01:18:53 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.181]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4CZp4D1HD7zMqYks; Tue, 17 Nov
	2020 01:18:52 +0000 (GMT)
X-AuditID: b6c32a46-1d9ff7000000dbf8-d9-5fb324fa09cf
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	20.04.56312.AF423BF5; Tue, 17 Nov 2020 10:18:50 +0900 (KST)
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
Message-ID: <20201117011850epcms2p568af074144630cd0f02b3a7f7eff8d1a@epcms2p5>
Date: Tue, 17 Nov 2020 10:18:50 +0900
X-CMS-MailID: 20201117011850epcms2p568af074144630cd0f02b3a7f7eff8d1a
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOJsWRmVeSWpSXmKPExsWy7bCmme4vlc3xBku7dCy2NE9it7g9cRqb
	xfnzG9gtLu+aw2YxZ8NmdotjC8Qc2Dw2repk8+ie/Y/Fo2/LKkaPz5vkAliiGhhtEouSMzLL
	UhVS85LzUzLz0m2VQkPcdC2UFDLyi0tslaINLYz0DC1N9Uws9YzMY60MDQyMTJUU8hJzU22V
	KnShupUUipILgKpLUotLilKTU4FCRQ7FJYnpqXrFibnFpXnpesn5uUoKZYk5pUB9Svp2Nhmp
	iSmpRQoJTxgzui5uZC5Yx1Pxp/0VcwPjGq4uRk4OCQETiSdnVrCC2EICOxglNk/W72Lk4OAV
	EJT4u0MYJCws4CLR++QqG0SJosT/jnNsEHFdiRd/j4LZbALaEmuPNjKBtIoIhEh87KvtYuTi
	YBZYzSjR+bOTGWIVr8SM9qcsELa0xPblWxkhbA2JH8t6oWpEJW6ufssOY78/Nh+qRkSi9d5Z
	qBpBiQc/d0PFJSXe7pvHDrJMQqCdUeL8zx9sEM4MRolTm/9CdehLLD63ggnE5hXwlTi9+QPY
	FSwCqhLndy6A2uYisf74PzCbWUBeYvvbOcwg3zALaEqs3wUOEwkBZYkjt1ggKvgkOg7/ZYf5
	a8e8J0wQtqpEb/MXJpgfJ89ugbrTQ2LT+RXskDAMlLjb1MM2gVFhFiKkZyHZOwth7wJG5lWM
	YqkFxbnpqcVGBUbI8byJEZw4tdx2ME55+0HvECMTB+MhRgkOZiURXheTjfFCvCmJlVWpRfnx
	RaU5qcWHGKuAPp7ILCWanA9M3Xkl8YZmBkZmpsYmxsamJqZkC5samZkZWJpamJoZWSiJ84au
	7IsXEkhPLEnNTk0tSC2CWc7EwSnVwFSUOr9NTIZTME7nRM1Z751Tz1kvlO2otviUZMQYPFn6
	7ymd5qdvs9+ctPjKxbTi+YPdCbPurhHNkj/DocvU220/nXPJ1+DPOgY+yXmrnTc5WNzfnhT1
	z61VRWZxQ26nYUrtmZXzps8QERUpNSz4uNy7/4lNmp7lLUM24cu9xj90X325ZHD4wcsZGoLT
	TrWJbVps1fvJ5vkG8QTHFf0tD+ycZ6Scfu9vkJQzKS/cSsHocMllxjVml373pbU1Tn56dUdU
	UcfkT/N09X9WSLzp3PRC6kvu15D/R6azftuxeLJ+Yf8s9/Qz7M0tit/1bh6MXZb3n2+e7ZEd
	M+fL6+XO8m4quyJV80z5UtPDH8YbpyixFGckGmoxFxUnAgB3Oy1zagQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201117011850epcms2p568af074144630cd0f02b3a7f7eff8d1a
References: <CGME20201117011850epcms2p568af074144630cd0f02b3a7f7eff8d1a@epcms2p5>
Message-ID-Hash: YCW77PVBNMW4SISPDYZ6VR6RM2YL7KIY
X-Message-ID-Hash: YCW77PVBNMW4SISPDYZ6VR6RM2YL7KIY
X-MailFrom: bongsu.jeon@samsung.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.1.1
Precedence: list
Reply-To: bongsu.jeon@samsung.com
Subject: [linux-nfc] [PATCH net-next v2 3/3] nfc: s3fwrn5: Change the error code
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/YCW77PVBNMW4SISPDYZ6VR6RM2YL7KIY/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP.

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
