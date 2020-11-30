Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6432C83B1
	for <lists+linux-nfc@lfdr.de>; Mon, 30 Nov 2020 13:02:52 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id F3C2E100ED498;
	Mon, 30 Nov 2020 04:02:50 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 2DB57100ED48D
	for <linux-nfc@lists.01.org>; Mon, 30 Nov 2020 04:02:49 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id w16so9942380pga.9
        for <linux-nfc@lists.01.org>; Mon, 30 Nov 2020 04:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Hlu3v+ZFJOSkIPaRs/ikcCBt9YqRCc7L3x2QFe+kevY=;
        b=X7TJxOUVStq0aYMXo56iVGChzK97jthX3WKRB3TJEdnWe0UNNbhFbeT33zeCXSk/5K
         QWYRc2h5MLuNjshDlRCIxrEKTlENF6/G8VMY4Zfz5hP/fRankxzbhx/12Mg4JC9x6OD3
         svg8AbojYWU4jRU5Xer63Y3qn7HKnvfkS49m3jrkR04qyqDC6alAwvp6YzzWuOMXI0FN
         7PqG0+xIYasvWXJrVFVm0DXqu1L4W1UudEshpSeJGgApVmnpyO7Vlodk6f3nlPHMpANZ
         0fnbncL/Nt/U8AEhie6X1lVx6ECQfRUeRpgTdBk6HBFzXxpXBXjt/TxVtTgxJMnmgHJW
         ClNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Hlu3v+ZFJOSkIPaRs/ikcCBt9YqRCc7L3x2QFe+kevY=;
        b=TxJrF+4gtlKyFv172PYaoex/psKaLMUosPz/HL1AEckIJljvhqzNyrmVCsPFJeDXld
         rCebawIlQv+DIpAxnOWIwHhR1Qc13uTCoDiKKnoPVEzNdgBrdgXl/qAva/F7ddpumRSA
         B/9NGiEONP8j+5Fnwvvbe7VIkpyJ3bAfnq04LQzGG26W2dSvKfwLsiyNeaT4mDH4nE26
         gplwQmqA+XrVVAViwqf3/vpn2Wke8QappHfzhuZuj72JoJI+aYKX2UZ5OhNgoBdLnV6Q
         Y/KpiPSJOdIaaDF7dfhuDoXtmPRx6gvEDP5oKHmx88pSvX0JedvX+q8Rl7T+cJJq4giD
         HmHA==
X-Gm-Message-State: AOAM5335G9JxURAVI6qQTVXsgJ8X0us2wdnGgfvXudB7ts8krOJv6Wpt
	cIkLtfkNYPq+/+bIb0ccgEU=
X-Google-Smtp-Source: ABdhPJxVjfr4ZJSerSeBSzVuIwupCdXcbfDHqqe8dbotpgNpJvQ1sHZycjiWgr+fPbQ6LYTGoiDCFQ==
X-Received: by 2002:a62:2cc3:0:b029:197:dda8:476a with SMTP id s186-20020a622cc30000b0290197dda8476amr17836923pfs.37.1606737768884;
        Mon, 30 Nov 2020 04:02:48 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id cu4sm2938023pjb.18.2020.11.30.04.02.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Nov 2020 04:02:47 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: krzk@kernel.org
Date: Mon, 30 Nov 2020 21:02:30 +0900
Message-Id: <1606737750-29537-1-git-send-email-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 1.9.1
Message-ID-Hash: ZTNTYI6MRD6Q6PSQD3QQCBYPSYWQLREV
X-Message-ID-Hash: ZTNTYI6MRD6Q6PSQD3QQCBYPSYWQLREV
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH net-next 2/4] nfc: s3fwrn5: reduce the EN_WAIT_TIME
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ZTNTYI6MRD6Q6PSQD3QQCBYPSYWQLREV/>
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
