Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8833DB406
	for <lists+linux-nfc@lfdr.de>; Fri, 30 Jul 2021 08:57:04 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 0A650100EB846;
	Thu, 29 Jul 2021 23:57:02 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 1AE68100EB83E
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 23:56:59 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 10A803F106
	for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 06:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627628218;
	bh=lpVZTJlpKGPodj4MHtc+rObtHPXyuiLkFrg5L18y8PI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=QC4ZaHWZffbPrX9LCG+qHi/sh2WDdMpPKl3I65VUFDzht0++wfthNKp853WMcCHOL
	 w3dUziOnGHlsgOtK8HRd7VcG5ocI4Z7pxEL75CXrJxkd24361VnXgSnJuJGPsawMNL
	 NSxvhFOcLxJgCQGewTAVr0H0MEKoSbF9rxoIq5X0q9AWU9L3UMuhhCFsxlOjlc36yU
	 cpbIIC8L7RoqayID0bUXZXm5cBtYAOnld411fdDLD8WcFq0i4dHk5wFpa56pSGh/5+
	 DKvvU5ix1XHt/im2ynRMjFGcwjgPEWVnqbka+I8xbqM1FD/EPuTYjNsqxKhd2Dcaua
	 0GKer/RJhm8DA==
Received: by mail-ed1-f70.google.com with SMTP id h16-20020aa7de100000b02903a6620f87feso4160388edv.18
        for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 23:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lpVZTJlpKGPodj4MHtc+rObtHPXyuiLkFrg5L18y8PI=;
        b=j1Ex4SLyKCxKk+zpYznn8cUx+Q78ATs+65XA3oZN7yoZU69sbpI9IntkQfwU3lz+NF
         Ih++rrvbLvX3ZR9nvcc4XjDO6Roen50MUOj+e7Fdd8p2A/itZ1nGTGkyQD7B8IhaCuoM
         3hBtyw6SHRDLJj+aNc+x6FHV8ib0Pn3eVq4bKxQt2xdAqnTRUboNdYP/mBQaK20IW9hB
         wgb2BkjEH3/ohuhLY8fcwlq+tTN4QBfFlLqLJL/FNkqInsPYYPrXM8Q6RfmKpENZdv3h
         iy02P4jdfowyOZF1uZUz3rVUJrrdah07M1rS8tYmp9NFXWmVGctczKkvhCWhoRTJGS6Y
         bb0A==
X-Gm-Message-State: AOAM531SGqM1P2LgfkMBWRCkcltSIx2PjHUsBKOiK/KAdpD+SXiaXwX1
	gU/3Wq0Ro84B1u4TbByg9/bpJsdHt9ZfPZtfepe1h/uY8hLr4/lDvYL/cFcbBg4OpJigrHsQ9XS
	egE1rurEs5MHtvF6+Yaqab50lIkZiuIucnA==
X-Received: by 2002:a17:906:2cc5:: with SMTP id r5mr1170217ejr.454.1627628217827;
        Thu, 29 Jul 2021 23:56:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzF1UJnDm47YAqdL4xKsUu+WQrS9jxPRbWrkT1jujqczwIF2v+flQ3oigoS89wz7xoV7GxOhg==
X-Received: by 2002:a17:906:2cc5:: with SMTP id r5mr1170206ejr.454.1627628217697;
        Thu, 29 Jul 2021 23:56:57 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id m9sm238518ejn.91.2021.07.29.23.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 23:56:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 30 Jul 2021 08:56:18 +0200
Message-Id: <20210730065625.34010-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210730065625.34010-1-krzysztof.kozlowski@canonical.com>
References: <20210730065625.34010-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: NHDMUKZG4B57PPPNSTDKALDNTOFZXHKF
X-Message-ID-Hash: NHDMUKZG4B57PPPNSTDKALDNTOFZXHKF
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 1/8] nfc: mrvl: correct nfcmrvl_spi_parse_dt() device_node argument
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/NHDMUKZG4B57PPPNSTDKALDNTOFZXHKF/>
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
