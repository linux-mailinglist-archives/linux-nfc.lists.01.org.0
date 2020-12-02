Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CF52CBBD2
	for <lists+linux-nfc@lfdr.de>; Wed,  2 Dec 2020 12:48:20 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 59E26100EBBD5;
	Wed,  2 Dec 2020 03:48:19 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::1044; helo=mail-pj1-x1044.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 3F249100EBBD1
	for <linux-nfc@lists.01.org>; Wed,  2 Dec 2020 03:48:17 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id hk16so844042pjb.4
        for <linux-nfc@lists.01.org>; Wed, 02 Dec 2020 03:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vFAjt0Td72sO7ptEv+X075oaFipYTY8EyRS2yMR9YTM=;
        b=p3/TtTGRzujYNFn/jOv92CV4UoK3prIhP3DoPoH/bN4wKxrjMd8f7a2MCfq5hwk9Ek
         PiR+naQMIYvy9hawMIlcaH5WI/1Kaqkbi2Zmb55BmiLSb1v5cWQE8ilvwc3ofCBrbXSV
         C9vST7UB6ZsOvYQDz0144xr4HCi4ZMAzJrXzAzHFwDYeKJEc4GVpdvy6/Q6D6f9/sOIN
         tF51U759PnsIGdh5cXY0VXmkY/A/q8J2vCtgpXH1eN2Xsg2pgpYuwB65TMYVfn1ACqhw
         A9AIjuzMVuP/I4KBOawhmWNhg9HgiAL1cscq8LHVz2tsn1tqdD41lbdaAWb7kh2azeEx
         G31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vFAjt0Td72sO7ptEv+X075oaFipYTY8EyRS2yMR9YTM=;
        b=b0RB32t3q2kI+beAcre2tlYaxKfuu8s52zOcmkXGh9hcUKaytvcCIMk+S5ZII1ZLQU
         nXamu/rS4L/rkZzGcmnPAjA5RgeDh9C2yiza5E0Rj8LOE51AQJHkWn3oJXUhhT3wrqAD
         KwdTW+7w3fHvBxyMmdpBixCCSyNM8ZKJZZjaKKa0TSF6QLRmj/Qr/hqQgkJMvsQS7xn/
         b2AcqfPTZqvGd+ImFb/9MXHjzFj42H4eoJKKUOe2Fae3Bb3kfpqwp6nLZgoq/olvjg9B
         kv5eQ6l493RMroYxAV1kd1jGP66E5AIwxFkvfeoofO+wvEFn4DYGQCxSnREIlrau3Lca
         mzSA==
X-Gm-Message-State: AOAM532PzzsJNFfPNAFKNbmMTQxLptG7xhfY4nZl6mPp6YrEabd2nDeY
	HO7C1tMg1RfnGK7HnIA6HUs=
X-Google-Smtp-Source: ABdhPJxWWVRus7qaQsLZuzKdH0maLn0ISipzCYJexmhqEAX5hDvvbkUb7WXzrwuLrSsISZh+4fFEkg==
X-Received: by 2002:a17:902:7606:b029:da:1f26:a1bf with SMTP id k6-20020a1709027606b02900da1f26a1bfmr2208232pll.53.1606909696907;
        Wed, 02 Dec 2020 03:48:16 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id q18sm2108806pfs.150.2020.12.02.03.48.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Dec 2020 03:48:16 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: krzk@kernel.org
Date: Wed,  2 Dec 2020 20:47:39 +0900
Message-Id: <1606909661-3814-3-git-send-email-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1606909661-3814-1-git-send-email-bongsu.jeon@samsung.com>
References: <1606909661-3814-1-git-send-email-bongsu.jeon@samsung.com>
Message-ID-Hash: 42AVK44MUNRCBLCNIEBBZZXMXRN3ZHFK
X-Message-ID-Hash: 42AVK44MUNRCBLCNIEBBZZXMXRN3ZHFK
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v5 net-next 2/4] nfc: s3fwrn5: reduce the EN_WAIT_TIME
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/42AVK44MUNRCBLCNIEBBZZXMXRN3ZHFK/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

The delay of 20ms is enough to enable and
wake up the Samsung's nfc chip.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/s3fwrn5/i2c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
index ae26594..9a64eea 100644
--- a/drivers/nfc/s3fwrn5/i2c.c
+++ b/drivers/nfc/s3fwrn5/i2c.c
@@ -19,7 +19,7 @@
 
 #define S3FWRN5_I2C_DRIVER_NAME "s3fwrn5_i2c"
 
-#define S3FWRN5_EN_WAIT_TIME 150
+#define S3FWRN5_EN_WAIT_TIME 20
 
 struct s3fwrn5_i2c_phy {
 	struct i2c_client *i2c_dev;
@@ -40,7 +40,7 @@ static void s3fwrn5_i2c_set_wake(void *phy_id, bool wake)
 
 	mutex_lock(&phy->mutex);
 	gpio_set_value(phy->gpio_fw_wake, wake);
-	msleep(S3FWRN5_EN_WAIT_TIME/2);
+	msleep(S3FWRN5_EN_WAIT_TIME);
 	mutex_unlock(&phy->mutex);
 }
 
@@ -63,7 +63,7 @@ static void s3fwrn5_i2c_set_mode(void *phy_id, enum s3fwrn5_mode mode)
 	if (mode != S3FWRN5_MODE_COLD) {
 		msleep(S3FWRN5_EN_WAIT_TIME);
 		gpio_set_value(phy->gpio_en, 0);
-		msleep(S3FWRN5_EN_WAIT_TIME/2);
+		msleep(S3FWRN5_EN_WAIT_TIME);
 	}
 
 	phy->irq_skip = true;
-- 
1.9.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
