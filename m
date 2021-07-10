Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3353C325A
	for <lists+linux-nfc@lfdr.de>; Sat, 10 Jul 2021 05:39:20 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 72A51100EBB78;
	Fri,  9 Jul 2021 20:39:18 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 23100100EBB75
	for <linux-nfc@lists.01.org>; Fri,  9 Jul 2021 20:39:15 -0700 (PDT)
Received: from mail-wr1-f70.google.com ([209.85.221.70])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m23pi-0007T5-6z
	for linux-nfc@lists.01.org; Sat, 10 Jul 2021 03:39:14 +0000
Received: by mail-wr1-f70.google.com with SMTP id h11-20020adffa8b0000b029013a357d7bdcso3385615wrr.18
        for <linux-nfc@lists.01.org>; Fri, 09 Jul 2021 20:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6pVXbBKnfqPbSsfd3F4+CDZojZbr/9mE3puhwbtYSTg=;
        b=XAGtssJ1sJQcavkHsE1g3RNl/us4rtcVSnrGty5tI3f2iqtZtVOghEaoHbWsstgiTl
         JIIty4mtCouPpzh5fgl5aspkhOwmcHc1Rt8l/BXh/vEUguGuBKnhm7Ov/IOim+nWmmdx
         5uvJFZJjwZEbsRxFWVF0JeSSilCfkwfTUt3YAixYsSHzdv+JUY5INyL0NiC1HUflaDNe
         s2Mqj9YUZn0nhRr5DoEwHnP0Pmw5ewOWz6EcM0C/GuC+Rlta+IE3eziv/GwW2XPlQx2j
         VWGVpjGHiwLs89obEDDfXwrbOzdf/ibHTGLehQPccRL9UwD+mHGLA780QvYCNhfiUewt
         z9Tw==
X-Gm-Message-State: AOAM530jM61yxjiuQs7/AoKYWlfKT7sRb8s/fxTJhpVFJWqLlqQc+EhZ
	h+ZysCwNscCobDIpjT53sw5yoaX1NpmMd4Jcdu33xhsO8byl0pLIXhngZh1gytZX8k3spEjYkPA
	+8ACk6ao8gFAH/dJX0VM2aAcfiXw5U9pw+Q==
X-Received: by 2002:a1c:1f09:: with SMTP id f9mr1997966wmf.110.1625888353683;
        Fri, 09 Jul 2021 20:39:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOuC/UtAeym1IjOj6p8iUUI5aVI/7JgDUiZbT7KQWCa+xVPIyLwGdcUFKDvZXXfXIBJ6SF5g==
X-Received: by 2002:a1c:1f09:: with SMTP id f9mr1997957wmf.110.1625888353574;
        Fri, 09 Jul 2021 20:39:13 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id a12sm7444346wrh.26.2021.07.09.20.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 20:39:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sat, 10 Jul 2021 05:38:44 +0200
Message-Id: <20210710033859.3989-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
References: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 7JCEUTZBWTQCOOGK6TBJTYOPFAKQSJ67
X-Message-ID-Hash: 7JCEUTZBWTQCOOGK6TBJTYOPFAKQSJ67
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 01/16] nfctool: fix adapter_compare_idx() cast-function-type
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/7JCEUTZBWTQCOOGK6TBJTYOPFAKQSJ67/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Rml4IG9uIEdDQyB2MTA6DQoNCiAgICB0b29scy9uZmN0b29sL2FkYXB0ZXIuYzogSW4gZnVuY3Rp
b24g4oCYYWRhcHRlcl9nZXTigJk6DQogICAgdG9vbHMvbmZjdG9vbC9hZGFwdGVyLmM6MTU1Ojg6
IGVycm9yOiBjYXN0IGJldHdlZW4gaW5jb21wYXRpYmxlIGZ1bmN0aW9uIHR5cGVzIGZyb20g4oCY
Z2ludCAoKikoc3RydWN0IG5mY19hZGFwdGVyICosIGd1aW50MzIp4oCZIHtha2Eg4oCYaW50ICgq
KShzdHJ1Y3QgbmZjX2FkYXB0ZXIgKiwgdW5zaWduZWQgaW50KeKAmX0gdG8g4oCYZ2ludCAoKiko
Y29uc3Qgdm9pZCAqLCBjb25zdCB2b2lkICop4oCZIHtha2Eg4oCYaW50ICgqKShjb25zdCB2b2lk
ICosIGNvbnN0IHZvaWQgKinigJl9IFstV2Vycm9yPWNhc3QtZnVuY3Rpb24tdHlwZV0NCiAgICAg
IDE1NSB8ICAgICAgICAoR0NvbXBhcmVGdW5jKWFkYXB0ZXJfY29tcGFyZV9pZHgpOw0KICAgICAg
ICAgIHwgICAgICAgIF4NCg0KU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
eXN6dG9mLmtvemxvd3NraUBjYW5vbmljYWwuY29tPg0KLS0tDQogdG9vbHMvbmZjdG9vbC9hZGFw
dGVyLmMgfCA2ICsrKystLQ0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS90b29scy9uZmN0b29sL2FkYXB0ZXIuYyBiL3Rvb2xz
L25mY3Rvb2wvYWRhcHRlci5jDQppbmRleCA1ZTNiZjQxODg0ZDEuLjM0M2M0YWI3ZDBmZiAxMDA2
NDQNCi0tLSBhL3Rvb2xzL25mY3Rvb2wvYWRhcHRlci5jDQorKysgYi90b29scy9uZmN0b29sL2Fk
YXB0ZXIuYw0KQEAgLTEzOSw5ICsxMzksMTEgQEAgdm9pZCBhZGFwdGVyX2lkeF9wcmludF9pbmZv
KGd1aW50MzIgaWR4KQ0KIAkJZ19zbGlzdF9mb3JlYWNoKGFkYXB0ZXJzLCAoR0Z1bmMpYWRhcHRl
cl9wcmludF9pbmZvLCBOVUxMKTsNCiB9DQogDQotc3RhdGljIGdpbnQgYWRhcHRlcl9jb21wYXJl
X2lkeChzdHJ1Y3QgbmZjX2FkYXB0ZXIgKmFkYXB0ZXIsIGd1aW50MzIgaWR4KQ0KK3N0YXRpYyBn
aW50IGFkYXB0ZXJfY29tcGFyZV9pZHgoc3RydWN0IG5mY19hZGFwdGVyICphZGFwdGVyLCBncG9p
bnRlciBpZHhfcHRyKQ0KIHsNCi0JcmV0dXJuIChnaW50KWFkYXB0ZXItPmlkeCAtIChnaW50KWlk
eDsNCisJZ2ludCBpZHggPSBHUE9JTlRFUl9UT19JTlQoaWR4X3B0cik7DQorDQorCXJldHVybiAo
Z2ludClhZGFwdGVyLT5pZHggLSBpZHg7DQogfQ0KIA0KIHN0cnVjdCBuZmNfYWRhcHRlciAqYWRh
cHRlcl9nZXQoZ3VpbnQzMiBpZHgpDQotLSANCjIuMjcuMA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbmZjIG1haWxpbmcgbGlzdCAtLSBsaW51
eC1uZmNAbGlzdHMuMDEub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gbGludXgt
bmZjLWxlYXZlQGxpc3RzLjAxLm9yZwolKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClz
LyUoX2ludGVybmFsX25hbWUpcw==
