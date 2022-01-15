Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE8048F6C3
	for <lists+linux-nfc@lfdr.de>; Sat, 15 Jan 2022 13:27:14 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 54D4A100E6C10;
	Sat, 15 Jan 2022 04:27:13 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 4F04A100EB34F
	for <linux-nfc@lists.01.org>; Sat, 15 Jan 2022 04:27:00 -0800 (PST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 31A613F211
	for <linux-nfc@lists.01.org>; Sat, 15 Jan 2022 12:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642249619;
	bh=ePWS8huBNB8mOLwzP5l9zhhnqwr/R2aV/N6dfRb+pkA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=F5FgpcJCTa4fSGWvT4Ly+J+9kUXBWyGCWWfBCCxAj8HPirgUHkMHenoUExWM6ZK58
	 f2cMuOWwbaK4ka+ii3wDlLLWFwGVUQT7W4ruSqfYVix+iJ/6zw5a435NJ5pa1Es5rC
	 45Q/SHZ9BZOucC42b4nsFT2DyamJZpBNCO0zPDKA7kdGf2jlUuzo7tCbrWGl688WON
	 +DUrYuYlZ4+b2GLk/nwI4hO/3Fejviyu9UQ3fvqGL4ZjFsegYcSqueysAAuVMr5xpV
	 nOXx4gejjnp8Yw/7JTAmCB+rvXaTnyy+fTolXdlvEgSX1SnMOrRixEcaWbmVq2McsO
	 EdDmtiFUkOrTQ==
Received: by mail-wm1-f70.google.com with SMTP id 14-20020a05600c024e00b0034a83f7391aso6027608wmj.4
        for <linux-nfc@lists.01.org>; Sat, 15 Jan 2022 04:26:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ePWS8huBNB8mOLwzP5l9zhhnqwr/R2aV/N6dfRb+pkA=;
        b=5DOlcbfxP6+dbCu7MAMDjYk5mYGC1wzK8JTKIxJ6wNbcyPoGSFSuhVy7mxyP/8xLIS
         HaHlp/YqvAYKCO3kg/6O09eB34S04aec+9AdlxT37BR9ajetW6R0F3pjpDRNmeI5RSUt
         /4G3SSIiGgjvfp9gkh9864fnZqdCSqhQY8O7gYtF9b9cbQrH5KMXkSiI8KeSXjeXhAwE
         ZMytE6NvNE9W08VwsRpAdAX2bQwmOlB/tSiucECuxRIc5+/HIqK0eC5UP3sJpaXUvOfR
         6EWpjmyZq7XjIgNCmG70Uin3AVPyCp9E8fJzbMeLH98yiY0+41Iq1SPvR0nTu+vPp42P
         +NoA==
X-Gm-Message-State: AOAM5331l2tvPcDCMViF+bD2fckk78ZlrI3LnaalL2CuOxW5TZFycSA+
	GYWcsiquX5C4WX60oxNf5aMNQYh+3aVBHS0v6h4vTZeNv/XM7eGMtOumRJY3KjxQxpH41FZx+UR
	0++7hftjZxdHW+3xmf26zI8deYLVl6QIFbQ==
X-Received: by 2002:a5d:6f0a:: with SMTP id ay10mr12121170wrb.191.1642249618560;
        Sat, 15 Jan 2022 04:26:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbQP4Q1giAJ4uAlzrN0vo+MIFiQCq0DOWWfo4iYlUpIw0pSA9ah1HXa5NlBGI3l4j4jOixug==
X-Received: by 2002:a5d:6f0a:: with SMTP id ay10mr12121168wrb.191.1642249618445;
        Sat, 15 Jan 2022 04:26:58 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id bk17sm7878476wrb.105.2022.01.15.04.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 04:26:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Sat, 15 Jan 2022 13:26:46 +0100
Message-Id: <20220115122650.128182-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220115122650.128182-1-krzysztof.kozlowski@canonical.com>
References: <20220115122650.128182-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: BYBJOMIDOU2YXG7D6WUPGP37W2OVNVZC
X-Message-ID-Hash: BYBJOMIDOU2YXG7D6WUPGP37W2OVNVZC
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 3/7] nfc: llcp: simplify llcp_sock_connect() error paths
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/BYBJOMIDOU2YXG7D6WUPGP37W2OVNVZC/>
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
index e92440c0c4c7..fdf0856182c6 100644
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
