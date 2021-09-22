Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 341D4414DD0
	for <lists+linux-nfc@lfdr.de>; Wed, 22 Sep 2021 18:12:14 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 88752100EB858;
	Wed, 22 Sep 2021 09:12:11 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 1A4CD100EB859
	for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 09:12:09 -0700 (PDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DE1C03F048
	for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 16:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1632327127;
	bh=K93QE3QnQPtLYRrF3XPr7br5YHKo6CjnZFG69oyXADk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=m6tgamORI98co+ud9ySAXmT00vC9Gi/AeQG+p5KJt7D2h8h9CKNvnjEhGBiOzSTIm
	 EpSi+27qCk5G0EJ40UoqU0yHMYny+w2hjwEHNE/Kp6FVQaCFgxuRlAHqfOucbkj1/o
	 iI9t459XlgE22yYwIyFaea2ArbpeoyCIZ7EpEQ866MKb3TOkfys5PFXktA49MUtahN
	 h/K+ziuF5o6tRz6LcKiwrn6Ehy+dJyG1R7UMpIdRIguzZhnrRk4OSgMmDDnw4LRsmY
	 0/GUvBEVar8+G6CM62eDZPuvRf+X4+/GsQa5JKbStvCXzrxGhBmb0dMKCaHNKPwsWm
	 ux+As0fPLAOGA==
Received: by mail-ed1-f69.google.com with SMTP id h24-20020a50cdd8000000b003d8005fe2f8so3648962edj.6
        for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 09:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K93QE3QnQPtLYRrF3XPr7br5YHKo6CjnZFG69oyXADk=;
        b=LILiFhxC6HH1/osD6D2Q0bGUf3NDACJJ0rfrKiatB7ckn2/7fLP+ToASrEvDdKNOy9
         Fy0+l1R4XXYUdsoaNT2Z4lmph0Ol/t3+8b22WVi8/eXIGQInAtuEMw61vFbGZVLfdMru
         RNK2yMsuoE+VvcxHpaOTUzjbC/QAUyJGN/8sAlRAf+jAfCjXYi4NtYf635ygmGlk4mzB
         36sYzBKDYo3/sj+A3CFsbPinyh4g26v+5Kn8aVUievAGVh1vcUi19WWdAMm2+JjFR/z1
         nUIi/n3klY/9WprNWfU6pGpNjMf4niOszBaRDQzy7B184A7fk+n8/q6w8Q480BoU1oj5
         dfDA==
X-Gm-Message-State: AOAM530dwDtEgctCFtkl5zNWt2IM637lAN1SxhkjxsSwwAvWu7I5zeic
	IO7FWp7U6obqcSnNZSrlimSKBm88w/HKqzpJrQ9QMn3px8jugXtqMyF8KdAWdueVatU4Z11LJ1/
	cbHH8kCDkXSzvU1p55s22TYdc/cfkWZOqKQ==
X-Received: by 2002:a17:906:1f09:: with SMTP id w9mr406686ejj.472.1632327127195;
        Wed, 22 Sep 2021 09:12:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyE7MmRMsETxdiX5/AzNy/YJlWte9ljG+G6hfeqobj2+rbi1Kg0OApv5PZSH5loMGthAPGuzA==
X-Received: by 2002:a17:906:1f09:: with SMTP id w9mr406671ejj.472.1632327127047;
        Wed, 22 Sep 2021 09:12:07 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id b38sm1409122edf.46.2021.09.22.09.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 09:12:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed, 22 Sep 2021 18:11:09 +0200
Message-Id: <20210922161113.142758-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210922161113.142758-1-krzysztof.kozlowski@canonical.com>
References: <20210922161113.142758-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: N75D56QG5FNZN4J7A755UAEVXKXRVGTE
X-Message-ID-Hash: N75D56QG5FNZN4J7A755UAEVXKXRVGTE
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 4/8] ci: add more Fedora containers
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/N75D56QG5FNZN4J7A755UAEVXKXRVGTE/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Build in Fedora rawhide and in stable release containers.

Rawhide fails to install packages in two rounds (with two dnf/yum
commands), so combine these.  Rawhide also needs explicit pkg-config as
it is not pulled in by other packages.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml |  4 ++++
 ci/fedora.sh             | 13 ++++++++-----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 6a4eeedf3d66..cc977670e380 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -25,7 +25,11 @@ jobs:
           - alpine:latest
           - debian:testing
           - debian:stable
+          # Fails on configure on GCC and clang (process restrictions?)
+          # - fedora:rawhide
           - fedora:latest
+          - fedora:33
+          - fedora:32
           - ubuntu:hirsute
           - ubuntu:focal
           - ubuntu:bionic
diff --git a/ci/fedora.sh b/ci/fedora.sh
index f054f7d296d4..f9ec67a15062 100755
--- a/ci/fedora.sh
+++ b/ci/fedora.sh
@@ -15,19 +15,22 @@ case $CC in
 	;;
 esac
 
+# Packages needed by CI
+PKGS_MORE="file"
+
+# diffutils: Rawhide/35 needs "cmp" for configure
 dnf -y install \
 	autoconf \
 	autoconf-archive \
 	automake \
 	dbus-devel \
+	diffutils \
 	glib2-devel \
 	libnl3-devel \
 	libtool \
 	make \
-	$PKGS_CC
-
-# Packages needed by CI
-dnf -y install \
-	file
+	pkg-config \
+	$PKGS_CC \
+	$PKGS_MORE
 
 echo "Install finished: $0"
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
