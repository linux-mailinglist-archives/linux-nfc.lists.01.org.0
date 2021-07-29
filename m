Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E81453DA136
	for <lists+linux-nfc@lfdr.de>; Thu, 29 Jul 2021 12:40:43 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 3CF51100EBB94;
	Thu, 29 Jul 2021 03:40:41 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id C4E3B100EBBC0
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:40:38 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 812773F232
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 10:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627555237;
	bh=Cw3WxWMdLZ5M5UUT98hz5uB4oSAZN8UMdeHX+1yibmU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=UA6W0mJepY+O8jhv0HDxrEZOfnFjSdBLv6/CymMIE833Vk6y7kg7C/1AsFH47TtpN
	 BiV2vbnX0ApVhRNwH39E1KJVGGQqebXNJy934Xi9GQHev1+tLd8CM3GlSviElvf3g/
	 5WECRMGgd8pqUavUveux178EATYz8klg+8PUcRLUGCRB7spU6t5mbUHN61BSPhGYsR
	 HgHclX9OBvGeip8QjJikSCBAKK4HOaJ4tGUts0qAjroirzIYFdtRvJ5HsJH9jpBvZw
	 dhw1/KtUOWyWjdNj89WyQStEc/UpeyY/h+m6xZLS6rodq7IH2MQjmHeHISc+wYJMq1
	 ffG2z1SZ6yqeQ==
Received: by mail-ed1-f70.google.com with SMTP id ay20-20020a0564022034b02903bc515b673dso2748997edb.3
        for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cw3WxWMdLZ5M5UUT98hz5uB4oSAZN8UMdeHX+1yibmU=;
        b=hze/GTeUvM1IAiIspfEmLj4upjIo6HmmcmSPfNVoZIudwa9BAqioQ0rfpj9Yv/z4Ue
         +E3hGzok0y5tkaiCUucgIWawbHXH8jHKhh6xEAD+g0R779honbJ1FheFR5X3n5yGdXVI
         V5XI9tm1Bmj5JO9EdoaucMlbhW6NYsUlEDOLZRt9GofzV1pfmwEHR4Iu6bYsgkuWXbmp
         lGzLzCXK3fnsSVrEtNgjY+fuBFfLbOq33VXWy+BIKHRRWUVHXUdDQ3vFLv7h1ny85aG3
         LCGyNl0Ow4/bilEDG9jIhq9fKrf1FDOfDx8WlEjF/w8Y910elL0QrPxZgnRjSl4jOU25
         fmUA==
X-Gm-Message-State: AOAM5338OxcOK8Di7qSJVZjUdcujpk1RhDTNmvN/QfZDIY4qR1Xl1EM+
	IVVsAAnF+Vzo18jyWTzrfVqRBFO45zyBSMs5CYBOFHT4SL5ayYCsEE/gN9I4yfNUeacbH46xJBa
	g+qjmBIC6UyZjvICFIyh/QDKu2ekWdVBQPA==
X-Received: by 2002:a17:907:1190:: with SMTP id uz16mr3961132ejb.543.1627555236312;
        Thu, 29 Jul 2021 03:40:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyelGCc7LxjALvK3umx0eo+PexaLLnBk1cGkBUbydBmcQuE3sbk2nmw8yhHldZtMsl1cgWHbw==
X-Received: by 2002:a17:907:1190:: with SMTP id uz16mr3961115ejb.543.1627555236127;
        Thu, 29 Jul 2021 03:40:36 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id c14sm824475ejb.78.2021.07.29.03.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 03:40:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Bongsu Jeon <bongsu.jeon@samsung.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Date: Thu, 29 Jul 2021 12:40:12 +0200
Message-Id: <20210729104022.47761-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
References: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: XTTTE7Q2ME2IWDJ3G7P5RN5HB34CNL63
X-Message-ID-Hash: XTTTE7Q2ME2IWDJ3G7P5RN5HB34CNL63
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 02/12] nfc: mei_phy: constify buffer passed to mei_nfc_send()
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/XTTTE7Q2ME2IWDJ3G7P5RN5HB34CNL63/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The buffer passed to mei_nfc_send() can be const for correctness and
safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/mei_phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/mei_phy.c b/drivers/nfc/mei_phy.c
index 41146bb99474..f9cca885beec 100644
--- a/drivers/nfc/mei_phy.c
+++ b/drivers/nfc/mei_phy.c
@@ -202,7 +202,7 @@ static int mei_nfc_connect(struct nfc_mei_phy *phy)
 	return r;
 }
 
-static int mei_nfc_send(struct nfc_mei_phy *phy, u8 *buf, size_t length)
+static int mei_nfc_send(struct nfc_mei_phy *phy, const u8 *buf, size_t length)
 {
 	struct mei_nfc_hdr *hdr;
 	u8 *mei_buf;
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
