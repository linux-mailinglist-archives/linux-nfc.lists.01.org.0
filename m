Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2054D3942C6
	for <lists+linux-nfc@lfdr.de>; Fri, 28 May 2021 14:42:29 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E2E17100EC1DA;
	Fri, 28 May 2021 05:42:24 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 36F71100EBB6A
	for <linux-nfc@lists.01.org>; Fri, 28 May 2021 05:42:23 -0700 (PDT)
Received: from mail-ua1-f69.google.com ([209.85.222.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lmboj-00081L-Qo
	for linux-nfc@lists.01.org; Fri, 28 May 2021 12:42:21 +0000
Received: by mail-ua1-f69.google.com with SMTP id d22-20020ab031960000b0290223019877e7so1850380uan.11
        for <linux-nfc@lists.01.org>; Fri, 28 May 2021 05:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xi/NsDS4IjaK0xUaurfvCiwF1a8SfsfV6rw+HJ5RS3o=;
        b=mFdfBqs2h7rzm7pCOJDC+bJRFBFUByFJbdfp3XaKUyQS5f4m8y+u20bUMB9Y8Ilxe+
         Oudm1+8z9I2Bu4FqkdEBRZqu6HewOeDDfaYM5ig9+BLu2Rt5a0n++A5TDihpTVv4kEk0
         bMdldpaj1EfXmS6lvfnAUSRYCiNmq7OMf2ips6SGr1wAwsLcyNIb8jCSzvWgVJDNyOvH
         6EfnqWLceGIuC41anYEHFRGLa46O1shCJSrdH1PaTIa7BNQGrK8OxIpu55/T7euCsSIA
         XDOTh8j0CdiY9qkgWa+D5BpcXorFLP8Gkv9atxgJwtnmeK5Pa60GVuWhQdv/g5xbv9dz
         cPxg==
X-Gm-Message-State: AOAM533miUL8x2kyH54eD+KA4f/rq5GvrfcfaqHcvkffMzFXvpVqzdSL
	iC5ml2bREcFr5xq5ZFxq+Y9Jjo5uy+BR9w0kei6w/GsmBK6u4y625hgInb+U6qCcIkmDkgByVnJ
	eBhutpQHbhIh/BHAySV9EjH2B59MKZzdMqQ==
X-Received: by 2002:a1f:f84a:: with SMTP id w71mr5977875vkh.4.1622205741009;
        Fri, 28 May 2021 05:42:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnhXTt0JMrjFgz7bxnO/WhpFd/Z/vii9Wwis1Kyx0+9nbuCIwGaLCOgr65EHk25XSkaukBKA==
X-Received: by 2002:a1f:f84a:: with SMTP id w71mr5977858vkh.4.1622205740887;
        Fri, 28 May 2021 05:42:20 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id b35sm782328uae.20.2021.05.28.05.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 05:42:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 28 May 2021 08:41:57 -0400
Message-Id: <20210528124200.79655-9-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
References: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: AIMPW25UYO27XTH2J3WZN3YBFCGIPLAV
X-Message-ID-Hash: AIMPW25UYO27XTH2J3WZN3YBFCGIPLAV
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 09/12] nfc: pn544: mark ACPI and OF device ID tables as maybe unused
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/AIMPW25UYO27XTH2J3WZN3YBFCGIPLAV/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIGRyaXZlciBjYW4gbWF0Y2ggZWl0aGVyIHZpYSBPRiBvciBBQ1BJIElEIHRhYmxlcy4gIElm
IG9uZQ0KY29uZmlndXJhdGlvbiBpcyBkaXNhYmxlZCwgdGhlIHRhYmxlIHdpbGwgYmUgdW51c2Vk
Og0KDQogICAgZHJpdmVycy9uZmMvcG41NDQvaTJjLmM6NTM6MzY6IHdhcm5pbmc6DQogICAgICAg
IOKAmHBuNTQ0X2hjaV9pMmNfYWNwaV9tYXRjaOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1
bnVzZWQtY29uc3QtdmFyaWFibGU9XQ0KDQpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93
c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGNhbm9uaWNhbC5jb20+DQotLS0NCiBkcml2ZXJzL25m
Yy9wbjU0NC9pMmMuYyB8IDQgKystLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL25mYy9wbjU0NC9pMmMuYyBi
L2RyaXZlcnMvbmZjL3BuNTQ0L2kyYy5jDQppbmRleCA0YWM4Y2IyNjI1NTkuLmFhYzc3OGM1ZGRk
MiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbmZjL3BuNTQ0L2kyYy5jDQorKysgYi9kcml2ZXJzL25m
Yy9wbjU0NC9pMmMuYw0KQEAgLTUwLDcgKzUwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNf
ZGV2aWNlX2lkIHBuNTQ0X2hjaV9pMmNfaWRfdGFibGVbXSA9IHsNCiANCiBNT0RVTEVfREVWSUNF
X1RBQkxFKGkyYywgcG41NDRfaGNpX2kyY19pZF90YWJsZSk7DQogDQotc3RhdGljIGNvbnN0IHN0
cnVjdCBhY3BpX2RldmljZV9pZCBwbjU0NF9oY2lfaTJjX2FjcGlfbWF0Y2hbXSA9IHsNCitzdGF0
aWMgY29uc3Qgc3RydWN0IGFjcGlfZGV2aWNlX2lkIHBuNTQ0X2hjaV9pMmNfYWNwaV9tYXRjaFtd
IF9fbWF5YmVfdW51c2VkID0gew0KIAl7Ik5YUDU0NDAiLCAwfSwNCiAJe30NCiB9Ow0KQEAgLTk1
MSw3ICs5NTEsNyBAQCBzdGF0aWMgaW50IHBuNTQ0X2hjaV9pMmNfcmVtb3ZlKHN0cnVjdCBpMmNf
Y2xpZW50ICpjbGllbnQpDQogCXJldHVybiAwOw0KIH0NCiANCi1zdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCBvZl9wbjU0NF9pMmNfbWF0Y2hbXSA9IHsNCitzdGF0aWMgY29uc3Qgc3Ry
dWN0IG9mX2RldmljZV9pZCBvZl9wbjU0NF9pMmNfbWF0Y2hbXSBfX21heWJlX3VudXNlZCA9IHsN
CiAJeyAuY29tcGF0aWJsZSA9ICJueHAscG41NDQtaTJjIiwgfSwNCiAJe30sDQogfTsNCi0tIA0K
Mi4yNy4wDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1uZmMgbWFpbGluZyBsaXN0IC0tIGxpbnV4LW5mY0BsaXN0cy4wMS5vcmcKVG8gdW5zdWJz
Y3JpYmUgc2VuZCBhbiBlbWFpbCB0byBsaW51eC1uZmMtbGVhdmVAbGlzdHMuMDEub3JnCiUod2Vi
X3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlz
