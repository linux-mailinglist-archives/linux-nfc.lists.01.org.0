Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D0C3DBAD2
	for <lists+linux-nfc@lfdr.de>; Fri, 30 Jul 2021 16:42:18 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 3F3DE100EB842;
	Fri, 30 Jul 2021 07:42:17 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 0531D100EB82A
	for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 07:42:13 -0700 (PDT)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 039A03F22C
	for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 14:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627656132;
	bh=wofNY4jh0EeYONXo5ssRVDRpz3oYBXrS11XkjMwqwQw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=shizGJAepL+li6gK6GD9YZpCsQqe21Xo5dDoFaF2Pm50KGSNjR258evQYuu4xsPTg
	 ky5nn/yz4CXamhwS7kU9McsJYunGXbt6XX7VNvflqCTDRtq6ouUIXQTHtNwp93nlc/
	 668Vn+pERI7/i/8N19WRCOo/QVmlUHkOuNEyFvWeWaRleXMuby80ucE2XFoZlSaxAc
	 EwGpWYPeJzW1rQuUYNH37/KQNH9Ci5WbetkDjhHk+dbfZyja2md933z9vz+fXvitHv
	 FWgnKkR8AUO9fR7krmn4Sc0ELELJ7+z/wP+NY7l0Xt5CEjJrx985FBffcZl5XJ9hRE
	 6l9aXZOk3osfA==
Received: by mail-ej1-f72.google.com with SMTP id o16-20020a1709066010b0290593804ff1e1so1530010ejj.19
        for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 07:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wofNY4jh0EeYONXo5ssRVDRpz3oYBXrS11XkjMwqwQw=;
        b=ldXodEulEsNvvARkayW3dwlIbsEdWgOQnhrBzH6goLg7r0l5mSmj5DhA0Crn07zR/p
         fEOS59X5OTfaApsr4eIG9BcC8hQxxtVof3cx/1rmCqnXRRnIO9mkLmMQWYR3/519KrJt
         f79e300dgj2+qpZrdNj9IXNhgqotM/WVxWpQ7F7nsILUED39fL94kbpcNz4ea1QuN2LM
         2wVqY529BhJdTkA0jJHO7+k0IG01GR7cxbaYU/88kUJ1ssd46May47rsrdrgDSADIcTn
         QkAYc3nCBrSQAHTYvR/z3HDWYosjOsduWnEfAfc7gkWzIR1gGB065Osd5wP2rqy5aA9U
         deLw==
X-Gm-Message-State: AOAM533277Idv/8Dgd8BplSpSklVMhdDJSUq9lzfXLXXc/lvH0ilgMuK
	UP4ZIm/GTahKEu3IRw7Bo1Wm493EClHplc7RW3dJa6x83oSJbjpcHgp5vExZhYBOehyJ1wtBH5f
	wMemk0mPOfyOkF3tw8iDL7dZNagThBbbMxQ==
X-Received: by 2002:a17:907:6218:: with SMTP id ms24mr2871039ejc.367.1627656131223;
        Fri, 30 Jul 2021 07:42:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxo7sQHS6Q74F1QUHjdt7MuN7lL1fXicUfjd5B60lldUBFvvc3BbXXsh7pFKlQqUeqpAPjfGQ==
X-Received: by 2002:a17:907:6218:: with SMTP id ms24mr2871028ejc.367.1627656131029;
        Fri, 30 Jul 2021 07:42:11 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id z8sm626325ejd.94.2021.07.30.07.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:42:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 30 Jul 2021 16:41:55 +0200
Message-Id: <20210730144202.255890-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Message-ID-Hash: WUGOZ5YPMIQT3NZBBDDFV5TJTP6MY2RZ
X-Message-ID-Hash: WUGOZ5YPMIQT3NZBBDDFV5TJTP6MY2RZ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v3 0/7] nfc: constify pointed data - missed part
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/WUGOZ5YPMIQT3NZBBDDFV5TJTP6MY2RZ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

This was previously sent [1] but got lost. It was a prerequisite to part two of NFC const [2].

Changes since v2:
1. Drop patch previously 7/8 which cases new warnings "warning: Using
   plain integer as NULL pointer".

Changes since v1:
1. Add patch 1/8 fixing up nfcmrvl_spi_parse_dt()

[1] https://lore.kernel.org/lkml/20210726145224.146006-1-krzysztof.kozlowski@canonical.com/
[2] https://lore.kernel.org/linux-nfc/20210729104022.47761-1-krzysztof.kozlowski@canonical.com/T/#m199fbdde180fa005a10addf28479fcbdc6263eab

Best regards,
Krzysztof

Krzysztof Kozlowski (7):
  nfc: mrvl: correct nfcmrvl_spi_parse_dt() device_node argument
  nfc: annotate af_nfc_exit() as __exit
  nfc: hci: annotate nfc_llc_init() as __init
  nfc: constify several pointers to u8, char and sk_buff
  nfc: constify local pointer variables
  nfc: nci: constify several pointers to u8, sk_buff and other structs
  nfc: hci: cleanup unneeded spaces

 drivers/nfc/nfcmrvl/spi.c  |  2 +-
 drivers/nfc/pn544/pn544.c  |  4 +-
 include/net/nfc/nci_core.h | 14 +++---
 include/net/nfc/nfc.h      |  4 +-
 net/nfc/af_nfc.c           |  2 +-
 net/nfc/core.c             |  6 +--
 net/nfc/hci/core.c         |  8 ++--
 net/nfc/hci/llc.c          |  2 +-
 net/nfc/hci/llc_shdlc.c    | 10 ++---
 net/nfc/llcp.h             |  8 ++--
 net/nfc/llcp_commands.c    | 46 +++++++++++---------
 net/nfc/llcp_core.c        | 44 ++++++++++---------
 net/nfc/nci/core.c         | 48 +++++++++++----------
 net/nfc/nci/data.c         | 12 +++---
 net/nfc/nci/hci.c          | 38 ++++++++---------
 net/nfc/nci/ntf.c          | 87 ++++++++++++++++++++------------------
 net/nfc/nci/rsp.c          | 48 +++++++++++----------
 net/nfc/nci/spi.c          |  2 +-
 net/nfc/netlink.c          |  2 +-
 net/nfc/nfc.h              |  2 +-
 20 files changed, 206 insertions(+), 183 deletions(-)

-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
