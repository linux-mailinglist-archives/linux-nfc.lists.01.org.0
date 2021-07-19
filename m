Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA683CD314
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:07 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id B39FB100EB328;
	Mon, 19 Jul 2021 04:09:05 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 0C649100EB859
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:03 -0700 (PDT)
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 0CAA640207
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692942;
	bh=Nfyq3LOG8AnZyA1tQ5qB53a0iQKs/UZB1+T7/u6+yxM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=D9xrciS1Z+xK6f34LbLj5tmnvJYkeDXFBAZiTKAU4R1xlu6khm3gDWYyOae9AaoxL
	 vlaetVgj1N/OHYuv35g2xWa5J8w7Y1baCAi3oKdU0EwjeTUztRv/6WANyiSq+pX7X+
	 aHenhQnwvi12B9rwRcn3lh1Z6q9qiTlw3iRsYzycZWH2cxr2CdxtFX32JGE4OJ7KND
	 1NYMNNGLcJBSqm0HGpzqBms/HNMzHVlKiTg+RVdqNcwPtQs4SyPS/U8rtYYqtTiyvA
	 cbg8I36n1hj5ctmedAZ1tEPUloKQjFtTq8Xvn7Qsuj5EKWKhU7L0sIw+dXgFeuR03c
	 bbKy9HmDz07gQ==
Received: by mail-lj1-f197.google.com with SMTP id z18-20020a2e96520000b0290178006de192so9320481ljh.3
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nfyq3LOG8AnZyA1tQ5qB53a0iQKs/UZB1+T7/u6+yxM=;
        b=mVwfYEbsr+jtABVxbA0Ng2xxE0SL05zVgR4LUKCBOXQ7XlCg/fHeT65Lu7YZYiptCQ
         GhF9/UebrW4v1j59SujaZu0h0aQ7iOc9MbuGbBQcNGrW10S6/cihuQNl0snw4OCoG6PO
         zPXrYuSBXjmJjGU/B+Ovom9qGU4dBL1X4/iTXOE6bDZfr4pIXOdFgwLhvUn70s5f3BSM
         hN6WtLCmC3zsmONDi3IfwLm4rItpjx5iQedzLsvvc07/cROrLJLyWzAeYADj6/+XMzLv
         eKqNqoYH0nKe9oPWehzMyVW5BunVmYq8LDAS/3N4zZ1m7856bIHD4EkK/5/U7Q5+J9/7
         z48g==
X-Gm-Message-State: AOAM5302vXT5fKAqudItwMpucwIFOLgN1pnB96mTaQ6GcrPxvutbkt+B
	LRt4iSVbRqn5rGVRgt1A+Q1NifKhdpSCQ+XV5ZfJN77aUGR2atG1PZRsudvGizVAE6j4uOL8OZs
	YPe+fJ8P5Z2m1Gul7JM/c3bj2d3xhinpWcw==
X-Received: by 2002:a05:6512:39d3:: with SMTP id k19mr1735992lfu.591.1626692941289;
        Mon, 19 Jul 2021 04:09:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxY4gO0OcGexHeZJckbAy+UtVrB1MNWS0DvVSxKY4ZHsvfRfmnx1HkdEo5E3jY2mah84SVTWw==
X-Received: by 2002:a05:6512:39d3:: with SMTP id k19mr1735979lfu.591.1626692940857;
        Mon, 19 Jul 2021 04:09:00 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:29 +0200
Message-Id: <20210719110819.27340-24-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: IT6FXP3RCXB5B55FM62FWEUX7EAFM4D4
X-Message-ID-Hash: IT6FXP3RCXB5B55FM62FWEUX7EAFM4D4
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 23/73] nciattach: fix poll.h include location
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/IT6FXP3RCXB5B55FM62FWEUX7EAFM4D4/>
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
