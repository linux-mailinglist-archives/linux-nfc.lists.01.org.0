Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6496748F6B9
	for <lists+linux-nfc@lfdr.de>; Sat, 15 Jan 2022 13:27:03 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 2D402100E6C0E;
	Sat, 15 Jan 2022 04:27:01 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id A0309100EB34F
	for <linux-nfc@lists.01.org>; Sat, 15 Jan 2022 04:26:59 -0800 (PST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DAB02402EB
	for <linux-nfc@lists.01.org>; Sat, 15 Jan 2022 12:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642249617;
	bh=YRVG1n1vJA0XrL2lVGuLt3uwESm9x/YKDmWmaL4GYfI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=H3CMewKeO69OXAD8wdQuU4iFH6ILu5Dmvzh5ssQmTv30Kjg+AZiyAXWtLULNrqvDD
	 XOU82J2C9PA4xVhi2rE8aJ/HoequCobV3KOA3B1DKyZ/wb8+hfs33nMinzJq5kTP7R
	 GSaxb+Uyl1LRHsF2eC5Zbb/MGMrrrvurfWKg+R/lcF1nv8N0E2U3zqQTjYDnW+CKlC
	 rjFuneMVKfujNxcmUGsAVF3yAEfl5jlPXhuyVqrzCEjpOkCjS6me0h81LC6A+zPZy+
	 lN4rMRsbKzRZNbXayaloWEn/d2o8sWqAXckUu4g2sxRQlBmRGADdRXHYiMHWO25RT/
	 h87ZSCu5Q9dOw==
Received: by mail-wm1-f69.google.com with SMTP id k41-20020a05600c1ca900b0034aea0b9948so4674212wms.3
        for <linux-nfc@lists.01.org>; Sat, 15 Jan 2022 04:26:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YRVG1n1vJA0XrL2lVGuLt3uwESm9x/YKDmWmaL4GYfI=;
        b=yMkzGoUadRCZmNOSeBUU4GReZerlACJNRgqVW1Wq/t3Bs1x636DUmpVjMb6UKjQyWe
         wUi//Xr2Tc4i19cGVmTInnn+mTcdcr6sxN6I/j+49qzj+IOi1DEjgmorSVU1CyYkiM0X
         hu37zM1ub8AljBLZan5oH4ODSGo/IAjyo00YQ90TDxPET0/PLkDHpfCujiEZDgfou7/f
         jPLrIGdxD4gqzxUlqQ2nmypi7NlzoC3RmllYIsCSN+/dS8LRCl8NQtGjQLq7Gm/lNUK7
         oeAysUeF0VHCcbkctfRjl/iMuWMLF5zcZfIZxjArbVDVXBIkmc9YMOGnATQhAvMknXCx
         ghpg==
X-Gm-Message-State: AOAM533eYJ46VLru55E47UX0JtMGls9YV/zuM1LHzdnuhjAun6IKk/WH
	zxJ4h4gmMdRtiRDcbbkUh6uWtpk45KsqEC0vvSYa5U5/Oj2I/rxj6Uu0FnSS6Xf1/zBy4TeDJZ+
	3VamLpVNS/LGsiXjkmr0IFpxoQOJH0e/PCw==
X-Received: by 2002:adf:f390:: with SMTP id m16mr12347881wro.651.1642249617123;
        Sat, 15 Jan 2022 04:26:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzprxD4q8/vHQKRv14tzXFqCdIRim3TyjTiDo4rumIOols5/nb1r4v0oXNQ6oWEsRXBRZ4EzQ==
X-Received: by 2002:adf:f390:: with SMTP id m16mr12347873wro.651.1642249616997;
        Sat, 15 Jan 2022 04:26:56 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id bk17sm7878476wrb.105.2022.01.15.04.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 04:26:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Sat, 15 Jan 2022 13:26:45 +0100
Message-Id: <20220115122650.128182-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220115122650.128182-1-krzysztof.kozlowski@canonical.com>
References: <20220115122650.128182-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 3EFPA2G4XMUBFSJTXRAAPGKMYKH5FTET
X-Message-ID-Hash: 3EFPA2G4XMUBFSJTXRAAPGKMYKH5FTET
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 2/7] nfc: llcp: nullify llcp_sock->dev on connect() error paths
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/3EFPA2G4XMUBFSJTXRAAPGKMYKH5FTET/>
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
connect() error path, however an similar case - in the bind() error path
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
