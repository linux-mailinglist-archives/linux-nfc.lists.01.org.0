Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9396E414DCF
	for <lists+linux-nfc@lfdr.de>; Wed, 22 Sep 2021 18:12:12 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 79ACE100EB85C;
	Wed, 22 Sep 2021 09:12:09 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B1B22100EBBC4
	for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 09:12:07 -0700 (PDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 97E5C3FE01
	for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 16:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1632327126;
	bh=0iNXc2bs0QSw7A6Qrku0STtXf3Z2yyGtB67W2RqOHoI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=upkhUwQ1GaAjhbC5LF+rClPH2/98jntg7+hZ6Ll00uTpAFh3n5RANEffM6kX6+0Q/
	 bOsc1Fv5WxannCIvhdnZmHGlamWw/4uo+OwP6gp2mlk+9wbGfFZSJBQP/rOfZc5P7E
	 oNC3Twy1/25RvhpYenWUKGF4g+RXT+1cpvSWrmK9pSI6PvyQUK/dN2MF/5nJHg3s7C
	 CnCinZVjBXZps+va5THhDmHNRI9XttTCxUGv4Hp2RWkLhwwt2DgCKaS1ESBUpi+p8i
	 vtvfllei6WYoZn6xI4FDwxcdgNUR2WvsaoNtaPWlp0PVB3ccHja41b74OY8BVJk9Vo
	 vhNjKi4QlHFbA==
Received: by mail-ed1-f72.google.com with SMTP id h6-20020a50c386000000b003da01adc065so3631219edf.7
        for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 09:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0iNXc2bs0QSw7A6Qrku0STtXf3Z2yyGtB67W2RqOHoI=;
        b=qIEKBKGoIIM44aftrwtc8D4m2v3X6IQwD3SOxIxDb5rAiYnrfMhCvKOuKPmcA277E1
         mMjNWwUO6vFzazYRsphT0QGy7/rISPlAWe54NJuh+czW+3q84/cmOmnwN+AT0c1lbJu/
         HFuWVA1KXgj84wWyyeRr+vg1ZSzXNdtWkLGjbjZuF1gcckDuj/wzIpW1NpkRhyN2QRf3
         nCluBM9m5S0ciptr7qtYJDPRDoeVMI8w5fxWoIO2p2urt4RS0ZtdozExNj+fCIlByHAz
         yY/lCzpXoefaxatl0tV7Eq9WFAAyB65VCR+M9pvxritkxYdx/ts8GNSvKetJ3EBtPeBh
         hvHg==
X-Gm-Message-State: AOAM531pRtzB4Cz6Xo1tx6X70CWBRZxFpE7mhgO1OYdd1ylF0qNY9QEP
	p+GzHvr+U2cqTUadUR2S7513pgLJxQTFJkLemTd6AkU8fG3s85f9h3FWCO1+mj0eUluzRfp+frN
	xO+5cmpq5zJJO9o0amvb9Ecf7Hb4PWd1uOA==
X-Received: by 2002:a17:906:7fc4:: with SMTP id r4mr390978ejs.75.1632327126097;
        Wed, 22 Sep 2021 09:12:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzadcEEr7Fi33Ki0BxOQ1KWYBIUcg0qNRq/Trn57ZWXVALqnEsNlayl6UGsDbmDzc/vXuEZBg==
X-Received: by 2002:a17:906:7fc4:: with SMTP id r4mr390963ejs.75.1632327125956;
        Wed, 22 Sep 2021 09:12:05 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id b38sm1409122edf.46.2021.09.22.09.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 09:12:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed, 22 Sep 2021 18:11:08 +0200
Message-Id: <20210922161113.142758-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210922161113.142758-1-krzysztof.kozlowski@canonical.com>
References: <20210922161113.142758-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 7AEITSOEZEFJ6TRLJNHTPOKZZHY2VYQ3
X-Message-ID-Hash: 7AEITSOEZEFJ6TRLJNHTPOKZZHY2VYQ3
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 3/8] ci: switch to dnf on Fedora
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/7AEITSOEZEFJ6TRLJNHTPOKZZHY2VYQ3/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

dnf is the new package manager on Fedora.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 ci/fedora.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ci/fedora.sh b/ci/fedora.sh
index c5a67d237e91..f054f7d296d4 100755
--- a/ci/fedora.sh
+++ b/ci/fedora.sh
@@ -15,7 +15,7 @@ case $CC in
 	;;
 esac
 
-yum -y install \
+dnf -y install \
 	autoconf \
 	autoconf-archive \
 	automake \
@@ -27,7 +27,7 @@ yum -y install \
 	$PKGS_CC
 
 # Packages needed by CI
-yum -y install \
+dnf -y install \
 	file
 
 echo "Install finished: $0"
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
