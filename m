Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E49F13DB409
	for <lists+linux-nfc@lfdr.de>; Fri, 30 Jul 2021 08:57:06 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 29AC6100EB858;
	Thu, 29 Jul 2021 23:57:03 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 29B2D100EBBDD
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 23:57:01 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id E883D3F232
	for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 06:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627628219;
	bh=VTZKLd4Cikiu9JLg7PgN5ojxKk/zgZVaneS8eoEANNg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=blv0rcEmGWek80qxxIg+997a1WkFwDwK7d2eVUedS18yUdyUkDpTcSCImUanqfGic
	 VB3ny/z1bleHHFMgZMiZtAzsH6juzBjVwOYmnD8TeyXWzUp86Zu3+oSUZ1V6nJhty0
	 BOsxvQD4zKGHrYur7YDHvWcJHEgqLfwoymdyGMcUWwRv9tFBjyo8m316mAjd34RhJB
	 a/sB7nPRA3yPDgGO5jBtLuHqWmjz++7lxclAEAmnErv/OPR8ogIp6vhyi6YPNTtrLC
	 9pbzQwidCYgq+Yp1M5uLbIYampqdsdTSRvgjtsox1rNvRYjrfREe1CZBnuN8cabNbF
	 488CCD7OA0oHw==
Received: by mail-ed1-f70.google.com with SMTP id h16-20020aa7de100000b02903a6620f87feso4160412edv.18
        for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 23:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VTZKLd4Cikiu9JLg7PgN5ojxKk/zgZVaneS8eoEANNg=;
        b=PHV8qBgysUCmC+wHmD5NmPKCFYepV/HTKnVy8CX2E7o6UJFoi3sYFpDxavOzXFByRl
         GHF5L5WSNTUWS3vzOlKlAS1NspL3MQactRnzNeRUF7lTSqapSUuLJ8XJh6UJcfR8Xr5z
         CfcRxPf0djxycX4v296Ok6bS0ylSZd6vkxc4zU04ep8i/62wS4MR42UcusDl8/LAmyeh
         2+LbEovACmSR5JNSq38f0HiFJ2zk+Vh4OEh/p9Fb/35pRRrYLM/0kO2FDb1tyml3ToHC
         mDLFBvvfN0sBoZYiX9+yYagtdXiVOUIvU2+ofQ1bpLrsf/9B/D1Sm4CdVUlhHLyoegEV
         GulA==
X-Gm-Message-State: AOAM530ePYK+wdK8AGxIJ8uU4T3TwIIV8vCnz7ct6cZ7QSEX2qQYWIG5
	K34HbUg3qOGVZkw2Upyv2agAwSg2lt3gQckokKfcREfX2W2IV+8zDuTnZ3rl0JWhqWBLiQCq73E
	BUJUOX+f5bvwZ3HiQQOQUCGVGZQbbtPnWtg==
X-Received: by 2002:a17:906:b0c5:: with SMTP id bk5mr1155704ejb.428.1627628219715;
        Thu, 29 Jul 2021 23:56:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylZ3S3p6DxsgjZ/9cTB22EdT6oJK/+hQyLCw8aJEthyQhQ6wGtvZ2CpjES4B9CXlBatvmOMg==
X-Received: by 2002:a17:906:b0c5:: with SMTP id bk5mr1155697ejb.428.1627628219574;
        Thu, 29 Jul 2021 23:56:59 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id m9sm238518ejn.91.2021.07.29.23.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 23:56:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 30 Jul 2021 08:56:20 +0200
Message-Id: <20210730065625.34010-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210730065625.34010-1-krzysztof.kozlowski@canonical.com>
References: <20210730065625.34010-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: UU3KKVZ7S6S4CJXS576KG4BLDOZI2NQ2
X-Message-ID-Hash: UU3KKVZ7S6S4CJXS576KG4BLDOZI2NQ2
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 3/8] nfc: hci: annotate nfc_llc_init() as __init
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/UU3KKVZ7S6S4CJXS576KG4BLDOZI2NQ2/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The nfc_llc_init() is used only in other __init annotated context.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/hci/llc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/nfc/hci/llc.c b/net/nfc/hci/llc.c
index fc6b63de3462..2140f6724644 100644
--- a/net/nfc/hci/llc.c
+++ b/net/nfc/hci/llc.c
@@ -11,7 +11,7 @@
 
 static LIST_HEAD(llc_engines);
 
-int nfc_llc_init(void)
+int __init nfc_llc_init(void)
 {
 	int r;
 
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
