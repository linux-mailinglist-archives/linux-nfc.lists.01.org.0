Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CCE4EBBE7
	for <lists+linux-nfc@lfdr.de>; Wed, 30 Mar 2022 09:40:36 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id EC0AC100EAB1D;
	Wed, 30 Mar 2022 00:40:32 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN> 
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 4D5B4100EAB0F
	for <linux-nfc@lists.01.org>; Wed, 30 Mar 2022 00:40:30 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id z92so23336914ede.13
        for <linux-nfc@lists.01.org>; Wed, 30 Mar 2022 00:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K0TapJUDp+25n96S2Rvm1oOBLQpsFgFgNuoC0qnYJ0k=;
        b=JOXwr8XrMosjbmTi4wZCsHgLWaDheNwC3HmHs+E80tQrcyaRJmRgJCaJOe+242laQd
         itruntcOH4kFLNAY1CbTgyQo2lnhnW4LccmPucGgzkoWOc6DteS2ffVqgyqHb+9GHV5Z
         WW1uSiEnQYKO39V4lwHmwr0XIiWngz2YM3L/2mha2vMoy4Q+MiZli3w733aPOOYuPmje
         8/bAbPqii5DihVOrQa/SDDTWwu3C0Dq2sKVjBOoKNS5NVFG97R5tJwhLfnV8LecwjTD7
         jIxvwCCQuW+42SPB8/Geq8ap0xfLzhr4btnjLm99EDOUuGE0xLEXUuqVFPNkcXZgnqQt
         plPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K0TapJUDp+25n96S2Rvm1oOBLQpsFgFgNuoC0qnYJ0k=;
        b=0x/RQaWshUZ1Jg+UpaRPweDk7w2YVDSCw6OgqtnCzE5kzZ8gFXBhnAXDha0IgbNPXY
         5r4NFflWUBdrA92Zy6TYdXFw+ZZjHEELIj3Zq/2/NPio0J4iaAEgRAacsfuVvDmyV0N6
         u44ypgTrd6LwVWsvcx80CTUA6dYvmEDWhnrXBetXlCqD0Pj/WOPE9c0H2FqozJgJFBvP
         5A1H9VjWHULPoaI8s3MqPc2qz0D/btICoh8bqfV4QLJqR2r6BlDoL9FW547lzP0eA6zS
         jvYDF+Xun2xhSRlQmwzVXN9foLZS0XZLI8lMWd9e+5P2EGlEf0XiEybrop78yaSucIK9
         Sm2A==
X-Gm-Message-State: AOAM532HwbZ/LTvE0SGbVzAJMUjyIssbfIaL6xwTMceUNyMLPdW1/t5j
	IJetP7ZJvTLry7tbv/OXnizh6Q==
X-Google-Smtp-Source: ABdhPJxX2a77lTbmJsmGT6vz+aiaUF7cvGkI4zGY0wGiSBBFUAqLdCq7yx8ylYgRn3CuDhwO8jrWUA==
X-Received: by 2002:a05:6402:4491:b0:419:4aeb:a648 with SMTP id er17-20020a056402449100b004194aeba648mr9149037edb.411.1648626028831;
        Wed, 30 Mar 2022 00:40:28 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id s20-20020a056402015400b00418f9574a36sm9536640edu.73.2022.03.30.00.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 00:40:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org
Date: Wed, 30 Mar 2022 09:40:16 +0200
Message-Id: <20220330074016.12896-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220330074016.12896-1-krzysztof.kozlowski@linaro.org>
References: <20220330074016.12896-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Message-ID-Hash: 3XUZ7WRDHMYW6GOF3P3IBP4FG5KYGYPT
X-Message-ID-Hash: 3XUZ7WRDHMYW6GOF3P3IBP4FG5KYGYPT
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 2/2] MAINTAINERS: update Krzysztof Kozlowski's email to Linaro
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/3XUZ7WRDHMYW6GOF3P3IBP4FG5KYGYPT/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Krzysztof Kozlowski <krzk@kernel.org>

Use Krzysztof Kozlowski's @linaro.org account in maintainer entries.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 MAINTAINERS | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 39930351885a..1508ee5887a4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2634,7 +2634,7 @@ F:	sound/soc/rockchip/
 N:	rockchip
 
 ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
@@ -11888,7 +11888,7 @@ F:	drivers/iio/proximity/mb1232.c
 
 MAXIM MAX17040 FAMILY FUEL GAUGE DRIVERS
 R:	Iskren Chernev <iskren.chernev@gmail.com>
-R:	Krzysztof Kozlowski <krzk@kernel.org>
+R:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 R:	Marek Szyprowski <m.szyprowski@samsung.com>
 R:	Matheus Castello <matheus@castello.eng.br>
 L:	linux-pm@vger.kernel.org
