Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DBB25EE9F
	for <lists+linux-nfc@lfdr.de>; Sun,  6 Sep 2020 17:37:41 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id ADFA713D17F39;
	Sun,  6 Sep 2020 08:37:39 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=krzk@kernel.org; receiver=<UNKNOWN> 
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id DC5C713D17F33
	for <linux-nfc@lists.01.org>; Sun,  6 Sep 2020 08:37:37 -0700 (PDT)
Received: from localhost.localdomain (unknown [194.230.155.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 63BFE2078E;
	Sun,  6 Sep 2020 15:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599406657;
	bh=FhODpJjWGd/j/cspm+BDtNQ6M1PDVW7foEeHBfe5u5Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ck3et3uNy28CUlVI6ZZqK9lhRKsJYlllsutSQwZPJP7qjEQdOJ2VyP8DkLYkqu0AV
	 FjSKeBES2epBhb4nU9edbOfelpQkqrOm78GOBmzW52A6IHhw+dZ98n6ZwnwLiUglC0
	 fiH6MFQH7y5LufxLHmcZ6Nt1CSrPrLIhvtrM9ALw=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Opasiak <k.opasiak@samsung.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-nfc@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Date: Sun,  6 Sep 2020 17:36:47 +0200
Message-Id: <20200906153654.2925-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200906153654.2925-1-krzk@kernel.org>
References: <20200906153654.2925-1-krzk@kernel.org>
Message-ID-Hash: 7AI6LPC4AGBWGQ4VMVWV2B2ER2QVD7SC
X-Message-ID-Hash: 7AI6LPC4AGBWGQ4VMVWV2B2ER2QVD7SC
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 2/9] dt-bindings: net: nfc: s3fwrn5: Remove wrong vendor prefix from GPIOs
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/7AI6LPC4AGBWGQ4VMVWV2B2ER2QVD7SC/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The device tree property prefix describes the vendor, which in case of
S3FWRN5 chip is Samsung.  Therefore the "s3fwrn5" prefix for "en-gpios"
and "fw-gpios" is not correct and should be deprecated.  Introduce
properly named properties for these GPIOs and rename the fw-gpios" to
"wake-gpios" to better describe its purpose.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../bindings/net/nfc/samsung,s3fwrn5.yaml     | 24 ++++++++++++++-----
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
index 81e27cc85dd3..0889d3326f98 100644
--- a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
@@ -14,30 +14,42 @@ properties:
   compatible:
     const: samsung,s3fwrn5-i2c
 
+  en-gpios:
+    maxItems: 1
+    description:
+      Output GPIO pin used for enabling/disabling the chip
+
   interrupts:
     maxItems: 1
 
   reg:
     maxItems: 1
 
+  wake-gpios:
+    maxItems: 1
+    description:
+      Output GPIO pin used to enter firmware mode and sleep/wakeup control
+
   s3fwrn5,en-gpios:
     maxItems: 1
+    deprecated: true
     description:
-      Output GPIO pin used for enabling/disabling the chip
+      Use en-gpios
 
   s3fwrn5,fw-gpios:
     maxItems: 1
+    deprecated: true
     description:
-      Output GPIO pin used to enter firmware mode and sleep/wakeup control
+      Use wake-gpios
 
 additionalProperties: false
 
 required:
   - compatible
+  - en-gpios
   - interrupts
   - reg
-  - s3fwrn5,en-gpios
-  - s3fwrn5,fw-gpios
+  - wake-gpios
 
 examples:
   - |
@@ -55,7 +67,7 @@ examples:
             interrupt-parent = <&gpa1>;
             interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
 
-            s3fwrn5,en-gpios = <&gpf1 4 GPIO_ACTIVE_HIGH>;
-            s3fwrn5,fw-gpios = <&gpj0 2 GPIO_ACTIVE_HIGH>;
+            en-gpios = <&gpf1 4 GPIO_ACTIVE_HIGH>;
+            wake-gpios = <&gpj0 2 GPIO_ACTIVE_HIGH>;
         };
     };
-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
