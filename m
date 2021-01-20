Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E6F2FCF34
	for <lists+linux-nfc@lfdr.de>; Wed, 20 Jan 2021 12:57:07 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id DBAD5100EB833;
	Wed, 20 Jan 2021 03:57:05 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id BB189100EB833
	for <linux-nfc@lists.01.org>; Wed, 20 Jan 2021 03:57:04 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id q20so14360386pfu.8
        for <linux-nfc@lists.01.org>; Wed, 20 Jan 2021 03:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mn+Z4RMlE5IV3+B+MFiO9hubAKqGK7Hejtc2y8hOBR4=;
        b=e199QWs8RTlwD0qY9AZtyNbwzyOtfOfZiL0mIvY0OuDVAhU6RRWWSZxbq48C2/u55K
         bI7RNBlGBkxI3u5zyZXLb/CUgrN7+lNUcDpwj7pEbaxpQe1KccEVMs/AmGOtQGyFLacF
         AQLs+c9xYbx74OPowsl+6ZGDoGSkgtOLmWwnuz7l4ixFCAxRFaHsH5eGVs30TX7aeBis
         IdvenfzxXXUNI/frDQfpfr+yJ/fas/7wjhGGxeIvFkQbqkPMagadnqmJZqCZquzUI6pP
         e4/r8Df11Tq3C5ef+XOHGSoQ29kPj40zabcqmZZdirvkT1+7LFIWYk0OSD2/KZRVSwCo
         /i6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mn+Z4RMlE5IV3+B+MFiO9hubAKqGK7Hejtc2y8hOBR4=;
        b=XWeL/+U91B43Dq2a9Jyn+CTur/3PI8XvJz9/1p5EY0/zeN4o7NXe9xXiYf//5qTJ4I
         uJe2FCDB6XWDI79zq5AC0TVQZSUgrZPIGlYJCvti6tHur3bVSqSDrei+YnHYjvREapIW
         JJXcXigYW8j6/SSWLWk0GVGnRIOP35MeS3NhDzk+X1Iw0Kw8VF7xZnDiV+m03YGSpYCK
         Qi0WLHuPZQZBx1+ZHEY6SOpdyaw4RdTZqydrZifCUiqwnZnUbs2woPuW+sP0JV6TwG/7
         MWi88AqxPsY/XsGuv+37NLwuxKMhmfw3JxWwVGn3LSw2avkFNGG2F+r1+vEKYBBGceZG
         6hJw==
X-Gm-Message-State: AOAM530XVWK1mHI3oOdOQkUgE6o/1CDhvkTF+MSMvXyOqSi8ZTkLDWbs
	zo8mJxGmYEFvlSaOH682sYo=
X-Google-Smtp-Source: ABdhPJzw4XRUe1yzEGcOkUL+VZMP31H/VckglXVIuF+6GCN0EznoPr+2aWaRnUDnxBrDldLkmI+bHQ==
X-Received: by 2002:a63:d42:: with SMTP id 2mr3127783pgn.236.1611143824375;
        Wed, 20 Jan 2021 03:57:04 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id f13sm6487856pjj.1.2021.01.20.03.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 03:57:03 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: kuba@kernel.org,
	shuah@kernel.org
Date: Wed, 20 Jan 2021 20:56:44 +0900
Message-Id: <20210120115645.32798-2-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120115645.32798-1-bongsu.jeon@samsung.com>
References: <20210120115645.32798-1-bongsu.jeon@samsung.com>
MIME-Version: 1.0
Message-ID-Hash: VNTLEPAPU4FOARZU7FTELM3S5GPBJDBZ
X-Message-ID-Hash: VNTLEPAPU4FOARZU7FTELM3S5GPBJDBZ
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: netdev@vger.kernel.org, linux-nfc@lists.01.org, linux-kselftest@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH net-next v2 1/2] nfc: Add a virtual nci device driver
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/VNTLEPAPU4FOARZU7FTELM3S5GPBJDBZ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

A NCI virtual device can be made to simulate a NCI device in user space.
Using the virtual NCI device, The NCI module and application can be
validated. This driver supports to communicate between the virtual NCI
device and NCI module.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/Kconfig          |  11 ++
 drivers/nfc/Makefile         |   1 +
 drivers/nfc/virtual_ncidev.c | 235 +++++++++++++++++++++++++++++++++++
 3 files changed, 247 insertions(+)
 create mode 100644 drivers/nfc/virtual_ncidev.c

