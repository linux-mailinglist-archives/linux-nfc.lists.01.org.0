Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4957D3F7744
	for <lists+linux-nfc@lfdr.de>; Wed, 25 Aug 2021 16:25:53 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 0DD75100EB338;
	Wed, 25 Aug 2021 07:25:50 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 72089100EB334
	for <linux-nfc@lists.01.org>; Wed, 25 Aug 2021 07:25:48 -0700 (PDT)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 546E24077B
	for <linux-nfc@lists.01.org>; Wed, 25 Aug 2021 14:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1629901547;
	bh=VhUvKPsyXjxe2LvjgGEBo9sT2cdcsgoMO30bCzrjHo0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=ATPep6aNb7VkWfVFNIniT2y8f+1s5FJbDyKExRlcYaGJVm+7fMLw8KVpzqcRx88cc
	 PtrV4dqAGVc7dGZvRuHQWtwLRgnEIW5jQ7l03IgwNVwTOUn339mg8OTSfDnPDWB1x0
	 c3SF5RvBstSjzUgc+iDARbLAk/wcuxiYdvRl6vWClHOw9hAIViQuxLjIDuWgiGbtJW
	 9jMd8CVnrMs4lcm0bkTfh9aDZpfeQ6BVEF0Ek0C3xMJeIjywD1WuykLVV6OCJeWrBo
	 hoayMUAmUq3ufSILVvCheYio/jzsDqUoMWHep3W+kJLFelSfv7dnVgadGI6WWP+RrP
	 GbjY5xlJPXtdw==
Received: by mail-wr1-f72.google.com with SMTP id v18-20020adfe2920000b029013bbfb19640so6674516wri.17
        for <linux-nfc@lists.01.org>; Wed, 25 Aug 2021 07:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VhUvKPsyXjxe2LvjgGEBo9sT2cdcsgoMO30bCzrjHo0=;
        b=PN4zjIzbYC4AiNXRGMcRR9NYjH44Dz0sumcCQVKhMNsHzSUArLAUT22lP1w8ptkDYq
         GIuL5yaIQARNI35dHKb4uyFH4YarAUIYTd4/xFTTsFLovFaCTudX6Ty+KmwAoJ5/KlGV
         xYHXZWZaluH62SN8y8+jb3e7/r35jT27SvAppcoRTv+T8JNNWDbjrdf6F57WjQeCoRTc
         MMJiA2xNC/peBZZG5HOuR40BZMw5IBH8CV9ZgfsSX9og14Zv+Zv7CNXVCJIqjh1+9md0
         ABSd8ESnYuR38O7tsLNj1g+NTuo/GL0Jb5NGIj+DrJvEvmc5S+f/9pP4lBPiTocgeXvZ
         ZNUw==
X-Gm-Message-State: AOAM533rrsD6kDD4MnQO/FsrKcO3mD/T5LdDv5hqCXv/bYsDvOZLQrAL
	8tbErZXbigoPMX1ljypt48bYUx61e+qwH8nIVdMeNejZ7fp65TSOQ3yLDFSpE5M+RZqvbG3M9zg
	OcXjv4ADOKbClqjdu5noN6wa2yg0QsWa5BQ==
X-Received: by 2002:a7b:c0cc:: with SMTP id s12mr9748954wmh.180.1629901547076;
        Wed, 25 Aug 2021 07:25:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz2n7ykJoDbqtXZEZVoNFYeGdaA+OyKxpJHn4YsVvaC/ZZAHgNZphY3SDbEL7/FwzxUzHtkA==
X-Received: by 2002:a7b:c0cc:: with SMTP id s12mr9748908wmh.180.1629901546312;
        Wed, 25 Aug 2021 07:25:46 -0700 (PDT)
Received: from localhost.localdomain ([79.98.113.233])
        by smtp.gmail.com with ESMTPSA id i68sm60375wri.26.2021.08.25.07.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 07:25:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed, 25 Aug 2021 16:24:58 +0200
Message-Id: <20210825142459.226168-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825142459.226168-1-krzysztof.kozlowski@canonical.com>
References: <20210825142459.226168-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: EZA7WOKOFGVHNVCMW6NLTNKSXYWI3MN3
X-Message-ID-Hash: EZA7WOKOFGVHNVCMW6NLTNKSXYWI3MN3
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 5/6] nfc: st21nfca: remove unused header includes
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/EZA7WOKOFGVHNVCMW6NLTNKSXYWI3MN3/>
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
 drivers/nfc/st21nfca/core.c | 1 -
 drivers/nfc/st21nfca/i2c.c  | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/nfc/st21nfca/core.c b/drivers/nfc/st21nfca/core.c
index 5e6c99fcfd27..161caf2675cf 100644
--- a/drivers/nfc/st21nfca/core.c
+++ b/drivers/nfc/st21nfca/core.c
@@ -8,7 +8,6 @@
 #include <linux/module.h>
 #include <linux/nfc.h>
 #include <net/nfc/hci.h>
-#include <net/nfc/llc.h>
 
 #include "st21nfca.h"
 
diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index 1b44a37a71aa..279d88128b2e 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -18,8 +18,6 @@
 #include <linux/nfc.h>
 #include <linux/firmware.h>
 
-#include <asm/unaligned.h>
-
 #include <net/nfc/hci.h>
 #include <net/nfc/llc.h>
 #include <net/nfc/nfc.h>
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
