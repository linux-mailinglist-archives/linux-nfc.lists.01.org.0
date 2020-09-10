Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0268264969
	for <lists+linux-nfc@lfdr.de>; Thu, 10 Sep 2020 18:12:37 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 71D5014263414;
	Thu, 10 Sep 2020 09:12:36 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=krzk@kernel.org; receiver=<UNKNOWN> 
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 94A0914263412
	for <linux-nfc@lists.01.org>; Thu, 10 Sep 2020 09:12:34 -0700 (PDT)
Received: from localhost.localdomain (unknown [194.230.155.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6E5AF21D81;
	Thu, 10 Sep 2020 16:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599754354;
	bh=PjP3S+TQBC2ivVaHesCYdSbG5mKpWoLG5Xapj5DDZIM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=I0sHF6WBSg6/5bE6EIceqBtkVPAWGUm5KHV5q5btsc15pDCax+y5pR3MQEpHOEVXT
	 hC8+j3IrMmCf5idoSFaA+PQt1AR31qLXWV3zHc64eoaigQxn74pILEkxIsxxjuhE0B
	 56u3BCFDnQKVFzYfKQTFxHHNhOh3QWh9aBla75i0=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Opasiak <k.opasiak@samsung.com>,
	Kukjin Kim <kgene@kernel.org>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-nfc@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Date: Thu, 10 Sep 2020 18:12:12 +0200
Message-Id: <20200910161219.6237-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910161219.6237-1-krzk@kernel.org>
References: <20200910161219.6237-1-krzk@kernel.org>
Message-ID-Hash: TFJ7MHPCR5YJXTVI5SCWYTZGW3GCMXTW
X-Message-ID-Hash: TFJ7MHPCR5YJXTVI5SCWYTZGW3GCMXTW
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v3 1/8] dt-bindings: net: nfc: s3fwrn5: Convert to dtschema
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/TFJ7MHPCR5YJXTVI5SCWYTZGW3GCMXTW/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Convert the Samsung S3FWRN5 NCI NFC controller bindings to dtschema.
This is conversion only so it includes properties with invalid prefixes
(s3fwrn5,en-gpios) which should be addressed later.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../devicetree/bindings/net/nfc/s3fwrn5.txt   | 25 --------
 .../bindings/net/nfc/samsung,s3fwrn5.yaml     | 61 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 62 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/nfc/s3fwrn5.txt
 create mode 100644 Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml

diff --git a/Documentation/devicetree/bindings/net/nfc/s3fwrn5.txt b/Documentation/devicetree/bindings/net/nfc/s3fwrn5.txt
deleted file mode 100644
index f02f6fb7f81c..000000000000
--- a/Documentation/devicetree/bindings/net/nfc/s3fwrn5.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-* Samsung S3FWRN5 NCI NFC Controller
-
-Required properties:
-- compatible: Should be "samsung,s3fwrn5-i2c".
-- reg: address on the bus
-- interrupts: GPIO interrupt to which the chip is connected
-- s3fwrn5,en-gpios: Output GPIO pin used for enabling/disabling the chip
-- s3fwrn5,fw-gpios: Output GPIO pin used to enter firmware mode and
-  sleep/wakeup control
-
-Example:
-
-&hsi2c_4 {
-	s3fwrn5@27 {
-		compatible = "samsung,s3fwrn5-i2c";
-
-		reg = <0x27>;
-
-		interrupt-parent = <&gpa1>;
-		interrupts = <3 0 0>;
-
-		s3fwrn5,en-gpios = <&gpf1 4 0>;
-		s3fwrn5,fw-gpios = <&gpj0 2 0>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
new file mode 100644
index 000000000000..f43d31a2d94b
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/nfc/samsung,s3fwrn5.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S3FWRN5 NCI NFC Controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Krzysztof Opasiak <k.opasiak@samsung.com>
+
+properties:
+  compatible:
+    const: samsung,s3fwrn5-i2c
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  s3fwrn5,en-gpios:
+    maxItems: 1
+    description:
+      Output GPIO pin used for enabling/disabling the chip
+
+  s3fwrn5,fw-gpios:
+    maxItems: 1
+    description:
+      Output GPIO pin used to enter firmware mode and sleep/wakeup control
+
+additionalProperties: false
+
+required:
+  - compatible
+  - interrupts
+  - reg
+  - s3fwrn5,en-gpios
+  - s3fwrn5,fw-gpios
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c4 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        s3fwrn5@27 {
+            compatible = "samsung,s3fwrn5-i2c";
+            reg = <0x27>;
+
+            interrupt-parent = <&gpa1>;
+            interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+
+            s3fwrn5,en-gpios = <&gpf1 4 GPIO_ACTIVE_HIGH>;
+            s3fwrn5,fw-gpios = <&gpj0 2 GPIO_ACTIVE_HIGH>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ac79fdbdf8d0..ec4f1d9cb3dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15273,6 +15273,7 @@ M:	Robert Baldyga <r.baldyga@samsung.com>
 M:	Krzysztof Opasiak <k.opasiak@samsung.com>
 L:	linux-nfc@lists.01.org (moderated for non-subscribers)
 S:	Supported
+F:	Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
 F:	drivers/nfc/s3fwrn5
 
 SAMSUNG S5C73M3 CAMERA DRIVER
-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
