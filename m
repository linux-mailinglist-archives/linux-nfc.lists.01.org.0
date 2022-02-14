Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD514B5026
	for <lists+linux-nfc@lfdr.de>; Mon, 14 Feb 2022 13:31:30 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 68FF2100E5D8C;
	Mon, 14 Feb 2022 04:31:25 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id BF827100EA13A
	for <linux-nfc@lists.01.org>; Mon, 14 Feb 2022 04:31:20 -0800 (PST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7D25B3F1AE
	for <linux-nfc@lists.01.org>; Mon, 14 Feb 2022 12:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644841879;
	bh=AoZV4y2QRRH0BjLRzvgAm2n+Q/cTz8stmI3ge5zLamw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=TFQY1Bzc5q7xkYlAVprF6xMydlhkyQ6HM1rZiShu834jIUxSc1A+LQwE4TGfk8n0y
	 OU4VSJ6WKXDkQozUU2bEqXtSSMVZILlVm1JR741GvLDCT+ksVWhwwmzkwCpIim8E8K
	 4tEA1p4qbyZyBv+8UZM96lgL64L1Lz7ix/UWm3obbcZok3idEB6B2ATJ7M24o5BS7p
	 354j2ZkUQ5b4jkFQMv0beVznm9CYUR7pqEriqbWYrKKobY3dk8yAu81J4wODFFaGb0
	 IenY6d5UjeTZI0pGwu4XyCNeEJo3v3gRO9YjEY9M7wLukLGpwYtDnB1HLlYuyZg1FM
	 C6vqw+JX+Zu5A==
Received: by mail-wm1-f72.google.com with SMTP id r16-20020a05600c2c5000b0037bb20c50b8so4947116wmg.3
        for <linux-nfc@lists.01.org>; Mon, 14 Feb 2022 04:31:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AoZV4y2QRRH0BjLRzvgAm2n+Q/cTz8stmI3ge5zLamw=;
        b=1XVY9ZTq5mUVJW+74Ag+5s6mrTbN5F6D8myllUP/c3dZ0SHDixdr95tKGel43wN78t
         ZKsmmcwLkx89Bpf9P1C8rhbfYwWIDHIGEZpFXCfSy54bQbOAe8E6hQXHJlFJfDcp3nm6
         pp8xI09TvUe+1QYXaHBQaNw9I+MdS9TsMdKCY0gpIpV2zWzj79I07bjzdS2lN8WKjZxD
         6hgFrIMR3W0Di9rt3RlNxnu4KLnaBXeK/tSQOiU8AR2nzKjqB1zEF2M4Q7W/MwsFYI5t
         iDKAdNUza89SiKf9LfE9quzn3qYasB1s4sx3xdQ/rF3DNrsOvQexqct8wzmq12tLx3Rp
         BnsQ==
X-Gm-Message-State: AOAM531tdDxUYpsH6UEfuyEy/nUH0dNoRuxmAF+R52IVjEXBuAi4yLbn
	Zxd5+n67eoiiYW7wryp7gEvOROTGHtxOZDNBCTsvTrqp6XJliR24/7xM2hVbjlyR3GNLpxscF82
	l+Huy0bEwMb8qru3/QDFL1lC//X/iDtexIA==
X-Received: by 2002:a05:600c:2204:: with SMTP id z4mr5544449wml.127.1644841878993;
        Mon, 14 Feb 2022 04:31:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8ZMUUR30yz/inXVgUtMbo5G3v9rUlFSgrNzcbXTShGrSX9zjKHTWwUHyh6XR2AP+gSN6+xg==
X-Received: by 2002:a05:600c:2204:: with SMTP id z4mr5544438wml.127.1644841878802;
        Mon, 14 Feb 2022 04:31:18 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f14sm9853832wmq.3.2022.02.14.04.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 04:31:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 14 Feb 2022 13:31:10 +0100
Message-Id: <20220214123110.27056-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214123110.27056-1-krzysztof.kozlowski@canonical.com>
References: <20220214123110.27056-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: CUWVGIJCMN2JOVXP67XOO6H2HP3CIGQE
X-Message-ID-Hash: CUWVGIJCMN2JOVXP67XOO6H2HP3CIGQE
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 3/3] include: sync nfc_copy.h with Linux kernel v5.17-rc4
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/CUWVGIJCMN2JOVXP67XOO6H2HP3CIGQE/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use include/uapi/linux/nfc.h from Linux kernel v5.17-rc4.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 include/nfc_copy.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/nfc_copy.h b/include/nfc_copy.h
index f6e3c8c9c744..4fa4e979e948 100644
--- a/include/nfc_copy.h
+++ b/include/nfc_copy.h
@@ -263,7 +263,7 @@ enum nfc_sdp_attr {
 #define NFC_SE_ENABLED  0x1
 
 struct sockaddr_nfc {
-	sa_family_t sa_family;
+	__kernel_sa_family_t sa_family;
 	__u32 dev_idx;
 	__u32 target_idx;
 	__u32 nfc_protocol;
@@ -271,14 +271,14 @@ struct sockaddr_nfc {
 
 #define NFC_LLCP_MAX_SERVICE_NAME 63
 struct sockaddr_nfc_llcp {
-	sa_family_t sa_family;
+	__kernel_sa_family_t sa_family;
 	__u32 dev_idx;
 	__u32 target_idx;
 	__u32 nfc_protocol;
 	__u8 dsap; /* Destination SAP, if known */
 	__u8 ssap; /* Source SAP to be bound to */
 	char service_name[NFC_LLCP_MAX_SERVICE_NAME]; /* Service name URI */;
-	size_t service_name_len;
+	__kernel_size_t service_name_len;
 };
 
 /* NFC socket protocols */
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
