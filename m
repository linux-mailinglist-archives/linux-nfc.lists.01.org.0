Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BFD4935E5
	for <lists+linux-nfc@lfdr.de>; Wed, 19 Jan 2022 08:53:46 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 61E8B100F3FAC;
	Tue, 18 Jan 2022 23:53:32 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 6F089100F395B
	for <linux-nfc@lists.01.org>; Tue, 18 Jan 2022 23:53:10 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F33563F306
	for <linux-nfc@lists.01.org>; Wed, 19 Jan 2022 07:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642578787;
	bh=OSgZIsl6KSiVLFhGjCsmJG0C27mMplYwxlAMHo9H3Hk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=K8R4oEEUAG56UHxcaB7aVa7foTauihQB1qgzuXFsA2TU+FgJIJ8oiE1q9zMPeIoNF
	 65fthwD/kpgjqAmWD92aZf2tQFBOKvKLydMtw8PaabhFz1Kjtu88zAui4eE79DO/3n
	 il7KRZ/+loFJTicc1ga7H4Wp44aI8JsGRjl5VrxemeITTOoMCssI/StNv0+hk5v+ST
	 ze/g65EpMIYKnK/LDIAtupICDnjWCynMxrHssFm48/bGea1Hh8xFBajE8MHv/4NyJx
	 TcJSGGxD91Ycg3rzHkq6tF8oY4l+1nkG55W14oCuXSAPHuQ6MFwniqFDt8RKBj1OFQ
	 E7/pR40NQsVWA==
Received: by mail-ed1-f69.google.com with SMTP id bs4-20020a056402304400b004032af6b7ebso1471427edb.16
        for <linux-nfc@lists.01.org>; Tue, 18 Jan 2022 23:53:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OSgZIsl6KSiVLFhGjCsmJG0C27mMplYwxlAMHo9H3Hk=;
        b=qy3fdmaWyq9g9rQRGN3alzDucIBQeYIDpSbmiITMoLU92cHLxpXUlWaXOiYq6pW234
         Yz6mzf06neKqd83zeTeaplvawCVPBnAXXiVRV02USTIogvnkCUMRC6NX4a+8GQ4FUfih
         uv0Bz2ETG79RAWbQDAHMQjWrxqa/iGM/jxUyflgYcffZTt1O45HjTxN6J+19OPW5mFsG
         nwgMzhjX5Wigq6Doh/cKA/pfdQKiZc0H9XPX3RHTlvpk1N+rMY5L7jNikGVM8cR2SVSx
         zmIpaip1b/L/svNSPjICAQEseIA6FOJjBJFTFt2G666SaT4Rz/vdE2/tHhKsODVWtdHn
         Pe/Q==
X-Gm-Message-State: AOAM533TJ0Dhx8okFJudaGqlv6VEAedfXWtySF4qTBPD3SCgb6kNHoul
	vnyK5zWq0GI7m3yB1YXfRGUpeJCTBFnITSW9VSs8+W+9KQGLgDaajLLsKt1YwAZkyP93K05pZYI
	75ULNZ7lS0qALVAhGNWORteXXphccLEG0xg==
X-Received: by 2002:a05:6402:3591:: with SMTP id y17mr29760629edc.386.1642578787480;
        Tue, 18 Jan 2022 23:53:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9+Xw3bqoaTUBpvw/QShf3ZRnJ6GIKmG4TS+FJXRB9XTPyk9rcHOG6g0FjU5rSXoXNUEWc/Q==
X-Received: by 2002:a05:6402:3591:: with SMTP id y17mr29760621edc.386.1642578787366;
        Tue, 18 Jan 2022 23:53:07 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id w17sm805286edr.68.2022.01.18.23.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 23:53:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed, 19 Jan 2022 08:52:58 +0100
Message-Id: <20220119075301.7346-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220119075301.7346-1-krzysztof.kozlowski@canonical.com>
References: <20220119075301.7346-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: WSUKGJT3INEGRHQGI3T4NT63556HEFMQ
X-Message-ID-Hash: WSUKGJT3INEGRHQGI3T4NT63556HEFMQ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 3/6] nfc: llcp: use centralized exiting of bind on errors
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/WSUKGJT3INEGRHQGI3T4NT63556HEFMQ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Coding style encourages centralized exiting of functions, so rewrite
llcp_sock_bind() error paths to use such pattern.  This reduces the
duplicated cleanup code, make success path visually shorter and also
cleans up the errors in proper order (in reversed way from
initialization).

No functional impact expected.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/llcp_sock.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index a1b245b399f8..60985d1834a5 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -108,21 +108,13 @@ static int llcp_sock_bind(struct socket *sock, struct sockaddr *addr, int alen)
 					  llcp_sock->service_name_len,
 					  GFP_KERNEL);
 	if (!llcp_sock->service_name) {
-		nfc_llcp_local_put(llcp_sock->local);
-		llcp_sock->local = NULL;
-		llcp_sock->dev = NULL;
 		ret = -ENOMEM;
-		goto put_dev;
+		goto sock_llcp_put_local;
 	}
 	llcp_sock->ssap = nfc_llcp_get_sdp_ssap(local, llcp_sock);
 	if (llcp_sock->ssap == LLCP_SAP_MAX) {
-		nfc_llcp_local_put(llcp_sock->local);
-		llcp_sock->local = NULL;
-		kfree(llcp_sock->service_name);
-		llcp_sock->service_name = NULL;
-		llcp_sock->dev = NULL;
 		ret = -EADDRINUSE;
-		goto put_dev;
+		goto free_service_name;
 	}
 
 	llcp_sock->reserved_ssap = llcp_sock->ssap;
@@ -132,6 +124,19 @@ static int llcp_sock_bind(struct socket *sock, struct sockaddr *addr, int alen)
 	pr_debug("Socket bound to SAP %d\n", llcp_sock->ssap);
 
 	sk->sk_state = LLCP_BOUND;
+	nfc_put_device(dev);
+	release_sock(sk);
+
+	return 0;
+
+free_service_name:
+	kfree(llcp_sock->service_name);
+	llcp_sock->service_name = NULL;
+
+sock_llcp_put_local:
+	nfc_llcp_local_put(llcp_sock->local);
+	llcp_sock->local = NULL;
+	llcp_sock->dev = NULL;
 
 put_dev:
 	nfc_put_device(dev);
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
