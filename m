Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB22C3DFD1E
	for <lists+linux-nfc@lfdr.de>; Wed,  4 Aug 2021 10:43:09 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 3C77E100EBBDD;
	Wed,  4 Aug 2021 01:43:08 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 02DC4100EBBAF
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 01:43:06 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 039203F07A
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 08:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1628066585;
	bh=ve8h/pj4WGgSIgCqTqe8kdgKuAcgevVQbzDaui3eA9A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=tG7ykmBexhFzu4hLT+B8vVTO8xJiv54fssuf7F60/XQ4fPErnogTZxZY21JwtSqNx
	 0T2r6R9wDAge8AXDak3f0zd7zn3Qr4AcuPNVcW1qenfcdAUtzESsQka9ert8qO+3H3
	 P/CG9xNhk/MOmOmiBMmqA2U6/OlI/enI/Wddz9WqUN/SW4QdFHc17CZZHhVdeW2wR1
	 CAxnP0H1TgXG8NL47sIxroFkgSX0GUyxZpUyRu6wvmIuKF9WZuIIg9atUrxaEKnjzQ
	 yS1JHfwEVWymC1kdTm1dcn71VIbGz34vp2wVlcz9VfLnH0N5VzSwlZljjvMREfuHxu
	 SAghcejwH5PxA==
Received: by mail-ed1-f70.google.com with SMTP id y22-20020a0564023596b02903bd9452ad5cso1081345edc.20
        for <linux-nfc@lists.01.org>; Wed, 04 Aug 2021 01:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ve8h/pj4WGgSIgCqTqe8kdgKuAcgevVQbzDaui3eA9A=;
        b=FTdKHvsFV87LVFiRe/w+ebe/qOzkx9rHPQZ4cI9pNylIEPxNpZ46PN/AnAaPEJY9j0
         yVuPGL4bEgxfvJ+UNzeiOlQz2fH3sOvzQuwCEZfN2jeWZnBa3ahhgqscijb6dwFvvjas
         OzgdClcguJ8qQ+8Ys3J/HLzi5yKj+0rrVn0iM7bqC0RJf3oNUiVKeYH85yIWfICNjWMy
         TTnbyagqNXhSrsMniAMa21ybu6wyOLIR2fRad7cRSnRCPHryP91GGfgcO9WFoR4CJ/Ld
         dt4aTKLrshNOIUWGskkfMPMaVtL+r+41WOT212p0p1aA0UDpE5r+SJDU6tiaKiuLVLTL
         kv/w==
X-Gm-Message-State: AOAM531LiSxtVrdX5l7nPCZgF+yXPjVTVPS3oMi0cfVYd1bxcpEQ4g+d
	trHozVFpqunpBBgFG26wdxbx/HzyPGj0mtoZtOGHqCC6SLbETig6rwPIAShuzf6ApPMZ/31X0bQ
	ny+8c0eEThCBdOOcQMvTHHJM/CtW4D2nnrA==
X-Received: by 2002:a17:907:2bd0:: with SMTP id gv16mr25755710ejc.49.1628066584507;
        Wed, 04 Aug 2021 01:43:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzw8oua+NAppyUVO9l1pkKerM0zitCFYI2lJRsKaAE3lAgJOYs1Bs+51/II8b0NMcnz/lG98A==
X-Received: by 2002:a17:907:2bd0:: with SMTP id gv16mr25755707ejc.49.1628066584366;
        Wed, 04 Aug 2021 01:43:04 -0700 (PDT)
Received: from localhost.localdomain ([86.32.43.172])
        by smtp.gmail.com with ESMTPSA id lw22sm459968ejb.74.2021.08.04.01.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 01:43:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed,  4 Aug 2021 10:42:07 +0200
Message-Id: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Message-ID-Hash: ATXZBZOB2RME42U3MNLIUPS3WZU6RSTH
X-Message-ID-Hash: ATXZBZOB2RME42U3MNLIUPS3WZU6RSTH
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 00/11] CI under Github
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ATXZBZOB2RME42U3MNLIUPS3WZU6RSTH/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Add a Continuous Integration builds under Github (with its Actions) to
build and unit test on several configurations.

Changes since v1 [1]:
1. Rebase on latest master.
2. Remove CI-unrelated patches from this set.
3. Add CodeQL analysis.
4. Add builds and tests with GCC sanitizers.
5. Use matrix to extend the build configuration.

[1] https://lore.kernel.org/linux-nfc/20210710033859.3989-1-krzysztof.kozlowski@canonical.com/


Best regards,
Krzysztof


Krzysztof Kozlowski (11):
  ci: add GitHub actions for building
  bootstrap: parse CROSS_COMPILE and set proper configure option
  ci: add clang builds
  ci: add building without maintainer options
  ci: be verbose when building
  ci: add more build configurations (Fedora, Alpine, Debian,
    cross-compile, i386)
  ci: run unit tests
  ci: add build with sanitizers (asan, lsan and ubsan)
  ci: add CodeQL static analysis
  ci: print configure logs on failures
  ci: use matrix instead of duplicating each build configuration

 .github/workflows/ci.yml              | 255 ++++++++++++++++++++++++++
 .github/workflows/codeql-analysis.yml |  45 +++++
 bootstrap-configure                   |   6 +
 ci/alpine.sh                          |  42 +++++
 ci/debian.cross-compile.sh            |  41 +++++
 ci/debian.i386.sh                     |  32 ++++
 ci/debian.sanitizers.sh               |  18 ++
 ci/debian.sh                          |  41 +++++
 ci/fedora.sh                          |  33 ++++
 ci/ubuntu.cross-compile.sh            |   1 +
 ci/ubuntu.i386.sh                     |   1 +
 ci/ubuntu.sanitizers.sh               |   1 +
 ci/ubuntu.sh                          |   1 +
 13 files changed, 517 insertions(+)
 create mode 100644 .github/workflows/ci.yml
 create mode 100644 .github/workflows/codeql-analysis.yml
 create mode 100755 ci/alpine.sh
 create mode 100755 ci/debian.cross-compile.sh
 create mode 100755 ci/debian.i386.sh
 create mode 100755 ci/debian.sanitizers.sh
 create mode 100755 ci/debian.sh
 create mode 100755 ci/fedora.sh
 create mode 120000 ci/ubuntu.cross-compile.sh
 create mode 120000 ci/ubuntu.i386.sh
 create mode 120000 ci/ubuntu.sanitizers.sh
 create mode 120000 ci/ubuntu.sh

-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
