Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C747F2CA44C
	for <lists+linux-nfc@lfdr.de>; Tue,  1 Dec 2020 14:51:11 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 9B8D5100EC1E1;
	Tue,  1 Dec 2020 05:51:10 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id DFC32100EC1E3
	for <linux-nfc@lists.01.org>; Tue,  1 Dec 2020 05:51:08 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id p6so1159634plr.7
        for <linux-nfc@lists.01.org>; Tue, 01 Dec 2020 05:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6615kzoe5jKV8EYHaChLE8OAf7+pns9kTW6Yur3HXZU=;
        b=NGcJTYvmtwIBCDio8bmQzhsWhY5QzOoVkDoSA00zZIgB8xoEEs5EyuTOm7wmgXokek
         b/fs+Jx9TLbnuiyfLTVQSjpt9jJPFE48CRkcPIk0dPBOWnX9HLA7KCx15cECdhhRPEa1
         LQzUVdyVIWuxlbhxooLw4FJGXgoMPechVoBkIlEOsKjdfJCX80if/b639M6iPHux+G3R
         dXTvgW4rBbc/KKtbYRJBYYlYCdQDC9ZYZNDm1p5Ney8Aru1ItsTk4cL0tN4iB3jUM+5l
         EygBIiKaT3lcqsqPQf9SgjC/K7wXsql2S4QxmI1jNGxm95UYPK35lVmteQgN9zEJXCTS
         p14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6615kzoe5jKV8EYHaChLE8OAf7+pns9kTW6Yur3HXZU=;
        b=AptLujBqZhF8AXNq+tKjmb1loWjZ835ykItJUQeh0JWlE5s6QJd0RbuLLczVIm29Ao
         11wtpDp3JG4ykptZuyTK1yFuibs+PgE2n8qlVaU8J+uyduelIiBbzfCT7WgLRKBwuUzw
         Y9xbtl+B3PC9PWHd20dXZcEu2Wh9YZlLLl33HhwSRK0WD1fpS4/F3LcbnfGQCIAKHvlk
         pu0i3hCKQZ8aq1XNcobYAY6ANOlO9PQYxDYvkXTHV1FXRJWZ+wAYgjEKNu5CjsZUzwI3
         vFef4xUnAL0YuyjGuXdU8PteCZ2vGqBtZdXeWyoA3R916MvbwGLvneTMw5OdeGsX8bNg
         wJqw==
X-Gm-Message-State: AOAM532QV/UlSEx6fzCprIEMFD3mAjr4oS/C5udYr3ElpyxgmASVmFYl
	bkm1dsjnC8WM0//pXb+kX8g=
X-Google-Smtp-Source: ABdhPJyQDOKWVtpcQPZmk6TfMepferWPF3DHSFtPBlVVbBVI9HMmTVXBkjk2rpsaC70Q6x1fNsR2OQ==
X-Received: by 2002:a17:90a:488f:: with SMTP id b15mr2710634pjh.99.1606830667604;
        Tue, 01 Dec 2020 05:51:07 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id z22sm3134111pfn.153.2020.12.01.05.51.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Dec 2020 05:51:06 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: krzk@kernel.org
Date: Tue,  1 Dec 2020 22:50:25 +0900
Message-Id: <1606830628-10236-2-git-send-email-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1606830628-10236-1-git-send-email-bongsu.jeon@samsung.com>
References: <1606830628-10236-1-git-send-email-bongsu.jeon@samsung.com>
Message-ID-Hash: UM3OGB3OVSIRWIDLNDHAZL4EMSQNI7JJ
X-Message-ID-Hash: UM3OGB3OVSIRWIDLNDHAZL4EMSQNI7JJ
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v4 net-next 1/4] dt-bindings: net: nfc: s3fwrn5: Support a UART interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/UM3OGB3OVSIRWIDLNDHAZL4EMSQNI7JJ/>
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
 .../bindings/net/nfc/samsung,s3fwrn5.yaml          | 32 ++++++++++++++++++++--
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
index cb0b8a5..cc5f9a1 100644
--- a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
@@ -12,7 +12,10 @@ maintainers:
 
 properties:
   compatible:
-    const: samsung,s3fwrn5-i2c
+    items:
+      - enum:
+          - samsung,s3fwrn5-i2c
+          - samsung,s3fwrn82
 
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
