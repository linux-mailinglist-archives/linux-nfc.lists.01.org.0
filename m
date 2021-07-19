Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 550D73CD33B
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:49 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 815A7100EAB51;
	Mon, 19 Jul 2021 04:09:47 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 90614100EAB44
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:46 -0700 (PDT)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 93E8A40624
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692985;
	bh=biWSj0Fqbf90QfPCUpE4zul6pr2rUgzXXztVYc23IE4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=YPGYd6e3v5ed5NzpphUmDgEfq15vrxd3YkICaPYWHOsDJjd6tmTZC8SiOScDpjriu
	 SuUN3i22e+ViI8St1TLa5qzabdVLrFwERBiRjduZaq5kk2Ad7nzalWj5e5FUBsbZsR
	 ttOuzOJclE3JwpNCC5EwRJIYEUhzkUs+EqNq7kyw0p3VAmwRLtXUU3t8cSZkf2lYvg
	 RQ42rhrf22YNdA7zriH5fGXDUwTbLQDcx7oZ5cLBxKZv2IxcV5SdySz9H72PAEEhlx
	 0qO1BsII7gyP5OsWNW5HAX7q5Cmz6DALg5NZgE4NJnk5PbzVN1u4xdwq+67M9W2KHK
	 KPqoXGAX2ywDA==
Received: by mail-lf1-f71.google.com with SMTP id p13-20020a19604d0000b029038be656b5c5so2394710lfk.2
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=biWSj0Fqbf90QfPCUpE4zul6pr2rUgzXXztVYc23IE4=;
        b=qC93w3Hr7HX2R7QsCIVhRlRtOQsrnTqD+dbiwIn5JwUZG9Z5yNuqFZBPg9WRM1ejbp
         WywJM6iGvMWLzD8ENnPWulqZQAkddyTjBgOFyOSNYs9qf3yvc/ha76pWizUEvhvKBck9
         88aCQk/ymohIGtwGgHd+jRw2FckiMm0yLCZmODhYMkyuOfTrsdbbxUfYd2aJxk4FvTgj
         e0Bm7lsWtAmtuC1EWITxM25niVqthMvr55h1kT80RSj0KUyVBkadg94PEX0h411w0rxp
         AucnMGovSZLsxWhH3x8FlbazsglBUbJ1MLYIvLLpRmG//604Z9oPYVpDfSylcp5ypOPA
         L+5A==
X-Gm-Message-State: AOAM531Tyinsz7xC0w5ueyCdDXabmEkvXewDyOk31DeP7tm8nVIifx91
	/uLLGVmyAdRu3idC0SXfMMpKOKwIBQLwtJukbsdZ4vtzW6ADIclCTQR2L/C6MP3s7sYj3lqoimx
	lg87tayyMO/3//qxQgmXRO3Xq/0Rjjd5EqQ==
X-Received: by 2002:ac2:4ac6:: with SMTP id m6mr18779367lfp.73.1626692984855;
        Mon, 19 Jul 2021 04:09:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWqlWPWTYNgntN99ds9+LnZzt8jvzaEaCHwBPXM74g8Rvi2Nlck+/LGo11xq7D2UxcztKe1g==
X-Received: by 2002:ac2:4ac6:: with SMTP id m6mr18779357lfp.73.1626692984707;
        Mon, 19 Jul 2021 04:09:44 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:08:06 +0200
Message-Id: <20210719110819.27340-61-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 6C57Q7OFR7VVG7NY5PUGUITSUM27FAHR
X-Message-ID-Hash: 6C57Q7OFR7VVG7NY5PUGUITSUM27FAHR
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 60/73] unit: do not pass NULL to memcpy()
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/6C57Q7OFR7VVG7NY5PUGUITSUM27FAHR/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

memcpy() should not receive NULL as source pointer and such is passed
from test_snep_read_get_req_frags_client_resp() and
test_snep_read_verify_resp().  ASAN reports:

    unit/test-snep-read.c:325:2: runtime error: null pointer passed as argument 2, which is declared to never be null
    unit/test-snep-read.c:266:2: runtime error: null pointer passed as argument 2, which is declared to never be null

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-snep-read.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/unit/test-snep-read.c b/unit/test-snep-read.c
index 128937ed910f..ea41ae03a8b2 100644
--- a/unit/test-snep-read.c
+++ b/unit/test-snep-read.c
@@ -261,7 +261,8 @@ static struct p2p_snep_req_frame *test_snep_build_req_frame(
 	req->version = ver;
 	req->request = req_type;
 	req->length = GUINT_TO_BE(info_len);
-	memcpy(req->ndef, data, payload_len);
+	if (data)
+		memcpy(req->ndef, data, payload_len);
 
 	return req;
 }
@@ -320,7 +321,8 @@ static struct p2p_snep_resp_frame *test_snep_build_resp_frame(
 	resp->version = ver;
 	resp->response = resp_type;
 	resp->length = GUINT_TO_BE(info_len);
-	memcpy(resp->info, data, info_len);
+	if (data)
+		memcpy(resp->info, data, info_len);
 
 	return resp;
 }
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
