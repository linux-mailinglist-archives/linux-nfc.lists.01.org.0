Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5484A2C5854
	for <lists+linux-nfc@lfdr.de>; Thu, 26 Nov 2020 16:35:17 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id A90A9100EC1D5;
	Thu, 26 Nov 2020 07:35:15 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 7B7E7100EC1D5
	for <linux-nfc@lists.01.org>; Thu, 26 Nov 2020 07:35:13 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id 62so1974509pgg.12
        for <linux-nfc@lists.01.org>; Thu, 26 Nov 2020 07:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Hlu3v+ZFJOSkIPaRs/ikcCBt9YqRCc7L3x2QFe+kevY=;
        b=rKRfOh+eodDYnH1rgBvoBHPJmuz0A1hhdXjxxyIFYgBezcTeXKHiUQPnPF2mn0EdAq
         fmYZ9B4jum9FhUXYqAd8VoZCRy7jTZSDNNBxSI6rXVwY6WLsmp4MGtaI9LLZAUs/IJjK
         HCNZYwa8KOA6dgQCSksaIigeOJ0uQBfyEmZfj4AF/bQorqJtLZsDFc0nbnIMYCafj7/W
         k4ItVoV0has0JYebVsnSsWdzR4tzyy1Ku4Y5j+odzA0CHiim8FscR9NB0pcUv7h+QPnV
         pJZBLbNLrdMXu+fzpxuQzeJvE0DsZ4zvlEKVmlVzSO0NxxCkjthy1Z/Rry3B+1PZWwoR
         gdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Hlu3v+ZFJOSkIPaRs/ikcCBt9YqRCc7L3x2QFe+kevY=;
        b=jFhHtQfsprj+zNo6MnPED6LnXf2z2Aelr75QNyEFosd6Z5gPW5tDJ/vF40ziJWv7kj
         pbvJEZFeDoXXLIdItStII32vsqsQaRxdMLhJGfAXHIOrT9GkXetjItb6NlmY3zPOHPMU
         SI1MeYA3kIA5hAI8cTkaRGNioWFYYuI2K6TiAuFKsrvr/qiCB1BJ+zbcEwvW7+irtLor
         cf5TNYZks14s2ceuYgCIJQC89UcDiIEtefyRYLryv41Kps5AvgugMdUqHhSFCEcxCuyJ
         cD9CSOQiR4zbkIJTlwviJ/w0VvqvgsNx86gMkjmQuDTLY5aCM2l4NiB+weZUn/VvTcG7
         aaxw==
X-Gm-Message-State: AOAM530KO8pxZKP+0v8AKdTyi8U6Y+2A0GQI9w5J6iUA2XmJY67iVNBX
	7fihiuLqsLCvMsJF5Zj3V/g=
X-Google-Smtp-Source: ABdhPJx5IMqTGO49naTZkLoLYrSW4kmnK1pxbor17shzOO5yqhgBFdGZzUBhUJykdH35TpHZL9FKrw==
X-Received: by 2002:a17:90b:3753:: with SMTP id ne19mr4197437pjb.148.1606404912911;
        Thu, 26 Nov 2020 07:35:12 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id g6sm6506481pjd.3.2020.11.26.07.35.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 07:35:12 -0800 (PST)
From: bongsu.jeon2@gmail.com
X-Google-Original-From: bongsu.jeon@samsung.com
To: krzk@kernel.org,
	k.opasiak@samsung.com
Date: Fri, 27 Nov 2020 00:33:38 +0900
Message-Id: <1606404819-30647-2-git-send-email-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1606404819-30647-1-git-send-email-bongsu.jeon@samsung.com>
References: <1606404819-30647-1-git-send-email-bongsu.jeon@samsung.com>
Message-ID-Hash: DOBH4ETEK5WOICLVJJZ3NDQV3NNBTIC7
X-Message-ID-Hash: DOBH4ETEK5WOICLVJJZ3NDQV3NNBTIC7
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH net-next 2/3] nfc: s3fwrn5: reduce the EN_WAIT_TIME
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/DOBH4ETEK5WOICLVJJZ3NDQV3NNBTIC7/>
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
