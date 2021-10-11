Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6A2428E2F
	for <lists+linux-nfc@lfdr.de>; Mon, 11 Oct 2021 15:39:24 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 194D0100F3FA6;
	Mon, 11 Oct 2021 06:39:22 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 47841100F3FA0
	for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 06:39:17 -0700 (PDT)
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5948A40000
	for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 13:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633959555;
	bh=tIWsei9VtLBv9/Mx8g5CaNZvn00Tm6hK0YRULa+amvI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=KwqJl/vUIC1mQM/AKpaSxS6OWhGw2lIMBy5l2BkvFH8wOVYKNAp0QNns0IANJSuIK
	 xPwad4y0pCLWlmG3WpdaW/+pxQChiufzSd+jQlFTbhzuYWhhWwuzAKXpnPxDys6rJA
	 3B2ncn2vZsMiZmM8G3RTPbdD2xMZmQOR/vQzs/E7hBbeVT4tmdlEPqYnSU/zkKjPFw
	 kMnNpvCws5DmzgO093uRDGpg7sRgcUYZrVXY6MjHUCOxv7HjhXl8VmZFYtEgUGQ23+
	 DtArbIycDDxfW4fUB5ziqXLh/8jPdgxxQ7tCatyVlL2tXbT9yJMZRj0rJAP/TppZ0M
	 06dznc/3lIopw==
Received: by mail-lf1-f72.google.com with SMTP id c6-20020a05651200c600b003fc6d39efa4so12798119lfp.12
        for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 06:39:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tIWsei9VtLBv9/Mx8g5CaNZvn00Tm6hK0YRULa+amvI=;
        b=PN4eKfa00BW3zWHJjGdfGLJlv4eKJ4QUawb/4NgwFkWcLfX66PjiNBIZYGMi6czjGJ
         GtWX8uLTGr/mqeCzaK+sUP8PuPOX4OPPSoT/J9t9pU6D2o0IsD1mMr2C8FrKPKZ9A1gH
         hIA4hrWIpoL3KUZnFym+yHQZsgkGcjRF0VMpQJWJOQG4prASydHjSa5Y9VuTWAmhepUJ
         SCe8T5bCGZ6Ta8qClY8OKxwbeTsOfKPwNq5DfylF6N7u6nE12ibZvpm/cJadqGbDE2tM
         6Q/esN50yEUfSoMWxYbD+U0f+QS2Wi218OLOH13nw9D6119qy9jMjcDejz9bavURRxjF
         eaRw==
X-Gm-Message-State: AOAM533FU7pdfTSc4HtHSMLdJYC7qcnGdaCpCSDWJTwRFzMMQHhWwYWx
	jUqTRkW2rkQ0ZSgg8+7za4M9qXX9v34DUKznW2COr3kli0WVKp3pbHQK/cgat+AcUBvmYYgqhtx
	nnlTXdi1STzVHgduhHUYSgkyOcwQxgIW6xw==
X-Received: by 2002:a2e:9aca:: with SMTP id p10mr7366421ljj.2.1633959554812;
        Mon, 11 Oct 2021 06:39:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzijV8Dsmu1SXjyWeKKz8IEYUPu1ARW5pZYtMPBGBW0/V8SedfqGjcmq4Og0JRM9nXpPz4tug==
X-Received: by 2002:a2e:9aca:: with SMTP id p10mr7366352ljj.2.1633959554204;
        Mon, 11 Oct 2021 06:39:14 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a21sm738971lff.37.2021.10.11.06.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 06:39:13 -0700 (PDT)
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
Date: Mon, 11 Oct 2021 15:38:28 +0200
Message-Id: <20211011133835.236347-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Message-ID-Hash: HMCFM6Q3GQDHPHB3XD3OLWROO4B6E3UF
X-Message-ID-Hash: HMCFM6Q3GQDHPHB3XD3OLWROO4B6E3UF
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: joe@perches.com
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v3 0/7] nfc: minor printk cleanup
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/HMCFM6Q3GQDHPHB3XD3OLWROO4B6E3UF/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,


Changes since v2:
1. Correct SPDX license in patch 2/7 (as Joe pointed out).

Changes since v1:
1. Remove unused variable in pn533 (reported by kbuild).

Best regards,
Krzysztof

Krzysztof Kozlowski (7):
  nfc: drop unneeded debug prints
  nfc: nci: replace GPLv2 boilerplate with SPDX
  nfc: s3fwrn5: simplify dereferencing pointer to struct device
  nfc: st-nci: drop unneeded debug prints
  nfc: st21nfca: drop unneeded debug prints
  nfc: trf7970a: drop unneeded debug prints
  nfc: microread: drop unneeded debug prints

 drivers/nfc/microread/i2c.c    |  4 ----
 drivers/nfc/microread/mei.c    |  2 --
 drivers/nfc/s3fwrn5/firmware.c | 29 +++++++++++------------------
 drivers/nfc/s3fwrn5/nci.c      | 18 +++++++-----------
 drivers/nfc/st-nci/i2c.c       |  4 ----
 drivers/nfc/st-nci/ndlc.c      |  4 ----
 drivers/nfc/st-nci/se.c        |  6 ------
 drivers/nfc/st-nci/spi.c       |  4 ----
 drivers/nfc/st21nfca/i2c.c     |  4 ----
 drivers/nfc/st21nfca/se.c      |  4 ----
 drivers/nfc/trf7970a.c         |  8 --------
 net/nfc/hci/command.c          | 16 ----------------
 net/nfc/hci/llc_shdlc.c        | 12 ------------
 net/nfc/llcp_commands.c        |  8 --------
 net/nfc/llcp_core.c            |  5 +----
 net/nfc/nci/core.c             |  4 ----
 net/nfc/nci/hci.c              |  4 ----
 net/nfc/nci/ntf.c              |  9 ---------
 net/nfc/nci/uart.c             | 16 ++--------------
 19 files changed, 21 insertions(+), 140 deletions(-)

-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
