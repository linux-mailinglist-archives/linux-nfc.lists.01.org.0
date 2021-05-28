Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B23A3942BD
	for <lists+linux-nfc@lfdr.de>; Fri, 28 May 2021 14:42:19 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 77050100EC1D3;
	Fri, 28 May 2021 05:42:16 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 0A00D100ED4A0
	for <linux-nfc@lists.01.org>; Fri, 28 May 2021 05:42:14 -0700 (PDT)
Received: from mail-ua1-f70.google.com ([209.85.222.70])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lmboa-0007xi-JD
	for linux-nfc@lists.01.org; Fri, 28 May 2021 12:42:12 +0000
Received: by mail-ua1-f70.google.com with SMTP id a8-20020ab03c880000b029020f88f9250bso1826844uax.17
        for <linux-nfc@lists.01.org>; Fri, 28 May 2021 05:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5rn4epAcNH1Mik4gARYYfuC/XhUWwqVwYBKCtmf4Gqs=;
        b=k08f4krO13H461YLaqFubDJ/idgtvRcXB13wnn3k0SsSD8j/SEVpX1yAntalCC9VON
         JX7JDjpGgQo97F0Ia68DSyMBwzFS+gpMDIJ0QrNR0VjtZbvOkxMnmT4QQkAUhLi0hzKI
         fAvWVTpCNid1baHpbTMNEwc8CV5v45W22A92g0YcxlKrmCK3rOcvjZb55w8dkcZI+RdH
         Kbwj3PqGGft4JyI7LKEctz80r7oRP2TsX3oHB94jD+mbQjDeGuVVZZVlY8hUgaFYook+
         soGmcEhYbm1IFGcHMMvaUhtJb8cdNsRIfazb2YYm4d4MT1xXXpKZ1x6WEfbNstWWHyCy
         aQsg==
X-Gm-Message-State: AOAM531/yw+YOK6OU3yVJlh3WR8fx1Y4iIdwr7hJHsczssugfpjGGsz5
	bGdfVs5WoIGLmEHI2qLeet6+uqV5RU/KkQtChoU/B1FFzbQoKNF15HwWfyY6iKioJFPaszy6tko
	Yn5Xp1PsWiK7yC+c2YWJ1KyrGRyp2uCMD4A==
X-Received: by 2002:a67:f489:: with SMTP id o9mr6659007vsn.47.1622205731738;
        Fri, 28 May 2021 05:42:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7U4c+zsR2eMX8uGtXZTl5loFQdOdjHKdIFeosX2oE3JmTuGdnSEfaAP46EceGx8B3kXxW1A==
X-Received: by 2002:a67:f489:: with SMTP id o9mr6658995vsn.47.1622205731595;
        Fri, 28 May 2021 05:42:11 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id b35sm782328uae.20.2021.05.28.05.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 05:42:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 28 May 2021 08:41:51 -0400
Message-Id: <20210528124200.79655-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
References: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: F4NVRSQYYNVNHODXW3KKKYDLELHH7KNZ
X-Message-ID-Hash: F4NVRSQYYNVNHODXW3KKKYDLELHH7KNZ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 03/12] nfc: port100: correct kerneldoc for structure
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/F4NVRSQYYNVNHODXW3KKKYDLELHH7KNZ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The port100_in_rf_setting structure does not contain valid kerneldoc
docummentation, unlike the port100_tg_rf_setting structure.  Correct the
kerneldoc to fix W=1 warnings:

    warning: This comment starts with '/**', but isn't a kernel-doc comment.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/port100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/port100.c b/drivers/nfc/port100.c
index 8e4d355dc3ae..4df926cc37d0 100644
--- a/drivers/nfc/port100.c
+++ b/drivers/nfc/port100.c
@@ -94,7 +94,7 @@ struct port100;
 typedef void (*port100_send_async_complete_t)(struct port100 *dev, void *arg,
 					      struct sk_buff *resp);
 
-/**
+/*
  * Setting sets structure for in_set_rf command
  *
  * @in_*_set_number: Represent the entry indexes in the port-100 RF Base Table.
@@ -145,7 +145,7 @@ static const struct port100_in_rf_setting in_rf_settings[] = {
 };
 
 /**
- * Setting sets structure for tg_set_rf command
+ * struct port100_tg_rf_setting - Setting sets structure for tg_set_rf command
  *
  * @tg_set_number: Represents the entry index in the port-100 RF Base Table.
  *                 This table contains multiple RF setting sets required for RF
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
