Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC5848F6C6
	for <lists+linux-nfc@lfdr.de>; Sat, 15 Jan 2022 13:27:37 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id A3F7C100E6C18;
	Sat, 15 Jan 2022 04:27:26 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B9974100E6C23
	for <linux-nfc@lists.01.org>; Sat, 15 Jan 2022 04:27:13 -0800 (PST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9F4B94074F
	for <linux-nfc@lists.01.org>; Sat, 15 Jan 2022 12:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642249622;
	bh=k1fbxXsPvGzkuFTuMvPObzXkHdaiukX+p5UqHJ6OWe0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=b4h6sU01ezgtViqkPX5VjAUI5cQBYk1VW8y5ymo//qJonPQhkGJXyW3jeBVC53Z7n
	 pVO2nrrpttg62+0I+DXzKVxEQGMySjAGVaJNUYN9arOKtx2hXH2pLr2JHFOlFRoOD3
	 5JL3ple6uYK5KDlAv+QOBCSJJ2Uea4LGQN2Or8b4kMthZzlpJ2cCRcOhn5zWTmy2Ci
	 mrvAsIyCGDXvchcgTKA4EZbJ/Rao/70kMsczoVBcfs0lNiwOfyAIgdTxqks5H+e0UW
	 VsfAW40/Cl9DXbU7DMuKi6lV/YpHioFtNfWSo8a6YV3147n+SZYZhZ4qCfQHaNLhjl
	 oVp0gI82hYdDA==
Received: by mail-wm1-f71.google.com with SMTP id k41-20020a05600c1ca900b0034aea0b9948so4674293wms.3
        for <linux-nfc@lists.01.org>; Sat, 15 Jan 2022 04:27:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k1fbxXsPvGzkuFTuMvPObzXkHdaiukX+p5UqHJ6OWe0=;
        b=uSor53dmKqgUaz2qYW31GAr4AVHZtkeDk+YT8Sr93DfHWAWFisBgymGWPPiam01KY2
         9EsGv7sawPti8G48f39rBZrEqcsYU0sstWG/0mKuabKYkBTGdC6KH8iDbYCiV5isZS1u
         HaP50SSNadBUeKT31z2K8Dwh9K5vY3A+zNaIHG9L/tLNlyOIKcVBabdz3EGhH9GOa8II
         aDdXFUJKgJuHCKbzRK5EQ92zo0yt22um221nurbFlRcYYgy4e1F+gQl/kQkPPcqKgkfD
         zXQwE+UEAarhuXTqsBfT9VkTL1WYZI43CdszyKCN17QDjyhguDolCRuWSRt0aGhRuixz
         UBVA==
X-Gm-Message-State: AOAM53340pX4m5lJBn8pK1PfTosAilrvNO349rBLKS2nvSBCyTbceBWK
	izkWipbukFVCRYqOzUP68b3LOtzKnCYumUVvElfeo6ayCGEZLhlPc3bGX53hPDRb8CNzh+72sxA
	+yxc65TxffgtirGTKjQM07Y8DQrqQVCS4Yg==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr12363536wrr.106.1642249622359;
        Sat, 15 Jan 2022 04:27:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXCX9qNHfjpMa31u9yvOahIXiFLP9Aqa1v2s/wcOF8lsTtZYY/Ms1xdIFV/FMREuwupnobnw==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr12363520wrr.106.1642249622169;
        Sat, 15 Jan 2022 04:27:02 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id bk17sm7878476wrb.105.2022.01.15.04.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 04:27:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Sat, 15 Jan 2022 13:26:49 +0100
Message-Id: <20220115122650.128182-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220115122650.128182-1-krzysztof.kozlowski@canonical.com>
References: <20220115122650.128182-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: GRYXHVYQT6TIFKBDFH4JLVTWZ7MS5G2C
X-Message-ID-Hash: GRYXHVYQT6TIFKBDFH4JLVTWZ7MS5G2C
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 6/7] nfc: llcp: protect nfc_llcp_sock_unlink() calls
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/GRYXHVYQT6TIFKBDFH4JLVTWZ7MS5G2C/>
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
index c9d5c427f035..5c5705f5028b 100644
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
