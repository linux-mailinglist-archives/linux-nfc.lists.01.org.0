Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA8B2CA44D
	for <lists+linux-nfc@lfdr.de>; Tue,  1 Dec 2020 14:51:19 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id B0032100EC1E8;
	Tue,  1 Dec 2020 05:51:18 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::1042; helo=mail-pj1-x1042.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id CDC74100EC1E3
	for <linux-nfc@lists.01.org>; Tue,  1 Dec 2020 05:51:16 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id j13so1271461pjz.3
        for <linux-nfc@lists.01.org>; Tue, 01 Dec 2020 05:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vFAjt0Td72sO7ptEv+X075oaFipYTY8EyRS2yMR9YTM=;
        b=tJk6GaJhp51YrKMI15gFZm38aA0AEa/hBp+GQfP2sExI/CDMRLAjgeDI6kuU4YEA9T
         60cA8skJlYb/xRFbzO0HCmuEhu6lKuBS/o0ewaD8/4N47Vkmvi6UuPCMxdv76H/fa/St
         uRruhVohiKLmIZmahyfka3aLUBDjtxzf8jcBuWueGdmJ7hl3eZkuteG3ydlqBHXYiwog
         m2xXFrCQKMJ4lc5JTuS7htol4sTV/Uw2XIDTs5AiavwQeVTuMk6PE8EVlnEo1GS1szE2
         bv9SGJY4yg56FeOhxLIOTFoE5LfCMjPEbD7/fz3aUVgEKwhgo/UokhWsgoZspauAvBVZ
         Un2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vFAjt0Td72sO7ptEv+X075oaFipYTY8EyRS2yMR9YTM=;
        b=tQAoWyA1nJyPMKEp/gg66j5KVlDgGb6Zbe8S+yjbe28Bqbkqy29X71GFdHvbNeN8ZW
         G7EUZJspCA7RkItp0RbSbPaf3sGPA+noc57Ev+JGB6p+oNlrdTa7E2gECtnPvC6kqdpU
         mvxHJyBcdE+B5tPexJKcG+BzxedrFtqSezxlvY4NQy8gFzrfGkJnBOw8LY8S9xc3aUJN
         on718DoqDY8GezyXBcNqd5J2lUstyfO5aJFprpGBFl1XDvBkXmR4OBUBaTmmmOy9z0zD
         TV9+q0z31INsAJgF1+dOW4gf61tP6S7IPn2w/haNYPSDY7pSINmeWzQwkXrHlAlixV//
         pvLQ==
X-Gm-Message-State: AOAM531qu3YD3PYLYiCbA4juWtHwbysc6RjTbg8p1m/0Ae2ZxDMZyv+c
	FC7BvaQ0f4dH6G9yeT4jqGM=
X-Google-Smtp-Source: ABdhPJwCr4UyKRdvt7pr28Ar1SSeym3Vk1swLm90oaHyk2ngvN/57V4Dps2eegHakDn9Pj/y98cSvg==
X-Received: by 2002:a17:90a:68c3:: with SMTP id q3mr2817394pjj.135.1606830671522;
        Tue, 01 Dec 2020 05:51:11 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id z22sm3134111pfn.153.2020.12.01.05.51.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Dec 2020 05:51:10 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: krzk@kernel.org
Date: Tue,  1 Dec 2020 22:50:26 +0900
Message-Id: <1606830628-10236-3-git-send-email-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1606830628-10236-1-git-send-email-bongsu.jeon@samsung.com>
References: <1606830628-10236-1-git-send-email-bongsu.jeon@samsung.com>
Message-ID-Hash: 6IXB4EJ2EWIRFOZCTCSTFZ2O4MJOZ2QJ
X-Message-ID-Hash: 6IXB4EJ2EWIRFOZCTCSTFZ2O4MJOZ2QJ
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v4 net-next 2/4] nfc: s3fwrn5: reduce the EN_WAIT_TIME
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/6IXB4EJ2EWIRFOZCTCSTFZ2O4MJOZ2QJ/>
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
