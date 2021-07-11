Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3B13C3F28
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:25:06 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id EE47A100EB32F;
	Sun, 11 Jul 2021 13:25:04 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id C82AA100EB32C
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:25:02 -0700 (PDT)
Received: from mail-wr1-f72.google.com ([209.85.221.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2g0b-0001zD-HB
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:25:01 +0000
Received: by mail-wr1-f72.google.com with SMTP id i10-20020a5d55ca0000b029013b976502b6so4730674wrw.2
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fzX3ov5Ta9OPd3PIiOlTSfmYDkmegofa5F9wswYFZcE=;
        b=auTRLLmfp82ZkQFsBHkg0A6kKnRzfUnFicTXO1qIGHtvgbNOFavhqc3jz698wdAwkx
         1YyjRdOnSKpSY0nznpsB6H1TFkUKKU7Q0CdwSflRy2ZDOuBpm2sKSWQ4znKHe3RfoHDy
         6b//LvATsiWWpbknEWtk4+73CSUgnQWR3NYQHp6dGTqg8R8O57KIBc0/ISi0hPO743jE
         HZ38z/jtnrhzxPe1fTsoGFvuZfzJf4gnz8kIPtmVclisNH+FPN2uziD5rMUXip2on8zC
         eED30C+chLxpIyoOjVUkHwTaD/BYUB9pOH+GZuHWiBnB0XDJE04voKafEBr7z/JZrLgA
         myWg==
X-Gm-Message-State: AOAM531kx6l2FGZykSCm8dzzmnu24m9z4ZYqptfQehT5wVndGPmzFNg8
	Qb9W4O/h93MKwR3NItRk+7VaSJrubZq6qNfTB4mnffB6Ai1OEz+ZgTrPO/X6EJ+J4L2Fu5mBvX4
	3tBIpISOD6n84hpgoQF8hoSIuCclw++h6XQ==
X-Received: by 2002:a05:600c:4f81:: with SMTP id n1mr10833893wmq.16.1626035100401;
        Sun, 11 Jul 2021 13:25:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2HfiWQvAy+dQY10LtcwKPo//EV2DJmfJ325ivLR/3rOAJlSKQ2NoTbTqIuXB/dfXW7GS8eQ==
X-Received: by 2002:a05:600c:4f81:: with SMTP id n1mr10833884wmq.16.1626035100246;
        Sun, 11 Jul 2021 13:25:00 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id n12sm12501575wmq.5.2021.07.11.13.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:24:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:23:51 +0200
Message-Id: <20210711202351.18363-22-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: UE2BLO3NTARNHO7R7CEFZYQ25SHX6EDN
X-Message-ID-Hash: UE2BLO3NTARNHO7R7CEFZYQ25SHX6EDN
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 34/34] AUTHORS: Mention Krzysztof Kozlowski's contributions
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/UE2BLO3NTARNHO7R7CEFZYQ25SHX6EDN/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 AUTHORS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/AUTHORS b/AUTHORS
index 7b60db5e1755..ff8b64624207 100644
--- a/AUTHORS
+++ b/AUTHORS
@@ -22,3 +22,4 @@ Mark A. Greer <mgreer@animalcreek.com>
 Arron Wang <arron.wang@intel.com>
 Vincent Cuissard <cuissard@marvell.com>
 Oleg Zhurakivskyy <oleg.zhurakivskyy@intel.com>
+Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> <krzk@kernel.org>
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
