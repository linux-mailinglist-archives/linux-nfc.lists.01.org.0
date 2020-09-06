Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5422B25EEA6
	for <lists+linux-nfc@lfdr.de>; Sun,  6 Sep 2020 17:38:06 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 3185D13D1BE57;
	Sun,  6 Sep 2020 08:38:05 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=krzk@kernel.org; receiver=<UNKNOWN> 
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B2D3813D1BE54
	for <linux-nfc@lists.01.org>; Sun,  6 Sep 2020 08:38:03 -0700 (PDT)
Received: from localhost.localdomain (unknown [194.230.155.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id EC6932145D;
	Sun,  6 Sep 2020 15:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599406683;
	bh=riEwVeVBIORWfwWar/cs3TjEW/xzLOlUM/PuZjLHNds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cp2jKXbMKdKR9Ttiv9ZPUR9LeIjOpqALidfU69eMvTRXTPOe3l1KKWIKYnIQgKFdp
	 BVL+6DbBuhmuVJ687CTnLoJqLzIbh6r8hXYmV5ffV3v5QOskKctwcZkJv+C7rJ19G7
	 DUYcftK3GJysPy0Cg494DFmscESZwsZUDOHNfYcI=
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
Date: Sun,  6 Sep 2020 17:36:54 +0200
Message-Id: <20200906153654.2925-10-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200906153654.2925-1-krzk@kernel.org>
References: <20200906153654.2925-1-krzk@kernel.org>
Message-ID-Hash: R6WJ4ZZTS5TJG5ICVX6EQSKF6FML74KJ
X-Message-ID-Hash: R6WJ4ZZTS5TJG5ICVX6EQSKF6FML74KJ
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 9/9] arm64: defconfig: Enable Samsung S3FWRN5 NFC driver
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/R6WJ4ZZTS5TJG5ICVX6EQSKF6FML74KJ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Enable the Samsung S3FWRN5 NFC driver present in Exynos5433-based
TM2/TM2E boards.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a03cefd58799..b78a14d43f3f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -199,6 +199,9 @@ CONFIG_MAC80211_LEDS=y
 CONFIG_RFKILL=m
 CONFIG_NET_9P=y
 CONFIG_NET_9P_VIRTIO=y
+CONFIG_NFC=m
+CONFIG_NFC_NCI=m
+CONFIG_NFC_S3FWRN5_I2C=m
 CONFIG_PCI=y
 CONFIG_PCIEPORTBUS=y
 CONFIG_PCI_IOV=y
-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
