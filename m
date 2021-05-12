Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EA137C081
	for <lists+linux-nfc@lfdr.de>; Wed, 12 May 2021 16:43:44 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id AE590100EB82B;
	Wed, 12 May 2021 07:43:42 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 4E82C100EBB6A
	for <linux-nfc@lists.01.org>; Wed, 12 May 2021 07:43:40 -0700 (PDT)
Received: from mail-vs1-f69.google.com ([209.85.217.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lgq5K-00058D-Or
	for linux-nfc@lists.01.org; Wed, 12 May 2021 14:43:38 +0000
Received: by mail-vs1-f69.google.com with SMTP id l6-20020a67d5060000b0290228235bc72dso11262801vsj.13
        for <linux-nfc@lists.01.org>; Wed, 12 May 2021 07:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TdWB/Esx7MvhSHhrINPBmiVw2zi4y0P4I0ON0o9Ugro=;
        b=b2qLOdCWQ1wLSDVE5meNjoWhGKJ8XAch+NhkxfM+gfpsM0HOJPEOBo0/7j0PLjZQc8
         L840n+dxmJcq8+GpdCTeTrP4R64C+XcvXBOMMNs8xhW2jPAVS9ry9Corq4DIMhmMUfqT
         t/sq6hT8oKFck+EnzrXJbSb6CR6KVHVMkzPmTWx80LssEZ+09iUuqN77pNNUWVpck7i9
         JDga1bePdszCtF/UJYCuso9a+E31OFzkotWTrUQQWLAQ0hHoy3txR6i1Q/qBLoUQj8mg
         nX2xFpiXABKpTgQZYrts//Ukkh0id1Tv+Ahr3H8Nod1pr91kSLVho/Q/2Dvk3NbEt203
         X6/w==
X-Gm-Message-State: AOAM531hZm/I/CGleuSeBv1P5ulP52+CgJ6y51WvpF0wYmwjIOFPWS3+
	6oS1k5lUqjKFJAyKT/PKiSkPGvZhTJUtM264pqCwbGwqBZwRimvtI0U2xhnJN7GaypJY3hwfyaP
	nAJTLzhJ/+2+yT2nzAcFsqRDrqXBWSw+J9A==
X-Received: by 2002:ab0:2486:: with SMTP id i6mr32363604uan.51.1620830617952;
        Wed, 12 May 2021 07:43:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwmS3AcxaoVkRWOVvL8RHwnGNz+Q2MxoouobMXIqpUEwxbzAIjuzBVl5OO0VdTkhtYHNk9dQ==
X-Received: by 2002:ab0:2486:: with SMTP id i6mr32363581uan.51.1620830617806;
        Wed, 12 May 2021 07:43:37 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id a5sm1641vkl.19.2021.05.12.07.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:43:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed, 12 May 2021 10:43:19 -0400
Message-Id: <20210512144319.30852-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512144319.30852-1-krzysztof.kozlowski@canonical.com>
References: <20210512144319.30852-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: RXLQEEM747VU37ITMIKIGBFRXUFCCBNR
X-Message-ID-Hash: RXLQEEM747VU37ITMIKIGBFRXUFCCBNR
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 2/2] MAINTAINERS: nfc: include linux-nfc mailing list
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/RXLQEEM747VU37ITMIKIGBFRXUFCCBNR/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Keep all NFC related patches in existing linux-nfc@lists.01.org mailing
list.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index adc6cbe29f78..83f18e674880 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12900,6 +12900,7 @@ F:	net/ipv4/nexthop.c
 
 NFC SUBSYSTEM
 M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+L:	linux-nfc@lists.01.org (moderated for non-subscribers)
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/nfc/
-- 
2.25.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