diff --git a/drivers/nfc/Kconfig b/drivers/nfc/Kconfig
index 75c65d339018..d32c3a8937ed 100644
--- a/drivers/nfc/Kconfig
+++ b/drivers/nfc/Kconfig
@@ -49,6 +49,17 @@ config NFC_PORT100
 
 	  If unsure, say N.
 
+config NFC_VIRTUAL_NCI
+	tristate "NCI device simulator driver"
+	depends on NFC_NCI
+	help
+	  A NCI virtual device can be made to simulate a NCI device in user
+	  level. Using the virtual NCI device, The NCI module and application
+	  can be validated. This driver supports to communicate between the
+	  virtual NCI device and NCI module.
+
+	  If unsure, say N.
+
 source "drivers/nfc/fdp/Kconfig"
 source "drivers/nfc/pn544/Kconfig"
 source "drivers/nfc/pn533/Kconfig"
diff --git a/drivers/nfc/Makefile b/drivers/nfc/Makefile
index 5393ba59b17d..7b1bfde1d971 100644
--- a/drivers/nfc/Makefile
+++ b/drivers/nfc/Makefile
@@ -17,3 +17,4 @@ obj-$(CONFIG_NFC_ST_NCI)	+= st-nci/
 obj-$(CONFIG_NFC_NXP_NCI)	+= nxp-nci/
 obj-$(CONFIG_NFC_S3FWRN5)	+= s3fwrn5/
 obj-$(CONFIG_NFC_ST95HF)	+= st95hf/
