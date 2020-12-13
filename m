Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE09D2D8C97
	for <lists+linux-nfc@lfdr.de>; Sun, 13 Dec 2020 11:12:55 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id D1818100EF254;
	Sun, 13 Dec 2020 02:12:53 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 2A31C100EF252
	for <linux-nfc@lists.01.org>; Sun, 13 Dec 2020 02:12:52 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id f9so10126004pfc.11
        for <linux-nfc@lists.01.org>; Sun, 13 Dec 2020 02:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=lsVx0n4zixxira9lv35hWS/y6k/uVu6Aq4wNzOSEerQ=;
        b=B3g/XyLF32jvXzIhBauVCSIK+Cap/WLc88FRLJ5wVQGa3ZaXCbY2lGzwymWFc6eI47
         kHQ1QP3eFu0wRjC2WO33G1ppzdYYAVEZc2DtWss/zzlTuCfEpOdtTTd2lmyxQP93eTFC
         CalyUGpr9FFgokvmbfxAFbcGqGy3ksNkCdfvFFsHloDzkR4H/0BeyalJDWLyFwaJ7rEQ
         Ks7wYV2L34HvbLwSPS101yDczdG6fetkKBcPcvTS6EjL32P2ozTRHpNILZL7AYy7xaze
         YBaYMgSGx5ItCXb8uZbhCSTdLvLgBf6HynTPwzKAxAK1tidmyehe3hkHpNoQnd1aSLGw
         crBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lsVx0n4zixxira9lv35hWS/y6k/uVu6Aq4wNzOSEerQ=;
        b=nmylslIa6TY9V9qTsqrAOxsE9mCA1HTXwkrS0h7u6rZFEyzFpfVRn8nDtYZAbzgUhx
         y+c1YgSyI3sRAQ5HQggmn8mT0mFzWcxcrK/zpKZZ9l10xsv/e23baU8t5s6YRQSQZQ3S
         dfAKHzaJQ8wGHLefpzlnZKC3OO/qZOzZbnDjaZpmFPWzYIx6VnF/RKsGkWibzSz7TbPg
         cHgLmaGGDHf3nH/9eJRdVBcoADo1EQkVYs9GtrHAj1FRY+ITQykWnx1G8/zdduWAKiC7
         i8WJ4RkOsXhi8Y2RPLqNpSo/TMybfhfWEfqa9szySmyh0s5zSwkwfkNzHoEF4GbvhXTt
         Vm1A==
X-Gm-Message-State: AOAM532XK1n0VZNaj+0+mm4orrPevkGRvgo9kvNV85z6zqLdh5Q7fmh8
	DPasxe9fQSkSJ8PqMu2yM6Zr0WSga60=
X-Google-Smtp-Source: ABdhPJwLJ2zQO1VWY3ErJTxneKfBu7E+i00lhvxlMuSU3DTPBNxZOpv7HPhddCEBfFAYYqJq7ssY0w==
X-Received: by 2002:a65:55c1:: with SMTP id k1mr19135135pgs.130.1607854371734;
        Sun, 13 Dec 2020 02:12:51 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id s7sm16973115pfh.207.2020.12.13.02.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 02:12:50 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: krzk@kernel.org
Date: Sun, 13 Dec 2020 19:12:38 +0900
Message-Id: <20201213101238.28373-1-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 2.17.1
Message-ID-Hash: SO4XZSSOOGHZA6FTHUAFOT5ZXOARZW3O
X-Message-ID-Hash: SO4XZSSOOGHZA6FTHUAFOT5ZXOARZW3O
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH net-next] nfc: s3fwrn5: Remove the delay for nfc sleep
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/SO4XZSSOOGHZA6FTHUAFOT5ZXOARZW3O/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

remove the delay for nfc sleep because nfc doesn't need the sleep delay.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/s3fwrn5/phy_common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/s3fwrn5/phy_common.c b/drivers/nfc/s3fwrn5/phy_common.c
index 497b02b30ae7..81318478d5fd 100644
--- a/drivers/nfc/s3fwrn5/phy_common.c
+++ b/drivers/nfc/s3fwrn5/phy_common.c
@@ -20,7 +20,8 @@ void s3fwrn5_phy_set_wake(void *phy_id, bool wake)
 
 	mutex_lock(&phy->mutex);
 	gpio_set_value(phy->gpio_fw_wake, wake);
-	msleep(S3FWRN5_EN_WAIT_TIME);
+	if (wake)
+		msleep(S3FWRN5_EN_WAIT_TIME);
 	mutex_unlock(&phy->mutex);
 }
 EXPORT_SYMBOL(s3fwrn5_phy_set_wake);
-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
