Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D851E3942C1
	for <lists+linux-nfc@lfdr.de>; Fri, 28 May 2021 14:42:22 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 8F9A3100EC1C8;
	Fri, 28 May 2021 05:42:21 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B07BB100EC1DA
	for <linux-nfc@lists.01.org>; Fri, 28 May 2021 05:42:16 -0700 (PDT)
Received: from mail-ua1-f70.google.com ([209.85.222.70])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lmbod-0007yH-As
	for linux-nfc@lists.01.org; Fri, 28 May 2021 12:42:15 +0000
Received: by mail-ua1-f70.google.com with SMTP id i8-20020a9f3b080000b029023c932e01b8so1863478uah.3
        for <linux-nfc@lists.01.org>; Fri, 28 May 2021 05:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lw36VrwBWml7IzR1JdzowLQpX/jCNNF5gFQShdOaSgY=;
        b=mGweh50Eq73Hlq1iwo2lBk6eebNg3Zn8K+rqfhSvETSUb40XMdF82rYJEVNWqRRkqL
         r4bMhlkjdAaNY2QXrZfK75xLBZ+dxBvXQnyo+SjbPSL8G6OeHLQVTJstydjp6811ZmUq
         8uXp/FHQeK/LPSjmJ8u1UDOqa7IBq+/qv//4KxTZe9jjgMEQd0AVfZ9ohWQt0u35rkbH
         Dq/qIEtXJG3KX8hWG/X45iY9kUaLbExWTSYNhSzVyUvoDa0v/2ZSovqtz2zARtIDONUO
         Yei1KWqED3XpWx0p6Ndb5ZxrCKtT2Eh4F/+uvvMaZjWsSrMu0kyVGuPcZWxPTACtMB4z
         RBNg==
X-Gm-Message-State: AOAM530UMSI0TqDgUy98bz0aI83lvwIXVnDQcP0oc+XVc6Fb+sBlh5Xl
	o1a9Y+VuEgh4be+PHAzg2uwQ5Z/JlMGIQiohjdWpLH8UovNOiU7KTFnLheLK8HFo/YwuEr9MDIK
	FP4AjsihJEKVQV47VjRmJu4il3CMCX7AHWA==
X-Received: by 2002:a05:6102:512:: with SMTP id l18mr6715753vsa.33.1622205734511;
        Fri, 28 May 2021 05:42:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygSs9E1/NeULXJxJsESzmza338EBoj5njw0AYG2NAKnqAxU1H4XWuGjP0/bg2APuzVmtRxrQ==
X-Received: by 2002:a05:6102:512:: with SMTP id l18mr6715730vsa.33.1622205734327;
        Fri, 28 May 2021 05:42:14 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id b35sm782328uae.20.2021.05.28.05.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 05:42:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 28 May 2021 08:41:53 -0400
Message-Id: <20210528124200.79655-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
References: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: VOYB7CPCM5UA37TAG6UA5F45NNPO33GB
X-Message-ID-Hash: VOYB7CPCM5UA37TAG6UA5F45NNPO33GB
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 05/12] nfc: mrvl: mark OF device ID tables as maybe unused
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/VOYB7CPCM5UA37TAG6UA5F45NNPO33GB/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIGRyaXZlciBjYW4gbWF0Y2ggZWl0aGVyIHZpYSBPRiBvciBJMkMgSUQgdGFibGVzLiAgSWYg
T0YgaXMgZGlzYWJsZWQsDQp0aGUgdGFibGUgd2lsbCBiZSB1bnVzZWQ6DQoNCiAgICBkcml2ZXJz
L25mYy9uZmNtcnZsL3NwaS5jOjE5OTozNDogd2FybmluZzoNCiAgICAgICAg4oCYb2ZfbmZjbXJ2
bF9zcGlfbWF0Y2jigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlh
YmxlPV0NCg0KU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtv
emxvd3NraUBjYW5vbmljYWwuY29tPg0KLS0tDQogZHJpdmVycy9uZmMvbmZjbXJ2bC9pMmMuYyB8
IDIgKy0NCiBkcml2ZXJzL25mYy9uZmNtcnZsL3NwaS5jIHwgMiArLQ0KIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9uZmMvbmZjbXJ2bC9pMmMuYyBiL2RyaXZlcnMvbmZjL25mY21ydmwvaTJjLmMNCmluZGV4IGM1
NDIwNjE2YjdiYy4uYmFmZDliNTAwYjJjIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9uZmMvbmZjbXJ2
bC9pMmMuYw0KKysrIGIvZHJpdmVycy9uZmMvbmZjbXJ2bC9pMmMuYw0KQEAgLTI2MCw3ICsyNjAs
NyBAQCBzdGF0aWMgaW50IG5mY21ydmxfaTJjX3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xp
ZW50KQ0KIH0NCiANCiANCi1zdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBvZl9uZmNt
cnZsX2kyY19tYXRjaFtdID0gew0KK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG9m
X25mY21ydmxfaTJjX21hdGNoW10gX19tYXliZV91bnVzZWQgPSB7DQogCXsgLmNvbXBhdGlibGUg
PSAibWFydmVsbCxuZmMtaTJjIiwgfSwNCiAJe30sDQogfTsNCmRpZmYgLS1naXQgYS9kcml2ZXJz
L25mYy9uZmNtcnZsL3NwaS5jIGIvZHJpdmVycy9uZmMvbmZjbXJ2bC9zcGkuYw0KaW5kZXggZGVj
MGQzZWIzNjQ4Li4wNjQ3Yjg1OTMwYTYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL25mYy9uZmNtcnZs
L3NwaS5jDQorKysgYi9kcml2ZXJzL25mYy9uZmNtcnZsL3NwaS5jDQpAQCAtMTk2LDcgKzE5Niw3
IEBAIHN0YXRpYyBpbnQgbmZjbXJ2bF9zcGlfcmVtb3ZlKHN0cnVjdCBzcGlfZGV2aWNlICpzcGkp
DQogCXJldHVybiAwOw0KIH0NCiANCi1zdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBv
Zl9uZmNtcnZsX3NwaV9tYXRjaFtdID0gew0KK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNl
X2lkIG9mX25mY21ydmxfc3BpX21hdGNoW10gX19tYXliZV91bnVzZWQgPSB7DQogCXsgLmNvbXBh
dGlibGUgPSAibWFydmVsbCxuZmMtc3BpIiwgfSwNCiAJe30sDQogfTsNCi0tIA0KMi4yNy4wDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1uZmMg
bWFpbGluZyBsaXN0IC0tIGxpbnV4LW5mY0BsaXN0cy4wMS5vcmcKVG8gdW5zdWJzY3JpYmUgc2Vu
ZCBhbiBlbWFpbCB0byBsaW51eC1uZmMtbGVhdmVAbGlzdHMuMDEub3JnCiUod2ViX3BhZ2VfdXJs
KXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlz
