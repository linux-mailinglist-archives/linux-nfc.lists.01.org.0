Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D7F2CBBD0
	for <lists+linux-nfc@lfdr.de>; Wed,  2 Dec 2020 12:48:00 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 39BC9100EBBC2;
	Wed,  2 Dec 2020 03:47:59 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 930E4100ED497
	for <linux-nfc@lists.01.org>; Wed,  2 Dec 2020 03:47:57 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id g18so949621pgk.1
        for <linux-nfc@lists.01.org>; Wed, 02 Dec 2020 03:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=91aj9edY77hTt39KhpEZSPjKyf9MNh9XT2J/er9ipzg=;
        b=EZR9E0bgDgWC0etCy8AykgZf4yg9d1q/QNSsUz52oU9csexLmcGiMLbnzBtG2pWJWF
         +Q7h2qXwkUU79wxOwtoB4oeYOLkbrNmhVc9+/UyQKDDD59vZJMMZs8VFxgWRYYB1yCXN
         j4iUS7fW+e3iCsSF3A1uBPY6QMSFhAS8nP8xJjWK1GJuYcusG8jIvKhSFyO0i+MP7LgG
         /866WU6Tr+CDSNNbAj/pEjS4qGB0SPNEgaNdQlwAEeUyaLGvgEJvUNzP11sGidLIJ4AB
         BKEmI5n0wgpBu939mN8jPHAea7ZqzEzyrsMRnOvGlwRjcAsPiNUh4/j1TU2DUdnf5SjO
         ZfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=91aj9edY77hTt39KhpEZSPjKyf9MNh9XT2J/er9ipzg=;
        b=cpkz14iwbyBdJ1ankW3YLGeJGbTGFjwHiy7EFJ9QYZiDdGfYPdxN9gbTDy4nG9KD+H
         hXG6TqZ2NO6B7dLq8g7K7UakfhgUL2fhAFdPMqX5uePZ2e05Siv/hj7n1iMJEfqOtXeb
         szprsEN6HByDXs1WgV8O72Z+dviQvOQjyT3XuRNW2O4p61nMouVRpadEt457Q8eVyO7H
         bdEuu3DUQDCsznQ3DfyctwNyarTzv5r8AU4OHw4kMjEX3HkyHknM6glmrkSNnj7uX1/r
         R+/1ZLfvRX91BP0LoG5h92/NF/tJ1/wa/W3IsqT4sK7EE0Vvt4Tp/0yLn5m6LSMoVso2
         NvHg==
X-Gm-Message-State: AOAM532i3mEpwa9A6TgZhFi1Zle3J5ZjYHg6Ci1/X2RFa1sAyRa38rxb
	PkAA7mY4qm9ZvSt/3/PTukY=
X-Google-Smtp-Source: ABdhPJw6SuIwNlvL71go4Pdz71/9jVaJMw3SD7ij3mF7r4stN98PhXQS7CXU//7s3ABIopmsvoX0vQ==
X-Received: by 2002:a65:6891:: with SMTP id e17mr231710pgt.410.1606909676495;
        Wed, 02 Dec 2020 03:47:56 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id q18sm2108806pfs.150.2020.12.02.03.47.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Dec 2020 03:47:55 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: krzk@kernel.org
Date: Wed,  2 Dec 2020 20:47:37 +0900
Message-Id: <1606909661-3814-1-git-send-email-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 1.9.1
Message-ID-Hash: SXLVM5T4UID7KLAOO3NCM44L2DTJJONF
X-Message-ID-Hash: SXLVM5T4UID7KLAOO3NCM44L2DTJJONF
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v5 net-next 0/4] nfc: s3fwrn5: Support a UART interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/SXLVM5T4UID7KLAOO3NCM44L2DTJJONF/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

S3FWRN82 is the Samsung's NFC chip that supports the UART communication.
Before adding the UART driver module, I did refactoring the s3fwrn5_i2c module 
to reuse the common blocks.

1/4 is the dt bindings for the RN82 UART interface.
2/4..3/4 are refactoring the s3fwrn5_i2c module.
4/4 is the UART driver module implementation.

ChangeLog:
 v5:
   1/4
    - remove the 'items' of the compatible property.
    - change the GPIO flags.
 v4:
   1/4
    - change 'oneOf' to 'items'.
    - fix the indentation.
   2/4
    - add the ACK tag.
   4/4
    - remove the of_match_ptr macro.
 v3:
   3/4
    - move the phy_common object to s3fwrn.ko to avoid duplication.
    - include the header files to include everything which is used inside.
    - wrap the lines.
   4/4
    - remove the kfree(phy) because of duplicated free.
    - use the phy_common blocks.
    - wrap lines properly.
 v2:
   1/4
    - change the compatible name.
    - change the const to enum for compatible.
    - change the node name to nfc.
   3/4
    - remove the common function's definition in common header file.
    - make the common phy_common.c file to define the common function.
    - wrap the lines.
    - change the Header guard.
    - remove the unused common function.

Bongsu Jeon (4):
  dt-bindings: net: nfc: s3fwrn5: Support a UART interface
  nfc: s3fwrn5: reduce the EN_WAIT_TIME
  nfc: s3fwrn5: extract the common phy blocks
  nfc: s3fwrn5: Support a UART interface

 .../bindings/net/nfc/samsung,s3fwrn5.yaml          |  31 +++-
 drivers/nfc/s3fwrn5/Kconfig                        |  12 ++
 drivers/nfc/s3fwrn5/Makefile                       |   4 +-
 drivers/nfc/s3fwrn5/i2c.c                          | 117 ++++--------
 drivers/nfc/s3fwrn5/phy_common.c                   |  75 ++++++++
 drivers/nfc/s3fwrn5/phy_common.h                   |  37 ++++
 drivers/nfc/s3fwrn5/uart.c                         | 196 +++++++++++++++++++++
 7 files changed, 390 insertions(+), 82 deletions(-)
 create mode 100644 drivers/nfc/s3fwrn5/phy_common.c
 create mode 100644 drivers/nfc/s3fwrn5/phy_common.h
 create mode 100644 drivers/nfc/s3fwrn5/uart.c

-- 
1.9.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
