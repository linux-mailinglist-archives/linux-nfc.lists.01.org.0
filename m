Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4925F2DA83D
	for <lists+linux-nfc@lfdr.de>; Tue, 15 Dec 2020 07:54:28 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id A4C74100EC1FB;
	Mon, 14 Dec 2020 22:54:26 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 49BC8100EC1F5
	for <linux-nfc@lists.01.org>; Mon, 14 Dec 2020 22:54:24 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id x18so4377545pln.6
        for <linux-nfc@lists.01.org>; Mon, 14 Dec 2020 22:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=yqTrtcKq3MfV/8DAfuQcEKoeQF8SszVYywTAk5nC5NQ=;
        b=qo2BsIqXa6VTyiHxrtBXiun73Bd5bRI9jp3kwB1niPJYdTLs2Y2ZWnLjLk1gTcnZik
         AuXqP0i6l3LoG/MuMp7bw9TVnywBWYXfKgLAyEI62yN6P5PsFkpoJdlesF90TlpB9ERX
         K/ulnS1xG49ianhqkJklI9sK8imuVEATUvRW11CUinwVlJ4BrtJGZEvoiZbJtwsZKsOu
         r/c/334o5AXDwC3e6TrTRNmYk4aDDdtRRu2lC1t2BMInkGeajyAEqXPRugoFNJyxFIid
         +YFPOG44Z5SH7IeazvtLl2T+LNzNIlL1eN8MPr38TZCS9yLOolCGFAqa60SbNnwkwiET
         ixUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=yqTrtcKq3MfV/8DAfuQcEKoeQF8SszVYywTAk5nC5NQ=;
        b=qdN949poShnu0sMLuFW5ZUhmlDukkBcAJIHbgxKgL/BTmAlYED5KG0MWwuox1AKft4
         8jHGancX8lqzZ9AKwVXu2cAkfXPuKk3BXHKzshW9LBFECp4laQVtn8/o+FjAykVPK+AZ
         tICuneUYIN5Xc9fn7ESprpWmmHLZtTA8S9cmddUOuQrQsFU6TBEphAbiX1tQ92Bw42hF
         QoOOcXi1/ySZBJUpcyBnL56mtxaIAKHEcL722J62679U6F+gJ+LAukENUTSgBsIu2Chv
         zZUbK09WzyixLnQzlXeLgT0BZwbwX4DPw5TctSp7j8shLR5wMZUC3wGj3HA+mgcggte0
         Bpqw==
X-Gm-Message-State: AOAM531tF755X0p+ZwpOl+XiBfDl0EbFuk561EviDq3vyaaQba0XzqqP
	863hlAdzDhbP6LERiHsEqJM=
X-Google-Smtp-Source: ABdhPJwmKRbPnTOtBnS4zIqc7wIG/iMfiDU8tnyX+78Bx/n5YnqdDKdNSubviPrGhjNopb0ccNisuA==
X-Received: by 2002:a17:90a:474c:: with SMTP id y12mr29493691pjg.175.1608015263904;
        Mon, 14 Dec 2020 22:54:23 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id na6sm19124134pjb.12.2020.12.14.22.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 22:54:23 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: krzk@kernel.org
Date: Tue, 15 Dec 2020 15:53:59 +0900
Message-Id: <20201215065401.3220-1-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 2.17.1
Message-ID-Hash: RLR72QI65ZSLCTLCXUSAB3WIWMIWJESE
X-Message-ID-Hash: RLR72QI65ZSLCTLCXUSAB3WIWMIWJESE
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 net-next 0/2] nfc: s3fwrn5: Refactor the s3fwrn5 module
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/RLR72QI65ZSLCTLCXUSAB3WIWMIWJESE/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

Refactor the s3fwrn5 module.

1/2 is to remove the unneeded delay for NFC sleep.
2/2 is to remove the unused NCI prop commands.

ChangeLog:
 v2:
  - Update the commit messages.

Bongsu Jeon (2):
  nfc: s3fwrn5: Remove the delay for NFC sleep
  nfc: s3fwrn5: Remove unused NCI prop commands

 drivers/nfc/s3fwrn5/nci.c        | 25 -------------------------
 drivers/nfc/s3fwrn5/nci.h        | 22 ----------------------
 drivers/nfc/s3fwrn5/phy_common.c |  3 ++-
 3 files changed, 2 insertions(+), 48 deletions(-)

-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
