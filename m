Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBD74CAEA0
	for <lists+linux-nfc@lfdr.de>; Wed,  2 Mar 2022 20:25:37 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 5BEF9100F3FB8;
	Wed,  2 Mar 2022 11:25:34 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id C4B37100EB847
	for <linux-nfc@lists.01.org>; Wed,  2 Mar 2022 11:25:32 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 99DB53F5FD
	for <linux-nfc@lists.01.org>; Wed,  2 Mar 2022 19:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1646249131;
	bh=XW443xLXNMd7fKnAwsj5MsweNUN/P9g1RwySZfWsL7A=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=njcbGLZ4kf+fLgTrGYraZCpASRIabOzayBz6S43a31LaCLpFdZkimOAeSyrpr4iWc
	 hp22Nt8CizcKquzO6O0xCuoF3BpGEUTXjZnFIBe0wZBA8KgGdahgQ2O1Hg8IET7hT7
	 HCK9eQA5Bd2sswYtD+vto2ep11gx9Dn+DKdlbuunUyCcNwHT2I554VwVo5P57EBEN/
	 IsfvIUdI/s3k5WeQlYVUu95HUgFxoYqMR3vZs5duMK1i1vXzHWy/iubMLxmCr2jbCJ
	 8tZ877ko+Eq3aNVDA0IBOJxxRTNIg7znQSFf2VfFsJUl937+V7nsy26VLtPgPMbHGT
	 OM0+1FTqnDHbA==
Received: by mail-ej1-f70.google.com with SMTP id k16-20020a17090632d000b006ae1cdb0f07so1479409ejk.16
        for <linux-nfc@lists.01.org>; Wed, 02 Mar 2022 11:25:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XW443xLXNMd7fKnAwsj5MsweNUN/P9g1RwySZfWsL7A=;
        b=X7TZYx7hBUmxw037vpkBXlUsBtjHlFWNL+s5BUlAsar+TNYeDhsMR9bLQzBQw61rBt
         YH3Um7AapIMg0QGpUDUX4IQI7HWNDG42ZawT8FLd/STHLItayrqFX+RaCIJiW4YZD3Ye
         HxLhrnWwzWGSrfPzbawZsPijZJTwhx8AhJ9AZGY9CGNg8nS+Qmgw74gY277IhGHt8zDs
         mx5L45c/YQMW84nHAFT3Qkc5p0CWIlNiGXd7AR5qbK+GVDgbDqgoc2wFBvz6a6JMixND
         K/23Mrua9MyN6d5QZ1CM/bBvO0Y/oqfXrgsSxQCITCNPVPBgVyN1dRM7KIsJPEzPZvg1
         bpVw==
X-Gm-Message-State: AOAM533CVQNmRPb7vqYBM+pVwbJsGSX27l/GIUM0TcUxN7KCnpUGbq7l
	/IrABqOT3OhS2OqbFo1pwAivVHfkq8lBRQivlHXS3uY2Wkye+dycCXP4a8OGmGHLXWEm4Cf7Dwx
	ltL1Od5z9CJ9j5ogRzVRHLKT7HzLr0tWrUQ==
X-Received: by 2002:a17:906:2f97:b0:6ce:3ef6:94be with SMTP id w23-20020a1709062f9700b006ce3ef694bemr24638074eji.136.1646249131052;
        Wed, 02 Mar 2022 11:25:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsRBR/F3xyyehjGQgAe0B+0iZQvBRbcdylldzaOvYG3TOQZ1QZiyO7oXqhYToX9C8yGar/7A==
X-Received: by 2002:a17:906:2f97:b0:6ce:3ef6:94be with SMTP id w23-20020a1709062f9700b006ce3ef694bemr24638059eji.136.1646249130844;
        Wed, 02 Mar 2022 11:25:30 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id i14-20020a50cfce000000b00415b0730921sm1482765edk.42.2022.03.02.11.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 11:25:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed,  2 Mar 2022 20:25:20 +0100
Message-Id: <20220302192523.57444-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220302192523.57444-1-krzysztof.kozlowski@canonical.com>
References: <20220302192523.57444-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: VNVE22LW2JA3LXBDO7AH7M5GDDG42PDL
X-Message-ID-Hash: VNVE22LW2JA3LXBDO7AH7M5GDDG42PDL
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [RESEND PATCH v2 3/6] nfc: llcp: use centralized exiting of bind on errors
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/VNVE22LW2JA3LXBDO7AH7M5GDDG42PDL/>
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
index fdf0856182c6..c9d5c427f035 100644
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
