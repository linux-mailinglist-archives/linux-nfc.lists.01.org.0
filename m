Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F762C83A4
	for <lists+linux-nfc@lfdr.de>; Mon, 30 Nov 2020 13:00:54 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id C5C05100ED48D;
	Mon, 30 Nov 2020 04:00:52 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 21E37100EF26A
	for <linux-nfc@lists.01.org>; Mon, 30 Nov 2020 04:00:50 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id o19so542362pgn.10
        for <linux-nfc@lists.01.org>; Mon, 30 Nov 2020 04:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=lj9ZT1pXkce5/+KagnCXuquk6qct2qT6C8O4RgX4/Xg=;
        b=IZ+kgCy7F2PIHzD82xdfzWESDTLBKVDit3oepMt6or94hwmauw9zsHoPuL0ec3B4AE
         BiAfnxcDTQAzGXrHoFwTkx8xGQu1c25Lq48PslFQj1v6BzpjV6NdMjtsYggpLKEn2f7Q
         HC78lhJ+6KD9CZ+39ufaMy8VTUP5Z9awImFifRP4Pcf+Hz3G9YFkGpG1iK1aIY1YP16L
         9+dPpBP0wPwazWDrZ7+ZBHVwYxJzUi6UdGU22Eb3mfGbu3xtD1WwLp7tPfBd5NvLMIZG
         s045nSacOV5F3DJ3oo1cBlD8UUjHAPlfjpH0wv9plcdeEXcpk76/jhcyoNA8jICUlo/w
         eyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lj9ZT1pXkce5/+KagnCXuquk6qct2qT6C8O4RgX4/Xg=;
        b=rVgm3dt3fY2Q3sc4R7S7HchjbG7RiKpqeA0LVSdRLVUQN2v+RdaeCGAgGEzRbKKlhb
         cXzjgNX2dE2J6mzw+cGZfB1tdkW/31zn+w64DMxDTQGH2nqatJ8HPNZaaJImULNixS/h
         CzrHDXzNKqo+A3N7P4lWo+UsPvTNj+xL3eJ46KWip5/4G50/AmHNSvfWArlrWlE0XZeM
         qnCWTVVWbrAdImJ3z20JqW/skLqY4e/Z/lG0iZbXeqUQ7Vk+w/KW+FH3qDaLGSyybk+K
         B6GwEijrMs2x+RL/dtOqLC1I9/lVSuNvYTzWp1NttIrHLoA0t4sD0k2tximYhY0fG5BZ
         6vtw==
X-Gm-Message-State: AOAM531nZuHilPaKufh9fngC+5Sprzk4xjhvUomRq4Ua8m92keX+phkK
	C0XA0dXlc9OeQRgG4DC4l0E=
X-Google-Smtp-Source: ABdhPJx3saLPTWk9JX5niWrD8QDAOqBEjZC/gsHloavwuqIlpVFqtG26bcVWa0MjLpyJXoXddoalpQ==
X-Received: by 2002:a05:6a00:13a3:b029:18b:d5d2:196 with SMTP id t35-20020a056a0013a3b029018bd5d20196mr18635748pfg.62.1606737649541;
        Mon, 30 Nov 2020 04:00:49 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id s17sm1802737pge.37.2020.11.30.04.00.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Nov 2020 04:00:48 -0800 (PST)
From: Bongsu jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu jeon
To: krzk@kernel.org
Date: Mon, 30 Nov 2020 21:00:27 +0900
Message-Id: <1606737627-29485-1-git-send-email-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 1.9.1
Message-ID-Hash: K3QP6HIUEOSXB2D36ALY4N7GQBA5NAOI
X-Message-ID-Hash: K3QP6HIUEOSXB2D36ALY4N7GQBA5NAOI
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 net-next 1/4] dt-bindings: net: nfc: s3fwrn5: Support a UART interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/K3QP6HIUEOSXB2D36ALY4N7GQBA5NAOI/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

Since S3FWRN82 NFC Chip, The UART interface can be used.
S3FWRN82 supports I2C and UART interface.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---

Changes in v2:
 -change the compatible name.
 -change the const to enum for compatible.
 -change the node name to nfc.

 .../bindings/net/nfc/samsung,s3fwrn5.yaml          | 32 ++++++++++++++++++++--
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
index cb0b8a5..481bbcc 100644
--- a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
@@ -12,7 +12,10 @@ maintainers:
 
 properties:
   compatible:
-    const: samsung,s3fwrn5-i2c
+    oneOf:
+      - enum:
+        - samsung,s3fwrn5-i2c
+        - samsung,s3fwrn82
 
   en-gpios:
     maxItems: 1
@@ -47,10 +50,19 @@ additionalProperties: false
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
@@ -71,3 +83,17 @@ examples:
             wake-gpios = <&gpj0 2 GPIO_ACTIVE_HIGH>;
         };
     };
+  # UART example on Raspberry Pi
+  - |
+    uart0 {
+        status = "okay";
+
+        nfc {
+            compatible = "samsung,s3fwrn82";
+
+            en-gpios = <&gpio 20 0>;
+            wake-gpios = <&gpio 16 0>;
+
+            status = "okay";
+        };
+    };
-- 
1.9.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
