Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D60363CB5B5
	for <lists+linux-nfc@lfdr.de>; Fri, 16 Jul 2021 12:09:03 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 139FE100EB82E;
	Fri, 16 Jul 2021 03:09:02 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 77CB7100EBB81
	for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 03:08:59 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id E3045409FC
	for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 10:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626430137;
	bh=5y2al1eecwHRZzwzQ/hZkx/iTGM2xckj4UG7EKqu83Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=s0KQnZslwDnzw8dt34rcN4MwiKz2OgrLTPxXtko5hyRTdgb/VTzvai5ZPUO3SmxVr
	 LS5BSisDNgeEoQ8vhKSZg3HlpAMDpLGqRD2c0hM7BCUWTFRT2+8uOQtW1QAif+u/AP
	 Jl/58YJQKCvazmRfU/wbKNPVnKufFHIJyFunCYt5c2LQmMwPBaW3ODqv1mMkO582zr
	 gUa+BgKnJuKw0xkn9g31XVm1Uj8k3ETaYAEjwGsPFH76sdwKTqoOzCpaScmShWYvM5
	 hbXosrlP5+QtpfbIFYhhXxLd/hdS/Vx2ffQcY0GFtV0uJhGHEVcrLqgmv4wuyWCehq
	 7xsj5OgLaoZ4A==
Received: by mail-ed1-f70.google.com with SMTP id ee46-20020a056402292eb02903a1187e547cso4605901edb.0
        for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 03:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5y2al1eecwHRZzwzQ/hZkx/iTGM2xckj4UG7EKqu83Q=;
        b=pXXaVHgT1Xz26T776MsD4U9zcjrMIb1wKDTFhrexxGWMu19htkLb3iwbmp4dLa1dfZ
         YRlZnJAIDv5WBiOoVt5rPBagbSBMxHCVfj2bRQqv5X7wR3cc2KIr/O/qhBMua5euqdlv
         ePvG9PMF3sXSB8gZ7WknVgIGa3sxKh2T0uRz8ENVXjBr99W8T+dmu8ziW89WIZoIodEA
         Yk2oGHMFW1fD39uOd79OhQiULopS75X9MxEBOzRKly/hhzgCxAV+yq0Sa6tT6T+8tcbS
         8/T/dGduYhJxapbiqVEY5X43fQTWGIA+EsUxJu9nGAtEZiwwvDLq88/oVNpo/c61ahh/
         6Veg==
X-Gm-Message-State: AOAM531l6A33u9ARyNtBeX/gXZaimsFseN2WIFmtOGVxB330vRmsdbNN
	8n/LLnns0JKPjEC1+m9kCqWc3P8n/0u48YMar+1Hs2tOZrYr3RINnXMpS0R6lGc5zByJzYI03TQ
	s+FYHbAi9vkcxqrpY+uy8Sw3NFHgtdoEgZA==
X-Received: by 2002:a05:6402:3454:: with SMTP id l20mr13557779edc.170.1626430137149;
        Fri, 16 Jul 2021 03:08:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPbOIjnG9UYEOy+9q7RMaVgl1xGGgf1ow4EdKiJnBE276bD5Ql8ZBNgPH3icV4nnLJpCoUFg==
X-Received: by 2002:a05:6402:3454:: with SMTP id l20mr13557766edc.170.1626430137056;
        Fri, 16 Jul 2021 03:08:57 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id u26sm2710389ejj.4.2021.07.16.03.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 03:08:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Fri, 16 Jul 2021 12:08:38 +0200
Message-Id: <20210716100844.51360-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210716100844.51360-1-krzysztof.kozlowski@canonical.com>
References: <20210716100844.51360-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: N5FPY2PT4NTFXCRHLRZIWEJI6MXUJZTC
X-Message-ID-Hash: N5FPY2PT4NTFXCRHLRZIWEJI6MXUJZTC
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 1/7] snep: do not open-code freeing ndef message
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/N5FPY2PT4NTFXCRHLRZIWEJI6MXUJZTC/>
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
 src/snep.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/src/snep.c b/src/snep.c
index c0a1d1a00491..a1e90243c020 100644
--- a/src/snep.c
+++ b/src/snep.c
@@ -147,8 +147,7 @@ void near_snep_core_parse_handover_record(int client_fd, uint8_t *ndef,
 	near_snep_core_response_with_info(client_fd, NEAR_SNEP_RESP_SUCCESS,
 								msg->data, msg->length);
 
-	g_free(msg->data);
-	g_free(msg);
+	near_ndef_msg_free(msg);
 }
 
 /*
@@ -787,9 +786,7 @@ done:
 		}
 	}
 
-	if (ndef)
-		g_free(ndef->data);
-	g_free(ndef);
+	near_ndef_msg_free(ndef);
 }
 
 /* SNEP Core: on P2P push */
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
