Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A14372D2CAC
	for <lists+linux-nfc@lfdr.de>; Tue,  8 Dec 2020 15:10:50 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 76748100EBBBB;
	Tue,  8 Dec 2020 06:10:49 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 99A80100EBBBE
	for <linux-nfc@lists.01.org>; Tue,  8 Dec 2020 06:10:47 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id t3so12255489pgi.11
        for <linux-nfc@lists.01.org>; Tue, 08 Dec 2020 06:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WYAUhwB4AEnUmLHEPnWWbsECh1/lymsws54jeNi8rHk=;
        b=uTE2PPQ1eqF46LhlxYJq8vLv4XFVh7FG2bCB84O6tjwSAQry7gtty2mLw9ERXclvoD
         1VHzhIw52uLaZNdlzInPZ/Ay8Ve2gBgK0tgypylJhin5Cg9VlNn0ImB5T4Oteb8Ry/5L
         sumH7i6/BuozblAdt1ALu+BepxhlUMaNmJHiSLeCzd2strcC+Ka4Fx6ZEd9H8H96N44M
         6nr5IAxKypkbXaYL+fnuWGjhTEBtcUD82fGDrDjJcGtOCogpQhq1zq0LXz4erF4O27YO
         b9H+XBWC6hKThrKoId3VCEnyfc/lf1ddflp7HWuKarmsQYDtkSgoJg6x02Tvp4OxsuQ5
         70xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WYAUhwB4AEnUmLHEPnWWbsECh1/lymsws54jeNi8rHk=;
        b=aJHBOCudLuYP6CZxkoEH4JjW3Sj6VuCxg3pbZBxMGme8Z5k3TBcQVCyWlcBTJc+6eK
         8aa8e8tYbnQcGRrKofE6HjXlsCTbZhwXRsBA81Do1dZmSS2rfHeAKC6bK3D4V/mYvTAp
         RC441qwbgVqVWYiIymwj8dKI7F0cWA3b8pzU1RtiGD4jwGNrwaFhVjGfVoXVdTOgMtXd
         BvjdZZUtTUKKvLyMuLn+zmsjhHt1vuVEimGq22/Y4ObYKloe2c4qIPAh/4H0lrMAwmjO
         JpwjFND1VnoIvPotZVcSbRWh2aNXLGrjwIDgd5HxkshwD+Qma1kjd9++H68fMmdKErCi
         3N+g==
X-Gm-Message-State: AOAM530OnEwHB/R8stzHj8IgIaW1J7k8sFAbHF5al87pl5H/DL6GZ0Iz
	GlYc/tOsh9ynM/judk+cnAA=
X-Google-Smtp-Source: ABdhPJxh/yD4Sij++zuYSOdPdYpmdKk6DDGc+0QAKFfSSYRYRCJvPr8riMdhXMutezXlgxbeF30Qhg==
X-Received: by 2002:a63:1616:: with SMTP id w22mr2672435pgl.13.1607436647281;
        Tue, 08 Dec 2020 06:10:47 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id m15sm9071951pfa.72.2020.12.08.06.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 06:10:46 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: krzk@kernel.org
Date: Tue,  8 Dec 2020 23:10:12 +0900
Message-Id: <20201208141012.6033-3-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201208141012.6033-1-bongsu.jeon@samsung.com>
References: <20201208141012.6033-1-bongsu.jeon@samsung.com>
Message-ID-Hash: EY5NWJO4SCC76YQ747KQEC7BHJLSPSHY
X-Message-ID-Hash: EY5NWJO4SCC76YQ747KQEC7BHJLSPSHY
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 net-next 2/2] nfc: s3fwrn5: Remove hard coded interrupt trigger type from the i2c module
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/EY5NWJO4SCC76YQ747KQEC7BHJLSPSHY/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

For the flexible control of interrupt trigger type, remove the hard coded
interrupt trigger type in the i2c module. The trigger type will be loaded
 from a dts.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/s3fwrn5/i2c.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
index e1bdde105f24..42f1f610ac2c 100644
--- a/drivers/nfc/s3fwrn5/i2c.c
+++ b/drivers/nfc/s3fwrn5/i2c.c
@@ -179,6 +179,8 @@ static int s3fwrn5_i2c_probe(struct i2c_client *client,
 				  const struct i2c_device_id *id)
 {
 	struct s3fwrn5_i2c_phy *phy;
+	struct irq_data *irq_data;
+	unsigned long irqflags;
 	int ret;
 
 	phy = devm_kzalloc(&client->dev, sizeof(*phy), GFP_KERNEL);
@@ -212,8 +214,11 @@ static int s3fwrn5_i2c_probe(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 
+	irq_data = irq_get_irq_data(client->irq);
+	irqflags = irqd_get_trigger_type(irq_data) | IRQF_ONESHOT;
+
 	ret = devm_request_threaded_irq(&client->dev, phy->i2c_dev->irq, NULL,
-		s3fwrn5_i2c_irq_thread_fn, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+		s3fwrn5_i2c_irq_thread_fn, irqflags,
 		S3FWRN5_I2C_DRIVER_NAME, phy);
 	if (ret)
 		s3fwrn5_remove(phy->common.ndev);
-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
