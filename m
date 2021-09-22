Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27706414DD2
	for <lists+linux-nfc@lfdr.de>; Wed, 22 Sep 2021 18:12:17 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id AB25D100EB329;
	Wed, 22 Sep 2021 09:12:14 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 8A58C100EB85F
	for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 09:12:12 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 451B23F048
	for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 16:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1632327131;
	bh=Et90PqM6ZW/NDOJc1KbIxD3o6i8Hjqte++10k2ov3cc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=OPQ5HBFBKWQiStOQTu60vI5I/MFgbzofnMa3kdnX23ffAjmdzKW95HC2pnVo0aveh
	 TYapfw/Un6Pu7NPvb736L3Nyb0m5zD/DCc/I4QOeotTjy0J7Wj5PHQcqoQNdB3KpoN
	 xgfto+Rwtcv3hAJrGB9cSEg7lH5q7ai9SWaIz+IPpcpf0E930B/oM6xC3PD3Iph34Y
	 tMHy1M0OAGE43MmXnkkNgnVmGxwyF4BYy0LccsF3dxJwKa0R/4hY8Ty8ehGhTYnvwz
	 MxlLaWt+zpFVAscA1AcBpRHufc2FddtN8/ejcN/MkUKXrDpVj8tiSsfTOv0E/wjD1R
	 yAFCVBMZJHYKQ==
Received: by mail-ed1-f70.google.com with SMTP id 2-20020a508e02000000b003d871759f5dso3623625edw.10
        for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 09:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Et90PqM6ZW/NDOJc1KbIxD3o6i8Hjqte++10k2ov3cc=;
        b=oY/3nKOMWKHKgaYZHTrMsuBd9sWjr/Az/h7vQpHaa83ifuPoY8xbQAXk5KJ5M5NXdP
         YborO314qk0swC7x2EsWxnT5GjJTH5or05vnzfk7kK2YsOlvma/KA/M+Bh3Ff0mL0GeL
         mdhpHRd1L+2+6wdBhB5XYJefyoqH6C1vrTelhCR2mRQMfytN6uuTZYxr0TDkcbKuzEAH
         d098YL9foEuksfsfZXEemIDO83UM4SGOy6nFzSgmyueC4U6BeiMm7+CVsp6Vr2L/CF9S
         Lgs5OKmw4KJvtOMKsapU5aZaSvkJ6CTZeotT94DIburpnMf7VUbnwxfe/cYDNWHDaR82
         3rmg==
X-Gm-Message-State: AOAM530gEZNuLupuAnw6d3Wdc6Ode+p7A2puIBvYNq/jty6OM/EtyZZs
	sZQfmm6l0Ohm3pY4mqTTyoQ+RHL1KC3Z3om9gsKQrsBt553XouWG8YwToUtv11zHZN6+sMjdkEF
	PvnzgX95Em8eN59ahLiVMRXsyakgEYIde5w==
X-Received: by 2002:a17:906:c20d:: with SMTP id d13mr361170ejz.259.1632327130654;
        Wed, 22 Sep 2021 09:12:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRs23/BNW1mYgFNTJqh+yHeE67vXLq9sS8jVHSsxBwdXv5GmSomuPoM5HxPc8eILhSXE4Uxw==
X-Received: by 2002:a17:906:c20d:: with SMTP id d13mr361146ejz.259.1632327130434;
        Wed, 22 Sep 2021 09:12:10 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id b38sm1409122edf.46.2021.09.22.09.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 09:12:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed, 22 Sep 2021 18:11:11 +0200
Message-Id: <20210922161113.142758-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210922161113.142758-1-krzysztof.kozlowski@canonical.com>
References: <20210922161113.142758-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: ELS43E6PS3QPQ446RRTEIT3OZNSUTB2O
X-Message-ID-Hash: ELS43E6PS3QPQ446RRTEIT3OZNSUTB2O
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 6/8] ci: install pkg-config
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ELS43E6PS3QPQ446RRTEIT3OZNSUTB2O/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Some newer distros (e.g. Fedora 35) might not pull pkg-config and print
confusing errors like:

  configure.ac:61: error: possibly undefined macro: AC_MSG_ERROR
  If this token and others are legitimate, please use m4_pattern_allow.
  See the Autoconf documentation.
  configure.ac:179: error: possibly undefined macro: AC_DEFINE

Configure explicitly uses pkg-config so install it always.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 HACKING      | 1 +
 ci/alpine.sh | 1 +
 ci/debian.sh | 1 +
 3 files changed, 3 insertions(+)

diff --git a/HACKING b/HACKING
index 40bde2fb3c8b..db75f0d11a17 100644
--- a/HACKING
+++ b/HACKING
@@ -16,6 +16,7 @@ Required packages and tools:
   libnl-3
   libnl-genl-3
   make
+  pkg-config
 
 See also installation scripts for  Continuous Integration in ci/ directory.
 
diff --git a/ci/alpine.sh b/ci/alpine.sh
index 56449dd7c969..bf87068228f3 100755
--- a/ci/alpine.sh
+++ b/ci/alpine.sh
@@ -33,6 +33,7 @@ apk add \
 	libtool \
 	make \
 	musl-dev \
+	pkgconfig \
 	$PKGS_CC
 
 # Packages needed by CI
diff --git a/ci/debian.sh b/ci/debian.sh
index 962e554304ee..adb683eadf81 100755
--- a/ci/debian.sh
+++ b/ci/debian.sh
@@ -36,6 +36,7 @@ apt install -y --no-install-recommends \
 	libnl-genl-3-dev \
 	libtool \
 	make \
+	pkg-config \
 	$PKGS_CC
 
 echo "Install finished: $0"
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
