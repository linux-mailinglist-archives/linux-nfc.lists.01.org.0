Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DF0414DD3
	for <lists+linux-nfc@lfdr.de>; Wed, 22 Sep 2021 18:12:18 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id B813C100EB330;
	Wed, 22 Sep 2021 09:12:15 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id A2073100EB329
	for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 09:12:13 -0700 (PDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7F0313FE01
	for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 16:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1632327132;
	bh=ZImIzjhbp7po85DkKakYkS6BF3soPDZxD2bFEWic48c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=ap0dT6E6OperLpHScHesGHBe4+WYUUGob06fDTFVOXM/0gCFFRHL6G+wqjPr3CPaO
	 2EQXlWdpdf6sPzUmS8rgiE5LtCIVzh4ZMQr4Fpoaf/Lug3CDWmg6Rbvv+wXTYYTZsw
	 axEE+cZpwQNInE1i+yn4QGU317h+xzQbIF/gW+loPSm9MenvfKK/73ERAq0b6WF4Bs
	 jiB4pZ7le6Q5X4Dq2YODnElxBYs9BNS8VlOPTkVffyEB2KyB2Wo8ANpGasFAceTRZO
	 HDnr4NLeTXxG9osxY5ZKv8hsKGz7FbyTDPSaixMGfAq3h/CO16eJDMfWzRtF+925OA
	 33HCefALoc1AQ==
Received: by mail-ed1-f71.google.com with SMTP id q17-20020a50c351000000b003d81427d25cso3598700edb.15
        for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 09:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZImIzjhbp7po85DkKakYkS6BF3soPDZxD2bFEWic48c=;
        b=zs3ccsMT4o8WX3LhJIcOqBjmUgGYbEmHyK5iRHcW5A7C+IT5NnuQS3ov9o5a+BNg8F
         CXAFbgE1732gSf07549Oexa5DwRfR3bGG6w/63nEV6ZDQGNN3SvFEcaqJzn2EG+Ia/U/
         yGiZUDoY0vxKcGq3bnj6vwOquTYpDCrt5zd84q+/Bl+QN0z70rGXDtwuOm/y9joqot9v
         lQz+FUJGpGvtzOg9zRJzy3EcyNNnc+4MYN+juVQnQt5+14va392Xa3hZferysH4RvtyT
         sLQlA4mt0w6biV5dMQ/BbZX9j+Z734R4edQ1jfnQVUsG2bM30XmEFQ/7n2QsW4CzzEAw
         Iyqw==
X-Gm-Message-State: AOAM5321JQkFjjE6O5XEm/Qy6SOYoEwCKUiNplZf5V80C/qCcaUCNzAg
	RVjusoCxvTKpRkEEyJTXmky/pus6X8XeRGrNF6uw6dk0BvOw85l6/0EBBmlDfpedTmA5rrGoeum
	OhqM2HDjguqQ+X8X7ALMpPPtjI1brVM6zpQ==
X-Received: by 2002:a50:dac2:: with SMTP id s2mr11163edj.141.1632327131987;
        Wed, 22 Sep 2021 09:12:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjK7ii1c2D/8yo2a/aZyHkdEwCeGZ+YDaNxyK9YFBOvobYDCic2MMM4JyePU0cZAF9RW6zNw==
X-Received: by 2002:a50:dac2:: with SMTP id s2mr11155edj.141.1632327131877;
        Wed, 22 Sep 2021 09:12:11 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id b38sm1409122edf.46.2021.09.22.09.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 09:12:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed, 22 Sep 2021 18:11:12 +0200
Message-Id: <20210922161113.142758-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210922161113.142758-1-krzysztof.kozlowski@canonical.com>
References: <20210922161113.142758-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: ZFB5BPDR43RGXLHZ3BSFKRK73ZV6NSL7
X-Message-ID-Hash: ZFB5BPDR43RGXLHZ3BSFKRK73ZV6NSL7
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 7/8] HACKING: rephrase message about dependencies
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ZFB5BPDR43RGXLHZ3BSFKRK73ZV6NSL7/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 HACKING | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/HACKING b/HACKING
index db75f0d11a17..8207781f5519 100644
--- a/HACKING
+++ b/HACKING
@@ -18,7 +18,7 @@ Required packages and tools:
   make
   pkg-config
 
-See also installation scripts for  Continuous Integration in ci/ directory.
+See also installation scripts for different systems in ci/ directory.
 
 
 Working with the source code repository
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
