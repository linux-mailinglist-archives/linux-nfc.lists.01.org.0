Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5123DFD22
	for <lists+linux-nfc@lfdr.de>; Wed,  4 Aug 2021 10:43:15 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 7788F100EBB97;
	Wed,  4 Aug 2021 01:43:12 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id CBBA7100EBB75
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 01:43:10 -0700 (PDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id B68B33F328
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 08:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1628066589;
	bh=Cuuto7oTcbOWY4+CDbcJ3mwpxDTli5V86nm2bNjkCus=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=k8fuaj0dZVOyHcJ/Xi1FZCSdtbbj/ruAa0Kmf90EA4bqgCbEBf4THvo35FxM6HAzp
	 Ebvp300h33R7srA948BsYMPblUcZ5muVlvoqidzAc6zk90mZfYZWFSpVd/8bsHtIho
	 nKdzuk7EJYFRqaNlKpUJIgbiL+XBND/u8Ljtktr7fsuGNtrjgNphiflLvK1WHAWMuF
	 xV4J/lMKOvM6yTkreTixCcGRxMQRHkzNLcXdUvjWDiqdWlXEe/GwX9wispooQAiN1+
	 utpaFA7ObfDJEcp7EeixgK+tids1fEVLywOHpgwhbPEADotlWcfag0PvPhFMJai+23
	 OkIzW/f6COQcA==
Received: by mail-ed1-f69.google.com with SMTP id n24-20020aa7c7980000b02903bb4e1d45aaso1087485eds.15
        for <linux-nfc@lists.01.org>; Wed, 04 Aug 2021 01:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cuuto7oTcbOWY4+CDbcJ3mwpxDTli5V86nm2bNjkCus=;
        b=OpVlKiA8PyxLhLSfOXgiluO6az7whXTflknTYRsM7vj1LPgNy91C0RTM8kWr4JOmqQ
         Q6e4lkhLbA46qonk2kr/uD2CefdvO96LshIdlfp0yMEDwmpKszYdqpAJOjcfXMJ/8yY6
         w0jtvQjlDTzvJmPvhoiPFH2WvO7zcp82CscuLLI92E4q1EdrJITxEpQfLGdB8bhGst/o
         FxEVYv+l9Ytvr291MMqLrvjd7xStWkrD+3eSGyD2d+/mlDWD2UADlS4gIFp9wNowQ+K3
         Qezz7whpsPZpp2hgDBXC6WXXljcBvRNOXu9b1/vf/0ft0mCtgOpDo5t1wd0I0KJV2NkZ
         SwHQ==
X-Gm-Message-State: AOAM532bLj5h5wlK7bHR1RvVpM0saqha+NIlA0N3HWx4wwio9MSNqvs9
	t+ZqpoXtJZTiWmXFCrdgHVezwEQSpcRj6u25/2pihCmwyxGWLgduE2R77icxKON7NW9Y5xb2OQS
	0LZ9PdjdyG9k8bXmYGybVS56oqGfS5JCCzw==
X-Received: by 2002:a17:906:eca:: with SMTP id u10mr24761498eji.209.1628066589238;
        Wed, 04 Aug 2021 01:43:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGeqgjjFBRA8+YR/2pj83f/CEp/x1h5fPaQJ90qEpBFM5oDnVqjsQFZa6Dd2in5JcLjUyIHA==
X-Received: by 2002:a17:906:eca:: with SMTP id u10mr24761491eji.209.1628066589121;
        Wed, 04 Aug 2021 01:43:09 -0700 (PDT)
Received: from localhost.localdomain ([86.32.43.172])
        by smtp.gmail.com with ESMTPSA id lw22sm459968ejb.74.2021.08.04.01.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 01:43:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed,  4 Aug 2021 10:42:11 +0200
Message-Id: <20210804084218.14677-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
References: <20210804084218.14677-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 5QXDH6EN4ADFIQMH2JYATHUGHHHZ65ZB
X-Message-ID-Hash: 5QXDH6EN4ADFIQMH2JYATHUGHHHZ65ZB
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 04/11] ci: add building without maintainer options
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/5QXDH6EN4ADFIQMH2JYATHUGHHHZ65ZB/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Check also silent builds.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 3d9b50251602..589ad66280f5 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -24,27 +24,49 @@ jobs:
           - container: "ubuntu:hirsute"
             env:
               CC: gcc
+              MODE: maintainer
+
+          - container: "ubuntu:hirsute"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              MODE: no-maintainer
 
           - container: "ubuntu:focal"
             env:
               CC: gcc
+              MODE: maintainer
+
+          - container: "ubuntu:focal"
+            env:
+              CC: gcc
+              MODE: no-maintainer
 
           - container: "ubuntu:bionic"
             env:
               CC: gcc
+              MODE: maintainer
 
           - container: "ubuntu:xenial"
             env:
               CC: gcc
+              MODE: maintainer
 
           # Ubuntu clang
           - container: "ubuntu:hirsute"
             env:
               CC: clang
+              MODE: maintainer
+
+          - container: "ubuntu:focal"
+            env:
+              CC: clang
+              MODE: maintainer
 
           - container: "ubuntu:focal"
             env:
               CC: clang
+              MODE: no-maintainer
 
     container:
       image: ${{ matrix.container }}
@@ -77,7 +99,19 @@ jobs:
         printenv
 
     - name: Configure
-      run: ./bootstrap-configure
+      run: |
+        echo "Bootstraping in mode: $MODE"
+        if [ "$MODE" = "maintainer" ]; then
+          ./bootstrap-configure
+        else
+          ./bootstrap && \
+            ./configure \
+            --disable-systemd \
+            --prefix=/usr \
+            --enable-ese \
+            --sysconfdir=/etc \
+            --enable-tools
+        fi
 
     - name: Compile
       run: make -j$(nproc)
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
