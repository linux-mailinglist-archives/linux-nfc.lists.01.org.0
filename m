Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C121D3944AB
	for <lists+linux-nfc@lfdr.de>; Fri, 28 May 2021 16:57:10 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 795FC100ED4BA;
	Fri, 28 May 2021 07:57:09 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B3D07100ED4AB
	for <linux-nfc@lists.01.org>; Fri, 28 May 2021 07:57:08 -0700 (PDT)
Received: from mail-ua1-f70.google.com ([209.85.222.70])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lmdv9-0004Ka-Dl
	for linux-nfc@lists.01.org; Fri, 28 May 2021 14:57:07 +0000
Received: by mail-ua1-f70.google.com with SMTP id 5-20020ab000850000b029020fb0e74c2aso1984696uaj.21
        for <linux-nfc@lists.01.org>; Fri, 28 May 2021 07:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=edJlbbhDO28RmalfYtPxF+agVQnBc9uKOzw55MZRkiU=;
        b=p0xqF2pjGCes9nucJ6nL9+UZ34xfS48I9DES+b5/nCtQ74zcJjGbwapwmFdRyz3QP+
         fidlgoZDJBuh8ssv2bnrzWxkOVxwIrCjvdyMxyvKibO9fhF12Te7efn65WiyHGZTgoZA
         MhvPLv9locXsabc4xPr6Lnb27drRV+I/Y/ntP2zi6hGisTanQmjvtN7LE0ajBLaZWAfD
         ujSPIrITmEMsmZSDhZ/1LCHuba0+DPWMbyTO5QgmfgFChLDFuTINhr+eO5YmeCHLN/k5
         euvYl6UuWaEeLwVe3ioVtvnXgdW/WxVcG5UuJczqkfbWt/zRsgFY9daBooKG1Mt0h8Pc
         GWhA==
X-Gm-Message-State: AOAM533Kfe4xfcptVSbb4TjNs5khxlub2kjyERhecmir8ghLIJyRVYVW
	EhGjw0yyW+KrM3XmKr+5ctUw57RkzIIzL9d9LTWJnGwmSIUBEfzR0Jh1NNsH+k/kzhxRMaDZnWn
	FbNW91rve/E7dxtsWIlXYp4PpHu7E8cXflg==
X-Received: by 2002:ab0:3482:: with SMTP id c2mr3488389uar.122.1622213826610;
        Fri, 28 May 2021 07:57:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylmdPw48e3WnJvVm8n1XmFKbfo4OOP5M8lb+ZI/nv+T5y9BFhzf21srOlHkwLrsW2LDgEx3w==
X-Received: by 2002:ab0:3482:: with SMTP id c2mr3488375uar.122.1622213826492;
        Fri, 28 May 2021 07:57:06 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id 64sm330505uay.11.2021.05.28.07.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 07:57:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 28 May 2021 10:56:51 -0400
Message-Id: <20210528145651.125648-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210528145330.125055-1-krzysztof.kozlowski@canonical.com>
References: <20210528145330.125055-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: L4Q6JIYGYYMXCPREHYX775XNWRMJ6XIP
X-Message-ID-Hash: L4Q6JIYGYYMXCPREHYX775XNWRMJ6XIP
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 11/11] nfc: st95hf: fix indentation to tabs
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/L4Q6JIYGYYMXCPREHYX775XNWRMJ6XIP/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use tabs to indent instead of spaces. No functional change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/st95hf/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
index 0d99181b6ce3..2dc788c363fd 100644
--- a/drivers/nfc/st95hf/core.c
+++ b/drivers/nfc/st95hf/core.c
@@ -1057,8 +1057,8 @@ static const struct spi_device_id st95hf_id[] = {
 MODULE_DEVICE_TABLE(spi, st95hf_id);
 
 static const struct of_device_id st95hf_spi_of_match[] __maybe_unused = {
-        { .compatible = "st,st95hf" },
-        { },
+	{ .compatible = "st,st95hf" },
+	{},
 };
 MODULE_DEVICE_TABLE(of, st95hf_spi_of_match);
 
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
