Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EB62CBBD1
	for <lists+linux-nfc@lfdr.de>; Wed,  2 Dec 2020 12:48:14 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4D2B4100EBBD0;
	Wed,  2 Dec 2020 03:48:13 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 2EF0C100EBBD0
	for <linux-nfc@lists.01.org>; Wed,  2 Dec 2020 03:48:10 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id v3so964513plz.13
        for <linux-nfc@lists.01.org>; Wed, 02 Dec 2020 03:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YgkXdxVYJGCqGi2vM/3GSDk0U6gyJJvLBMGDPOGgYCY=;
        b=AALNwzOvnIe1ZF2NsDfwryuf9Sp52NKnm25C1gMCRZSUXqxZoYtHbxQR9kdRywBUOU
         Sr1VfYVQ6CBJnglK/9f6yPCFKf3cvh28gVQlUTxeAFeQL6ZuPkBk41yiOrlm+Rw9WT4a
         M8isyrmKOQDMZF+btGHh08AVywjkgfTWpq8e91c3x/VT42Xe4hbKdZODDKdCGWIoKuC6
         og+AWw8y0j7yBdeGRHH5Cw8uIfzi0cxOSxRXbRu+MUDC/OXe0a+Kfbk8eVjoTYLtb6l6
         zj/KQEK6YS68aZEQj/2cdmO280fwF5f+h+TmyxTovmm2fiYg+U06c9Tvufls+3J/QsjV
         tTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YgkXdxVYJGCqGi2vM/3GSDk0U6gyJJvLBMGDPOGgYCY=;
        b=bC72yqGlUboYEUhzGvEbCXXYvNa+lftbaA6Ilfza8fG1BmRUoL0c7kCqunwr/VNMou
         JLjJqeN96t9/udjPw5fKG4xHS0tj7vcMrL2rI3cvIkKouNP45u0ZaDAT3w154UxdNaqZ
         dRjEh6urPTR3aMF9Lkd706E79UTpsu1qVjx6ULbLCbA6/J5Gq8tB1nGX8gBpJV7DzSgK
         NrzPDv9yy/+fHPnG6hXpW4EMnjDkJPS9iGkPM018+6NQVLnCLJQKg3F0IBUXd5Oy5lVN
         DJW+FOcLsnTB+NW41TQkjvQb9QSjYEx9xXz5kNouUOmdrTBIOUSstkGLGXM9uaTJj+W4
         YYLQ==
X-Gm-Message-State: AOAM5321LNp1dsYBtN4Fkd/eHsY9oZ61TxNrOFZ/kY1Y4I6EzmAJEQ2K
	25H1xCNFIIkyxsujngzJjHc=
X-Google-Smtp-Source: ABdhPJw5QtTAHCtBGn/aDXDjDAtHSw+WDVNqOZy47uX3ijKPOkhFoo7ATeLwKyfJVzsSTe0U55A4xA==
X-Received: by 2002:a17:90a:6fc7:: with SMTP id e65mr2091450pjk.116.1606909689747;
        Wed, 02 Dec 2020 03:48:09 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id q18sm2108806pfs.150.2020.12.02.03.48.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Dec 2020 03:48:09 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: krzk@kernel.org
Date: Wed,  2 Dec 2020 20:47:38 +0900
Message-Id: <1606909661-3814-2-git-send-email-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1606909661-3814-1-git-send-email-bongsu.jeon@samsung.com>
References: <1606909661-3814-1-git-send-email-bongsu.jeon@samsung.com>
Message-ID-Hash: QBX3R35A53VZUDQ7PPF2CUUJQJRZZT6Q
X-Message-ID-Hash: QBX3R35A53VZUDQ7PPF2CUUJQJRZZT6Q
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v5 net-next 1/4] dt-bindings: net: nfc: s3fwrn5: Support a UART interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/QBX3R35A53VZUDQ7PPF2CUUJQJRZZT6Q/>
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
 .../bindings/net/nfc/samsung,s3fwrn5.yaml          | 31 +++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
index cb0b8a5..ca3904b 100644
--- a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
@@ -12,7 +12,9 @@ maintainers:
 
 properties:
   compatible:
-    const: samsung,s3fwrn5-i2c
+    enum:
+      - samsung,s3fwrn5-i2c
+      - samsung,s3fwrn82
 
   en-gpios:
     maxItems: 1
@@ -47,10 +49,19 @@ additionalProperties: false
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
@@ -71,3 +82,17 @@ examples:
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
+            en-gpios = <&gpio 20 GPIO_ACTIVE_HIGH>;
+            wake-gpios = <&gpio 16 GPIO_ACTIVE_HIGH>;
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
