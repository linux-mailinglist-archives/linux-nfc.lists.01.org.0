Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CA04281C4
	for <lists+linux-nfc@lfdr.de>; Sun, 10 Oct 2021 16:23:41 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 9240C100EA907;
	Sun, 10 Oct 2021 07:23:36 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 1F8A3100EAB5D
	for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 07:23:34 -0700 (PDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C7D0F4001A
	for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 14:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633875812;
	bh=CPCA02s/SUPanw77EF1mmKLV8dt3hzeoEjW66M7WKxY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=dtp6vHtHK2dgxQugSt4bQEvW57xyiijD6Uq4HmVtwKO/1GVyBbUrCVkIPhmLkg1ZA
	 HdyppH+mAqoNFYx4aj28xUVhLrFOsRWdk3gv8zQCkAsyDjgS4B+GniJV2M9lvdlvtY
	 /YrlrKz46Un6F/eIKx5yvixekpryqVTxEvAP9f6Ik1WyVCyusg9TNdqpz3LWOAi83b
	 rfJpq2Xl9u8y7HXLaMiv3uncDj4Wz4+kshU8m8FGa8dU3DPS0JtHdqjCtoq0CfVwjh
	 pLHJhCwmSCRBuM2mC3rWU9ClTuVc3xgf7y/wJ44xbddEZMSXr5EAdN8Q5ystcCmiIN
	 W5lbddWYvjKhQ==
Received: by mail-ed1-f71.google.com with SMTP id t28-20020a508d5c000000b003dad7fc5caeso13438084edt.11
        for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 07:23:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CPCA02s/SUPanw77EF1mmKLV8dt3hzeoEjW66M7WKxY=;
        b=aZB1vEFCCJ8i6t+TVYXHUq+977V6rWvc5mIPfQkONp5RN3bmEkSuQ0CZsxUGTJqDtS
         130DA4h1eN3YXNC6V/7a/MPJY8hEwr7DSClIPdR/LxSHGCyRZrr6IWX/WJPcWIU/t43u
         aW8WjbTXB3fe/YXH0rRhLUv70xBu3gXtqX7JO1wQ8euu+G6laRMEV0ViyHCDqtPdjnDi
         gr+mFa0pviwwJARkSkBt8swZ6niYICsQE6oraKN3gGF1yU/XOq2aiyCtzM30VRGWYDr3
         8zsiDtZ/hxdI4W434cBcyqLI4ZN8QlVg0gUo8zoJ82ekuhyM3W22iplamTrtuSCDhrgZ
         QUNw==
X-Gm-Message-State: AOAM533uKuhBP1/qetzYZiRaBq90SE+FTtpkIZU5qWUZyTVVs0CSZpWX
	erCherIfvoD3ocLJpTgDaeLLbF1c5F1jGUtA+Hsr9o17updy/o6aFXBDDDh0RyOFYesXT78VqN7
	EE9rPtOXrJ3RXubkBMRLg7tqWuI9EAqm2Wg==
X-Received: by 2002:a17:907:2bdf:: with SMTP id gv31mr19454199ejc.521.1633875812410;
        Sun, 10 Oct 2021 07:23:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEAeeDmZxwq28FqWcAXIumFiXDUd8MdJmi+k2l7hERmlAm2/SrnIL/odhbbw/P7JNHcqhsUA==
X-Received: by 2002:a17:907:2bdf:: with SMTP id gv31mr19454172ejc.521.1633875812184;
        Sun, 10 Oct 2021 07:23:32 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 6sm2129017ejx.82.2021.10.10.07.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 07:23:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Charles Gorand <charles.gorand@effinnov.com>,
	Mark Greer <mgreer@animalcreek.com>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Date: Sun, 10 Oct 2021 16:23:16 +0200
Message-Id: <20211010142317.168259-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211010142317.168259-1-krzysztof.kozlowski@canonical.com>
References: <20211010142317.168259-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: FW7PGEWV5UXNYMQ4MHUC5APSU7KJLCTQ
X-Message-ID-Hash: FW7PGEWV5UXNYMQ4MHUC5APSU7KJLCTQ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 6/7] dt-bindings: nfc: ti,trf7970a: convert to dtschema
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/FW7PGEWV5UXNYMQ4MHUC5APSU7KJLCTQ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Convert the TI TRF7970A NFC to DT schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/net/nfc/ti,trf7970a.yaml         | 98 +++++++++++++++++++
 .../devicetree/bindings/net/nfc/trf7970a.txt  | 43 --------
 MAINTAINERS                                   |  2 +-
 3 files changed, 99 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/nfc/ti,trf7970a.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/nfc/trf7970a.txt

