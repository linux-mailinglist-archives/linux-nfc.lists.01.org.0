Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A24E448F6C4
	for <lists+linux-nfc@lfdr.de>; Sat, 15 Jan 2022 13:27:24 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 680B9100E6C16;
	Sat, 15 Jan 2022 04:27:23 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id C4B0B100E6C11
	for <linux-nfc@lists.01.org>; Sat, 15 Jan 2022 04:27:01 -0800 (PST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A865B3F1E5
	for <linux-nfc@lists.01.org>; Sat, 15 Jan 2022 12:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642249620;
	bh=XW443xLXNMd7fKnAwsj5MsweNUN/P9g1RwySZfWsL7A=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=kAyFx/JNGNxvnqNVk79wHaTbGDFtnx4sATPuW9MUSya73fwOhaTTQX6fMDvfiyixf
	 3Lh5AjlQXxmiwgAVGb4XaFUPtfywNOsGtQ/7fjQp7gGM+Vjw2JUmmCGevwxHM/cP4w
	 EFJgnrFxn9CxXugv9iJt4ayv3z67Qo6gJ4GwNH/3d5AzTnOarPeP08r+VUO+s4uWcY
	 KY8Yvxcg4QSymHZu0M2vDTNmUfDa+orosq696XND6t4HumAq83hgUPcMryUne1h02o
	 g4Jdg5GDk5UGwE7inGND/sTKRImBpAip73040+BWCTbrDIBb9ndoNqqsdsvi57Pep9
	 6cO/+YlHWzLig==
Received: by mail-wm1-f71.google.com with SMTP id c5-20020a1c3505000000b00345c92c27c6so9821737wma.2
        for <linux-nfc@lists.01.org>; Sat, 15 Jan 2022 04:27:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XW443xLXNMd7fKnAwsj5MsweNUN/P9g1RwySZfWsL7A=;
        b=dVjVZO7zpfmPnl6iA4FB7679y7isN73cuNwrpjHNeCNBrSS4+aJ2C1RU7jJ2JYsULS
         q6/Q5oQosVVYa5RncX63xtUVM3iMFZgosrPEPye0kAN+zuO8ls1dLXUF8QjQHFFR57P1
         RT6XbgnmUxtLRjlNXz8eGJRuid+NGJyZfILxeCDA4jf8JYRNzdsCuGDoU7zUMXrZ+4jJ
         JjfgqffqML/Tf8HsNdbWXoYDHZU7BTbsCYyTpskygnp1W9o4xemhn85q4FfhQR5hZFWD
         H6d0Bpa1M+HWMAFT5Fm8+eRrpTOmx+x/A/0ig5wDOsxK/rsaEE2SwACZnUHG9bWMs1Y/
         qayQ==
X-Gm-Message-State: AOAM532h5TpCT81zn+i3miyVGIBg++biTjRWaCgy53AZ891vjcXzceX4
	ojE4fu73Lm/EsPr6KBNNgPRBx+mNYPL9G/qb4yURgMcc4tIqqPCWqw3o27CxWXqYNknUuILzTRT
	LWx1swjpJ9uAKpcm06sQhDiHB4pycHebOsg==
X-Received: by 2002:adf:e810:: with SMTP id o16mr918247wrm.148.1642249619802;
        Sat, 15 Jan 2022 04:26:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmyGxwz6Gt13RegtMp19MSWLXNTMDHakRk1jf3lOXKJSBHxsTjjfU5CLCgc4+yB+jzAl2W2w==
X-Received: by 2002:adf:e810:: with SMTP id o16mr918237wrm.148.1642249619675;
        Sat, 15 Jan 2022 04:26:59 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id bk17sm7878476wrb.105.2022.01.15.04.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 04:26:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Sat, 15 Jan 2022 13:26:47 +0100
Message-Id: <20220115122650.128182-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220115122650.128182-1-krzysztof.kozlowski@canonical.com>
References: <20220115122650.128182-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: MGZLMEETUJPLC7J57LVWPJ6YNF27SPLL
X-Message-ID-Hash: MGZLMEETUJPLC7J57LVWPJ6YNF27SPLL
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 4/7] nfc: llcp: use centralized exiting of bind on errors
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/MGZLMEETUJPLC7J57LVWPJ6YNF27SPLL/>
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
