Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD59A3F7743
	for <lists+linux-nfc@lfdr.de>; Wed, 25 Aug 2021 16:25:51 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 026E3100EB32F;
	Wed, 25 Aug 2021 07:25:50 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 34A46100EB334
	for <linux-nfc@lists.01.org>; Wed, 25 Aug 2021 07:25:48 -0700 (PDT)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D9399407A1
	for <linux-nfc@lists.01.org>; Wed, 25 Aug 2021 14:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1629901545;
	bh=lRHNkLEWcITIq9BTwsdkr00e4mkdm7zBYjY+jga9Eao=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=OoISX0ERoKQZ7B1Q+Yp4HmqxIkrmYGKP/+xgI7lW3MduEHC1geDz24nFpD0axcFOc
	 +4krb4SCtdRmDrvduCukA1l34ye53LYZWPOrggvvcImvbD+g8TJ6mZNDE0aF/5rHfx
	 RUn12jBcMRPxRDqruGDFPWpHR1t5uFkLCi3kjnJsWowImJE7d8mCSG0AQYeWV9HS7j
	 ufmTsuIMJSjxz0xMoO+IooL6Iv6HeeYRY0kXRBI/gdadQnbqpyEZgwwqfn9Wi0C7DM
	 qSefXQXWXLC/Xsu+7P5aK+Df1akLQHSj8XwTvuFueStlzUSRMHKvl6LHz5gt64UYl3
	 rHYhChndqMDzg==
Received: by mail-wm1-f70.google.com with SMTP id y188-20020a1c7dc5000000b002e80e0b2f87so2923511wmc.1
        for <linux-nfc@lists.01.org>; Wed, 25 Aug 2021 07:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lRHNkLEWcITIq9BTwsdkr00e4mkdm7zBYjY+jga9Eao=;
        b=rqpjdaHWRH8D/1VCYPFBwhiobqWp7Xmz6hYU1/HgH8FVEpTnaoobrBJorDdngvi/Yc
         WXW5axk9p7/sZ6mynLg7DMHwlCEUmTp5ZJuAt1stbbjPIlg53KWkm7zCr1dmvR9Lu+qC
         yDdcIFTPupP9SOYsLcbL/bJcfQDaQwjzchKfXU4j0nIeFUh38MC1oHNM3kAPXhoGf5in
         yR1NYzl1vOIxxhaneg7cHDZR+ebgj2KEmIaJuZ0Ep409vkUtVfn4zaQGtVNbgUJF6ZPR
         1D6AuYBAU8vFfwUphK3S/rA2Evt9pxsXoJMKKtHbocJQS2GBG357JFMdDKcsV5SzvgmJ
         3esg==
X-Gm-Message-State: AOAM531ILzTv2tUzCrdXhmsLkEyB/K3/hfoXHNBgLrS8mj6x4DAjdmS+
	0Y/T970PFi1FmhasBwhpnS5rczxUTeIie9u7TTATMoRyPjHWa/YdWy+BcuM9TO9yLNdNyupIBsi
	vox9KinHfCUvaenfDu+x4m6vtlvSUZEh9+Q==
X-Received: by 2002:adf:c506:: with SMTP id q6mr2585025wrf.78.1629901545222;
        Wed, 25 Aug 2021 07:25:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9h6tV76fJDoGPVoO6pO3iRtwkAZF73BAzecjKNib/5DLYsyj/NjVU59vWpxchWluq9DoRhQ==
X-Received: by 2002:adf:c506:: with SMTP id q6mr2585022wrf.78.1629901545111;
        Wed, 25 Aug 2021 07:25:45 -0700 (PDT)
Received: from localhost.localdomain ([79.98.113.233])
        by smtp.gmail.com with ESMTPSA id i68sm60375wri.26.2021.08.25.07.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 07:25:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed, 25 Aug 2021 16:24:57 +0200
Message-Id: <20210825142459.226168-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825142459.226168-1-krzysztof.kozlowski@canonical.com>
References: <20210825142459.226168-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: OI554A2D6KQ3RPHEE7LNJRIT247EFSQF
X-Message-ID-Hash: OI554A2D6KQ3RPHEE7LNJRIT247EFSQF
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 4/6] nfc: st-nci: remove unused header includes
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/OI554A2D6KQ3RPHEE7LNJRIT247EFSQF/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Do not include unnecessary headers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/st-nci/core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/nfc/st-nci/core.c b/drivers/nfc/st-nci/core.c
index 72bb51efdf9c..a367136d4330 100644
--- a/drivers/nfc/st-nci/core.c
+++ b/drivers/nfc/st-nci/core.c
@@ -9,8 +9,6 @@
 #include <linux/nfc.h>
 #include <net/nfc/nci.h>
 #include <net/nfc/nci_core.h>
-#include <linux/gpio.h>
-#include <linux/delay.h>
 
 #include "st-nci.h"
 
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
