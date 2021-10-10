Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1CA4281C2
	for <lists+linux-nfc@lfdr.de>; Sun, 10 Oct 2021 16:23:37 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 6676C100EAB61;
	Sun, 10 Oct 2021 07:23:36 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 37578100EAB5F
	for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 07:23:31 -0700 (PDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 10D353FFFB
	for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 14:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633875810;
	bh=I/dEoNLrdiZf46+osatVihop4LOFN9ipzJ5r/D9Ro0Y=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=ePY/knq5uXToXXmYRCjnmT3bAry3KTRlbhBFYunGOuyLoh8fqTc4NGOVn2sluw3dJ
	 6vLhh5WYhOSC6nR1jlGDxD2LxqG1TDJkAn3aixriqPl1qg7U8pxyaU+5MIE9WWZ5zv
	 aDdXy3XNl561CoabJfwuc4gLCz93X92NcsHA79g8Afs0Rfrw5nHJq5t9MJ/F4+t3dC
	 qXBXR1LCjuswL+13zN0OE8uKCKJ4HpVVYIl3vRC1OqFU7Fol0lrXF1Ud6dpwXl9ysO
	 eJzlmCfV0cEgXaRGaXofyUwbxeULcKtwqIbPmnxi/Xx/ENlq9CZlTfDZrWxF4YTaVV
	 1ecLVf9X4DJmg==
Received: by mail-ed1-f71.google.com with SMTP id v2-20020a50f082000000b003db24e28d59so13468173edl.5
        for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 07:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I/dEoNLrdiZf46+osatVihop4LOFN9ipzJ5r/D9Ro0Y=;
        b=ElT3Y5gqQ98fqzh654wI9tx4L0Nn8+3rOKAfRVrMWjflq/Rt9nRvhWTvLatofbnuUF
         zAXnX09PfRltr8CZ7QszqV9Ki9V2nVmv+CgJwSPo84FML3zI9/BXniE6v6k2EeHCNteU
         1dNnf8//WRhRjGXAZeMe6yq4yV3v3wBNlaHb1090kXjWytpTROgNdAu89YiRwisv28u/
         qoavhgZp9eKYvY/Tj5Ku7S/rn/GrgxGXJ+Ts+XM9Q646EwLPJGkhizpIQXcSTZrRKqkc
         47dsJfJdAKKpH7CQPK0x3gDipzhokd4vsx6o8T7/tG39FH+6WZKASutZvCnYKcYmEzdU
         X3IQ==
X-Gm-Message-State: AOAM530+0sk42Fie8aeZyUYGPyzsrdt3WWBors0DOHQeY4k0D3uoUhaw
	ERsaTmnqwJPGQhS5kEmJf7MZtBwrlyESGOVsoOkZXg2ooF/nJZ8JSXyqD7oy7Sm8TxAfkaE+6LK
	G8Pt3Hajr3ffuC1FdEfkv+G6iFtXe19fFDA==
X-Received: by 2002:a17:907:208c:: with SMTP id pv12mr20202229ejb.314.1633875809701;
        Sun, 10 Oct 2021 07:23:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyT89P5tl7sOf2+DnKi9Ji+GUqcTbFuAXCvF4HN6lPdfAC/ITdILgHuhpJra4VHo3nWhLmEQ==
X-Received: by 2002:a17:907:208c:: with SMTP id pv12mr20202218ejb.314.1633875809533;
        Sun, 10 Oct 2021 07:23:29 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 6sm2129017ejx.82.2021.10.10.07.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 07:23:29 -0700 (PDT)
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
Date: Sun, 10 Oct 2021 16:23:14 +0200
Message-Id: <20211010142317.168259-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211010142317.168259-1-krzysztof.kozlowski@canonical.com>
References: <20211010142317.168259-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: RVZZZXHVEGBG34JQ6AF5N7PXBOIT3Y2G
X-Message-ID-Hash: RVZZZXHVEGBG34JQ6AF5N7PXBOIT3Y2G
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 4/7] dt-bindings: nfc: st,st95hf: convert to dtschema
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/RVZZZXHVEGBG34JQ6AF5N7PXBOIT3Y2G/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Convert the ST ST95HF NFC controller to DT schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/net/nfc/st,st95hf.yaml           | 57 +++++++++++++++++++
 .../devicetree/bindings/net/nfc/st95hf.txt    | 45 ---------------
 2 files changed, 57 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/nfc/st,st95hf.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/nfc/st95hf.txt

diff --git a/Documentation/devicetree/bindings/net/nfc/st,st95hf.yaml b/Documentation/devicetree/bindings/net/nfc/st,st95hf.yaml
new file mode 100644
index 000000000000..d3bca376039e
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nfc/st,st95hf.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/nfc/st,st95hf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics ST95HF NFC controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+properties:
+  compatible:
+    const: st,st95hf
+
+  enable-gpio:
+    description: Output GPIO pin used for enabling/disabling the controller
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  st95hfvin-supply:
+    description: ST95HF transceiver's Vin regulator supply
+
+  spi-max-frequency: true
+
+required:
+  - compatible
+  - enable-gpio
+  - interrupts
+  - reg
+  - spi-max-frequency
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        nfc@0{
+            compatible = "st,st95hf";
+            reg = <0>;
+
+            spi-max-frequency = <1000000>;
+            enable-gpio = <&pio4 GPIO_ACTIVE_HIGH>;
+            interrupt-parent = <&pio0>;
+            interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/nfc/st95hf.txt b/Documentation/devicetree/bindings/net/nfc/st95hf.txt
deleted file mode 100644
index 3f373a1e20ff..000000000000
--- a/Documentation/devicetree/bindings/net/nfc/st95hf.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-* STMicroelectronics : NFC Transceiver ST95HF
-
-ST NFC Transceiver is required to attach with SPI bus.
-ST95HF node should be defined in DT as SPI slave device of SPI
-master with which ST95HF transceiver is physically connected.
-The properties defined below are required to be the part of DT
-to include ST95HF transceiver into the platform.
-
-Required properties:
-===================
-- reg: Address of SPI slave "ST95HF transceiver" on SPI master bus.
-
-- compatible: should be "st,st95hf" for ST95HF NFC transceiver
-
-- spi-max-frequency: Max. operating SPI frequency for ST95HF
-	transceiver.
-
-- enable-gpio: GPIO line to enable ST95HF transceiver.
-
-- interrupts : Standard way to define ST95HF transceiver's out
-	interrupt.
-
-Optional property:
-=================
-- st95hfvin-supply : This is an optional property. It contains a
-	phandle to ST95HF transceiver's regulator supply node in DT.
-
-Example:
-=======
-spi@9840000 {
-	reg = <0x9840000 0x110>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-	cs-gpios = <&pio0 4>;
-
-	st95hf@0{
-		reg = <0>;
-		compatible = "st,st95hf";
-		spi-max-frequency = <1000000>;
-		enable-gpio = <&pio4 0>;
-		interrupt-parent = <&pio0>;
-		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
-	};
-
-};
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
