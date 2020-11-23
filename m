Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 709DA2C00E3
	for <lists+linux-nfc@lfdr.de>; Mon, 23 Nov 2020 08:55:37 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id CBFC7100EC1C7;
	Sun, 22 Nov 2020 23:55:35 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=203.254.224.24; helo=mailout1.samsung.com; envelope-from=bongsu.jeon@samsung.com; receiver=<UNKNOWN> 
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 47655100ED4BA
	for <linux-nfc@lists.01.org>; Sun, 22 Nov 2020 23:55:32 -0800 (PST)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20201123075530epoutp01f1e955a63f4acf13f6cea16704b34019~KE_4Kzz2V1249212492epoutp01O
	for <linux-nfc@lists.01.org>; Mon, 23 Nov 2020 07:55:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20201123075530epoutp01f1e955a63f4acf13f6cea16704b34019~KE_4Kzz2V1249212492epoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1606118130;
	bh=QaPoV2LoZTG2RgUzI5C1Hw6+KlJ9n9VMoWukaX1Jp4M=;
	h=Subject:Reply-To:From:To:CC:Date:References:From;
	b=chFVYJrgY3HBNtxHXuJht2H5x/mdXQ9x4ucI57BRO9qWyzGoOguCxwM/S7US3/QJW
	 bV55jgXSZPVzB//7jdCkBHcsfYSm/Khljwu2nCpHK1za59R2XhNg1L090ZOlJ7DNyY
	 LYfCpSng6PPrHz946Loc8m3pZhrC9xqG8qNN/Vvk=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20201123075530epcas2p4016b99ddd41098dedde209532a52b30c~KE_3_7Ygr3099330993epcas2p4T;
	Mon, 23 Nov 2020 07:55:30 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.182]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4Cffb367SMzMqYkr; Mon, 23 Nov
	2020 07:55:27 +0000 (GMT)
X-AuditID: b6c32a46-1d9ff7000000dbf8-ac-5fbb6aee8105
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	38.36.56312.EEA6BBF5; Mon, 23 Nov 2020 16:55:26 +0900 (KST)
Mime-Version: 1.0
Sender: Bongsu Jeon <bongsu.jeon@samsung.com>
From: Bongsu Jeon <bongsu.jeon@samsung.com>
To: "krzk@kernel.org" <krzk@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20201123075526epcms2p59410a8ba942f8942f53a593d9df764d0@epcms2p5>
Date: Mon, 23 Nov 2020 16:55:26 +0900
X-CMS-MailID: 20201123075526epcms2p59410a8ba942f8942f53a593d9df764d0
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEJsWRmVeSWpSXmKPExsWy7bCmue67rN3xBhcfK1jMP3KO1eL8+Q3s
	Fhe29bFaXN41h81izobN7BbHFog5sHlsWtXJ5tE9+x+Lx+dNcgHMUQ2MNolFyRmZZakKqXnJ
	+SmZeem2SqEhbroWSgoZ+cUltkrRhhZGeoaWpnomlnpG5rFWhgYGRqZKCnmJuam2ShW6UN1K
	CkXJBUDVJanFJUWpyalAoSKH4pLE9FS94sTc4tK8dL3k/FwlhbLEnFKgPiV9O5uM1MSU1CKF
	hCeMGX+ePmYqOMBTMXWPTgNjB2cXIweHhICJxI2til2MXBxCAjsYJX41LmIBifMKCEr83SHc
	xcjJISwQIXG88SsTiC0koCjxv+McG0RcV+LF36NgNpuAtsTao41gNSICPhILdyxgApnJLPCC
	UWLrmkusIAkJAV6JGe1PWSBsaYnty7cyQtgaEj+W9TJD2KISN1e/ZYex3x+bD1UjItF67yxU
	jaDEg5+7oeKSEm/3zWMHWSYh0M4ocf7nDzYIZwajxKnNf6E69CUWn1sBdh6vgK/E+0tzwTaw
	CKhKnHl1GGqSi8SGpbfAbGYBeYntb+cwg0KCWUBTYv0ufUhgKUscucUCUcEn0XH4LzvMXzvm
	PWGCsFUlepu/MMH8OHl2C9R0D4mzl78xQwIxUOLQkk7GCYwKsxBBPQvJ3lkIexcwMq9iFEst
	KM5NTy02KjBCjudNjOB0qeW2g3HK2w96hxiZOBgPMUpwMCuJ8LbK7YwX4k1JrKxKLcqPLyrN
	SS0+xFgF9PFEZinR5Hxgws4riTc0MzAyMzU2MTY2NTElW9jUyMzMwNLUwtTMyEJJnDd0ZV+8
	kEB6YklqdmpqQWoRzHImDk6pBqaypcHTJ+hkxNl9KP/7TKkgen7+tF0bYvv87h885vn/7dZV
	azsc1ztWrPk7Jf8h085r7rl5jZdZzi/IaDz6QkPn013hdTqMMw5eTfHm4+SZn7f/Ukjfzpgy
	rr8dJ2bxdLQc7l43LTynVPd04uabvQ/CFMwyVQSOtSpN9fm3+R0jv5ug9XGNnpJv4idZtD1a
	T706UHV6e0ex6Y7NK36aRyepxBd/eCt86PGnm2kChyzmmjyfbllcamVyTvuq+pxnbWFyi/+/
	ZXM9dktr56o+mxkTVulstpPPSZcK+umskpNaE3ayVmv/mTmHZlpUVpRsVNPbfCYtbo3uEnEe
	vTM9Sk9X7wrsXyUrYljfGVtR1KDEUpyRaKjFXFScCACeEfVtZQQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201123075526epcms2p59410a8ba942f8942f53a593d9df764d0
References: <CGME20201123075526epcms2p59410a8ba942f8942f53a593d9df764d0@epcms2p5>
Message-ID-Hash: JDQHDACFKSVDRBS3K5XUSCB4X5XVKXT7
X-Message-ID-Hash: JDQHDACFKSVDRBS3K5XUSCB4X5XVKXT7
X-MailFrom: bongsu.jeon@samsung.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.1.1
Precedence: list
Reply-To: bongsu.jeon@samsung.com
Subject: [linux-nfc] [PATCH net-next 1/2] dt-bindings: net: nfc: s3fwrn5: Support a UART interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/JDQHDACFKSVDRBS3K5XUSCB4X5XVKXT7/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since S3FWRN82 NFC Chip, The UART interface can be used.
S3FWRN82 supports I2C and UART interface.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 .../bindings/net/nfc/samsung,s3fwrn5.yaml     | 28 +++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
index cb0b8a560282..37b3e5ae5681 100644
--- a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
@@ -13,6 +13,7 @@ maintainers:
 properties:
   compatible:
     const: samsung,s3fwrn5-i2c
+    const: samsung,s3fwrn82-uart
 
   en-gpios:
     maxItems: 1
@@ -47,10 +48,19 @@ additionalProperties: false
 required:
   - compatible
   - en-gpios
-  - interrupts
-  - reg
   - wake-gpios
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s3fwrn5-i2c
+    then:
+      required:
+        - interrupts
+        - reg
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
@@ -71,3 +81,17 @@ examples:
             wake-gpios = <&gpj0 2 GPIO_ACTIVE_HIGH>;
         };
     };
+  # UART example on Raspberry Pi
+  - |
+    &uart0 {
+        status = "okay";
+
+        s3fwrn82_uart {
+            compatible = "samsung,s3fwrn82-uart";
+
+            en-gpios = <&gpio 20 0>;
+            wake-gpios = <&gpio 16 0>;
+
+            status = "okay";
+        };
+    };
-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
