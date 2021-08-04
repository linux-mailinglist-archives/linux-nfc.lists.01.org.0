Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3B83DFD28
	for <lists+linux-nfc@lfdr.de>; Wed,  4 Aug 2021 10:43:23 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 061AA100EB83A;
	Wed,  4 Aug 2021 01:43:20 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 466B7100EB83F
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 01:43:17 -0700 (PDT)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 1C3843F07A
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 08:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1628066596;
	bh=FO1hm9OVkNiv55mKKXnFpU1xSI84KayJ1118FVl2ykk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=Dw8G0xNonxCwiuWTwxrEAbomDGxhMRvWfOAg8QKZlYXTs+iXTwDKeKMtVmLyO9XYE
	 l0NdkyK8+cqeMVjyMSyVu+Ljd7jGy48sZXDW7ugCN2sWMlxrYEe81oglFD4MU6uX2H
	 4md0ssVUxu4Ljh4CZdYQIYCyL10ciRjU165Thzj4P7zoUFKAAScxUiGQAThPMHrcDl
	 GTiQyWtxmNgFRvEOssW2iqw8ea1rWS/O6wX//zt4y0yaDprWhVxiyFOx9fxtF27OkX
	 /TJRGuT9fyxcTTZD0vh+1BiTAx7hCM7FW6EWXhox5v/lBoUDHRzBYty/+2Bg3ahNrv
	 gOTI+pKUEh8NQ==
Received: by mail-ej1-f70.google.com with SMTP id k22-20020a1709061596b02905a370b2f477so576459ejd.17
        for <linux-nfc@lists.01.org>; Wed, 04 Aug 2021 01:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FO1hm9OVkNiv55mKKXnFpU1xSI84KayJ1118FVl2ykk=;
        b=O12JM+rjRlHCbssEQ7cW1hnhJu5WIh+E1RXa8z4Pa2wCeHK7N/K71hC8r63bb78UVT
         /u5fV+eoArl50ELxLxmfcGXYY6Cgr54X3x3QOL7gckwsQTSeQ6s1+So7PFGmqqyeTpoq
         uAJjZ+dT5jnycAZhJ0Z6hIoPJ83xgSzoz/R/quTpfspF0ugsM/RxYRD1tsI/3I11WtpC
         7jJ067rbrZMOpseEGjHdMWaupYtGVBZxELiLzz+WBF55wwyabggIcVMvQhVoJTzFGFle
         SD9Ina9+lONGB53NgucpP6W0O5hQgq69G6usI3PGK1LH1N5hkaa9grZSWHObNJCvaLBt
         h2YA==
X-Gm-Message-State: AOAM533qwp0nGibHEIo01a9kErMZIPfQY3LnFs4NrdrpVt63anlbwLD+
	3VypXh+D27PJlU0f2nDP4rmcfWnagtEXI4r2CYpCR38NlXLXcjk/PgEHF9JTwZFFJDOxUXVZySt
	VjVk0SwyVRvrtkWmOjwkFqpzJKr1B0RmopA==
X-Received: by 2002:a17:906:1da1:: with SMTP id u1mr24174560ejh.307.1628066595686;
        Wed, 04 Aug 2021 01:43:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwD+ro1PRXJEzZjhlHjFC9n9cnTKsnHT0cMBiCCC0aK1wmKLP1QxHbZ0lBic9uw99tbh44Tdg==
X-Received: by 2002:a17:906:1da1:: with SMTP id u1mr24174549ejh.307.1628066595519;
        Wed, 04 Aug 2021 01:43:15 -0700 (PDT)
Received: from localhost.localdomain ([86.32.43.172])
        by smtp.gmail.com with ESMTPSA id lw22sm459968ejb.74.2021.08.04.01.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 01:43:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed,  4 Aug 2021 10:42:17 +0200
Message-Id: <20210804084218.14677-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
References: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: VZR46LGIVYFIQ4WF33HBXKDS4H6GCQ3F
X-Message-ID-Hash: VZR46LGIVYFIQ4WF33HBXKDS4H6GCQ3F
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 10/11] ci: print configure logs on failures
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/VZR46LGIVYFIQ4WF33HBXKDS4H6GCQ3F/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Helps debugging of container-specific configure failures.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index b6f29cf9ddfb..d4ddcdd3f8f4 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -265,6 +265,7 @@ jobs:
         printenv
 
     - name: Configure
+      id: configure
       run: |
         echo "Bootstraping in mode: $MODE"
         CONFIGURE_ARGS=""
@@ -287,6 +288,11 @@ jobs:
             $CONFIGURE_ARGS
         fi
 
+    - name: Get configure logs
+      run: cat config.log
+      if: ${{ always() && ((steps.configure.outcome == 'failure') ||
+                           (steps.configure.outcome == 'success')) }}
+
     - name: Compile
       run: make -j$(nproc)
 
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
