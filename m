Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB05A2DA842
	for <lists+linux-nfc@lfdr.de>; Tue, 15 Dec 2020 07:54:37 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id B4804100EBBA1;
	Mon, 14 Dec 2020 22:54:36 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::1042; helo=mail-pj1-x1042.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id E840C100EBBA0
	for <linux-nfc@lists.01.org>; Mon, 14 Dec 2020 22:54:34 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id n3so1594902pjm.1
        for <linux-nfc@lists.01.org>; Mon, 14 Dec 2020 22:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nIjZP5Lkybwz2c4aGlTZv0F588/auhsxru313pjOx5w=;
        b=KfjKWAEaC8+Nbkc22nUV0yrTvm9YpXoVUvMnHKcPuaBIY3UsVKMmTUw88yc+L9M8c4
         qbGMToASI5aZ0368VTsqwXqJgDOJrzBsbEuqw26ZpXKBevmsnkH3btXUG3GaLOrW9N+a
         /jHPiWwXmu3SMAf8BYJsfbtrcwEkB0WkwAYXHvErpcjH9PiDjTcz4tq/+wLsYcPlbtjC
         YWQzlP1pph8wYeecPGt+075F7rDPJwz7RokKlMIUyHzwduCZTZENXgwinIUVpBY6N+2T
         ljPJhnFfDGXVT64sWbECaKCDTODWPHj85ML9J3XytDWX5iaRO9b5vvEKU1UJSZIsaXtW
         iy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nIjZP5Lkybwz2c4aGlTZv0F588/auhsxru313pjOx5w=;
        b=nlhoPAmroRjxcAgPlZh32KLcfLafB2Gppm2e0TKdHe9sAnF2wWqOYlkq0hFdyIJFdA
         KjzhBeLbAD3glkV6wwJE0sY8pHOsjBHDdc3uBsXF6Grr7LFl45QLxb+GMbiAGqHYZZcE
         T/ger4bwni1kZ6YSUoeYwmdUVlJMD0B3wJpRxulLizxU9WvkzVd3gFIbSb2mbI1gfcEk
         Tz4x3vjDgYxe5/KFDZ6TH478BTJbaDexPscHe+zepnwaSUBylQr2HRvkRtGIPHGEkug6
         c3Aricz2NYnyIWWrz/O54FSH4Bq5Xt9cvEx1dHTuAvQbIfJMXNEaGh5CVrq8kin7wAD5
         kt6A==
X-Gm-Message-State: AOAM531ZuVTcekjPEvs7LW6rZFO9EZK4U3WAl6BYF2hqzgCtOkvqJ/ED
	dZ1gxItV2sYneZJSPbnWiXs=
X-Google-Smtp-Source: ABdhPJySuEAvZQpZgPTFQJ79CJff9QOdfof/7bZnikPspsKE3ZyoWZv6zT3Tj3k2p9g1CYqkh0gdGA==
X-Received: by 2002:a17:90b:697:: with SMTP id m23mr28565098pjz.35.1608015274584;
        Mon, 14 Dec 2020 22:54:34 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id na6sm19124134pjb.12.2020.12.14.22.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 22:54:33 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: krzk@kernel.org
Date: Tue, 15 Dec 2020 15:54:00 +0900
Message-Id: <20201215065401.3220-2-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201215065401.3220-1-bongsu.jeon@samsung.com>
References: <20201215065401.3220-1-bongsu.jeon@samsung.com>
Message-ID-Hash: PITLOJJT4YKEQITGLVHRLGXRRDY3FCZS
X-Message-ID-Hash: PITLOJJT4YKEQITGLVHRLGXRRDY3FCZS
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 net-next 1/2] nfc: s3fwrn5: Remove the delay for NFC sleep
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/PITLOJJT4YKEQITGLVHRLGXRRDY3FCZS/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

Remove the delay for NFC sleep because the delay is only needed to
guarantee that the NFC is awake.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/s3fwrn5/phy_common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/s3fwrn5/phy_common.c b/drivers/nfc/s3fwrn5/phy_common.c
index 497b02b30ae7..81318478d5fd 100644
--- a/drivers/nfc/s3fwrn5/phy_common.c
+++ b/drivers/nfc/s3fwrn5/phy_common.c
@@ -20,7 +20,8 @@ void s3fwrn5_phy_set_wake(void *phy_id, bool wake)
 
 	mutex_lock(&phy->mutex);
 	gpio_set_value(phy->gpio_fw_wake, wake);
-	msleep(S3FWRN5_EN_WAIT_TIME);
+	if (wake)
+		msleep(S3FWRN5_EN_WAIT_TIME);
 	mutex_unlock(&phy->mutex);
 }
 EXPORT_SYMBOL(s3fwrn5_phy_set_wake);
-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
