Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 172E52CA44F
	for <lists+linux-nfc@lfdr.de>; Tue,  1 Dec 2020 14:51:29 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id DB698100EC1EC;
	Tue,  1 Dec 2020 05:51:27 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 02A09100EC1E9
	for <linux-nfc@lists.01.org>; Tue,  1 Dec 2020 05:51:24 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id f17so1231862pge.6
        for <linux-nfc@lists.01.org>; Tue, 01 Dec 2020 05:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1Z7unpyyAKqPaIPQ8XswaqhIgFtGGf6CTAdKh/+0DN4=;
        b=cAYoH4hHJHFUCrxQZ0bP9is7GhLr4Tnayt2xhV0vgeyJykPYPgS67T4w/zxyUfvVp/
         Ie4H3R+xY8xKQ7oNNn3TPMn7pnIN/8Zq00cFOTQ4xZkggOA3qn5dKiOYAI8gLJPL8W0q
         PDFjkGeoJGNF8QuSWIFyhM/UlVd2sG6W9Ep/VLB9M6IpJYBhPhNhruvCeNJc6p4PiRU2
         LYFjo2wE6oFp2iG8om+yfxtQ3iFQRksRKt4YPK/4FkReC4I3trqyqdzclgrnFYjh+cJj
         fj9ti81TCg1y6hFpLyYJ0CoWL11MFUvEegj4s7NmQqC1fPxc899dyT1YsADFBOAL8C6D
         cK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1Z7unpyyAKqPaIPQ8XswaqhIgFtGGf6CTAdKh/+0DN4=;
        b=a74essZeC/MIhRf66Kse7M8Xl1xZjTMYzg0VekwGX+cQ1mYn5OD5c2OUMTC6FsQpAs
         lvHrxBHJMDARv/1Tw0vk4d7gwtWNOwRsYtpxWczcdnBeCz5s/gMlNmq98yju7FovuvpM
         Bl49opobxmSkYrSta4BeePQFuGyb5sTlmHHF+nk65mJjxgSszyAYzTyqFEOcapa+XxNv
         6x3I8KwNvDWDS8GsjaemzqJegTwdBqKn39qIcVhpSIBrK5Tx2TxUPX/d+5u5PF3Pp6rZ
         ru+OCLp9fj/urd2N3Ofv6nT6C8rs8/3fS9hM+Oaoyc5do3FeQ3XpCigTBtSXNtc7uzN6
         Sj7g==
X-Gm-Message-State: AOAM5312oHZyncDcO7FzkuwQZBV/bDCpwdqaDQkiUmR/jSdGpa598gCm
	oo/FhAUXOVXpdP+KJakAV6M=
X-Google-Smtp-Source: ABdhPJydBuNow9mH9wFIRzXoGfX0RzO9kkbxGuoyaI5dh0ztgk3snPDEc0RtuRsjj5DmJBKXGVRhMw==
X-Received: by 2002:a63:4a0e:: with SMTP id x14mr2366649pga.376.1606830684167;
        Tue, 01 Dec 2020 05:51:24 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id z22sm3134111pfn.153.2020.12.01.05.51.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Dec 2020 05:51:23 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: krzk@kernel.org
Date: Tue,  1 Dec 2020 22:50:28 +0900
Message-Id: <1606830628-10236-5-git-send-email-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1606830628-10236-1-git-send-email-bongsu.jeon@samsung.com>
References: <1606830628-10236-1-git-send-email-bongsu.jeon@samsung.com>
Message-ID-Hash: OJ7BFHMDGCNXBHMUGXWKCTCTT7UKII22
X-Message-ID-Hash: OJ7BFHMDGCNXBHMUGXWKCTCTT7UKII22
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v4 net-next 4/4] nfc: s3fwrn5: Support a UART interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/OJ7BFHMDGCNXBHMUGXWKCTCTT7UKII22/>
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
S3FWRN82 uses NCI protocol and supports I2C and UART interface.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/s3fwrn5/Kconfig      |  12 +++
 drivers/nfc/s3fwrn5/Makefile     |   2 +
 drivers/nfc/s3fwrn5/phy_common.c |  12 +++
 drivers/nfc/s3fwrn5/phy_common.h |   1 +
 drivers/nfc/s3fwrn5/uart.c       | 196 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 223 insertions(+)
 create mode 100644 drivers/nfc/s3fwrn5/uart.c

diff --git a/drivers/nfc/s3fwrn5/Kconfig b/drivers/nfc/s3fwrn5/Kconfig
index 3f8b6da..8a6b1a7 100644
--- a/drivers/nfc/s3fwrn5/Kconfig
+++ b/drivers/nfc/s3fwrn5/Kconfig
@@ -20,3 +20,15 @@ config NFC_S3FWRN5_I2C
 	  To compile this driver as a module, choose m here. The module will
 	  be called s3fwrn5_i2c.ko.
 	  Say N if unsure.
