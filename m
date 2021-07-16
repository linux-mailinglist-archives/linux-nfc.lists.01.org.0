Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 907D63CB5B8
	for <lists+linux-nfc@lfdr.de>; Fri, 16 Jul 2021 12:09:07 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 34E94100EB834;
	Fri, 16 Jul 2021 03:09:06 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 523FE100F2243
	for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 03:09:02 -0700 (PDT)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 575ED409F9
	for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 10:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626430141;
	bh=SbRVIfwIxFoLpaHn7JkKzYEO+QB/QcfWWSG+flioY4A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=ppOa7ZARxuqdiEk3KqnUrW03kmfEkvP8zVZAx/c9eCgOGaScTdOCRXlSyF2cZL0f2
	 IzIeRpYgPuJeLpkOwSX5ODPLZvYndjEEvwRyEig1jF/rncSOCaAvZaw9JhJWet+yxS
	 siQt/FILWtqIp+sJAxrj5oxzx7GLcCRMQw2Q8Wr0wrEUNGKX4shLu3lpaaqWs3gj+V
	 CP0w3evTjBlwg4xHOWsMlm4keLbRkaKywiMgN5HJxdIZ9khq0uZ+WPFsXtZFxboNrI
	 6uGwtOWBYF5LtFPVxj3MKQm5j+f3BSZVZc+R8wV0dGIELoySrg4hv/V2f6s/jvGE8U
	 gOdc30PHMRn8w==
Received: by mail-ej1-f72.google.com with SMTP id r10-20020a170906350ab02904f12f4a8c69so3425753eja.12
        for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 03:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SbRVIfwIxFoLpaHn7JkKzYEO+QB/QcfWWSG+flioY4A=;
        b=XJCx7ficd1/9DmX0hgVtzGtEaswJw17v5wpsgbik6YUb3Udf0htyFYd+LIx9nclETX
         LQRcMjI3SX5NNEAB/KlJZww8fkk5pqJ0OBFxBC2OYsdeYjo+Aptv+Fu4sFoyhYMP+txz
         B0YEGjkvFWm/0nLkpaIcqYbcfwWJFuMq3agmW32F73K4SZzmLgJHmnGxV1qAG8t4gSOU
         aqvSSr2gO9u1KlvRe7uCjWBRJdF1mRX+Vr/cjR1k1htlSZ790bcoxGXpDo63rrPe/NMA
         5BX/lUVaCLTxPINE3IJzlFCfRF/o2sz3arSC4nTSvwnsxptIxA9PnZyOMUv2qUUC8DOg
         kDLw==
X-Gm-Message-State: AOAM5335mI07bsOMvJlTb4pTx00KGYf4rQg0lF1JZYLc2JSyCOlUCl21
	pAus0aSB8DYFOnlL4zgppYmvbvNP67IxZXy8FfeIjmsw/9oliPym0VOJrcVkokJ7/SEFzlknDtl
	9Dn+Yy3YprMoQuehd8GGzqZBeuntMxvDSzA==
X-Received: by 2002:a05:6402:2788:: with SMTP id b8mr13585604ede.244.1626430140807;
        Fri, 16 Jul 2021 03:09:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOJn7XoQPtCaRJeBxxO7X9WHDyOF9hcdcOcvjRCugJ06FnsjTVaSgwu0T6yQL8g27C3GMETQ==
X-Received: by 2002:a05:6402:2788:: with SMTP id b8mr13585590ede.244.1626430140706;
        Fri, 16 Jul 2021 03:09:00 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id u26sm2710389ejj.4.2021.07.16.03.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 03:08:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Fri, 16 Jul 2021 12:08:40 +0200
Message-Id: <20210716100844.51360-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210716100844.51360-1-krzysztof.kozlowski@canonical.com>
References: <20210716100844.51360-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 7MXNSI7VRC2XKKUISVTXXWIHOHTP5MUE
X-Message-ID-Hash: 7MXNSI7VRC2XKKUISVTXXWIHOHTP5MUE
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 3/7] snep: remove useless NULL-ify of local pointer variable
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/7MXNSI7VRC2XKKUISVTXXWIHOHTP5MUE/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Assigning NULL to a local variable (a pointer) at the end of function
does not have any effect as this NULL is not passed outside.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/snep.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/src/snep.c b/src/snep.c
index a1e90243c020..737060139b07 100644
--- a/src/snep.c
+++ b/src/snep.c
@@ -206,7 +206,6 @@ static void free_snep_core_fragment(gpointer data)
 		g_free(fragment->data);
 
 	g_free(fragment);
-	fragment = NULL;
 }
 
 static void free_snep_core_push_data(gpointer userdata, int status)
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
