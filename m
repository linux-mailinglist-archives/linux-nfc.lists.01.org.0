Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 602E34935E3
	for <lists+linux-nfc@lfdr.de>; Wed, 19 Jan 2022 08:53:41 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 3F59F100F3FA4;
	Tue, 18 Jan 2022 23:53:27 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 70259100F3FA4
	for <linux-nfc@lists.01.org>; Tue, 18 Jan 2022 23:53:16 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E8FC53F313
	for <linux-nfc@lists.01.org>; Wed, 19 Jan 2022 07:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642578789;
	bh=RM6CEuGCpivOsBpPPs3hkt8u1ijpOzgu/V3oCSO4jiM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=Ue7KA/6jXfRUvNGexglmYZadzYejZrCAR4nRVbSaeB7JnKnmmPYm8akSqqWUvGKuZ
	 +rJaXZplTe4WJ6brWrO13VP8AcO0FY/INMphguv+biB24s+GLIT3Nw/wP+3QgEkc70
	 JXp8VX5tVb99Is2pRZDDehTN3qG6UcVNW1JHzWhs0AcOIrh2h9KJGEbUzQ3WzLH6fy
	 SFLXyJW1WDNPrSztFIjbYrZMqhFnpvBR14pY4fd3iRT98vHjrt1DoFwL878ToisLY0
	 vRgJQXjMvJ3T2LkneMw12QYgQXDFIjlqwxNkly/yWpkCA8akQ8sgkjip3IG/Q3S6cA
	 gWUOvMav4dvfA==
Received: by mail-ed1-f69.google.com with SMTP id t11-20020aa7d70b000000b004017521782dso1448608edq.19
        for <linux-nfc@lists.01.org>; Tue, 18 Jan 2022 23:53:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RM6CEuGCpivOsBpPPs3hkt8u1ijpOzgu/V3oCSO4jiM=;
        b=lBIHHoxCdqbvWJV9TYDVFrXwAyJTwdDoMTK33y+h6VjHixPFPra8GpHt8uzdiYJ3yr
         dlBuTC+4tGtJaWYAe2TIe7VMLOhr08QGreFeEQl4HMVAb8fwMnXpZRdYEANzRN9+0j3d
         6Atf/vwPZBg+yXG+Ctex3Se+hbl8g094tnrxDzldVxWVPIB7yyua86r6IqkTWO3R+kpe
         oEr7M+D0Y9z3jPy2WYPREgGwGtBL+BEG/Cnz1gSKLlN1y4UOv5vuDQalQaaAHUNQwGrf
         4a3sWAbS+mUmxZ5FJ0RNdmaN8Soe0V87jtZ2EE5zZJ0Tgpye2tJmEioATP1IvO6sxtky
         eR0Q==
X-Gm-Message-State: AOAM533qUZt87QQLBHZM7RGIseQHej9MGuNVRBmo33UzDa2xRpKdBoFj
	OH77PqqLjAGMcdNJdNQNrDCdq7YJ0BpI4qNQAtvVOV2NRI1JY6KB4xCYWmo3gwf5lZwUKD9eW/P
	3KgPr3sPnX7K3OtZJpzhQXapsGLeI4If1RA==
X-Received: by 2002:a17:907:e93:: with SMTP id ho19mr11025871ejc.168.1642578789628;
        Tue, 18 Jan 2022 23:53:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJEcV3S0JFKK4d5B6hmyTEOPZMdJTa8RrL6S17NZ6W29g8Vt3dq4Dv7WMzhmOsFjUA/eVO+g==
X-Received: by 2002:a17:907:e93:: with SMTP id ho19mr11025863ejc.168.1642578789450;
        Tue, 18 Jan 2022 23:53:09 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id w17sm805286edr.68.2022.01.18.23.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 23:53:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed, 19 Jan 2022 08:53:00 +0100
Message-Id: <20220119075301.7346-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220119075301.7346-1-krzysztof.kozlowski@canonical.com>
References: <20220119075301.7346-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: SPOEEOQHMOSV43DNXTQGFBYC7KDN5EDR
X-Message-ID-Hash: SPOEEOQHMOSV43DNXTQGFBYC7KDN5EDR
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 5/6] nfc: llcp: protect nfc_llcp_sock_unlink() calls
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/SPOEEOQHMOSV43DNXTQGFBYC7KDN5EDR/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

nfc_llcp_sock_link() is called in all paths (bind/connect) as a last
action, still protected with lock_sock().  When cleaning up in
llcp_sock_release(), call nfc_llcp_sock_unlink() in a mirrored way:
earlier and still under the lock_sock().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/llcp_sock.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 60985d1834a5..2d4cdce88a54 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -631,6 +631,11 @@ static int llcp_sock_release(struct socket *sock)
 		}
 	}
 
+	if (sock->type == SOCK_RAW)
+		nfc_llcp_sock_unlink(&local->raw_sockets, sk);
+	else
+		nfc_llcp_sock_unlink(&local->sockets, sk);
+
 	if (llcp_sock->reserved_ssap < LLCP_SAP_MAX)
 		nfc_llcp_put_ssap(llcp_sock->local, llcp_sock->ssap);
 
@@ -643,11 +648,6 @@ static int llcp_sock_release(struct socket *sock)
 	if (sk->sk_state == LLCP_DISCONNECTING)
 		return err;
 
-	if (sock->type == SOCK_RAW)
-		nfc_llcp_sock_unlink(&local->raw_sockets, sk);
-	else
-		nfc_llcp_sock_unlink(&local->sockets, sk);
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
