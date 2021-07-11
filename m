Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1573C3F02
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:21:40 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 5F641100EB328;
	Sun, 11 Jul 2021 13:21:35 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 9F294100EB84F
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:21:33 -0700 (PDT)
Received: from mail-wr1-f72.google.com ([209.85.221.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2fxE-0001aM-BL
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:21:32 +0000
Received: by mail-wr1-f72.google.com with SMTP id t8-20020a05600001c8b029013e2027cf9aso2104768wrx.9
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cUOoEtepkCYW/sRb5uJgBOt+KajtNplF0pSZ7CVlAE4=;
        b=asJKeW1XJjrEmxdI+WqnUTXrjYcM3miV1Q6bm5aegQe50v30Y10uNgsRbhi6q6SRau
         7f3H5ezVmVfbv+B5Iy2zSmr4WleffWxc4i8mLoApsdjzIJQICk8hMCsaO29QV3Lrksuw
         ZsxfoYgXyjIu+9TGkkFextQDeG0kyFZxAKtwuPc8SFUA65vIpjLe6vijmSHUROwF535L
         0MOwsTqm1TSJ8xXdw1GAnfS1nl6MkWX60SPL2hzOk9Kp8PpzMAx73hwHv2FapxER+dND
         Cswq5KzOC1jG/lYqY2bp/KzTkX+h23HtLJN04Z8AY3+SCiQ1rl84hGEk6BKVNrtwg1Tq
         LmKw==
X-Gm-Message-State: AOAM5334+3Sd7TaF9QjSt6c8v6anLMqpve358ovi0RVwFbAKnZG81n6E
	yYWPKvMOrU2fvZ+msMWGHr9s8xQpgrFv0ZfGnAauhQ0jkfa/L/d2ETOEaz86otWwS9Qz83+qKV0
	TvStFY2VixHQZ9AXw32I64nj6Lc6VNSdE2g==
X-Received: by 2002:a1c:f613:: with SMTP id w19mr10901190wmc.136.1626034891969;
        Sun, 11 Jul 2021 13:21:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGVv+G8ckE+Ok/ZtAywDDdEP7TyFBBVzgNOCkWzqxH4QDJvAFQwVgBFNCUPycKfPb3CuQQyg==
X-Received: by 2002:a1c:f613:: with SMTP id w19mr10901182wmc.136.1626034891869;
        Sun, 11 Jul 2021 13:21:31 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id d14sm1503256wrs.49.2021.07.11.13.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:21:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:20:35 +0200
Message-Id: <20210711202102.18094-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: F3BDR2T74FZYKB6ZCLAAQT35K2ODCLJS
X-Message-ID-Hash: F3BDR2T74FZYKB6ZCLAAQT35K2ODCLJS
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 07/34] ci: display printenv
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/F3BDR2T74FZYKB6ZCLAAQT35K2ODCLJS/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 7daccd2672fd..a9335e100fb4 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -224,6 +224,7 @@ jobs:
         lsb_release -a || true
         uname -a
         cat /proc/cmdline
+        printenv
 
     - name: Configure
       run: |
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
