Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1422B3B23
	for <lists+linux-nfc@lfdr.de>; Mon, 16 Nov 2020 02:18:05 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id D4D6F100ED48C;
	Sun, 15 Nov 2020 17:18:03 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=203.254.224.24; helo=mailout1.samsung.com; envelope-from=bongsu.jeon@samsung.com; receiver=<UNKNOWN> 
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 50715100EF27C
	for <linux-nfc@lists.01.org>; Sun, 15 Nov 2020 17:18:00 -0800 (PST)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20201116011758epoutp015d58f87eca8564dcb9a262e6122ba09c~H2CyWfTqI2847928479epoutp01d
	for <linux-nfc@lists.01.org>; Mon, 16 Nov 2020 01:17:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20201116011758epoutp015d58f87eca8564dcb9a262e6122ba09c~H2CyWfTqI2847928479epoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1605489478;
	bh=TfUkL+lDZElGHDBaFwcjW6Ej9dQR2j3RjB2y/gxXwDA=;
	h=Subject:Reply-To:From:To:CC:Date:References:From;
	b=G9B4mHhMKekONFM4UoRloEqHdvWxFhqgzIZP4RYG2s+H9kqWRVL9eGtEoU8+0OUoI
	 d46zg6+njmf81C504DX+CdYCcoUrjTH9yRmaklqfJhMpfRdSEY0dV+CfKFJFCoVjmI
	 CnHemPqk56+KBEUZFOomjCtwelj+qazcfXWn2/yw=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20201116011757epcas2p3037b44374e4f8131d76ac88492e612cf~H2CxutYmV1171511715epcas2p3z;
	Mon, 16 Nov 2020 01:17:57 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.40.181]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4CZB5c1x9szMqYm9; Mon, 16 Nov
	2020 01:17:56 +0000 (GMT)
X-AuditID: b6c32a48-4f9ff7000000cd1f-0f-5fb1d3444b51
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	3F.A6.52511.443D1BF5; Mon, 16 Nov 2020 10:17:56 +0900 (KST)
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
Message-ID: <20201116011755epcms2p7f7232e0865e8e1bc11a4b528c10d3571@epcms2p7>
Date: Mon, 16 Nov 2020 10:17:55 +0900
X-CMS-MailID: 20201116011755epcms2p7f7232e0865e8e1bc11a4b528c10d3571
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNKsWRmVeSWpSXmKPExsWy7bCmua7L5Y3xBhc2s1psaZ7EbnF74jQ2
	i/PnN7BbXN41h81izobN7BbHFog5sHlsWtXJ5tE9+x+LR9+WVYwenzfJBbBE5dhkpCampBYp
	pOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5+AToumXmAO1WUihLzCkFCgUkFhcr
	6dvZFOWXlqQqZOQXl9gqpRak5BQYGhboFSfmFpfmpesl5+daGRoYGJkCVSbkZBxdeZypYDlr
	Rc/uC2wNjFtYuhg5OSQETCQ2fpoDZgsJ7GCUuHlCtYuRg4NXQFDi7w5hkLCwgI9Ez6mHTBAl
	ihL/O86xQcR1JV78PQpmswloS6w92sgE0ioiECLxsa+2i5GLg1lgNaNE589OZohVvBIz2p9C
	rZWW2L58KyOErSHxY1kvVI2oxM3Vb9lh7PfH5kPViEi03jsLVSMo8eDnbqi4pMTbffPYQZZJ
	CLQzSpz/+YMNwpnBKHFq81+oDn2JxedWgH3AK+ArcXX1HzCbRUBVYs7KE2wgV0sIuEgcu2oE
	EmYWkJfY/nYOM0iYWUBTYv0ufYgKZYkjt1ggKvgkOg7/ZYd5a8e8J0wQtqpEb/MXJpgXJ89u
	gTrTQ2LVpPvQIAyUeHd+IdsERoVZiICehWTvLIS9CxiZVzGKpRYU56anFhsVmCBH7SZGcCrU
	8tjBOPvtB71DjEwcjIcYJTiYlUR4XUw2xgvxpiRWVqUW5ccXleakFh9iNAV6eCKzlGhyPjAZ
	55XEG5oamZkZWJpamJoZWSiJ84au7IsXEkhPLEnNTk0tSC2C6WPi4JRqYDppVtURG6G3SLzK
	smb/salJnbcO1tnK87Oe8nl/Yp/n50mVR57MqneaE3bq9o3kysmGu7fv7Uy7cDUn64WW6LnQ
	QpGYp5aaSTFLmzJ9Mo0v+OddLLeLqsqZ3LQqZZm/au+pqIAriUEyx6aEXl0xy+F7gvLUnPAd
	WT6x+77M2HvHMtqR/dyRO61zzt28YcTY8/zyBuv3vGIWXHxMWnJTF+w2+3Mpe4P1lLikOXfc
	33QnRcazlLW2lzZMUdZxX2sv3y5/a1/q+p54D+lzb7Uzy15x6ARabPSP9awXY4te8OD8r6sX
	Hx5j10jca3zfN/Le+QdXPzxvu/4qIijiTMvLxO7YlLRzGwQmnGIzuiAYqsRSnJFoqMVcVJwI
	AERCqPcOBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201116011755epcms2p7f7232e0865e8e1bc11a4b528c10d3571
References: <CGME20201116011755epcms2p7f7232e0865e8e1bc11a4b528c10d3571@epcms2p7>
Message-ID-Hash: QZ5TJOKR4VOOT7IUZHUVQIIGAVEK7U4K
X-Message-ID-Hash: QZ5TJOKR4VOOT7IUZHUVQIIGAVEK7U4K
X-MailFrom: bongsu.jeon@samsung.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.1.1
Precedence: list
Reply-To: bongsu.jeon@samsung.com
Subject: [linux-nfc] [PATCH net-next 2/3] nfc: s3fwrn5: Fix the misspelling in a comment
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/QZ5TJOKR4VOOT7IUZHUVQIIGAVEK7U4K/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

stucture should be replaced by structure.

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
