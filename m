Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5BC305C83
	for <lists+linux-nfc@lfdr.de>; Wed, 27 Jan 2021 14:09:01 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 15D95100EB824;
	Wed, 27 Jan 2021 05:09:00 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id AC3D3100ED4BF
	for <linux-nfc@lists.01.org>; Wed, 27 Jan 2021 05:08:57 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id o20so1177466pfu.0
        for <linux-nfc@lists.01.org>; Wed, 27 Jan 2021 05:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vBvz2YbWfOX3Q1Cs7mp1zN0scocgctdq3d4EpjgIfoU=;
        b=HWyptk4zgJU+E4QeZpyMjSvaPvBMY7rf07ldY7/Bv4bILZqUBSAOhMheNqi9rFwQYk
         NANnDBOlnyO4jsl87JBiYpmaA7iCEM/+gbckv+t876UEc1kRp+E+Vps+l1aPS2ZiXM27
         cBF6LqzILcGZDhuIAlw0J/EGaYml1Wiq7XYKF2Eb7KjDATgZ9moQxplY4gwp4XDeDRzN
         6vo+tL/rBSeblVzAhT8F/ukP3+Kim40ENLFURvY0paqglf1KWtXmY24WPscPMV0DTQwu
         7k58CpzgxZIXmX/45cBfTp7kEphhLzMuqK71d+mZWxmvPBl2GfR6lCfe19UQwgZAp677
         hmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vBvz2YbWfOX3Q1Cs7mp1zN0scocgctdq3d4EpjgIfoU=;
        b=iCxnPClj7LopA5yHTfbQX71oZP+TjNcdQCqSyr0h0yKWjWWivY8BGu53ygaVyM0BVU
         03wUo2dO/pFZ4CNnrgnToQ9xOt2FVjob7NQaIwT84ztAXGpmxzGkvnMSLIKnQCynn05f
         0Xgt0urhjyPJGY8nAOSdiLOJaa4xwTX1eEM2LGeC/Y2pxbOJuhmwCj6m1TSOjJwb1wuw
         9tG/7vi1hVLtOtmzEAXmWOL0J1iyPe6GMceeVKMsQ+6krCcKSSFaeQa6iRFpEA3JqLG9
         tpVFTbim77zemugZK+NMufHPEoJcwUcv3rgHbmNt+t0vtv5ZnDuilL5CIkhCEnO+rQ0H
         DLJQ==
X-Gm-Message-State: AOAM532diTJKN6oDzV6Tj+cZq6pfB50MH6N8nxNUv+tiiFjcDxrst+z/
	k/B9KEqATt5CbJxWcEQN1CrMeX9roznMwA==
X-Google-Smtp-Source: ABdhPJwJ3ZbS/A9K/Dz8QDeaaIcw5Fgp1F+mE/cRkvf5VvaWnPI+a/EzoL8/Rc8N3QgbqeEQOWnOQA==
X-Received: by 2002:a63:504e:: with SMTP id q14mr11062319pgl.306.1611752937308;
        Wed, 27 Jan 2021 05:08:57 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id 6sm2163343pjm.31.2021.01.27.05.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 05:08:56 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: kuba@kernel.org,
	shuah@kernel.org
Date: Wed, 27 Jan 2021 22:08:27 +0900
Message-Id: <20210127130829.4026-1-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Message-ID-Hash: YTKQYJF5RXULLJWO3WBL3VVR22PYDWIA
X-Message-ID-Hash: YTKQYJF5RXULLJWO3WBL3VVR22PYDWIA
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: krzk@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-nfc@lists.01.org, linux-kselftest@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH net-next v4 0/2] Add nci suit and virtual nci device driver
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/YTKQYJF5RXULLJWO3WBL3VVR22PYDWIA/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

1/2 is the Virtual NCI device driver.
2/2 is the NCI selftest suite

v4:
 1/2
 - flip the condition for the ioctl.
 - refactor some code.
 - remove the unused function after refactoring.
v3:
 1/2
 - change the Kconfig help comment.
 - remove the mutex init code.
 - remove the unnecessary mutex(nci_send_mutex).
 - remove the full_txbuff.
 - add the code to release skb at error case.
 - refactor some code.
v2:
 1/2
 - change the permission of the Virtual NCI device.
 - add the ioctl to find the nci device index.
 2/2
 - add the NCI selftest suite.

Bongsu Jeon (2):
  nfc: Add a virtual nci device driver
  selftests: Add nci suite

 MAINTAINERS                           |   8 +
 drivers/nfc/Kconfig                   |  11 +
 drivers/nfc/Makefile                  |   1 +
 drivers/nfc/virtual_ncidev.c          | 215 +++++++++
 tools/testing/selftests/Makefile      |   1 +
 tools/testing/selftests/nci/Makefile  |   6 +
 tools/testing/selftests/nci/config    |   3 +
 tools/testing/selftests/nci/nci_dev.c | 599 ++++++++++++++++++++++++++
 8 files changed, 844 insertions(+)
 create mode 100644 drivers/nfc/virtual_ncidev.c
 create mode 100644 tools/testing/selftests/nci/Makefile
 create mode 100644 tools/testing/selftests/nci/config
 create mode 100644 tools/testing/selftests/nci/nci_dev.c

-- 
2.25.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
