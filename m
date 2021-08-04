Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EFC3DFFCB
	for <lists+linux-nfc@lfdr.de>; Wed,  4 Aug 2021 13:03:52 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 08DF0100EBB61;
	Wed,  4 Aug 2021 04:03:41 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id DE85E100EBBC0
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 04:03:38 -0700 (PDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 279A03F0A7
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 11:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1628075017;
	bh=tkCYzrbCsxA2EyWW83gZUt6pO0vWj3UHlMj4OEokLF0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=mKMYVgV7kpnDgdrvnFcQEyLp2wMv/K2NR45etU8kNIwLJHMuDcevW/5z5diooaqgb
	 PQtmPaw7rF4az37DFYl43Mfwt2bAYKRr+obzs15iHkIZK5qwywCRNcWgNfkMamL/Yn
	 X/Vtw1z5clxEwfBxoCESOz9VU7x4Zjd34zm5mhA1EhA0hMEqMV4Q2gZ8WrdXrLOr3U
	 C3v80UkvpNdFQQNuF55UqmkJUyhN9T3zXa4VeP66rF3Ev/wjtvGx5h+8Z9dGQthqKK
	 0MPWuthgv0kXkku9NNgQCh7Xv6siAiv+7t4wEaKMJ12pl9WnC2gX+FX3LojD5TitxM
	 dNc2MbD6LUqTw==
Received: by mail-ed1-f71.google.com with SMTP id y19-20020a0564021713b02903bbfec89ebcso1251424edu.16
        for <linux-nfc@lists.01.org>; Wed, 04 Aug 2021 04:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tkCYzrbCsxA2EyWW83gZUt6pO0vWj3UHlMj4OEokLF0=;
        b=bq+JHfbgVQEHm9cCPYJsAtkj6Jvjun78wyU8qbtznn21gwFd6mHfxrBjJcFNSTCEh0
         FfOnhvsJzHPVqV6Bkr3LlMufdWqhcuia77jVoQWszhXgls+oGSBWhKJiscUtuyxZTEBQ
         e5MIZdoR8FnDx6TIa++52iAtRVYOCDMhEJf4/EhPo599OoS9eZcew01NrB9x5+gJZh8N
         YT80jYmIGbkwpeuYZXoSFgGLezodrWPnz0YFfG6scL66u5dD5x46DPfDu2UJri8BOfAu
         p4dMd19jZepgttCdFazol3soDH5rSLkj9hbx+/mhLFz1RDYrqNGAKPE6nh0jN6Gb45kU
         QYBw==
X-Gm-Message-State: AOAM530j2d+oo0RIVedfJNarpRhZr2qnGSshtb8wKDOCo/NCRfaWw6pH
	Z1Yq9HaOZ8G2JBYzFJOOo8lj6dswImxRuVNV8jlzg4O9iA7KptnDMEGDlvPyn5LKpTCacE2G4Ye
	3O+JoI7l5tjLI9Wl3Mrw/BE5Fym3QpClQhQ==
X-Received: by 2002:a05:6402:228f:: with SMTP id cw15mr22420159edb.150.1628075016755;
        Wed, 04 Aug 2021 04:03:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy370g+eKlBhCF9AZTgl6HtzOwbvYRZ+GUzTNRSf9KQNnu9Y75coxa9F9E4gq8fJxzo7feTNg==
X-Received: by 2002:a05:6402:228f:: with SMTP id cw15mr22420149edb.150.1628075016642;
        Wed, 04 Aug 2021 04:03:36 -0700 (PDT)
Received: from localhost.localdomain ([86.32.43.172])
        by smtp.gmail.com with ESMTPSA id lk14sm575748ejb.9.2021.08.04.04.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 04:03:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed,  4 Aug 2021 13:01:45 +0200
Message-Id: <20210804110145.85210-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Message-ID-Hash: HKRLGDWG32CYSWM2OSWP2QCTPQ3NAMJU
X-Message-ID-Hash: HKRLGDWG32CYSWM2OSWP2QCTPQ3NAMJU
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH] build: fix missing pkglibdir substitute in neard.pc
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/HKRLGDWG32CYSWM2OSWP2QCTPQ3NAMJU/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pkglibdir is used by neard.pc.in (so by autoconf) however the
automake defines it, not autoconf.  Add early definition of pkglibdir so
substitute in neard.pc.in will work correctly.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 configure.ac | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configure.ac b/configure.ac
index c1fdc44ae02d..ffe453049939 100644
--- a/configure.ac
+++ b/configure.ac
@@ -15,6 +15,10 @@ if (test "${libdir}" = '${exec_prefix}/lib'); then
 	libdir='${prefix}/lib'
 fi
 
+# pkglibdir is defined by automake but autoconf parses the neard.pc.in
+# which uses pkglibdir, therefore define it manually in autoconf.
+AC_SUBST([pkglibdir], ["\${libdir}/${PACKAGE_NAME}"])
+
 plugindir='${pkglibdir}/plugins'
 se_plugindir='${pkglibdir}/plugins-se'
 AC_SUBST(plugindir)
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
