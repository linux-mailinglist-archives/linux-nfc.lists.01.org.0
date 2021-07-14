Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0764E3C836F
	for <lists+linux-nfc@lfdr.de>; Wed, 14 Jul 2021 13:05:54 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 94FB4100F2245;
	Wed, 14 Jul 2021 04:05:48 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 5D2A6100F2248
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:46 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 4DF844022C
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 11:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626260745;
	bh=+YekN90xf6jsCpj8MSNQjVrLqPvlJAwS81y66JBOVXU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=vWTqX9WT7K5Lw3o2qku7TYyYneSKiQqieHt7SWrptPrp1UcPc/D7ONvIisMtya3/T
	 0urnscPSZzfXZoNBw8BkhwxSAnhauFRnCSC8L9KBDFQL5NU65oT3p1uejcNq+NJH3X
	 JuIOdh/KsAhqhrmFsOBEdGfCl+cDXuGapTCgJoC78sLB+tN6RBMC0Ppa+fzksBWhKt
	 nMKsRxFOedJMg/48cGbdQQZrH2hdzpHflpES86BXpJH/Tj515efa6hbGQZA0Aw/xsS
	 RPkAgollQYcvGwpMvkS5jfieowVKdW7HBsSLmmONOLuJB0Dp9QACgorrXxBZA+D7Hx
	 jnk2EJK10n8Qg==
Received: by mail-ed1-f70.google.com with SMTP id x16-20020aa7d6d00000b02903a2e0d2acb7so1039657edr.16
        for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+YekN90xf6jsCpj8MSNQjVrLqPvlJAwS81y66JBOVXU=;
        b=nh9gqJ+MECssnUizQZJvjHuK/ivpOubG7YHXpxu3fx8UFdg/26Eu5CUIUFNCikhsq+
         XRUDGcXbrCZ3ETT2bWJ4luGbfwTqWysxDhEfeef6VeCYy2v8RduHFgb1fq7Z72OdTTiJ
         LOsyHRV1poYtkVULSSVG47j+zAlW5Ix/D+5sNE1UfH/a8pQljoUSctq+I58g+ictj7dy
         PZZkov3NEdLjvQ82CxC6wpPRR3EXlC7LQSDIlVAp5XWnLNY6/RJNoeGlwnXUa4QAuqMz
         8o7xqwowe6u5iLkY/yaaKS45In2SxK5rQEGHYrGga7/O9QcjGPf8zlEJP20hild8L46n
         nGFQ==
X-Gm-Message-State: AOAM5337dcz9rmxvmDg3ELcPZhzPfJl2tagEgOTwFFgfSrDbMKS+PeI9
	93u6nc8e1I7g6UBEfz9FrFLUTgVpDEn+pjqXFoZrBxO0qPvf9NTXOkdNgoTtfRFqHyl7Z4J03/c
	Q6UkL+Hn3bPW7Gw5IzmZ+a25BMzSBul3m3w==
X-Received: by 2002:a17:906:3693:: with SMTP id a19mr11997774ejc.237.1626260744881;
        Wed, 14 Jul 2021 04:05:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+9x745iil3ncXdkoMmyjSvKgkd4TwegDCuCqiQw+OfZ0MjU0Blo7PQ6icbITYPSVPA/6UMg==
X-Received: by 2002:a17:906:3693:: with SMTP id a19mr11997758ejc.237.1626260744710;
        Wed, 14 Jul 2021 04:05:44 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id qp12sm637689ejb.90.2021.07.14.04.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 04:05:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed, 14 Jul 2021 13:05:16 +0200
Message-Id: <20210714110518.104655-15-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
References: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: OPQ4ZC5AY6R63KSZOOTWD5EMMPJ5DXRW
X-Message-ID-Hash: OPQ4ZC5AY6R63KSZOOTWD5EMMPJ5DXRW
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 14/16] tag: do not open-code freeing ndef message
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/OPQ4ZC5AY6R63KSZOOTWD5EMMPJ5DXRW/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use near_ndef_msg_free() instead of open-coding it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/tag.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/src/tag.c b/src/tag.c
index 520368b1552c..ce8c477d9527 100644
--- a/src/tag.c
+++ b/src/tag.c
@@ -459,14 +459,12 @@ static DBusMessage *write_ndef(DBusConnection *conn,
 		break;
 
 	default:
-		g_free(ndef->data);
-		g_free(ndef);
+		near_ndef_msg_free(ndef);
 
 		return __near_error_failed(msg, EOPNOTSUPP);
 	}
 
-	g_free(ndef->data);
-	g_free(ndef);
+	near_ndef_msg_free(ndef);
 
 	tag->write_ndef = ndef_with_header;
 	err = __near_tag_write(tag, ndef_with_header, write_cb);
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
