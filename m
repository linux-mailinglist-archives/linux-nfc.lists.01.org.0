Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E00083E000E
	for <lists+linux-nfc@lfdr.de>; Wed,  4 Aug 2021 13:20:49 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 5B862100EB822;
	Wed,  4 Aug 2021 04:20:48 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id E1251100EBB6E
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 04:20:45 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 8DE2B3F34C
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 11:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1628076044;
	bh=eDt9UhVgA6xlSrq516zHvfdbbJCewz0aVppLmHKANTw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=QdCpFzjQ/zjA9fK8QFDmT1VpJ9+NX4FHRzjcLXloP9lPOOBA+LIsk4qU+Tj4PiZ4m
	 Ejm5aab9yT5clEywfrYyXuhGMskViONNrXEfdKcEogh0C7RKA895PJIkd59Mspczgn
	 wNdFcMo/6O2BWXsWQSwhNSyxgBQZJ9aium4OQB0S5N0YsLdYAcyCQ+oUZnSBIBYnV4
	 FPiXO22ajwloKz+RmlHAjjKGthayh88PfhIBvGFOm9G40pIpmkLLWfJTable9XUIew
	 9k3QJ9AsE4S32fEQKab2sU7k1IkBUFEBiD3EC1l8hf7ZpjbZUDrgPd/8OZuqRLnC7V
	 CZHW+oRBX9X1g==
Received: by mail-ed1-f70.google.com with SMTP id n24-20020aa7c7980000b02903bb4e1d45aaso1275739eds.15
        for <linux-nfc@lists.01.org>; Wed, 04 Aug 2021 04:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eDt9UhVgA6xlSrq516zHvfdbbJCewz0aVppLmHKANTw=;
        b=PwBwl54EyYkHCCTum9XlltjsWuDafI2pFJL3SlEjQWpaxpEzt2QYLG8VkqEUAH7Iqn
         ULu7KcsyMZDI2/aUbyJsDWhmuuaNgq67nKlTpatgU/zEIYEj3/FfSgGti5Uc4SttbTXW
         e5oGpCMTaTrIUHzH6CegX2NaE13FactF+Q3nCQJJcXfYpIJKt2BaD1qiEuTBeV6aDph5
         yfG0lBtaTPNm2G2lH8J6aTQNUfQ9TT1poYKaDcERyfFWOs9AXeveEXdUv/1uThQ1LocD
         BGHJtw9rKF1g8RJzYah7SLkoguPlT9FzGLMuDW+7a5YmfRC+OeVGtJcPT/LruuYt8IhV
         6jeQ==
X-Gm-Message-State: AOAM532uauGOHCb1oE1cvWfiW+q9GH1lwGH4enj4s7RQuRnXwpOJ1l74
	NzHCj1U9a9HvTv34sHEYJ40DXXFKzkVT5Zvgsdy5l5j/SgNdj4B9ynpPtAiESOl6AB8WkUqIs41
	zgfJTEqpjianvvInVapb8396Q5fqUF9ewcQ==
X-Received: by 2002:a17:906:46da:: with SMTP id k26mr8123655ejs.398.1628076044138;
        Wed, 04 Aug 2021 04:20:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzIucOT+TdfVLbz1RMdFrBWrJ1s4y5hoGFIl9cnVMa2hN3xK5oA6RInH2stT2EOaz6zSCxWA==
X-Received: by 2002:a17:906:46da:: with SMTP id k26mr8123641ejs.398.1628076043976;
        Wed, 04 Aug 2021 04:20:43 -0700 (PDT)
Received: from localhost.localdomain ([86.32.43.172])
        by smtp.gmail.com with ESMTPSA id k20sm579756ejr.93.2021.08.04.04.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 04:20:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed,  4 Aug 2021 13:19:56 +0200
Message-Id: <20210804111956.86833-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Message-ID-Hash: 5523FR77MND4BSDX6G2RKXOEIZSGAAFF
X-Message-ID-Hash: 5523FR77MND4BSDX6G2RKXOEIZSGAAFF
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH] README: describe contributions
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/5523FR77MND4BSDX6G2RKXOEIZSGAAFF/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Mention the linux-nfc mailing list for contributions and current
repositories - GitHub and kernel.org.  Document explicitly that
contributions can come also via GitHub pull request.  For many
developers without experience in development of Linux kernel, the GitHub
PRs are easier than the patch-email workflow.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 README | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/README b/README
index 8204b690eda0..509363bccac3 100644
--- a/README
+++ b/README
@@ -54,3 +54,21 @@ disabled with the following configuration options:
 Running ./bootstrap-configure will build the configure script and then
 run it, with maintainer mode enabled. bootstrap-configure will configure
 neard with all features enabled.
+
+Bugs and contributing
+=====================
+
+Please send bug reports to mailing list:
+	linux-nfc@lists.01.org
+
+The project development happens on GitHub:
+	https://github.com/linux-nfc/neard
+
+However for historical reasons the releases are also mirrored on kernel.org
+repository:
+	https://git.kernel.org/pub/scm/network/nfc/neard.git/
+
+Contributions can come in a form of patches sent to linux-nfc@lists.01.org or
+GitHub pull requests on mentioned GitHub repository.
+
+See also HACKING and doc/coding-style.txt files.
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
