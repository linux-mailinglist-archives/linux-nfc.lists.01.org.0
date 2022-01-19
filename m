Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C034935DB
	for <lists+linux-nfc@lfdr.de>; Wed, 19 Jan 2022 08:53:26 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 177EC100F395D;
	Tue, 18 Jan 2022 23:53:18 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 39FE9100F3955
	for <linux-nfc@lists.01.org>; Tue, 18 Jan 2022 23:53:16 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id ED7F33F1C9
	for <linux-nfc@lists.01.org>; Wed, 19 Jan 2022 07:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642578788;
	bh=15HOmnObJXsVXxZJ5x/3DtxcDfRhMgZoa5zrHrITnNA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=MAf5F86XF4ZDlFIaJHfEwZPi9O9GLhPFwijdr8dFbdlCI6At0Iuh5MYpOKXrO0myS
	 0W//fbv3PiKD4GgINkDidqVMvg7pHIW+ze1rUbuH8498DoHexdPgDJJWlJKAPYuRso
	 Ia4otCe5zbgRsmX2M+TMNuaKacxNsp5GaZSdP11ljnSATR2H1Thsp/uq60o89faYKi
	 epbBgs/jbKysua3GBNTIc//zZs1Hi1sZ/bV5ueOQjSonxKAQC2+70sHRdtYSlITGPR
	 VzWy/FtuVWq7z/etstKB8OQTlDpZ6FP+rHIaElbUUP6JF9wKHgsW6Ow7xXOdDo9bpr
	 uj6V1tLXCT/sA==
Received: by mail-ed1-f71.google.com with SMTP id s9-20020aa7d789000000b004021d03e2dfso1464374edq.18
        for <linux-nfc@lists.01.org>; Tue, 18 Jan 2022 23:53:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=15HOmnObJXsVXxZJ5x/3DtxcDfRhMgZoa5zrHrITnNA=;
        b=KgB33kqlHo0Pmiart+tF0pXagC+JN81J+RAujIpX90c2FwknFNel8vcfzuWnpf5rg+
         6F38zmbRb7OZ8HwdI9F3U3M22EGMVGg/IxjyyT4IUrOoPNF+KkMgAJu8+i0Ttvz/YYMx
         hjB1r2G6JYchk4UaK91H8yJByU2t+0SR9gw4ZwQ99kQh4z4YIIwUt+zTnPiuJRSUfHs3
         I+t9xBR/1bSQ2zTxg0Q+Wyb3XHHFNSs/CGQtWhCDx7roXL1CMtuDCztCV7WeLw+3GB3g
         QUSecJYwdEVS46AzghBMIAuszurCARmXYqDPCgurHxq278qByQrOPcuwOypNlkvawx8c
         3EkQ==
X-Gm-Message-State: AOAM530C/47E2rweEW5YzKzSTBH025i0ZnA1s3MJVTj52iIvbvdh7dhg
	kIEUgHlkj0UfYdjU8y3VVq0ewIkWu8e2J3mqqrWlJRbwfbgw4zPqVb4ycKDu8k8a1rBpUkPy4wD
	bFYYmYwrVJ+0ley80HTG93B3G1TJ576tnkQ==
X-Received: by 2002:a17:906:314f:: with SMTP id e15mr24089115eje.658.1642578788655;
        Tue, 18 Jan 2022 23:53:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvebYbkc+sDSvj+IhZAZlbGMQ8r2BM5qm9B1lRUqpsvTkhNAMQvZayhml1fBn9wG0q6LpOgQ==
X-Received: by 2002:a17:906:314f:: with SMTP id e15mr24089106eje.658.1642578788503;
        Tue, 18 Jan 2022 23:53:08 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id w17sm805286edr.68.2022.01.18.23.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 23:53:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed, 19 Jan 2022 08:52:59 +0100
Message-Id: <20220119075301.7346-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220119075301.7346-1-krzysztof.kozlowski@canonical.com>
References: <20220119075301.7346-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: OZBIJBU6MWI5TFHD4CIVY3LK7HXD575C
X-Message-ID-Hash: OZBIJBU6MWI5TFHD4CIVY3LK7HXD575C
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 4/6] nfc: llcp: use test_bit()
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/OZBIJBU6MWI5TFHD4CIVY3LK7HXD575C/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use test_bit() instead of open-coding it, just like in other places
touching the bitmap.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/llcp_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 5ad5157aa9c5..b70d5042bf74 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -383,7 +383,7 @@ u8 nfc_llcp_get_sdp_ssap(struct nfc_llcp_local *local,
 			pr_debug("WKS %d\n", ssap);
 
 			/* This is a WKS, let's check if it's free */
-			if (local->local_wks & BIT(ssap)) {
+			if (test_bit(ssap, &local->local_wks)) {
 				mutex_unlock(&local->sdp_lock);
 
 				return LLCP_SAP_MAX;
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
