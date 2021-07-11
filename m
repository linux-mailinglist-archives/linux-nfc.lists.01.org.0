Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E41F13C3F04
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:21:41 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 760E3100EB325;
	Sun, 11 Jul 2021 13:21:36 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id ABD5F100EB328
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:21:34 -0700 (PDT)
Received: from mail-wm1-f71.google.com ([209.85.128.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2fxF-0001ar-At
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:21:33 +0000
Received: by mail-wm1-f71.google.com with SMTP id m31-20020a05600c3b1fb02902082e9b2132so6823093wms.5
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=co2NCjym8IL1mS41VhEVa+ex81TKnHLr37TfUW+FZ6c=;
        b=GRETi0948TnUXpVubbkYN4cOaCjEVMnXIen7aSvfW1BnON9ipcMnZ93asW0dH2bHcV
         FvuMIUbhCABSAiKkbNkEXPfkKKhzBiezbvSijhTk15QqiaWBkwXZYhC5aggbpdgcl4sS
         uKTye5NHcLHiQBQ/V7sejTKMp5govoOk3rbHdKaVJ8lqMVwclKtfRMNG+udT2ugn4O+h
         cH5y+k/9Vtd/r5izcMcWiGiU1VoSsFeu4r8pNKgZtM9qY6BVvNcYxyyOv8xmkqCdILEo
         YOVdy1QEUjbZYvOqpQdSX+uO15g9F7cXasTFitp9wYcY4ljDGCkqJBZ755dGsOCeI5mL
         dMeQ==
X-Gm-Message-State: AOAM530+JtM6hCWzPs8E9YfHRQVHq0eTNfZs6vXOuPlC+VOkC8rU1Bim
	vW6Z7qltT4E8o6I4b619nImUvpyBB+Fk+h39+jYkkC98i8IRksix0HtsDfzpcnXDjcPsDDQBiX7
	ncPoaNUQi9A1SsXyC4P3ZchbXLQ7ZqcGy5w==
X-Received: by 2002:a5d:6189:: with SMTP id j9mr30793054wru.196.1626034892844;
        Sun, 11 Jul 2021 13:21:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJwxvTMddLx45VEp3hj+sSiPWxaWN7YI1sj3cuULTNyVLFMP/EakZ5Y7E/5uDZsRN2Z7+v4w==
X-Received: by 2002:a5d:6189:: with SMTP id j9mr30793042wru.196.1626034892676;
        Sun, 11 Jul 2021 13:21:32 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id d14sm1503256wrs.49.2021.07.11.13.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:21:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:20:36 +0200
Message-Id: <20210711202102.18094-9-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: ORLPOB6X3WGMAM7ZDYCOY7YPNDYXDSG2
X-Message-ID-Hash: ORLPOB6X3WGMAM7ZDYCOY7YPNDYXDSG2
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 08/34] HACKING: refine required packages
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ORLPOB6X3WGMAM7ZDYCOY7YPNDYXDSG2/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Debian since Jessie (8.0 from 2015) seems to have automake v1.14, so
mentioning some specific configuration for it is not needed.  In the
same time other required libraries and tools are not mentioned, so let's
refresh the requirements list.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 HACKING | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/HACKING b/HACKING
index 478653c8a292..c1eb6d6189a6 100644
--- a/HACKING
+++ b/HACKING
@@ -5,17 +5,18 @@ Hacking on Near Field Communication manager
 Build tools requirements
 ========================
 
-When building and testing directly from the repository it is important to
-have at least automake version 1.10 or later installed. All modern
-distributions should default to the latest version, but it seems that
-Debian's default is still an earlier version:
-
-  Check version
-    # dpkg -l '*automake*'
-
-  Install new version
-    # apt-get install automake1.10
-    # update-alternatives --config automake
+Required packages and tools:
+  autoconf
+  automake
+  dbus
+  gcc/clang
+  glib 2.0
+  libtool
+  libnl-3
+  libnl-genl-3
+  make
+
+See also installation scripts for  Continuous Integration in ci/ directory.
 
 
 Working with the source code repository
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
