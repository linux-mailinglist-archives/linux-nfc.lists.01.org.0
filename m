Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B972D8C93
	for <lists+linux-nfc@lfdr.de>; Sun, 13 Dec 2020 10:59:11 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id D8AE4100EF252;
	Sun, 13 Dec 2020 01:59:09 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 305DE100EF250
	for <linux-nfc@lists.01.org>; Sun, 13 Dec 2020 01:59:07 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id c79so10129776pfc.2
        for <linux-nfc@lists.01.org>; Sun, 13 Dec 2020 01:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=GcYqAxa7HBVYr8n7CS85HqGq6N68fJds4hOplQbYKsg=;
        b=Vjwbz522pakplgONpLFHWgfZJ59AIzMmlDXrek+QZE2K98kDQhZJ8z7RTr2JX8/CK7
         fT4tUtVu6QJnK6dbgZ7ObF2g9H8NJWaYl9RN3DcfnkeYlawKKW/rPTe0WVOAh6DNyDPu
         ylOb0FowlyYviFan12yM2LVYVzZWn5t+d0CYRqoQ0AaKe8KWtom+TxDV+eufaOFhYzsR
         BlPLU8Hr8VAIMaE+mcEQheCA3dbb/Jv/P9QL8maQAs2x1DQpFi5VBM+e834LTAjiCEYM
         MHR5Uk7EoDPCuSwJKxTkAPGSTdfotKpoe05b0AwYjqEfGNzWNlF9NrFdc//xWayFBD7K
         oM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=GcYqAxa7HBVYr8n7CS85HqGq6N68fJds4hOplQbYKsg=;
        b=edukbjbAbS0aURPgkWIBrtbu8s2Tkd+U2bUWy/axC2qjuy+3K3dsnuZXF2iyNeZ5I4
         C0NiEZ/XdugyuR16ZA9ZsBZimf5E7rllaI6zZD2j4zlxDe6E90Tf743ckyryaGVI4XGP
         1UG51D1eAwTBNGcK4Wcb2Cvq6I1iqeBd94QQgoks1VUWzn1Ra3ZBcRNfGKetz2kA5y+E
         c/DPhan8os8sxXc27055rpDYwsTst2so1ScNQZ173VBfa6NHA45oKmeAsSQuhC+wTDo0
         Ovzd7Eybi5MU1JaE/PYHInsqAUIVHJZSI1KCWYYJUOnPdIXFgc0sqzEiKf+Mjy28NhqM
         h3Sw==
X-Gm-Message-State: AOAM5333JErbax9fewyXFsInvcg0r22eMeXcnAOuNdAOtXTdcn1uzeOX
	BWCXGcrsbNJjVuMKZdWMXAw=
X-Google-Smtp-Source: ABdhPJwE2chr88YKB9xmTS0NpoFNPDDbiETaYCL/vy1IZd/FodrArloKAP4/O04GMCErdBIgDvjECQ==
X-Received: by 2002:a63:6f4c:: with SMTP id k73mr19049038pgc.319.1607853546046;
        Sun, 13 Dec 2020 01:59:06 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id w73sm15805958pfd.203.2020.12.13.01.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 01:59:04 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: krzk@kernel.org
Date: Sun, 13 Dec 2020 18:58:50 +0900
Message-Id: <20201213095850.28169-1-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 2.17.1
Message-ID-Hash: QAG3H5IKI2ALB2LHYKCJ27KBELI7RSZ4
X-Message-ID-Hash: QAG3H5IKI2ALB2LHYKCJ27KBELI7RSZ4
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH net-next] nfc: s3fwrn5: Release the nfc firmware
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/QAG3H5IKI2ALB2LHYKCJ27KBELI7RSZ4/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

add the code to release the nfc firmware when the firmware image size is
wrong.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/s3fwrn5/firmware.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/s3fwrn5/firmware.c b/drivers/nfc/s3fwrn5/firmware.c
index 4b5352e2b915..b70737b3070e 100644
--- a/drivers/nfc/s3fwrn5/firmware.c
+++ b/drivers/nfc/s3fwrn5/firmware.c
@@ -293,8 +293,10 @@ int s3fwrn5_fw_request_firmware(struct s3fwrn5_fw_info *fw_info)
 	if (ret < 0)
 		return ret;
 
-	if (fw->fw->size < S3FWRN5_FW_IMAGE_HEADER_SIZE)
+	if (fw->fw->size < S3FWRN5_FW_IMAGE_HEADER_SIZE) {
+		release_firmware(fw->fw);
 		return -EINVAL;
+	}
 
 	memcpy(fw->date, fw->fw->data + 0x00, 12);
 	fw->date[12] = '\0';
-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
