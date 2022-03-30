Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 174044EBBE6
	for <lists+linux-nfc@lfdr.de>; Wed, 30 Mar 2022 09:40:34 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id BD21D100EAB10;
	Wed, 30 Mar 2022 00:40:31 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::641; helo=mail-ej1-x641.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN> 
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 98612100EAB0F
	for <linux-nfc@lists.01.org>; Wed, 30 Mar 2022 00:40:28 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id j15so39691688eje.9
        for <linux-nfc@lists.01.org>; Wed, 30 Mar 2022 00:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+fs03Qe5m2CAu5KA7NU3Z7yweF+5+DwbdVq/GJFIlNE=;
        b=ex8tbjLk+0Wdtww3/CDPCbeeyLzltz0XLQc/kTGGTDckS/aAdfHU1y7YDh2lCuBufg
         Ek3B1nIyDJdNsPVUy2NwJrgskAa32uAMMhpUF+ioSNpcoeiIAHavfW2099ojPSgGgGE7
         3wwUH7K1JfxGG5Oh2XaYKHO6HRUlrl/X+HalWZxsta48unjq55f29E/F+qMNNuJ7eoYl
         2Oh4jvG+kTw2UxKDpcbRT31SQQrknt0Vr6BpK8XQ5ksZ20VzYu2SILthbcfonJ5y9j7y
         zdneLGKv9fMRV6s8puMlExF9mMzmdNqwdQKM0fJr9OyZjPVuBcrKUEmVwqQ3UzS2KKhQ
         gqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+fs03Qe5m2CAu5KA7NU3Z7yweF+5+DwbdVq/GJFIlNE=;
        b=Lehbnu/k+yAYB9dhcLh5oHT4xl1SducEkU5bg7N7lOEC4H82hqp+/rMkusk0S1s0y/
         3iMMxlJyilS3zt1MIk5eLgNfZZbkCrGSyqKYLKgXhPBMm3TPKaJvkgAhSaNlUzq1Zhhd
         qw1g4w3n9aPIvitRD68aXUdiMKnMmbDvjx8XCOFwMRbkhs3NNLoG5fXRP/BDfQzJhJPc
         75KEs34a/WMHs2QaDiebBDurv2LG4gHPUquJCnAsuEXGqWD2e1xumrlWmT98vFQwFhTE
         qX4XnNqX93FCDddmtjmf4VGPI9kONUmF2Eani24PQaneI5z6dcqLf6g3Y5nsxK+Cn0l7
         Edqw==
X-Gm-Message-State: AOAM5326inIZtEWsw01NRENFZOApHFbbvYGsdR0b7uaH5ac50VuEPiQ5
	KvSWjJCRq31WDJMKnO4RBpqX/A==
X-Google-Smtp-Source: ABdhPJyiytUzrzTtKzum6T4/uPQMwS6KDq/FK9+HsYlM+syWEDDFNiRdcVYelGPuda/Y0L8MSc4LVQ==
X-Received: by 2002:a17:907:971c:b0:6e0:dd95:9fc6 with SMTP id jg28-20020a170907971c00b006e0dd959fc6mr2088118ejc.256.1648626026637;
        Wed, 30 Mar 2022 00:40:26 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id s20-20020a056402015400b00418f9574a36sm9536640edu.73.2022.03.30.00.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 00:40:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org
Date: Wed, 30 Mar 2022 09:40:14 +0200
Message-Id: <20220330074016.12896-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Message-ID-Hash: XD7XCX3GM2EYS6XXSPBUGH2KI3U4FRR7
X-Message-ID-Hash: XD7XCX3GM2EYS6XXSPBUGH2KI3U4FRR7
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 0/2] MAINTAINERS/dt-bindings: changes to my emails
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/XD7XCX3GM2EYS6XXSPBUGH2KI3U4FRR7/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Krzysztof Kozlowski <krzk@kernel.org>

Hi,

I can take both patches via my Samsung SoC tree, if that's ok.

Best regards,
Krzysztof

