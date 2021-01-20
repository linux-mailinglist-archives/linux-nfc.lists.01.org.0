Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 398D02FCF33
	for <lists+linux-nfc@lfdr.de>; Wed, 20 Jan 2021 12:57:02 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id C9B23100EB831;
	Wed, 20 Jan 2021 03:57:00 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 8CC01100EB82F
	for <linux-nfc@lists.01.org>; Wed, 20 Jan 2021 03:56:59 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id s15so12386251plr.9
        for <linux-nfc@lists.01.org>; Wed, 20 Jan 2021 03:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ciqHBudDYdod/bIfnJXN6ERypUAQCsPz7yvk11/qRw=;
        b=uVwQiXgYFpdw5DuHGtXhBVumDJ8YggqHu3QzSnWvDTWZpOdQbzav8hSlzIEnbUv6sR
         Z8dg3RF+LGJJIHT18PXELaPHFcHVFInDsqcQarTcBcpezUAKJE9Wxx4amTN3qnQzTN79
         v2Z4J/z7vvL4Eu4RYV9VvcbaHrvfby8AhAhx4x5GIuZ6bT/PAVmjoE9+zigrFmT/3EHP
         rr8Wtoyd0QlprjhJcceQdvR9B/PepF3zHJ+wqh5T8jm47YjT0w146mcpLWR8vicsPcBX
         k6gK4TALdiElcqEzWeIz5+cZlA1rRLv9RRgrOo3hE7FfjJKZuFUJGwMCsZE1t3Uo+xDu
         0m8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ciqHBudDYdod/bIfnJXN6ERypUAQCsPz7yvk11/qRw=;
        b=L1xDEL2mV5BTe+EL9ogass6Z3gq2ZMFPLSQxzDRyXFjuMTiaRGWqiySL3Q3jY1flh9
         tvhcCGR3oomuMqVprb9Y0IcGPLnKOza56/7JiPG1At5Hi1GiSCSd9PTZ7ojuAahUVX6B
         79Ysy2e8UjbDhaQSn3TqAIIG4ry5c4aUJCxeKiNdK66NtsWY0KIWonrwrADrB0Wbvyg2
         m58RhbVQibTh8XGu0vkMBEeVe6WR2OHBR2SJYjBrG+VCbJ++NvR3ZjYE0NTDAHQ06Tmr
         ghCy+RPLmCNWbF3YiTvJn8Fv/tdqGffeCwuxNP6cR2v+JQKhDHicISFvI15TNf4pYtr+
         28sw==
X-Gm-Message-State: AOAM532muggFLqEGIHl5ZCMzc9N2fBIBEZZP0nT4H9a7AbbiGEVS4Jwm
	1+iit2JXuRqSaQxBK3xbd8k=
X-Google-Smtp-Source: ABdhPJzVxazGkkCUGipHSo0jA8aEZJjv987UI+W41slbgRHxGIC80Q39eIuDbNaCE6MtdJqHAXnbWw==
X-Received: by 2002:a17:902:9005:b029:da:f580:c5f7 with SMTP id a5-20020a1709029005b02900daf580c5f7mr9633007plp.85.1611143819037;
        Wed, 20 Jan 2021 03:56:59 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id f13sm6487856pjj.1.2021.01.20.03.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 03:56:58 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: kuba@kernel.org,
	shuah@kernel.org
Date: Wed, 20 Jan 2021 20:56:43 +0900
Message-Id: <20210120115645.32798-1-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Message-ID-Hash: MCRYAIQ7D73HWVRR2JQBEPPFGEHH6SQI
X-Message-ID-Hash: MCRYAIQ7D73HWVRR2JQBEPPFGEHH6SQI
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: netdev@vger.kernel.org, linux-nfc@lists.01.org, linux-kselftest@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH net-next v2 0/2] Add nci suit and virtual nci device driver
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/MCRYAIQ7D73HWVRR2JQBEPPFGEHH6SQI/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

A NCI virtual device can be made to simulate a NCI device in user space.
Using the virtual NCI device, The NCI module and application can be
validated. This driver supports to communicate between the virtual NCI
device and NCI module. To test the basic features of NCI module, selftest
for NCI is added. Test cases consist of making the virtual NCI device
on/off and controlling the device's polling for NCI1.0 and NCI2.0 version.

1/2 is the Virtual NCI device driver.
2/2 is the NCI selftest suite

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
 drivers/nfc/virtual_ncidev.c          | 235 ++++++++++
 tools/testing/selftests/Makefile      |   1 +
 tools/testing/selftests/nci/Makefile  |   6 +
 tools/testing/selftests/nci/config    |   3 +
 tools/testing/selftests/nci/nci_dev.c | 599 ++++++++++++++++++++++++++
 8 files changed, 864 insertions(+)
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
