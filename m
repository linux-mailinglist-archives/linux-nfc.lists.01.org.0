Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BE825EEA5
	for <lists+linux-nfc@lfdr.de>; Sun,  6 Sep 2020 17:38:02 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 1DEA713D1BE59;
	Sun,  6 Sep 2020 08:38:01 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=krzk@kernel.org; receiver=<UNKNOWN> 
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 7D75913D1BE54
	for <linux-nfc@lists.01.org>; Sun,  6 Sep 2020 08:37:59 -0700 (PDT)
Received: from localhost.localdomain (unknown [194.230.155.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id DB5A9214DB;
	Sun,  6 Sep 2020 15:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599406679;
	bh=y7UdK9SwiWPgD8tbpf2MGHg1kLY8LPM78Jur53+Y3P4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ydAGqeozq8pLrEsAwdhHGujNHIzMJS3/51NYxjemPC/OBfv/HS5xdQhiW3qVQFM8i
	 FaPoaUMkievY8OPwP0EdTaVrxuPPCHAihy0NsVcYlMN7YniQoXher3u/Bx2VL4dm7a
	 sSbZcCuQM5Wzr+ZjjPZFaHi7sVP5pIX4gLN28kKg=
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
Date: Sun,  6 Sep 2020 17:36:53 +0200
Message-Id: <20200906153654.2925-9-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200906153654.2925-1-krzk@kernel.org>
References: <20200906153654.2925-1-krzk@kernel.org>
Message-ID-Hash: GGKT3Y7PYLBN3JWXQPCDVSOY6JZ76VBE
X-Message-ID-Hash: GGKT3Y7PYLBN3JWXQPCDVSOY6JZ76VBE
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 8/9] arm64: dts: exynos: Use newer S3FWRN5 GPIO properties in Exynos5433 TM2
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/GGKT3Y7PYLBN3JWXQPCDVSOY6JZ76VBE/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since "s3fwrn5" is not a valid vendor prefix, use new GPIO properties
instead of the deprecated.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 250fc01de78d..24aab3ea3f52 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -795,8 +795,8 @@
 		reg = <0x27>;
 		interrupt-parent = <&gpa1>;
 		interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
-		s3fwrn5,en-gpios = <&gpf1 4 GPIO_ACTIVE_HIGH>;
-		s3fwrn5,fw-gpios = <&gpj0 2 GPIO_ACTIVE_HIGH>;
+		en-gpios = <&gpf1 4 GPIO_ACTIVE_HIGH>;
+		wake-gpios = <&gpj0 2 GPIO_ACTIVE_HIGH>;
 	};
 };
 
-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
