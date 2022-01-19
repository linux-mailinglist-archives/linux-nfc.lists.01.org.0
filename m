Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAED4935D8
	for <lists+linux-nfc@lfdr.de>; Wed, 19 Jan 2022 08:53:19 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 09BFE100F3959;
	Tue, 18 Jan 2022 23:53:18 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 35E04100F3952
	for <linux-nfc@lists.01.org>; Tue, 18 Jan 2022 23:53:16 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E3D2F40018
	for <linux-nfc@lists.01.org>; Wed, 19 Jan 2022 07:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642578785;
	bh=5w/EAxi3BWNa4bEEDcXXXFqwUZVzXL/jpIlNMT11cAw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=loNBMorjQGultM2jhX+DevSvczJjc9pHvyw7LW99zlDSs4WbZtDdwv0xWDkwupPqN
	 kNIVEYM3EXkxniRvQzAQOOjE1F0tBZy/XSDOxJk60+B5y26N0Z92VHGvCMFTg5cK3g
	 s3MwhvFFizTLnZyXB1WPb4ABvZ+H08nvW1DP5FRrs5g8OlNmPe8HwU4revuDSpRxLu
	 Oj2WHT+fEZzsTag1S4ii5LGCrzFZogKgOMJdQ3Zput2W175jdplFY94zTlfSlKbui+
	 J4c3OLMlMczOIeqNT/IMCYgnXlMJGBho9slnZPJTGdkx64rvVrl0ZAof/WfBBelkG5
	 qM6b3vdMMriIA==
Received: by mail-ed1-f70.google.com with SMTP id a18-20020aa7d752000000b00403d18712beso1465793eds.17
        for <linux-nfc@lists.01.org>; Tue, 18 Jan 2022 23:53:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5w/EAxi3BWNa4bEEDcXXXFqwUZVzXL/jpIlNMT11cAw=;
        b=31U6EQ/+XGsF0jwx7OIQ3QqZX6g/kbHReR4AI/0MjqnpIT7dtWq33yNbWG1fasZEv5
         UiVeZlHEACoH3uCsKHfZe9yHcfum76RpklgR85r5yNMHNx3ifVlNtJerl6g8CUhLL3MR
         mpcyLlPFQ5AkFb5FeH+/3CSUdGDlpzMtXdIE1PCYa9lsCLRPbPOry7AtmXOzu+buPPge
         gP9X0R3RiG46BhYbPx/TYXtq1qK5g8pfI6fq4LOU9jk+EtfkL8MqHevSAUhVc1A9rYWb
         +8kLCD2Cl2GYS58DhOERs0wjYtok9pnHT7bmLah0/vjRRBFARDNK0/pP4kWkRmAwX8oJ
         pJ9Q==
X-Gm-Message-State: AOAM530nY8mBkRebq2SKZm2qZFvQgaQMvDt/ICbDiAqGpO049NS0vQfw
	7h6m1rGH2LRPBU4jcB0YCSAS2mU1PfDQ/bgAF3eIjouTUPXeUdda9MxvdolHBptviFnA/weHW6L
	N7bPyaMXe+YNdwTw7dR1M8ym/J8VKXhi1Ew==
X-Received: by 2002:a05:6402:4244:: with SMTP id g4mr6483611edb.271.1642578785494;
        Tue, 18 Jan 2022 23:53:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYUDYe5Iu0UOqAPwEgNesa55/g4cd+jnk3TlZFlICHhPfLFfLvKw8cfJ2BVa1of970eRb/Ng==
X-Received: by 2002:a05:6402:4244:: with SMTP id g4mr6483602edb.271.1642578785369;
        Tue, 18 Jan 2022 23:53:05 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id w17sm805286edr.68.2022.01.18.23.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 23:53:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed, 19 Jan 2022 08:52:56 +0100
Message-Id: <20220119075301.7346-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220119075301.7346-1-krzysztof.kozlowski@canonical.com>
References: <20220119075301.7346-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: JKFO6SHUZ7O2C2NANO3457O2ACYWKX5T
X-Message-ID-Hash: JKFO6SHUZ7O2C2NANO3457O2ACYWKX5T
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 1/6] nfc: llcp: nullify llcp_sock->dev on connect() error paths
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/JKFO6SHUZ7O2C2NANO3457O2ACYWKX5T/>
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
index 6cfd30fc0798..d951d4f0c87f 100644
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
