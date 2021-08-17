Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 860DC3EED5B
	for <lists+linux-nfc@lfdr.de>; Tue, 17 Aug 2021 15:28:42 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4A62C100EBB9C;
	Tue, 17 Aug 2021 06:28:39 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id E0615100EBBCB
	for <linux-nfc@lists.01.org>; Tue, 17 Aug 2021 06:28:36 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id j12-20020a17090aeb0c00b00179530520b3so5248482pjz.0
        for <linux-nfc@lists.01.org>; Tue, 17 Aug 2021 06:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wcNwkyqHnyOxur4uTjpp7x91gvUF6Xp/CC0LQ31yEz8=;
        b=Fes/h8guWo1SeIPktXNitT1SK2PYt3hOT4+ySFUpvR+oqczLSlhvtvC4bAGUj2vsvr
         vVq0DW+d5aRrdYIq+uSPhqx96S5RPbCM1jxctb+RxVy+pwFWxyQ3Fex18JBgTSZB39Mz
         GMlaoX3nhUsO9HFWYgWtNlsV9EIwDuttIu7lgrDHIATYwAq8S/zk0wS/lrMptOAYdmNV
         SqxIxQlVloDNvJ0pUTKBsQXq4fADQKwlK8Ft07EuLnNW2/GzXIh2ibERchlnnll6RIn1
         BBUy9AmMKgVeECwQ/o4JCKg5C4h/6mZo+qthUxSdaOS+9qvA45VtivPH49SeqH38naRb
         ISKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wcNwkyqHnyOxur4uTjpp7x91gvUF6Xp/CC0LQ31yEz8=;
        b=OHANgbU15WtChI1D0d02XfheIZkgNSKIyEVw9+mJpS+RufROhtUpUN4HdXH2XtFdT/
         oqT9VQKOOLGOmFXkfl/+RXDKwhQb34QBR1s7x6ck+spSC3ZR0W9efHykE8Sm6kYSkFjV
         d0qL6S/hycWsRFZqwbK304ay7dLjK2TfKsaGr9H81nq3aOW2mz0ArxKD6dRd8FE9Yx9N
         tmlk/6oNTvS6F4OtTrGK/n2YS90pQU2mJvp4x0R5T5XOuJ5DwPxFLAYyPN4gBJxiCg0h
         Cu9mjNgvjI5gVdjK8sna2X4MP8IyZDrp69+hNu0KYgEqxt+PfYoBZnykXmClYn1CJ6R5
         cO8w==
X-Gm-Message-State: AOAM5325IDfkwz9XqZI4drS51Z7Wou5m4A8rm3LD08z0M1TIn9XZhkPs
	+Sdzu/pG59fLuopU8T3qDpo=
X-Google-Smtp-Source: ABdhPJwDBkQ7wJ9HiGwi6g8wNAJnIXwdCjS5r+Xud+k7+V56KidoBT3/L2TVcvKde/Twutti806/Yg==
X-Received: by 2002:a05:6a00:8c7:b029:3a1:119b:736 with SMTP id s7-20020a056a0008c7b02903a1119b0736mr3780009pfu.52.1629206916759;
        Tue, 17 Aug 2021 06:28:36 -0700 (PDT)
Received: from ubuntu.localdomain ([182.226.226.37])
        by smtp.gmail.com with ESMTPSA id j6sm2791577pfi.220.2021.08.17.06.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 06:28:36 -0700 (PDT)
From: bongsu.jeon2@gmail.com
To: shuah@kernel.org,
	krzysztof.kozlowski@canonical.com
Date: Tue, 17 Aug 2021 06:28:11 -0700
Message-Id: <20210817132818.8275-2-bongsu.jeon2@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817132818.8275-1-bongsu.jeon2@gmail.com>
References: <20210817132818.8275-1-bongsu.jeon2@gmail.com>
MIME-Version: 1.0
Message-ID-Hash: 2DISKCDBOPZDTZKRSUQTNUBEDWN3J6DS
X-Message-ID-Hash: 2DISKCDBOPZDTZKRSUQTNUBEDWN3J6DS
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: netdev@vger.kernel.org, linux-nfc@lists.01.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 net-next 1/8] nfc: virtual_ncidev: Use wait queue instead of polling
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/2DISKCDBOPZDTZKRSUQTNUBEDWN3J6DS/>
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
To remove this polling scheme, use Wait Queue.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/virtual_ncidev.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/virtual_ncidev.c b/drivers/nfc/virtual_ncidev.c
index 2ee0ec4bb739..221fa3bb8705 100644
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
@@ -77,9 +80,11 @@ static ssize_t virtual_ncidev_read(struct file *file, char __user *buf,
 	size_t actual_len;
 
 	mutex_lock(&nci_mutex);
-	if (!send_buff) {
+	while (!send_buff) {
 		mutex_unlock(&nci_mutex);
-		return 0;
+		if (wait_event_interruptible(wq, send_buff))
+			return -EFAULT;
+		mutex_lock(&nci_mutex);
 	}
 
 	actual_len = min_t(size_t, count, send_buff->len);
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
