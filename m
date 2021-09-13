Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EBD408CD2
	for <lists+linux-nfc@lfdr.de>; Mon, 13 Sep 2021 15:20:47 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 7A170100EBB72;
	Mon, 13 Sep 2021 06:20:46 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id DDAB6100EBB6F
	for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 06:20:43 -0700 (PDT)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CF1A340258
	for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 13:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631539241;
	bh=q1oAxRnHPjktEWHzE6nf5nzfFGa2oa1TQ40ADKZqt7E=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=aRcZGPEKgySaylI75jb8nJAkdGYSIxPfpVOl9Ds0/jKcQI7AEJ66R6q8WqVGM4PB0
	 tgPEA8wfYI3/UrFWnrbKXJdBTMpIjp0cdtEDkxbLhp9a2jg9FvyeKUqI25jQ63X6LB
	 l4OAFyFuK85269qiQ0YW99a3IK9zgYt4c7abaDDKrdCEgIiOhDKJE80HmV0a1OrrUo
	 8qAfqa/8KPLjCF+hqSMGtkMo4JnLvx/95TRbQ0HM4/87futXm2xLbmOoBjnZvuWcFn
	 o3VBs70swyVj+L+u8clnhUtXqfNkoSPz2zrl57+nkaRbyMo5r8Hgo6D27abp+2Fxs8
	 q+nv3UoZ2jsHA==
Received: by mail-wr1-f69.google.com with SMTP id u30-20020adfa19e000000b00159aba4fe42so2658820wru.9
        for <linux-nfc@lists.01.org>; Mon, 13 Sep 2021 06:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q1oAxRnHPjktEWHzE6nf5nzfFGa2oa1TQ40ADKZqt7E=;
        b=lzOq/TgJ93MsHOlZA9hercQb+jt52FCkGDUEH4g+ybTns42onAq1ds5UHj56V/6PQs
         EgN64/7mVbgdOsOFoaha6/QCaltkTQBzOOMYjvQ5fCgFufouPEbzhvfZp2d3Hi+HwbIV
         N6pjtB+6RDsQZlHG43NxKGcD4hJ1azdbEb3HnEXjKJSTpWfD1OS3aBG+yibmVFNCNn/V
         eGncG/jygwoEN4S3ALCApTjRAC7Mse+xzzM6tdd1MIBbvy0vB+oGR/23K6zn6KNTDpzD
         AIUFX5J6UsrER+tXnPD6RDQRs7lxxRlrUCkFenlx5xetxOR8/G1nEUruK7QGLVl20Bcw
         tj0A==
X-Gm-Message-State: AOAM533Q6A/imarEk1MFFGCuxRX61U4rgIIU2hw2dak5oSxb0lpt0UAm
	WGx90SaYwGvPjkjz0Ft28wGnEDZ8QLenL94/oayE3mWpY4BSQn4n7f2jlQi3TIha7UE8nzMdbOe
	ZF7WSAc3KFKt3XKqzA38kJIvdbK8khm1cTw==
X-Received: by 2002:a5d:6792:: with SMTP id v18mr12575288wru.416.1631539241484;
        Mon, 13 Sep 2021 06:20:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTOtZe+s81L7x4FZ5sAOlsPP679r7GY65Ei3OGctm0ZlMIdQFVPXzyTPmiKUdFX6lmNBgSKQ==
X-Received: by 2002:a5d:6792:: with SMTP id v18mr12575229wru.416.1631539241031;
        Mon, 13 Sep 2021 06:20:41 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id n3sm7195888wmi.0.2021.09.13.06.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:20:40 -0700 (PDT)
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
Date: Mon, 13 Sep 2021 15:20:20 +0200
Message-Id: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Message-ID-Hash: X5DJX4TQOO2T4ADKTNJEOSVDQSR2JSDI
X-Message-ID-Hash: X5DJX4TQOO2T4ADKTNJEOSVDQSR2JSDI
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 00/15] nfc: minor printk cleanup
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/X5DJX4TQOO2T4ADKTNJEOSVDQSR2JSDI/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Changes since v1:
1. Remove unused variable in pn533 (reported by kbuild).

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
 drivers/nfc/pn533/i2c.c        |  4 ----
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
 24 files changed, 34 insertions(+), 175 deletions(-)

-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
