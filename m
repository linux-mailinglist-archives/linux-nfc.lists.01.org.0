Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C99A83942C5
	for <lists+linux-nfc@lfdr.de>; Fri, 28 May 2021 14:42:27 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id D3F20100EBB6B;
	Fri, 28 May 2021 05:42:23 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 041F7100EBBCB
	for <linux-nfc@lists.01.org>; Fri, 28 May 2021 05:42:22 -0700 (PDT)
Received: from mail-vs1-f71.google.com ([209.85.217.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lmboi-00080a-L5
	for linux-nfc@lists.01.org; Fri, 28 May 2021 12:42:20 +0000
Received: by mail-vs1-f71.google.com with SMTP id n26-20020a67d61a0000b029023651d629a4so954250vsj.0
        for <linux-nfc@lists.01.org>; Fri, 28 May 2021 05:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iEB2h4Bn3lCrV1o5tVk2hyJU4Tj+yg0ZQdaMOEhsgd0=;
        b=kp7cxnHaeKK93l6iaQW4vILIKCkqwbJmQACfHDp4aoPxrdbQ8Wkmw/sSinmc4H2ki5
         Pikj75Ss1rn9hZSO6fxwNUqpbZaWMP2bD6sYRftY66oH2oDcpAok9DjIl96Wik8L79zC
         52/9vYwd0SyGA6J4iDrSqItG/t0mYcD5yaG1xjqz5B8nYIQw1TFqANQpuXoz8PhEGloG
         cpoce69B03PlSiWxM5fJs/v+G2yDw3IUE+K8C+wvBCQLLAEGi7sgMI44XkO/r+ziB+Hp
         NrTu44vDLkRI1HNACe+QtlW5k1bPZtmzv+Z9r3H0gKvevoZ2RtgrP7MFGRXIDBCngTFw
         feWA==
X-Gm-Message-State: AOAM531yiNs9J2ChRXp1QCF3cerjyi9/lkkbV1pxenAi9wEJrTqhdlmU
	LhXeUVzoErWTaAvhSO75nMFm84f/9S8vRoWGlywWcx+GDlgsyhqBGGlzpCTr0KNAsgvkcqZWnfF
	e8YzMSHRRjC12NmhzuGWmY2op0z8dHNxQFQ==
X-Received: by 2002:a67:10c1:: with SMTP id 184mr6783947vsq.37.1622205739808;
        Fri, 28 May 2021 05:42:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWllFrdrg6Jbn+aBJ5/GUhoFVyAz32AVwfOxffn/3s94HonEx3zuiiuqroeuZJehFCIblIDA==
X-Received: by 2002:a67:10c1:: with SMTP id 184mr6783923vsq.37.1622205739642;
        Fri, 28 May 2021 05:42:19 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id b35sm782328uae.20.2021.05.28.05.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 05:42:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 28 May 2021 08:41:56 -0400
Message-Id: <20210528124200.79655-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
References: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: DLTWIDYQFVUH4Q7QAUTHE4N2HVVV6CTW
X-Message-ID-Hash: DLTWIDYQFVUH4Q7QAUTHE4N2HVVV6CTW
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 08/12] nfc: s3fwrn5: mark OF device ID tables as maybe unused
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/DLTWIDYQFVUH4Q7QAUTHE4N2HVVV6CTW/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIGRyaXZlciBjYW4gbWF0Y2ggZWl0aGVyIHZpYSBPRiBvciBJMkMgSUQgdGFibGVzLiAgSWYg
T0YgaXMgZGlzYWJsZWQsDQp0aGUgdGFibGUgd2lsbCBiZSB1bnVzZWQ6DQoNCiAgICBkcml2ZXJz
L25mYy9zM2Z3cm41L2kyYy5jOjI2NTozNDogd2FybmluZzoNCiAgICAgICAg4oCYb2ZfczNmd3Ju
NV9pMmNfbWF0Y2jigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlh
YmxlPV0NCg0KU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtv
emxvd3NraUBjYW5vbmljYWwuY29tPg0KLS0tDQogZHJpdmVycy9uZmMvczNmd3JuNS9pMmMuYyB8
IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmZjL3MzZndybjUvaTJjLmMgYi9kcml2ZXJzL25mYy9zM2Z3
cm41L2kyYy5jDQppbmRleCAzOGI4ZDZjYWI1OTMuLjRkMWNmMWJiNTViMCAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvbmZjL3MzZndybjUvaTJjLmMNCisrKyBiL2RyaXZlcnMvbmZjL3MzZndybjUvaTJj
LmMNCkBAIC0yNjIsNyArMjYyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lk
IHMzZndybjVfaTJjX2lkX3RhYmxlW10gPSB7DQogfTsNCiBNT0RVTEVfREVWSUNFX1RBQkxFKGky
YywgczNmd3JuNV9pMmNfaWRfdGFibGUpOw0KIA0KLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2
aWNlX2lkIG9mX3MzZndybjVfaTJjX21hdGNoW10gPSB7DQorc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgb2ZfczNmd3JuNV9pMmNfbWF0Y2hbXSBfX21heWJlX3VudXNlZCA9IHsNCiAJ
eyAuY29tcGF0aWJsZSA9ICJzYW1zdW5nLHMzZndybjUtaTJjIiwgfSwNCiAJe30NCiB9Ow0KLS0g
DQoyLjI3LjANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW5mYyBtYWlsaW5nIGxpc3QgLS0gbGludXgtbmZjQGxpc3RzLjAxLm9yZwpUbyB1bnN1
YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGxpbnV4LW5mYy1sZWF2ZUBsaXN0cy4wMS5vcmcKJSh3
ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM=
