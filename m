Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 156CA3CD33C
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:51 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 9ECDF100F227A;
	Mon, 19 Jul 2021 04:09:49 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 93256100F227C
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:47 -0700 (PDT)
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id A7E85408B2
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692986;
	bh=kh7l+O8As5HWtVEgn3vmh1vBJJNxtV+yOBz4IZ6YB2M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=paZR8LeAmash15YR1X7Em5gK0YzTd4BHfexs/2DwBy7Wz+9fU25YrYH+g6mMeln9n
	 RQIao9PqIHv9xrC6JFBfknStdL0NsRXWWnawh+/OoWxICp6OkT5rX3R7gTz3n7WiHz
	 uUhTrOgnU7OhY5VVpdVeWaQ5jDUnVUKMid1dGQheXK3ucQjoD8MLc8Q9z68qhpocJF
	 E12yE1/OIJnOlBM9fT6wFwtPdfgxWIfmN6/784dqlXt1hA8KGzd6iNjGGDvAfQugkC
	 LwfbR8NW6VIpE9vi11yvyJxRwydYdDmUpO/N2lV/7yZ+1YDwRisHw8IV93e90iAZuj
	 SHBHvGU1uN86g==
Received: by mail-lj1-f200.google.com with SMTP id 5-20020a05651c12c5b0290193ec0f79ceso5913107lje.20
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kh7l+O8As5HWtVEgn3vmh1vBJJNxtV+yOBz4IZ6YB2M=;
        b=j+cPevYLzhi+e0dr7e/xgWeIHBluSpfUil3POSgZoepi7t/YCjvNnzUMtP3GQJOrnJ
         8xoQoVAyKHSLZuhLRPJ+pb66lfhKfX38SwHNcIJvmFOVkIfaaFmUtvj036ep3hhpiZwx
         BRxFC8DfYtpNrNdaK51IUpMi7BlV0TVXl5FnDDeJSv/9LVW/vArw6768nIRMJfhAAVVn
         I1kYMalQOUO129tvM4qPhRG4GWAiyZJxOV1sMLr5YWKxEdq/kKV7gwThXO/uIsMhVBpu
         ngGVRGmmfihQ5wZVuzocq4ULE1C9vcwt0iy4+VO/QDU4He5DtiSha76/3QxiOzKKEo0N
         nu8Q==
X-Gm-Message-State: AOAM533Izp2NMQtbEaBC8kBaMisV+X+rsnLpz2KEGJXUxeizk/k8KNkm
	ww2ulcey2W/w2mCX7g6PziJbNfTiEBRCFsSzyC74zDdNB9j/iYRpRl6TGc36XRFmLpQe+7cmgte
	CHh7OhammcjK9NFu94nda+3hwKth7zQk8UA==
X-Received: by 2002:a05:6512:39d3:: with SMTP id k19mr1737753lfu.591.1626692985947;
        Mon, 19 Jul 2021 04:09:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfdveRJqGcEWJSTqkKUiu4pGxffWheV/yMsp0Ya5x+cBompFZRfMwkcA5P+9C0q+2Fv3EsXg==
X-Received: by 2002:a05:6512:39d3:: with SMTP id k19mr1737746lfu.591.1626692985801;
        Mon, 19 Jul 2021 04:09:45 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:08:07 +0200
Message-Id: <20210719110819.27340-62-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: CMSU3BPYLFOY67SX5NA34TTHZGO3RLF4
X-Message-ID-Hash: CMSU3BPYLFOY67SX5NA34TTHZGO3RLF4
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 61/73] unit: do not search for headers locally where they do not exist
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/CMSU3BPYLFOY67SX5NA34TTHZGO3RLF4/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

near/ndef.h and src/near.h are coming from include path, so no point to
look for them in current folder.  Also reverse the order to match
unit/test-snep-read.c

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-ndef-build.c | 4 ++--
 unit/test-ndef-parse.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/unit/test-ndef-build.c b/unit/test-ndef-build.c
index 54b502f4a40b..5174f053841e 100644
--- a/unit/test-ndef-build.c
+++ b/unit/test-ndef-build.c
@@ -30,8 +30,8 @@
 #include <glib.h>
 #include <glib/gprintf.h>
 
-#include "src/near.h"
-#include "include/ndef.h"
+#include <near/ndef.h>
+#include <src/near.h>
 
 #define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
 
diff --git a/unit/test-ndef-parse.c b/unit/test-ndef-parse.c
index ace0f9038ad9..de3cac81b90d 100644
--- a/unit/test-ndef-parse.c
+++ b/unit/test-ndef-parse.c
@@ -30,8 +30,8 @@
 #include <glib.h>
 #include <glib/gprintf.h>
 
-#include "src/near.h"
-#include "include/ndef.h"
+#include <near/ndef.h>
+#include <src/near.h>
 
 enum record_type {
 	RECORD_TYPE_WKT_SMART_POSTER          =   0x01,
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
