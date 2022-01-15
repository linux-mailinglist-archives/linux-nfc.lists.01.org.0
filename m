Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EBB48F6BB
	for <lists+linux-nfc@lfdr.de>; Sat, 15 Jan 2022 13:27:05 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 410C4100E6C12;
	Sat, 15 Jan 2022 04:27:02 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id A15C5100F47B7
	for <linux-nfc@lists.01.org>; Sat, 15 Jan 2022 04:26:59 -0800 (PST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E55A1405F6
	for <linux-nfc@lists.01.org>; Sat, 15 Jan 2022 12:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642249617;
	bh=zOPm6FbYYyMSwfxLvkRzL4Z981RZYudJxTNTqLX9Fek=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=hPcW6J5XBELywkGxSm6BpY2FjxX2FxCs6xuz83qeyhrC/38SCvntdOz+aM5GvFtRP
	 wWe4OVCefHaP56cH1XWoirkJzFAVRVJ2vFtfoB411JCwmw3O/7RS/SVTKHXg4II/6m
	 zUH+6VvXKcwDtq1f3VXX6VcLN/Y2EXxslHon1ud1TSONpc6n71MiShi6XZmOJWxX+/
	 qDZdr5KGYv5pBhOxKC8YOYT1VLIO0lBBIamAL0gyiWYKpuCsWC2IpuH3OPxXg7PD81
	 51k42fH7niBLZX4o17qKxjJmawi/1EBZV8Dp1V56EQgkjaCUPe/cYT1PECnOTg/3x7
	 X334cp161DExw==
Received: by mail-wm1-f69.google.com with SMTP id 14-20020a05600c024e00b0034a83f7391aso6027574wmj.4
        for <linux-nfc@lists.01.org>; Sat, 15 Jan 2022 04:26:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zOPm6FbYYyMSwfxLvkRzL4Z981RZYudJxTNTqLX9Fek=;
        b=R8vt2UN+dRgM+yElDctf5hSPvc8XAEgiIqTAjassrUzSmPvyzaJSIXIY6S83EUJoBf
         oWCfJVGkcDPM9sdurCtuMKqUlQD4lgdEFmmrbZrQ71XFHQRmTyF4bAmd7myJTKVQxGdl
         0O/qilGKbkCKAIKiqWM1ZGKDxppk9nulLW2JiIpw7Xz+xzcdSua5yKeF4dA2ExWFTxw0
         EUPtIGnbjfv+zVK73nh39r1hfRu7KJv8HBmNWGSz1rKfFP4TXKl6mX0GzVH7XqeWjnVB
         Mt/Nm0wWSMtkURQNarzg/i20I+0vmyfEr3NVzAsmkCwK1SyrxH1F8ZzN5wf0k8VOgikP
         Llpw==
X-Gm-Message-State: AOAM53046XGfZME6HVIlFm3LTk8M6b5feYnItPB6YNzOSdLZGKQCQsU6
	aneAXO5Z9DJPufB2+uEDW2Js5/968dkRaEQ5eOc0XZVZ939W6jaJ63esjZpLincdTdIy9VUACh9
	KEWfwmXmCKkYsA9ef4TAoAueeqUmIQhWSkg==
X-Received: by 2002:adf:ec04:: with SMTP id x4mr11680483wrn.688.1642249616334;
        Sat, 15 Jan 2022 04:26:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgIS3ERL+kQQ2s/1KY8gz3ov5974t4pocea/WSltWsoYThkoVVF5w/zE3maTb43pWLhNWOXQ==
X-Received: by 2002:adf:ec04:: with SMTP id x4mr11680471wrn.688.1642249616161;
        Sat, 15 Jan 2022 04:26:56 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id bk17sm7878476wrb.105.2022.01.15.04.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 04:26:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Sat, 15 Jan 2022 13:26:44 +0100
Message-Id: <20220115122650.128182-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220115122650.128182-1-krzysztof.kozlowski@canonical.com>
References: <20220115122650.128182-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: UZB2UPO5YBM7QRYPIEQCNJZIUOIAL7W4
X-Message-ID-Hash: UZB2UPO5YBM7QRYPIEQCNJZIUOIAL7W4
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: syzbot+7f23bcddf626e0593a39@syzkaller.appspotmail.com, stable@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 1/7] nfc: llcp: fix NULL error pointer dereference on sendmsg() after failed bind()
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/UZB2UPO5YBM7QRYPIEQCNJZIUOIAL7W4/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Syzbot detected a NULL pointer dereference of nfc_llcp_sock->dev pointer
(which is a 'struct nfc_dev *') with calls to llcp_sock_sendmsg() after
a failed llcp_sock_bind(). The message being sent is a SOCK_DGRAM.

