Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C65725EE9B
	for <lists+linux-nfc@lfdr.de>; Sun,  6 Sep 2020 17:37:34 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 86387139EF98E;
	Sun,  6 Sep 2020 08:37:32 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=krzk@kernel.org; receiver=<UNKNOWN> 
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 0ED53139EF98B
	for <linux-nfc@lists.01.org>; Sun,  6 Sep 2020 08:37:30 -0700 (PDT)
Received: from localhost.localdomain (unknown [194.230.155.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 15626207BB;
	Sun,  6 Sep 2020 15:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599406650;
	bh=QMf/wFRc+/7EGE63iw3nhSRMSoeUHkpuvT+2XQ3Psfc=;
	h=From:To:Cc:Subject:Date:From;
	b=mZbl1KhJLMExdZBg7OuFDQ5CtaRBFiyM8L/4cV1jq2L3g2QO/44Cn40ybg46BVAU0
	 ly/h7p7ZUkgQLJJeoJX2lTlhEU9XXVtG/PHKjWUxdFw/67L2tc4Cyaiw1N5deUPOcf
	 mx8PmA2fQxa0k//o0FAXkJaxVM5MKcw8ZAD/DA6Y=
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
Date: Sun,  6 Sep 2020 17:36:45 +0200
Message-Id: <20200906153654.2925-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Message-ID-Hash: DHPMON5TVQ43Z5V7EEE7OQTK2AZITEGQ
X-Message-ID-Hash: DHPMON5TVQ43Z5V7EEE7OQTK2AZITEGQ
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 0/9] nfc: s3fwrn5: Few cleanups
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/DHPMON5TVQ43Z5V7EEE7OQTK2AZITEGQ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Changes since v1:
1. Rename dtschema file and add additionalProperties:false, as Rob
   suggested,
2. Add Marek's tested-by,
3. New patches: #4, #5, #6, #7 and #9.

Best regards,
Krzysztof


Krzysztof Kozlowski (9):
  dt-bindings: net: nfc: s3fwrn5: Convert to dtschema
  dt-bindings: net: nfc: s3fwrn5: Remove wrong vendor prefix from GPIOs
  nfc: s3fwrn5: Remove wrong vendor prefix from GPIOs
  nfc: s3fwrn5: Remove unneeded 'ret' variable
  nfc: s3fwrn5: Add missing CRYPTO_HASH dependency
  nfc: s3fwrn5: Constify s3fwrn5_fw_info when not modified
  MAINTAINERS: Add Krzysztof Kozlowski to Samsung S3FWRN5 and remove
    Robert
  arm64: dts: exynos: Use newer S3FWRN5 GPIO properties in Exynos5433
    TM2
  arm64: defconfig: Enable Samsung S3FWRN5 NFC driver

 CREDITS                                       |  4 +
 .../devicetree/bindings/net/nfc/s3fwrn5.txt   | 25 -------
 .../bindings/net/nfc/samsung,s3fwrn5.yaml     | 73 +++++++++++++++++++
 MAINTAINERS                                   |  5 +-
 .../dts/exynos/exynos5433-tm2-common.dtsi     |  4 +-
 arch/arm64/configs/defconfig                  |  3 +
 drivers/nfc/s3fwrn5/Kconfig                   |  1 +
 drivers/nfc/s3fwrn5/firmware.c                |  4 +-
 drivers/nfc/s3fwrn5/firmware.h                |  2 +-
 drivers/nfc/s3fwrn5/i2c.c                     | 24 +++---
 10 files changed, 104 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/nfc/s3fwrn5.txt
 create mode 100644 Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml

-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
