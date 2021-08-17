Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A80FD3EED5C
	for <lists+linux-nfc@lfdr.de>; Tue, 17 Aug 2021 15:28:44 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 59FFE100EBB96;
	Tue, 17 Aug 2021 06:28:43 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 12BD3100EB825
	for <linux-nfc@lists.01.org>; Tue, 17 Aug 2021 06:28:40 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso5129624pjh.5
        for <linux-nfc@lists.01.org>; Tue, 17 Aug 2021 06:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jhNRygkZSnokXeb7qSRMRLwwZtJvbBcUNqtBdqOfilA=;
        b=dv469uMiCBKv8f19tkJvZluYNjYUk2n9vFUAj6y2pWd+gifcKmLdQVCpGqrUqd+9Az
         MUd8yVHC8sLMtImIi6T2C6QD6bl8iqudIo9AF37+azbdwKPRvTtHocfwAEDi6+1/4Qe3
         ElyU8efNwS/D6AEWk78gj8r9CMoGnebgsyTwvl7ySzLAD+z90im2jJkfPCf7SPYMQ+jO
         GmtO9NoJJs3oPwIVqX0x+QTNIFWTVc18bVd0E2emt86tdLCjBeQdBY3ZUkaOSKFnvqyH
         60mvx7s04i4ezrTge1TL5asNWcku7KSaWcVlCANbWX5vsXY+XzQk1lYEr1R+EmjEQnuC
         Shxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jhNRygkZSnokXeb7qSRMRLwwZtJvbBcUNqtBdqOfilA=;
        b=d3BXvu/5DlDPNZheUBp1ljtSEBekr34S9N6ycEk8kMi1YYiPAdNVz9S54s7LPkCzRR
         Mu1Q1r8KDjVY2DFgUtfmE9NG75n3T1k4QhAhEG2CfB4oG2BgYceCTaWfR1O7gyjvnIKk
         bMm3+sNekqezw2erSWqnDByiaK0Dy2VD1bGnqbIZ20zA2h/8jrmnnMVm7FYaBx1nvPzH
         m9M4nGEx+RhguQf2OCsmOoP1D1rSqk74THKj/+GpPRPMm08TqaLctF89UCoz4b1P6F5g
         AKMAF7wvoGyXM3/76WNQ6DAx0gnwK+7PhwqlQKYZEyqgXe2ISSsDSrdQx4X7YAwVpkJL
         jLow==
X-Gm-Message-State: AOAM531aAlffRQd3GNPH6d3787y5GOs8dARRrlY3W4TwQFb/x1BnQVCg
	ttbKXlYjnRpD0ydAPz6hK5g=
X-Google-Smtp-Source: ABdhPJynolp6WuR07au470zbOmTWsxfP30A7i9LThiPgdlDcRR/804ebG1pO2he5RgjfKJPY7G9XXQ==
X-Received: by 2002:a17:902:ec06:b0:12d:8605:731d with SMTP id l6-20020a170902ec0600b0012d8605731dmr2797843pld.78.1629206919768;
        Tue, 17 Aug 2021 06:28:39 -0700 (PDT)
Received: from ubuntu.localdomain ([182.226.226.37])
        by smtp.gmail.com with ESMTPSA id j6sm2791577pfi.220.2021.08.17.06.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 06:28:39 -0700 (PDT)
From: bongsu.jeon2@gmail.com
To: shuah@kernel.org,
	krzysztof.kozlowski@canonical.com
Date: Tue, 17 Aug 2021 06:28:12 -0700
Message-Id: <20210817132818.8275-3-bongsu.jeon2@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817132818.8275-1-bongsu.jeon2@gmail.com>
References: <20210817132818.8275-1-bongsu.jeon2@gmail.com>
MIME-Version: 1.0
Message-ID-Hash: NFEKIBS2AG4Y3M7RDRE4FJY3WD5HWEOO
X-Message-ID-Hash: NFEKIBS2AG4Y3M7RDRE4FJY3WD5HWEOO
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: netdev@vger.kernel.org, linux-nfc@lists.01.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 net-next 2/8] selftests: nci: Remove the polling code to read a NCI frame
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/NFEKIBS2AG4Y3M7RDRE4FJY3WD5HWEOO/>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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
