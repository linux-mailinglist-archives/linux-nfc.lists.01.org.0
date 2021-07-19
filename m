Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6BE3CD2FE
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:08:41 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E66E2100EBB94;
	Mon, 19 Jul 2021 04:08:39 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 96F89100EBBBD
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:37 -0700 (PDT)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id C6EDD408B2
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692915;
	bh=QhSeDGvqFoZEDSp2vAlljfekmO0nq75LswF+gc4V/+s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=pvcVS8gu9mokvp1Cwk4BfBh43iiHihbkSawwr1DDtJvWspMDlOmCZh9ZqSrsdLDOP
	 f59EX2YxzcU4dFdoFtsVuJEdH4lX4AHvzcviQBZtJuhQgPxLw2rOw6ZCtBAmD8s3lq
	 rATJXQx1eqwcIMye7Mmw8BHdPK6FU6lbI5fPKc5i1wX4J4yY2r0Luo84gx84RsR6D7
	 jOYUaYbYEVa0izN2D921DIRXK1BOZ05xm/UsCEsXZaXq7Gpb9nCXyGpEOLvVjNr17C
	 +vpVlvaBxXzSYmYYbfXh2a0nHBoBTiPYOqnLvqvWAHL70PIczofymsXne0i/9lhhqF
	 1YAFXYlc50ejw==
Received: by mail-lj1-f198.google.com with SMTP id 5-20020a05651c12c5b0290193ec0f79ceso5911659lje.20
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QhSeDGvqFoZEDSp2vAlljfekmO0nq75LswF+gc4V/+s=;
        b=kfruBzv8xLaNpdfZprTAUnG4GaLcgZ8+ClC3mbA6dHHyS0bALnV3q/GbPTIk9QpHUM
         lU1KYfM87S7VUApXKVCfhNy0b38R4v/+MCmr9r2pTtSD3ozDSQXmoE5KrCUyb2c0iAVI
         Dctb396j2e8dAaFD2j5IeeOasuDo3k3MW4JMpPOECTIWXwEII7rDZyRJ+d4PdMe+aKij
         rr7wgA+RXEGnqXh5fYJk6nRw4G8jUfLblKuGYtfbtXMd9Gw9dkH/zqHJrebjoejf56HK
         n+CmympxztIydeeHrNpXVzt0HF3H+Xgtlb8eVORBzqNG+St/r2cc0xAQ5oSSUwvNlxgg
         hj3g==
X-Gm-Message-State: AOAM532EkoaSY2DoecfoO2pWoIkBXNXMJMS+hgWcdgjb4lcfIqr0j/Yx
	3JYi8eKck3RZc1FWUgfr6vdqub1wCA2Bo80SwubYdqCjAX5v4wB+MUyKEC1HzEKtiqiq1gm/jhB
	ijjfS4lPGE5MlUFRb9ikdWJ3uxtbmPHsr4g==
X-Received: by 2002:a05:651c:513:: with SMTP id o19mr22752720ljp.35.1626692915114;
        Mon, 19 Jul 2021 04:08:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0XApZynv8iB3V0BGRbgQnTrwFnrRpB2t0rnR1gi8e7ZUXDGMijwpI19cLKApoqIrzrz93rA==
X-Received: by 2002:a05:651c:513:: with SMTP id o19mr22752715ljp.35.1626692914991;
        Mon, 19 Jul 2021 04:08:34 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:08:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:07 +0200
Message-Id: <20210719110819.27340-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 3DRJDUU5AUCEBFSCKVADESIJQZ53KSGU
X-Message-ID-Hash: 3DRJDUU5AUCEBFSCKVADESIJQZ53KSGU
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 01/73] Drop empty NEWS
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/3DRJDUU5AUCEBFSCKVADESIJQZ53KSGU/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There are no news.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 NEWS | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 NEWS

diff --git a/NEWS b/NEWS
deleted file mode 100644
index e69de29bb2d1..000000000000
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
