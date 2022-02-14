Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D79084B5025
	for <lists+linux-nfc@lfdr.de>; Mon, 14 Feb 2022 13:31:27 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 5CE53100E5D88;
	Mon, 14 Feb 2022 04:31:25 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 8EBE6100EA13A
	for <linux-nfc@lists.01.org>; Mon, 14 Feb 2022 04:31:20 -0800 (PST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A818040335
	for <linux-nfc@lists.01.org>; Mon, 14 Feb 2022 12:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644841878;
	bh=zoHFtWfokvVXjkkj+g8VD6zTwOLGfWNPIRaDIM77Xdo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=eDTZn/SbtElS46JjIshi588r9ZnWb6NJwYxyZDd6l+g9fUW4JFeW2asCVz/c9MYQH
	 dzFYn1CeBKWKSP2FPXN2GZdTEulWfyXbrCRDokIiPVv+35xtTWmMghs0j6uu0NlebM
	 2962OMWadoGzmME5G+DnSSnX6DiMQjH6LLS7lhesrw+TQDbNeCGxOMrroOrq6DwjBw
	 OtPLqQLvSOlncWbOH+C8B7FgRmyg4ikyAYJai5ysG30UNcO4EaqwImLMMq2rI5snHK
	 DmYsKgbDO1Rv+hNR7p8dE2WaVWxuYfio67RpbHCJMfQuBtljFPICWkh7utmePuMvyA
	 N5+mIu9p8ZzJQ==
Received: by mail-wm1-f69.google.com with SMTP id ay41-20020a05600c1e2900b0037c5168b3c4so2925940wmb.7
        for <linux-nfc@lists.01.org>; Mon, 14 Feb 2022 04:31:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zoHFtWfokvVXjkkj+g8VD6zTwOLGfWNPIRaDIM77Xdo=;
        b=vZcT0fxFd3H/o3wTJx11V3XhKipq/MusZ0sb53s7nd0kUHqNPJWSTCm8vOVwgZdW79
         /jlZnfAtQ7eBXMIntQt7/Jh8p+zsBFbCEOT93BG08DDxWUpiOPOaFW7yfBjJ815IGc8/
         BCXAYGeSGzh+pnH8z52BJ1yhvA7Wq9ZcYNjNOWtECdLrVmhTYMx7e75gdfqo+AjaaBGx
         eDFQ4iE9tzgKoRHVesD2OZs7cUw5I1meac2KnE3B5NcN/314VZtgk8QqARH0t4AV9Fj6
         o1pj+b+N4SWT1J5x1g3hgTDKEygPYFkBvTum1QTscbW3gepYazLKKQoPF3RAZJPbpC8b
         OYSg==
X-Gm-Message-State: AOAM530nTTrfOi+N9e07mroAsxRPGrr39IeNFb524ej4IXLNF+HrYMMR
	bVXg3QBztnP6qOVcvYhzqaEtgACPoZ94TVwintza4ejPClteBuxsFlMLnjDMg0ugKX0YIpVL8oc
	FLpnKkm/Ez+f+EbANaF0sOTNBxr7BDQfymg==
X-Received: by 2002:a5d:4b42:: with SMTP id w2mr10912452wrs.48.1644841877973;
        Mon, 14 Feb 2022 04:31:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRuq9tU+NQfp8AW3DsoZZgwxEVN401oVZqwjMrlR2ErdnmZ8pLMtrDC7qHESWvRsvxBqoAow==
X-Received: by 2002:a5d:4b42:: with SMTP id w2mr10912444wrs.48.1644841877846;
        Mon, 14 Feb 2022 04:31:17 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f14sm9853832wmq.3.2022.02.14.04.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 04:31:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 14 Feb 2022 13:31:09 +0100
Message-Id: <20220214123110.27056-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214123110.27056-1-krzysztof.kozlowski@canonical.com>
References: <20220214123110.27056-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: S3XRVZA2JNCTCVQEQL3WQX3XIGZDL3W7
X-Message-ID-Hash: S3XRVZA2JNCTCVQEQL3WQX3XIGZDL3W7
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 2/3] ci: build on newer Fedora Linux (34 and 35)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/S3XRVZA2JNCTCVQEQL3WQX3XIGZDL3W7/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Support for Fedora Linux 32 and 33 ended, so switch to new Fedora Linux
34 and 35.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 8cd836d398a7..1759d6571e74 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -32,8 +32,8 @@ jobs:
           # Fails on configure on GCC and clang (process restrictions?)
           # - fedora:rawhide
           - fedora:latest
-          - fedora:33
-          - fedora:32
+          - fedora:35
+          - fedora:34
           - ubuntu:impish
           - ubuntu:hirsute
           - ubuntu:focal
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
