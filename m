Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 224E82C5853
	for <lists+linux-nfc@lfdr.de>; Thu, 26 Nov 2020 16:35:08 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 9B90A100EC1D3;
	Thu, 26 Nov 2020 07:35:06 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 19EDE100EC1D2
	for <linux-nfc@lists.01.org>; Thu, 26 Nov 2020 07:35:03 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id t3so1984622pgi.11
        for <linux-nfc@lists.01.org>; Thu, 26 Nov 2020 07:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=f18jjpAb3a6wwaCwAQVq0XjGDSvE4J1ZBEOKED5Wevo=;
        b=on+EDg2Z1e4uBbPphYAsXBdymQ1mDw1L7F4O+cc3NuYhxJmsVg1q4l0KdjogSr0UmM
         5zX3C570Udeih/3brql3WxCCiAIZw+1Lf1952jtEqG2jsSOX3xqxQk7Xuf0OIbWUz0br
         hiShsEQNM0vzINR6dKHYML6X7wfzmY7aAH11ekUPkl3PhnFVS9VnHKRIM0ULwfuJqZBD
         L2LyRWHFu6IQAuWmsWK/+7aQqqhBPc6eOEbUKFF1229In9jIuG9TxcJyEnYunJ7WrJhg
         cyhHUZK9vAJ6KnDbTzZtc0aUb67mksJOUh8/HT9iAelnsyCsL6I8CPW1KJNqEUMEBeEz
         co4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=f18jjpAb3a6wwaCwAQVq0XjGDSvE4J1ZBEOKED5Wevo=;
        b=aCNDyHjwUpSAS6NnQCo10f0JICASkMtny58jcRy1ticcsO0XfDLFqwXClrZ6IvFZPC
         7XsIHg5xFwmlo+CHOirm9f/FsuzQ8MOvg9W5KVQpbAy2dbtXkllAkqsNGHG2EQzRdmeo
         718zvIwJhYEMAhRpz+t2aZaK0SM9uxwBDXuGmjeBwUE5152HLUW/zlIlfK8Sbqbrn295
         KGMX5rH4PSHfACCmT8UILABu4Xl12oAx5OOGExX7MX6RNc/cOZXmgJRJnnjNFXjfuOxI
         MKNV0AMf4o4MuC+wMGQEsat2RLDmABgjBWPYtxbN66maZhim0ezQlYS1xqFc4wYAQck+
         6jWQ==
X-Gm-Message-State: AOAM5330o9qbcpAbL6KQL3WXFDJzQnhUew2B0jk9BLeVkZIFtNze7XyK
	vHeDrOJxGtP4DufNQ/X/Q8w=
X-Google-Smtp-Source: ABdhPJwN8JxU7ItTaAdq7ulGQESO+3r0lT2l5ej+ZQV1Afo2Y+5tToywpDHctLNXQGDL7+pqnZjdsg==
X-Received: by 2002:a17:90a:a81:: with SMTP id 1mr4229453pjw.165.1606404903469;
        Thu, 26 Nov 2020 07:35:03 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id g6sm6506481pjd.3.2020.11.26.07.35.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 07:35:02 -0800 (PST)
From: bongsu.jeon2@gmail.com
X-Google-Original-From: bongsu.jeon@samsung.com
To: krzk@kernel.org,
	k.opasiak@samsung.com
Date: Fri, 27 Nov 2020 00:33:37 +0900
Message-Id: <1606404819-30647-1-git-send-email-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 1.9.1
Message-ID-Hash: TCPCCIEC7V4SAXG2QB6HORG7U54TRLEY
X-Message-ID-Hash: TCPCCIEC7V4SAXG2QB6HORG7U54TRLEY
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH net-next 1/3] nfc: s3fwrn5: use signed integer for parsing GPIO numbers
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/TCPCCIEC7V4SAXG2QB6HORG7U54TRLEY/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Krzysztof Kozlowski <krzk@kernel.org>

GPIOs - as returned by of_get_named_gpio() and used by the gpiolib - are
signed integers, where negative number indicates error.  The return
value of of_get_named_gpio() should not be assigned to an unsigned int
because in case of !CONFIG_GPIOLIB such number would be a valid GPIO.

Fixes: c04c674fadeb ("nfc: s3fwrn5: Add driver for Samsung S3FWRN5 NFC Chip")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/nfc/s3fwrn5/i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
index 0ffa389..ae26594 100644
--- a/drivers/nfc/s3fwrn5/i2c.c
+++ b/drivers/nfc/s3fwrn5/i2c.c
@@ -25,8 +25,8 @@ struct s3fwrn5_i2c_phy {
 	struct i2c_client *i2c_dev;
 	struct nci_dev *ndev;
 
-	unsigned int gpio_en;
-	unsigned int gpio_fw_wake;
+	int gpio_en;
+	int gpio_fw_wake;
 
 	struct mutex mutex;
 
-- 
1.9.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
