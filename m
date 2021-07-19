Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF7C3CD2FD
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:08:40 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id D2ABF100EBBC0;
	Mon, 19 Jul 2021 04:08:38 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 8A34C100EBBBD
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:36 -0700 (PDT)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id B031040325
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692914;
	bh=e8SV4RHnnQgBdoZdFFeZiy8PObJD+RMgsBr/Tb1Xi8o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
	b=IjrIv2ABPKkFzFpQbu+PxHgcsUngz2Bdx36YVh6JE0lEIZCJ4gjRft0FNDSZ+ePL6
	 lRfs89bX3nKp0T5ds1uMi+NVSpdVkN1yDcjAnOngJRAPfuWR005GeJnBnjpWi4hByP
	 wgrY+xt/BW5PzuGUaIMjEPIL9oq2XLD69KoRkaa6t9NbEkxdloOh9htw2TkaYaosha
	 vgNnrIGUxXvaN6LQq2WIkm3lBZV8nREv7PwZg27l6mWSK6BhDbRgNLLRHVkSIFRa8U
	 VyWTAd0dj4rFJrxX58oNd2exd3SVeSQth6kJQQMYUSvqV85YOjCaFEs8bLne+7nTqX
	 vvY/BZRi6bAMQ==
Received: by mail-lj1-f199.google.com with SMTP id c20-20020a2ea7940000b029013767626146so9296937ljf.15
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e8SV4RHnnQgBdoZdFFeZiy8PObJD+RMgsBr/Tb1Xi8o=;
        b=FxALpizHtQahF4YmDxLqf+Q+9JT/dtVBlZx/0JAg+Ji1CVyuXyZKxnRwaF9jAniBp8
         N5Biib2yDEBGHQb+f11rB++BYWcz03dzWWkxgjGtUgKrtS500jV9Z+PMuqlXVTpkRfw+
         FS42FuZhsFxw6G2Cf2XHfVA40jByWfBjMNS+dbRmALwjCgZtR9l4/fGe2hz0jjsF3ZRt
         Rea6xVcQ7BeEdLz78VYR1+hlsXz+CZ4tu0P3ib78+eH5TtAuTjptGTSJCpzJ4lMMb0K9
         EkegNcWzmHfu0gD2Bkf9khPoRgiefCPAFTtO8AdKoeMOpk2oHa4tDkpl+BpAoJJtA+XS
         1DpA==
X-Gm-Message-State: AOAM531hABSCULAm1rDaRVTLnxF77OlsA8NT4DYYp824nEWurlVXaGQF
	whqa4UNzxRUUABEsx8OwP4uDTbTyzFQcj/i03o9UVbn25Xa4jRshiW1K+JQCJZET6gDBOlKWqsf
	M0nOBuGnxL10PYHOhhN+89Nlj9Iqo3XXB9w==
X-Received: by 2002:a2e:752:: with SMTP id i18mr21929144ljd.497.1626692913917;
        Mon, 19 Jul 2021 04:08:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlMNlomkVIzLnMmBEOrQa/RuST6LuLh8FduAiI2mkKWEi66aMBMN9Uxjg4oYs3YSKS3B17nA==
X-Received: by 2002:a2e:752:: with SMTP id i18mr21929136ljd.497.1626692913741;
        Mon, 19 Jul 2021 04:08:33 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:08:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:06 +0200
Message-Id: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Message-ID-Hash: YTTBI4XKVLPQBOJLW35NNUOFVY7DIEP7
X-Message-ID-Hash: YTTBI4XKVLPQBOJLW35NNUOFVY7DIEP7
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 00/73] combined fixes - warnings, memory leaks, memory corruption
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/YTTBI4XKVLPQBOJLW35NNUOFVY7DIEP7/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Mark asked for resending fixes separate from setting up CI under Github
Actions, so here is a combination of all my previously sent patches
related only to the actual C code:

https://lore.kernel.org/linux-nfc/20210710033859.3989-1-krzysztof.kozlowski@canonical.com/T/#t
https://lore.kernel.org/linux-nfc/20210711202102.18094-1-krzysztof.kozlowski@canonical.com/T/#t
https://lore.kernel.org/linux-nfc/20210714110518.104655-1-krzysztof.kozlowski@canonical.com/T/#t
https://lore.kernel.org/linux-nfc/20210716100844.51360-1-krzysztof.kozlowski@canonical.com/T/#t

This includes fixes for GCC/clang warnings, memory leaks, memory
corruption and few other minor fixes. The UTF-8 and UTF-16 is not
entirely fixed and I removed the work-in-progress patches.

Changes since v1 are:
1. Group all patches based on prefix (unit file), instead of topic.
2. Put the build-related patches at the end.
3. Remove all CI-related patches.
4. Drop patch: ndef: fix parsing of UTF-16 text payload.
5. Fix commit msg in: nfctool: pass the format as string literal

Best regards,
Krzysztof


