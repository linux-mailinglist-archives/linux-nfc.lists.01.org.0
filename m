Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C954CAEA2
	for <lists+linux-nfc@lfdr.de>; Wed,  2 Mar 2022 20:25:41 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 73C96100F4844;
	Wed,  2 Mar 2022 11:25:39 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 257C7100EA925
	for <linux-nfc@lists.01.org>; Wed,  2 Mar 2022 11:25:37 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CC9653F5F4
	for <linux-nfc@lists.01.org>; Wed,  2 Mar 2022 19:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1646249135;
	bh=k1fbxXsPvGzkuFTuMvPObzXkHdaiukX+p5UqHJ6OWe0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=PLYvzh17ADSUr1aiV9fmKtJnTScgSkeChmd0EwyYWDVsVOGK2x0qjqwdUFpCWG4bY
	 nBwqr5G5JKiuSbIA+QesQqMuqXo2ShkdUUs7tbiX99nLDu2s6rFw5hxlExAkrThCLT
	 g/quANbgfIVDbPsv2hY80x9kTyW0M/NgrsLTIOrmjghlfUShfYOWOxg1mx8arotdi7
	 PMmkiu4vlxPqd7Os5QHKlmRh+TFepSNxWO6guRJO4RHhA+7RGjWE7lIxiIYizvW10G
	 VHZdxalRMno3kWtqbp/ldpy18pbnx2QQA72Qhyi0hoUkXfXGE8Iw+SO20AU/ZsbP/6
	 dSBZthGbUXIeQ==
Received: by mail-ed1-f72.google.com with SMTP id z24-20020a50cd18000000b00414d5314c35so1519302edi.21
        for <linux-nfc@lists.01.org>; Wed, 02 Mar 2022 11:25:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k1fbxXsPvGzkuFTuMvPObzXkHdaiukX+p5UqHJ6OWe0=;
        b=ofCGkZwYdcBV2kfOwKtt2c1gn0UgHFsEZI4LbxVjV3Y6e9xb0C/Pimm6WxOljjL4PP
         MvxxbxjjZ1acMNUYGSI4cR/Wwze77jnbZRz2fWo2DDeRK6kjzz2FwJLI1jg50GLpM8Cm
         7fDn9GDA26hP14e0vSRKwuIQiKAtqKfZg/hQL5MJO9Z3+w8fA+18zfaBtBS5ILfqnOaX
         oRFDuEwjzckWJ9uPP89rgAZ8LNvd+BogmbCflOMeLDaQLBLjvGRO0QJDRy5tu5hX5wDW
         cG59gMcNDsfBoTHakSreAVSrJXDB3HnkH1CK7D8FdQuGzgm5jCaP5esZk3MnPNL6V0O+
         45vg==
X-Gm-Message-State: AOAM533bm+l5hc34wRSQO+dKLSjjpH2vQU2X4Q0oipNnnIFGWHyogw4F
	FmwbeZbbNQeN+bAMyzyfpOcnySf7bWidQJLf7Z6j9ZKrSauPY0uaclS5lca0hgxodf5PDF8oCtQ
	z0q5QdjS35bGzT5rP3pdIbvn7YtQ26ICxCg==
X-Received: by 2002:a17:906:18b2:b0:6d0:ee54:1add with SMTP id c18-20020a17090618b200b006d0ee541addmr24364522ejf.499.1646249134540;
        Wed, 02 Mar 2022 11:25:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQ2Yzk4nLxgx+97QWgQ7U+3qiE+VAfZ5ZxF3hEUaZA9fAEq5MaAHHtVajBlFnerH2vg2MVHw==
X-Received: by 2002:a17:906:18b2:b0:6d0:ee54:1add with SMTP id c18-20020a17090618b200b006d0ee541addmr24364498ejf.499.1646249134294;
        Wed, 02 Mar 2022 11:25:34 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id i14-20020a50cfce000000b00415b0730921sm1482765edk.42.2022.03.02.11.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 11:25:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed,  2 Mar 2022 20:25:22 +0100
Message-Id: <20220302192523.57444-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220302192523.57444-1-krzysztof.kozlowski@canonical.com>
References: <20220302192523.57444-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: ZPRA6UH6QF5HISVCGZSXFIRP6SOSKCJT
X-Message-ID-Hash: ZPRA6UH6QF5HISVCGZSXFIRP6SOSKCJT
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [RESEND PATCH v2 5/6] nfc: llcp: protect nfc_llcp_sock_unlink() calls
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ZPRA6UH6QF5HISVCGZSXFIRP6SOSKCJT/>
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
