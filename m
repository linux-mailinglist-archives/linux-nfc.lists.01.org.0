Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF6F3DFD20
	for <lists+linux-nfc@lfdr.de>; Wed,  4 Aug 2021 10:43:12 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 58791100EBB78;
	Wed,  4 Aug 2021 01:43:11 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 601D5100EBB6C
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 01:43:08 -0700 (PDT)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 3D3443F07A
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 08:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1628066587;
	bh=+eutSqHnMM/1G5Yq3uHmznjk+tUDPQIoDF+0gOQVb2U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=WWtjtopEX1NbiWqJmkjpUauVgDR407chMbDAzFvP4bTLGXXtPusmPDUdCwT7GDA9m
	 NYkCZeL72+t/B+SKRrmFZjmeqc+IOXRy9zymgLhZeK7Gn9xPLznjqgyMTO5Z2QXmh0
	 qlFe+dMS3UpaX8rjaVRUle9QWjQfRJ4YZngknMA6O1dnCQ3rPz/Kd2nMPKCKvF67EI
	 jYmlFhZdrrrZd9d9YQ/pmhd5Gy33WoVxjtgF4zQHm6gKFp3kbtQyrbXoEn6CbJ8y2/
	 SWGQw731oKE15myQMXCiduNu27BbeR5LtwMDkkJ2z9tCHkQmxaQ1N8wnVLs1cXUahi
	 jhmBMoHjCFI+A==
Received: by mail-ej1-f72.google.com with SMTP id zp23-20020a17090684f7b02905a13980d522so597700ejb.2
        for <linux-nfc@lists.01.org>; Wed, 04 Aug 2021 01:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+eutSqHnMM/1G5Yq3uHmznjk+tUDPQIoDF+0gOQVb2U=;
        b=oGZtYEuTWUlzhLqaGXWmmnyyt0SWKba5bUIr9piGHnKWj1UO9stX5hm99RWJLWx4Bh
         bjAtkzunovZZyA5MdoTG8w6vIQYGl4nsAFWXENeJ5p36E+cwCVPCasTH0UZpm9dluRv9
         jGO7P2oYUcRczSogynzGAx2RP3mmOtuxgSSb1hQoT1B2Fkagt6pvEIBmwejsKPPxTkr4
         9BjFIC6app6GQklat5Ea9SPksvqBCmNrSJ9y8ilkBnQ39+bNfBbe/gVRm0v7LArRgQEs
         Bwubqf6LgqiM+MU51V0wmmxf2XxpAI7J+ZLayWGJC0KfP0Ni7vjNAtzIuvBvuL/drCuN
         fbsw==
X-Gm-Message-State: AOAM533RtrLjWeWUxQtZOVqYHgGjpQY1QVjgSpJnFGkt0OODEimERB7Y
	X6msiJx0f9Jhf97XyyFkH6mGTPTK52wpdNXh0M2BFIkBLbKeI1jKxX03t1bp3c+mi+RNQLYTIjy
	NNqd1PW7yY4/TFT7bzngUMEx0m3IYZwqKLg==
X-Received: by 2002:a17:906:e241:: with SMTP id gq1mr26100231ejb.87.1628066586755;
        Wed, 04 Aug 2021 01:43:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxr1i5SWSTqF6GBpeLgaXN4hIR2lyIwvhnQKciL95gkigf2jdSPKE4cvI+wKQ8eSUnlBdxPvw==
X-Received: by 2002:a17:906:e241:: with SMTP id gq1mr26100220ejb.87.1628066586597;
        Wed, 04 Aug 2021 01:43:06 -0700 (PDT)
Received: from localhost.localdomain ([86.32.43.172])
        by smtp.gmail.com with ESMTPSA id lw22sm459968ejb.74.2021.08.04.01.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 01:43:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed,  4 Aug 2021 10:42:09 +0200
Message-Id: <20210804084218.14677-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
References: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: D67MGKH7SSCQAIUVLXI4PRZTVLY3EPK4
X-Message-ID-Hash: D67MGKH7SSCQAIUVLXI4PRZTVLY3EPK4
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 02/11] bootstrap: parse CROSS_COMPILE and set proper configure option
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/D67MGKH7SSCQAIUVLXI4PRZTVLY3EPK4/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Makes cross compiling in CI easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 bootstrap-configure | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/bootstrap-configure b/bootstrap-configure
index 7cb14588f816..0652e3b223b6 100755
--- a/bootstrap-configure
+++ b/bootstrap-configure
@@ -4,6 +4,11 @@ if [ -f config.status ]; then
 	make maintainer-clean
 fi
 
+CONFIGURE_CROSS=""
+if [ "$CROSS_COMPILE" ]; then
+	CONFIGURE_CROSS="--host=${CROSS_COMPILE}"
+fi
+
 ./bootstrap && \
     ./configure --enable-maintainer-mode \
 		--enable-debug \
@@ -11,4 +16,5 @@ fi
 		--prefix=/usr \
 		--enable-ese \
 		--sysconfdir=/etc \
+		"$CONFIGURE_CROSS" \
 		--enable-tools "$@"
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
