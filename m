Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BCB2D0F89
	for <lists+linux-nfc@lfdr.de>; Mon,  7 Dec 2020 12:38:58 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 03799100EBBDE;
	Mon,  7 Dec 2020 03:38:56 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 086C1100EBBDD
	for <linux-nfc@lists.01.org>; Mon,  7 Dec 2020 03:38:50 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id 69so813516pgg.8
        for <linux-nfc@lists.01.org>; Mon, 07 Dec 2020 03:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=XxtvTDPqeKzw9+arch/biJr3gHkzLW6Sc6rv2JJ52og=;
        b=GnXaRsOBlcVJUCF6XZaheOLdwpQ1sHcjNRiMo5X3Gzh+1LK7Xr6QxnnivrArLZf39L
         ni/jLzLcicSny/FaLremq2uY3Cv+6NAmidBRI+2q2COxMqajrmk4vObo9uPXKyj5kF/d
         S6Ipmec4HHEyozpu5QqOzl+P24iAkqZ4maHllbT4oNlgqINEc7y5tkX9KglbCS3De04f
         2elj0ztJRz7Z7gpoiFh5ZB2IPKNyPF88dRWAjqNUp/XeKsugCkIM78hxWJ+tt2W7Kpdg
         EfbbQUAc/spsk3Cw9MASuAR84NnUU6XoqkyhATEn/udNappWmOyMeebJmI5Yf16u/IuG
         IMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XxtvTDPqeKzw9+arch/biJr3gHkzLW6Sc6rv2JJ52og=;
        b=CqJlApAgVlFcDWo/jC1fH5cAxGkUcx0dzjimVrN0c6xlaHLXbN6SsPlGkzQxZ9NGaq
         oVCm+oIMWH20Bmp0ybf8m7brnay6E0eUOdUOLK65M27fIS7zVsAXH6+Ygji9aqox8eqL
         /qeJAIqaXQcndJ7rTgo1WqNHtH8INdavzgxOoRIJgxNMhMyGSyB5IfwhdsZQYiKwOXMU
         I0VtLTz4sX913O+Hn/hQkYn3IXUv0gCX6Zoc2ySAyV/i0rFpMAuogLcwS7c6CUTtub8B
         Oe8R7tHOHpNNiTzKAGzW053dUTEhwBAKASlrmS4Kpkze4bCeFQPdcPhJIHCARSoPPnob
         J0sA==
X-Gm-Message-State: AOAM532UyKGp2jLKce00Qooju8Yz3l7mULTIMLDzB01hfjY/14l2ZDjN
	jUizXrhkZgWYD/d5W3B+u4E=
X-Google-Smtp-Source: ABdhPJxKgvPb+FJSDg5yPGAALaN/5kFXVqrSWJzfpR/lSjPFM6sHEN5a2k0MdSFj9/7Vu8Ig9YJhrg==
X-Received: by 2002:a17:902:b7c3:b029:da:74c3:427 with SMTP id v3-20020a170902b7c3b02900da74c30427mr16073149plz.38.1607341130166;
        Mon, 07 Dec 2020 03:38:50 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id w191sm10219436pfd.145.2020.12.07.03.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 03:38:49 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: krzk@kernel.org
Date: Mon,  7 Dec 2020 20:38:27 +0900
Message-Id: <20201207113827.2902-1-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 2.17.1
Message-ID-Hash: X3XEB445KBZ6R6BNCQZULSGDZPQNCPES
X-Message-ID-Hash: X3XEB445KBZ6R6BNCQZULSGDZPQNCPES
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH net-next] nfc: s3fwrn5: Change irqflags
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/X3XEB445KBZ6R6BNCQZULSGDZPQNCPES/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

change irqflags from IRQF_TRIGGER_HIGH to IRQF_TRIGGER_RISING for stable
Samsung's nfc interrupt handling.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/s3fwrn5/i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
index e1bdde105f24..016f6b6df849 100644
--- a/drivers/nfc/s3fwrn5/i2c.c
+++ b/drivers/nfc/s3fwrn5/i2c.c
@@ -213,7 +213,7 @@ static int s3fwrn5_i2c_probe(struct i2c_client *client,
 		return ret;
 
 	ret = devm_request_threaded_irq(&client->dev, phy->i2c_dev->irq, NULL,
-		s3fwrn5_i2c_irq_thread_fn, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+		s3fwrn5_i2c_irq_thread_fn, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 		S3FWRN5_I2C_DRIVER_NAME, phy);
 	if (ret)
 		s3fwrn5_remove(phy->common.ndev);
-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
