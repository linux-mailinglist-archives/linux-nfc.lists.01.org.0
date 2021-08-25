Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB833F7741
	for <lists+linux-nfc@lfdr.de>; Wed, 25 Aug 2021 16:25:50 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E7C95100EB331;
	Wed, 25 Aug 2021 07:25:46 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 7F220100EBBC0
	for <linux-nfc@lists.01.org>; Wed, 25 Aug 2021 07:25:45 -0700 (PDT)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4AAD0407A1
	for <linux-nfc@lists.01.org>; Wed, 25 Aug 2021 14:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1629901544;
	bh=/Sti3d7dTsAvFFog+hxbk2kz5ugUXJNgSZrotBprAFw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=WWpJ20v0MS0PpUdRnaoVkD6soYjRUz6qwZ+i/xt+SfTomU0Icqfph7Si81KC8qkO2
	 jv74gyzFZadn5GVJsWADF9UvJaPvXS2ynj31pqoVfP3gHleLrFZou4XFxX7ZNJuZQc
	 9aBE80gl4uQYRFCNwa9p+KJm4ARXetqKTP1nWgM7OclbQ6fW8BbRu18FtTt5//qYOa
	 +hl0tc2W7+uPZjCOFwHiQo9GaYjGElF/QbH5Mds2xgePV59+LftJifDlmdjdyisNRx
	 d/LDyXNw5gdeUcakMu3WfVytpyR3ts2IaDExLecoz7UvhN4p5zRAonCKvC9jJevc5d
	 eOKCJ1DWdKU/A==
Received: by mail-wm1-f71.google.com with SMTP id z18-20020a1c7e120000b02902e69f6fa2e0so5362536wmc.9
        for <linux-nfc@lists.01.org>; Wed, 25 Aug 2021 07:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Sti3d7dTsAvFFog+hxbk2kz5ugUXJNgSZrotBprAFw=;
        b=T1AyPOAp1SZRdpbqp1NXB4OkGkU88Ufq1iMpFqU98wGAbAcXoifzNc59ON7eMtc5ph
         PP5RYUVMQ4Y6vvxFdGQeKhTZHUUAC+Xh35sAq2Iu2mz1gPovrA1xQ8ZCIn3Iof7fhB6Z
         plqLm1eW0pU09luG7BsbIEapC/wg3oshfKZdnsKxHyukE403Ah+gWn9SRzR5255ZxIlG
         GcHrCY7HW21pfIHarxXT9ooWGQmstuHDdoYJUQ86v4WSWkDjQmSMNvrovffh1JUkI5yg
         4BP9e1HlmuDZmP5oyqNX3GfY5WeVOegLoyoAt/pQ8iSqwtZklYGkA2ow3APrwj3YCqXT
         tmsw==
X-Gm-Message-State: AOAM530rBXvXZaogAFMVMsl3otyuvTqYhP2M8UnybsnOpp3eH/fXXNdp
	aEnqoo7kjtF5RbIa8GdbEoFoRgiUgprj9piaegBAqulq7wtl1LG8X1hl3aJxAGcn+msukIYy40x
	2Ygt5Omz0GU7LI+S7Ieh81PPfUz1mXRFetg==
X-Received: by 2002:adf:f743:: with SMTP id z3mr18233456wrp.211.1629901544047;
        Wed, 25 Aug 2021 07:25:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpfqvpRdkvZvU3MkWbfHGPyUtkfWdIQce42bWzJoCqPmksHWSzq/AF1H2GKY6BtbSsA66n2A==
X-Received: by 2002:adf:f743:: with SMTP id z3mr18233446wrp.211.1629901543956;
        Wed, 25 Aug 2021 07:25:43 -0700 (PDT)
Received: from localhost.localdomain ([79.98.113.233])
        by smtp.gmail.com with ESMTPSA id i68sm60375wri.26.2021.08.25.07.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 07:25:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed, 25 Aug 2021 16:24:56 +0200
Message-Id: <20210825142459.226168-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825142459.226168-1-krzysztof.kozlowski@canonical.com>
References: <20210825142459.226168-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: FKX4OUPYJS7CIT3ZJEJ7RMLMCBOEEB62
X-Message-ID-Hash: FKX4OUPYJS7CIT3ZJEJ7RMLMCBOEEB62
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 3/6] nfc: pn544: remove unused header includes
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/FKX4OUPYJS7CIT3ZJEJ7RMLMCBOEEB62/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Do not include unnecessary headers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/pn544/pn544.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nfc/pn544/pn544.c b/drivers/nfc/pn544/pn544.c
index 092f03b80a78..32a61a185142 100644
--- a/drivers/nfc/pn544/pn544.c
+++ b/drivers/nfc/pn544/pn544.c
@@ -13,7 +13,6 @@
 
 #include <linux/nfc.h>
 #include <net/nfc/hci.h>
-#include <net/nfc/llc.h>
 
 #include "pn544.h"
 
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