+obj-$(CONFIG_NFC_VIRTUAL_NCI)	+= virtual_ncidev.o
diff --git a/drivers/nfc/virtual_ncidev.c b/drivers/nfc/virtual_ncidev.c
new file mode 100644
index 000000000000..0e327c08327c
--- /dev/null
+++ b/drivers/nfc/virtual_ncidev.c
@@ -0,0 +1,235 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Virtual NCI device simulation driver
+ *
+ * Copyright (C) 2020 Samsung Electrnoics
+ * Bongsu Jeon <bongsu.jeon@samsung.com>
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/miscdevice.h>
+#include <linux/mutex.h>
+#include <net/nfc/nci_core.h>
+
+enum virtual_ncidev_mode {
+	virtual_ncidev_enabled,
+	virtual_ncidev_disabled,
+	virtual_ncidev_disabling,
+};
+
+#define IOCTL_GET_NCIDEV_IDX    0
+#define VIRTUAL_NFC_PROTOCOLS	(NFC_PROTO_JEWEL_MASK | \
+				 NFC_PROTO_MIFARE_MASK | \
+				 NFC_PROTO_FELICA_MASK | \
+				 NFC_PROTO_ISO14443_MASK | \
+				 NFC_PROTO_ISO14443_B_MASK | \
+				 NFC_PROTO_ISO15693_MASK)
+
+static enum virtual_ncidev_mode state;
+static struct mutex nci_send_mutex;
+static struct miscdevice miscdev;
+static struct sk_buff *send_buff;
+static struct mutex nci_mutex;
+static struct nci_dev *ndev;
+static bool full_txbuff;
+
+static bool virtual_ncidev_check_enabled(void)
+{
+	bool ret = true;
+
+	mutex_lock(&nci_mutex);
+	if (state != virtual_ncidev_enabled)
+		ret = false;
+	mutex_unlock(&nci_mutex);
+
+	return ret;
+}
+
+static int virtual_nci_open(struct nci_dev *ndev)
+{
+	return 0;
+}
+
+static int virtual_nci_close(struct nci_dev *ndev)
+{
+	mutex_lock(&nci_send_mutex);
+	if (full_txbuff)
+		kfree_skb(send_buff);
+	full_txbuff = false;
+	mutex_unlock(&nci_send_mutex);
+
+	return 0;
+}
+
+static int virtual_nci_send(struct nci_dev *ndev, struct sk_buff *skb)
+{
+	if (virtual_ncidev_check_enabled() == false)
+		return 0;
+
+	mutex_lock(&nci_send_mutex);
+	if (full_txbuff) {
+		mutex_unlock(&nci_send_mutex);
+		return -1;
+	}
+	send_buff = skb_copy(skb, GFP_KERNEL);
+	full_txbuff = true;
+	mutex_unlock(&nci_send_mutex);
+
+	return 0;
+}
+
+static struct nci_ops virtual_nci_ops = {
+	.open = virtual_nci_open,
+	.close = virtual_nci_close,
+	.send = virtual_nci_send
+};
+
+static ssize_t virtual_ncidev_read(struct file *file, char __user *buf,
+				   size_t count, loff_t *ppos)
+{
+	size_t actual_len;
+
+	mutex_lock(&nci_send_mutex);
+	if (!full_txbuff) {
+		mutex_unlock(&nci_send_mutex);
+		return 0;
+	}
+
+	actual_len = count > send_buff->len ? send_buff->len : count;
+
+	if (copy_to_user(buf, send_buff->data, actual_len)) {
+		mutex_unlock(&nci_send_mutex);
+		return -EFAULT;
+	}
+
+	skb_pull(send_buff, actual_len);
+	if (send_buff->len == 0) {
+		kfree_skb(send_buff);
+		full_txbuff = false;
+	}
+	mutex_unlock(&nci_send_mutex);
+
+	return actual_len;
+}
+
+static ssize_t virtual_ncidev_write(struct file *file,
+				    const char __user *buf,
+				    size_t count, loff_t *ppos)
+{
+	struct sk_buff *skb;
+
+	skb = alloc_skb(count, GFP_KERNEL);
+	if (!skb)
+		return -ENOMEM;
+
+	if (copy_from_user(skb_put(skb, count), buf, count))
+		return -EFAULT;
+
+	nci_recv_frame(ndev, skb);
+	return count;
+}
+
+static int virtual_ncidev_open(struct inode *inode, struct file *file)
+{
+	int ret = 0;
+
+	mutex_lock(&nci_mutex);
+	if (state != virtual_ncidev_disabled) {
+		mutex_unlock(&nci_mutex);
+		return -EBUSY;
+	}
+
+	mutex_init(&nci_send_mutex);
+
+	ndev = nci_allocate_device(&virtual_nci_ops, VIRTUAL_NFC_PROTOCOLS,
+				   0, 0);
+	if (!ndev) {
+		mutex_unlock(&nci_mutex);
+		return -ENOMEM;
+	}
+
+	ret = nci_register_device(ndev);
+	if (ret < 0) {
+		nci_free_device(ndev);
+		mutex_unlock(&nci_mutex);
+		return ret;
+	}
+	state = virtual_ncidev_enabled;
+	mutex_unlock(&nci_mutex);
+
+	return 0;
+}
+
+static int virtual_ncidev_close(struct inode *inode, struct file *file)
+{
+	mutex_lock(&nci_mutex);
+
+	if (state == virtual_ncidev_enabled) {
+		state = virtual_ncidev_disabling;
+		mutex_unlock(&nci_mutex);
+
+		nci_unregister_device(ndev);
+		nci_free_device(ndev);
+
+		mutex_lock(&nci_mutex);
+	}
+
+	state = virtual_ncidev_disabled;
+	mutex_unlock(&nci_mutex);
+
+	return 0;
+}
+
+static long virtual_ncidev_ioctl(struct file *flip, unsigned int cmd,
+				 unsigned long arg)
+{
+	long res = -ENOTTY;
+
+	if (cmd == IOCTL_GET_NCIDEV_IDX) {
+		struct nfc_dev *nfc_dev = ndev->nfc_dev;
+		void __user *p = (void __user *)arg;
+
+		if (copy_to_user(p, &nfc_dev->idx, sizeof(nfc_dev->idx)))
+			return -EFAULT;
+		res = 0;
+	}
+
+	return res;
+}
+
+static const struct file_operations virtual_ncidev_fops = {
+	.owner = THIS_MODULE,
+	.read = virtual_ncidev_read,
+	.write = virtual_ncidev_write,
+	.open = virtual_ncidev_open,
+	.release = virtual_ncidev_close,
+	.unlocked_ioctl = virtual_ncidev_ioctl
+};
+
+static int __init virtual_ncidev_init(void)
+{
+	int ret;
+
+	mutex_init(&nci_mutex);
+	state = virtual_ncidev_disabled;
+	miscdev.minor = MISC_DYNAMIC_MINOR;
+	miscdev.name = "virtual_nci";
+	miscdev.fops = &virtual_ncidev_fops;
+	miscdev.mode = S_IALLUGO;
+	ret = misc_register(&miscdev);
+
+	return ret;
+}
+
+static void __exit virtual_ncidev_exit(void)
+{
+	misc_deregister(&miscdev);
+}
+
+module_init(virtual_ncidev_init);
+module_exit(virtual_ncidev_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Virtual NCI device simulation driver");
+MODULE_AUTHOR("Bongsu Jeon <bongsu.jeon@samsung.com>");
-- 
2.25.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
