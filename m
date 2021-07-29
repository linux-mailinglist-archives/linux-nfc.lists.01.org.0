Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E4B3DA141
	for <lists+linux-nfc@lfdr.de>; Thu, 29 Jul 2021 12:40:49 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 88FA1100EBB97;
	Thu, 29 Jul 2021 03:40:46 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 21FB9100EB825
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:40:44 -0700 (PDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id BAF583F113
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 10:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627555242;
	bh=KXmULC4yNLbjXfZilnwZUymI+qeRnrLMQ/vMczDuSm8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=YigS+8QfeZ9cIu40lqUKLt714vfWNx0XN68/ZNwZHyXW6+mXRoRsRjJIYZJubXgCG
	 f0e1Ydt0P3HwUr8Fxj53zNmxgww9onUIY6VDUi5plo5tA2Rxq8WKDR7/QXjsjXxQeF
	 DDAk38FYvBrbFwdVBdfY138E9QFtLb9aOOAXCy/+io48aKs5e+lQcPwe5cyi+gfcLX
	 /8q7tEhRYfy643SeQ5PTL24b11mVeT9cQrzmuxIR86Zj6yuaOPfzbSTZmn74JexdPs
	 7rbv7PiD1YskV2VwevqvwKYhVqFLMgYiGeXTUsg8gdtrD1/eqGAtJxDVGpF+byWEUT
	 CU1mRDRzhJHfQ==
Received: by mail-ed1-f72.google.com with SMTP id de5-20020a0564023085b02903bb92fd182eso2765327edb.8
        for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KXmULC4yNLbjXfZilnwZUymI+qeRnrLMQ/vMczDuSm8=;
        b=GIWgaWiepjYuiBldhjI0mJMIqAlToeFvPgPsmjvaxorRC9gq9vbPr31VR3ORc15Ib8
         Uo6T2EO21RAF+UM2+5EfDmowUAVKMKmQJMj71GiKirwxBWPzg6cE5lk6JqTVD056x7os
         yw52sbQie9p8m0oNjXPUGKVAIAMV0Qs2AHApbpGm0yniU1cijIBXx9AoUO1f734QJByn
         l6a24K9bMFcfdz49HhA8i2BtJwrptbx5116yZG7cj+1pObssqWL/v6Ba7Q0UJeKOH5NK
         LHCci1pf9fwptgDmKTf4L2lcDQq2iSAK0sqC1zXR0seqSyuLKksJF0zYEZW1nQfMGm82
         x3SA==
X-Gm-Message-State: AOAM531rgGfsucFkxURHKvsYf1glSrJy25fuK2OHhhY3UW2yENB9vVAQ
	TtB7MIZJC8RcqcRPsQxFAaNadXM0f88yHyQFZ4QAYPJcdiNRuXYlP+aGuRvbJTNtB/iWxyYBBma
	G1weAsehvMfD7BX8PWCDjhKX6SHbVG5kP5A==
X-Received: by 2002:a05:6402:1cb6:: with SMTP id cz22mr5180757edb.148.1627555242547;
        Thu, 29 Jul 2021 03:40:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjW5Qyti3uGsJQhjyg9e0Vg9hnF5ajD1dE9uX/LfyH7AIvIxTCmpWZpCLut6Hz/YpkiUBGxg==
X-Received: by 2002:a05:6402:1cb6:: with SMTP id cz22mr5180746edb.148.1627555242430;
        Thu, 29 Jul 2021 03:40:42 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id c14sm824475ejb.78.2021.07.29.03.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 03:40:42 -0700 (PDT)
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
Date: Thu, 29 Jul 2021 12:40:17 +0200
Message-Id: <20210729104022.47761-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
References: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: HQY364JYFJRQ7GXJBJO5OEPIX4373TJT
X-Message-ID-Hash: HQY364JYFJRQ7GXJBJO5OEPIX4373TJT
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 07/12] nfc: fdp: drop unneeded cast for printing firmware size in dev_dbg()
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/HQY364JYFJRQ7GXJBJO5OEPIX4373TJT/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Size of firmware is a type of size_t, so print it directly instead of
casting to int.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/fdp/fdp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/nfc/fdp/fdp.c b/drivers/nfc/fdp/fdp.c
index 3e542b7389cb..650a140bea46 100644
--- a/drivers/nfc/fdp/fdp.c
+++ b/drivers/nfc/fdp/fdp.c
@@ -276,8 +276,8 @@ static int fdp_nci_request_firmware(struct nci_dev *ndev)
 		(data[FDP_FW_HEADER_SIZE + 2] << 16) |
 		(data[FDP_FW_HEADER_SIZE + 3] << 24);
 
-	dev_dbg(dev, "RAM patch version: %d, size: %d\n",
-		  info->ram_patch_version, (int) info->ram_patch->size);
+	dev_dbg(dev, "RAM patch version: %d, size: %zu\n",
+		  info->ram_patch_version, info->ram_patch->size);
 
 
 	r = request_firmware(&info->otp_patch, FDP_OTP_PATCH_NAME, dev);
@@ -293,8 +293,8 @@ static int fdp_nci_request_firmware(struct nci_dev *ndev)
 		(data[FDP_FW_HEADER_SIZE+2] << 16) |
 		(data[FDP_FW_HEADER_SIZE+3] << 24);
 
-	dev_dbg(dev, "OTP patch version: %d, size: %d\n",
-		 info->otp_patch_version, (int) info->otp_patch->size);
+	dev_dbg(dev, "OTP patch version: %d, size: %zu\n",
+		 info->otp_patch_version, info->otp_patch->size);
 	return 0;
 }
 
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
