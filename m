Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2BE3C3262
	for <lists+linux-nfc@lfdr.de>; Sat, 10 Jul 2021 05:39:30 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 28B50100EB858;
	Fri,  9 Jul 2021 20:39:23 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 18506100EB845
	for <linux-nfc@lists.01.org>; Fri,  9 Jul 2021 20:39:21 -0700 (PDT)
Received: from mail-wm1-f72.google.com ([209.85.128.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m23pn-0007UH-Sa
	for linux-nfc@lists.01.org; Sat, 10 Jul 2021 03:39:19 +0000
Received: by mail-wm1-f72.google.com with SMTP id m40-20020a05600c3b28b02901f42375a73fso4678229wms.5
        for <linux-nfc@lists.01.org>; Fri, 09 Jul 2021 20:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7H/YBzhAWumHGP2N89LGO4OYAh6CLYyjz+3/xfFbPVo=;
        b=OEINSDaHYYUGutx59z4dQZhPV1Bb40trrjryyH9K2S4vFgGBWkmrjP1tDlbfWkseaX
         PYSBCrh0jlmilPwvVr/YB5TeZYwXt6aHqgw7mx85WBLqCmOmmvqOR+N+ZjYoTSGEWj/K
         cPoRS+Nkqa3uWPACPH5nOUDNcLW5boxIrHDhWFdS0smIS10NmnoGUFynTZ6mSUBewFZY
         qSqhiNXFYg/lXVMALG/UldbzS/rTBimIrVo79aKdVg/4fqpRukU9bHWCypMHbUrFiDN6
         4A90MKRZZUETbb0N7s207aK7wiUds/urZY166W/v7Z8q6F8asbVsRFx7rYBHksFDcybQ
         I64Q==
X-Gm-Message-State: AOAM531njerQFkLP6cXPzfNIGdUFYMP7mIL4tfyXnNGI/tdEFTpKRIBJ
	C/cu3AVJYj0kDzmt6JJXVlZ6XhTExPedHlqEhBmjBO8ZUy3VYC+e5VlTjai7VsWKf8mg8y6GalI
	RtQJ4KaGruM6a+FAvMNWCNEnEKfVpAndsZw==
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr41563195wmh.183.1625888359474;
        Fri, 09 Jul 2021 20:39:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiKlAQHa7zQHuPMizEIJQu2rFuBJp9Q4eOwBwdEwOLkGtWcnGczwFjhtSKa2GlBDUGCarPpQ==
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr41563185wmh.183.1625888359357;
        Fri, 09 Jul 2021 20:39:19 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id a12sm7444346wrh.26.2021.07.09.20.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 20:39:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sat, 10 Jul 2021 05:38:51 +0200
Message-Id: <20210710033859.3989-9-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
References: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: GUMOEITFUNAFPZW46T5FWOUBKJD3BGZB
X-Message-ID-Hash: GUMOEITFUNAFPZW46T5FWOUBKJD3BGZB
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 08/16] ci: enable back Ubuntu Hirsute
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/GUMOEITFUNAFPZW46T5FWOUBKJD3BGZB/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Preseed tzdata so Ubuntu Hirsute could be used for building.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 7 +++----
 ci/debian.sh             | 9 +++++++++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 266b93ff9895..866fa846c7f8 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -16,10 +16,9 @@ jobs:
       fail-fast: false
       matrix:
         include:
-          # Does pass installation - hangs on tzdata configuration
-          # - container: "ubuntu:hirsute"
-          #   env:
-          #     CC: gcc
+          - container: "ubuntu:hirsute"
+            env:
+              CC: gcc
 
           - container: "ubuntu:focal"
             env:
diff --git a/ci/debian.sh b/ci/debian.sh
index b13ffe701ae4..004e7d84ae07 100755
--- a/ci/debian.sh
+++ b/ci/debian.sh
@@ -11,6 +11,15 @@ set -e -E
 
 apt update
 
+# Some distros (e.g. Ubuntu Hirsute) might pull tzdata which asks questions
+export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true
+
+# Choose some random place in Europe
+echo "tzdata tzdata/Areas select Europe
+tzdata tzdata/Zones/Europe select Berlin
+" > /tmp/tzdata-preseed.txt
+debconf-set-selections /tmp/tzdata-preseed.txt
+
 apt install -y --no-install-recommends \
 	autoconf \
 	automake \
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
