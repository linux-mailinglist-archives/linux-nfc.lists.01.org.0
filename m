Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4333DBAD3
	for <lists+linux-nfc@lfdr.de>; Fri, 30 Jul 2021 16:42:19 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4AAC2100EB855;
	Fri, 30 Jul 2021 07:42:17 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 353FA100EB82A
	for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 07:42:14 -0700 (PDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 1016E3F047
	for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 14:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627656133;
	bh=lpVZTJlpKGPodj4MHtc+rObtHPXyuiLkFrg5L18y8PI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=Um8cfwRwb4P7eWhWO7sYFJU1UF3AvYuziymLzZnEJH9xCvBXURp1bm8yzELOgGESC
	 6ybjUD4sWcfWYXAZfeBF2+WwrXOITZ+c0AoI4mZX6IiFApe+K7EvcqTZDXcInNodxe
	 oTj2UVEf7rTsYdxb38RJ+YSgroqATHC/qzZEErA4RYPLBtY8E5TBETKNTKB2uf+9nx
	 f8nFQa/wjEiuX6ZzQ2lJmnQp739DSQNHFuAOOJ0s38+UMBSiz6oI3BVecVO9qry6gX
	 1Skl22Ytejcsbm0xDdSFqzdqCLHtWmv+v5rnIsMwDHa32VW0SOA6HtMe5WkeMLK8HV
	 XbgtE4W5hYgVg==
Received: by mail-ed1-f72.google.com with SMTP id h16-20020aa7de100000b02903a6620f87feso4736456edv.18
        for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 07:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lpVZTJlpKGPodj4MHtc+rObtHPXyuiLkFrg5L18y8PI=;
        b=p1tX7BjQu2pxGAR0FS1OmJKLFpDbwuxc3TnHi1inZNBgSiXYs2Sbk4NA7jAbwT0719
         wAKBstCEc1TkxBAL8/HyEkukwVaQNRUaq/CnJMYXuAEijSsDzQoNDdVztiJ6QG96OK16
         VZZQFm4kWzfQ6R8hE2buM54yyUpXDros1xh4h09ooj6cH1sY2ncQTa8EWqQ0uO5gTQvO
         Qytuo8LXF+6Z77hht/OpsBMaxFxwgdrKS9IG7WtNmaoRCG4kcDkpsvMVVnx/PCr0M1H5
         1eR1cTjh1tFYryNyyn0P/eTPeNJ8kYSasP4fKBIRco3CJd03HYxchZwtR1+NYolFWgxW
         Qs/g==
X-Gm-Message-State: AOAM531etS4deKNihhzK2CXgFVm7Bjy+ndSSg7eqLL6oVChqRLbKtSYT
	/lIeSmrk9husIFNmRSipz/LaQNlYwAjIkKNl+Lbb80ap0/DjAdZmyvl/35cN4yVneygbOUbjYe7
	CStB4fC2oM3w6363Pq6O0N8rgcEk+qEe8Pw==
X-Received: by 2002:a05:6402:1c19:: with SMTP id ck25mr3395017edb.128.1627656132804;
        Fri, 30 Jul 2021 07:42:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEYNd2rGK8vmEVNFNmAp5fQBjwS6feWC8FOd6wG1bhDOFk//GYqhLi16ea5fwlunfc1R0zxw==
X-Received: by 2002:a05:6402:1c19:: with SMTP id ck25mr3395003edb.128.1627656132665;
        Fri, 30 Jul 2021 07:42:12 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id z8sm626325ejd.94.2021.07.30.07.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:42:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 30 Jul 2021 16:41:56 +0200
Message-Id: <20210730144202.255890-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210730144202.255890-1-krzysztof.kozlowski@canonical.com>
References: <20210730144202.255890-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: KYICCUEOWJUHI24R3V2L4YVRAFRGAWU7
X-Message-ID-Hash: KYICCUEOWJUHI24R3V2L4YVRAFRGAWU7
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v3 1/7] nfc: mrvl: correct nfcmrvl_spi_parse_dt() device_node argument
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/KYICCUEOWJUHI24R3V2L4YVRAFRGAWU7/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The device_node in nfcmrvl_spi_parse_dt() cannot be const as it is
passed to OF functions which modify it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/nfcmrvl/spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/nfcmrvl/spi.c b/drivers/nfc/nfcmrvl/spi.c
index d64abd0c4df3..b182ab2e03c0 100644
--- a/drivers/nfc/nfcmrvl/spi.c
+++ b/drivers/nfc/nfcmrvl/spi.c
@@ -106,7 +106,7 @@ static const struct nfcmrvl_if_ops spi_ops = {
 	.nci_update_config = nfcmrvl_spi_nci_update_config,
 };
 
-static int nfcmrvl_spi_parse_dt(const struct device_node *node,
+static int nfcmrvl_spi_parse_dt(struct device_node *node,
 				struct nfcmrvl_platform_data *pdata)
 {
 	int ret;
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
