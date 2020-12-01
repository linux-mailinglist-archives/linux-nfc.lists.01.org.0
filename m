Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBE12CA44B
	for <lists+linux-nfc@lfdr.de>; Tue,  1 Dec 2020 14:51:06 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 8C697100EC1DC;
	Tue,  1 Dec 2020 05:51:05 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id CCC79100EC1DA
	for <linux-nfc@lists.01.org>; Tue,  1 Dec 2020 05:51:02 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id b6so1148848pfp.7
        for <linux-nfc@lists.01.org>; Tue, 01 Dec 2020 05:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=tgdnxgocJilBY0LIhoWcqqg7xNfqmOppZMkE2HBCVKI=;
        b=q9rPszauSvPYTj6Zxwu//UCEY08rpQ1WLsFJNjxu4NKuq/MiWShM3gzeAK45G/a+Ic
         xoqBuXphnuCqDkaDv6kvN0pUeiL5tPgW7Dw0SOjxm9/QJA6I40ggJUrtXoJrYCIVNHhG
         +Uq2m1v23/LwOZOtsds825+rvIAOQP5tU5WDkBZf4e2BdG3hvg/p3Wbmk6jH61ehLnXA
         jgEMNZH36v2AoadPXROAVCxQe/AAJ5E5DVArkSthPvqLXpHJ1kUduDAw7/VgQDFsIlwX
         Lvb4snAyPm3wMLZ3xSKZQwfSIqwDaAZQ+Vuk9R/oDYtwKayvMr7KtK0gdnH/J35EYwEQ
         qe7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=tgdnxgocJilBY0LIhoWcqqg7xNfqmOppZMkE2HBCVKI=;
        b=qsrjblwFBzwBVpXjsgCHSuvUZoGA/gw6LSuuxaQOnue2ZN8MdtV+GIKawd8qkAEfw8
         ZBqTR+TPsz6RvplTieSLZUyIyIFSLihX8rNCiunSuAV/5wqdcypr9VKQDBM98VMsr1mT
         anYyuLxB0dsXfNqN3yE+0WnZGffhsdgzSunLRUxV3X7IutOMH7g73GcpmuVIHGllP4JT
         eYL5PdrY7auIJR538tPbUEraDKGXrSwE5LHnvJ2l3DjSlnzWf81KkZlMjOGlcDCXj54r
         0Vjz9NPat7ogc3lE6SVn3aZ03QTruq1ePdFWEoU3KKU3VP6sPzA5NWyMrbJTp5+oSt7K
         qyew==
X-Gm-Message-State: AOAM531mi6DqDehOQsK0LOr0q76C18QScY+Ow3wGXwER2p5T3n+DuIcr
	c8AlZp11+nU0C80E66c7uC8=
X-Google-Smtp-Source: ABdhPJyb96I51/Z0DlMUwhMsHbFNnUIGGUG7H/1FKq0F9CdCuh8yziVK+k3DqasdNev6gR496AefBg==
X-Received: by 2002:a63:2351:: with SMTP id u17mr2349405pgm.72.1606830662385;
        Tue, 01 Dec 2020 05:51:02 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id z22sm3134111pfn.153.2020.12.01.05.50.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Dec 2020 05:51:01 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: krzk@kernel.org
Date: Tue,  1 Dec 2020 22:50:24 +0900
Message-Id: <1606830628-10236-1-git-send-email-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 1.9.1
Message-ID-Hash: DX5AK22EWJXOGNHBJDLIM5G4OTLNOW5O
X-Message-ID-Hash: DX5AK22EWJXOGNHBJDLIM5G4OTLNOW5O
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v4 net-next 0/4] nfc: s3fwrn5: Support a UART interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/DX5AK22EWJXOGNHBJDLIM5G4OTLNOW5O/>
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

 .../bindings/net/nfc/samsung,s3fwrn5.yaml          |  32 +++-
 drivers/nfc/s3fwrn5/Kconfig                        |  12 ++
 drivers/nfc/s3fwrn5/Makefile                       |   4 +-
 drivers/nfc/s3fwrn5/i2c.c                          | 117 ++++--------
 drivers/nfc/s3fwrn5/phy_common.c                   |  75 ++++++++
 drivers/nfc/s3fwrn5/phy_common.h                   |  37 ++++
 drivers/nfc/s3fwrn5/uart.c                         | 196 +++++++++++++++++++++
 7 files changed, 391 insertions(+), 82 deletions(-)
 create mode 100644 drivers/nfc/s3fwrn5/phy_common.c
 create mode 100644 drivers/nfc/s3fwrn5/phy_common.h
 create mode 100644 drivers/nfc/s3fwrn5/uart.c

-- 
1.9.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
