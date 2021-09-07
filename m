Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E73402862
	for <lists+linux-nfc@lfdr.de>; Tue,  7 Sep 2021 14:18:38 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4177B100EB839;
	Tue,  7 Sep 2021 05:18:33 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id A32DB100EB825
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 05:18:30 -0700 (PDT)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8C5973F07F
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 12:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631017109;
	bh=YdMV9AtCFFKriT3c6sHpvFf+xJsEOIFlGHmRsaTySis=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=qBG5xL/oSh+vjTMtWlhOVF1PjcphDvGfT2MWWZbNeUBn2q97PuoG9oUcfVj2FvMUO
	 Hx71Klqa3Ztgs3zedRHZde1/LOR0uiAJZBj7ZnKLWZuCtXa82iH9r7eEgRnEo5oMRz
	 f3r/t5TDgWB8R8tZv8AzlWcEOhJ6tBSgUMRsZopU0eEFIcRVJQaDQf0UlG1WwIOgtn
	 7Xkmb5l0lLroXmvKoPZOC8zhkPzq1jhD7ecfthdp6jBW0BQv9YVbHhzJ5nyXLVePv0
	 MFtPdysCq2uP6PqYhVQpGqlJBs/IfccdwaZ/1ZCfYUBa71h+QKdJ7I50sUkgDXQDYi
	 ifsPdel0CLJFA==
Received: by mail-wm1-f72.google.com with SMTP id u14-20020a7bcb0e0000b0290248831d46e4so1033075wmj.6
        for <linux-nfc@lists.01.org>; Tue, 07 Sep 2021 05:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YdMV9AtCFFKriT3c6sHpvFf+xJsEOIFlGHmRsaTySis=;
        b=a7rI0ftwKJn3nJspgW1ZBMczMyBDjJKCX/BqvqVWLKdN8DZtEx96uT1HRoCHpVDNTu
         tOg+iBg8qhl+VAFsnU6dQs76aEJSLqkRlzrWRiJE0jzLLSe3jwoQAsJRbiYEzgYbBkDA
         hHqOgODEZWPXKB7mUGtuoiVFa4o+/Lxpn6c81aRZ43kmwcfb59QEICetDB5CNqemdqf5
         tGRLpQEYVogjzj680/hQOBjpxcHQSnobwUZQ4l4ZZ54uRnoAtulOrqYQ0GncJSEFsG3O
         mWggtCX6tlyrNMb62TEj+cgBUlRuc/Fl8F/GmV7jzHXbVa4kPRfx37OYMiKIwUhyrkY+
         svMw==
X-Gm-Message-State: AOAM530al0lR0hKRI5qDGUqoIM4yIwTctHqSs0rmu8lTJkRduifRNSu8
	r6gAgGpd/fIhLlz6xyD+o1Y06MfWY6wR9fqW4v2SzNzFoCkNMq0aNtO2jO4WaH5Bd1zdEZLSTiW
	RBhxvcqP3u0EGkwTIkg0VO3Dm1iwL5AYgxA==
X-Received: by 2002:a05:600c:350b:: with SMTP id h11mr3654018wmq.101.1631017109257;
        Tue, 07 Sep 2021 05:18:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeRcCdgrHtnMCO7A+nbg1gEw4limhbMFTd6XoH8BCc4zr+JcLbKNmTHmhDOb/OCnlEj6YCKw==
X-Received: by 2002:a05:600c:350b:: with SMTP id h11mr3654008wmq.101.1631017109127;
        Tue, 07 Sep 2021 05:18:29 -0700 (PDT)
Received: from kozik-lap.lan ([79.98.113.47])
        by smtp.gmail.com with ESMTPSA id m3sm13525216wrg.45.2021.09.07.05.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 05:18:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Krzysztof Opasiak <k.opasiak@samsung.com>,
	Mark Greer <mgreer@animalcreek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Date: Tue,  7 Sep 2021 14:18:07 +0200
Message-Id: <20210907121816.37750-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
References: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: OQJU6PXLCO2AG6AQIWUZNUVU3T76Z55N
X-Message-ID-Hash: OQJU6PXLCO2AG6AQIWUZNUVU3T76Z55N
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 06/15] nfc: pn533: use dev_err() instead of pr_err()
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/OQJU6PXLCO2AG6AQIWUZNUVU3T76Z55N/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Print error message with reference to a device.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/pn533/pn533.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index c5f127fe2d45..da180335422c 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -2171,7 +2171,7 @@ void pn533_recv_frame(struct pn533 *dev, struct sk_buff *skb, int status)
 	}
 
 	if (skb == NULL) {
-		pr_err("NULL Frame -> link is dead\n");
+		dev_err(dev->dev, "NULL Frame -> link is dead\n");
 		goto sched_wq;
 	}
 
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
