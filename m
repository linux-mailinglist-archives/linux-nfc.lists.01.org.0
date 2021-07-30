Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 461D93DB408
	for <lists+linux-nfc@lfdr.de>; Fri, 30 Jul 2021 08:57:05 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 197BA100EB84F;
	Thu, 29 Jul 2021 23:57:02 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 2559F100EBBDD
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 23:57:00 -0700 (PDT)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id EE6093F109
	for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 06:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627628218;
	bh=TbQaBsPvgLCz2s8QzntY35xkR7Vmp0dFUIMeahF8LO0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=Svzlvalp5fMFTvdz/7VJISPrg2Z/R2O7p6jsmk0wjz/+i/MSXqJIJzOTjPwD7qy76
	 7GwWMgJo0VMEeYZW3V9pzwFhlNExq9MVLXHwNxhOzK5X368Fu67i4ochDVf8N9mtxr
	 4E7vJOXbqLFMJ1+jMxsGdhs2aDO98J0hCckdwW7MbI5me9lGYZHwgPLvDj1WDQkaZB
	 SsXmVcnP3wS411E4OcrSfCXP7hetphn5oEx0d7QiueN2RNZYw9KJWTl0qj55qOm1Ee
	 89vuVkQZMEdZ+3f0FZ/Gl5ID5E4Py8/38/v1sxYfFkLkeNfnrRkt2wmsW5U2Yj80JV
	 zTErH6E0++Qsw==
Received: by mail-ej1-f72.google.com with SMTP id n9-20020a1709063789b02905854bda39fcso2772399ejc.1
        for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 23:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TbQaBsPvgLCz2s8QzntY35xkR7Vmp0dFUIMeahF8LO0=;
        b=Xm8xX3S68thaHs6OBGarGo6LzdIPSbqtluQgPVgePmED3/++D3GX3NzowMX5oRS7vr
         vyxENtjy0M4gAWEzPsDRieC4XKAj8o/4lS6oNgKb92bMpxxIt7TswxR71nmWvD0PcB2j
         cOk3azSGy/5sGqTVdOIxh48Si+c23h5L0hqc8H7rxdvZ2+sWl99LB1jYUooMwVTmK5Hv
         apTBs78lZA7JN1GrAYGdPCkyalLY6gYk37Jwjyw+nSf8z1l05pGFaAyidzPeq1t1KMvS
         8Ssnf0L5DWN3HK2WObvYCgQ1DyJFPVNCXvFvfq/o5x8j2csYyd6LHWHTtKHjzAHw95vR
         xr/g==
X-Gm-Message-State: AOAM532E8Rjzwc46kDsR/4IzTv/mn4Qf0iPenGNHlDpjol0HS0ejPnsb
	mQkPgC+eiakDURQm558RTAnMPTgKm1uKGP4MjzpelCb1h463aXyphxT0n81SlvpZ7hGv7Bi1If8
	Rq0WTU4q4hBxHGXHK8SRhoN09kqrf7fzEVQ==
X-Received: by 2002:a17:906:64a:: with SMTP id t10mr1154568ejb.5.1627628218759;
        Thu, 29 Jul 2021 23:56:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwI5Moy+lzXah0p5kqppWeDxC9Ku21TZrEo9wjHh0ArN5Ek2tQ+rZnuddmWcBRskAlMTzDs9Q==
X-Received: by 2002:a17:906:64a:: with SMTP id t10mr1154557ejb.5.1627628218647;
        Thu, 29 Jul 2021 23:56:58 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id m9sm238518ejn.91.2021.07.29.23.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 23:56:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 30 Jul 2021 08:56:19 +0200
Message-Id: <20210730065625.34010-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210730065625.34010-1-krzysztof.kozlowski@canonical.com>
References: <20210730065625.34010-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 4AADH3I3RRCURLKEWVI4H65L6H6S2GZL
X-Message-ID-Hash: 4AADH3I3RRCURLKEWVI4H65L6H6S2GZL
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 2/8] nfc: annotate af_nfc_exit() as __exit
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/4AADH3I3RRCURLKEWVI4H65L6H6S2GZL/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The af_nfc_exit() is used only in other __exit annotated context
(nfc_exit()).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/af_nfc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/nfc/af_nfc.c b/net/nfc/af_nfc.c
index 4a9e72073564..6024fad905ff 100644
--- a/net/nfc/af_nfc.c
+++ b/net/nfc/af_nfc.c
@@ -79,7 +79,7 @@ int __init af_nfc_init(void)
 	return sock_register(&nfc_sock_family_ops);
 }
 
-void af_nfc_exit(void)
+void __exit af_nfc_exit(void)
 {
 	sock_unregister(PF_NFC);
 }
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
