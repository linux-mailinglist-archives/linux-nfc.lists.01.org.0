Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B183DFD23
	for <lists+linux-nfc@lfdr.de>; Wed,  4 Aug 2021 10:43:16 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 92F45100EBB9F;
	Wed,  4 Aug 2021 01:43:14 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id D4B76100EBB97
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 01:43:11 -0700 (PDT)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 9F7C23F345
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 08:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1628066590;
	bh=YwRMLzADXJcZgAwgCXp7xJZvMI3jo0tVll3fh009w4s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=Y80ty/Z1qckM38nI2WVVqj4eAYy6TgboxTnhQR11lzfI+hsun1ZUo3z3q4FfdKgtP
	 3wY0EBUk0CgSRpcbYOH/ogFUDZGNR9h/uYfv9EizLrjd53PWB1j4qhtYXkjytTlyW0
	 Pbn6LR7DnTPCLYK76fe98sPMnvIWo5O4NI0sAuP6d903RgDsVH6S9x92vpFzsC+q1O
	 cPW13aneinmKlG9JzvT1xEjjvuTOWFqZYNv3zCqAFBCkdez9i6aIOmQnS1ejWxu9KB
	 VHeHRpN4ZZRWVtfwhAA9rmAVCquOdtOVU/Ppuy2BBeqkfxbFoAYss0YhMnR3OhounS
	 5lSdPb/cpgxFA==
Received: by mail-ej1-f69.google.com with SMTP id zp23-20020a17090684f7b02905a13980d522so597740ejb.2
        for <linux-nfc@lists.01.org>; Wed, 04 Aug 2021 01:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YwRMLzADXJcZgAwgCXp7xJZvMI3jo0tVll3fh009w4s=;
        b=GDowGotUr7X/s3z9o0OS3MV0eF41R3tFj6Z9vDFsJe3qlL65jd8e0Xnm8hPULkccuR
         eXEpgw1EJshwWdryUuzJx8e/o4yh9owmVLwckwabRgm2iEPjVyF3ARhQKAnvie4LIjzg
         yXGZvbmmRQATIs6nqHZumaVz7GjwNHpl74NEAHGdzhRCORNoxd10K50/uqZXJn9/j6y7
         SOiYmT+4XmVKAIucLu5UXXX8uuClS3aR0DaOL37TniPBP+hdYF19nVFRH6PaywwJH7ES
         7vQ/lGW+FfEnPjxfp1xK0GCaIAcnjVAe7ZaYNSu48lprzzR0C+uzs7vJejqfZd86A48N
         hy9Q==
X-Gm-Message-State: AOAM533QPFKQF3eZSYfxGZRxEBzivn3HUriwUwfnP4VEkLqQTt+xI5fy
	nmMVh8vHILYb+e9tHO3sKs4IgafaITIGQj9C96+rHcekzf0Xqr99qIly5iSnsz8Dr6FJXkkv7et
	GNDZaxJF1oZ3FCWRCks0enPumd6dcRsLh6g==
X-Received: by 2002:a17:906:76d8:: with SMTP id q24mr24490481ejn.22.1628066590168;
        Wed, 04 Aug 2021 01:43:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMjLnzPIUC8wbUqXNZuCfIUbRVPo/VjUik+fGUVeY49Z4lnY8bcxQaMsYPCMput6tpq8vhzw==
X-Received: by 2002:a17:906:76d8:: with SMTP id q24mr24490474ejn.22.1628066590059;
        Wed, 04 Aug 2021 01:43:10 -0700 (PDT)
Received: from localhost.localdomain ([86.32.43.172])
        by smtp.gmail.com with ESMTPSA id lw22sm459968ejb.74.2021.08.04.01.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 01:43:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed,  4 Aug 2021 10:42:12 +0200
Message-Id: <20210804084218.14677-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
References: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: FZQNQFBYESE7E5LDPT5OWD3GZANP77SC
X-Message-ID-Hash: FZQNQFBYESE7E5LDPT5OWD3GZANP77SC
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 05/11] ci: be verbose when building
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/FZQNQFBYESE7E5LDPT5OWD3GZANP77SC/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 589ad66280f5..389c47dcd781 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -102,11 +102,13 @@ jobs:
       run: |
         echo "Bootstraping in mode: $MODE"
         if [ "$MODE" = "maintainer" ]; then
-          ./bootstrap-configure
+          ./bootstrap-configure \
+            --disable-silent-rules
         else
           ./bootstrap && \
             ./configure \
             --disable-systemd \
+            --disable-silent-rules \
             --prefix=/usr \
             --enable-ese \
             --sysconfdir=/etc \
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
