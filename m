Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C98FF402856
	for <lists+linux-nfc@lfdr.de>; Tue,  7 Sep 2021 14:18:29 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id AE7BB100EBB72;
	Tue,  7 Sep 2021 05:18:26 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 623EC100EBB6E
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 05:18:24 -0700 (PDT)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 870E740784
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 12:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631017102;
	bh=YRlo3nZk5ArGV6WwvlTiTe3l09axCD12jul04F8OPD4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=nzJtVJmbtzaqIcDkqC8KMC1uJbexdfbAydVpFsHbABcEbUA1AuqGNaMAyhgcBBbcS
	 7TSFFzaOKRgUBtShpccXsXcLvL3BDWEqgJFWLE3pgTzWYWRU+kleg+cKeYl0KA0CN6
	 qBYzhSUXjzLCSSlFGVCo8Rd6tnZR3HHxiMrVR9x0onW2wXaj4dJBeE5K7OLt6zG84W
	 SSroVuzvxwq+Qevnhgd5k/YtwVjJ+V6vdy7SFJJT+mwhkd/xdFKz/jQZA8lSftv9Me
	 phteiQe+KzXheg4EqTCkXmhZfnetUX4FE0BiDTo7bKS16SqRXvhukh266sBt9aFsex
	 oztXPYn9dpUaQ==
Received: by mail-wm1-f72.google.com with SMTP id m16-20020a7bca50000000b002ee5287d4bfso1029440wml.7
        for <linux-nfc@lists.01.org>; Tue, 07 Sep 2021 05:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YRlo3nZk5ArGV6WwvlTiTe3l09axCD12jul04F8OPD4=;
        b=ntKrXMZYFb//ZeV8XdQOZaUQL5wqSzVhmgq/d8iKPkczvdtQxy1qw8FHTMT9nJAt05
         +pPHMEW3qvh7shUE51v2zFfWwxPtYzmfTTAM73dRtC9kbJtcXzvjQPUg5XYrrUDzKswb
         U1jK4nIvtY1i/C+vJU6Vyl57ioh8Vf/wOn8nr0Yv9UO9lXnKPFeC0B4D5+ftjFBHR6GV
         1+URYhYtEF6kwBsQfh0B7szLjO5MGDqV3C3R3woZXmLSjGhB9sA6iRRIPTxnLSeuQedK
         X+klB+JKGwHatohqC3lPEtjb43kODXCibtfkmdiy/rht1wRZPhOhwAZ6BoJGVXc1DGgo
         29Zw==
X-Gm-Message-State: AOAM533I5PJ59RGmZv5coAyFQlBOOpKSkMMnmHsQrjh1ljY0Yq0g1TxL
	d9ysDjmPRvOdQSnk9miLT7cZeu0HTFieg5vyrVIOpRH6e52Z4kz298+aPUxL8vtZH3wd1XJUyA7
	3kP2Oy6SsPDVTElPW3ifdjlXhqzx/NxmUOg==
X-Received: by 2002:a5d:4043:: with SMTP id w3mr18531837wrp.15.1631017102198;
        Tue, 07 Sep 2021 05:18:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7BsAVATcBM4EgZcgR0syj5gOVbXmAk+X5F/H8PDMeYrVY2fTt9ht8q++8LSzCq0F5JNa9Eg==
X-Received: by 2002:a5d:4043:: with SMTP id w3mr18531794wrp.15.1631017101859;
        Tue, 07 Sep 2021 05:18:21 -0700 (PDT)
Received: from kozik-lap.lan ([79.98.113.47])
        by smtp.gmail.com with ESMTPSA id m3sm13525216wrg.45.2021.09.07.05.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 05:18:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Krzysztof Opasiak <k.opasiak@samsung.com>,
	Mark Greer <mgreer@animalcreek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Date: Tue,  7 Sep 2021 14:18:01 +0200
Message-Id: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Message-ID-Hash: KN66TNPCKKDM2VPK7QSOK36XNHE3JW67
X-Message-ID-Hash: KN66TNPCKKDM2VPK7QSOK36XNHE3JW67
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 00/15] nfc: minor printk cleanup
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/KN66TNPCKKDM2VPK7QSOK36XNHE3JW67/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

No dependencies, patches can be picked up as is.

Best regards,
Krzysztof


Krzysztof Kozlowski (15):
  nfc: drop unneeded debug prints
  nfc: do not break pr_debug() call into separate lines
  nfc: nci: replace GPLv2 boilerplate with SPDX
  nfc: fdp: drop unneeded debug prints
  nfc: pn533: drop unneeded debug prints
  nfc: pn533: use dev_err() instead of pr_err()
  nfc: pn544: drop unneeded debug prints
  nfc: pn544: drop unneeded memory allocation fail messages
  nfc: s3fwrn5: simplify dereferencing pointer to struct device
  nfc: st-nci: drop unneeded debug prints
  nfc: st21nfca: drop unneeded debug prints
  nfc: trf7970a: drop unneeded debug prints
  nfc: microread: drop unneeded debug prints
  nfc: microread: drop unneeded memory allocation fail messages
  nfc: mrvl: drop unneeded memory allocation fail messages

 drivers/nfc/fdp/i2c.c          |  1 -
 drivers/nfc/microread/i2c.c    |  4 ----
 drivers/nfc/microread/mei.c    |  6 +-----
 drivers/nfc/nfcmrvl/fw_dnld.c  |  4 +---
 drivers/nfc/pn533/i2c.c        |  1 -
 drivers/nfc/pn533/pn533.c      |  4 +---
 drivers/nfc/pn544/mei.c        |  8 +-------
 drivers/nfc/s3fwrn5/firmware.c | 29 +++++++++++-----------------
 drivers/nfc/s3fwrn5/nci.c      | 18 +++++++----------
 drivers/nfc/st-nci/i2c.c       |  4 ----
 drivers/nfc/st-nci/ndlc.c      |  4 ----
 drivers/nfc/st-nci/se.c        |  6 ------
 drivers/nfc/st-nci/spi.c       |  4 ----
 drivers/nfc/st21nfca/i2c.c     |  4 ----
 drivers/nfc/st21nfca/se.c      |  4 ----
 drivers/nfc/trf7970a.c         |  8 --------
 net/nfc/hci/command.c          | 16 ----------------
 net/nfc/hci/llc_shdlc.c        | 35 +++++++++-------------------------
 net/nfc/llcp_commands.c        |  8 --------
 net/nfc/llcp_core.c            |  5 +----
 net/nfc/nci/core.c             |  4 ----
 net/nfc/nci/hci.c              |  4 ----
 net/nfc/nci/ntf.c              |  9 ---------
 net/nfc/nci/uart.c             | 16 ++--------------
 24 files changed, 34 insertions(+), 172 deletions(-)

-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
