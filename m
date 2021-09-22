Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE81414DCD
	for <lists+linux-nfc@lfdr.de>; Wed, 22 Sep 2021 18:12:10 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 5F92D100EB82A;
	Wed, 22 Sep 2021 09:12:08 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 0B9F0100EBBC4
	for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 09:12:05 -0700 (PDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D9B0940267
	for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 16:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1632327123;
	bh=qG1On6vgZhKtHZfMupB4bQXAq4TAfEu87D8qwO1m7xQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=SFvBmYmbB06nzDwaRwQlxKiCxdWlIE7G0Ia9KkYaUMfRIpB6CA6QuzC4LsnOrs9+n
	 +No8W0jTTjAvFFriJ8a98eO8MKprjkXc4MybWVt61MbZ1g4QoPVszkkgnE2QPlK4zp
	 4fRQe+3Q0nFN3ibSanVJpPvgLVu2wbesZhY3dszVsbFyajAlUYysqJp4pIU7QGmuPB
	 pyIwYzitBpPPK2rfMRSumoKz8CPIVEhqnm2xq7PZOHqrCLLcFavMvrkCkt1BUCUPeG
	 ZxZ6KWVBWUNkIyfodffNzQ5PddU1CjqqDYzbeDeT7awyqdUs8IkI8WX0E0FqTl2wVM
	 bwvXceeWOPQwg==
Received: by mail-ed1-f71.google.com with SMTP id q17-20020a50c351000000b003d81427d25cso3598244edb.15
        for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 09:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qG1On6vgZhKtHZfMupB4bQXAq4TAfEu87D8qwO1m7xQ=;
        b=Rt1WjwIY66eoP50vVRrAk06P+z3LC96ZxZE5hjir8ndCFOsntUg6QpcyH94uknSDjN
         qLVKoY/bPHiLEzwJu3Ac4Rtnu+IygyMJige8QtYTWLDKrIFg0hRgIUxMTuLZWrzELubE
         r6K/oLRZemNX3WCpJYfybL9MSzpxb96FhKuYaUPFI8CO07+r5qDZpuduW9yWmQAZWpP5
         OnD2S+fPVwopbau+/4hn1WzyhSAK9jaZt/lUQ+uuT0PEidN7r8hbZmceyzUXyvd0axeI
         8G1WB6aT9EiLsNA0Fc/o6H2lklu88ReQpdr5Izo297sxtVdmaiVdVLM4Q5CbF22lJKrR
         NIZw==
X-Gm-Message-State: AOAM533geSRfKGDEhdI7hMnWL6ZPdtD5anzr/5xgNUTVOMs3+PE5Vp//
	iTsWn2OWDGaKvGTzdeyQq5fRFw/sGt6bnXVASJxx4fodmyJ4zXOFa4Bmew9NSMQvpKXQld36iKQ
	Wk4cSEnRreQ0+z05+CuufbVPBZnmri/1grA==
X-Received: by 2002:a17:907:d23:: with SMTP id gn35mr391640ejc.556.1632327123289;
        Wed, 22 Sep 2021 09:12:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcAH8gXbuejN6YSbbrfJ0o11gXnxyX9xJ54ZHIcVZZT7yBiJfabvQHYLPm1ehGIgBy/dzFvw==
X-Received: by 2002:a17:907:d23:: with SMTP id gn35mr391622ejc.556.1632327123088;
        Wed, 22 Sep 2021 09:12:03 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id b38sm1409122edf.46.2021.09.22.09.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 09:12:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed, 22 Sep 2021 18:11:06 +0200
Message-Id: <20210922161113.142758-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Message-ID-Hash: WIQZWJWJYQRC6YILAZGLUMCSGS5E72L4
X-Message-ID-Hash: WIQZWJWJYQRC6YILAZGLUMCSGS5E72L4
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 1/8] build: adjust configure.ac syntax to match autoupdate
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/WIQZWJWJYQRC6YILAZGLUMCSGS5E72L4/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Effect of autoupdate, without changing the version.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 configure.ac | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure.ac b/configure.ac
index 25b12b9a85d8..a1f7bd8bf56a 100644
--- a/configure.ac
+++ b/configure.ac
@@ -1,5 +1,5 @@
-AC_PREREQ(2.60)
-AC_INIT(neard, 0.17, [linux-nfc@lists.01.org])
+AC_PREREQ([2.60])
+AC_INIT([neard],[0.17],[linux-nfc@lists.01.org])
 AC_CONFIG_MACRO_DIR([m4])
 
 AM_INIT_AUTOMAKE([foreign subdir-objects color-tests])
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