+
+config NFC_S3FWRN82_UART
+        tristate "Samsung S3FWRN82 UART support"
+        depends on NFC_NCI && SERIAL_DEV_BUS
+        select NFC_S3FWRN5
+        help
+          This module adds support for a UART interface to the S3FWRN82 chip.
+          Select this if your platform is using the UART bus.
+
+          To compile this driver as a module, choose m here. The module will
+          be called s3fwrn82_uart.ko.
+          Say N if unsure.
diff --git a/drivers/nfc/s3fwrn5/Makefile b/drivers/nfc/s3fwrn5/Makefile
index 6b6f52d..7da827a 100644
--- a/drivers/nfc/s3fwrn5/Makefile
+++ b/drivers/nfc/s3fwrn5/Makefile
@@ -5,6 +5,8 @@
 
 s3fwrn5-objs = core.o firmware.o nci.o phy_common.o
 s3fwrn5_i2c-objs = i2c.o
+s3fwrn82_uart-objs = uart.o
 
 obj-$(CONFIG_NFC_S3FWRN5) += s3fwrn5.o
 obj-$(CONFIG_NFC_S3FWRN5_I2C) += s3fwrn5_i2c.o
+obj-$(CONFIG_NFC_S3FWRN82_UART) += s3fwrn82_uart.o
diff --git a/drivers/nfc/s3fwrn5/phy_common.c b/drivers/nfc/s3fwrn5/phy_common.c
index 5cad1f4..497b02b 100644
--- a/drivers/nfc/s3fwrn5/phy_common.c
+++ b/drivers/nfc/s3fwrn5/phy_common.c
@@ -47,6 +47,18 @@ bool s3fwrn5_phy_power_ctrl(struct phy_common *phy, enum s3fwrn5_mode mode)
 }
 EXPORT_SYMBOL(s3fwrn5_phy_power_ctrl);
 
