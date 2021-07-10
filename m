Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F5A3C3263
	for <lists+linux-nfc@lfdr.de>; Sat, 10 Jul 2021 05:39:31 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 3A67E100EB85D;
	Fri,  9 Jul 2021 20:39:23 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B3D3E100EB82F
	for <linux-nfc@lists.01.org>; Fri,  9 Jul 2021 20:39:21 -0700 (PDT)
Received: from mail-wm1-f71.google.com ([209.85.128.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m23po-0007UY-IW
	for linux-nfc@lists.01.org; Sat, 10 Jul 2021 03:39:20 +0000
Received: by mail-wm1-f71.google.com with SMTP id p6-20020a05600c3586b029020b46124c2eso2508432wmq.1
        for <linux-nfc@lists.01.org>; Fri, 09 Jul 2021 20:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A3xHeV1AGxBAavryOtBLoGwchSsL7wRPyFhIAER8ybQ=;
        b=Vafns8FIopksDB9MkVstROljSrmFms1IKZUZY/zpBDB5JTO8G0RY9uPzPA0kKjr7fp
         UZanptilKyCpvQNbHpJhZk3+L9AFf4jQ21UqBCpWs6woyyXjJ5Ko5NRuVB5BzmM7gpBK
         iMVpNaUcSEEJO3N5zRJV8Ej2OOvp3nULKlOJ4P31Pl+hLqwmA9CDz5VLdzafWRMc/S3/
         PQW42mNe0DA0U9sIAFbDvDLA2t3i0XkXDNDNIjHBrW9DKeKq2XL8hnSBdV5vT75Yug0Y
         x3ieNvO9BX4SSgBzpHDfr+LK77phBpPpIcLD9I7ae1LuAq/MRRX49slRehiyom56c7bb
         OOUg==
X-Gm-Message-State: AOAM532/qweL8+lv0QCCiNuwSbUrl1K38oWWOjsvEI/QPsV4BbcIUZkW
	HJvv6fI3+wyaFlNMjDprV6duO/KO/jMm8kHWhVFOotIUFaEUD5RsKNxadPocf3DDbdszE/X48JH
	hu3xC414KhRSHNFsmpfbYzFpF3j8ldD+q+Q==
X-Received: by 2002:a05:600c:4f41:: with SMTP id m1mr43061807wmq.134.1625888360158;
        Fri, 09 Jul 2021 20:39:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziQanzVWUuWIGGFLOM6LMw2fOATq8DWt7LSCIQDN09uNdTgyg0vMvrFhjEd0acIrw3JldRdg==
X-Received: by 2002:a05:600c:4f41:: with SMTP id m1mr43061801wmq.134.1625888360063;
        Fri, 09 Jul 2021 20:39:20 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id a12sm7444346wrh.26.2021.07.09.20.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 20:39:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sat, 10 Jul 2021 05:38:52 +0200
Message-Id: <20210710033859.3989-10-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
References: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: Z5BX4XI7A5C2B7DFFVZDNO3VOHI3G4MY
X-Message-ID-Hash: Z5BX4XI7A5C2B7DFFVZDNO3VOHI3G4MY
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 09/16] ci: print executed commands when configuring debian
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/Z5BX4XI7A5C2B7DFFVZDNO3VOHI3G4MY/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 ci/debian.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/debian.sh b/ci/debian.sh
index 004e7d84ae07..35eb3681f059 100755
--- a/ci/debian.sh
+++ b/ci/debian.sh
@@ -7,7 +7,7 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 
-set -e -E
+set -eEx
 
 apt update
 
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
