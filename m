Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 207C43955F2
	for <lists+linux-nfc@lfdr.de>; Mon, 31 May 2021 09:21:51 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E1E22100ED48C;
	Mon, 31 May 2021 00:21:46 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 472A1100EF267
	for <linux-nfc@lists.01.org>; Mon, 31 May 2021 00:21:43 -0700 (PDT)
Received: from mail-wm1-f70.google.com ([209.85.128.70])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lncF3-0001PC-CI
	for linux-nfc@lists.01.org; Mon, 31 May 2021 07:21:41 +0000
Received: by mail-wm1-f70.google.com with SMTP id v2-20020a7bcb420000b0290146b609814dso2866724wmj.0
        for <linux-nfc@lists.01.org>; Mon, 31 May 2021 00:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A3GSON0j3KJh2/Oj56KH/Htj1p3OWvu821JK06uHKfk=;
        b=fdbEQUlWdkQjrH8R0eVOv8uAA7xPi8KWu1Dik18TM8cQAAmV8wnL3n+hByI4dNy/KO
         ihzL8+y4OJNbRQKHk7XAvIeuXDmh7KLt9kdrSG9yy/bukPv2kxjm29ohOqruv0NtdFJw
         dCpJ+GdyMxibW4jfgeSJRgIsTIEnFa5EBPWe1jwHWowgaOJ7Ou9mFD5PyySN1L38edLU
         Gv8GyZ5ZFXRzMAcxRdWavVFZveHRszD8aTNTutwiCZiqgsBqnvV4LSdSdsfvRBitX8/v
         qibs+b/HC6o7J+8Y/h1PSNCzv+9Had2MyfkXwz2cZWRR1tUGzRze+c1oR7eSOCl6Ae18
         6/iQ==
X-Gm-Message-State: AOAM531V9Y/DSNkAg+kZK2CiF07eZr964I/MA7jUP0+Chx/sznS706AN
	J3BL+wp2li4nKkINRgRDcnBE7iABnBbYGe2XEayVzJq/ugz27fzwePLnU4m1PK32Ynh/kf0MRPb
	UMLDUQ3eFJPczAHtnAJF3N5wIVk9hNauJdA==
X-Received: by 2002:a5d:6d04:: with SMTP id e4mr20690496wrq.344.1622445701116;
        Mon, 31 May 2021 00:21:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNPl5seNhNk64GNvxyThbVLS2aeektyv2tIuWTKudSYCJFfU7ib3HhFvUqJqAh5HDGJq0JCA==
X-Received: by 2002:a5d:6d04:: with SMTP id e4mr20690477wrq.344.1622445700918;
        Mon, 31 May 2021 00:21:40 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id r4sm17199111wre.84.2021.05.31.00.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 00:21:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	"John W. Linville" <linville@tuxdriver.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Mon, 31 May 2021 09:21:38 +0200
Message-Id: <20210531072138.5219-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Message-ID-Hash: MXJMRND6ZQPRK637AZ2CI6XTRM5UHZIZ
X-Message-ID-Hash: MXJMRND6ZQPRK637AZ2CI6XTRM5UHZIZ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: thadeu.cascardo@canonical.com, stable@vger.kernel.org, syzbot+80fb126e7f7d8b1a5914@syzkaller.appspotmail.com, butt3rflyh4ck <butterflyhuangxx@gmail.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [RESEND PATCH] nfc: fix NULL ptr dereference in llcp_sock_getname() after failed connect
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/MXJMRND6ZQPRK637AZ2CI6XTRM5UHZIZ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It's possible to trigger NULL pointer dereference by local unprivileged
user, when calling getsockname() after failed bind() (e.g. the bind
fails because LLCP_SAP_MAX used as SAP):

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  CPU: 1 PID: 426 Comm: llcp_sock_getna Not tainted 5.13.0-rc2-next-20210521+ #9
  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-1 04/01/2014
  Call Trace:
   llcp_sock_getname+0xb1/0xe0
   __sys_getpeername+0x95/0xc0
   ? lockdep_hardirqs_on_prepare+0xd5/0x180
   ? syscall_enter_from_user_mode+0x1c/0x40
   __x64_sys_getpeername+0x11/0x20
   do_syscall_64+0x36/0x70
   entry_SYSCALL_64_after_hwframe+0x44/0xae

This can be reproduced with Syzkaller C repro (bind followed by
getpeername):
https://syzkaller.appspot.com/x/repro.c?x=14def446e00000

Cc: <stable@vger.kernel.org>
Fixes: d646960f7986 ("NFC: Initial LLCP support")
Reported-by: syzbot+80fb126e7f7d8b1a5914@syzkaller.appspotmail.com
Reported-by: butt3rflyh4ck <butterflyhuangxx@gmail.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Not extensively tested yet but fixes this particular issue.

Reason for resend:
1. Keep it public.
---
 net/nfc/llcp_sock.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 53dbe733f998..6cfd30fc0798 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -110,6 +110,7 @@ static int llcp_sock_bind(struct socket *sock, struct sockaddr *addr, int alen)
 	if (!llcp_sock->service_name) {
 		nfc_llcp_local_put(llcp_sock->local);
 		llcp_sock->local = NULL;
+		llcp_sock->dev = NULL;
 		ret = -ENOMEM;
 		goto put_dev;
 	}
@@ -119,6 +120,7 @@ static int llcp_sock_bind(struct socket *sock, struct sockaddr *addr, int alen)
 		llcp_sock->local = NULL;
 		kfree(llcp_sock->service_name);
 		llcp_sock->service_name = NULL;
+		llcp_sock->dev = NULL;
 		ret = -EADDRINUSE;
 		goto put_dev;
 	}
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
