Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E1F305C84
	for <lists+linux-nfc@lfdr.de>; Wed, 27 Jan 2021 14:09:05 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 251E5100EB329;
	Wed, 27 Jan 2021 05:09:04 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 10EBB100EB329
	for <linux-nfc@lists.01.org>; Wed, 27 Jan 2021 05:09:02 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id f63so1140187pfa.13
        for <linux-nfc@lists.01.org>; Wed, 27 Jan 2021 05:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=akOAnHugAHPJeCqi35Sqlt5ZAXSR+liw5k5JrKdtLYY=;
        b=MYlSv3Gwyb2U5Zh9P4j4dxu4cFXuanCeDSbq7Uc5oaY6BOJ99A0rtOPAD03gbvzXZA
         HAIGgYhcDx3YUc01Z8e8M+Vkxyxa1dplJurYzPviBohFMSq/X6RSxcKKP9fHLmHIDq90
         qZlVkveGM2aGLBc1gUCAQ5yULIDvynO2dBEhiqG9C7urcxOK8ocX28MfukHRZd5Y28gv
         DdED5Kczdwx+e+60BbEb2tdMBydOKNgt4dikY03fiha5eltaEQqqgS6ppiSC0w7WFFco
         PhKX1lrTarNI3sgTWykuCj4rT5iIp3a4ChxntyRtfP77Ooa0owoea3yb89lUu+qZIUoE
         Zstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=akOAnHugAHPJeCqi35Sqlt5ZAXSR+liw5k5JrKdtLYY=;
        b=GxVwZnG3RyXsSdS6ZX/UN4FWsRW/jZPB3dzzYe9AL47yy5nKrhfJPFZkCeZbywAvOM
         EljmOnxDCCyQO94fA09uNXHjdApAGNPczd+ZeEbvNi3vvjEFwO0etUF2Gb9Hq27F9N2r
         OQLcufPW0DT7IHjK1k6vBTHFvlxh/UiCUzpy3t5JHJXggAy5dt6Af9iIB3uAdVPriTHX
         ZD5syWNRmFKGQIC/GV7MICqbQub9fpBgQSJIIKuGywGlPeFOmQYYsQ+gW+W+y1qxy8E+
         CdW5cjbRPOGmvdGldyR8l3XHCiThGzdR/02g34qrgLnkcGTjTtJqamZ6da/1AllUriCJ
         ySeg==
X-Gm-Message-State: AOAM533LNjywSpVaZUAlBY20IZC3zq1JBI9vwhTl+beHTS637PnRDfpj
	BQtB2w0VYpRbE8keG7/0OYk=
X-Google-Smtp-Source: ABdhPJyZ3KaVZn4++y4J2UNI5jeYjHxlohfF95NPiFPnE0ZvJK0exxtdOd5pT2V8nGM49tJ20bV4pw==
X-Received: by 2002:a63:6fce:: with SMTP id k197mr11309643pgc.423.1611752941709;
        Wed, 27 Jan 2021 05:09:01 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id 6sm2163343pjm.31.2021.01.27.05.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 05:09:01 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: kuba@kernel.org,
	shuah@kernel.org
Date: Wed, 27 Jan 2021 22:08:28 +0900
Message-Id: <20210127130829.4026-2-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210127130829.4026-1-bongsu.jeon@samsung.com>
References: <20210127130829.4026-1-bongsu.jeon@samsung.com>
MIME-Version: 1.0
Message-ID-Hash: B3IUGQYOZHH65GEGYW6SLPHB6X245NZK
X-Message-ID-Hash: B3IUGQYOZHH65GEGYW6SLPHB6X245NZK
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: krzk@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-nfc@lists.01.org, linux-kselftest@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH net-next v4 1/2] nfc: Add a virtual nci device driver
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/B3IUGQYOZHH65GEGYW6SLPHB6X245NZK/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

NCI virtual device simulates a NCI device to the user. It can be used to
validate the NCI module and applications. This driver supports
communication between the virtual NCI device and NCI module.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/Kconfig          |  11 ++
 drivers/nfc/Makefile         |   1 +
 drivers/nfc/virtual_ncidev.c | 215 +++++++++++++++++++++++++++++++++++
 3 files changed, 227 insertions(+)
 create mode 100644 drivers/nfc/virtual_ncidev.c

diff --git a/drivers/nfc/Kconfig b/drivers/nfc/Kconfig
index 75c65d339018..288c6f1c6979 100644
--- a/drivers/nfc/Kconfig
+++ b/drivers/nfc/Kconfig
@@ -49,6 +49,17 @@ config NFC_PORT100
 
 	  If unsure, say N.
 
+config NFC_VIRTUAL_NCI
+	tristate "NCI device simulator driver"
+	depends on NFC_NCI
+	help
+	  NCI virtual device simulates a NCI device to the user.
+	  It can be used to validate the NCI module and applications.
+	  This driver supports communication between the virtual NCI device and
+	  module.
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
index 000000000000..f73ee0bf3593
--- /dev/null
+++ b/drivers/nfc/virtual_ncidev.c
@@ -0,0 +1,215 @@
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
+static struct miscdevice miscdev;
+static struct sk_buff *send_buff;
+static struct nci_dev *ndev;
+static DEFINE_MUTEX(nci_mutex);
+
+static int virtual_nci_open(struct nci_dev *ndev)
+{
+	return 0;
+}
+
+static int virtual_nci_close(struct nci_dev *ndev)
+{
+	mutex_lock(&nci_mutex);
+	kfree_skb(send_buff);
+	send_buff = NULL;
+	mutex_unlock(&nci_mutex);
+
+	return 0;
+}
+
+static int virtual_nci_send(struct nci_dev *ndev, struct sk_buff *skb)
+{
+	mutex_lock(&nci_mutex);
+	if (state != virtual_ncidev_enabled) {
+		mutex_unlock(&nci_mutex);
+		return 0;
+	}
+
+	if (send_buff) {
+		mutex_unlock(&nci_mutex);
+		return -1;
+	}
+	send_buff = skb_copy(skb, GFP_KERNEL);
+	mutex_unlock(&nci_mutex);
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
+	mutex_lock(&nci_mutex);
+	if (!send_buff) {
+		mutex_unlock(&nci_mutex);
+		return 0;
+	}
+
+	actual_len = min_t(size_t, count, send_buff->len);
+
+	if (copy_to_user(buf, send_buff->data, actual_len)) {
+		mutex_unlock(&nci_mutex);
+		return -EFAULT;
+	}
+
+	skb_pull(send_buff, actual_len);
+	if (send_buff->len == 0) {
+		consume_skb(send_buff);
+		send_buff = NULL;
+	}
+	mutex_unlock(&nci_mutex);
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
+	if (copy_from_user(skb_put(skb, count), buf, count)) {
+		kfree_skb(skb);
+		return -EFAULT;
+	}
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
+	struct nfc_dev *nfc_dev = ndev->nfc_dev;
+	void __user *p = (void __user *)arg;
+
+	if (cmd != IOCTL_GET_NCIDEV_IDX)
+		return -ENOTTY;
+
+	if (copy_to_user(p, &nfc_dev->idx, sizeof(nfc_dev->idx)))
+		return -EFAULT;
+
+	return 0;
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
+	state = virtual_ncidev_disabled;
+	miscdev.minor = MISC_DYNAMIC_MINOR;
+	miscdev.name = "virtual_nci";
+	miscdev.fops = &virtual_ncidev_fops;
+	miscdev.mode = S_IALLUGO;
+
+	return misc_register(&miscdev);
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
