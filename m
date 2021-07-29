Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C8A3DA134
	for <lists+linux-nfc@lfdr.de>; Thu, 29 Jul 2021 12:40:42 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 19EAA100EBB6A;
	Thu, 29 Jul 2021 03:40:40 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id C696E100EBBC0
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:40:37 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 136E13F114
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 10:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627555234;
	bh=U5ZMYZkwqc8RmbQysqq1OTMd/Wgw4WsrTPEA4vYur0c=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=O3jOQYFY6dqrgjVdVuQL9e6Sc0FfoF5VGfll05AhWptCMRmmIBbiGuenWnfO1VrK0
	 Jhdyo5J2n6plCcNoZ7kBC7lGi1z0eCy7lKMkDOxQQaeKalVUsSyHNLUFqWJqb8yWi6
	 aS0IL8ag7MPLBlBDgyzrQN+IfJBcFOGB/M88dUr0KtNvU+70XhQOw5WeNzb/KDdvta
	 W6H7d+1eYYZ1NqzkpravJ0trzDRCE4ewXtuv2JugzqYJbWKWHc1mMQE8vdPP/f0Yhi
	 XejWQkkWi+kMjq1Q3E2K4TTKgx7DUBJoCzQZHSicdVeDtFU+v4gtFhIbDTU8kPmb99
	 eNUqpdbFD5raw==
Received: by mail-ed1-f70.google.com with SMTP id y39-20020a50bb2a0000b02903bc05daccbaso2742216ede.5
        for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U5ZMYZkwqc8RmbQysqq1OTMd/Wgw4WsrTPEA4vYur0c=;
        b=nXbEd1G1iN4joQ7zHyx8Y75zvclKbP0Ak/EX250YhqLNKovZY8wVfQ7IuOFP+kqGTh
         EnN5D3fwvnweKS6rEHg5enXYq3xmVyqIGW4IWtG3nXD5dh+Oh8Yx0gSxS8ZHts50ZHzU
         dkoMYGYPkZCYRtPiwMzE0s1tjpGt9sUqfd5l7gKfB8XvifMHpsXihZ64o+irFsta3vCH
         6B32Csg1DddkgqhlRmOZUarYYaF/E9Imk3Jir1nIc/QEBXfswX+AMVFaDF9AmPy/mOBl
         b/nkpgmSqw2iufpGaqJR1r87DcolMe+V2VK3rN5RGf74TbqduWpEN+KMD5hpbBFzTbYW
         H9nw==
X-Gm-Message-State: AOAM533krTQ93yRuEACm6buzENLERD2WW4Qftmgn9jwjsYT3Qtpe2QQx
	cJOekvsWDQbhzxrYhgwN68wqwM/WAJr2WR+eeSRAz+I8RpMvr8dor9vCtLuck5WQ+8AqjHNroRX
	4vm7irXkXte5OL47weKJxRFh2JMkZMCI43w==
X-Received: by 2002:a05:6402:278e:: with SMTP id b14mr5191746ede.277.1627555233821;
        Thu, 29 Jul 2021 03:40:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0zzZMt4FRxj6/pkKudrZrKtAC8UcrWt1V+5uDuEVakkenlwbpg5EabX2DWunH4RtcpYeAvw==
X-Received: by 2002:a05:6402:278e:: with SMTP id b14mr5191710ede.277.1627555233472;
        Thu, 29 Jul 2021 03:40:33 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id c14sm824475ejb.78.2021.07.29.03.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 03:40:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Bongsu Jeon <bongsu.jeon@samsung.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Date: Thu, 29 Jul 2021 12:40:10 +0200
Message-Id: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Message-ID-Hash: DGP33XQYB6QALIIK3XZII6P4XXDCMPVL
X-Message-ID-Hash: DGP33XQYB6QALIIK3XZII6P4XXDCMPVL
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 00/12] nfc: constify, continued (part 2)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/DGP33XQYB6QALIIK3XZII6P4XXDCMPVL/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

On top of:
nfc: constify pointed data
https://lore.kernel.org/lkml/20210726145224.146006-1-krzysztof.kozlowski@canonical.com/

Best regards,
Krzysztof


Krzysztof Kozlowski (12):
  nfc: constify passed nfc_dev
  nfc: mei_phy: constify buffer passed to mei_nfc_send()
  nfc: port100: constify several pointers
  nfc: trf7970a: constify several pointers
  nfc: virtual_ncidev: constify pointer to nfc_dev
  nfc: nfcsim: constify drvdata (struct nfcsim)
  nfc: fdp: drop unneeded cast for printing firmware size in dev_dbg()
  nfc: fdp: use unsigned int as loop iterator
  nfc: fdp: constify several pointers
  nfc: microread: constify several pointers
  nfc: mrvl: constify several pointers
  nfc: mrvl: constify static nfcmrvl_if_ops

 drivers/nfc/fdp/fdp.c             | 27 +++++++++++-----------
 drivers/nfc/fdp/fdp.h             |  2 +-
 drivers/nfc/fdp/i2c.c             |  6 ++---
 drivers/nfc/mei_phy.c             |  2 +-
 drivers/nfc/microread/i2c.c       |  2 +-
 drivers/nfc/microread/microread.c |  4 ++--
 drivers/nfc/microread/microread.h |  2 +-
 drivers/nfc/nfcmrvl/fw_dnld.c     | 16 +++++++------
 drivers/nfc/nfcmrvl/i2c.c         |  4 ++--
 drivers/nfc/nfcmrvl/main.c        |  4 ++--
 drivers/nfc/nfcmrvl/nfcmrvl.h     |  6 ++---
 drivers/nfc/nfcmrvl/spi.c         |  6 ++---
 drivers/nfc/nfcmrvl/uart.c        |  4 ++--
 drivers/nfc/nfcmrvl/usb.c         |  2 +-
 drivers/nfc/nfcsim.c              |  2 +-
 drivers/nfc/port100.c             | 37 +++++++++++++++++--------------
 drivers/nfc/trf7970a.c            | 17 +++++++-------
 drivers/nfc/virtual_ncidev.c      |  2 +-
 include/net/nfc/nfc.h             |  4 ++--
 19 files changed, 78 insertions(+), 71 deletions(-)

-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
