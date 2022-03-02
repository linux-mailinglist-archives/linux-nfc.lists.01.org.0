Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A434CAE9D
	for <lists+linux-nfc@lfdr.de>; Wed,  2 Mar 2022 20:25:36 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4A93E100F3955;
	Wed,  2 Mar 2022 11:25:34 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id CE18E100EB847
	for <linux-nfc@lists.01.org>; Wed,  2 Mar 2022 11:25:31 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 213513F611
	for <linux-nfc@lists.01.org>; Wed,  2 Mar 2022 19:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1646249130;
	bh=ePWS8huBNB8mOLwzP5l9zhhnqwr/R2aV/N6dfRb+pkA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=OqDB+l+JRV4MPEmDj4lf32cqG+Pt9SxR6kg7Ds+fid5NhbPhKD2YmaOcgycudK/jb
	 AHMMF+l7d1/ic2htSTd8NfnotJGKiyLYH5GDXu29JSrNsoJxIEbaW5IbfoHoQ08+s0
	 Iw+ZvwLnEijCMPmyuSp6qyXE6dsBNVsrxCiCNUCd+EseiO9/b491j39JmkA7ohEmp8
	 y2XvzR+0ebxKudBRT87KoIvZD3RAgT9Bz7LEXfwoUsTfP+OKVVV+T4brfWKceAsdIT
	 ROCqOZOebBsUTko+zdZ3rEymQl8VUdMsw3qZtnuK0Tw1sBHFX8S/9bQww2u/5bk5Z3
	 2XiDAZLP9bk5w==
Received: by mail-ed1-f69.google.com with SMTP id i5-20020a056402054500b00415ce7443f4so576301edx.12
        for <linux-nfc@lists.01.org>; Wed, 02 Mar 2022 11:25:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ePWS8huBNB8mOLwzP5l9zhhnqwr/R2aV/N6dfRb+pkA=;
        b=2LBM0Zs4PIlJSpLkvxru25wCE1TM7oBzBzZUKx2fcY7sFmfJe2b0wgqH6pfdKrQjCa
         vToA9xANa9sINQrJKR9L/dXSIllojxz5BIrs94UKsvPguJ0x1+mgatY7EOWev+vPDnbO
         NfYh/SnbxKLOwazVY1zpcY4N9vi8gd492lsvRzypVhUtX/2ZD11+mv20yi/wu7ycybXE
         V6VrgNQQQtw6zaqi/Qkca0WX/2gGg8FNNpqZPVpN+kQNveQlojTUc4t8rl3bCCDFsbS+
         bP8aBp64uR2VTrArqIiGZOpS8c8wVvIEHhbtECsJzyHC678YaM1h6iemZv6gydaqCdhm
         4chg==
X-Gm-Message-State: AOAM533v69oGtZxIifwkfST3gi+ucIN+C/0eLyO2XnM8eyhcZCT7Glku
	5uNNszCb4yjNWb5osJbkf9GzFeqTTrYTbKZ7Tikk95mDBiFPxnbXKZdiV2UnU2Sc8yG7I70JnkG
	93oKwUypJN+PPQTsF5oUFFhiM9rFNOgmjKQ==
X-Received: by 2002:aa7:d706:0:b0:415:a00b:4ee with SMTP id t6-20020aa7d706000000b00415a00b04eemr7325275edq.373.1646249129876;
        Wed, 02 Mar 2022 11:25:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFEFY4wLULZr/eBfkoQpBWjtr5OGYAVw5KfG35wQ8ZmBORByJ1wBNLn5MUEWgSX4YDGpFhpg==
X-Received: by 2002:aa7:d706:0:b0:415:a00b:4ee with SMTP id t6-20020aa7d706000000b00415a00b04eemr7325252edq.373.1646249129662;
        Wed, 02 Mar 2022 11:25:29 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id i14-20020a50cfce000000b00415b0730921sm1482765edk.42.2022.03.02.11.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 11:25:28 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed,  2 Mar 2022 20:25:19 +0100
Message-Id: <20220302192523.57444-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220302192523.57444-1-krzysztof.kozlowski@canonical.com>
References: <20220302192523.57444-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: PGFSKNNMOYABHCLC24T5DFPORFPXELWT
X-Message-ID-Hash: PGFSKNNMOYABHCLC24T5DFPORFPXELWT
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [RESEND PATCH v2 2/6] nfc: llcp: simplify llcp_sock_connect() error paths
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/PGFSKNNMOYABHCLC24T5DFPORFPXELWT/>
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
