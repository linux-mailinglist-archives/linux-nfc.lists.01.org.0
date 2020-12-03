Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CAA2CE221
	for <lists+linux-nfc@lfdr.de>; Thu,  3 Dec 2020 23:53:11 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 1D73A100EC1DE;
	Thu,  3 Dec 2020 14:53:10 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 81228100EC1DD
	for <linux-nfc@lists.01.org>; Thu,  3 Dec 2020 14:53:08 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id w16so2313475pga.9
        for <linux-nfc@lists.01.org>; Thu, 03 Dec 2020 14:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=oIe++tU4EfyyFjCAKxrRYoNaW31kt/FbR7e6ygRmz6M=;
        b=F/B89NUmX31NRfpfXzveJauQrM6R2uGHZdVvsWTndOjPvzhv7M/WfLe9pNqfz4DxeM
         JNCZUy7EarFo3a2uy0BYVIaIZxoOk/z+wfF8jEyTav7LsgwowyacXd00J0UrMt4rkOjX
         wYKQ9qBei9dXSZKVIjIafnID77vSLmA4OQ4k24nAF0c6TMqgOCCqQPZnpLAZImEqcx+t
         AmuW/7ggQljS60bYaEfU/HEBL7kq/j+ENX02EiM7mSJbwnd5UioNqiIrf1LwOrIKOEfe
         OZfB1YWXNyy67hdV7quOTQNrj5bX1l3I4UGhB2SzZTNWqbigeYiKabezqtJzxHSdy5OV
         GglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=oIe++tU4EfyyFjCAKxrRYoNaW31kt/FbR7e6ygRmz6M=;
        b=tHuFJY01pLGaej/GJz+1LEXwoX+Sn+9Xnp6AG3iEKf1k1gjKmwXK2z1vLu5ZNh1aCZ
         HneTDfvWSwnhr7jJxMUSiIOjNFAECgYH2i2asyyNN0u3c8fZ7UaN/8+EtUTvvGn2fj1d
         3BGzZyos7oLF9uwtnggjg+oOC/tXy9/V54VOYtaZrszBQjyP5aiy834RsRq6gNjhugnn
         Vx5ygPegmOG43Jv/rL46zgTSeOL+mfdVcCisJ1pwSgDf0V7J9WS8ecvpMr5giSsmn0WG
         9YOSo2pruKrEZodhacKl9UhhyRnLrQ5QHJqu1fb83q9yNJ3EgRr07lYUhF2u8mhsut+E
         TkjQ==
X-Gm-Message-State: AOAM531UOiya+wmjLKmKjz+3dcGiZ4zZ4kzvaD2g0iWdt0gx0hz/AroB
	acGWVp8dmR1Rf6nmjm+sSJQ=
X-Google-Smtp-Source: ABdhPJxkGeX9HWhvAG6TJAJJ375yO43bKeia/oXO5VAoa3lovUZV/GtDGabtDHcB6Gk3DmTIyIQBgA==
X-Received: by 2002:a63:db18:: with SMTP id e24mr4958276pgg.155.1607035988012;
        Thu, 03 Dec 2020 14:53:08 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id y21sm3078232pfr.90.2020.12.03.14.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 14:53:07 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: krzk@kernel.org
Date: Fri,  4 Dec 2020 07:52:57 +0900
Message-Id: <20201203225257.2446-1-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 2.17.1
Message-ID-Hash: AZ3GDYLOJKI3OP7F3U2VF7VPFYS7RU5Q
X-Message-ID-Hash: AZ3GDYLOJKI3OP7F3U2VF7VPFYS7RU5Q
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 net-next] nfc: s3fwrn5: skip the NFC bootloader mode
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/AZ3GDYLOJKI3OP7F3U2VF7VPFYS7RU5Q/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

If there isn't a proper NFC firmware image, Bootloader mode will be
skipped.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---

 ChangeLog:
  v2:
   - change the commit message.
   - change the skip handling code.

 drivers/nfc/s3fwrn5/core.c     | 23 +++++++++++++++++++++--
 drivers/nfc/s3fwrn5/firmware.c | 11 +----------
 drivers/nfc/s3fwrn5/firmware.h |  1 +
 3 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/core.c b/drivers/nfc/s3fwrn5/core.c
