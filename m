Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B897D3DFD21
	for <lists+linux-nfc@lfdr.de>; Wed,  4 Aug 2021 10:43:13 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 688E2100EBB92;
	Wed,  4 Aug 2021 01:43:11 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id ACDFF100EBB6C
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 01:43:09 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 7CD0B3F10B
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 08:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1628066588;
	bh=pSUNEvolfzCRikbtpGTBIEkqrWYN0gQLgWb+lfoQuQM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=AaJQc3cvDgbKVsawXl68mUyNTa4m9yQin2K3/WVuhV70TKsunx7C6Puv19UeMX+Jo
	 DniSXCtQph7T131Wff9QrkreVQt9ZGSBKNsrcN2c35Krhd012BT8cdKUF3qrnkgZ6a
	 A2SYMNrxwpqwlyN76LCJr0x667wP23a38XeLpUx+qZOxVsGLq+uHCwaJWwT9/8YibD
	 T3q9bIf8LbwA8qdZvC1kYxP7syiOO4QfuMqvwYz50I1+jz4b4276pZTrUkQPtnTh8R
	 uKLOQpowFirH29zhzr0LrBCfj9nc3eL1tluU/YNzAzGVseIgclNtSWQCiKIDbGaiv/
	 LqPfFBtymu3yQ==
Received: by mail-ed1-f70.google.com with SMTP id c1-20020aa7df010000b02903bb5c6f746eso1094583edy.10
        for <linux-nfc@lists.01.org>; Wed, 04 Aug 2021 01:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pSUNEvolfzCRikbtpGTBIEkqrWYN0gQLgWb+lfoQuQM=;
        b=qWJsfZs3RpQ4N6zWmssM6bDB4yywedw9jg+l11DHji3XFU3aunkJZNfk2ukswuR/sV
         Fdfk2oYhrIH19YZviKWimyS6/oAGjrK6Pj1bWa9xez9QmB0BiKCVq3pJK4aXDgv8oveP
         84otnc2PzGZsc6BAQ4OPnPdfvyaUzFz3tjCzMMGPVdiHkn5cx5Sk3fufWv5MmDL7B3zE
         ZDfyEc16yvJmh8jqGDxT6lhYWD+NbBuXsJkBRjja/1rSpiUYx0WQKcpELAni+sBRlIkE
         f94+dWDdipGvTwxYFeWAGhG5fccFu4ibcqDyKIGlBFognQHg290ei0ddcte7aUSkiq0k
         Q06A==
X-Gm-Message-State: AOAM5326vWCmqbjsF5wapotoxn8v0MdG0/yE6FG7DBN+iuHJH29sijne
	G7rsowzXaUVK0teiqVMFtRriZYXOQVKMwttE4AHiI/ooj1hAbsxF7aIzKs2ZdEG7seMeOpX9+ZM
	08mBM070YGuIncojhWnMiNljzaed/fuzLlg==
X-Received: by 2002:a17:906:acf:: with SMTP id z15mr25056805ejf.512.1628066587984;
        Wed, 04 Aug 2021 01:43:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOCWX94zgOdCB4Xjd5nR8fN6Xagy2We5AEnYuko0XzC4yTUGAyKhxqyvx4fSGNN2AsRoXMiQ==
X-Received: by 2002:a17:906:acf:: with SMTP id z15mr25056796ejf.512.1628066587870;
        Wed, 04 Aug 2021 01:43:07 -0700 (PDT)
Received: from localhost.localdomain ([86.32.43.172])
        by smtp.gmail.com with ESMTPSA id lw22sm459968ejb.74.2021.08.04.01.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 01:43:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed,  4 Aug 2021 10:42:10 +0200
Message-Id: <20210804084218.14677-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
References: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: XFXNDNE5NFEW7C3VNTNUUARFAUH2QER4
X-Message-ID-Hash: XFXNDNE5NFEW7C3VNTNUUARFAUH2QER4
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 03/11] ci: add clang builds
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/XFXNDNE5NFEW7C3VNTNUUARFAUH2QER4/>
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
 ci/debian.sh             | 10 ++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index e48ee0eb6815..3d9b50251602 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -20,6 +20,7 @@ jobs:
       fail-fast: false
       matrix:
         include:
+          # Ubuntu gcc
           - container: "ubuntu:hirsute"
             env:
               CC: gcc
@@ -36,6 +37,15 @@ jobs:
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
index 07b7c9305cdb..8cc4d307cccf 100755
--- a/ci/debian.sh
+++ b/ci/debian.sh
@@ -19,14 +19,20 @@ tzdata tzdata/Zones/Europe select Berlin
 " > /tmp/tzdata-preseed.txt
 debconf-set-selections /tmp/tzdata-preseed.txt
 
+PKGS_CC="build-essential"
+if [ "$CC" = "clang" ]; then
+	PKGS_CC="clang"
+fi
+
+
 apt install -y --no-install-recommends \
 	autoconf \
 	autoconf-archive \
 	automake \
-	build-essential \
 	libdbus-1-dev \
 	libglib2.0-dev \
 	libnl-3-dev \
 	libnl-genl-3-dev \
 	libtool \
-
+	make \
+	$PKGS_CC
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
