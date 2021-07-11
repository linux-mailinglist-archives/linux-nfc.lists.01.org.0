Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 107A93C3EFD
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:21:33 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id D2746100EB835;
	Sun, 11 Jul 2021 13:21:28 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 8E341100EBB6A
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:21:26 -0700 (PDT)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2fx6-0001X2-Nm
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:21:24 +0000
Received: by mail-wr1-f69.google.com with SMTP id t8-20020a05600001c8b029013e2027cf9aso2104633wrx.9
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uR8qMBXWahg5gjfSUfIC1I4GLYJFqjjDqu43HotD35k=;
        b=G4ow9oWKKaVBRikW2sR34zK4dKaNyZGnAWPNWvP7Yjgzgx4T0fvPd4AnyUg2tYEl/P
         6ASMbBFeJHrV+Ls65m65OhV6lge5gegJQSl2ZhmMBoBhUC0n/5udH/6hk3e1ouFnlSJ8
         wOcXXu7zTopTvNB3O0JX4xGsEWIc1Hz/ARaLwZ/6MAduoPSwJYZ1E6XkTl9pBYsv4JV6
         tXP1z/P6w6qSInYy61w/50nNy7SlBnY5sN4l6kOIJLAtmviRUGCqz1T3I4YudaMPw8pt
         36BZwYPYaw3L/t9GNJ5M358SAFBpvQ0CazvlRTTesE2ww+cM4L31NryfwKWVxyhC/y4x
         Oqaw==
X-Gm-Message-State: AOAM5300atwMncjjl/kuSh3vm6hdbTGdphtxaotI+AFsLUBUxniVj5nQ
	NLoVJqXLK09MmApua8LFCVpo2mPi3auZdu49ajsfu7PR2rNTIj9XXCMoklwif5igeFpCP5FVEZf
	UC3aCr6Hpt26Ub+92G6lnE9c3j8cOTAOzeg==
X-Received: by 2002:a7b:c042:: with SMTP id u2mr49729408wmc.86.1626034884126;
        Sun, 11 Jul 2021 13:21:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxycVoSuQdRy5bP19EsTn5vj6o2j5Huf8SjdAqNCckwzAzQdK8Paj8QL7GqfSdcxjal8x7AfQ==
X-Received: by 2002:a7b:c042:: with SMTP id u2mr49729400wmc.86.1626034883963;
        Sun, 11 Jul 2021 13:21:23 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id d14sm1503256wrs.49.2021.07.11.13.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:21:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:20:28 +0200
Message-Id: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Message-ID-Hash: 3GTKKDIYEYYOLFO6JYWXFW556NQ5CFSN
X-Message-ID-Hash: 3GTKKDIYEYYOLFO6JYWXFW556NQ5CFSN
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 00/34] fixes and improvements for neard (continued)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/3GTKKDIYEYYOLFO6JYWXFW556NQ5CFSN/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I continued with the fixes and CI for neard, on top of my previous
patchset:
https://lore.kernel.org/linux-nfc/20210710033859.3989-1-krzysztof.kozlowski@canonical.com/T/#t

Except compiler fixes, extend also Continuous Integration with
additional build configurations (i686, cross compile).  Explicitly run
also unit tests although they do not cover much of the code.

The patchset is available on Github:
https://github.com/krzk/neard
branches dev-more-ci and dev-c-warnings

Best regards,
Krzysztof

Krzysztof Kozlowski (34):
  Drop empty NEWS
  ci: add building without maintainer options
  ci: be verbose when building
  ci: add more build configurations (Fedora, Alpine, Debian,
    cross-compile, i386)
  ci: run unit tests
  adapter: adjust indentation of continued arguments
  ci: display printenv
  HACKING: refine required packages
  nciattach: fix poll.h include location
  unit: use proper pointer to uint8_t in test_snep_read_recv_fragments()
  build: fix setting CFLAGS on dash shell (Alpine Linux)
  build: add more compiler warnings
  gdbus: do not shadow global 'pending' variable (-Wshadow)
  nciattach: do not shadow other local 'opt' variable (-Wshadow)
  unit: do not shadow global 'uri' variable (-Wshadow)
  nfctool: use proper format for integers (-Wformat)
  bluetooth: use proper format for integers (-Wformat)
  ndef: use proper format for integers (-Wformat)
  nfctype2: use proper format for integers (-Wformat)
  nfctype3: use proper format for integers (-Wformat)
  nfctype5: use proper format for integers (-Wformat)
  mifare: use proper format for integers (-Wformat)
  p2p: use proper format for integers (-Wformat)
  npp: use proper format for integers (-Wformat)
  adapter: use proper format for integers (-Wformat)
  device: use proper format for integers (-Wformat)
  manager: use proper format for integers (-Wformat)
  tag: use proper format for integers (-Wformat)
  netlink: use proper format for integers (-Wformat)
  se: use proper format for integers (-Wformat)
  ndef: use proper format for integers (-Wformat)
  unit: use proper format for integers (-Wformat)
  build: enable -Wshadow and -Wformat-signedness compiler warnings
  AUTHORS: Mention Krzysztof Kozlowski's contributions

 .github/workflows/ci.yml    | 210 +++++++++++++++++++++++++++++++++++-
 AUTHORS                     |   1 +
 HACKING                     |  24 +++--
 NEWS                        |   0
 accflags.m4                 |  44 ++++++++
 acinclude.m4                |  16 ---
 ci/alpine.sh                |  35 ++++++
 ci/debian.cross-compile.sh  |  40 +++++++
 ci/debian.i386.sh           |  31 ++++++
 ci/debian.sh                |  14 ++-
 ci/fedora.sh                |  33 ++++++
 ci/ubuntu.cross-compile.sh  |   1 +
 ci/ubuntu.i386.sh           |   1 +
 configure.ac                |   5 +-
 gdbus/object.c              |  22 ++--
 plugins/mifare.c            |   8 +-
 plugins/nfctype2.c          |  12 +--
 plugins/nfctype3.c          |   2 +-
 plugins/nfctype5.c          |   6 +-
 plugins/npp.c               |   2 +-
 plugins/p2p.c               |   4 +-
 se/ace.c                    |  34 +++---
 se/apdu.c                   |   8 +-
 se/plugins/nfc.c            |   8 +-
 se/plugins/tizen.c          |   2 +-
 se/se.c                     |   6 +-
 src/adapter.c               |  40 +++----
 src/bluetooth.c             |   4 +-
 src/device.c                |   6 +-
 src/manager.c               |   4 +-
 src/ndef.c                  |  12 +--
 src/netlink.c               |  16 +--
 src/tag.c                   |   8 +-
 tools/nciattach.c           |  10 +-
 tools/nfctool/adapter.c     |   4 +-
 tools/nfctool/llcp-decode.c |   4 +-
 tools/nfctool/main.c        |  20 ++--
 tools/nfctool/sniffer.c     |   2 +-
 unit/test-ndef-parse.c      |  12 +--
 unit/test-snep-read.c       |   8 +-
 40 files changed, 550 insertions(+), 169 deletions(-)
 delete mode 100644 NEWS
 create mode 100644 accflags.m4
 create mode 100755 ci/alpine.sh
 create mode 100755 ci/debian.cross-compile.sh
 create mode 100755 ci/debian.i386.sh
 create mode 100755 ci/fedora.sh
 create mode 120000 ci/ubuntu.cross-compile.sh
 create mode 120000 ci/ubuntu.i386.sh

-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
