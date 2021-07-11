Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D66183C3F03
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:21:41 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 87765100EB85C;
	Sun, 11 Jul 2021 13:21:38 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 31632100EB32D
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:21:36 -0700 (PDT)
Received: from mail-wr1-f72.google.com ([209.85.221.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2fxG-0001ba-Ud
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:21:34 +0000
Received: by mail-wr1-f72.google.com with SMTP id r11-20020a5d52cb0000b02901309f5e7298so6169097wrv.0
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:21:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nfyq3LOG8AnZyA1tQ5qB53a0iQKs/UZB1+T7/u6+yxM=;
        b=pJp3itmBRF9PZgH+I9kO1EirCxJtRkuZ2pHMIFgDz1iXO99rOqarv85xxn7HU9GXSm
         037GN44RCjY4smE38TqXpaCDS5P0xNO/rondEf6aLQuziExPPXWGrKsoyyd/EtTDR6eJ
         /XLQn/23v0HOjZ+bFqfqcI/EQRAtgb3hPd7pQNepgEq0Pxiwvni3zXbuiwW7ubyDeiBN
         JKw2efnCwGKSXqJ3ibXdc9QQYy7uFP31JFYz80LHnf6QhbP39nqNFI/xRdm68N0D/LpU
         9T/repKdgAEqDSdjJ1o5L3gTuc1cXUAx/2OThDN0gwJ8RfHvIqNGJEUPls6PgihNUhKA
         +4zg==
X-Gm-Message-State: AOAM532ejZunnV6Yef3AuS0w6Zg1qPPv7Y4mEMMmyEU/5VbBuO+8bccR
	I2rsBJge4iQCRuf88F6Ha56PXTaNKZx5c3ybllAKpxeJdqD2EhWCa4cJjSVZIcpcGBzjfv431zB
	F+SlA0ollOAp6ZzrFz8cU5lUFh3JgnX5iHQ==
X-Received: by 2002:adf:eec5:: with SMTP id a5mr29505319wrp.317.1626034894445;
        Sun, 11 Jul 2021 13:21:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdeMKDFiitKUsEZsPHPWhmw0WilcJJbXhOu0v8dCVe252cBy+cCedvJ0ASqADjUxqTTJjeAQ==
X-Received: by 2002:adf:eec5:: with SMTP id a5mr29505313wrp.317.1626034894343;
        Sun, 11 Jul 2021 13:21:34 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id d14sm1503256wrs.49.2021.07.11.13.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:21:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:20:37 +0200
Message-Id: <20210711202102.18094-10-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 6RYNIUTIEK5JUDCMBV5BHCHIAIMHUZPN
X-Message-ID-Hash: 6RYNIUTIEK5JUDCMBV5BHCHIAIMHUZPN
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 09/34] nciattach: fix poll.h include location
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/6RYNIUTIEK5JUDCMBV5BHCHIAIMHUZPN/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

poll.h header should not be included from include/sys.  This works fine
on Glibc but fails on musl:

    In file included from tools/nciattach.c:42:
    /usr/include/sys/poll.h:1:2: error: #warning redirecting incorrect #include <sys/poll.h> to <poll.h> [-Werror=cpp]
        1 | #warning redirecting incorrect #include <sys/poll.h> to <poll.h>

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 tools/nciattach.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/nciattach.c b/tools/nciattach.c
index 370f98bb176c..574c0fbe784a 100644
--- a/tools/nciattach.c
+++ b/tools/nciattach.c
@@ -32,6 +32,7 @@
 #include <errno.h>
 #include <fcntl.h>
 #include <unistd.h>
+#include <poll.h>
 #include <stdlib.h>
 #include <string.h>
 #include <signal.h>
@@ -39,7 +40,6 @@
 #include <termios.h>
 #include <time.h>
 #include <sys/time.h>
-#include <sys/poll.h>
 #include <sys/param.h>
 #include <sys/ioctl.h>
 #include <termios.h>
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
