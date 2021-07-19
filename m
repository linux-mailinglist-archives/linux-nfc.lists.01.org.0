Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDE73CD327
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:26 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 0E32E100EB333;
	Mon, 19 Jul 2021 04:09:25 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B791E100EB32A
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:23 -0700 (PDT)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id B9A05418CF
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692962;
	bh=5y2al1eecwHRZzwzQ/hZkx/iTGM2xckj4UG7EKqu83Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=Ae5XzF7DbuZ1wQa28msK2Jsn3o5fUZ5vCuRsrW6DfoKi1iR0W25DIPhDFzmPvQy6E
	 FtCpk1NBOliG2eKxoyt1zP1BY8sYz56n7b4lHseLdfSNlUInR3kHbR/5hEgSuXQN6X
	 F/zWpijTeXS+vlKHJZhn6gSsiiakCCnhjlL+ls1PgUkCAK8NoHj48B8uvMIHaLD+CA
	 ztZ50H5qz2okB/kcLMlpin8YLO6e+g4wq4PyHuib6cUQADNOLZ8zdpYrntzIjf2yge
	 FK7TwgU+ujmzOOao8Zt0LnpI70l70QOCNaGjzURmf/Rc17Yz9Nv23TMolyp10+yN9E
	 lWVMQK64WcCGQ==
Received: by mail-lj1-f198.google.com with SMTP id d14-20020a2e330e0000b029018ff3deaf8fso9243305ljc.21
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5y2al1eecwHRZzwzQ/hZkx/iTGM2xckj4UG7EKqu83Q=;
        b=MiZ/9dtyMXzmn4YqVtABSnmgpb0pojKIq4swkD7Xmx6CPpKgnqIYmSlIzzR0d8E8fp
         4JoKpcQfhJWDk9ub+CoSPaVhWNhlFg4HWTEWQLbEXcEKG5M6xz90MHbcPb8NLumMMCzk
         S6zJJ3hJ50VsaJbViqtoqwT8+XZrbBm5s4aJzWoYOYJIgum1gqEHO4VP9fsDojSSw1Lc
         0NCSXAwUpPVk0d+JftREHEkNlgpK83uj1aHgrOeCKtEfHxirNaIr+FmusvI1RmYBYs3a
         Gk0Aqs9fKOeUyo4p6VJWJtaNXhpFVIGTc2ugYogCor/TayrCffF1/43fmfwIEwm3qIax
         Lvng==
X-Gm-Message-State: AOAM531xsDoJOI5bRTmSiefG2W+3RCCuDE9YfzA2AI5w1n/o1m6ZuVbh
	RDlY9FEI0RimVSHnfDTKlWMqG/0OQMyBdi1RKFtPi+R+XsCcf+WhJKy2iz9HIUSmGDHvTUW2l2J
	ujRHl/cerX9n+RqR0L+R+JF6X6x6qwB9qTg==
X-Received: by 2002:a19:fc0a:: with SMTP id a10mr18142122lfi.372.1626692961849;
        Mon, 19 Jul 2021 04:09:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbHKr4F78VU5b9XLeodIzKcHzh3jK6VjUHqZZWC1D52nGQXKL0iUL4GALRT2XQ+Am9JUUQ2A==
X-Received: by 2002:a19:fc0a:: with SMTP id a10mr18142109lfi.372.1626692961701;
        Mon, 19 Jul 2021 04:09:21 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:47 +0200
Message-Id: <20210719110819.27340-42-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: BMAOTB2I66DSMYCXGVF63FK2PH7VOTSE
X-Message-ID-Hash: BMAOTB2I66DSMYCXGVF63FK2PH7VOTSE
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 41/73] snep: do not open-code freeing ndef message
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/BMAOTB2I66DSMYCXGVF63FK2PH7VOTSE/>
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
