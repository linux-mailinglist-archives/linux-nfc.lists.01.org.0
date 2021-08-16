Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1CC3ECD6E
	for <lists+linux-nfc@lfdr.de>; Mon, 16 Aug 2021 06:06:26 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 56F08100EBB92;
	Sun, 15 Aug 2021 21:06:25 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id D4EA1100EBB8F
	for <linux-nfc@lists.01.org>; Sun, 15 Aug 2021 21:06:23 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id gz13-20020a17090b0ecdb0290178c0e0ce8bso17945960pjb.1
        for <linux-nfc@lists.01.org>; Sun, 15 Aug 2021 21:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4HKnHAiUNAzYRRDKiTL1R3sjGoApYCxJD2ihqVsIpwc=;
        b=cnlbiCfSwSvYVDsM9gSWFd5Edae4dqWRb8Mkww+8FQfkpSZUp7n7liD0gI+NkyJ98K
         pZ74Lr74ZEPN0EHeabD36RHeCRlpZuKW0U8Ynif6Hm/yjK8EHFGtFoKYK5r5D2VsVN3b
         hvyx6KUS6wWmlj86aWdOIPrkdxhAiL80ZpNKAWmejTqFyJw9etzstHgq+40LeYxaxN3G
         iCDARxuQK//QNj/rG2Hyi0YbyGeUuAY7dwCcsRCcgsuPeMEUxk1EBuY3otwzrdg5Tjvo
         QH9eMppjklUqL0b1Ngv3PuNGpUY6EGwFCza6muuDeVeqfx/V7tQ5ZVcxQ7quh3rO/nI4
         zamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4HKnHAiUNAzYRRDKiTL1R3sjGoApYCxJD2ihqVsIpwc=;
        b=jwqOoGLqyhZXQyAaPn7Q2BxnTPDivgzKPiHwzhqzlpagmZ48AqAlh8Nr925cMqu2Sh
         wAd2ZYsYl7R+Hs+pMKdloz3dhgWiLVeRbH9l0sTCXYeoKTIfJNNJMSyohJgSBSkzsp69
         mO8bnemOEN8x5G5z1ge2hCtQcfuctkDTif2ed8sJd1i8hEaEkfqvsklCghNdOGXLJgoc
         px1UiiSWT4iDXXtddRB1HPARHS3Ezkh9N2jEM/Vir57WxNmhQdQhJlb/7f32f4HXhYgF
         RJl3jpfB5Pzcb2D+bKv3cfIy+puR7BSyYf9rhZXGLWOPtXSLmYMnN8DYO01IrdbPb9TU
         lu3w==
X-Gm-Message-State: AOAM532Xr49NqnmgyQNkSEktyqj+HtqUc+EXwacczoxCzvI0TgtFqAWG
	xYCTSXJeV//5us8WBewTx4g=
X-Google-Smtp-Source: ABdhPJyz+/bpAfb/VTMTroBn7Rd8D8yVzz6W3NSNjnzqfouTMsyozc5eAcvRG+0S+VT6OWpxcNlAGw==
X-Received: by 2002:a65:620a:: with SMTP id d10mr13996935pgv.120.1629086783287;
        Sun, 15 Aug 2021 21:06:23 -0700 (PDT)
Received: from ubuntu.localdomain ([182.226.226.37])
        by smtp.gmail.com with ESMTPSA id i6sm9436998pfa.44.2021.08.15.21.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 21:06:22 -0700 (PDT)
From: bongsu.jeon2@gmail.com
To: shuah@kernel.org,
	krzysztof.kozlowski@canonical.com
Date: Sun, 15 Aug 2021 21:05:59 -0700
Message-Id: <20210816040600.175813-3-bongsu.jeon2@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816040600.175813-1-bongsu.jeon2@gmail.com>
References: <20210816040600.175813-1-bongsu.jeon2@gmail.com>
MIME-Version: 1.0
Message-ID-Hash: XKXTOK7RCBZTNQK4JHGNZSYH4WP6MKSX
X-Message-ID-Hash: XKXTOK7RCBZTNQK4JHGNZSYH4WP6MKSX
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: netdev@vger.kernel.org, linux-nfc@lists.01.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH net-next 2/3] selftests: Remove the polling code to read a NCI frame
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/XKXTOK7RCBZTNQK4JHGNZSYH4WP6MKSX/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