diff --git a/Documentation/devicetree/bindings/net/nfc/ti,trf7970a.yaml b/Documentation/devicetree/bindings/net/nfc/ti,trf7970a.yaml
new file mode 100644
index 000000000000..40da2ac98978
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nfc/ti,trf7970a.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/nfc/ti,trf7970a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TRF7970A RFID/NFC/15693 Transceiver
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Mark Greer <mgreer@animalcreek.com>
+
+properties:
+  compatible:
+    const: ti,trf7970a
+
+  autosuspend-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Specify autosuspend delay in milliseconds.
+
+  clock-frequency:
+    description: |
+      Set to specify that the input frequency to the trf7970a is 13560000Hz or
+      27120000Hz
+
+  en2-rf-quirk:
+    type: boolean
+    description: |
+      Specify that the trf7970a being used has the "EN2 RF" erratum
+
+  interrupts:
+    maxItems: 1
+
+  irq-status-read-quirk:
+    type: boolean
+    description: |
+      Specify that the trf7970a being used has the "IRQ Status Read" erratum
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency: true
+
+  ti,enable-gpios:
+    minItems: 1
+    maxItems: 2
+    description: |
+      One or two GPIO entries used for 'EN' and 'EN2' pins on the TRF7970A. EN2
+      is optional.
+
+  vdd-io-supply:
+    description: |
+      Regulator specifying voltage for VDD-IO
+
+  vin-supply:
+    description: |
+      Regulator for supply voltage to VIN pin
+
+required:
+  - compatible
+  - interrupts
+  - reg
+  - spi-max-frequency
+  - ti,enable-gpios
+  - vin-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        nfc@0 {
+            compatible = "ti,trf7970a";
+            reg = <0>;
+
+            pinctrl-names = "default";
+            pinctrl-0 = <&trf7970a_default>;
+            spi-max-frequency = <2000000>;
+            interrupt-parent = <&gpio2>;
+            interrupts = <14 0>;
+
+            ti,enable-gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>,
+                              <&gpio2 5 GPIO_ACTIVE_HIGH>;
+            vin-supply = <&ldo3_reg>;
+            vdd-io-supply = <&ldo2_reg>;
+            autosuspend-delay = <30000>;
+            irq-status-read-quirk;
+            en2-rf-quirk;
+            clock-frequency = <27120000>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/nfc/trf7970a.txt b/Documentation/devicetree/bindings/net/nfc/trf7970a.txt
deleted file mode 100644
index ba1934b950e5..000000000000
--- a/Documentation/devicetree/bindings/net/nfc/trf7970a.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-* Texas Instruments TRF7970A RFID/NFC/15693 Transceiver
-
-Required properties:
-- compatible: Should be "ti,trf7970a".
-- spi-max-frequency: Maximum SPI frequency (<= 2000000).
-- interrupts: A single interrupt specifier.
-- ti,enable-gpios: One or two GPIO entries used for 'EN' and 'EN2' pins on the
-  TRF7970A. EN2 is optional.
-- vin-supply: Regulator for supply voltage to VIN pin
-
-Optional SoC Specific Properties:
-- pinctrl-names: Contains only one value - "default".
-- pintctrl-0: Specifies the pin control groups used for this controller.
-- autosuspend-delay: Specify autosuspend delay in milliseconds.
-- irq-status-read-quirk: Specify that the trf7970a being used has the
-  "IRQ Status Read" erratum.
-- en2-rf-quirk: Specify that the trf7970a being used has the "EN2 RF"
-  erratum.
-- vdd-io-supply: Regulator specifying voltage for vdd-io
-- clock-frequency: Set to specify that the input frequency to the trf7970a is 13560000Hz or 27120000Hz
-
-Example (for ARM-based BeagleBone with TRF7970A on SPI1):
-
-&spi1 {
-
-	nfc@0 {
-		compatible = "ti,trf7970a";
-		reg = <0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&trf7970a_default>;
-		spi-max-frequency = <2000000>;
-		interrupt-parent = <&gpio2>;
-		interrupts = <14 0>;
-		ti,enable-gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>,
-				  <&gpio2 5 GPIO_ACTIVE_HIGH>;
-		vin-supply = <&ldo3_reg>;
-		vdd-io-supply = <&ldo2_reg>;
-		autosuspend-delay = <30000>;
-		irq-status-read-quirk;
-		en2-rf-quirk;
-		clock-frequency = <27120000>;
-	};
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index 3294aaf5e56c..23dd7aac38a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18916,7 +18916,7 @@ M:	Mark Greer <mgreer@animalcreek.com>
 L:	linux-wireless@vger.kernel.org
 L:	linux-nfc@lists.01.org (subscribers-only)
 S:	Supported
-F:	Documentation/devicetree/bindings/net/nfc/trf7970a.txt
+F:	Documentation/devicetree/bindings/net/nfc/ti,trf7970a.yaml
 F:	drivers/nfc/trf7970a.c
 
 TI TSC2046 ADC DRIVER
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
