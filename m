Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A724CAE9C
	for <lists+linux-nfc@lfdr.de>; Wed,  2 Mar 2022 20:25:34 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 356A9100EAAFD;
	Wed,  2 Mar 2022 11:25:33 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 4AE1A100EB847
	for <linux-nfc@lists.01.org>; Wed,  2 Mar 2022 11:25:30 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A97E43F60D
	for <linux-nfc@lists.01.org>; Wed,  2 Mar 2022 19:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1646249128;
	bh=KE7cA2DH2YKQP2Gc57E040M9nuLXTd4XcLilkBUwOrw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=I41jrS7wEjcSy0G+jxzxKf/L+uALLOGTdGHRJzb5RCJJe5LwHrFcQ2M5PIVw2/UMT
	 QN0WsJUKJ0yitn7w9xHDW2lNrasO9gSdNhfNK6RAabJcTB62x0Z2zYYbytpykONp/E
	 eX74Plj5CFuJEC/vAcJUK08zX0CXGqnXrdZZcIIzGJjOquT0smIxEi1IsggbfL9uQZ
	 l7zh3B3VyeO+5WOWzO9UjMpCDvpIyus/Y8MVF1nxWPEN1eWJD0Vm8Kgm/yXyYowsde
	 BJP9P+5MQwjmcddNaGX5XbjoSOgwbvRpr67t8QKKqfYv3YG2zEyk4W5cWmlNpNlRDI
	 m12S34JOgu6sA==
Received: by mail-ej1-f70.google.com with SMTP id k16-20020a17090632d000b006ae1cdb0f07so1479353ejk.16
        for <linux-nfc@lists.01.org>; Wed, 02 Mar 2022 11:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KE7cA2DH2YKQP2Gc57E040M9nuLXTd4XcLilkBUwOrw=;
        b=dw9+30jwCNblm+dBwPe5+BXPSqEixzeg75Q6OYjAlohsDNkonln3nc8gW9jCB8Q5HR
         xaRKvn0a6U1+tVbn0GkoweLSRBV0JLe0TW5r1olLpxi0FhWg/cSbRbMwRpVMuioGX/vO
         6Apt465958BpIse/Dv9jnXhxVXnW3dbDz+Gv9J3nMHjyzk46iHqOOhKDBkvDVF2wUAS+
         PLQn73UUSHjFzM8qXMkIEXQgzjh1LYFg3bZV+IrReC5d+ntixL65YFwuyIaqKTGu6A/+
         E0Zx6PUVIvWBVqmOFVc9/F8o9a3+4QQ8I5BVUiA0arOTGW4X3z7k96sINWL5c0OOqDMw
         cT5g==
X-Gm-Message-State: AOAM531cAu6GvphZJDm5VcqAF7MMvKSVvhEBO2O120oBeFlkvatBZwIw
	gfTAMZk9Qb8QL7/PE5L5xw4895zKh/eq/3fAtIHbRF//VguOJ1S10juEfPLfxec+XWr30uGspdl
	VwCZXpzrzzYswvKEqUjEcLZzjzNQc85XZIQ==
X-Received: by 2002:a05:6402:369c:b0:413:2bc0:3f00 with SMTP id ej28-20020a056402369c00b004132bc03f00mr30801301edb.126.1646249128344;
        Wed, 02 Mar 2022 11:25:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzj6ncNvbB8cHRaUtjFkSKVI4lc6ShTlpArR4gywnj3ywk9IVqiotnQYISrRs1enqnteey6vg==
X-Received: by 2002:a05:6402:369c:b0:413:2bc0:3f00 with SMTP id ej28-20020a056402369c00b004132bc03f00mr30801289edb.126.1646249128190;
        Wed, 02 Mar 2022 11:25:28 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id i14-20020a50cfce000000b00415b0730921sm1482765edk.42.2022.03.02.11.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 11:25:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed,  2 Mar 2022 20:25:18 +0100
Message-Id: <20220302192523.57444-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220302192523.57444-1-krzysztof.kozlowski@canonical.com>
References: <20220302192523.57444-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: FKCSKYSKFFKICQ4VZIZV3Y46USW2W627
X-Message-ID-Hash: FKCSKYSKFFKICQ4VZIZV3Y46USW2W627
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [RESEND PATCH v2 1/6] nfc: llcp: nullify llcp_sock->dev on connect() error paths
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/FKCSKYSKFFKICQ4VZIZV3Y46USW2W627/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Nullify the llcp_sock->dev on llcp_sock_connect() error paths,
symmetrically to the code llcp_sock_bind().  The non-NULL value of
llcp_sock->dev is used in a few places to check whether the socket is
still valid.

There was no particular issue observed with missing NULL assignment in
connect() error path, however a similar case - in the bind() error path
- was triggereable.  That one was fixed in commit 4ac06a1e013c ("nfc:
fix NULL ptr dereference in llcp_sock_getname() after failed connect"),
so the change here seems logical as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/llcp_sock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 0b93a17b9f11..e92440c0c4c7 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -764,6 +764,7 @@ static int llcp_sock_connect(struct socket *sock, struct sockaddr *_addr,
 	llcp_sock->local = NULL;
 
 put_dev:
+	llcp_sock->dev = NULL;
 	nfc_put_device(dev);
 
 error:
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
