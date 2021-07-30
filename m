Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1303DBAD8
	for <lists+linux-nfc@lfdr.de>; Fri, 30 Jul 2021 16:42:22 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 58A14100EB85D;
	Fri, 30 Jul 2021 07:42:18 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id E69C1100EB82A
	for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 07:42:15 -0700 (PDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id DB59B3F224
	for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 14:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627656134;
	bh=TbQaBsPvgLCz2s8QzntY35xkR7Vmp0dFUIMeahF8LO0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=CNeFH3vOjV4brfoqHjX2pf+QmrSaMsofYMDWz6YpRSkQUyIynlf+MGvlkCkAFsTn4
	 o/OXqYiQarMNUaVq/CuV8yr5KZ38PlThVoEZTkL29bh7NV/r3vT7h3JZlleBc1lbrT
	 BD6B7GiAu+JTpn/E6XuXyDQzp3eh1L4v6EkIw8Hu+SOw/2r5/jaDtfy0rP5RKPFTjo
	 xSf0k4xiysdQp64q2B4VW9hA7bweRs0gI17h4bISYyo9nM40+ge0nzYfeiuzVOofID
	 3w7bjSAEuzZhVgZY/wMLsl2kLfVIK/xgCUIurGFWdDjb4bGi67/OduIkBy5f79dPPi
	 ADWS3CKeHZVzA==
Received: by mail-ed1-f72.google.com with SMTP id b88-20020a509f610000b02903ab1f22e1dcso4730283edf.23
        for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 07:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TbQaBsPvgLCz2s8QzntY35xkR7Vmp0dFUIMeahF8LO0=;
        b=WTaTJX4htv1CHcNLYO9Wjd9jDU+xQHPw7B2zWc+YVX/l0yslVp1YEXVO8jSM/KiGyz
         CjLPWh8zr/Ro/7tlGkbJ4bNVVWH00G/sro3Bv01mjIWhEIMuOaM6c0lG29j/VDlsqxbU
         mCvFUwXE6nAtZO3fchAtb542ZBfqcP+fWn1MipPp07K2e6hCJCGWT/z0NLHJPenx+Kio
         4B/kmZt7IsVoHl9kkq0sf1FXf6UncY8IYVZgu2N2fncM8fsjmOwHSIEEXrDuBhDbHbxA
         30+gqAC+t2OLbmvnRbj8rNW5/1kuALQGx20GfSxKO1qaErfei59h1pPytsxuc8IZbLvr
         aYjA==
X-Gm-Message-State: AOAM531hhUqBcnilFqnjEStwxxg6Imb4lYkN+CZjGc71EOgwQ6gMgbMb
	BlgO4rv/Fny51O6EVgcfl8I/jZn5QBmBPOHTmH8Nfg5XPplFK4ODeEmUOpSgvKLPzo/MNWoZbOK
	6AqObpuhqAFFGlSWeNPqaHXB4vgkiBxo5CQ==
X-Received: by 2002:a17:906:86c4:: with SMTP id j4mr2848909ejy.431.1627656134597;
        Fri, 30 Jul 2021 07:42:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8Klnq9CtuMrsD3GihuUGntFuHCAKTpSOD1rOEbMDFczVq69hHakiLNzSMjrVWjMVMmOkKUQ==
X-Received: by 2002:a17:906:86c4:: with SMTP id j4mr2848887ejy.431.1627656134331;
        Fri, 30 Jul 2021 07:42:14 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id z8sm626325ejd.94.2021.07.30.07.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:42:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 30 Jul 2021 16:41:57 +0200
Message-Id: <20210730144202.255890-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210730144202.255890-1-krzysztof.kozlowski@canonical.com>
References: <20210730144202.255890-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: QVDQU7YFSFQCU4Z5E2QM4X724RTYFTRU
X-Message-ID-Hash: QVDQU7YFSFQCU4Z5E2QM4X724RTYFTRU
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v3 2/7] nfc: annotate af_nfc_exit() as __exit
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/QVDQU7YFSFQCU4Z5E2QM4X724RTYFTRU/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The af_nfc_exit() is used only in other __exit annotated context
(nfc_exit()).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/af_nfc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/nfc/af_nfc.c b/net/nfc/af_nfc.c
index 4a9e72073564..6024fad905ff 100644
--- a/net/nfc/af_nfc.c
+++ b/net/nfc/af_nfc.c
@@ -79,7 +79,7 @@ int __init af_nfc_init(void)
 	return sock_register(&nfc_sock_family_ops);
 }
 
-void af_nfc_exit(void)
+void __exit af_nfc_exit(void)
 {
 	sock_unregister(PF_NFC);
 }
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
