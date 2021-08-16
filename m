Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7B33ECD6D
	for <lists+linux-nfc@lfdr.de>; Mon, 16 Aug 2021 06:06:21 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 439C6100EBB7D;
	Sun, 15 Aug 2021 21:06:20 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 17D8C100EBB7D
	for <linux-nfc@lists.01.org>; Sun, 15 Aug 2021 21:06:18 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id q2so19311823plr.11
        for <linux-nfc@lists.01.org>; Sun, 15 Aug 2021 21:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SRoGE6btz3FIzsoVU86GKd+sAIx4GipMBZ33HNO90os=;
        b=Pd9zk65/+kFF5GDGVDxQwpyZalbA3joiA6kVand7R7RU1uHhpsD7kaIuM3PCgxyhrz
         ooaT6q6u5i9zGkFo9PzovH1yiH3Mz0VXKar50oo/FkZanUZYZjfgWqD5qb+MdIm55O7m
         sSWJBHvftQ8oOjkF6g0+h6Ft0XmesX6jgxvyFYOXYkQYdav2SrMu6b1TfePXtoD53T5Y
         kkub9/FAtGHPp0h/6P6CA5zv1Sl+86MI4yJDpE+8TpuWfBh6V9x0KVMKA5/mhG31YYp1
         v5L5FjvnOBFEPOQ3oZl1kqDT9ex0cPn0W0P3rYvCx4kws6/rASYIBZDmiUoE+B1Sl9ao
         gV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SRoGE6btz3FIzsoVU86GKd+sAIx4GipMBZ33HNO90os=;
        b=mrRYAmvBfgf7HDnM+fFJ2vh5r32bKUt59hKQ61P79g8qeFJZn0iPRjdzi8qiQw7Cwp
         t7fZMFF+tgvBc2dtsigecUGZLC6rg+CCjX/SOl942Mgvs04h1ITCx9vYT7pev4rdrdjS
         cqDOOeeLKJ9s1mPCLqaX3Ww9XWI41Lqf9jpUXFoAnExJKOZ7laq5a+1NOgyq8r0BZJQY
         o9KLXnB9Sx2Az3aZKssK1dG0X/Xf0fY90Z6MsJBpug+Sce6JTn5WO9bzky1GjIaaNITG
         4oSysFD6deQOZaxnFKiNYXtbGFgiJJfMYWHYhssTRftebexsb+CWcHNWvEYVJuRZ8+cA
         f2yg==
X-Gm-Message-State: AOAM530fIeVjC4LPKWRwsgDRaMhP/U0598GD/8p0w8QBLBcXIlP+Pe3s
	X21CB94sAfav7A/227HqwnI=
X-Google-Smtp-Source: ABdhPJyOUpYN9GoJC+C8C2qZrzfUkPYDKbU61b/QtSTN8i0QTo860aLD7Xxl6TNxxcvcZOFhVaGZIg==
X-Received: by 2002:a17:90a:35e:: with SMTP id 30mr15452139pjf.160.1629086777396;
        Sun, 15 Aug 2021 21:06:17 -0700 (PDT)
Received: from ubuntu.localdomain ([182.226.226.37])
        by smtp.gmail.com with ESMTPSA id i6sm9436998pfa.44.2021.08.15.21.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 21:06:16 -0700 (PDT)
From: bongsu.jeon2@gmail.com
To: shuah@kernel.org,
	krzysztof.kozlowski@canonical.com
Date: Sun, 15 Aug 2021 21:05:58 -0700
Message-Id: <20210816040600.175813-2-bongsu.jeon2@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816040600.175813-1-bongsu.jeon2@gmail.com>
References: <20210816040600.175813-1-bongsu.jeon2@gmail.com>
MIME-Version: 1.0
Message-ID-Hash: ZIGFMWCT5XPV3KZ6TZ7WR7MCWYKSQTE4
X-Message-ID-Hash: ZIGFMWCT5XPV3KZ6TZ7WR7MCWYKSQTE4
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: netdev@vger.kernel.org, linux-nfc@lists.01.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH net-next 1/3] nfc: Change the virtual NCI device driver to use Wait Queue
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ZIGFMWCT5XPV3KZ6TZ7WR7MCWYKSQTE4/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

In previous version, the user level virtual device application that used
this driver should have the polling scheme to read a NCI frame.
To remove this polling scheme, changed the driver code to use Wait Queue.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/virtual_ncidev.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/nfc/virtual_ncidev.c b/drivers/nfc/virtual_ncidev.c
index 2ee0ec4bb739..1953904176a2 100644
--- a/drivers/nfc/virtual_ncidev.c
+++ b/drivers/nfc/virtual_ncidev.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/miscdevice.h>
 #include <linux/mutex.h>
+#include <linux/wait.h>
 #include <net/nfc/nci_core.h>
 
 enum virtual_ncidev_mode {
@@ -27,6 +28,7 @@ enum virtual_ncidev_mode {
 				 NFC_PROTO_ISO15693_MASK)
 
 static enum virtual_ncidev_mode state;
+static DECLARE_WAIT_QUEUE_HEAD(wq);
 static struct miscdevice miscdev;
 static struct sk_buff *send_buff;
 static struct nci_dev *ndev;
@@ -61,6 +63,7 @@ static int virtual_nci_send(struct nci_dev *ndev, struct sk_buff *skb)
 	}
 	send_buff = skb_copy(skb, GFP_KERNEL);
 	mutex_unlock(&nci_mutex);
+	wake_up_interruptible(&wq);
 
 	return 0;
 }
@@ -76,12 +79,11 @@ static ssize_t virtual_ncidev_read(struct file *file, char __user *buf,
 {
 	size_t actual_len;
 
-	mutex_lock(&nci_mutex);
-	if (!send_buff) {
-		mutex_unlock(&nci_mutex);
+	wait_event_interruptible(wq, send_buff);
+	if (!send_buff)
 		return 0;
-	}
 
+	mutex_lock(&nci_mutex);
 	actual_len = min_t(size_t, count, send_buff->len);
 
 	if (copy_to_user(buf, send_buff->data, actual_len)) {
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
