Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9554935E4
	for <lists+linux-nfc@lfdr.de>; Wed, 19 Jan 2022 08:53:42 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 555A9100F3FA8;
	Tue, 18 Jan 2022 23:53:32 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 6F0F1100F395F
	for <linux-nfc@lists.01.org>; Tue, 18 Jan 2022 23:53:16 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DC7A33F1E0
	for <linux-nfc@lists.01.org>; Wed, 19 Jan 2022 07:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642578790;
	bh=x/F9VAvKkrKoejYalm8chWtX9s0cqmjTeJU4WHXRJwU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=JKpb4944cZlA4PYTH9/LWoHrEnXq1EUmhagnDfq0P3t6XKPMFE0XwEUm/9G2V+Jbc
	 Rfp0X5zN+mFXBOPWGNgIpQ+LkaW2+oprsLMBPAfiYqpppxqDPEEiQ4FgQbDhbBwnbE
	 X6vsiF3aulCy2pN+sBjEPVFFlf4RLkZ1XB2XQvG1BVNcKxw+xw+iKm19an1r7XiIXS
	 l+JDJ5K1nSpWN1zue5xS1zb7haGd4bgte/hXU3q3is883ZmW84EOmLNuVaA3IKwgJA
	 SeYSwsClxWoxsTfjIrI/mtZ+kf2GXhy/BK4BgWFGtGvanr21hqlb49BmZiVGHqc7NW
	 58YoVC+Qd2WYw==
Received: by mail-ed1-f72.google.com with SMTP id h21-20020aa7c955000000b0040390b2bfc5so1470798edt.15
        for <linux-nfc@lists.01.org>; Tue, 18 Jan 2022 23:53:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x/F9VAvKkrKoejYalm8chWtX9s0cqmjTeJU4WHXRJwU=;
        b=USfAC0kTnKQS6QFG+l2Pu+2sjoRrEuoRDA3cJUGnqc9nF7TB5J6Q15ilr4gvj88bvD
         Jalh4KUcYjcZL1Ni3x6oE8PeDKGlxvE0mhbk5nZFpYk94y0B8Erjksiniqry/HLF0zlz
         0S4tRAlHuFdQTDNKikgEnkSdptiHgTUBcJHYbIONikqidWiawZPyVPnp7TwXecG9QFij
         XbT7fsETFIIuHwle1gK/Ch+99SrgKUf+m7yoaiGCj27EvdG6+7hJ+7kShsin8lZDLgV8
         svp6XmaFM0nP2tvqt94gcut2jBJHOvl3ap76T7bXNtKYavTU++LOlslZclJB6YtzuP2P
         FA1A==
X-Gm-Message-State: AOAM532vw4pROSwgNJexvKmNHTPjQ9nE1MU1qLabPgYYAJw8kLNp3cCd
	ycSSyM9P7pZy9R4oKTlTrcyBB7X59HCQf2X4muVUdEgB8Olv+/nRIniardmTaHBWlI1UM2pEWcY
	6QXj4rrxjxnWm4yb3hW71BySDA+pfraX0aw==
X-Received: by 2002:a17:907:1c11:: with SMTP id nc17mr23091260ejc.513.1642578790606;
        Tue, 18 Jan 2022 23:53:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLf3PxsIJN+w6STqoYgFU25Yxbhg0DD3ySt4Ezlf7rmSa4y3Co29oIvpjwl5lROKrswnJnbA==
X-Received: by 2002:a17:907:1c11:: with SMTP id nc17mr23091253ejc.513.1642578790409;
        Tue, 18 Jan 2022 23:53:10 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id w17sm805286edr.68.2022.01.18.23.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 23:53:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed, 19 Jan 2022 08:53:01 +0100
Message-Id: <20220119075301.7346-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220119075301.7346-1-krzysztof.kozlowski@canonical.com>
References: <20220119075301.7346-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: R2RF3VQIHRZZ4L6IHCBHJNM5WYIHK725
X-Message-ID-Hash: R2RF3VQIHRZZ4L6IHCBHJNM5WYIHK725
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 6/6] nfc: llcp: Revert "NFC: Keep socket alive until the DISC PDU is actually sent"
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/R2RF3VQIHRZZ4L6IHCBHJNM5WYIHK725/>
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
index 2d4cdce88a54..14afed5916d1 100644
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
