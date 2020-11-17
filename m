Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 998ED2B5617
	for <lists+linux-nfc@lfdr.de>; Tue, 17 Nov 2020 02:14:30 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 1B736100EC1CB;
	Mon, 16 Nov 2020 17:14:29 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=203.254.224.25; helo=mailout2.samsung.com; envelope-from=bongsu.jeon@samsung.com; receiver=<UNKNOWN> 
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 0A593100ED4BF
	for <linux-nfc@lists.01.org>; Mon, 16 Nov 2020 17:14:26 -0800 (PST)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20201117011423epoutp02bc76df0a22539b1f5ab084c5fa1cc215~IJo8umx6L1172611726epoutp02M
	for <linux-nfc@lists.01.org>; Tue, 17 Nov 2020 01:14:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20201117011423epoutp02bc76df0a22539b1f5ab084c5fa1cc215~IJo8umx6L1172611726epoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1605575663;
	bh=7k8O9yozzoFciLJ0MuDuPiI5gk7/ogB2SzuNGpq4xBg=;
	h=Subject:Reply-To:From:To:CC:Date:References:From;
	b=V1/pY0q6CGa+x8hJyQ1N8qUovr6jO6iMlryz7LhrLtv/EpaE9LEKe6+P7jbfIdLfB
	 2xh/HPNCKsjja8N+z8VDORCazgG6U9UuqmKLKwOK3FGniHSLXpYYQuolhxZR0W7bSj
	 Bx9VovfAkh2N3jo44s3e4+OeXelugEX4L5uHr5WI=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20201117011423epcas2p1d6b1606848e9154335aa6505b12906e8~IJo8aFXDn1946919469epcas2p16;
	Tue, 17 Nov 2020 01:14:23 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.189]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4CZnz05nnvzMqYm5; Tue, 17 Nov
	2020 01:14:20 +0000 (GMT)
X-AuditID: b6c32a45-8dc16a800001297d-54-5fb323ec3a39
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	6C.E1.10621.CE323BF5; Tue, 17 Nov 2020 10:14:20 +0900 (KST)
Mime-Version: 1.0
Sender: Bongsu Jeon <bongsu.jeon@samsung.com>
From: Bongsu Jeon <bongsu.jeon@samsung.com>
To: "krzk@kernel.org" <krzk@kernel.org>, Krzysztof Opasiak
	<k.opasiak@samsung.com>, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20201117011420epcms2p28407a6596fdf1e63cb84af98fa768566@epcms2p2>
Date: Tue, 17 Nov 2020 10:14:20 +0900
X-CMS-MailID: 20201117011420epcms2p28407a6596fdf1e63cb84af98fa768566
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLKsWRmVeSWpSXmKPExsWy7bCmqe4b5c3xBpOn6llsaZ7EbnF74jQ2
	i/PnN7BbXN41h81izobN7BbHFog5sHlsWtXJ5tE9+x+LR9+WVYwenzfJBbBE5dhkpCampBYp
	pOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5+AToumXmAO1WUihLzCkFCgUkFhcr
	6dvZFOWXlqQqZOQXl9gqpRak5BQYGhboFSfmFpfmpesl5+daGRoYGJkCVSbkZHydnVkwg6Xi
	TXszcwPjAuYuRk4OCQETiStrVrB1MXJxCAnsYJSYsOsaSxcjBwevgKDE3x3CIDXCAl4SD5+/
	ZgWxhQQUJf53nGODiOtKvPh7FMxmE9CWWHu0kQnEFhGolpi2/x0zyExmgdWMEp0/O6GW8UrM
	aH/KAmFLS2xfvpURwtaQ+LGsF6pGVOLm6rfsMPb7Y/OhakQkWu+dhaoRlHjwczdUXFLi7b55
	7CDLJATaGSXO//zBBuHMYJQ4tfkvVIe+xOJzK8DO4xXwldh06RfYOywCqhL75t6EmuQi8efk
	O7DNzALyEtvfzmEGhQSzgKbE+l36IKaEgLLEkVssEBV8Eh2H/7LD/LVj3hMmCFtVorf5CxPM
	j5Nnt0BN95C4dPssIyQQAyVWnnzOPoFRYRYiqGch2TsLYe8CRuZVjGKpBcW56anFRgWGyJG7
	iRGcDrVcdzBOfvtB7xAjEwfjIUYJDmYlEV4Xk43xQrwpiZVVqUX58UWlOanFhxhNgT6eyCwl
	mpwPTMh5JfGGpkZmZgaWphamZkYWSuK8oSv74oUE0hNLUrNTUwtSi2D6mDg4pRqYJqWyPnlS
	+dFA7Xqd0NqXdkfvKR+ZGGqs7PNSfUO/4avGve6Gj8RkE+2nv2A99KOI/aPfQd9JZ0O2/TBn
	+F0q+chI/3Zt01Zbk8eP9dtmf3aYGB79a3pyrZSYz7nXZoI920Is3732WvDtQkLvaTGD5dfS
	e7kW1jm8Ka/I+uLroPKiaP7WDq2zS/cFzTDj+Jkwtbd4vRGf6Bld7Q0vG62VpIRq3z5XN1LT
	L+V6qXMhsoibu3vNaykLDwU23flnjrypbl3AsDC8a8O2kpMzpaNPR3Z7/Tp6rdrn58a7rcfL
	F84TamfeFBX0K+LPE//jKzI3B/0LmnQkZuINq8PKZxOk+lo7Vk+IDZRen8N2auoxJZbijERD
	Leai4kQA+ry43BAEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201117011420epcms2p28407a6596fdf1e63cb84af98fa768566
References: <CGME20201117011420epcms2p28407a6596fdf1e63cb84af98fa768566@epcms2p2>
Message-ID-Hash: 3OKPQPHHHIJCBK5KURDZ4ODIWRGNSN5D
X-Message-ID-Hash: 3OKPQPHHHIJCBK5KURDZ4ODIWRGNSN5D
X-MailFrom: bongsu.jeon@samsung.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.1.1
Precedence: list
Reply-To: bongsu.jeon@samsung.com
Subject: [linux-nfc] [PATCH net-next v2 0/3] nfc: s3fwrn5: Refactor the s3fwrn5 driver
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/3OKPQPHHHIJCBK5KURDZ4ODIWRGNSN5D/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Changes from v1:
- Remove the trailing dot from subject.
- Remove an empty line at beginning of commit message.
- Add a commit message.

Bongsu Jeon (3):
  nfc: s3fwrn5: Remove the max_payload
  nfc: s3fwrn5: Fix the misspelling in a comment
  nfc: s3fwrn5: Change the error code

 drivers/nfc/s3fwrn5/core.c     |  3 +--
 drivers/nfc/s3fwrn5/firmware.c |  2 +-
 drivers/nfc/s3fwrn5/i2c.c      |  4 +---
 drivers/nfc/s3fwrn5/s3fwrn5.h  | 11 +++++------
 4 files changed, 8 insertions(+), 12 deletions(-)

-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