Krzysztof Kozlowski (2):
  dt-bindings: update Krzysztof Kozlowski's email
  MAINTAINERS: update Krzysztof Kozlowski's email to Linaro

 .../clock/samsung,exynos-audss-clock.yaml     |  2 +-
 .../bindings/clock/samsung,exynos-clock.yaml  |  2 +-
 .../clock/samsung,exynos-ext-clock.yaml       |  2 +-
 .../clock/samsung,exynos4412-isp-clock.yaml   |  2 +-
 .../clock/samsung,exynos5260-clock.yaml       |  2 +-
 .../clock/samsung,exynos5410-clock.yaml       |  2 +-
 .../clock/samsung,exynos5433-clock.yaml       |  2 +-
 .../bindings/clock/samsung,exynos7-clock.yaml |  2 +-
 .../clock/samsung,exynos7885-clock.yaml       |  2 +-
 .../clock/samsung,exynos850-clock.yaml        |  2 +-
 .../bindings/clock/samsung,s2mps11.yaml       |  2 +-
 .../clock/samsung,s5pv210-audss-clock.yaml    |  2 +-
 .../bindings/clock/samsung,s5pv210-clock.yaml |  2 +-
 .../devfreq/event/samsung,exynos-nocp.yaml    |  2 +-
 .../devfreq/event/samsung,exynos-ppmu.yaml    |  2 +-
 .../samsung/samsung,exynos-hdmi-ddc.yaml      |  2 +-
 .../display/samsung/samsung,exynos-hdmi.yaml  |  2 +-
 .../display/samsung/samsung,exynos-mixer.yaml |  2 +-
 .../samsung/samsung,exynos5433-decon.yaml     |  2 +-
 .../samsung/samsung,exynos5433-mic.yaml       |  2 +-
 .../samsung/samsung,exynos7-decon.yaml        |  2 +-
 .../display/samsung/samsung,fimd.yaml         |  2 +-
 .../bindings/extcon/maxim,max77843.yaml       |  2 +-
 .../bindings/hwmon/lltc,ltc4151.yaml          |  2 +-
 .../bindings/hwmon/microchip,mcp3021.yaml     |  2 +-
 .../bindings/hwmon/sensirion,sht15.yaml       |  2 +-
 .../devicetree/bindings/hwmon/ti,tmp102.yaml  |  2 +-
 .../devicetree/bindings/hwmon/ti,tmp108.yaml  |  2 +-
 .../devicetree/bindings/i2c/i2c-exynos5.yaml  |  2 +-
 .../bindings/i2c/samsung,s3c2410-i2c.yaml     |  2 +-
 .../samsung,exynos4210-combiner.yaml          |  2 +-
 .../bindings/leds/maxim,max77693.yaml         |  2 +-
 .../memory-controllers/brcm,dpfe-cpu.yaml     |  2 +-
 .../ddr/jedec,lpddr2-timings.yaml             |  2 +-
 .../memory-controllers/ddr/jedec,lpddr2.yaml  |  2 +-
 .../ddr/jedec,lpddr3-timings.yaml             |  2 +-
 .../memory-controllers/ddr/jedec,lpddr3.yaml  |  2 +-
 .../marvell,mvebu-sdram-controller.yaml       |  2 +-
 .../qca,ath79-ddr-controller.yaml             |  2 +-
 .../memory-controllers/renesas,h8300-bsc.yaml |  2 +-
 .../samsung,exynos5422-dmc.yaml               |  2 +-
 .../memory-controllers/synopsys,ddrc-ecc.yaml |  2 +-
 .../memory-controllers/ti,da8xx-ddrctl.yaml   |  2 +-
 .../bindings/mfd/maxim,max14577.yaml          |  2 +-
 .../bindings/mfd/maxim,max77686.yaml          |  2 +-
 .../bindings/mfd/maxim,max77693.yaml          |  2 +-
 .../bindings/mfd/maxim,max77802.yaml          |  2 +-
 .../bindings/mfd/maxim,max77843.yaml          |  2 +-
 .../mfd/samsung,exynos5433-lpass.yaml         |  2 +-
 .../bindings/mfd/samsung,s2mpa01.yaml         |  2 +-
 .../bindings/mfd/samsung,s2mps11.yaml         |  2 +-
 .../bindings/mfd/samsung,s5m8767.yaml         |  2 +-
 .../bindings/net/nfc/marvell,nci.yaml         |  2 +-
 .../devicetree/bindings/net/nfc/nxp,nci.yaml  |  2 +-
 .../bindings/net/nfc/nxp,pn532.yaml           |  2 +-
 .../bindings/net/nfc/nxp,pn544.yaml           |  2 +-
 .../bindings/net/nfc/st,st-nci.yaml           |  2 +-
 .../bindings/net/nfc/st,st21nfca.yaml         |  2 +-
 .../bindings/net/nfc/st,st95hf.yaml           |  2 +-
 .../bindings/net/nfc/ti,trf7970a.yaml         |  2 +-
 .../bindings/phy/samsung,dp-video-phy.yaml    |  2 +-
 .../bindings/phy/samsung,exynos-hdmi-phy.yaml |  2 +-
 .../phy/samsung,exynos5250-sata-phy.yaml      |  2 +-
 .../bindings/phy/samsung,mipi-video-phy.yaml  |  2 +-
 .../bindings/phy/samsung,usb2-phy.yaml        |  2 +-
 .../bindings/phy/samsung,usb3-drd-phy.yaml    |  2 +-
 .../pinctrl/samsung,pinctrl-gpio-bank.yaml    |  2 +-
 .../pinctrl/samsung,pinctrl-pins-cfg.yaml     |  2 +-
 .../samsung,pinctrl-wakeup-interrupt.yaml     |  2 +-
 .../bindings/pinctrl/samsung,pinctrl.yaml     |  2 +-
 .../bindings/power/supply/maxim,max14577.yaml |  2 +-
 .../bindings/power/supply/maxim,max77693.yaml |  2 +-
 .../bindings/regulator/maxim,max14577.yaml    |  2 +-
 .../bindings/regulator/maxim,max77686.yaml    |  2 +-
 .../bindings/regulator/maxim,max77693.yaml    |  2 +-
 .../bindings/regulator/maxim,max77802.yaml    |  2 +-
 .../bindings/regulator/maxim,max77843.yaml    |  2 +-
 .../bindings/regulator/maxim,max8952.yaml     |  2 +-
 .../bindings/regulator/maxim,max8973.yaml     |  2 +-
 .../bindings/regulator/maxim,max8997.yaml     |  2 +-
 .../bindings/regulator/samsung,s2mpa01.yaml   |  2 +-
 .../bindings/regulator/samsung,s2mps11.yaml   |  2 +-
 .../bindings/regulator/samsung,s2mps13.yaml   |  2 +-
 .../bindings/regulator/samsung,s2mps14.yaml   |  2 +-
 .../bindings/regulator/samsung,s2mps15.yaml   |  2 +-
 .../bindings/regulator/samsung,s2mpu02.yaml   |  2 +-
 .../bindings/regulator/samsung,s5m8767.yaml   |  2 +-
 .../bindings/rng/samsung,exynos5250-trng.yaml |  2 +-
 .../bindings/rng/timeriomem_rng.yaml          |  2 +-
 .../bindings/soc/samsung/exynos-usi.yaml      |  2 +-
 .../bindings/sound/samsung,arndale.yaml       |  2 +-
 .../bindings/sound/samsung,smdk5250.yaml      |  2 +-
 .../bindings/sound/samsung,snow.yaml          |  2 +-
 .../bindings/sound/samsung,tm2.yaml           |  2 +-
 .../spi/samsung,spi-peripheral-props.yaml     |  2 +-
 .../devicetree/bindings/spi/samsung,spi.yaml  |  2 +-
 .../thermal/samsung,exynos-thermal.yaml       |  2 +-
 .../bindings/usb/samsung,exynos-dwc3.yaml     |  2 +-
 .../bindings/usb/samsung,exynos-usb2.yaml     |  2 +-
 MAINTAINERS                                   | 36 +++++++++----------
 100 files changed, 117 insertions(+), 117 deletions(-)

-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
