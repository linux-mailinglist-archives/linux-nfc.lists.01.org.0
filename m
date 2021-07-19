Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E4D3CD329
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:28 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 1C506100EB342;
	Mon, 19 Jul 2021 04:09:27 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B09E6100EB333
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:24 -0700 (PDT)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id C680340325
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692963;
	bh=SbRVIfwIxFoLpaHn7JkKzYEO+QB/QcfWWSG+flioY4A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=RYBbZbmz8T30lRl2vj7e4SHM1YjyPegSa7+Lbtd6etGBvu3c8akE9aYOyNRIjh+ES
	 2//i0oJFRkqPjJ5G2Cznp9M9vsCuQZnPGCwNIAvYpIscNIhequB5FhdeQRvZ+ZY3KJ
	 s8kLTsbSbMuSIBpLW4CgrGrnjdqqFiF7hL+7H+xtNdJDorr0w6jvJZKX5Y3iA1UuJD
	 OunjI8MIYnXVxVgHEJj13IC+zykqriG1sY0whZBo2juDux2T6nxqNmDlaWVVEHdAkm
	 gmGeACcbBhTSq4UKOGu1+MCyAOZzHgQTC15xFkGhvydd+RfwGgw2DRLTVyXsqqxbWh
	 5giDyZyP4htLg==
Received: by mail-lf1-f71.google.com with SMTP id l20-20020a19c2140000b029037ad1141c33so3268789lfc.8
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SbRVIfwIxFoLpaHn7JkKzYEO+QB/QcfWWSG+flioY4A=;
        b=O8AM2iqGRARaHcEqWcyRIoIebcbaEKQFTJm9eTTeqJrcKPh8jFRFbrED9dH5U6S/SS
         M6aK0xBWyfnxDoqX2fLQOzVPAWv5WZ008nVjC19cMI19406wxgZPsIuKzdtId6xtOzsU
         vPU0rOS2Ib18CYAx4600Nvzpzbzsg0ctjlL34aAa1Q5ZZ1BJD7pTNpU6aNTTa9lU4k22
         6ROqkVMhJ4TP2MtSQqI2FUTzsuO31y961GhEfdUHjPl/kn7QTKWTyQKrxZBBQQw4QUrY
         GqWVfmXRkQrdgPTGAcMtOMiNXF0aj5ARv3NdhjORwODQT9nJkzayMnTLfzdRofKoJ0Zr
         NOOg==
X-Gm-Message-State: AOAM530fnAU5li/F/gyoRTsiKQNVA/9gSshie4txPqVdtLzRw8UxhqAt
	pjJZGc31DKmzCVfJDd+HZZYytHUz6qYUr8qo1Ye8H5T5eTavF9+HfliBB8KxI08tQJpCsQ2okzh
	EEmejmi4KxAHXCbLSKsvf4kS7zFfl03fnXQ==
X-Received: by 2002:a2e:b0e2:: with SMTP id h2mr21459845ljl.55.1626692963032;
        Mon, 19 Jul 2021 04:09:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOZ/KV6y8qVad3+3cHXL17WyI0Y9e8EjbbN/5dWY8X84kvtu7ZoAocKzfaFoRanAVTlCsD5g==
X-Received: by 2002:a2e:b0e2:: with SMTP id h2mr21459837ljl.55.1626692962900;
        Mon, 19 Jul 2021 04:09:22 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:48 +0200
Message-Id: <20210719110819.27340-43-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: N4ZP5DAYSHJXBY3ZNRZ32MPR3NGDOWOF
X-Message-ID-Hash: N4ZP5DAYSHJXBY3ZNRZ32MPR3NGDOWOF
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 42/73] snep: remove useless NULL-ify of local pointer variable
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/N4ZP5DAYSHJXBY3ZNRZ32MPR3NGDOWOF/>
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
