Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EA53942C7
	for <lists+linux-nfc@lfdr.de>; Fri, 28 May 2021 14:42:30 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id F3959100EBBD9;
	Fri, 28 May 2021 05:42:26 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 599A2100ED4A2
	for <linux-nfc@lists.01.org>; Fri, 28 May 2021 05:42:25 -0700 (PDT)
Received: from mail-ua1-f72.google.com ([209.85.222.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lmbol-00081r-RU
	for linux-nfc@lists.01.org; Fri, 28 May 2021 12:42:23 +0000
Received: by mail-ua1-f72.google.com with SMTP id d22-20020ab031960000b0290223019877e7so1850408uan.11
        for <linux-nfc@lists.01.org>; Fri, 28 May 2021 05:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QgOmPhTBJh9RRkgxZVTiKdOGNIiMBeUiuN1whRzpH+c=;
        b=kke1l2qQfe7jbXy0geEp7OrpJmyNBFNKOywIujJBFkf6qjzfb/pGRDE7L9WSt43MsR
         rJsIdEKUlPQTXzab97aics0eGwKVtoAKb9pdMJi8roeePGBehucVLtCVp5sx1YtkYNJY
         DX0yf1ZmX9IJ/BauRwll6LWfI5tWtNlDW8VxaIGnLAcnj4Auh0gN9J567I/zTrPk8U9J
         0cL2KzwDYhxfLZkFBgn2u/9OKo66Quf0jeFE4MOK1dgeMTT2diSuro3it+C7+/Jx6WUG
         vUPJwJdR2P9IYXs4OMla404SW+oOvjlWEMPDyLbJwOMCigN7ly0K7lcnsdBZA4sDnkn+
         pdVg==
X-Gm-Message-State: AOAM531uzKIuCLk8yd+MTzeMhgLPsWxzcF0ae7nUbqi3tdDbguci0gty
	BOKfsQvKz4gIiupzF5yjy/JdflrO7i96o5Zuzk/XBuztvjd8CgfiRMUENfT8DmwQWs+jvj7Q+pj
	n9c+7rBIHRDBx5rMMphFFpYKLlaXcfpzhaw==
X-Received: by 2002:a67:f3d5:: with SMTP id j21mr6279314vsn.56.1622205743019;
        Fri, 28 May 2021 05:42:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy294cc3ptUaStQ6oMzMn163IRlakgN+VqEvCDV/ilun/KRmRzCMHN0evL0hFuVQTM6mArb6w==
X-Received: by 2002:a67:f3d5:: with SMTP id j21mr6279301vsn.56.1622205742872;
        Fri, 28 May 2021 05:42:22 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id b35sm782328uae.20.2021.05.28.05.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 05:42:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 28 May 2021 08:41:58 -0400
Message-Id: <20210528124200.79655-10-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
References: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: BMR3EG5HGZZBDYOTBWZ3JN4G75BFV6U2
X-Message-ID-Hash: BMR3EG5HGZZBDYOTBWZ3JN4G75BFV6U2
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 10/12] nfc: st-nci: mark ACPI and OF device ID tables as maybe unused
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/BMR3EG5HGZZBDYOTBWZ3JN4G75BFV6U2/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIGRyaXZlciBjYW4gbWF0Y2ggZWl0aGVyIHZpYSBPRiBvciBBQ1BJIElEIHRhYmxlcy4gIElm
IG9uZQ0KY29uZmlndXJhdGlvbiBpcyBkaXNhYmxlZCwgdGhlIHRhYmxlIHdpbGwgYmUgdW51c2Vk
Og0KDQogICAgZHJpdmVycy9uZmMvc3QtbmNpL3NwaS5jOjI5NjozNDogd2FybmluZzoNCiAgICAg
ICAg4oCYb2Zfc3RfbmNpX3NwaV9tYXRjaOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVz
ZWQtY29uc3QtdmFyaWFibGU9XQ0KDQpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnp5c3p0b2Yua296bG93c2tpQGNhbm9uaWNhbC5jb20+DQotLS0NCiBkcml2ZXJzL25mYy9z
dC1uY2kvaTJjLmMgfCA0ICsrLS0NCiBkcml2ZXJzL25mYy9zdC1uY2kvc3BpLmMgfCA0ICsrLS0N
CiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbmZjL3N0LW5jaS9pMmMuYyBiL2RyaXZlcnMvbmZjL3N0LW5jaS9p
MmMuYw0KaW5kZXggNTVkNjAwY2QzODYxLi42NjNkMWNjMTliODEgMTAwNjQ0DQotLS0gYS9kcml2
ZXJzL25mYy9zdC1uY2kvaTJjLmMNCisrKyBiL2RyaXZlcnMvbmZjL3N0LW5jaS9pMmMuYw0KQEAg
LTI3NCwxNCArMjc0LDE0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZCBzdF9u
Y2lfaTJjX2lkX3RhYmxlW10gPSB7DQogfTsNCiBNT0RVTEVfREVWSUNFX1RBQkxFKGkyYywgc3Rf
bmNpX2kyY19pZF90YWJsZSk7DQogDQotc3RhdGljIGNvbnN0IHN0cnVjdCBhY3BpX2RldmljZV9p
ZCBzdF9uY2lfaTJjX2FjcGlfbWF0Y2hbXSA9IHsNCitzdGF0aWMgY29uc3Qgc3RydWN0IGFjcGlf
ZGV2aWNlX2lkIHN0X25jaV9pMmNfYWNwaV9tYXRjaFtdIF9fbWF5YmVfdW51c2VkID0gew0KIAl7
IlNNTzIxMDEifSwNCiAJeyJTTU8yMTAyIn0sDQogCXt9DQogfTsNCiBNT0RVTEVfREVWSUNFX1RB
QkxFKGFjcGksIHN0X25jaV9pMmNfYWNwaV9tYXRjaCk7DQogDQotc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgb2Zfc3RfbmNpX2kyY19tYXRjaFtdID0gew0KK3N0YXRpYyBjb25zdCBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkIG9mX3N0X25jaV9pMmNfbWF0Y2hbXSBfX21heWJlX3VudXNlZCA9
IHsNCiAJeyAuY29tcGF0aWJsZSA9ICJzdCxzdDIxbmZjYi1pMmMiLCB9LA0KIAl7IC5jb21wYXRp
YmxlID0gInN0LHN0MjFuZmNiX2kyYyIsIH0sDQogCXsgLmNvbXBhdGlibGUgPSAic3Qsc3QyMW5m
Y2MtaTJjIiwgfSwNCmRpZmYgLS1naXQgYS9kcml2ZXJzL25mYy9zdC1uY2kvc3BpLmMgYi9kcml2
ZXJzL25mYy9zdC1uY2kvc3BpLmMNCmluZGV4IDA5ZGY2ZWE2NTg0MC4uNWYxYTIxNzNiMmU3IDEw
MDY0NA0KLS0tIGEvZHJpdmVycy9uZmMvc3QtbmNpL3NwaS5jDQorKysgYi9kcml2ZXJzL25mYy9z
dC1uY2kvc3BpLmMNCkBAIC0yODcsMTMgKzI4NywxMyBAQCBzdGF0aWMgc3RydWN0IHNwaV9kZXZp
Y2VfaWQgc3RfbmNpX3NwaV9pZF90YWJsZVtdID0gew0KIH07DQogTU9EVUxFX0RFVklDRV9UQUJM
RShzcGksIHN0X25jaV9zcGlfaWRfdGFibGUpOw0KIA0KLXN0YXRpYyBjb25zdCBzdHJ1Y3QgYWNw
aV9kZXZpY2VfaWQgc3RfbmNpX3NwaV9hY3BpX21hdGNoW10gPSB7DQorc3RhdGljIGNvbnN0IHN0
cnVjdCBhY3BpX2RldmljZV9pZCBzdF9uY2lfc3BpX2FjcGlfbWF0Y2hbXSBfX21heWJlX3VudXNl
ZCA9IHsNCiAJeyJTTU8yMTAxIiwgMH0sDQogCXt9DQogfTsNCiBNT0RVTEVfREVWSUNFX1RBQkxF
KGFjcGksIHN0X25jaV9zcGlfYWNwaV9tYXRjaCk7DQogDQotc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgb2Zfc3RfbmNpX3NwaV9tYXRjaFtdID0gew0KK3N0YXRpYyBjb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkIG9mX3N0X25jaV9zcGlfbWF0Y2hbXSBfX21heWJlX3VudXNlZCA9IHsN
CiAJeyAuY29tcGF0aWJsZSA9ICJzdCxzdDIxbmZjYi1zcGkiLCB9LA0KIAl7fQ0KIH07DQotLSAN
CjIuMjcuMA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbmZjIG1haWxpbmcgbGlzdCAtLSBsaW51eC1uZmNAbGlzdHMuMDEub3JnClRvIHVuc3Vi
c2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gbGludXgtbmZjLWxlYXZlQGxpc3RzLjAxLm9yZwolKHdl
Yl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpcw==
