Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8999D2D2CAB
	for <lists+linux-nfc@lfdr.de>; Tue,  8 Dec 2020 15:10:46 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 65135100EC1EC;
	Tue,  8 Dec 2020 06:10:45 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id CE3A6100EC1D4
	for <linux-nfc@lists.01.org>; Tue,  8 Dec 2020 06:10:42 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id 69so4425983pgg.8
        for <linux-nfc@lists.01.org>; Tue, 08 Dec 2020 06:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jAgAg0NFCQ9D2OHHyIrBitG3IV58eouboI/0tj7JbcU=;
        b=pZaR/zx95+BhtM8XrrRxKaqIYQhQow/xIHahInXMTn5NA1G4eEP8qHS8vEuxnTa9HC
         vR/ZBihatAC7Z294Pj+9g+v5k4gFO7FOnVykdo4yhRUeJ50n2AHQO59m6ihF7H/KM9wr
         ceHIoCxglmh2cAyoZcHSi76Xb0n06LdrQSIH4FGWlcVLSCSCsrc/TdPf3susjp0Iq47R
         cvI9qcoJdhj9j1+cJP8aiK70n1aKVjFh5bcOcrns05TucVJ2R9Td+Z+G4j6mb3ffDdkw
         XpBHgDGh14ljnehVPUlIsuHkmCCPreFdrPWniFFv+psi93BXPIccNFgTkdq8DEWppI3R
         +UHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jAgAg0NFCQ9D2OHHyIrBitG3IV58eouboI/0tj7JbcU=;
        b=OKQ+NTdWrXKx2emUgGmzqe6NeuXUPw1iF/85dxRP/lheQkWW0uuSRtb8cuBadQsQdi
         MB6nf4Ejv8PE2CYzlsahNa7ovR6eDVggfhoULYCJY9XzsXXpyWNNBU07y85tlTpO/j9a
         LkJI7ga8/p+rguAutaFIIbZhgg+LQ1IBSGkuix6jOSTooENDFSewLJ9isICwkO9KGEcm
         oEyB9vDbPR47slI1JG6XXzKAAkNphtkczrwQkshogiLqV5XlLRiRSGse+fGpV6XEDUy0
         eDvcfur2uxStS9HpiyhrQ7cHW0Y/bUQF7avtJV6mEmkvhIa/Z80XmExyTmkN2qCbYwFM
         WkMw==
X-Gm-Message-State: AOAM5317ffYM4SvquktpsWLj7wd39NnjNORRtUcNSJjmXybEydCqTnN9
	l6YZ1n5J3453Iuxg2FWEYD0=
X-Google-Smtp-Source: ABdhPJxfDzZKHQI0QwpuTikddnptjHRXefFDE7BiEdJ5Mt3w53Z5yuH+dR92wBN6eXRHkMz43bC4yg==
X-Received: by 2002:a62:2cc3:0:b029:197:dda8:476a with SMTP id s186-20020a622cc30000b0290197dda8476amr20191749pfs.37.1607436642315;
        Tue, 08 Dec 2020 06:10:42 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id m15sm9071951pfa.72.2020.12.08.06.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 06:10:41 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: krzk@kernel.org
Date: Tue,  8 Dec 2020 23:10:11 +0900
Message-Id: <20201208141012.6033-2-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201208141012.6033-1-bongsu.jeon@samsung.com>
References: <20201208141012.6033-1-bongsu.jeon@samsung.com>
Message-ID-Hash: RDEMEY3KBIH2QE5WMN2N5CMZYXJNGPAA
X-Message-ID-Hash: RDEMEY3KBIH2QE5WMN2N5CMZYXJNGPAA
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 net-next 1/2] dt-bindings: net: nfc: s3fwrn5: Change I2C interrupt trigger type
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/RDEMEY3KBIH2QE5WMN2N5CMZYXJNGPAA/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

Change interrupt trigger from IRQ_TYPE_LEVEL_HIGH to IRQ_TYPE_EDGE_RISING
 for stable NFC I2C interrupt handling.
Samsung's NFC Firmware sends an i2c frame as below.
1. NFC Firmware sets the GPIO(interrupt pin) high when there is an i2c
 frame to send.
2. If the CPU's I2C master has received the i2c frame, NFC F/W sets the
GPIO low.
NFC driver's i2c interrupt handler would be called in the abnormal case
as the NFC FW task of number 2 is delayed because of other high priority
tasks.
In that case, NFC driver will try to receive the i2c frame but there isn't
 any i2c frame to send in NFC.
It would cause an I2C communication problem. This case would hardly happen.
But, I changed the interrupt as a defense code.
If Driver uses the TRIGGER_RISING instead of the LEVEL trigger,
there would be no problem even if the NFC FW task is delayed.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
index ca3904bf90e0..477066e2b821 100644
--- a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
@@ -76,7 +76,7 @@ examples:
             reg = <0x27>;
 
             interrupt-parent = <&gpa1>;
-            interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+            interrupts = <3 IRQ_TYPE_EDGE_RISING>;
 
             en-gpios = <&gpf1 4 GPIO_ACTIVE_HIGH>;
             wake-gpios = <&gpj0 2 GPIO_ACTIVE_HIGH>;
-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
