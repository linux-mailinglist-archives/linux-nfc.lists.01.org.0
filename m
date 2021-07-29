Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4943DA13E
	for <lists+linux-nfc@lfdr.de>; Thu, 29 Jul 2021 12:40:48 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 70BCC100EBB81;
	Thu, 29 Jul 2021 03:40:43 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id A8331100EBB72
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:40:41 -0700 (PDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 6D6EB3F23B
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 10:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627555240;
	bh=So1uUDkE721+BEqMeRM8NOIaRYftuFanUkfPQdOA99A=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=LcJpcVqO1Q45p0JH/FCarrOA08lTJgjKg292V28U+vo0Q2qtcKOp7vlPkir0Q1i+9
	 nA7p+otPGN/Oj0ezZu4FX4f5ng0XL6965w8zeWbBgBTy0FoXzVcRxDIzbuItauD6Hq
	 +rOtqB/ubTS3m+I/qN4eOFl9Gsu9ZmtztEB0CBfbpRX2AdSjfnRSCbPviI5yIU+OIh
	 5qZpxLTr2Q7PWLf7gR5CeUzqyuAVBSp9WNs2p72F6T8+yiQ+qDlz+7VDJFPa00llQJ
	 Ud90JWJ+RH2KgXIv6zTOEX0DYaZgtjG4Ai+FWG83pEmfTm9UTXmU3odH3c1xlvIMzT
	 KFK7OpfiI3P/w==
Received: by mail-ed1-f72.google.com with SMTP id b13-20020a056402278db029039c013d5b80so2751097ede.7
        for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=So1uUDkE721+BEqMeRM8NOIaRYftuFanUkfPQdOA99A=;
        b=AT+1LH1seqGxveZ5ZizTZUZSml2VH+FAjtwSEYj4d2pdKoBYS5S30AzF5X7naaknFA
         MIfwBwQzdaaDLWw7STHDWpMcw0DIVYuTo3cDb0l8YOaisDuOTdF3ZDJ/PC5h1Fa3cQLU
         OtusHr+UUXUqEFTmkV7z98FyupvPpISDj8qKeDlAZzy8JcppKp/PjP444dSNamNWsutG
         kltX/+++l1Jwi4NbXr0Sk2hw9WjUrISzPWn/9Yb8yrnEAqb1jtvFZldJek4M3UrlLbYe
         /YbawiMOke8LU1zzb8pb0GvfxhiUK+oNX41XV7Fy2JPxlMvcoICMAlHFgVA78lH22ve8
         CYKg==
X-Gm-Message-State: AOAM530NDlIO3ApOdaUeSsCI7VdP8ODSHgcgfoLp10iIHsLbking4Eza
	LgbcOUtXuXpEkbdbC0V/hCAc79HYu3eJqNwUkv0antZijshTnLXqC+ppmMUdS3fI83dO2iYOWrT
	XnVuZwKElW/VgGPWBxbIgald05hcWuQGMBQ==
X-Received: by 2002:a05:6402:cb9:: with SMTP id cn25mr4576424edb.271.1627555240182;
        Thu, 29 Jul 2021 03:40:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwg8gQFeBPTWOxeoK6KYjuQRUdToXFwmH6p9ZgcYdRRS/mw4BXtIUndBzQfGalBkLacI2jz9A==
X-Received: by 2002:a05:6402:cb9:: with SMTP id cn25mr4576407edb.271.1627555240070;
        Thu, 29 Jul 2021 03:40:40 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id c14sm824475ejb.78.2021.07.29.03.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 03:40:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Bongsu Jeon <bongsu.jeon@samsung.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Date: Thu, 29 Jul 2021 12:40:15 +0200
Message-Id: <20210729104022.47761-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
References: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 526HFJLMRT4WG6BD4FDN4FX7D77GPOJ3
X-Message-ID-Hash: 526HFJLMRT4WG6BD4FDN4FX7D77GPOJ3
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 05/12] nfc: virtual_ncidev: constify pointer to nfc_dev
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/526HFJLMRT4WG6BD4FDN4FX7D77GPOJ3/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

virtual_ncidev_ioctl() does not modify struct nfc_dev, so local variable
can be a pointer to const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/virtual_ncidev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/virtual_ncidev.c b/drivers/nfc/virtual_ncidev.c
index b914ab2c2109..2ee0ec4bb739 100644
--- a/drivers/nfc/virtual_ncidev.c
+++ b/drivers/nfc/virtual_ncidev.c
@@ -170,7 +170,7 @@ static int virtual_ncidev_close(struct inode *inode, struct file *file)
 static long virtual_ncidev_ioctl(struct file *flip, unsigned int cmd,
 				 unsigned long arg)
 {
-	struct nfc_dev *nfc_dev = ndev->nfc_dev;
+	const struct nfc_dev *nfc_dev = ndev->nfc_dev;
 	void __user *p = (void __user *)arg;
 
 	if (cmd != IOCTL_GET_NCIDEV_IDX)
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
