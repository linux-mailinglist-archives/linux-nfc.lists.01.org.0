Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B72B447482
	for <lists+linux-nfc@lfdr.de>; Sun,  7 Nov 2021 18:26:32 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 9E6F7100F47AD;
	Sun,  7 Nov 2021 09:26:28 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 48E92100EB82B
	for <linux-nfc@lists.01.org>; Sun,  7 Nov 2021 09:26:26 -0800 (PST)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 512403F16F
	for <linux-nfc@lists.01.org>; Sun,  7 Nov 2021 17:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1636305984;
	bh=ugbtSPZ1/63s0mmPO3DuFZgDoOXJoGCwSqcw4kC1ODU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=OpjQorWz3ZCpCCyqIhAMCym9tKCcEvGjG5EiAy79FVknlfHv/9Ft4j9zVAw/lhHAp
	 u2xOLQQ6s5myY62ZdtO8vY/67ywX54MxsvkBOpLBDgUr24JqJ8ucnUV2BNi29rtjbB
	 gjvKDFUzs7qyAdfRCq+HcjHAKdlKP0nqMekxrhkyuBZ9ZXJCrfM6FS2IQ7sKqFcmn2
	 FNEvIMJZKcEs4r21QvnUJGKNfAefRJEwTLOltbs99eRg8O1YmZ4xGBvwFLsv95eFZY
	 htV30W0V6VJclvVIdMutWqltcY2R6JyzsB4x49PV6f64jqpAksSr3O1+EeEhhXJEzN
	 eBM5OH3/ABQKA==
Received: by mail-lj1-f199.google.com with SMTP id d20-20020a05651c111400b00218c6372b7eso648560ljo.16
        for <linux-nfc@lists.01.org>; Sun, 07 Nov 2021 09:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ugbtSPZ1/63s0mmPO3DuFZgDoOXJoGCwSqcw4kC1ODU=;
        b=Rcr/xspFO+GIfe9h0YKpc1G7ohsBQl4Q6d2MtJefoPLzdA2cWaFrJxAh00QorvO8mb
         OoSxIa1t/16hoTJjp2FIYbxRrOPV7aIAt/0Rke0HhidcTI1uIND8qHv+8CBmN/KPG9X2
         PVdJnOvaueorPbQNR6JwplNQV9LG9lF5zSxDPw9WADLFmbVYuL0YgePXJjjdKicolgI0
         hsgwMEz4/RSilb3GBVvxT/B/aXwNjSty5Xv+n/2VBFx9BHWq2IOI4oU3p4RNp3W/bqKt
         CKI6yTUEfDDZfXEQxfv6G2UFPHBKrJtfQp0i/0kw3lD9f3TmJ7vGhjujNY2nMrCVOkba
         Nduw==
X-Gm-Message-State: AOAM531UvskGaYuAcWSpbO1uJJ7jyTENWFnw6iRdUbDwi4bxkH4fF6Nf
	VxVYUw3uqhUKgBRtfTJfHT1QUeTMzOq3cI3RMYi+7783Qw74rla0/atSrs71tiNmnF8KRQdf3Gb
	OuPQOWUwSQdXJq6y+WDdXdLMtJiaipyqN9g==
X-Received: by 2002:ac2:4114:: with SMTP id b20mr67417589lfi.92.1636305983336;
        Sun, 07 Nov 2021 09:26:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzaLKp2bNozZdr8x4mzLrhyHqrcs/ZtMREDQJENf+9SujHGtS496JV/mQHW2D3Q+PgBHfOrRA==
X-Received: by 2002:ac2:4114:: with SMTP id b20mr67417557lfi.92.1636305982996;
        Sun, 07 Nov 2021 09:26:22 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id b17sm618433lfv.264.2021.11.07.09.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 09:26:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun,  7 Nov 2021 18:26:16 +0100
Message-Id: <20211107172619.13560-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Message-ID-Hash: ECXGJOIV5ZRGGVZ25SYWXV2EH53ZA2YD
X-Message-ID-Hash: ECXGJOIV5ZRGGVZ25SYWXV2EH53ZA2YD
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 1/4] include: include endian.h to fix missing __BYTE_ORDER definition on Debian Stretch
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ECXGJOIV5ZRGGVZ25SYWXV2EH53ZA2YD/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Code should pull explicitly headers for necessary symbols instead of
relying on dependencies.  Lack of endian.h caused build failures on
Debian Stretch:

    In file included from tools/nfctool/ndef-decode.c:28:0:
    include/near/types.h:43:5: error: "__BYTE_ORDER" is not defined [-Werror=undef]
     #if __BYTE_ORDER == __LITTLE_ENDIAN

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 include/types.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/types.h b/include/types.h
index c4a8d6a31886..1dd8de530d58 100644
--- a/include/types.h
+++ b/include/types.h
@@ -23,6 +23,7 @@
 #define __NEAR_TYPES_H
 
 #include <byteswap.h>
+#include <endian.h>
 
 #define near_get_unaligned(ptr)			\
 ({						\
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
