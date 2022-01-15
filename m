Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B44548F6C5
	for <lists+linux-nfc@lfdr.de>; Sat, 15 Jan 2022 13:27:25 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 80069100E6C1A;
	Sat, 15 Jan 2022 04:27:23 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 05DA8100E6C15
	for <linux-nfc@lists.01.org>; Sat, 15 Jan 2022 04:27:03 -0800 (PST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5A24C3F211
	for <linux-nfc@lists.01.org>; Sat, 15 Jan 2022 12:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642249621;
	bh=yrlNFOS5f9IRjvA5fm0IVEgclHgNp68QGUe5Q3pp8Vc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=dSB/yMdQR6IlRBkuJgYdjY9Dx8Cpa3WyPSaY2J3Y7zQoIG7n/3jzZR+qI+yMlzd26
	 4prvK9O9bdCVJCiWwYo+POkVYyFVNZE1gfyxjTtbHZTP37kszSTru8VOyL200shyHU
	 OPxga1FKS6OPXIlHLkklgsQ/ruj/gxkii7oJylv+1IkD9Zwk9zFd3aPy6qieOC+Wby
	 DVOQJpfnTTTLItgnZktSbjFIoMAtBdpLiSaOSUop2NPQJ8xFZDVmBe5H0DysB6K/mF
	 80z6NCjKgYUs5TXKQabpgKYG+i0UZvVLhG7k/pJCUL2ifM2+0W/WHDXnlMZ+1KNNkN
	 nWuphciUco64A==
Received: by mail-wm1-f72.google.com with SMTP id b2-20020a7bc242000000b00348639aed88so3586708wmj.8
        for <linux-nfc@lists.01.org>; Sat, 15 Jan 2022 04:27:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yrlNFOS5f9IRjvA5fm0IVEgclHgNp68QGUe5Q3pp8Vc=;
        b=M5Ex/JwUIwo2prDx/YgQ4gqHJwxspJEaIJ+mlyQhlVLUBs9Apcq/l80aYE+A99fUFB
         mzJRYaECcFjI5jDOTC/mgLUcG7DnnA2Wd69unZZ2WzEGA8P6+i4e2TDiSO19ZiPV5788
         PYsB0MtR5AL/qOeF1CDYFeVFLYGUiFyCzQJBWHrMe9i6ElIuI/JPaprkuhHl5n7UG48O
         jruciF2d3wrCAqMc+Ejz9++7XVo7rBOF+7iXumD9Lku3dNmzjaS9ypJcF1GQmyku2l+t
         LUM0gfeJPjG9/Xo9RmKEEmeCS8YoktTFHP/6UkHewvbJG/+SHVA/bT9WHQyN+oeLm+GI
         FymA==
X-Gm-Message-State: AOAM532QQSi5KG3QJdXNy/7+fVbxIrZadoYLKZhuvMipdCMNEgS5Dqm0
	0lEv0RjpsxuHmX8M3WSE7VOaxIbhDQ+F+cHuvHFSDWldfjGS129IrFhIMIj+Fg9D6cNUqw2ASLv
	nzdBfDDiFJO85+r//gM60YRmOZZofSga9uA==
X-Received: by 2002:adf:f0d1:: with SMTP id x17mr12129017wro.223.1642249621083;
        Sat, 15 Jan 2022 04:27:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuosj48Z96wc9CpVVg353GMRvCJEBxDaoKE+PY1MPfJ8vkd7s+FLfB9jQET/3Y31fE7LgFfQ==
X-Received: by 2002:adf:f0d1:: with SMTP id x17mr12129002wro.223.1642249620903;
        Sat, 15 Jan 2022 04:27:00 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id bk17sm7878476wrb.105.2022.01.15.04.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 04:27:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Sat, 15 Jan 2022 13:26:48 +0100
Message-Id: <20220115122650.128182-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220115122650.128182-1-krzysztof.kozlowski@canonical.com>
References: <20220115122650.128182-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: HACHOMCGYDJ76F6C4UOLUQVI2WXM3YNR
X-Message-ID-Hash: HACHOMCGYDJ76F6C4UOLUQVI2WXM3YNR
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 5/7] nfc: llcp: use test_bit()
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/HACHOMCGYDJ76F6C4UOLUQVI2WXM3YNR/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use test_bit() instead of open-coding it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/llcp_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 5ad5157aa9c5..b70d5042bf74 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -383,7 +383,7 @@ u8 nfc_llcp_get_sdp_ssap(struct nfc_llcp_local *local,
 			pr_debug("WKS %d\n", ssap);
 
 			/* This is a WKS, let's check if it's free */
-			if (local->local_wks & BIT(ssap)) {
+			if (test_bit(ssap, &local->local_wks)) {
 				mutex_unlock(&local->sdp_lock);
 
 				return LLCP_SAP_MAX;
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
