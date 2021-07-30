Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7CF3DB407
	for <lists+linux-nfc@lfdr.de>; Fri, 30 Jul 2021 08:57:04 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id EC34E100EB83E;
	Thu, 29 Jul 2021 23:57:01 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id F3644100EBBDD
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 23:56:59 -0700 (PDT)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 028E93F224
	for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 06:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627628217;
	bh=H0iqXvcx2Sb6gUihpF2rOO1152k8ULgDqjgBbDt6/wQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=dYuns8ivovFvXJQnFGrKvxcvm+J5UA9HHWmKmhDhwpcsES4ccHiemoX5xUQpPerOX
	 YjMzf7ykm4YS9G9K6dWzR/4RW+z6zMgc6YG5csB5l4mZVSnsIOyOAxtcKC7LLEN8+o
	 gkMbvHzd5FE5Khi1tj/pilxPak1a+9MfTpxXSOSWGNyWWphARbRGlHRDeLglVQcvhR
	 c07Mcb6BrWRhsWO6fcZEV0zpgn19huUFh03s59vZX4TZkAaRoWgel/quB2nBvZsPUJ
	 TvZB9AL/zmlHfVXZpj6/L9DveTfKZmljfzcxhbnCFvSokU0nGVMMV7xVSXBFalsyAW
	 wpw+BIzqtAeHw==
Received: by mail-ej1-f70.google.com with SMTP id q19-20020a170906b293b029058a1e75c819so2737886ejz.16
        for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 23:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H0iqXvcx2Sb6gUihpF2rOO1152k8ULgDqjgBbDt6/wQ=;
        b=f6NkBPDlv22u1l+9Zx8x+1LebsZ9oPHh/pvMEz7aYJXv0aidoIPtYLOwxjNVLKHE8I
         YAyAimsDAzxkdLQusc8EH2hrPqxW1fAqi0NVG2/baHe2VZZLEYP+ATMwcDaPHyYRYdUO
         aBi2+xpu+yk1vokqvwJZXHQt0MQZw1Blek2N7LNdfbwU5LJWemfystjYc9q7s/kRDySH
         kfqL/X1wBq+9DhV1AMVWn8X5Sxsjxex6Di0N5HbTedzyh5/XqY59NGUIWmef6pk7fHHU
         5cEcKDKwxiEVe9+NBHvStobx4Gp4m6rBYSUUrImNB6W64nFuAwP5b73TntW0S5vz66lp
         UpxA==
X-Gm-Message-State: AOAM531OQzmVGRhScoMF9BFjI0laOdIxeLqJRkvzpBRVI2dNg1O2KtxH
	uqnyJxzFEJF5cmLb8L63L9RCG2+HZBgZMntceThNYuYIk4XdmlyvfaRbkRPnzOoIMqwBqlhGQ0n
	nVgi25uSbID6jSR+/N0iUa6HeDF3FHFym1Q==
X-Received: by 2002:a17:906:9251:: with SMTP id c17mr1210631ejx.516.1627628216644;
        Thu, 29 Jul 2021 23:56:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdiRODyaxS5ozEQ1SGCvSq92XcTRg9NN5AZlQaqiA2V+ZljzQ10rzB6+WfdmPHGFnit/Pcsw==
X-Received: by 2002:a17:906:9251:: with SMTP id c17mr1210618ejx.516.1627628216466;
        Thu, 29 Jul 2021 23:56:56 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id m9sm238518ejn.91.2021.07.29.23.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 23:56:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 30 Jul 2021 08:56:17 +0200
Message-Id: <20210730065625.34010-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Message-ID-Hash: 2QTDXQ3QOYLJGZGQ7G3Q2DSYZELDIISZ
X-Message-ID-Hash: 2QTDXQ3QOYLJGZGQ7G3Q2DSYZELDIISZ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 0/8] nfc: constify pointed data - missed part
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/2QTDXQ3QOYLJGZGQ7G3Q2DSYZELDIISZ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

This was previously sent [1] but got lost. It was a  prerequisite to part two of NFC const [2].

Changes since v1:
1. Add patch 1/8 fixing up nfcmrvl_spi_parse_dt()

[1] https://lore.kernel.org/lkml/20210726145224.146006-1-krzysztof.kozlowski@canonical.com/
[2] https://lore.kernel.org/linux-nfc/20210729104022.47761-1-krzysztof.kozlowski@canonical.com/T/#m199fbdde180fa005a10addf28479fcbdc6263eab

Best regards,
Krzysztof


Krzysztof Kozlowski (8):
  nfc: mrvl: correct nfcmrvl_spi_parse_dt() device_node argument
  nfc: annotate af_nfc_exit() as __exit
  nfc: hci: annotate nfc_llc_init() as __init
  nfc: constify several pointers to u8, char and sk_buff
  nfc: constify local pointer variables
  nfc: nci: constify several pointers to u8, sk_buff and other structs
  nfc: hci: pass callback data param as pointer in nci_request()
  nfc: hci: cleanup unneeded spaces

 drivers/nfc/nfcmrvl/spi.c  |   2 +-
 drivers/nfc/pn544/pn544.c  |   4 +-
 include/net/nfc/nci_core.h |  18 ++---
 include/net/nfc/nfc.h      |   4 +-
 net/nfc/af_nfc.c           |   2 +-
 net/nfc/core.c             |   6 +-
 net/nfc/hci/core.c         |   8 +--
 net/nfc/hci/llc.c          |   2 +-
 net/nfc/hci/llc_shdlc.c    |  10 +--
 net/nfc/llcp.h             |   8 +--
 net/nfc/llcp_commands.c    |  46 +++++++------
 net/nfc/llcp_core.c        |  44 ++++++------
 net/nfc/nci/core.c         | 134 ++++++++++++++++++-------------------
 net/nfc/nci/data.c         |  12 ++--
 net/nfc/nci/hci.c          |  52 +++++++-------
 net/nfc/nci/ntf.c          |  87 +++++++++++++-----------
 net/nfc/nci/rsp.c          |  48 +++++++------
 net/nfc/nci/spi.c          |   2 +-
 net/nfc/netlink.c          |   2 +-
 net/nfc/nfc.h              |   2 +-
 20 files changed, 255 insertions(+), 238 deletions(-)

-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
