Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE253C326A
	for <lists+linux-nfc@lfdr.de>; Sat, 10 Jul 2021 05:39:39 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id CDBE3100EB341;
	Fri,  9 Jul 2021 20:39:28 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 15E0E100EB32D
	for <linux-nfc@lists.01.org>; Fri,  9 Jul 2021 20:39:27 -0700 (PDT)
Received: from mail-wr1-f70.google.com ([209.85.221.70])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m23pt-0007Vf-QJ
	for linux-nfc@lists.01.org; Sat, 10 Jul 2021 03:39:25 +0000
Received: by mail-wr1-f70.google.com with SMTP id j1-20020adfb3010000b02901232ed22e14so3783821wrd.5
        for <linux-nfc@lists.01.org>; Fri, 09 Jul 2021 20:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g+HumzcKvr4Y1oChlQT+if9Oq0nhb7otJ2G6x77j3k8=;
        b=UoYUCpQWadAxBa1hcv7c0wU81m7/IkcPwSF/qMkhmz2WxMwVn7Jb3YdNqB9SYjkGNT
         G/bOQkBQj/Rviom0JO+CmuTLmpKcZadI8C6As4c4fgJxhBVVgY+amQ0NP/3LYJsj9SF6
         gXkKOu9IzRQj+Es4YCW264adp3MjfOfpGi5EfRA4vAPI46P+agW2QEkNWN3XNrzEjZiE
         ivk4e3FKHotLsjCfT+iGgVlq5y7uNgCn78UiCZ0/VLbXeKrKUcnBAvGif+7WqJ/49SBF
         x2os/hwbFeGfx2/dT2GUbUDXlEYALXaczY74B14jOjBK7aeDON++fG22RlzkJAc+Y87u
         HBCA==
X-Gm-Message-State: AOAM533SPF34mD5VE1ivt/6VdFD9aUoLa6A84gkLhCErDJmytR3muX2c
	mzGG2h/FhCkwxwnArt4FbziBZbR/Bg8QOtRnO+2AD5vXRT0dgnrkqAzD8jt2wFW+wRyftM7o93U
	MQcwVyuy16Br/Nk8CNIDHLloOw65bQhrMYQ==
X-Received: by 2002:a05:600c:214a:: with SMTP id v10mr5500685wml.67.1625888365246;
        Fri, 09 Jul 2021 20:39:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMAQ8/+2GJbTAqT717l2EhAbMmJF9CSU6yjQnhOgpzmZrAc42aJVuCelqkFi9HTF1tUPmaNA==
X-Received: by 2002:a05:600c:214a:: with SMTP id v10mr5500680wml.67.1625888365141;
        Fri, 09 Jul 2021 20:39:25 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id a12sm7444346wrh.26.2021.07.09.20.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 20:39:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sat, 10 Jul 2021 05:38:59 +0200
Message-Id: <20210710033859.3989-17-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
References: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 7DN4EU6CIJC2IZGYHV2HGTWMIXRM5ORC
X-Message-ID-Hash: 7DN4EU6CIJC2IZGYHV2HGTWMIXRM5ORC
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 16/16] ci: add clang builds
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/7DN4EU6CIJC2IZGYHV2HGTWMIXRM5ORC/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 10 ++++++++++
 ci/debian.sh             |  9 +++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index e746eb67df29..fb322381e7f5 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -16,6 +16,7 @@ jobs:
       fail-fast: false
       matrix:
         include:
+          # Ubuntu gcc
           - container: "ubuntu:hirsute"
             env:
               CC: gcc
@@ -32,6 +33,15 @@ jobs:
             env:
               CC: gcc
 
+          # Ubuntu clang
+          - container: "ubuntu:hirsute"
+            env:
+              CC: clang
+
+          - container: "ubuntu:focal"
+            env:
+              CC: clang
+
     container:
       image: ${{ matrix.container }}
       env: ${{ matrix.env }}
diff --git a/ci/debian.sh b/ci/debian.sh
index 35eb3681f059..1d31d8364982 100755
--- a/ci/debian.sh
+++ b/ci/debian.sh
@@ -20,13 +20,18 @@ tzdata tzdata/Zones/Europe select Berlin
 " > /tmp/tzdata-preseed.txt
 debconf-set-selections /tmp/tzdata-preseed.txt
 
+PKGS_CC="build-essential"
+if [ "$CC" == "clang" ]; then
+	PKGS_CC="clang"
+fi
+
+
 apt install -y --no-install-recommends \
 	autoconf \
 	automake \
-	build-essential \
 	libdbus-1-dev \
 	libglib2.0-dev \
 	libnl-3-dev \
 	libnl-genl-3-dev \
 	libtool \
-
+	$PKGS_CC
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
