Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F693C8366
	for <lists+linux-nfc@lfdr.de>; Wed, 14 Jul 2021 13:05:43 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 02500100F2243;
	Wed, 14 Jul 2021 04:05:37 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 8EAA2100EB352
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:34 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 719794022C
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 11:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626260733;
	bh=Md2EuObBnY+Ml4K7kGBhFRsXar7gSVdbZFpXWsw3eJk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=E0J9DjanswgLKmWRtLnZ2N6TTqdsrpzc6HT/7cR0VeH01cgeFVftKXEGN/NnTpvxA
	 JtlPQijMmRnYwqz/IdWITMA/RwZOQ00a6DI0dBtSN6fvloNWapPIlzSfiQLwwfg3/I
	 Uowf9yjVlWkdpEJxPnAkLHmjM31dLAJkka9kC9cPiWzI/KkgcRA5DCMcRyKxx5ngrY
	 FKlL2mQGjrlDSOU9sMiECTZ5fZAH6/67ZqzjZd7iRRWaXFLSuTX0z9CWJsI154hZvM
	 yjjm0y1gUpnRGd65qSRolfrzuHPJEg85XXdslFR7cLZZPstx1/xuXyPGKDltMl6pUt
	 6mwEGJfRDJUaw==
Received: by mail-ed1-f70.google.com with SMTP id e3-20020a0564020883b029039ef9536577so1061784edy.5
        for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Md2EuObBnY+Ml4K7kGBhFRsXar7gSVdbZFpXWsw3eJk=;
        b=my8DVwcuwn2uCPRWnKN7lhDUiAwMOa7wHQqHRhl5Phn8h8yR2O3Ke79dqCbaoHISnX
         PAde+brQui/sqMos/AwAdrXkkUFYZHlcHGTokPZiwfo9+KhS8o/WlzK4KbneNqRONlQ9
         BRsra7HURytmKdtjV54wFgk9obIoVmBH4toEcxw4AWbRflaI4yJyUR4OKG7a1P16bvCV
         yktjvgOx41SMrjI+ZKgVNKyt4YB18PAKSGyj1uoVhDoFPofY9FPYDCO5C8It03/YSZX0
         0AdG8+8eoNc9FOECtrTaQj/oM1LFZS/Tw5Pihe/Smj+4lP8cuqhHI+Ncy2H8qJr6MSRJ
         dmiw==
X-Gm-Message-State: AOAM531rp52A6sl5w0j2l1cD+IdGHWlppwipdG4mLuldQLZbsHQ810PE
	Cp57kytE72I71CR5kWasI575rNWtKsSWYqjJqq+QLkZoQEiKzcwwCcOyhpGEQPBU64AEH/cK4yO
	GBlClJcB9BKGNCkbFlsVbESZIFKWaFrOlwg==
X-Received: by 2002:a17:906:919:: with SMTP id i25mr11558192ejd.171.1626260732997;
        Wed, 14 Jul 2021 04:05:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtVxNxsXNfxrw7RMLwzd2qq7dXPu1xofkmDC2O5TnhxqdryWQlT/l8rxbXnqpC9fxc7Z4lSA==
X-Received: by 2002:a17:906:919:: with SMTP id i25mr11558183ejd.171.1626260732824;
        Wed, 14 Jul 2021 04:05:32 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id qp12sm637689ejb.90.2021.07.14.04.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 04:05:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed, 14 Jul 2021 13:05:08 +0200
Message-Id: <20210714110518.104655-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
References: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: CIBORLNCK2RJLNICM2EJ3K7MESRUNH73
X-Message-ID-Hash: CIBORLNCK2RJLNICM2EJ3K7MESRUNH73
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 06/16] TODO: remove finished tasks
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/CIBORLNCK2RJLNICM2EJ3K7MESRUNH73/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Continuous Integration is ready with cross compile and clang.  clang
warnings were fixed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 TODO | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/TODO b/TODO
index 1d5294519c3b..8d63f3571c85 100644
--- a/TODO
+++ b/TODO
@@ -11,18 +11,6 @@ Background
 Core
 ====
 
-- Add more Continuous Integration builds (32-bit x86, cross compile, clang).
-  Priority: High
-  Complexity: C2
-
-- Add clang builds in Continuous Integration.
-  Priority: High
-  Complexity: C2
-
-- Fix clang build errors.
-  Priority: High
-  Complexity: C2
-
 - Add more GCC/clang warnings and fix them.
   Priority: High
   Complexity: C4
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
