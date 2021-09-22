Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F8B414DD1
	for <lists+linux-nfc@lfdr.de>; Wed, 22 Sep 2021 18:12:15 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 9B154100EB855;
	Wed, 22 Sep 2021 09:12:13 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 06A36100EB847
	for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 09:12:11 -0700 (PDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AC66B3F22C
	for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 16:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1632327129;
	bh=/28fqyPjDfb3lojmcgFEBy/BwlXWTuV5+X9h8cYAlk4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=ilcMbL30DMdWp7bOeIUDfhNGlfOakmmKGmgzF4DC0oOiZew2KcNlpqjXM6pGaK6PO
	 rU2iP0mg0EVEtB4Gmc3MMMFgn7QJWy2abg8cFQ5KKdLmsg/pN8ixbTvlr1P9a6ygWc
	 jaM86hDK6PRetZ6cfY++FMcZ1Nx1z6VrVp9pLoKvz03KJZ2jKrs3rWc41V3vrYR7IT
	 /lvu/QhdLwf66GRlh4HGCnrK1LY7OE6HtuABoDK3DgoeKHYaMAQIa9wZgZMsm9wDjv
	 Q4CrUbdTyiFuqO0vbIBbcJM9Q56b33S/PPeKsFBFWH9EehaL6ir/ShxS74bepzdZHu
	 tpn1SjX+MNPPg==
Received: by mail-ed1-f69.google.com with SMTP id m30-20020a50999e000000b003cdd7680c8cso3614324edb.11
        for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 09:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/28fqyPjDfb3lojmcgFEBy/BwlXWTuV5+X9h8cYAlk4=;
        b=39pztfqDyLqMfmm6/zDW5FIhDuOdPMMasaOaPVrQMnoZ95KXJ1qCjPjfR/NjO/DzAV
         XLxvKjllh2NIceWQN+cxAmfG0SNbnY5r34oIf3P0c67hsrLBtnp2vCGiurX0rfMQEONm
         JLkuXPH89Rmb2mc++18fqIxax25QCIpmWBuLQGZctnPGovonVKjTyzpmxZhZs+To0Osu
         l9aSKhMkaw0d2DDbV7JfgyaI4+F9iXTWKl+175adG+ok/vif9MFyBOWRNt3XLie9QZsx
         bdiRxrQG0AzDD3tSTrQzz5gXdbvtSm8YEuNZYVe/Q3DCRKr8NeGWX7ZGfX77yaPDQKY3
         YL/g==
X-Gm-Message-State: AOAM530l0QGomBinlLuRdZiVANVlvX9tfl8SDfs+24c2RZxFx5xIVUm+
	lkzYRkzIxA/veJj0evLtC6VVZuR4FLp+eipYRnfc5ZpeLXTKwaoCjHy1zljEdzdOe+OK3ZYlFGt
	WXKVAxFmhWycgHbXhbySY16Vf8fkkv+CIwA==
X-Received: by 2002:aa7:cdd1:: with SMTP id h17mr38846edw.346.1632327128819;
        Wed, 22 Sep 2021 09:12:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBY4MTd1PIQvEal77Kcy1i92JX8WW3t1tU6WZMzUSmbBSIK4QoIEMmQwEw654U6F/ZzsHzaw==
X-Received: by 2002:aa7:cdd1:: with SMTP id h17mr38826edw.346.1632327128603;
        Wed, 22 Sep 2021 09:12:08 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id b38sm1409122edf.46.2021.09.22.09.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 09:12:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed, 22 Sep 2021 18:11:10 +0200
Message-Id: <20210922161113.142758-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210922161113.142758-1-krzysztof.kozlowski@canonical.com>
References: <20210922161113.142758-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: ZY5EEMIROTFKF3OE7D46IHR7Q7TDPLBE
X-Message-ID-Hash: ZY5EEMIROTFKF3OE7D46IHR7Q7TDPLBE
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 5/8] ci: add ArchLinux container
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ZY5EEMIROTFKF3OE7D46IHR7Q7TDPLBE/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Build in ArchLinux latest container.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml |  1 +
 ci/archlinux.sh          | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100755 ci/archlinux.sh

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index cc977670e380..734969325692 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -23,6 +23,7 @@ jobs:
         compiler: [gcc, clang]
         container:
           - alpine:latest
+          - archlinux:latest
           - debian:testing
           - debian:stable
           # Fails on configure on GCC and clang (process restrictions?)
diff --git a/ci/archlinux.sh b/ci/archlinux.sh
new file mode 100755
index 000000000000..b08069ad2589
--- /dev/null
+++ b/ci/archlinux.sh
@@ -0,0 +1,30 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2021 Canonical Ltd.
+# Author: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+#                             <krzk@kernel.org>
+#
+
+set -ex
+
+PKGS_CC="gcc"
+case $CC in
+	clang*)
+		PKGS_CC="clang"
+	;;
+esac
+
+pacman -Sy --noconfirm \
+	autoconf \
+	autoconf-archive \
+	automake \
+	dbus \
+	glib2 \
+	libnl \
+	libtool \
+	make \
+	pkg-config \
+	$PKGS_CC
+
+echo "Install finished: $0"
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