Because the virtual NCI device uses Wait Queue, the virtual device
application doesn't need to poll the NCI frame.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 tools/testing/selftests/nci/nci_dev.c | 33 +++++++++------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/tools/testing/selftests/nci/nci_dev.c b/tools/testing/selftests/nci/nci_dev.c
index 57b505cb1561..34e76c7fa1fe 100644
--- a/tools/testing/selftests/nci/nci_dev.c
+++ b/tools/testing/selftests/nci/nci_dev.c
@@ -270,8 +270,7 @@ static void *virtual_dev_open(void *data)
 
 	dev_fd = *(int *)data;
 
-	while ((len = read(dev_fd, buf, 258)) == 0)
-		;
+	len = read(dev_fd, buf, 258);
 	if (len <= 0)
 		goto error;
 	if (len != sizeof(nci_reset_cmd))
@@ -280,8 +279,7 @@ static void *virtual_dev_open(void *data)
 		goto error;
 	write(dev_fd, nci_reset_rsp, sizeof(nci_reset_rsp));
 
-	while ((len = read(dev_fd, buf, 258)) == 0)
-		;
+	len = read(dev_fd, buf, 258);
 	if (len <= 0)
 		goto error;
 	if (len != sizeof(nci_init_cmd))
@@ -290,8 +288,7 @@ static void *virtual_dev_open(void *data)
 		goto error;
 	write(dev_fd, nci_init_rsp, sizeof(nci_init_rsp));
 
-	while ((len = read(dev_fd, buf, 258)) == 0)
-		;
+	len = read(dev_fd, buf, 258);
 	if (len <= 0)
 		goto error;
 	if (len != sizeof(nci_rf_disc_map_cmd))
@@ -313,8 +310,7 @@ static void *virtual_dev_open_v2(void *data)
 
 	dev_fd = *(int *)data;
 
-	while ((len = read(dev_fd, buf, 258)) == 0)
-		;
+	len = read(dev_fd, buf, 258);
 	if (len <= 0)
 		goto error;
 	if (len != sizeof(nci_reset_cmd))
@@ -324,8 +320,7 @@ static void *virtual_dev_open_v2(void *data)
 	write(dev_fd, nci_reset_rsp_v2, sizeof(nci_reset_rsp_v2));
 	write(dev_fd, nci_reset_ntf, sizeof(nci_reset_ntf));
 
-	while ((len = read(dev_fd, buf, 258)) == 0)
-		;
+	len = read(dev_fd, buf, 258);
 	if (len <= 0)
 		goto error;
 	if (len != sizeof(nci_init_cmd_v2))
@@ -334,8 +329,7 @@ static void *virtual_dev_open_v2(void *data)
 		goto error;
 	write(dev_fd, nci_init_rsp_v2, sizeof(nci_init_rsp_v2));
 
-	while ((len = read(dev_fd, buf, 258)) == 0)
-		;
+	len = read(dev_fd, buf, 258);
 	if (len <= 0)
 		goto error;
 	if (len != sizeof(nci_rf_disc_map_cmd))
@@ -402,8 +396,7 @@ static void *virtual_deinit(void *data)
 
 	dev_fd = *(int *)data;
 
-	while ((len = read(dev_fd, buf, 258)) == 0)
-		;
+	len = read(dev_fd, buf, 258);
 	if (len <= 0)
 		goto error;
 	if (len != sizeof(nci_reset_cmd))
@@ -425,8 +418,7 @@ static void *virtual_deinit_v2(void *data)
 
 	dev_fd = *(int *)data;
 
-	while ((len = read(dev_fd, buf, 258)) == 0)
-		;
+	len = read(dev_fd, buf, 258);
 	if (len <= 0)
 		goto error;
 	if (len != sizeof(nci_reset_cmd))
@@ -489,16 +481,14 @@ static void *virtual_poll_start(void *data)
 
 	dev_fd = *(int *)data;
 
-	while ((len = read(dev_fd, buf, 258)) == 0)
-		;
+	len = read(dev_fd, buf, 258);
 	if (len <= 0)
 		goto error;
 	if (len != sizeof(nci_rf_discovery_cmd))
 		goto error;
 	if (memcmp(nci_rf_discovery_cmd, buf, len))
 		goto error;
-	write(dev_fd, nci_rf_disc_rsp, sizeof(nci_rf_disc_rsp))
-		;
+	write(dev_fd, nci_rf_disc_rsp, sizeof(nci_rf_disc_rsp));
 
 	return (void *)0;
 error:
@@ -513,8 +503,7 @@ static void *virtual_poll_stop(void *data)
 
 	dev_fd = *(int *)data;
 
-	while ((len = read(dev_fd, buf, 258)) == 0)
-		;
+	len = read(dev_fd, buf, 258);
 	if (len <= 0)
 		goto error;
 	if (len != sizeof(nci_rf_deact_cmd))
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
