Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFCB25EEA2
	for <lists+linux-nfc@lfdr.de>; Sun,  6 Sep 2020 17:37:51 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E36C613D17F3D;
	Sun,  6 Sep 2020 08:37:49 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=krzk@kernel.org; receiver=<UNKNOWN> 
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 5747413D1BE4E
	for <linux-nfc@lists.01.org>; Sun,  6 Sep 2020 08:37:48 -0700 (PDT)
Received: from localhost.localdomain (unknown [194.230.155.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 180932087C;
	Sun,  6 Sep 2020 15:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599406668;
	bh=q4PfSN/iGfvSKBF5OqA0xnoo0M75rGDiILB3JNyi3Sc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mefOvFPvkOhJ1KcRy7p46kGHjsedLZGjp2Kt5upg97ASLzTfnGSC8WlkySSNo6pPQ
	 5lebo9u6KrD611LAzv67xR9keoBcwnHUikfjbPOTp0OLAHtocpuxFEVs5MgiNjc2tO
	 X2sH7WwyFAdR9hI3lzU91hR0RQkL2kf7W6eSb6UA=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Opasiak <k.opasiak@samsung.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-nfc@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Date: Sun,  6 Sep 2020 17:36:50 +0200
Message-Id: <20200906153654.2925-6-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200906153654.2925-1-krzk@kernel.org>
References: <20200906153654.2925-1-krzk@kernel.org>
Message-ID-Hash: SZU4YQJNPSNVJXY6LL6NPXRLPMRGBADT
X-Message-ID-Hash: SZU4YQJNPSNVJXY6LL6NPXRLPMRGBADT
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 5/9] nfc: s3fwrn5: Add missing CRYPTO_HASH dependency
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/SZU4YQJNPSNVJXY6LL6NPXRLPMRGBADT/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The driver uses crypto hash functions so it needs to select CRYPTO_HASH.
This fixes build errors:

  arc-linux-ld: drivers/nfc/s3fwrn5/firmware.o: in function `s3fwrn5_fw_download':
  firmware.c:(.text+0x152): undefined reference to `crypto_alloc_shash'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/nfc/s3fwrn5/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nfc/s3fwrn5/Kconfig b/drivers/nfc/s3fwrn5/Kconfig
index af9d18690afe..3f8b6da58280 100644
--- a/drivers/nfc/s3fwrn5/Kconfig
+++ b/drivers/nfc/s3fwrn5/Kconfig
@@ -2,6 +2,7 @@
 config NFC_S3FWRN5
 	tristate
 	select CRYPTO
+	select CRYPTO_HASH
 	help
 	  Core driver for Samsung S3FWRN5 NFC chip. Contains core utilities
 	  of chip. It's intended to be used by PHYs to avoid duplicating lots
-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