index f8e5d78d9078..c00b7a07c3ee 100644
--- a/drivers/nfc/s3fwrn5/core.c
+++ b/drivers/nfc/s3fwrn5/core.c
@@ -20,13 +20,26 @@
 				NFC_PROTO_ISO14443_B_MASK | \
 				NFC_PROTO_ISO15693_MASK)
 
+static int s3fwrn5_firmware_init(struct s3fwrn5_info *info)
+{
+	struct s3fwrn5_fw_info *fw_info = &info->fw_info;
+	int ret;
+
+	s3fwrn5_fw_init(fw_info, "sec_s3fwrn5_firmware.bin");
+
+	/* Get firmware data */
+	ret = s3fwrn5_fw_request_firmware(fw_info);
+	if (ret < 0)
+		dev_err(&fw_info->ndev->nfc_dev->dev,
+			"Failed to get fw file, ret=%02x\n", ret);
+	return ret;
+}
+
 static int s3fwrn5_firmware_update(struct s3fwrn5_info *info)
 {
 	bool need_update;
 	int ret;
 
-	s3fwrn5_fw_init(&info->fw_info, "sec_s3fwrn5_firmware.bin");
-
 	/* Update firmware */
 
 	s3fwrn5_set_wake(info, false);
@@ -109,6 +122,12 @@ static int s3fwrn5_nci_post_setup(struct nci_dev *ndev)
 	struct s3fwrn5_info *info = nci_get_drvdata(ndev);
 	int ret;
 
+	if (s3fwrn5_firmware_init(info)) {
+		//skip bootloader mode
+		ret = 0;
+		goto out;
+	}
+
 	ret = s3fwrn5_firmware_update(info);
 	if (ret < 0)
 		goto out;
diff --git a/drivers/nfc/s3fwrn5/firmware.c b/drivers/nfc/s3fwrn5/firmware.c
index 4cde6dd5c019..4b5352e2b915 100644
--- a/drivers/nfc/s3fwrn5/firmware.c
+++ b/drivers/nfc/s3fwrn5/firmware.c
@@ -280,7 +280,7 @@ static int s3fwrn5_fw_complete_update_mode(struct s3fwrn5_fw_info *fw_info)
 
 #define S3FWRN5_FW_IMAGE_HEADER_SIZE 44
 
-static int s3fwrn5_fw_request_firmware(struct s3fwrn5_fw_info *fw_info)
+int s3fwrn5_fw_request_firmware(struct s3fwrn5_fw_info *fw_info)
 {
 	struct s3fwrn5_fw_image *fw = &fw_info->fw;
 	u32 sig_off;
@@ -358,15 +358,6 @@ int s3fwrn5_fw_setup(struct s3fwrn5_fw_info *fw_info)
 	struct s3fwrn5_fw_cmd_get_bootinfo_rsp bootinfo;
 	int ret;
 
-	/* Get firmware data */
-
-	ret = s3fwrn5_fw_request_firmware(fw_info);
-	if (ret < 0) {
-		dev_err(&fw_info->ndev->nfc_dev->dev,
-			"Failed to get fw file, ret=%02x\n", ret);
-		return ret;
-	}
-
 	/* Get bootloader info */
 
 	ret = s3fwrn5_fw_get_bootinfo(fw_info, &bootinfo);
diff --git a/drivers/nfc/s3fwrn5/firmware.h b/drivers/nfc/s3fwrn5/firmware.h
index 3c83e6730d30..3a82ce5837fb 100644
--- a/drivers/nfc/s3fwrn5/firmware.h
+++ b/drivers/nfc/s3fwrn5/firmware.h
@@ -89,6 +89,7 @@ struct s3fwrn5_fw_info {
 	char parity;
 };
 
+int s3fwrn5_fw_request_firmware(struct s3fwrn5_fw_info *fw_info);
 void s3fwrn5_fw_init(struct s3fwrn5_fw_info *fw_info, const char *fw_name);
 int s3fwrn5_fw_setup(struct s3fwrn5_fw_info *fw_info);
 bool s3fwrn5_fw_check_version(const struct s3fwrn5_fw_info *fw_info, u32 version);
-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
