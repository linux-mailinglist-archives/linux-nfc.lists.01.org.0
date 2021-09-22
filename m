Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A8E414DD4
	for <lists+linux-nfc@lfdr.de>; Wed, 22 Sep 2021 18:12:21 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id CF142100EB323;
	Wed, 22 Sep 2021 09:12:17 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 9F6A3100EB85D
	for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 09:12:15 -0700 (PDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7E69D3F048
	for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 16:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1632327134;
	bh=2nb4v17Bd6whMVbBlBoxLVJjofeb6VLtV35I2WZ+aGo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=gIsZA0pT+qTL+AOoX/1GwnKQoLfHFdfe3vpP4I4aagbzDpaDvmIxacbYVB58A7jP4
	 fxt+KOpqpRzrnw8mjb4j+ANfgSCXIEtlK4NMiOU6u+EBV4gDgDMxCc+MkauAAyvPmX
	 RhckZqKvb7XzulRuyxO1lYlYC+DObAZm+jeHrFujy5NB9xWctv5Qy03QZ10Ev1a0p9
	 iq0yGS9T9CkSsQ8N5L3x+Fu7S7qdALFjyyhJsIgj22/LiusqXz3MNjCQuhifgyLIEB
	 cYc5sik485f1+hxt8/KRVHkuih77ITTqL3RGETeaxHrmdBglvOx3+frX5t3xvpS+9B
	 cWT4m+u4ICVfw==
Received: by mail-ed1-f72.google.com with SMTP id o23-20020a509b17000000b003d739e2931dso3653517edi.4
        for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 09:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2nb4v17Bd6whMVbBlBoxLVJjofeb6VLtV35I2WZ+aGo=;
        b=qcv9yDneOj6wloE0XisShkWHNXocVCploL5ou2vFq2lgpzlzBzJFYgjbXycKlg7KPM
         V/oCXCkOiO57URhanUvWbiV3omoG9u3XpR5Vrdeki7h2WSabIm53cXmOGzWy+TSMj3CV
         BU5fykNb0sJLeR4AK4zpodBbVi/eUiUbRtmW17kPvwURLKw9EMQt7Mxloj9IaEEAvFzt
         K0loxYoaIVlqXILkn5cpUp3dodDpPJQeuRtMoGBgHtA1r2fW7rBXsSZ+qg/59EvNRPLy
         qy2JCLg/ujteDCxwHWp/FzFoFMXK8iyQ7xJWYAZFOE6zKI8EaU0rLQG85MtEvt0LmGd6
         5huA==
X-Gm-Message-State: AOAM530QtCMf74qOrtH1JLwE7jrmtOdulG3sHGIba/ufiIW2VqoTpebD
	zIvg79bHl6bxVIqiRAgPBim4FAUWh5hcFs5e7+0vT2i1JAR6wqq3ej4IV7Ngk/vlOHgtG1aZD1i
	Z7IduO0S268W0ZG6ygs3m1bc4Ao1V0N0dOw==
X-Received: by 2002:a17:906:2ed1:: with SMTP id s17mr374055eji.261.1632327133285;
        Wed, 22 Sep 2021 09:12:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+x1YPI5l7vrGukoz/w35QZXmHUUIsWL3JYWMU2thI7AcUkHFmqf1T+BxYgOYVakxU8YInTA==
X-Received: by 2002:a17:906:2ed1:: with SMTP id s17mr374036eji.261.1632327133096;
        Wed, 22 Sep 2021 09:12:13 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id b38sm1409122edf.46.2021.09.22.09.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 09:12:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed, 22 Sep 2021 18:11:13 +0200
Message-Id: <20210922161113.142758-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210922161113.142758-1-krzysztof.kozlowski@canonical.com>
References: <20210922161113.142758-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: IWMEL3OSCFYA4JJJ7DCZCWLUG7NRX3WM
X-Message-ID-Hash: IWMEL3OSCFYA4JJJ7DCZCWLUG7NRX3WM
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 8/8] ci: group package installation on Alpine
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/IWMEL3OSCFYA4JJJ7DCZCWLUG7NRX3WM/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 ci/alpine.sh | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/ci/alpine.sh b/ci/alpine.sh
index bf87068228f3..550bf86370bf 100755
--- a/ci/alpine.sh
+++ b/ci/alpine.sh
@@ -20,6 +20,9 @@ case $CC in
 	;;
 esac
 
+# Packages needed by CI
+PKGS_MORE="file"
+
 # gzip: for distcheck
 apk add \
 	autoconf \
@@ -34,10 +37,7 @@ apk add \
 	make \
 	musl-dev \
 	pkgconfig \
-	$PKGS_CC
-
-# Packages needed by CI
-apk add \
-	file
+	$PKGS_CC \
+	$PKGS_MORE
 
 echo "Install finished: $0"
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