@@ -11898,7 +11898,7 @@ F:	drivers/power/supply/max17040_battery.c
 
 MAXIM MAX17042 FAMILY FUEL GAUGE DRIVERS
 R:	Hans de Goede <hdegoede@redhat.com>
-R:	Krzysztof Kozlowski <krzk@kernel.org>
+R:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 R:	Marek Szyprowski <m.szyprowski@samsung.com>
 R:	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
 R:	Purism Kernel Team <kernel@puri.sm>
@@ -11950,7 +11950,7 @@ F:	Documentation/devicetree/bindings/power/supply/maxim,max77976.yaml
 F:	drivers/power/supply/max77976_charger.c
 
 MAXIM MUIC CHARGER DRIVERS FOR EXYNOS BASED BOARDS
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
 L:	linux-pm@vger.kernel.org
 S:	Supported
@@ -11961,7 +11961,7 @@ F:	drivers/power/supply/max77693_charger.c
 
 MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BOARDS
 M:	Chanwoo Choi <cw00.choi@samsung.com>
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
@@ -12655,7 +12655,7 @@ F:	mm/memblock.c
 F:	tools/testing/memblock/
 
 MEMORY CONTROLLER DRIVERS
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git
@@ -13798,7 +13798,7 @@ F:	include/uapi/linux/nexthop.h
 F:	net/ipv4/nexthop.c
 
 NFC SUBSYSTEM
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 L:	linux-nfc@lists.01.org (subscribers-only)
 L:	netdev@vger.kernel.org
 S:	Maintained
@@ -14112,7 +14112,7 @@ F:	Documentation/devicetree/bindings/regulator/nxp,pf8x00-regulator.yaml
 F:	drivers/regulator/pf8x00-regulator.c
 
 NXP PTN5150A CC LOGIC AND EXTCON DRIVER
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
@@ -14660,7 +14660,7 @@ F:	scripts/dtc/
 
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 M:	Rob Herring <robh+dt@kernel.org>
-M:	Krzysztof Kozlowski <krzk+dt@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
 L:	devicetree@vger.kernel.org
 S:	Maintained
 C:	irc://irc.libera.chat/devicetree
@@ -15572,7 +15572,7 @@ F:	drivers/pinctrl/renesas/
 
 PIN CONTROLLER - SAMSUNG
 M:	Tomasz Figa <tomasz.figa@gmail.com>
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
@@ -17251,7 +17251,7 @@ W:	http://www.ibm.com/developerworks/linux/linux390/
 F:	drivers/s390/scsi/zfcp_*
 
 S3C ADC BATTERY DRIVER
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 L:	linux-samsung-soc@vger.kernel.org
 S:	Odd Fixes
 F:	drivers/power/supply/s3c_adc_battery.c
@@ -17296,7 +17296,7 @@ F:	Documentation/admin-guide/LSM/SafeSetID.rst
 F:	security/safesetid/
 
 SAMSUNG AUDIO (ASoC) DRIVERS
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
@@ -17304,7 +17304,7 @@ F:	Documentation/devicetree/bindings/sound/samsung*
 F:	sound/soc/samsung/
 
 SAMSUNG EXYNOS PSEUDO RANDOM NUMBER GENERATOR (RNG) DRIVER
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 L:	linux-crypto@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
@@ -17339,7 +17339,7 @@ S:	Maintained
 F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
@@ -17365,7 +17365,7 @@ F:	drivers/media/platform/samsung/s3c-camif/
 F:	include/media/drv-intf/s3c_camif.h
 
 SAMSUNG S3FWRN5 NFC DRIVER
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 M:	Krzysztof Opasiak <k.opasiak@samsung.com>
 L:	linux-nfc@lists.01.org (subscribers-only)
 S:	Maintained
@@ -17387,7 +17387,7 @@ S:	Supported
 F:	drivers/media/i2c/s5k5baf.c
 
 SAMSUNG S5P Security SubSystem (SSS) DRIVER
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 M:	Vladimir Zapolskiy <vz@mleia.com>
 L:	linux-crypto@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
@@ -17422,7 +17422,7 @@ F:	include/linux/clk/samsung.h
 F:	include/linux/platform_data/clk-s3c2410.h
 
 SAMSUNG SPI DRIVERS
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 M:	Andi Shyti <andi@etezian.org>
 L:	linux-spi@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
@@ -17440,7 +17440,7 @@ F:	drivers/net/ethernet/samsung/sxgbe/
 
 SAMSUNG THERMAL DRIVER
 M:	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 L:	linux-pm@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