KASAN report:

  BUG: KASAN: null-ptr-deref in nfc_alloc_send_skb+0x2d/0xc0
  Read of size 4 at addr 00000000000005c8 by task llcp_sock_nfc_a/899

  CPU: 5 PID: 899 Comm: llcp_sock_nfc_a Not tainted 5.16.0-rc6-next-20211224-00001-gc6437fbf18b0 #125
  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-2 04/01/2014
  Call Trace:
   <TASK>
   dump_stack_lvl+0x45/0x59
   ? nfc_alloc_send_skb+0x2d/0xc0
   __kasan_report.cold+0x117/0x11c
   ? mark_lock+0x480/0x4f0
   ? nfc_alloc_send_skb+0x2d/0xc0
   kasan_report+0x38/0x50
   nfc_alloc_send_skb+0x2d/0xc0
   nfc_llcp_send_ui_frame+0x18c/0x2a0
   ? nfc_llcp_send_i_frame+0x230/0x230
   ? __local_bh_enable_ip+0x86/0xe0
   ? llcp_sock_connect+0x470/0x470
   ? llcp_sock_connect+0x470/0x470
   sock_sendmsg+0x8e/0xa0
   ____sys_sendmsg+0x253/0x3f0
   ...

The issue was visible only with multiple simultaneous calls to bind() and
sendmsg(), which resulted in most of the bind() calls to fail.  The
bind() was failing on checking if there is available WKS/SDP/SAP
(respective bit in 'struct nfc_llcp_local' fields).  When there was no
available WKS/SDP/SAP, the bind returned error but the sendmsg() to such
socket was able to trigger mentioned NULL pointer dereference of
nfc_llcp_sock->dev.

The code looks simply racy and currently it protects several paths
against race with checks for (!nfc_llcp_sock->local) which is NULL-ified
in error paths of bind().  The llcp_sock_sendmsg() did not have such
check but called function nfc_llcp_send_ui_frame() had, although not
protected with lock_sock().

Therefore the race could look like (same socket is used all the time):
  CPU0                                     CPU1
  ====                                     ====
  llcp_sock_bind()
  - lock_sock()
    - success
  - release_sock()
  - return 0
                                           llcp_sock_sendmsg()
                                           - lock_sock()
                                           - release_sock()
  llcp_sock_bind(), same socket
  - lock_sock()
    - error
                                           - nfc_llcp_send_ui_frame()
                                             - if (!llcp_sock->local)
    - llcp_sock->local = NULL
    - nfc_put_device(dev)
                                             - dereference llcp_sock->dev
  - release_sock()
  - return -ERRNO

The nfc_llcp_send_ui_frame() checked llcp_sock->local outside of the
lock, which is racy and ineffective check.  Instead, its caller
llcp_sock_sendmsg(), should perform the check inside lock_sock().

Reported-by: syzbot+7f23bcddf626e0593a39@syzkaller.appspotmail.com
Fixes: b874dec21d1c ("NFC: Implement LLCP connection less Tx path")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/llcp_sock.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 6cfd30fc0798..0b93a17b9f11 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -789,6 +789,11 @@ static int llcp_sock_sendmsg(struct socket *sock, struct msghdr *msg,
 
 	lock_sock(sk);
 
+	if (!llcp_sock->local) {
+		release_sock(sk);
+		return -ENODEV;
+	}
+
 	if (sk->sk_type == SOCK_DGRAM) {
 		DECLARE_SOCKADDR(struct sockaddr_nfc_llcp *, addr,
 				 msg->msg_name);
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
