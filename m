Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F8137C07D
	for <lists+linux-nfc@lfdr.de>; Wed, 12 May 2021 16:43:42 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 907B7100EBB6B;
	Wed, 12 May 2021 07:43:40 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 18B02100EBB6A
	for <linux-nfc@lists.01.org>; Wed, 12 May 2021 07:43:37 -0700 (PDT)
Received: from mail-vs1-f71.google.com ([209.85.217.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lgq5I-00057k-C8
	for linux-nfc@lists.01.org; Wed, 12 May 2021 14:43:36 +0000
Received: by mail-vs1-f71.google.com with SMTP id r2-20020a67c3020000b029022a851392d7so6661000vsj.7
        for <linux-nfc@lists.01.org>; Wed, 12 May 2021 07:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aHEFEHQf81OxnlkSXxvYbUIWj0W6Yj6Lp4ml2UG7+00=;
        b=QGvLre8g8m1XAi1MTD4a1+PvjaLQzFf+RVhPDsi8nU05Ex9szjncvD7lHUdzhXxIBe
         Yb3vxq+QO3GGYJgGE3GGmhkdr9aGU5RI0VE2ERU9Drw+ugRFBdQQmgVXEGavItrHCYAI
         vs7mYYSSAScHC4Q3LChdR2q678pgQOKomIsZTlDHE+ZlXrc/k0z6HjILDcwIsDroQ8b2
         cwvrm8Rn14T7g87So9NoekijID5AlRQhvC1CD3+8dqRsWJBdkxVbIXAIyipKRb9ahpSW
         InG717lDdxQ+Awu52stBrQirnIXeW3qXC0TOy0Z9j4uWRF5WMWa1aZit7truQXQ9EZX6
         bPAQ==
X-Gm-Message-State: AOAM530KeAnzZAfgLwffO9rMWiMLqEDaggxgx3Hc1SenJ2YOcybVDy4e
	NmofJID4lwJ2V9Voo0Qb5VyuhbUIKAC9d8+LqRHdNGC2tHKPN0IpvU7I3nrxyRHKS1+iX8NfV7A
	FlZd0/FFQZ6ZutGFOrkuLzgpyGEll57HxJQ==
X-Received: by 2002:ab0:278e:: with SMTP id t14mr29084973uap.25.1620830615489;
        Wed, 12 May 2021 07:43:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw02cwj0oM9HIUpM6IquUx2L8g6c9yDPzMDV6dCDUYq+xnie/xTTLmMlBr0NRCMxpHHUjFIXA==
X-Received: by 2002:ab0:278e:: with SMTP id t14mr29084941uap.25.1620830615269;
        Wed, 12 May 2021 07:43:35 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id a5sm1641vkl.19.2021.05.12.07.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:43:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed, 12 May 2021 10:43:18 -0400
Message-Id: <20210512144319.30852-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Message-ID-Hash: EXMUR6JIQZB3KYDPRSGADO4M3WR2MVIG
X-Message-ID-Hash: EXMUR6JIQZB3KYDPRSGADO4M3WR2MVIG
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 1/2] MAINTAINERS: nfc: add Krzysztof Kozlowski as maintainer
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/EXMUR6JIQZB3KYDPRSGADO4M3WR2MVIG/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The NFC subsystem is orphaned.  I am happy to spend some cycles to
review the patches, send pull requests and in general keep the NFC
subsystem running.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

I admit I don't have big experience in NFC part but this will be nice
opportunity to learn something new.  I am already maintainer of few
other parts: memory controller drivers, Samsung ARM/ARM64 SoC and some
drviers.  I have a kernel.org account and my GPG key is:
https://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git/tree/keys/1B93437D3B41629B.asc

Best regards,
Krzysztof
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc81667e8bab..adc6cbe29f78 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12899,8 +12899,9 @@ F:	include/uapi/linux/nexthop.h
 F:	net/ipv4/nexthop.c
 
 NFC SUBSYSTEM
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
 L:	netdev@vger.kernel.org
-S:	Orphan
+S:	Maintained
 F:	Documentation/devicetree/bindings/net/nfc/
 F:	drivers/nfc/
 F:	include/linux/platform_data/nfcmrvl.h
-- 
2.25.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
