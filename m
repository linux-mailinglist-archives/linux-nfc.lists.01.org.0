Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DFB3942BB
	for <lists+linux-nfc@lfdr.de>; Fri, 28 May 2021 14:42:18 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 68063100ED4BF;
	Fri, 28 May 2021 05:42:15 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	by ml01.01.org (Postfix) with ESMTP id BAE73100ED4A2
	for <linux-nfc@lists.01.org>; Fri, 28 May 2021 05:42:12 -0700 (PDT)
Received: from mail-vs1-f72.google.com ([209.85.217.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lmboX-0007wV-Hd
	for linux-nfc@lists.01.org; Fri, 28 May 2021 12:42:09 +0000
Received: by mail-vs1-f72.google.com with SMTP id f26-20020a67e09a0000b0290235a378d2f1so948799vsl.17
        for <linux-nfc@lists.01.org>; Fri, 28 May 2021 05:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rFH/OkxJX+1bf3RA1MwdAa7s8lhCFQ3NsGd/fHMtrBU=;
        b=M5CVRhaGAF2LuXUhngtogmbgt+CVni5UR0hDSmV4ImU4Dah9SNBTtYZ7FBi4DPWkf2
         N7fyOs8oflNGk34CCQO2ZAhcM2gN8ZykMdv1qi9DmuwokOBb/0GIi9Ro+rx329kX1nKC
         ShYj8/PRVxrtziCnAJe+PW//5j5T/7NzeiTA8Y7Ko8IxSno/eJksgkGh5voUqRu9S6Hv
         qnHso9bhTYbRteMbIb+aU5t6V5zP6javKWzVI8SaqsEivJjpiWOJV1UlhpQUHa5kkTRn
         55WpHk8oEK5o1w7ieBvFxToZ3l1SikcemqmIM18iG8kUel5ya8ADSfwK84gsHcRUqHTE
         Rh1g==
X-Gm-Message-State: AOAM530QGBx3kfPIRUyZkgriWhVtC2EP2/2G3gZ7PdvgDdzBdJa/F4nI
	QdOmRv3Pv06/ANJfMyQPXpPhByx0KhIGm1m9AM4NIJtb6ZbRVb6//zWEf8e0D7x7qhfszLpexRB
	p2Y4zZb/lCcYwMY8rSEChGaQUUgRJKtM5Qw==
X-Received: by 2002:a05:6102:5d0:: with SMTP id v16mr7076739vsf.31.1622205728675;
        Fri, 28 May 2021 05:42:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEVlZcqgPeeaF4dSVhZblaqkKUAk6rrB1qIKVtSVM+CD1gahWuLY4xUCoT2Axwd6Dn2W6LIg==
X-Received: by 2002:a05:6102:5d0:: with SMTP id v16mr7076718vsf.31.1622205728478;
        Fri, 28 May 2021 05:42:08 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id b35sm782328uae.20.2021.05.28.05.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 05:42:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 28 May 2021 08:41:49 -0400
Message-Id: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Message-ID-Hash: 5DTDCAH336VKYK343JD3ST2M3M7CQW56
X-Message-ID-Hash: 5DTDCAH336VKYK343JD3ST2M3M7CQW56
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 01/12] nfc: fdp: correct kerneldoc for structure
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/5DTDCAH336VKYK343JD3ST2M3M7CQW56/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since structure comments are not kerneldoc, remove the double ** to fix
W=1 warnings:

    warning: This comment starts with '/**', but isn't a kernel-doc comment.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/fdp/fdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/fdp/fdp.c b/drivers/nfc/fdp/fdp.c
index fe0719ed81a0..125d71c27b8b 100644
--- a/drivers/nfc/fdp/fdp.c
+++ b/drivers/nfc/fdp/fdp.c
@@ -149,7 +149,7 @@ static void fdp_nci_send_patch_cb(struct nci_dev *ndev)
 	wake_up(&info->setup_wq);
 }
 
-/**
+/*
  * Register a packet sent counter and a callback
  *
  * We have no other way of knowing when all firmware packets were sent out
@@ -167,7 +167,7 @@ static void fdp_nci_set_data_pkt_counter(struct nci_dev *ndev,
 	info->data_pkt_counter_cb = cb;
 }
 
-/**
+/*
  * The device is expecting a stream of packets. All packets need to
  * have the PBF flag set to 0x0 (last packet) even if the firmware
  * file is segmented and there are multiple packets. If we give the
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
