Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B55648F6BA
	for <lists+linux-nfc@lfdr.de>; Sat, 15 Jan 2022 13:27:03 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 1294B100F47B7;
	Sat, 15 Jan 2022 04:27:01 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 56C0A100EB34F
	for <linux-nfc@lists.01.org>; Sat, 15 Jan 2022 04:26:58 -0800 (PST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E37F63F1DE
	for <linux-nfc@lists.01.org>; Sat, 15 Jan 2022 12:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642249615;
	bh=UFY9nLmKMUjd2UvRZj5axFl/Fd7RYltbOVlAdEkhte4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=LkH7crKZUsCP1XtREfjJg6t5kyNpPqC6YEku8gWKC/XKCtvdWf88T6+2rkgomCNav
	 nshayslL1ZEhk4z/ElBZf0EwqgScvTC93H4yQcGmOu/F7RuhQhzCtVNo0cp1Szss9y
	 oGe8wizDnJUvnvBJaf4FhxcJlLH4pyxa5D/zy+26rQKPxkkguSslQFfWFjx0QHWq1u
	 d2BoipqZwkhhXTQRcs0Xdr80tFXZcB/PM3GIvMjcI9H2dP0oavhMZ2c+AAsa46IIqe
	 AKr7S0TTbMHTjGPg0IrCCfWdR41G5u0fattRof0/HKYfrOEfXKRdxq0LNp7LVaf8IN
	 MCR1HuRjdrbCw==
Received: by mail-wm1-f69.google.com with SMTP id s17-20020a7bc0d1000000b00348737ba2a2so7331003wmh.2
        for <linux-nfc@lists.01.org>; Sat, 15 Jan 2022 04:26:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UFY9nLmKMUjd2UvRZj5axFl/Fd7RYltbOVlAdEkhte4=;
        b=g9guFrI/K5yc4DXY99KDF2hsD3zGUpXhq+7qYj1HsFCDwrVwyWNP0lnVtttjfZ8y8H
         M4hLfuRw4/wDenLa1zdoi/Ny6Oayn+MD8WGn1Qcrv4PV2qFGEnBwXbEvyYbpYscKhWOr
         ttg+taA0B6rzNxtIbHQjSg7DKIYGHzildP8mzGsoZAXA2xLs0/M7+SErXctAwWkBC30L
         +L8nYQSjzaUtG7o/Bgyt/I9Je/REzwr5m5TdweqSMUAxKO5UAFT0A8B+nlYGctLfbuzE
         eza8VvILg+121OIyyrprFosVV85OiQOr2hK7b2Ym0yWokk5m0B6NI4M+PEV54JWfGPb4
         5/Hg==
X-Gm-Message-State: AOAM530yIaQFxYVKMZOueK2Kd/RU1yXwEIwRDBpBK00RqnBb5cglNXAC
	TpQw1RStpIutmpHV04o5HEJlnj5ezfAHs9bpUw2Utmm+l9U9u8Toh2QoOZdQuTglwjD/eeyu6I5
	MLmX4by2+Ba70mmVtnTftRciSeWX4/AQY2w==
X-Received: by 2002:a5d:4301:: with SMTP id h1mr11658544wrq.511.1642249615430;
        Sat, 15 Jan 2022 04:26:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJJMFuj6liqoHgnsPIf4U94AbLpvbnNxrsqihhJ6QYj/aeAzghUu50bJ5RARQmO3BhD+yWuQ==
X-Received: by 2002:a5d:4301:: with SMTP id h1mr11658524wrq.511.1642249615073;
        Sat, 15 Jan 2022 04:26:55 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id bk17sm7878476wrb.105.2022.01.15.04.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 04:26:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Sat, 15 Jan 2022 13:26:43 +0100
Message-Id: <20220115122650.128182-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Message-ID-Hash: NSCYSSXJVWY3SNSPMO4OTOM7ZAQTOTSO
X-Message-ID-Hash: NSCYSSXJVWY3SNSPMO4OTOM7ZAQTOTSO
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 0/7] nfc: llcp: fix and improvements
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/NSCYSSXJVWY3SNSPMO4OTOM7ZAQTOTSO/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Patch #1:
=========
Syzbot reported an easily reproducible NULL pointer dereference which I was
struggling to analyze:
https://syzkaller.appspot.com/bug?extid=7f23bcddf626e0593a39

Although direct fix is obvious, I could not actually find the exact race
condition scenario leading to it.  The patch fixes the issue - at least under
my QEMU - however all this code looks racy, so I have a feeling I am plumbing
one leak without fixing root cause.

Therefore I would appreciate some more thoughts on first commit.

The rest of patches:
====================
These are improvements, rebased on top of #1, although should be independent.
They do not fix any experienced issue, just look correct to me from the code
point of view.

Testing
=======
Under QEMU only. The NFC/LLCP code was not really tested on a device.

Best regards,
Krzysztof

Krzysztof Kozlowski (7):
  nfc: llcp: fix NULL error pointer dereference on sendmsg() after
    failed bind()
  nfc: llcp: nullify llcp_sock->dev on connect() error paths
  nfc: llcp: simplify llcp_sock_connect() error paths
  nfc: llcp: use centralized exiting of bind on errors
  nfc: llcp: use test_bit()
  nfc: llcp: protect nfc_llcp_sock_unlink() calls
  nfc: llcp: Revert "NFC: Keep socket alive until the DISC PDU is
    actually sent"

 net/nfc/llcp.h      |  1 -
 net/nfc/llcp_core.c |  9 +-------
 net/nfc/llcp_sock.c | 54 ++++++++++++++++++++++++---------------------
 3 files changed, 30 insertions(+), 34 deletions(-)

-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
