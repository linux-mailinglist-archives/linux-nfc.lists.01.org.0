Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DD93DBAD7
	for <lists+linux-nfc@lfdr.de>; Fri, 30 Jul 2021 16:42:22 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 6F966100EB32A;
	Fri, 30 Jul 2021 07:42:20 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 82B9E100EB859
	for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 07:42:17 -0700 (PDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 0A9483F10B
	for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 14:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627656136;
	bh=VTZKLd4Cikiu9JLg7PgN5ojxKk/zgZVaneS8eoEANNg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=wG4q3F2QwIMWJeVKxe6/BaXgZlq4lh8fmwMXSqQ5qeo/j21FgAiWBC+m0AKZSa0RL
	 Y5iS8JlzOzplGVG5GclJu01t5iyHzrqPXrMUKNQI8/ehW/iGCGUv6vOjiRk4K6NGML
	 7Uoq3GD2e29/eVXf8jiPax6YHIC7o5caMPQ7u2A3Qgak2rXIM+2eJaYV0AjPurSvdg
	 gh20AOwPUkDyeaTGvLBxtRYHFKT3nE8Z1a8tPJsRwYIZIiQ+tvQRKe2GIVXfn5HV7T
	 dZoB34Txu5X47HMnQw3NFYdx1idP657Mzfo8U249FsXtOoc39l7ScFcqofqV4rkq7O
	 As0PM8hqaxZ+Q==
Received: by mail-ed1-f72.google.com with SMTP id b88-20020a509f610000b02903ab1f22e1dcso4730317edf.23
        for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 07:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VTZKLd4Cikiu9JLg7PgN5ojxKk/zgZVaneS8eoEANNg=;
        b=swLdgJAd/Xf/f0abuEui5aD/deZgyO0U8j42WIKWnYb9C51bXMeGCAsk5T/EIpKGNY
         QsYGglmlHpn5fyVsgN25lAI9MeKjI8BSgwhaxjzvvgSovRL2F3KsMWQ+ILq02WbyoqTS
         /vOp5ZlM6wNa7N/epxDcCiPdoXIvIcTffpnQ1i3ADTAT+EkUakGfwZrCx6TGl3D8qvQd
         RNfDx+1j6VEI9lENZN3PIa0ew9QMf22Jo1W2nV28BM44RbCIlpJl7aOHdjpy5poPQy9b
         P11AvW0mv6fDQP2Pq1Wg91aJ6dFiKZqji9Kt7JJW55SAU1BomVTX/5Ijx5+T9KA/Ra0e
         1Qdw==
X-Gm-Message-State: AOAM532VyZodsMbxTIY2hxBk36nf9tEYIhV9VPRp1uNJ4eP37Ex3uLJc
	uFNRmcsY/qBO57Pqus8cHxVkgqe3AFuKNTwYeaeMrknY1ytKzoRA1CnH/4/OyYp+c8YYRqNPdIN
	MngvCOJEz0S/wlQ5XOixZcuTO32U3QJIpAQ==
X-Received: by 2002:a05:6402:d5a:: with SMTP id ec26mr3436355edb.4.1627656135821;
        Fri, 30 Jul 2021 07:42:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTklZlpNPU1+0JaWvnxKZnRAAAubw23rxdRY2xTtGKFHycvUIP2Hj5u3KPcqBIf0isib80/w==
X-Received: by 2002:a05:6402:d5a:: with SMTP id ec26mr3436345edb.4.1627656135731;
        Fri, 30 Jul 2021 07:42:15 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id z8sm626325ejd.94.2021.07.30.07.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:42:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 30 Jul 2021 16:41:58 +0200
Message-Id: <20210730144202.255890-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210730144202.255890-1-krzysztof.kozlowski@canonical.com>
References: <20210730144202.255890-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: PZX7INBS7SZVHUZCGU4EBO7CCQI3RFTP
X-Message-ID-Hash: PZX7INBS7SZVHUZCGU4EBO7CCQI3RFTP
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v3 3/7] nfc: hci: annotate nfc_llc_init() as __init
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/PZX7INBS7SZVHUZCGU4EBO7CCQI3RFTP/>
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
