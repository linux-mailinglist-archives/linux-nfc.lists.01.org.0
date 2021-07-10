Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 419063C325B
	for <lists+linux-nfc@lfdr.de>; Sat, 10 Jul 2021 05:39:21 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 84116100EBB92;
	Fri,  9 Jul 2021 20:39:18 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 23FC1100EBB78
	for <linux-nfc@lists.01.org>; Fri,  9 Jul 2021 20:39:15 -0700 (PDT)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m23pi-0007T1-15
	for linux-nfc@lists.01.org; Sat, 10 Jul 2021 03:39:14 +0000
Received: by mail-wr1-f69.google.com with SMTP id j1-20020adfb3010000b02901232ed22e14so3783677wrd.5
        for <linux-nfc@lists.01.org>; Fri, 09 Jul 2021 20:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CvIoWk9w4uV1UBhiulo6+/iZDdntLmljYcAp/u9PgCY=;
        b=aObNdJXfaAk67ocNRNVZgCBBTD6jLBJzJEflhP6A9KuWbajPIwphcRFPiJHoB5YNXy
         HklvIsl5mdZ9ghfeb07yRn4EPFLiZkJwCjf36+pOW5VYo1H6b3kmE7a3AiFwiHvUt2uQ
         RGo6bKPFlu0y3twh6Nb8IaCJLE1KSq/WQ/lW3Dz7c8poT9URTDDg7Z+1xYrp3LT7i3of
         qWZXScOexqnhde82x4ijvzMBF60NTU+pTxvZJbj/O9YMfVEl1ee6qpthAhLcka7VDpLh
         bP60nDKpKhmXGcKR8mtDwN2U9aEwXNju/PyoyK/44hWS3OVf0IQp2XdmRw7QvwLL+uDq
         oQ1g==
X-Gm-Message-State: AOAM5339LoLUkJaCWBBmtAt60NjQvQJhhe2LcxYzQ2FfaG5uFzbEdXrv
	omrUoBxYuG7XnjBh3duRWwPf5qtSnIY0Tcnz48XM9EuUIeF2RzJ3REWYztqyTLeg7uMP8gxojYT
	NAqdg7ZTeb8zjyyk5qIUC+zQpLNQDYDC6Dg==
X-Received: by 2002:a1c:4b12:: with SMTP id y18mr2009986wma.111.1625888353350;
        Fri, 09 Jul 2021 20:39:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxL/Lvz8tuK8es1REqHz/cI/RFgRA3RVLlOf34pj+c7m1G5kU9rerjF9kJ8mBPgO5j/F24Pzg==
X-Received: by 2002:a1c:4b12:: with SMTP id y18mr2009972wma.111.1625888353072;
        Fri, 09 Jul 2021 20:39:13 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id a12sm7444346wrh.26.2021.07.09.20.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 20:39:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sat, 10 Jul 2021 05:38:43 +0200
Message-Id: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Message-ID-Hash: IA3SUHNPCX3MB4AHVP3TFUGLMW6VQ3EK
X-Message-ID-Hash: IA3SUHNPCX3MB4AHVP3TFUGLMW6VQ3EK
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 00/16] neard CI under Github and rouund of fixes
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/IA3SUHNPCX3MB4AHVP3TFUGLMW6VQ3EK/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Mark proposed to do some work around neard (the user-space counterpart
of NFC drivers) [1], so here it is.

I made a fork on Github [2] and I add here Continuous Integration via
Github actions. These are pretty easy to set up. For starting only few
builds are done, but I have also more in the queue - just need to fix
32-bit and clang builds.

The neard fails to compile on GCC v10 (earlier maybe as well) in
maintainer moe (so with some warnings enabled) which is fixed here. It
is also first round of fixes around UTF-8 and UTF-16 parsing, although
this is not finished yet.

Further plans:
1. Decide whether official releases should be made from Github or
   kernel.org.
2. Fix for clang.
3. Fix UTF-8 and UTF-16 in ndef.
4. Add more unit tests around ndef and others (help would be here
   appreciated).
5. Add more GCC/clang warnings and fix them.
6. Add some static analysis checks in Github CI.

[1] https://lore.kernel.org/linux-nfc/20210512144319.30852-1-krzysztof.kozlowski@canonical.com/T/#m6a1cdae5f435b295cc7670c361b5bdc1daf30273
[2] https://github.com/krzk/neard

Best regards,
Krzysztof


Krzysztof Kozlowski (16):
  nfctool: fix adapter_compare_idx() cast-function-type
  nfctool: fix nfctool_send_dep_link_up() cast-function-type
  nfctool: fix nfctool_print_and_remove_snl() cast-function-type
  ci: temporarily disable Ubuntu Hirsute
  dbus: fix -Wformat in near_dbus_encode_string()
  bootstrap: parse CROSS_COMPILE and set proper configure option
  ci: add SPDX and copyright notes to ci.yml
  ci: enable back Ubuntu Hirsute
  ci: print executed commands when configuring debian
  ci: no need to print twice compiler version
  unit: pass real UTF-8 for testing text NDEF
  ndef: check UTF-16 text payload length
  ndef: silence clang -Wcast-align warning
  ndef: fix parsing of UTF-16 text payload
  nfctype5: fix returning uninitialized stack value in
    t5_tag_is_ti_pro()
  ci: add clang builds

 .github/workflows/ci.yml | 19 ++++++++++++++--
 bootstrap-configure      |  6 +++++
 ci/debian.sh             | 20 ++++++++++++++---
 plugins/nfctype5.c       |  2 +-
 src/dbus.c               |  2 +-
 src/ndef.c               | 24 +++++++++++++++-----
 tools/nfctool/adapter.c  |  6 +++--
 tools/nfctool/main.c     |  8 +++----
 unit/test-ndef-parse.c   | 47 ++++++++++++++++++++++++++++++++++------
 9 files changed, 108 insertions(+), 26 deletions(-)

-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
