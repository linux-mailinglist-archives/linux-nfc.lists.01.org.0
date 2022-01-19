Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BB04935D7
	for <lists+linux-nfc@lfdr.de>; Wed, 19 Jan 2022 08:53:19 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id DF22D100F3952;
	Tue, 18 Jan 2022 23:53:17 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 2DE31100F3951
	for <linux-nfc@lists.01.org>; Tue, 18 Jan 2022 23:53:16 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E03B840027
	for <linux-nfc@lists.01.org>; Wed, 19 Jan 2022 07:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642578786;
	bh=hsf4OWBu8gj1asXGvoAW6jPDrjEeTDLfH6tpVV1berI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=GSCtUKGASfbtRPDVyA0rTmThe+PRyvirX6vXY5JhIv28katS3/EgnYRHgglCJ02Bx
	 z4BF9oY5I9BzsIEEG6tx7HuE1CoHOAjfaA6gWcvFdjRouK3VT+uvcWgQJwY36v4LwT
	 TUjoETmqj18QspSSo4YYsP/TmQ+Mj/0nGf0oUGyUsD2a2Dh+cXRbK5PEA44wLoB0s6
	 AcorzZcZCdNjP7YtzaNW+uu/Gm6UrkxgfOGxlpm/G5HRjHfcDR/LUhRS0/bfd/DNsN
	 LSLU9tnEVobjpyhSgR7C4i2brOemkDSuy9waimICV8lq7azEb1Rk0VpkuaMHmrf+iF
	 hkzRREogM1h7A==
Received: by mail-ed1-f69.google.com with SMTP id z6-20020a50eb46000000b00403a7687b5bso1500946edp.3
        for <linux-nfc@lists.01.org>; Tue, 18 Jan 2022 23:53:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hsf4OWBu8gj1asXGvoAW6jPDrjEeTDLfH6tpVV1berI=;
        b=XbZ1hb19lBJ7FO/hoYZ4HmUUY6auvMnBXqWo+Wv7QVdrPIlEdg05tI82hWz6OQoZI7
         NO96qQ3Tf0rWh4fBboPG/AxgmqDs7FbIGyj/U4AbVyIk2T5arzoT3uS5cmuK4SjVDq6P
         b1tZPKwq/36xwb70kR+0HxU6uxazkPLd4FYG3hmff9AFeOP2voun7dTJitltwfR7WzlQ
         T2hwkCYxILPL0vx19bu7DR8fpV8MkimszwUw+tN4152KtQalbjp1Y+gypsNH2utulX5s
         IwuVMPcLRUAKIPrnX/mGAJz5J73DDYQ53zYFymS6gxgSQstwbE8vpowIW2D738Ls8drQ
         D+Mg==
X-Gm-Message-State: AOAM533Y6FZVYHodFi6nD/aNmP1i7hdV6KeVC4O6GrCQiaoO+r8O2R9D
	0AFLJ8YScrgiM1dj3GW7CitTOKrgUFjM6cQhJv8qkGhGSxUTVL46nVmL4NHTupHCZxFqBcvbK5O
	tN3bGCxWucA6yXKyINgknfOfEVSt8gB5MTA==
X-Received: by 2002:a05:6402:11c9:: with SMTP id j9mr28608488edw.385.1642578786591;
        Tue, 18 Jan 2022 23:53:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyns4WRsOdrGoSiLkUgMsRyEIUWZN7UKVXPDT+SQgr4x790RZ4Ep5Cqmw1oA9YvBvJZNQYpwg==
X-Received: by 2002:a05:6402:11c9:: with SMTP id j9mr28608483edw.385.1642578786471;
        Tue, 18 Jan 2022 23:53:06 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id w17sm805286edr.68.2022.01.18.23.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 23:53:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed, 19 Jan 2022 08:52:57 +0100
Message-Id: <20220119075301.7346-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220119075301.7346-1-krzysztof.kozlowski@canonical.com>
References: <20220119075301.7346-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 5NDIWKK7DKAURLJOI5YLMJNLFUVKIVD7
X-Message-ID-Hash: 5NDIWKK7DKAURLJOI5YLMJNLFUVKIVD7
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 2/6] nfc: llcp: simplify llcp_sock_connect() error paths
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/5NDIWKK7DKAURLJOI5YLMJNLFUVKIVD7/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The llcp_sock_connect() error paths were using a mixed way of central
exit (goto) and cleanup

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/llcp_sock.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index d951d4f0c87f..a1b245b399f8 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -712,10 +712,8 @@ static int llcp_sock_connect(struct socket *sock, struct sockaddr *_addr,
 	llcp_sock->local = nfc_llcp_local_get(local);
 	llcp_sock->ssap = nfc_llcp_get_local_ssap(local);
 	if (llcp_sock->ssap == LLCP_SAP_MAX) {
-		nfc_llcp_local_put(llcp_sock->local);
-		llcp_sock->local = NULL;
 		ret = -ENOMEM;
-		goto put_dev;
+		goto sock_llcp_put_local;
 	}
 
 	llcp_sock->reserved_ssap = llcp_sock->ssap;
@@ -760,11 +758,13 @@ static int llcp_sock_connect(struct socket *sock, struct sockaddr *_addr,
 
 sock_llcp_release:
 	nfc_llcp_put_ssap(local, llcp_sock->ssap);
+
+sock_llcp_put_local:
 	nfc_llcp_local_put(llcp_sock->local);
 	llcp_sock->local = NULL;
+	llcp_sock->dev = NULL;
 
 put_dev:
-	llcp_sock->dev = NULL;
 	nfc_put_device(dev);
 
 error:
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
