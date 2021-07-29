Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 539693DA135
	for <lists+linux-nfc@lfdr.de>; Thu, 29 Jul 2021 12:40:43 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 2A031100EBB78;
	Thu, 29 Jul 2021 03:40:41 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 2AF1B100EBBC0
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:40:38 -0700 (PDT)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 57A013F227
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 10:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627555235;
	bh=2+MASfDeMXItUy0KRRU6qIh2N4zib4Lrz4DxPbXJr60=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=A8W42v4KoNY2p8NkFhp0mtMxil1RQC4pu9cte5lTrt1XD0539BEgQB7PK6aN6ZYP6
	 uKH8w+ZyweDyj5M0Wz1AUqw8IX+K1BzCHq/7c4ze53HhMYT9RsFxw9PhD5FpXzdMbI
	 FEQUyRRrCvYY2fBUtUsebDMlFPly9E7A/WFVUZSrgmrm/It0TKIg95gRzdkdgAy2+e
	 ThACAkGKQCGNhA1TuHUlZvOmM30cYPz/Tj97HxxLkuK2q79DuGYTg74wdFS+Lz+etD
	 S9yfErz6RP/RmowefzlgXKlnIgtpVqjW9Z3AVnkzUAYQ+VNLOHqFzwq2Noyapq9aX5
	 IsuZ4qUNPbY4g==
Received: by mail-ej1-f71.google.com with SMTP id c18-20020a1709067632b02905478dfedcafso1810137ejn.21
        for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2+MASfDeMXItUy0KRRU6qIh2N4zib4Lrz4DxPbXJr60=;
        b=IhdgNt7m8piYTDk0/ALPY5do7iOxNLprBuhX6PN77XuJ6DINMCZCzGundQHzOcEg7k
         AN9qkQ8viOSx2VH+mk4ce0ytdAh5Zu4Zr5GJXifln1hFswRjnXkovgt39PpIVDOeD4vB
         8qhdwsaSezwOfw8OqtCKeUpx2HuxX9jRcIBjBpjIPTDL60r9I8L5iYCQnah7CHpaNqFk
         c/nIuK0Z6onJgtJtTbAwkUti9PnM7QyvnIIKBelr1uRgIVvHhrbf4nMblM/4WkUESRzq
         S+eHgDFdzc9jsKIOgOYv7pHJn7yXsZ9u30lky6qoWL3XU1315slVtoP1hO4tRd/+AzZw
         YL2Q==
X-Gm-Message-State: AOAM530uvAlqgJvsLsP63rGslVRtERcAqFy9d5DnLKA1l8gv9eXpwuwC
	gdh8MiOidQtXMP+k8Nal1oCoH/BgeyhT8Yj6uhFrGCOKc2erBIBet3k+TjA6gGRPHwbHUH/WM++
	40N1FcoXd6CThoBk14yY6llvEfx9o0QCS4w==
X-Received: by 2002:a05:6402:b83:: with SMTP id cf3mr5240267edb.12.1627555235092;
        Thu, 29 Jul 2021 03:40:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwJDOdp8Ic5sbEoP+ybcJEGMi8R0A1BITHI63lRz6KY4s1GLDvMBVi9ewCQtp/6p2bmUkfPA==
X-Received: by 2002:a05:6402:b83:: with SMTP id cf3mr5240255edb.12.1627555234989;
        Thu, 29 Jul 2021 03:40:34 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id c14sm824475ejb.78.2021.07.29.03.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 03:40:34 -0700 (PDT)
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
Date: Thu, 29 Jul 2021 12:40:11 +0200
Message-Id: <20210729104022.47761-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
References: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: XRUSD7DXUMR3NZRAMEFZN66VD2452WT4
X-Message-ID-Hash: XRUSD7DXUMR3NZRAMEFZN66VD2452WT4
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 01/12] nfc: constify passed nfc_dev
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/XRUSD7DXUMR3NZRAMEFZN66VD2452WT4/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The struct nfc_dev is not modified by nfc_get_drvdata() and
nfc_device_name() so it can be made a const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 include/net/nfc/nfc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/net/nfc/nfc.h b/include/net/nfc/nfc.h
index c9ff341d57e4..5dee575fbe86 100644
--- a/include/net/nfc/nfc.h
+++ b/include/net/nfc/nfc.h
@@ -245,7 +245,7 @@ static inline void nfc_set_drvdata(struct nfc_dev *dev, void *data)
  *
  * @dev: The nfc device
  */
-static inline void *nfc_get_drvdata(struct nfc_dev *dev)
+static inline void *nfc_get_drvdata(const struct nfc_dev *dev)
 {
 	return dev_get_drvdata(&dev->dev);
 }
@@ -255,7 +255,7 @@ static inline void *nfc_get_drvdata(struct nfc_dev *dev)
  *
  * @dev: The nfc device whose name to return
  */
-static inline const char *nfc_device_name(struct nfc_dev *dev)
+static inline const char *nfc_device_name(const struct nfc_dev *dev)
 {
 	return dev_name(&dev->dev);
 }
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
