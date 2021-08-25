Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 066F03F7740
	for <lists+linux-nfc@lfdr.de>; Wed, 25 Aug 2021 16:25:49 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id CC149100EB32A;
	Wed, 25 Aug 2021 07:25:46 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 301F2100EBBC0
	for <linux-nfc@lists.01.org>; Wed, 25 Aug 2021 07:25:45 -0700 (PDT)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 58029407A0
	for <linux-nfc@lists.01.org>; Wed, 25 Aug 2021 14:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1629901543;
	bh=xADZ5MR3j2UoJgl2B5VMNlWhMMlwmkQewYypsYcTAYw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=TLejc506X+y5tBxBhOGMInvJZjganvJAIVesk9T8Em65Rq3yrBVWJ76uHoak+mc1Q
	 Z+UwNB7Vlag/hrRqADVfKbTSoow4S6rpfc0f9fkLoVbrk02OaQ8bX23oBgsfkNQM1H
	 6TNN9PvWp/PJi1OBDxOogW5k64Q58thVFmjW9W0zOZh9eVH/Mav//XICBzJLUIVgle
	 0crA4/1a93gKn+VTi1rh6C+fQfnukUNwiSSnM8VQYw7mNqE1OojkNHVl0sRQhF0P0u
	 N8bwGHRba4ir9FNUB1FktrC8sIBcp07jm15otkYUKrB82CfpraPXS+M4gkoAxE6qnV
	 27p6pTTsPFCdw==
Received: by mail-wr1-f72.google.com with SMTP id a9-20020a0560000509b029015485b95d0cso6721621wrf.5
        for <linux-nfc@lists.01.org>; Wed, 25 Aug 2021 07:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xADZ5MR3j2UoJgl2B5VMNlWhMMlwmkQewYypsYcTAYw=;
        b=r20It82DWM2ffTggJ1vPSgSQvJVxRH02lBI8/Z//YccysmYXQcjtSPaO26ibXQvqMX
         /Obvz0ugOXGl9N6+Hlj4qtp7dHmT/eIYu3b5dLBHdKf90Hpn8udNjd2VSVJietACMEGG
         KAnVoKbg4LjYner4EvnyNfcKBsNRQngogBmXlOkyfJEX4g/JVeIv3myjLzf/a63PP/bm
         89Jena2zHm5xERAYmDWzpvETWmkjrr8tR1nv2Y+jRGhm31kaE63KeN2bbtR3pWlsesCz
         +Bt6e1o6qV9P8gFb01oty0XoX4dGaWjz5gIQCPSJyhoz4xyte9uKfG+BO5KO11dXy4XG
         O/pw==
X-Gm-Message-State: AOAM530UZb+8mU5/4esCqdKV2+tWgDKkYURzAN9fcIyekvHEiveXK57C
	0I275dwJVuEakNBraWoOoPOOYWOJzbqfxsxnzM1r4yjDGi/LAXzZIwSywogWL9MxIMwGHsNEMpe
	bX0zSsq3zhlkA6mAtNWWBhJKsMsFL/u8vCg==
X-Received: by 2002:adf:ea09:: with SMTP id q9mr25607294wrm.64.1629901542942;
        Wed, 25 Aug 2021 07:25:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxug4tswqoivqT7ijzKJIPir03HLyMSYUse/bfkgOkUwy2/0691p92fR8CeB10092meUcEfnw==
X-Received: by 2002:adf:ea09:: with SMTP id q9mr25607278wrm.64.1629901542827;
        Wed, 25 Aug 2021 07:25:42 -0700 (PDT)
Received: from localhost.localdomain ([79.98.113.233])
        by smtp.gmail.com with ESMTPSA id i68sm60375wri.26.2021.08.25.07.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 07:25:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed, 25 Aug 2021 16:24:55 +0200
Message-Id: <20210825142459.226168-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825142459.226168-1-krzysztof.kozlowski@canonical.com>
References: <20210825142459.226168-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: LOKFCP576X7NJ6IMIDKZ33VNT635U5ID
X-Message-ID-Hash: LOKFCP576X7NJ6IMIDKZ33VNT635U5ID
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 2/6] nfc: mrvl: remove unused header includes
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/LOKFCP576X7NJ6IMIDKZ33VNT635U5ID/>
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
 drivers/nfc/nfcmrvl/i2c.c | 3 ---
 drivers/nfc/nfcmrvl/spi.c | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/i2c.c b/drivers/nfc/nfcmrvl/i2c.c
index c38b228006fd..ceef81d93ac9 100644
--- a/drivers/nfc/nfcmrvl/i2c.c
+++ b/drivers/nfc/nfcmrvl/i2c.c
@@ -8,12 +8,9 @@
 #include <linux/module.h>
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
-#include <linux/pm_runtime.h>
 #include <linux/nfc.h>
-#include <linux/gpio.h>
 #include <linux/delay.h>
 #include <linux/of_irq.h>
-#include <linux/of_gpio.h>
 #include <net/nfc/nci.h>
 #include <net/nfc/nci_core.h>
 #include "nfcmrvl.h"
diff --git a/drivers/nfc/nfcmrvl/spi.c b/drivers/nfc/nfcmrvl/spi.c
index b182ab2e03c0..5b833a9a83f8 100644
--- a/drivers/nfc/nfcmrvl/spi.c
+++ b/drivers/nfc/nfcmrvl/spi.c
@@ -7,11 +7,8 @@
 
 #include <linux/module.h>
 #include <linux/interrupt.h>
-#include <linux/pm_runtime.h>
 #include <linux/nfc.h>
-#include <linux/gpio.h>
 #include <linux/of_irq.h>
-#include <linux/of_gpio.h>
 #include <net/nfc/nci.h>
 #include <net/nfc/nci_core.h>
 #include <linux/spi/spi.h>
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
