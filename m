Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A56393CD30E
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:00 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 23F4E100EB323;
	Mon, 19 Jul 2021 04:08:57 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 7DB3F100EB855
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:55 -0700 (PDT)
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 88D25418CF
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692934;
	bh=c5n4bc2TkKHK0AdATMazhNZk+dxCMRPdxxqU0aBkdNg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=h6qWoINCNHTVTuJXNZ9HSC3zgoVdT8f7tskKrTHJBhQDRTHM0MYxhkLYe43/KmXUW
	 wF1I9YMB0YBk4ugzdOxePjzSNdpJifrpJYRC3TsarpPWJSXQA3RADSCMIwi8ARIeDT
	 vWlaQqfNN5z6oPWtX5HSxoGuK4AmvHL7A0fcnnFpByH0fmR3KZnq0SYBB9rzjdiK0V
	 llicftzOUxqWVBcN4STXSnfMfu/2Q2pnfbnpHv7o4Ah1HdM/RRyj5B11RUpbyxgiZ7
	 T25ZJaH2EUP2sxi+lXn2u4ni1q9d/PvVDv+d+1rPhUZWZjmKHAzFwd/E+oOODwwZXD
	 rBLaJRvu4Ek3w==
Received: by mail-lj1-f200.google.com with SMTP id o10-20020a2e9a0a0000b02901978bad99feso2029169lji.0
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c5n4bc2TkKHK0AdATMazhNZk+dxCMRPdxxqU0aBkdNg=;
        b=GhcYc5ynLsSu6d+dCfi3ry2LiPYF6T/6uar3Y+aFIjMuEAOGvZo86UnJl/tgbTrnVZ
         BbySN8bgZvNaUIHArSGWvZ2P1PlZ9MoLPoI/SClHLlwo0K+y4iitgwyT9W6QdDvrPz3P
         rumqLMeyxCU/sEyta5AVX3VW2VGfGGDeIWVp/lXk8/vTdP2uc2tVYH9ZwNVAWnNlvzMv
         vRFDiYo4HtXKFIjuMl0QUxHuVOE11NkmxDdNumtSi0rG40vp0xVtX7BMubmemuoVyHS5
         kWg38vqNbzzg2AdqQAHa53Q02riiP3CvFp0a2XTsF37Dao3MSjvDo1teXbE+ABqhZ6KA
         XMsA==
X-Gm-Message-State: AOAM533UmQBN0y+l2zAD3DJ/T5mS/nBk1FPwav8lOlZ1eXdLTXG/lN9m
	Z/0JcimvI1TkdKAXNclVeW6m9JfLPIyKbG6qTFT6HSkF8f3dk1tH+I9LtmJ+9jytoAgO+2Fewqm
	w/F4Ww1+5Tjq+vOD7dqT/ksPcWxpU+TINKg==
X-Received: by 2002:a05:6512:990:: with SMTP id w16mr2534791lft.346.1626692933843;
        Mon, 19 Jul 2021 04:08:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8+FchyjVSNrbpIl+HdB9vf5jezqXCnEcapYZcaBQPn4vM7ghWjxrzmGOa0pIdchBrRg+6yQ==
X-Received: by 2002:a05:6512:990:: with SMTP id w16mr2534783lft.346.1626692933698;
        Mon, 19 Jul 2021 04:08:53 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:08:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:23 +0200
Message-Id: <20210719110819.27340-18-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: PRLUVV2QYN6LTM3R3IE4AHE6OM7BTJFS
X-Message-ID-Hash: PRLUVV2QYN6LTM3R3IE4AHE6OM7BTJFS
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 17/73] se: fix multiple apdu definitions
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/PRLUVV2QYN6LTM3R3IE4AHE6OM7BTJFS/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fixes:

    /usr/bin/ld: se/seeld-manager.o:se/seel.h:31: multiple definition of `apdu'; se/seeld-main.o:se/seel.h:31: first defined here
    /usr/bin/ld: se/seeld-se.o:se/seel.h:31: multiple definition of `apdu'; se/seeld-main.o:se/seel.h:31: first defined here
    /usr/bin/ld: se/seeld-driver.o:se/seel.h:31: multiple definition of `apdu'; se/seeld-main.o:se/seel.h:31: first defined here
    /usr/bin/ld: se/seeld-apdu.o:se/seel.h:31: multiple definition of `apdu'; se/seeld-main.o:se/seel.h:31: first defined here
    /usr/bin/ld: se/seeld-channel.o:se/seel.h:31: multiple definition of `apdu'; se/seeld-main.o:se/seel.h:31: first defined here
    /usr/bin/ld: se/seeld-ace.o:se/seel.h:31: multiple definition of `apdu'; se/seeld-main.o:se/seel.h:31: first defined here

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 se/seel.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/se/seel.h b/se/seel.h
index 24cd0011ffb7..ea89e1519764 100644
--- a/se/seel.h
+++ b/se/seel.h
@@ -28,7 +28,7 @@
 struct seel_se;
 struct seel_channel;
 struct seel_ace;
-struct seel_apdu *apdu;
+struct seel_apdu;
 
 int __seel_manager_init(DBusConnection *conn);
 void __seel_manager_cleanup(void);
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
