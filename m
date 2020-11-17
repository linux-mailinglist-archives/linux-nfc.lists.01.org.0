Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D3D2B5AC0
	for <lists+linux-nfc@lfdr.de>; Tue, 17 Nov 2020 09:10:00 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E9BED100EC1F0;
	Tue, 17 Nov 2020 00:09:58 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=203.254.224.24; helo=mailout1.samsung.com; envelope-from=bongsu.jeon@samsung.com; receiver=<UNKNOWN> 
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 93F44100EC1EF
	for <linux-nfc@lists.01.org>; Tue, 17 Nov 2020 00:09:56 -0800 (PST)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20201117080953epoutp0176f2b0e5be4bb10c616e8f94121d3a4d~IPTuwjRxV2823328233epoutp01L
	for <linux-nfc@lists.01.org>; Tue, 17 Nov 2020 08:09:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20201117080953epoutp0176f2b0e5be4bb10c616e8f94121d3a4d~IPTuwjRxV2823328233epoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1605600593;
	bh=dCmxhy5s9Mcin3phiFHXYXGOkWV8BdsKt8R6e2aPvKc=;
	h=Subject:Reply-To:From:To:CC:Date:References:From;
	b=Se+KObniKtk5vbnuyAxktsX91dxqZwsIJCkAh0ACmrX3/J/3zXI/9KeWhB5ow2Xjy
	 vaf4jx0wAfZ0xZh8FadIYR9ftKvTMCecf7VVDKoX1hi334/pb2LiY0cXKilcHH7cp0
	 FHF9IDBEM8EMGcYiBTUkV5rGtCeyrV+w/jVlYwgE=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20201117080953epcas2p349509c29311d7e0f63b3aa3827fb5eb9~IPTuatetY1707917079epcas2p3K;
	Tue, 17 Nov 2020 08:09:53 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.186]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4CZzBR49WpzMqYm9; Tue, 17 Nov
	2020 08:09:51 +0000 (GMT)
X-AuditID: b6c32a45-34dff7000001297d-59-5fb3854edf35
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	D7.2C.10621.E4583BF5; Tue, 17 Nov 2020 17:09:50 +0900 (KST)
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
Message-ID: <20201117080950epcms2p4d332688ce351321c3222734bca680b57@epcms2p4>
Date: Tue, 17 Nov 2020 17:09:50 +0900
X-CMS-MailID: 20201117080950epcms2p4d332688ce351321c3222734bca680b57
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNKsWRmVeSWpSXmKPExsWy7bCmha5f6+Z4g0kPFCy2NE9it7g9cRqb
	xfnzG9gtLu+aw2YxZ8NmdotjC8Qc2Dw2repk8+ie/Y/Fo2/LKkaPz5vkAliicmwyUhNTUosU
	UvOS81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJzgHYrKZQl5pQChQISi4uV
	9O1sivJLS1IVMvKLS2yVUgtScgoMDQv0ihNzi0vz0vWS83OtDA0MjEyBKhNyMk7fe8lecJu1
	Yv7E10wNjI9Zuhg5OSQETCSWHugHsrk4hAR2MEqcbHrD3MXIwcErICjxd4cwiCksECjxqTsI
	pFxIQFHif8c5NhBbWEBX4sXfo2A2m4C2xNqjjUwg5SICIRIf+2pBJjILrGaU6PzZyQyxildi
	RvtTqLXSEtuXb2WEsDUkfizrhaoRlbi5+i07jP3+2HyoGhGJ1ntnoWoEJR783A0Vl5R4u28e
	O8gyCYF2RonzP3+wQTgzGCVObf4L1aEvsfjcCiaIv3wlWvaKgYRZBFQlnp1/wwpR4iJx7d1b
	sKHMAvIS29/OAQcDs4CmxPpd+iCmhICyxJFbLBAVfBIdh/+yw7y1Y94TJghbVaK3+QsTzIuT
	Z7dAnekhcbBtGRskCAMlXkxpYprAqDALEc6zkOydhbB3ASPzKkax1ILi3PTUYqMCQ+So3cQI
	ToVarjsYJ7/9oHeIkYmD8RCjBAezkgivi8nGeCHelMTKqtSi/Pii0pzU4kOMpkAfT2SWEk3O
	BybjvJJ4Q1MjMzMDS1MLUzMjCyVx3tCVffFCAumJJanZqakFqUUwfUwcnFINTBtaRC+cWKvk
	u3pXW+KDez535C2aZTreJ7qGnxbfWW7tH7HhZdLvqunsok9fdPe1V+/RKt9iw+ih+0o84dR+
	j2ezTCwWM1ybs+5+y2UfbsGI4wl6J+/eLC3qXXWysKhJXfRH7/pP884oM2r9n3Xo2LvtKrE7
	JrjNbS5LuJ6nMXWtfG/zecMv59tPLje+JrLj/P2NU58z7r5fqPrf/Ur1s4CZulUq+3iWfJ66
	b8aXZ1v8V6Rmp12b5/Tu3An7OdM1vlf4Mfhs+l58KqOz9GTvGeZaT+WoLX9k1q63Mb39nO/M
	9HsHWNOWvBA8JvrAZdOCyrn8ZW9+aAV7HHF4cjtqg+zfrO4Zy0TmrTznfnnt4YAKJZbijERD
	Leai4kQAjYaWGA4EAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201117080950epcms2p4d332688ce351321c3222734bca680b57
References: <CGME20201117080950epcms2p4d332688ce351321c3222734bca680b57@epcms2p4>
Message-ID-Hash: YZG5SNA7265Z3E6BCJN3M5OCSOUXHCS2
X-Message-ID-Hash: YZG5SNA7265Z3E6BCJN3M5OCSOUXHCS2
X-MailFrom: bongsu.jeon@samsung.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.1.1
Precedence: list
Reply-To: bongsu.jeon@samsung.com
Subject: [linux-nfc] [PATCH net-next v2 2/3] nfc: s3fwrn5: Fix the misspelling in a comment
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/YZG5SNA7265Z3E6BCJN3M5OCSOUXHCS2/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

stucture should be replaced by structure.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/s3fwrn5/firmware.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/s3fwrn5/firmware.c b/drivers/nfc/s3fwrn5/firmware.c
index ec930ee2c847..4cde6dd5c019 100644
--- a/drivers/nfc/s3fwrn5/firmware.c
+++ b/drivers/nfc/s3fwrn5/firmware.c
@@ -266,7 +266,7 @@ static int s3fwrn5_fw_complete_update_mode(struct s3fwrn5_fw_info *fw_info)
 }
 
 /*
- * Firmware header stucture:
+ * Firmware header structure:
  *
  * 0x00 - 0x0B : Date and time string (w/o NUL termination)
  * 0x10 - 0x13 : Firmware version
-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
