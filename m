Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B4150863D
	for <lists+linux-nfc@lfdr.de>; Wed, 20 Apr 2022 12:46:10 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 5D501100EA91E;
	Wed, 20 Apr 2022 03:46:08 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN> 
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B887E100EBB94
	for <linux-nfc@lists.01.org>; Wed, 20 Apr 2022 03:46:05 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id g20so1729018edw.6
        for <linux-nfc@lists.01.org>; Wed, 20 Apr 2022 03:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5OVcjGSiJ+nlq65WcsbONfbpSCZlHZow1k2gE+HwcCo=;
        b=pldrgPUIn2R72Z4tJz+rlp+UluL86LT0jyZUo9kf++27hTM0pzPgHXY+I0M40I9NY+
         eXHUPwO7vQ/zVAdxzXO9RKovW5dOXy0S5vgPrJugzugD/sq0a2wj43vGseINag5cVdUp
         buPuCcPXISqc1w3yzNrwnzmOwhtZ0oLxlWmhbyJfxD8UXXjuKPksUTMSoVw5W80s0IQg
         bVQSOTj2RWia9S9xt0eVOxCzR9YWNhIAy7RyNMVAdlrNb1+wXoVQFsKqBO+PyXd6PNNq
         Eyk0d+inH3oMBNt0rtRAWn9mTvYqYFsYPUvCQfVRZVk4jEt03BzBm1WDPSE9X25GU3F7
         y5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5OVcjGSiJ+nlq65WcsbONfbpSCZlHZow1k2gE+HwcCo=;
        b=fTnyVtizL6AETB8LlC/+4c0n807imIz18qZUbvdJ/sRGT7OaCqQ1JibALD8eNb9tw8
         imjWP9HctAyoyumtoYhCCYohVGeUydKbqJixWn1RDqqglZZai7fuKdfAE/oj4BgfJT6o
         5fCpqnaUt+UIyDT54mNJXnWvhXd6NS4enYqv/2bQwSgykeqWpfkji2rkV+D5ciVLeaZ+
         defdYHbc/PMKCcwfVnl/qCQHIh80PV6yv1RqUdfIk1NWA0exhrzKMxj0Mv6N7/X+fVrX
         vyhx2eRNxBRzvJ3is95W2v/OYhAI8wuVimIcfess345PFeQgI2H1HvgGAhyyxCb/Q73Z
         E1xg==
X-Gm-Message-State: AOAM532L2ObpyOYYccEqJATMOURVbeMEqx9YpSA7+6BbLb4fyDJJRnQu
	582wa0EOavxWZQEsnTQ1ORqFiQ==
X-Google-Smtp-Source: ABdhPJw/4gOK7xeclDA9097uwkEU8w5LJ7LCVdGl20UroQC9SxTNcI8HyNfFl0xGksOd2Y3YCOPhbQ==
X-Received: by 2002:aa7:d059:0:b0:41d:76b4:bcc1 with SMTP id n25-20020aa7d059000000b0041d76b4bcc1mr22299244edo.389.1650451563871;
        Wed, 20 Apr 2022 03:46:03 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id mv12-20020a170907838c00b006e87c0247f4sm6529912ejc.186.2022.04.20.03.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 03:46:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed, 20 Apr 2022 12:46:01 +0200
Message-Id: <20220420104601.106540-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Message-ID-Hash: I2YVRUOLNJDDNGFGVR2F27E63YCRVROT
X-Message-ID-Hash: I2YVRUOLNJDDNGFGVR2F27E63YCRVROT
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH] nfc: MAINTAINERS: add Bug entry
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/I2YVRUOLNJDDNGFGVR2F27E63YCRVROT/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a Bug section, indicating preferred mailing method for bug reports,
to NFC Subsystem entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2d746723306a..1786cbdd43a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13842,6 +13842,7 @@ M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 L:	linux-nfc@lists.01.org (subscribers-only)
 L:	netdev@vger.kernel.org
 S:	Maintained
+B:	mailto:linux-nfc@lists.01.org
 F:	Documentation/devicetree/bindings/net/nfc/
 F:	drivers/nfc/
 F:	include/linux/platform_data/nfcmrvl.h
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