+void s3fwrn5_phy_set_mode(void *phy_id, enum s3fwrn5_mode mode)
+{
+	struct phy_common *phy = phy_id;
+
+	mutex_lock(&phy->mutex);
+
+	s3fwrn5_phy_power_ctrl(phy, mode);
+
+	mutex_unlock(&phy->mutex);
+}
+EXPORT_SYMBOL(s3fwrn5_phy_set_mode);
+
 enum s3fwrn5_mode s3fwrn5_phy_get_mode(void *phy_id)
 {
 	struct phy_common *phy = phy_id;
diff --git a/drivers/nfc/s3fwrn5/phy_common.h b/drivers/nfc/s3fwrn5/phy_common.h
index b98531d..99749c9 100644
--- a/drivers/nfc/s3fwrn5/phy_common.h
+++ b/drivers/nfc/s3fwrn5/phy_common.h
@@ -31,6 +31,7 @@ struct phy_common {
 
 void s3fwrn5_phy_set_wake(void *phy_id, bool wake);
 bool s3fwrn5_phy_power_ctrl(struct phy_common *phy, enum s3fwrn5_mode mode);
+void s3fwrn5_phy_set_mode(void *phy_id, enum s3fwrn5_mode mode);
 enum s3fwrn5_mode s3fwrn5_phy_get_mode(void *phy_id);
 
 #endif /* __NFC_S3FWRN5_PHY_COMMON_H */
diff --git a/drivers/nfc/s3fwrn5/uart.c b/drivers/nfc/s3fwrn5/uart.c
new file mode 100644
index 0000000..82ea35d
--- /dev/null
+++ b/drivers/nfc/s3fwrn5/uart.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * UART Link Layer for S3FWRN82 NCI based Driver
+ *
+ * Copyright (C) 2015 Samsung Electronics
+ * Robert Baldyga <r.baldyga@samsung.com>
+ * Copyright (C) 2020 Samsung Electronics
+ * Bongsu Jeon <bongsu.jeon@samsung.com>
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/nfc.h>
+#include <linux/netdevice.h>
+#include <linux/of.h>
+#include <linux/serdev.h>
+#include <linux/gpio.h>
+#include <linux/of_gpio.h>
+
+#include "phy_common.h"
+
+#define S3FWRN82_NCI_HEADER 3
+#define S3FWRN82_NCI_IDX 2
+#define NCI_SKB_BUFF_LEN 258
+
+struct s3fwrn82_uart_phy {
+	struct phy_common common;
+	struct serdev_device *ser_dev;
+	struct sk_buff *recv_skb;
+};
+
+static int s3fwrn82_uart_write(void *phy_id, struct sk_buff *out)
+{
+	struct s3fwrn82_uart_phy *phy = phy_id;
+	int err;
+
+	err = serdev_device_write(phy->ser_dev,
+				  out->data, out->len,
+				  MAX_SCHEDULE_TIMEOUT);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+static const struct s3fwrn5_phy_ops uart_phy_ops = {
+	.set_wake = s3fwrn5_phy_set_wake,
+	.set_mode = s3fwrn5_phy_set_mode,
+	.get_mode = s3fwrn5_phy_get_mode,
+	.write = s3fwrn82_uart_write,
+};
+
+static int s3fwrn82_uart_read(struct serdev_device *serdev,
+			      const unsigned char *data,
+			      size_t count)
+{
+	struct s3fwrn82_uart_phy *phy = serdev_device_get_drvdata(serdev);
+	size_t i;
+
+	for (i = 0; i < count; i++) {
+		skb_put_u8(phy->recv_skb, *data++);
+
+		if (phy->recv_skb->len < S3FWRN82_NCI_HEADER)
+			continue;
+
+		if ((phy->recv_skb->len - S3FWRN82_NCI_HEADER)
+				< phy->recv_skb->data[S3FWRN82_NCI_IDX])
+			continue;
+
+		s3fwrn5_recv_frame(phy->common.ndev, phy->recv_skb,
+				   phy->common.mode);
+		phy->recv_skb = alloc_skb(NCI_SKB_BUFF_LEN, GFP_KERNEL);
+		if (!phy->recv_skb)
+			return 0;
+	}
+
+	return i;
+}
+
+static const struct serdev_device_ops s3fwrn82_serdev_ops = {
+	.receive_buf = s3fwrn82_uart_read,
+	.write_wakeup = serdev_device_write_wakeup,
+};
+
+static const struct of_device_id s3fwrn82_uart_of_match[] = {
+	{ .compatible = "samsung,s3fwrn82", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, s3fwrn82_uart_of_match);
+
+static int s3fwrn82_uart_parse_dt(struct serdev_device *serdev)
+{
+	struct s3fwrn82_uart_phy *phy = serdev_device_get_drvdata(serdev);
+	struct device_node *np = serdev->dev.of_node;
+
+	if (!np)
+		return -ENODEV;
+
+	phy->common.gpio_en = of_get_named_gpio(np, "en-gpios", 0);
+	if (!gpio_is_valid(phy->common.gpio_en))
+		return -ENODEV;
+
+	phy->common.gpio_fw_wake = of_get_named_gpio(np, "wake-gpios", 0);
+	if (!gpio_is_valid(phy->common.gpio_fw_wake))
+		return -ENODEV;
+
+	return 0;
+}
+
+static int s3fwrn82_uart_probe(struct serdev_device *serdev)
+{
+	struct s3fwrn82_uart_phy *phy;
+	int ret = -ENOMEM;
+
+	phy = devm_kzalloc(&serdev->dev, sizeof(*phy), GFP_KERNEL);
+	if (!phy)
+		goto err_exit;
+
+	phy->recv_skb = alloc_skb(NCI_SKB_BUFF_LEN, GFP_KERNEL);
+	if (!phy->recv_skb)
+		goto err_exit;
+
+	mutex_init(&phy->common.mutex);
+	phy->common.mode = S3FWRN5_MODE_COLD;
+
+	phy->ser_dev = serdev;
+	serdev_device_set_drvdata(serdev, phy);
+	serdev_device_set_client_ops(serdev, &s3fwrn82_serdev_ops);
+	ret = serdev_device_open(serdev);
+	if (ret) {
+		dev_err(&serdev->dev, "Unable to open device\n");
+		goto err_skb;
+	}
+
+	ret = serdev_device_set_baudrate(serdev, 115200);
+	if (ret != 115200) {
+		ret = -EINVAL;
+		goto err_serdev;
+	}
+
+	serdev_device_set_flow_control(serdev, false);
+
+	ret = s3fwrn82_uart_parse_dt(serdev);
+	if (ret < 0)
+		goto err_serdev;
+
+	ret = devm_gpio_request_one(&phy->ser_dev->dev, phy->common.gpio_en,
+				    GPIOF_OUT_INIT_HIGH, "s3fwrn82_en");
+	if (ret < 0)
+		goto err_serdev;
+
+	ret = devm_gpio_request_one(&phy->ser_dev->dev,
+				    phy->common.gpio_fw_wake,
+				    GPIOF_OUT_INIT_LOW, "s3fwrn82_fw_wake");
+	if (ret < 0)
+		goto err_serdev;
+
+	ret = s3fwrn5_probe(&phy->common.ndev, phy, &phy->ser_dev->dev,
+			    &uart_phy_ops);
+	if (ret < 0)
+		goto err_serdev;
+
+	return ret;
+
+err_serdev:
+	serdev_device_close(serdev);
+err_skb:
+	kfree_skb(phy->recv_skb);
+err_exit:
+	return ret;
+}
+
+static void s3fwrn82_uart_remove(struct serdev_device *serdev)
+{
+	struct s3fwrn82_uart_phy *phy = serdev_device_get_drvdata(serdev);
+
+	s3fwrn5_remove(phy->common.ndev);
+	serdev_device_close(serdev);
+	kfree_skb(phy->recv_skb);
+}
+
+static struct serdev_device_driver s3fwrn82_uart_driver = {
+	.probe = s3fwrn82_uart_probe,
+	.remove = s3fwrn82_uart_remove,
+	.driver = {
+		.name = "s3fwrn82_uart",
+		.of_match_table = s3fwrn82_uart_of_match,
+	},
+};
+
+module_serdev_device_driver(s3fwrn82_uart_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("UART driver for Samsung NFC");
+MODULE_AUTHOR("Bongsu Jeon <bongsu.jeon@samsung.com>");
-- 
1.9.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
