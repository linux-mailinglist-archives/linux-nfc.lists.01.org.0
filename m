Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B27C3C8367
	for <lists+linux-nfc@lfdr.de>; Wed, 14 Jul 2021 13:05:44 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 12253100F224B;
	Wed, 14 Jul 2021 04:05:39 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id F26F3100EB350
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:36 -0700 (PDT)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id E573040616
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 11:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626260735;
	bh=XKw1/c536ZHX/gzP5i8+96EtvtexIvKsoMzRAeDBA7s=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=GTKTXvvTALTRD8zFaK9YA8uR40SErzLMA9TI47zojKCCyDbcK//f3bsuATWFrG1pj
	 rB/Pi3IFbksUYWujulf2nULxwaPSO5nY5po45Tb8GJlzGydZ7dBRP2keEoGy6RH6er
	 u46dFxQZfMjD1V38v85NO1xBJHINx3PqtRZjqtfXups290BfLlVywFv/1JwBTj5Q3u
	 H6psELNZRLOWTDhm4bivAeaBaOdOjvzQLAqo+Boxs9jSjJPxrgM7kEA/0T3i5rvj0m
	 cGXlcBqYlmn7CpP6V8rVakHXKep5RgwpX0tBnZ3wxb/Qf8XN4+P53+0jojoz3/lWDD
	 PT8j19TcZHpTg==
Received: by mail-ej1-f70.google.com with SMTP id lb20-20020a1709077854b02904c5f93c0124so640891ejc.14
        for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XKw1/c536ZHX/gzP5i8+96EtvtexIvKsoMzRAeDBA7s=;
        b=Odmf3cBa5CcSR+i307+U/HzZ+SsUCDFRsxYCqIT4DtQ8o72+mQQEFjN0bsbwV1w4hN
         q9GX+A2rb6IvwmMYk7yDrXzoAuxhRN0kj/4nr+/Fi/0YOq0t9A1CD6OVENiKvVgkhsu2
         pEKlFLlYGPwLt7Oowji7gGmcdWfTvLdrc1UhLElv+x/m4rI3wadkNxRbT3hsLD8en3aM
         UqdeMYNLHo78t4iBCWxPNcHwnrhZVoZlLGEfyma6yn9yar46v+PknVweSzw2we94IktY
         QP2y1/8nW5qT63M96tXDcSWFYRJtw2VlMd4HXE5YQ2DdPfqiKEeXGl0S9V6CawdkWfKp
         /0Cg==
X-Gm-Message-State: AOAM530NT1C1WoccAUPpNlOCP7q3wrJ6iSt6r5s98CCA/wd3i/INJRhN
	NtaA/OIqc6GfJJ1YQCn8zjjhFYLuFxLX7Zi4DQYUPPmcfyraIVHuHW81BOXXQ5kGhpDoZlNa236
	joF5ZDUyumCNq/RiM57iaSUsDd6vTirb4Eg==
X-Received: by 2002:a17:906:dc0f:: with SMTP id yy15mr11446982ejb.255.1626260735475;
        Wed, 14 Jul 2021 04:05:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHj8D8FK5/BHTMAsuKYFG34Tx7KmtZnDJKCcJVWxxy49H/gM607DVAV34EnRJ7KNLkbGzamg==
X-Received: by 2002:a17:906:dc0f:: with SMTP id yy15mr11446975ejb.255.1626260735356;
        Wed, 14 Jul 2021 04:05:35 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id qp12sm637689ejb.90.2021.07.14.04.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 04:05:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed, 14 Jul 2021 13:05:09 +0200
Message-Id: <20210714110518.104655-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
References: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: P3LZT5N33WFZ7WIHZOPWFIPCHCG4TKKF
X-Message-ID-Hash: P3LZT5N33WFZ7WIHZOPWFIPCHCG4TKKF
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 07/16] ci: build also on Ubuntu Hirsute in non-maintainer mode
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/P3LZT5N33WFZ7WIHZOPWFIPCHCG4TKKF/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Increase the coverage.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index a9335e100fb4..6ecd38177bde 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -153,6 +153,12 @@ jobs:
               CC: gcc
               MODE: maintainer
 
+          - container: "ubuntu:hirsute"
+            env:
+              ARCH: x86-64
+              CC: gcc
+              MODE: no-maintainer
+
           - container: "ubuntu:focal"
             env:
               ARCH: x86-64
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
