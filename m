Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D623CD336
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:44 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 32950100EAB4D;
	Mon, 19 Jul 2021 04:09:42 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id BE236100F2268
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:40 -0700 (PDT)
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id D0A2B40207
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692979;
	bh=esH+0RnS0dyY0+5jziSvqSqHSzvTiQg6TqgpWs8MDq0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=MluWnHHCS863Iy77Hc44kMP4fkVeSMLVKHTK57WKYLk++5yobgLaTnNzbdgNbSsTy
	 mx0d7xLUnzqIMG0wvCoO354wPlPnK3ErUAFsi4PCE6agFRb4YLWM+eS53+Y1OQLQQt
	 bq/FpjJJe3YPw/LEDw0BA4hTehv/yGwsiyHb04taoC9SiBxSUd6guyL3Mgy5RyS/jk
	 5NQWmOUyVWL3y4vDGcVns3Muh0pH7EGMALHcYhvHltNdpJadJTWC24BmE3/SvW1Rzd
	 4eWPOr8k3k9Bw5vOr7/i/qy1X1Nd7/he4K78/CHL4lB76nAB5/ZnyEtRy4WsWzzIg4
	 EOfn0g7Fd16AQ==
Received: by mail-lf1-f69.google.com with SMTP id bu14-20020a056512168eb029031226594940so3254117lfb.15
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=esH+0RnS0dyY0+5jziSvqSqHSzvTiQg6TqgpWs8MDq0=;
        b=oP4Y6jFwqSXkAMVJoiiFEVIkb7VHL5X8txMvOAsdqKvQrI59G+6UchiRO0QYDA8Xzm
         /so020fUcrHj2IDvWkZUFnYP9s5blHg2vJF4BIEkUK9HLVDUp7Y4uyBQwM2FV7R4XO+6
         w7ENampmm66jEGtO/cHVMtMMr5iJoox/YNSeHt37CiVSopH3c4X+Tw+gAz3DdrUCKcpR
         +LIfG+rneoc/mYeOOfw73+tPA5izHpmqoMV5ankwnq4bwrs9Si3u4ki1yAi2Aorlfe65
         kuIdsG+0Ebiv+NH4AwNBUsTvrug89WOVoS4+6OYdmxhq6Z8Jiy5/46LMXQ2nfXphTu8U
         XBYA==
X-Gm-Message-State: AOAM5318fQbywNYb2BTqOTVwjY9Ih5+3T/SM+bexz6HJratYROBQlhdV
	YZy75kpjOpVxZxFSzrDMgRy6enBWgv0z4rJZXIQsdioJInGGK2LEicjXgdHdc8c7ntce0i1YH9x
	72occohTDjwcDjQT4MQpnHNC0hAR5LUvK/w==
X-Received: by 2002:a2e:700f:: with SMTP id l15mr21655155ljc.149.1626692979122;
        Mon, 19 Jul 2021 04:09:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbEcF8X+i9R+2eLURhP94nwArZLLEJGCpLQEs/6i+Czq/mhDhBfcjb6h6AK+zBz6VG1NaitQ==
X-Received: by 2002:a2e:700f:: with SMTP id l15mr21655144ljc.149.1626692978993;
        Mon, 19 Jul 2021 04:09:38 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:08:01 +0200
Message-Id: <20210719110819.27340-56-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: ENKUU4BJU6MJ6XHCLLW7LMYQRCBPMWOL
X-Message-ID-Hash: ENKUU4BJU6MJ6XHCLLW7LMYQRCBPMWOL
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 55/73] unit: do not open-code freeing ndef message
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ENKUU4BJU6MJ6XHCLLW7LMYQRCBPMWOL/>
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

Changes since v1:
1. Change also test_snep_cleanup()
---
 unit/test-snep-read.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/unit/test-snep-read.c b/unit/test-snep-read.c
index 414b801a5e71..213b3e5b3d74 100644
--- a/unit/test-snep-read.c
+++ b/unit/test-snep-read.c
@@ -222,10 +222,8 @@ static void test_snep_cleanup(gpointer context, gconstpointer data)
 	if (stored_recd)
 		test_ndef_free_record(stored_recd);
 
-	if (ctx->test_recd_msg) {
-		g_free(ctx->test_recd_msg->data);
-		g_free(ctx->test_recd_msg);
-	}
+	if (ctx->test_recd_msg)
+		near_ndef_msg_free(ctx->test_recd_msg);
 
 	g_slist_free(test_fragments);
 
@@ -896,8 +894,7 @@ static void test_snep_response_put_get_ndef(gpointer context,
 
 	g_free(req);
 	g_free(resp);
-	g_free(ndef->data);
-	g_free(ndef);
+	near_ndef_msg_free(ndef);
 }
 
 int main(int argc, char **argv)
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
