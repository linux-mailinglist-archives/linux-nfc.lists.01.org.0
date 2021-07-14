Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B924D3C8363
	for <lists+linux-nfc@lfdr.de>; Wed, 14 Jul 2021 13:05:38 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id BE6BB100F2240;
	Wed, 14 Jul 2021 04:05:34 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id A0201100EB350
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:32 -0700 (PDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id B92344022C
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 11:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626260725;
	bh=EiSCWw+7zGC3gsK29UkakIbaomDDZxLv9jZntBpLuQo=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=d3unBpW0v08yU+Fb8KS7TB3eHVsMEYGVaLRqFmVdgxi1+nPy3CcIv7SaCmuJKHQ6n
	 sDtT7cvIpfIvtuBFz7VssBtq8FLLDiZeFaZahMWI4Fnc4V3JgQOkW4OQ2pp0XjxbnO
	 +G4KXoqrJxdjB5u05E3praYNpl3E8EUE9dp9zSPO7iFhAu3PDZaaGTozoc8k/B2T2J
	 8v2KPTPeQbC5HongQoUBsnU1pTvtWOMzqfAvtY+LgKAO+RVcqj/yeG5b91Q62iVWzQ
	 GlggRJKGyDFlYVD9ljkiBYYuLw9+Eo6OqsdCBnBssPDvRF7ixe7Fu9wJiO2kMcaz2p
	 kZxri5AD8GgfA==
Received: by mail-ed1-f71.google.com with SMTP id y18-20020a0564022712b029038ffac1995eso1053909edd.12
        for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EiSCWw+7zGC3gsK29UkakIbaomDDZxLv9jZntBpLuQo=;
        b=L102VGJ4PsbvGxZOeRzAcqcH7CaZwpetoZGrp+oKz2oby92+9FS3CXJ16x4I2bezI9
         VS1J2vt4uZtfaVlobXjpTZDzXmKvDJ5X77f0Jh5Sjr+a+ANXoXyFbM9awzh3VjXBv8SD
         1thZdEkNBx3UoCIL6xM9N/sd1Lw7MDPX9MR+tK4JUuTCJnt6mJpJDevaL/UxZEL9Cuj0
         OepzGOk/gibfVJRyV+BAwoJD1qC9XXFen1BlGQYXydmby8zH5IkR4FgGhjlbl5qOrb5l
         PSHrhW+7DfeOhanAHo1NsVjOCRciosKTYavSArIIw/Hyw8LbAZSRQE0y4vJBGzQIKMjA
         WgIg==
X-Gm-Message-State: AOAM530OZFvwydLY2piy6SP7SDrvFcdU4r87WE5A5JLb/2Zi2Ht1M6vl
	SHFEHTb8QDpDdsWr0eqw3FPTJ2odEJRv7o+AVRPbLRR8i1K9RJ6m5ItuMFIT5iIY8B/Nu6XuZxC
	Hik1roIZL1/hgw+5KYQLz7DvHXUiMOIHZyQ==
X-Received: by 2002:aa7:cac8:: with SMTP id l8mr12500675edt.135.1626260725100;
        Wed, 14 Jul 2021 04:05:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxS7qW/52eOcUlXdk7sQp0cWeUTgPGTdE6uEue8dA+9wFO4liBJW2Dym5EDmA2QXJnYO6F/RA==
X-Received: by 2002:aa7:cac8:: with SMTP id l8mr12500657edt.135.1626260724908;
        Wed, 14 Jul 2021 04:05:24 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id qp12sm637689ejb.90.2021.07.14.04.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 04:05:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed, 14 Jul 2021 13:05:02 +0200
Message-Id: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Message-ID-Hash: 4VGEB5XTGMXCXNAG6S5RMOWZJ5GMYATB
X-Message-ID-Hash: 4VGEB5XTGMXCXNAG6S5RMOWZJ5GMYATB
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 00/16] -Wformat=2 and few memory leaks
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/4VGEB5XTGMXCXNAG6S5RMOWZJ5GMYATB/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

This is a third series of my patches, built on top of
https://lore.kernel.org/linux-nfc/20210711202102.18094-1-krzysztof.kozlowski@canonical.com/T/#t

The ASAN detected several leaks in the unit tests which lead me to
investigate such leaks through neard.  The patchset fixes few easier
ones.

Best regards,
Krzysztof


Krzysztof Kozlowski (16):
  gdbus: annotate printf-like functions as accepting format
  nfctool: annotate printf-like functions as accepting format
  mifare: use unsigned int to suppress compiler -Wstrict-overflow
  build: enable -Wformat=2 warnings
  build: enable -Wunsafe-loop-optimizations and -Wstrict-overflow=2
    warnings
  TODO: remove finished tasks
  ci: build also on Ubuntu Hirsute in non-maintainer mode
  ci: simplify getting test logs
  build: fix missing usage of PIE check result
  build: add support for GCC sanitizers (asan, lsan and ubsan)
  ndef: make freeing near_ndef_message reusable
  snep-send: fix near_ndef_message memory leak
  unit: fix memory leaks in test-ndef-parse
  tag: do not open-code freeing ndef message
  unit: do not open-code freeing ndef message
  ci: add build with sanitizers (asan, lsan and ubsan)

 .github/workflows/ci.yml | 58 +++++++++++++++++++++++++++++++++-------
 HACKING                  |  5 +++-
 TODO                     | 12 ---------
 accflags.m4              | 12 +++++++--
 acinclude.m4             | 36 +++++++++++++++++++++++++
 ci/debian.sanitizers.sh  | 18 +++++++++++++
 ci/ubuntu.sanitizers.sh  |  1 +
 configure.ac             | 47 +++++++++++++++++++++++++++++++-
 gdbus/gdbus.h            | 15 +++++++----
 include/ndef.h           |  1 +
 plugins/mifare.c         |  6 ++---
 src/adapter.c            |  1 +
 src/ndef.c               | 56 +++++++++++++++++++-------------------
 src/tag.c                |  6 ++---
 tools/nfctool/sniffer.c  |  8 +++---
 tools/snep-send.c        |  2 ++
 unit/test-ndef-parse.c   | 39 ++++-----------------------
 unit/test-snep-read.c    |  3 +--
 18 files changed, 221 insertions(+), 105 deletions(-)
 create mode 100755 ci/debian.sanitizers.sh
 create mode 120000 ci/ubuntu.sanitizers.sh

-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
