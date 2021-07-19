Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E60ED3CD340
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:55 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 152BE100EAB47;
	Mon, 19 Jul 2021 04:09:54 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 63BDB100EB34A
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:52 -0700 (PDT)
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 6740240334
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692991;
	bh=co2NCjym8IL1mS41VhEVa+ex81TKnHLr37TfUW+FZ6c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=Ce+c+1kHtGjs0ZDeA/PjQUObvlgFOFhroqZcnvHvFY+l4NsfdVhweRZJqT9fA5PRa
	 GqRwfLW5G95BLLIYwy5nskG8wbC3DE2iAM0WsoSg6Qa5UhbI9UOC9lf5PNO5Qp0X6B
	 5DuLEKxzqHWPI76GwIVwrqySDSMSZkYLPFxPASHiGevGBqvit6zK9gJMwNOVtdaZBA
	 WaxBMjE+OzS226MXHBgIKyJBzJETGsvbQjk070fzvxCpgEzIRv6byQAdJxAPWfeq3X
	 taa5eHq7kLcUb1kvK9e8V6xAknZB+nIDe/tF1dNm25t5Vysm+rx0UJQSy8ihkC1Aiq
	 09BcE1Vn9xmrQ==
Received: by mail-lj1-f200.google.com with SMTP id e9-20020a2e98490000b029018c799ba37bso9288384ljj.6
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=co2NCjym8IL1mS41VhEVa+ex81TKnHLr37TfUW+FZ6c=;
        b=moL5loEIou7XxHr42fj+I6h/NJRfGaoPXkSlVhvJZIN7Haj0N4/w2M/XOBZlccF+us
         ulLfYyMGP5Ky7MDnHsuZE2d/HwJXU1+2lLC0r01l12qSCLldND8s5MTsG3QxuIRXheq+
         izJt6QODN6iWqBzHV7dhNFgotIb6gAMeqjIIaE7rdoefNB1ckhpJHYA3VM6O9WZRctsi
         35m4rQgJcy4QDEQMYOhUDYVo46c6zGrOUNeKPGEeJUAE5XQeRepo4eEk/6EcQKHIwni8
         7JOk+G9REjpc/3/YYmiFDVbD9ZiOdHKeN8WWQSaGtcXe06NAm7DT+OUVw4L7FVLicrhb
         c9Ig==
X-Gm-Message-State: AOAM533mVxp6m38t4Aau06ePrr5j1Xbfq38CWPBUGOBHpC33qojAvrPT
	+4PGBjUudrbL1FZvEziUP9xnNDNx3SBKFp82aB4wNxtRdijFjEdIUZrpGMRJtfvAPnYOOPGfPzC
	MXBw4S436miR3p7IC0ZjudOgmjILtiNGcxw==
X-Received: by 2002:a2e:2286:: with SMTP id i128mr21732101lji.260.1626692990711;
        Mon, 19 Jul 2021 04:09:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzd7n7gXc3jtvvMKNtXDqDiTDFuZ/qXXyyb0haD3mB+WkIKSgmmgR7yIOi8Hw59lF99+kJrVQ==
X-Received: by 2002:a2e:2286:: with SMTP id i128mr21732095lji.260.1626692990575;
        Mon, 19 Jul 2021 04:09:50 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:08:11 +0200
Message-Id: <20210719110819.27340-66-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: QENVTSU4RHSKX4WAAJOK7UJFOLTC4SJD
X-Message-ID-Hash: QENVTSU4RHSKX4WAAJOK7UJFOLTC4SJD
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 65/73] HACKING: refine required packages
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/QENVTSU4RHSKX4WAAJOK7UJFOLTC4SJD/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Debian since Jessie (8.0 from 2015) seems to have automake v1.14, so
mentioning some specific configuration for it is not needed.  In the
same time other required libraries and tools are not mentioned, so let's
refresh the requirements list.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 HACKING | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/HACKING b/HACKING
index 478653c8a292..c1eb6d6189a6 100644
--- a/HACKING
+++ b/HACKING
@@ -5,17 +5,18 @@ Hacking on Near Field Communication manager
 Build tools requirements
 ========================
 
-When building and testing directly from the repository it is important to
-have at least automake version 1.10 or later installed. All modern
-distributions should default to the latest version, but it seems that
-Debian's default is still an earlier version:
-
-  Check version
-    # dpkg -l '*automake*'
-
-  Install new version
-    # apt-get install automake1.10
-    # update-alternatives --config automake
+Required packages and tools:
+  autoconf
+  automake
+  dbus
+  gcc/clang
+  glib 2.0
+  libtool
+  libnl-3
+  libnl-genl-3
+  make
+
+See also installation scripts for  Continuous Integration in ci/ directory.
 
 
 Working with the source code repository
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
