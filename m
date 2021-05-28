Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EA53942C4
	for <lists+linux-nfc@lfdr.de>; Fri, 28 May 2021 14:42:26 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id BE94D100EBBCE;
	Fri, 28 May 2021 05:42:22 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 87591100ED4AE
	for <linux-nfc@lists.01.org>; Fri, 28 May 2021 05:42:20 -0700 (PDT)
Received: from mail-vs1-f72.google.com ([209.85.217.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lmboh-0007zz-32
	for linux-nfc@lists.01.org; Fri, 28 May 2021 12:42:19 +0000
Received: by mail-vs1-f72.google.com with SMTP id s18-20020a05610201d2b029023869267cc8so947795vsq.21
        for <linux-nfc@lists.01.org>; Fri, 28 May 2021 05:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yRrONTypgp1EMOyVarHqpM55W7hpCkiyyNUgXqdeSg8=;
        b=VuaI1nJRThy2eOHlSh8qWr2Oh9HHMxFiG2s9I5G/DX/lhEbCyQJOYAZcJ66bmubehT
         JmmwmGWE+90mKBK7nuVF6wbQkH7cb+Pv+retGTLqNXTaESEUEYb9eyt+47wjzfVoO+/v
         h7w6bVo28PEkzMniBrWnZ7Euf/3cWRizDJGzeGIez7rYUAIpXd3oUDIPMXDu+3yhkZwU
         Fm5Bdo5uqnCl/yntx0JM/Ktg9cl6zYtwp1Ux764cGssBcbbCDrp8Iqw8UGjNT5/06x/V
         2DQlqC5lxaiUTvg4Bf6Ig3CNd3WXyZnk8jygH6bPKexG/rI8H5emf+yhKGNsybVZtSqb
         liug==
X-Gm-Message-State: AOAM533xyrrMVsrfiKzHomHi7TLCZH6XVoMdVl2ugaE/QBo3FS/QkVPF
	+aomBaYgItZYsyh5Sym1oLOJYjrm4taqrivLbi322plBE1DPrUuPVx7Ws4rlVZUhBfXsg6SdXSm
	ZH0ZtVYEYTVkhvGMWiJ0njb/giVc0Gt+XQA==
X-Received: by 2002:a9f:3d8e:: with SMTP id c14mr2753859uai.56.1622205738280;
        Fri, 28 May 2021 05:42:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZ85BUBzclvNLh7WIZE3MKmHtee0D8gkvhnzRRLXAKuWP18m1wvUKV55wFGMN9FZrfjQ2RGA==
X-Received: by 2002:a9f:3d8e:: with SMTP id c14mr2753841uai.56.1622205738135;
        Fri, 28 May 2021 05:42:18 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id b35sm782328uae.20.2021.05.28.05.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 05:42:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 28 May 2021 08:41:55 -0400
Message-Id: <20210528124200.79655-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
References: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: IHE2LQLZH2BRTIIFAHGXE33TBZVKC5ZR
X-Message-ID-Hash: IHE2LQLZH2BRTIIFAHGXE33TBZVKC5ZR
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 07/12] nfc: pn533: mark OF device ID tables as maybe unused
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/IHE2LQLZH2BRTIIFAHGXE33TBZVKC5ZR/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIGRyaXZlciBjYW4gbWF0Y2ggZWl0aGVyIHZpYSBPRiBvciBJMkMgSUQgdGFibGVzLiAgSWYg
T0YgaXMgZGlzYWJsZWQsDQp0aGUgdGFibGUgd2lsbCBiZSB1bnVzZWQ6DQoNCiAgICBkcml2ZXJz
L25mYy9wbjUzMy9pMmMuYzoyNTI6MzQ6IHdhcm5pbmc6DQogICAgICAgIOKAmG9mX3BuNTMzX2ky
Y19tYXRjaOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9
XQ0KDQpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93
c2tpQGNhbm9uaWNhbC5jb20+DQotLS0NCiBkcml2ZXJzL25mYy9wbjUzMy9pMmMuYyB8IDIgKy0N
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbmZjL3BuNTMzL2kyYy5jIGIvZHJpdmVycy9uZmMvcG41MzMvaTJjLmMN
CmluZGV4IDc5NWRhOWI4NWQ1Ni4uYmZjNjE3YWNhYmFlIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9u
ZmMvcG41MzMvaTJjLmMNCisrKyBiL2RyaXZlcnMvbmZjL3BuNTMzL2kyYy5jDQpAQCAtMjQ5LDcg
KzI0OSw3IEBAIHN0YXRpYyBpbnQgcG41MzNfaTJjX3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAq
Y2xpZW50KQ0KIAlyZXR1cm4gMDsNCiB9DQogDQotc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZp
Y2VfaWQgb2ZfcG41MzNfaTJjX21hdGNoW10gPSB7DQorc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9k
ZXZpY2VfaWQgb2ZfcG41MzNfaTJjX21hdGNoW10gX19tYXliZV91bnVzZWQgPSB7DQogCXsgLmNv
bXBhdGlibGUgPSAibnhwLHBuNTMyIiwgfSwNCiAJLyoNCiAJICogTk9URTogVGhlIHVzZSBvZiB0
aGUgY29tcGF0aWJsZXMgd2l0aCB0aGUgdHJhaWxpbmcgIi4uLi1pMmMiIGlzDQotLSANCjIuMjcu
MA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bmZjIG1haWxpbmcgbGlzdCAtLSBsaW51eC1uZmNAbGlzdHMuMDEub3JnClRvIHVuc3Vic2NyaWJl
IHNlbmQgYW4gZW1haWwgdG8gbGludXgtbmZjLWxlYXZlQGxpc3RzLjAxLm9yZwolKHdlYl9wYWdl
X3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpcw==
