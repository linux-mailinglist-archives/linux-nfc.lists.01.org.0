Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3864B5023
	for <lists+linux-nfc@lfdr.de>; Mon, 14 Feb 2022 13:31:26 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 3667B100F3920;
	Mon, 14 Feb 2022 04:31:24 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id A7A58100EA13A
	for <linux-nfc@lists.01.org>; Mon, 14 Feb 2022 04:31:18 -0800 (PST)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 822733F071
	for <linux-nfc@lists.01.org>; Mon, 14 Feb 2022 12:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644841876;
	bh=nG3wXleiXQZTIlBL2hIryaIFAxbCN/jQ3spY2QChKHI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=ZGcjGi2v7HkCGxu7SlUUtnmx+QVQNJ0yxIxdY2fApzail+vTBqAc56R3CCnP2tY8L
	 nMgFg/5J9I2ZJL6Npd3fbCPRQDaguqI7TPWLk/hIm2WpvNmgiFvdGBINIO7s0a9D/H
	 WWFNdcWOLdRwpc+IoYOiFEaOl59AEcmyVLZWrkl/gEtCvG60u3zoNgpzU97hP4NEaK
	 dZ6y5ffcTEJHEz5CvOXfQVWS2nyR43Ydm+KByKi4qyHFYmxE/C+bkatjK4T1tBCVsw
	 35vyw5qqyKgyX6mNA+peNr6DrZckBpNmbjQdNrAO5oiq3cHfgHyJzg2bZdjiuQOaNu
	 X+rGSaPtzDa7A==
Received: by mail-wr1-f69.google.com with SMTP id k20-20020adfc714000000b001e305cd1597so6847875wrg.19
        for <linux-nfc@lists.01.org>; Mon, 14 Feb 2022 04:31:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nG3wXleiXQZTIlBL2hIryaIFAxbCN/jQ3spY2QChKHI=;
        b=prThQO/+ikg1dswiKzWVZTfHGi/cjpFYaIlFUffyZEXSvpPZzMuBSS5+Cw1jHenNc7
         ZPwQRL+VcSH2/0ZnXmrKTJtNpaEXyDby5U3KF5Fsv3b8fY+NmVKZ2fgG2IAbP4ujcCtZ
         +ttOchf74dndrNtYwBWUAuAUuLZF55jk1bY4+2JTuk6Xcgw7Wifpvf85z7aKdFEDhXoJ
         GVCwB1nWQPxOUAV1mp7vpF+Jv+5BM1qC2KKubltr4JVx8p/HVRa9kkGxOnKXMcDvOijc
         TzRiiN5nclK88qKCKL1Zk/KyAejDk0eAB6trQAIxhGJ6gQsaU1OYZhk/0JPeu5lJb0dn
         w3+w==
X-Gm-Message-State: AOAM531+/389miJVVtVzYUG+XjO6Lh2U0W1Oy4tspgoWeggvME10nFsH
	spg/GWWDknXJMfQwXjxXi3e+0QdmsxTgfaTa/EVQ0nDBXzkIYkF/f9l2aXVQAxnlxhA070LxhPz
	Hp/nBBO8t5zf+UmA/AaDt+kv7z71mGnIwCw==
X-Received: by 2002:a05:6000:1242:: with SMTP id j2mr11156252wrx.39.1644841876064;
        Mon, 14 Feb 2022 04:31:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKQ+EdZVXM6hOi+FxVbrpksvvLNhGSv+G52pYkgWxb0EwZNBBatcHJh81uLFqrQhBX59f1uQ==
X-Received: by 2002:a05:6000:1242:: with SMTP id j2mr11156239wrx.39.1644841875825;
        Mon, 14 Feb 2022 04:31:15 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f14sm9853832wmq.3.2022.02.14.04.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 04:31:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 14 Feb 2022 13:31:07 +0100
Message-Id: <20220214123110.27056-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Message-ID-Hash: EY4NUGY5BWAU27M2BJDX7M2L6JIUFCFI
X-Message-ID-Hash: EY4NUGY5BWAU27M2BJDX7M2L6JIUFCFI
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 1/3] ci: show kernel headers version and difference against embedded nfc.h
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/EY4NUGY5BWAU27M2BJDX7M2L6JIUFCFI/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We embed the /usr/include/linux/nfc.h as nfc_copy.h, to compile cleanly
on older kernels (e.g. older than v4.15 without
NFC_CMD_DEACTIVATE_TARGET).  See also commit fb7664e2995f ("include: Add
a copy of the NFC kernel header").  We should sync our local
nfc_copy.h with kernel sources from time to time, but it is easy to
forget this.

Add a separate Continuous Integration step to show kernel headers
version and differences between kernel's nfc.h and our local copy, so we
can notice kernel uses a different one.  This is purely for maintenance.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 2e1ad40debb9..8cd836d398a7 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -276,11 +276,20 @@ jobs:
     - name: Display environment and Linux version
       run: |
         test -f /etc/issue && cat /etc/issue
+        echo "############################################"
         lsb_release -a || true
+        echo "############################################"
+        cat /usr/include/linux/version.h
+        echo "############################################"
         uname -a
+        echo "############################################"
         cat /proc/cmdline
+        echo "############################################"
         printenv
 
+    - name: Display nfc.h differences between local and Linux kernel headers
+      run: diff -uBb /usr/include/linux/nfc.h include/nfc_copy.h || true
+
     - name: Configure
       id: configure
       run: |
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
