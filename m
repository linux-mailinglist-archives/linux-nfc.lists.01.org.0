Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D973C3F2E
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:29:46 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 552B5100EB332;
	Sun, 11 Jul 2021 13:29:45 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 3E23A100EB32F
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:29:44 -0700 (PDT)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2g58-00028x-SR
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:29:42 +0000
Received: by mail-wr1-f69.google.com with SMTP id y15-20020a5d614f0000b029013cd60e9baaso3766405wrt.7
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JlBiNRLOR5zLRxbcBPA7m9h156ig/tAQUihbcIvObK8=;
        b=LAsgSaNDz9n4asEkSy7YNQ/fWUPWRFEhEyzbRILFE5sAkWxgCYB45sb1PcpoqOpEyG
         ea3QVnpbfCDwI5vMuXpZ/ts1pS39H7+xxtWy498qCHFx1IgN9rHKVKx7DUA+rR2iZ5bF
         SnUf8ffO1yCkFHvJ04A0v78rfSk+ejyuUEAf+yr1KjY4uG56wtuvf/8s0zOVJFdyOSg1
         2rrvAF/Girnkmi2TnUd9X/ikivSiHpuHv5aUnz3ncrBQm9jW5QC41hfKd/CqhupvfcRI
         RaZImKnFcZcyCSZdcdKlq0p8v1vEgDnnLR1bNEhdQe0tQ438sw5cHzA7CTDV6UW7C5Td
         nQ/Q==
X-Gm-Message-State: AOAM531ECKoban9n3OOJSQuZE1a66y4x6vlYX94QbUMBAbqZQZhgMade
	MTCklMpdFog4my1gyuA8ou70FhVtcYKnAYDdcQY3OgGiKUFUdOfmozb2vk416D2UqEn9wo05hhC
	VBa8+K43/+ejWckaQZn0mC5nSyq4c55usNA==
X-Received: by 2002:a1c:a7cb:: with SMTP id q194mr9353572wme.159.1626034887598;
        Sun, 11 Jul 2021 13:21:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQmjVawShgn9VigVQR28naGM08eRF7q+RYA92xoo3nkQshHyu3xVMlaY3yqlmyYFasLfQS6A==
X-Received: by 2002:a1c:a7cb:: with SMTP id q194mr9353565wme.159.1626034887437;
        Sun, 11 Jul 2021 13:21:27 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id d14sm1503256wrs.49.2021.07.11.13.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:21:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:20:31 +0200
Message-Id: <20210711202102.18094-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: DTCG27OVU2HUUHBQVDKMSWTSI7IXBQVW
X-Message-ID-Hash: DTCG27OVU2HUUHBQVDKMSWTSI7IXBQVW
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 03/34] ci: be verbose when building
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/DTCG27OVU2HUUHBQVDKMSWTSI7IXBQVW/>
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
index ecd0683f6c79..85821ee6617c 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -91,11 +91,13 @@ jobs:
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
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