Krzysztof Kozlowski (73):
  Drop empty NEWS
  nfctool: fix adapter_get_devices() cast-function-type
  nfctool: fix adapter_print_target() cast-function-type
  nfctool: fix adapter_print_info() cast-function-type
  nfctool: fix adapter_compare_idx() cast-function-type
  nfctool: fix nfctool_send_dep_link_up() cast-function-type
  nfctool: fix nfctool_print_and_remove_snl() cast-function-type
  nfctool: use proper format for integers (-Wformat)
  nfctool: pass the format as string literal
  dbus: fix -Wformat in near_dbus_encode_string()
  unit: pass real UTF-8 for testing text NDEF
  ndef: check UTF-16 text payload length
  ndef: silence clang -Wcast-align warning
  ndef: use NDEF_TEXT_RECORD_UTF16_STATUS define
  ndef: use proper format for integers (-Wformat)
  ndef: make freeing near_ndef_message reusable
  se: fix multiple apdu definitions
  se: silence clang -Wcast-align warning
  se: use proper format for integers (-Wformat)
  adapter: adjust indentation of continued arguments
  adapter: use proper format for integers (-Wformat)
  gdbus: do not shadow global 'pending' variable (-Wshadow)
  nciattach: fix poll.h include location
  nciattach: do not shadow other local 'opt' variable (-Wshadow)
  bluetooth: use proper format for integers (-Wformat)
  nfctype2: use proper format for integers (-Wformat)
  nfctype3: use proper format for integers (-Wformat)
  nfctype5: use proper format for integers (-Wformat)
  nfctype5: fix returning uninitialized stack value in
    t5_tag_is_ti_pro()
  mifare: use proper format for integers (-Wformat)
  mifare: use unsigned int to suppress compiler -Wstrict-overflow
  p2p: use proper format for integers (-Wformat)
  npp: use proper format for integers (-Wformat)
  device: use proper format for integers (-Wformat)
  manager: use proper format for integers (-Wformat)
  netlink: use proper format for integers (-Wformat)
  gdbus: annotate printf-like functions as accepting format
  snep-send: fix near_ndef_message memory leak
  tag: use proper format for integers (-Wformat)
  tag: do not open-code freeing ndef message
  snep: do not open-code freeing ndef message
  snep: remove useless NULL-ify of local pointer variable
  snep: fix double free of GSList
  snep: fix fragmented response memory leaks
  unit: use g_assert_cmpstr()
  unit: use g_assert_cmpint() and g_assert_cmpuint()
  unit: fix recv() and send() return types
  unit: use g_assert_null()
  unit: use g_assert_cmpmem()
  unit: use proper pointer to uint8_t in test_snep_read_recv_fragments()
  unit: do not shadow global 'text' variable (-Wshadow)
  unit: do not shadow global 'uri' variable (-Wshadow)
  unit: use proper format for integers (-Wformat)
  unit: fix memory leaks in test-ndef-parse
  unit: do not open-code freeing ndef message
  unit: fix memory leaks in test-ndef-build
  unit: fix memory leaks in test-snep-read error paths
  unit: fix record memory leak in test-snep-read
  unit: fix records GList memory leak in test-snep-read
  unit: do not pass NULL to memcpy()
  unit: do not search for headers locally where they do not exist
  unit: remove duplicated invalid definitions in test-snep-read
  unit: remove duplicated definitions in test-ndef-parse
  unit: add few asserts in test-snep-read
  HACKING: refine required packages
  build: fix setting CFLAGS on dash shell (Alpine Linux)
  build: add more compiler warnings
  build: enable -Wshadow and -Wformat-signedness compiler warnings
  build: enable -Wformat=2 warnings
  build: enable -Wunsafe-loop-optimizations and -Wstrict-overflow=2
    warnings
  build: fix missing usage of PIE check result
  build: add support for GCC sanitizers (asan, lsan and ubsan)
  AUTHORS: Mention Krzysztof Kozlowski's contributions

 AUTHORS                     |   1 +
 HACKING                     |  27 ++--
 Makefile.am                 |   2 +-
 NEWS                        |   0
 accflags.m4                 |  52 +++++++
 acinclude.m4                |  44 ++++--
 configure.ac                |  52 ++++++-
 gdbus/gdbus.h               |  15 +-
 gdbus/object.c              |  22 +--
 include/ndef.h              |   1 +
 plugins/mifare.c            |  14 +-
 plugins/nfctype2.c          |  12 +-
 plugins/nfctype3.c          |   2 +-
 plugins/nfctype5.c          |   8 +-
 plugins/npp.c               |   2 +-
 plugins/p2p.c               |   4 +-
 se/ace.c                    |  64 ++++++---
 se/apdu.c                   |   8 +-
 se/plugins/nfc.c            |   8 +-
 se/plugins/tizen.c          |   2 +-
 se/se.c                     |   6 +-
 se/seel.h                   |   2 +-
 src/adapter.c               |  41 +++---
 src/bluetooth.c             |   4 +-
 src/dbus.c                  |   2 +-
 src/device.c                |   6 +-
 src/manager.c               |   4 +-
 src/ndef-private.h          | 140 ++++++++++++++++++
 src/ndef.c                  | 217 ++++++----------------------
 src/netlink.c               |  16 +--
 src/snep.c                  |  14 +-
 src/tag.c                   |  14 +-
 tools/nciattach.c           |  10 +-
 tools/nfctool/adapter.c     |  20 +--
 tools/nfctool/adapter.h     |   2 +-
 tools/nfctool/llcp-decode.c |   4 +-
 tools/nfctool/main.c        |  30 ++--
 tools/nfctool/sniffer.c     |  10 +-
 tools/snep-send.c           |   2 +
 unit/test-ndef-build.c      |  24 ++--
 unit/test-ndef-parse.c      | 278 +++++++++++-------------------------
 unit/test-snep-read.c       | 117 ++++++++-------
 unit/test-utils.c           |   8 --
 unit/test-utils.h           |  83 +----------
 44 files changed, 691 insertions(+), 703 deletions(-)
 delete mode 100644 NEWS
 create mode 100644 accflags.m4
 create mode 100644 src/ndef-private.h

-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
