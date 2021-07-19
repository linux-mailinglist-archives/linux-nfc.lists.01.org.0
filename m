Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A06313CD338
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:46 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 52707100EB34A;
	Mon, 19 Jul 2021 04:09:45 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 1C1F1100EB353
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:43 -0700 (PDT)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 2F34840207
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692982;
	bh=bFQBKq6RdEgbIGqsx+OvZQYFBixWWz2xb80DCuWjORY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=lg0U0SRyeJqhfyUPuGWnEMEHKRdzaTvtKj23LjOICc8RflondWJOzfB4BuazRKzd2
	 lNbkSe9QmG8R/15REWcRYcKw5IqB8RVPDuYa3XwzN0A+Ol0X1PKky3iduuSXxkJevj
	 ithpo1Don4Jjl10UVTH1R53aWvCQe+v1kFdIU4QMvL4TPBVxM8FAuh+ZAS7+oLdAn/
	 5A5FL0VtqSRpanFIj3SX88Aq8dYguWRDmVxK2atMpy19hNX8U6HH1mwFLPiv3rM3ap
	 FpW5aeFQtSUVXjWOfDQpmRldOxitzhTWL9zmWZ4Dha4lthgYQo9Oj0J828bNwxg8AM
	 9qodsPMpDgv1g==
Received: by mail-lj1-f198.google.com with SMTP id e9-20020a2e98490000b029018c799ba37bso9288179ljj.6
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bFQBKq6RdEgbIGqsx+OvZQYFBixWWz2xb80DCuWjORY=;
        b=PXJGL8v6ly2OYHFN+crgbLl2UVxlvUmQ0KVZ8Od7Ts/JoHZFk6LtmZHl5kHOEoLngS
         xE5cgOv+fT38725fvvThYcl2ztftT2tMsIlzk9GYF2Pn4UkiwT15PSvChpXzSqwgRcGX
         iwqc5rtifRCIFM0KTm4gJnbYFXr2DMt1u/rrxD03+ye1phC5uMBtFi+Mf/JPNuEASqTp
         w8kid1P6B95FXJo0nzecDpnqNC6+GHT4Bj0wVHOpu7Q76mA7XwEZJrjgDs92G8kC7Vaq
         CZqPFWpGmDCOJ7hWHaU4r4kTLLPT3YZpTFvgI2ASTMZi9gietd6fwkDPmNYe2W3E13YZ
         8Z0w==
X-Gm-Message-State: AOAM5322umquNYxH4BcYD5fPdAQA2cAj++ZYEiMtP0gsiATB1dJNT5Zk
	+pVK+rKpF/vVX+wZIzV8ddD/WZkgSYfPDLKeZjIVXcaF01b05aSFd2IHX808+HZDRspy5aX3WVo
	gyz+M/alryla5B2aH4QADb3iXkRrY//pt2A==
X-Received: by 2002:a05:6512:1382:: with SMTP id p2mr17656224lfa.120.1626692981461;
        Mon, 19 Jul 2021 04:09:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvYOGJQThiQgIqr4YPhDknrr1RAZnzPywI8cuUpg3+gqjOCM/IP46ZZMPYrt/kIySy1T2evA==
X-Received: by 2002:a05:6512:1382:: with SMTP id p2mr17656218lfa.120.1626692981321;
        Mon, 19 Jul 2021 04:09:41 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:08:03 +0200
Message-Id: <20210719110819.27340-58-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 7RFE7JO2RPQX3P5VER3HEXGCJ6DEMNXO
X-Message-ID-Hash: 7RFE7JO2RPQX3P5VER3HEXGCJ6DEMNXO
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 57/73] unit: fix memory leaks in test-snep-read error paths
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/7RFE7JO2RPQX3P5VER3HEXGCJ6DEMNXO/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Cleanup and free memory in error paths in test-snep-read.c.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-snep-read.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/unit/test-snep-read.c b/unit/test-snep-read.c
index 213b3e5b3d74..a463c1df30b8 100644
--- a/unit/test-snep-read.c
+++ b/unit/test-snep-read.c
@@ -131,12 +131,12 @@ static bool test_snep_dummy_req_put(int fd, void *data)
 	records = near_ndef_parse_msg(nfc_data, nfc_data_length, NULL);
 	if (!records) {
 		TEST_SNEP_LOG("\tdummy_req_put parsing ndef failed\n");
-		goto error;
+		goto error_free_nfc_data;
 	}
 
 	if (g_list_length(records) != 1) {
 		TEST_SNEP_LOG("\tdummy_req_put records number mismatch");
-		goto error;
+		goto error_free_records;
 	}
 
 	g_free(nfc_data);
@@ -149,6 +149,10 @@ static bool test_snep_dummy_req_put(int fd, void *data)
 	near_snep_core_response_noinfo(fd, NEAR_SNEP_RESP_SUCCESS);
 	return true;
 
+error_free_records:
+	near_ndef_records_free(records);
+error_free_nfc_data:
+	g_free(nfc_data);
 error:
 	TEST_SNEP_LOG("\tdummy_req_put error!!!\n");
 	return false;
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
