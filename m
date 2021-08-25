Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C03BA3F7745
	for <lists+linux-nfc@lfdr.de>; Wed, 25 Aug 2021 16:25:54 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 1E0BA100EB33B;
	Wed, 25 Aug 2021 07:25:52 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 6D759100EB325
	for <linux-nfc@lists.01.org>; Wed, 25 Aug 2021 07:25:49 -0700 (PDT)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 44E7740792
	for <linux-nfc@lists.01.org>; Wed, 25 Aug 2021 14:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1629901548;
	bh=75IyrXuKwrcLVvdo4qEJ0WJWV94tMbWLl7mt5kzUBCE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=MENpSEqAJaHaS/qDCpXN34NTkNYO4QeQYYfkjKwm/nFtJ2vjfF7OlG9hWepbxEn7F
	 owMuPNj/ENK2TB/YMfvci4aFKMH2fp9cTORh3EF6Ys75zXO9E8Eh8CJlEHZdg1xH0u
	 kD3hcrVemaKZRHFg4Y924p1SylcCc+WsjfCWNLcYTNOroP5MzPAK5JVknfM1guWWWj
	 PlizWzuykQkSj+KxUd8BS/zKX4lTCO+0V4O4puNJNeirjl6E0L73Rt+AoTdPdOmQrc
	 rKPq2A80Rgx+QDxd4qPT0tuwwdvAPVWeFzVlzDm+bySOD+5xvcIhAZAM9F1v+2uQX9
	 ji/yxcjezuWKQ==
Received: by mail-wr1-f69.google.com with SMTP id z15-20020adff74f000000b001577d70c98dso203825wrp.12
        for <linux-nfc@lists.01.org>; Wed, 25 Aug 2021 07:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=75IyrXuKwrcLVvdo4qEJ0WJWV94tMbWLl7mt5kzUBCE=;
        b=pwGUvrWiZcvpvEOLsss3qZQN13f1VSgBvYHtzD0okXd89iDE1ifiOEsx2yJy9hV2w5
         dB/PkgktEIvuW0ZhUkOb+7JLnHjqH/sqyY/9Z3GVp+A0DdeEvJpTYRcMqatq4CecOE5A
         coq7PS8ikfwLx/CUIQwImWiLAgO70veENep+W8ndrzK5h0cHDeRp7k51GYjaO+kntGgO
         FvTb67didheIJ2n4oEoeVfd41SLNlPPh8FyU1lWdTvVJ/AsmnTMCYJKrIPwY39Te8azy
         qrQedqN/hjVL6bQHDWSgYpJpWebkk4ua+chKrC456OWCsYp6o3wHYAJAmOIxTxVpma2M
         GzCw==
X-Gm-Message-State: AOAM533UT77rUaBE2ZHYZDg1+3E2b51Lcg8tpP+wVp9sgkXgLUnESM2q
	iotBtDQ1JljH8WjLz3qXTV9Id5rhl5LVU83apXjBqjPcW3Aulx04DhnYkgmUSOTaqIKmiqDeaie
	OU745mHQUEzGxww1dNBs2Y5wNR8Ti6RSIuQ==
X-Received: by 2002:adf:e101:: with SMTP id t1mr25641185wrz.215.1629901548032;
        Wed, 25 Aug 2021 07:25:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0xFoz9LuF8pcrbV+A+y5xF/azh985EmDuG0RjLG0TyeZyGUZLIjZGjkNM/EhFi2oiQQqyHQ==
X-Received: by 2002:adf:e101:: with SMTP id t1mr25641170wrz.215.1629901547865;
        Wed, 25 Aug 2021 07:25:47 -0700 (PDT)
Received: from localhost.localdomain ([79.98.113.233])
        by smtp.gmail.com with ESMTPSA id i68sm60375wri.26.2021.08.25.07.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 07:25:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed, 25 Aug 2021 16:24:59 +0200
Message-Id: <20210825142459.226168-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825142459.226168-1-krzysztof.kozlowski@canonical.com>
References: <20210825142459.226168-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: HBZFLLO6H2L7LRDDIYSNZTTNGEVPYJIR
X-Message-ID-Hash: HBZFLLO6H2L7LRDDIYSNZTTNGEVPYJIR
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 6/6] nfc: st95hf: remove unused header includes
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/HBZFLLO6H2L7LRDDIYSNZTTNGEVPYJIR/>
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
 drivers/nfc/st95hf/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
index 993818742570..d16cf3ff644e 100644
--- a/drivers/nfc/st95hf/core.c
+++ b/drivers/nfc/st95hf/core.c
@@ -16,7 +16,6 @@
 #include <linux/nfc.h>
 #include <linux/of_gpio.h>
 #include <linux/of.h>
-#include <linux/of_irq.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/wait.h>
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
