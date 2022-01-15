Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C71348F6C7
	for <lists+linux-nfc@lfdr.de>; Sat, 15 Jan 2022 13:27:37 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 90913100E6C1E;
	Sat, 15 Jan 2022 04:27:23 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 05F47100E6C16
	for <linux-nfc@lists.01.org>; Sat, 15 Jan 2022 04:27:05 -0800 (PST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 014A23F17B
	for <linux-nfc@lists.01.org>; Sat, 15 Jan 2022 12:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642249624;
	bh=Mdsn7AT474MZc2MQVfRJDSMS8EOfClYXR9EYCiW/6uw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=U7pzAp9DK5Mmm1HPgDPU2mqOab1Df4U3g5TVODAipGIIPqZA+zLatKQF54Vp5NHnx
	 ofHbHDjlHzrNLjV+4uUMnxVhk+R6eyCzVAMwQX0PDL5sE3V/C/oyXtyaP3Q83ivm/e
	 3E303UrR/APJqkf/blzKe5KlokDLv5hK/faLBYkVT0/QUGwIKUuQvyI1ccq6hNEQpC
	 SKablJMbews5RzZR3rr6yhw2eRReNK2kgvN6cU5bDf8jXGgJeCHa3BOjsht8SABbsy
	 SprKH+l/KT4f8qVbc5wCiHMP6J0yEliK8t9hUZ8ouHPDaAx53p9dTjrEeQN4l/RhM6
	 s1GLHltuzyPrg==
Received: by mail-wm1-f71.google.com with SMTP id j18-20020a05600c1c1200b0034aeea95dacso4461887wms.8
        for <linux-nfc@lists.01.org>; Sat, 15 Jan 2022 04:27:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mdsn7AT474MZc2MQVfRJDSMS8EOfClYXR9EYCiW/6uw=;
        b=DfQ4oCRtixOyE4iWH0kV0s0RuzllEGOCb+QPS0Y0vXdqGCQIy0khQ+MTpEZdIJA9UN
         5Ul/EDVERcCw6UHaZjXxJpfDo7bGFFhFQUpk9rNy4ZCDgXgM6iNa/mZbzp2/rWSpgvBu
         wkRChjfnP7JFIGp9xCdzgU4pbGfG+FiMfWNJE9ZsHONb5od2Ic1bWH5EhZvg6u7+SHOq
         O6vfxhIgiHQGCkZX1QFg4vdd+0slt+FblGKFjeuyRN1wfssObX3KrXYG0n2pNx8t9EDg
         vjNci4U/1jgE/VfNOh23ukph4WVJvdvpxz0bnXDba5yd07B3BhBPjWD6DuQ7tJmR9ycd
         blWg==
X-Gm-Message-State: AOAM532Vj8UUmnSZM4Jlm5i9w8cbpKqdgPo4XA4SJkKdcXfW+ZyOwV4m
	xEWyeKSyn6PgUY3hRd01aj9OXSVLkEu+nib6flqVo/0a5GlS/omO/NC29sy0fFiDExOBUxvwWmB
	vURlVGpJ2iLusVW/z40Rq6goDLn1rrvJ9Sg==
X-Received: by 2002:adf:f0c8:: with SMTP id x8mr12500716wro.8.1642249623657;
        Sat, 15 Jan 2022 04:27:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+9/EJPNvF2Lg8TPggKvvKyZTnv0CkGSej/R9OMq8UBJ+esAn4SYxe7sYrdb7br5pj2o5aOQ==
X-Received: by 2002:adf:f0c8:: with SMTP id x8mr12500703wro.8.1642249623522;
        Sat, 15 Jan 2022 04:27:03 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id bk17sm7878476wrb.105.2022.01.15.04.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 04:27:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Sat, 15 Jan 2022 13:26:50 +0100
Message-Id: <20220115122650.128182-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220115122650.128182-1-krzysztof.kozlowski@canonical.com>
References: <20220115122650.128182-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: XTVED4PQE55NGBXHZBQ5AAOYUXV23I7C
X-Message-ID-Hash: XTVED4PQE55NGBXHZBQ5AAOYUXV23I7C
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 7/7] nfc: llcp: Revert "NFC: Keep socket alive until the DISC PDU is actually sent"
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/XTVED4PQE55NGBXHZBQ5AAOYUXV23I7C/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This reverts commit 17f7ae16aef1f58bc4af4c7a16b8778a91a30255.

The commit brought a new socket state LLCP_DISCONNECTING, which was
never set, only read, so socket could never set to such state.

Remove the dead code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/llcp.h      | 1 -
 net/nfc/llcp_core.c | 7 -------
 net/nfc/llcp_sock.c | 7 -------
 3 files changed, 15 deletions(-)

diff --git a/net/nfc/llcp.h b/net/nfc/llcp.h
index d49d4bf2e37c..c1d9be636933 100644
--- a/net/nfc/llcp.h
+++ b/net/nfc/llcp.h
@@ -6,7 +6,6 @@
 enum llcp_state {
 	LLCP_CONNECTED = 1, /* wait_for_packet() wants that */
 	LLCP_CONNECTING,
-	LLCP_DISCONNECTING,
 	LLCP_CLOSED,
 	LLCP_BOUND,
 	LLCP_LISTEN,
diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index b70d5042bf74..3364caabef8b 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -737,13 +737,6 @@ static void nfc_llcp_tx_work(struct work_struct *work)
 			print_hex_dump_debug("LLCP Tx: ", DUMP_PREFIX_OFFSET,
 					     16, 1, skb->data, skb->len, true);
 
-			if (ptype == LLCP_PDU_DISC && sk != NULL &&
-			    sk->sk_state == LLCP_DISCONNECTING) {
-				nfc_llcp_sock_unlink(&local->sockets, sk);
-				sock_orphan(sk);
-				sock_put(sk);
-			}
-
 			if (ptype == LLCP_PDU_I)
 				copy_skb = skb_copy(skb, GFP_ATOMIC);
 
diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 5c5705f5028b..4ca35791c93b 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -641,13 +641,6 @@ static int llcp_sock_release(struct socket *sock)
 
 	release_sock(sk);
 
-	/* Keep this sock alive and therefore do not remove it from the sockets
-	 * list until the DISC PDU has been actually sent. Otherwise we would
-	 * reply with DM PDUs before sending the DISC one.
-	 */
-	if (sk->sk_state == LLCP_DISCONNECTING)
-		return err;
-
 out:
 	sock_orphan(sk);
 	sock_put(sk);
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
