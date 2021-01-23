Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39656301421
	for <lists+linux-nfc@lfdr.de>; Sat, 23 Jan 2021 10:24:40 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E5E5D100ED4AE;
	Sat, 23 Jan 2021 01:24:38 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 5587F100ED4A3
	for <linux-nfc@lists.01.org>; Sat, 23 Jan 2021 01:24:37 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id g3so4677146plp.2
        for <linux-nfc@lists.01.org>; Sat, 23 Jan 2021 01:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k3QR3JKXwG7wDIj5UwkwcvzwKyrFi2u7DZslhTlOQTU=;
        b=ARNxYjMQKp/eKXPWu1Iz4DS2LcecIhnFDEC8G7h3rmHC3qKLcS3Mn4JvGmOWIpeEQA
         63g2FSqAtphthauJ9wkrEn0m0i9HBSExCeiOf3ZEYi8Kui5RYhNmm2m1kzTvWURprDpa
         rWJPlcOXDhZ4/RpvX29HZwoXsaYmq7j7dhhyXYbu/SskmqUMiJkA9T/yGManXB2lAchP
         MxchhqEHr6Ej/eUnEBLdn6h9nFFHV9/y2zQKZLC+iKr+JlH6fox41M6PEA4GV8SlpV4S
         tT/kqEMLj9Z1uzJ6v6zOsC91IYbIlFPi5YhCmkYINISTuHm59P7bNblWnorFUsyGPYfa
         JaNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k3QR3JKXwG7wDIj5UwkwcvzwKyrFi2u7DZslhTlOQTU=;
        b=Tjej+xkI2IFYAX+9h7FsNu1Wj6LjmU9yg9JUakVRnBZ50hghQl85u6P97VyGz6AA9p
         0PsKtEIFdKICnLtURB6Q3xDHRYQDs/jYV1RQzwIW2xYh2DHlH+5dZ5TGgzoXtIyiNdR4
         oHks1hkDqIU2Dwj4WvxbiCIvx2kuUgCkBBa7ek2ThYVw6Hjr/wnmA5VCQOgENJWw6Ept
         f0l2C34NwQroxF8AbylWOn1yMqPZVcTmZIswyXG2jA6zEiLYrV7vYM7e5qh+djN12IIO
         y/mrW7meMK53hzMFXZ10//eyTfwzwZWS/PBZWJJebKqTrCsTW/CqoPv0xWGioWxh6pgF
         /haA==
X-Gm-Message-State: AOAM533Abm+H+okYtH2jx3ObTZJCeSRAU3UzsfOb2tvfqVDx9KxSeK/Q
	gBDxl6821GHhgi5CiS0HrjU=
X-Google-Smtp-Source: ABdhPJwp8S6t2yuqcDQHJpnqNcv3dB33tVAXer+vBpR9lznPa2NoI0f/1lYy8Ixu+bBOZ82Tr1QhGg==
X-Received: by 2002:a17:90b:513:: with SMTP id r19mr10424293pjz.38.1611393876660;
        Sat, 23 Jan 2021 01:24:36 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id bt8sm16314808pjb.0.2021.01.23.01.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jan 2021 01:24:35 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: kuba@kernel.org,
	shuah@kernel.org
Date: Sat, 23 Jan 2021 18:24:23 +0900
Message-Id: <20210123092425.11434-1-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Message-ID-Hash: WCQ6KZZLTON3VSPCJREIMAVDZPWD6G7O
X-Message-ID-Hash: WCQ6KZZLTON3VSPCJREIMAVDZPWD6G7O
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: krzk@kernel.org, netdev@vger.kernel.org, linux-nfc@lists.01.org, linux-kselftest@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH net-next v3 0/2] Add nci suit and virtual nci device driver
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/WCQ6KZZLTON3VSPCJREIMAVDZPWD6G7O/>
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
for nci is added. Test cases consist of making the virtual NCI device
on/off and controlling the device's polling for NCI1.0 and NCI2.0 version.

1/2 is the Virtual NCI device driver.
2/2 is the NCI selftest suite

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

 MAINTAINERS                           |   8 +
 drivers/nfc/Kconfig                   |  11 +
 drivers/nfc/Makefile                  |   1 +
 drivers/nfc/virtual_ncidev.c          | 227 ++++++++++
 tools/testing/selftests/Makefile      |   1 +
 tools/testing/selftests/nci/Makefile  |   6 +
 tools/testing/selftests/nci/config    |   3 +
 tools/testing/selftests/nci/nci_dev.c | 599 ++++++++++++++++++++++++++
 8 files changed, 856 insertions(+)
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
