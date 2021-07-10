Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 962B63C325D
	for <lists+linux-nfc@lfdr.de>; Sat, 10 Jul 2021 05:39:23 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id AE3C6100EB834;
	Fri,  9 Jul 2021 20:39:19 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 70124100EBB75
	for <linux-nfc@lists.01.org>; Fri,  9 Jul 2021 20:39:17 -0700 (PDT)
Received: from mail-wm1-f72.google.com ([209.85.128.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m23pk-0007TV-4w
	for linux-nfc@lists.01.org; Sat, 10 Jul 2021 03:39:16 +0000
Received: by mail-wm1-f72.google.com with SMTP id k1-20020a05600c1c81b029021649539a4aso1626808wms.0
        for <linux-nfc@lists.01.org>; Fri, 09 Jul 2021 20:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B9GvEaDiTlLvILOzMPmki87NIJrewhb1QYBR+1FcFIk=;
        b=Nm3ZE/H20Atp7/qNTKdyUtn4NCx/Z2Fb0uBziyLrkbvsHeeGHQbndRuwJMwUlpa27f
         OtxnT3uJgKzfNz+D8VOoOETT/aWvZ4+cjNrYvccsBk9eJJgSpg0FibEeEodZQJ+qqF3+
         h9pH3Smcn8sx+phE/kQPqBl47m3NBcnQwGBtgSbUnW7h+kgq3RqgFR6xTvO4+u/IL4/h
         ImuJNpEyA2QVMKds7/M1qChtIvJkFCODIdzK+cttb08Owq7MB7takexf2VUtJSijJ/fh
         yGacS2HCxxUuw9tJCf5BpF8/Zwhaf4jtJNBVtWK48kntX1tXthZGLhyTxVgmfnwoRz01
         IWhw==
X-Gm-Message-State: AOAM532V8ajknR6F9wLAtvpyj8/ueGAR5oCtDZ+Yhw9kGB4Y8hmOkKKs
	le3/JOYPKVmaDp4hRPdecQWSw3Q0EZoHI2Od/dZrtqiFn+BWbdLXOv6uViAGbCqS1Sq8hpJI7Hm
	5DW8unnUTG+kXscbnBY5JayHlg5chaYjtGw==
X-Received: by 2002:a05:600c:19d1:: with SMTP id u17mr2026753wmq.40.1625888355686;
        Fri, 09 Jul 2021 20:39:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRRx4C67ez28VrDGVyVjtPDzcbY30MMwzVHONYMcyBzNqqdpZWJkqvEx8UjsaBjSPTV8d4Sg==
X-Received: by 2002:a05:600c:19d1:: with SMTP id u17mr2026747wmq.40.1625888355559;
        Fri, 09 Jul 2021 20:39:15 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id a12sm7444346wrh.26.2021.07.09.20.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 20:39:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sat, 10 Jul 2021 05:38:46 +0200
Message-Id: <20210710033859.3989-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
References: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: GOTOWENS7XJYKPXSJEBTKN7PZNHHUWNR
X-Message-ID-Hash: GOTOWENS7XJYKPXSJEBTKN7PZNHHUWNR
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 03/16] nfctool: fix nfctool_print_and_remove_snl() cast-function-type
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/GOTOWENS7XJYKPXSJEBTKN7PZNHHUWNR/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Rml4IG9uIEdDQyB2MTA6DQoNCiAgICB0b29scy9uZmN0b29sL21haW4uYzogSW4gZnVuY3Rpb24g
4oCYbmZjdG9vbF9zbmxfY2LigJk6DQogICAgdG9vbHMvbmZjdG9vbC9tYWluLmM6MzUyOjMwOiBl
cnJvcjogY2FzdCBiZXR3ZWVuIGluY29tcGF0aWJsZSBmdW5jdGlvbiB0eXBlcyBmcm9tIOKAmHZv
aWQgKCopKHN0cnVjdCBuZmNfc25sICosIGd1aW50MzIp4oCZIHtha2Eg4oCYdm9pZCAoKikoc3Ry
dWN0IG5mY19zbmwgKiwgdW5zaWduZWQgaW50KeKAmX0gdG8g4oCYdm9pZCAoKikodm9pZCAqLCB2
b2lkICop4oCZIFstV2Vycm9yPWNhc3QtZnVuY3Rpb24tdHlwZV0NCiAgICAgIDM1MiB8ICBnX3Ns
aXN0X2ZvcmVhY2goc2RyZXNfbGlzdCwgKEdGdW5jKW5mY3Rvb2xfcHJpbnRfYW5kX3JlbW92ZV9z
bmwsDQogICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4NCg0KU2lnbmVk
LW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBjYW5vbmlj
YWwuY29tPg0KLS0tDQogdG9vbHMvbmZjdG9vbC9tYWluLmMgfCA0ICsrLS0NCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvdG9v
bHMvbmZjdG9vbC9tYWluLmMgYi90b29scy9uZmN0b29sL21haW4uYw0KaW5kZXggMjgyZGY1MTlm
Y2M4Li43MmEzOWRlM2NjYmYgMTAwNjQ0DQotLS0gYS90b29scy9uZmN0b29sL21haW4uYw0KKysr
IGIvdG9vbHMvbmZjdG9vbC9tYWluLmMNCkBAIC0zMjUsMTMgKzMyNSwxMyBAQCBzdGF0aWMgaW50
IG5mY3Rvb2xfcG9sbF9jYihndWludDggY21kLCBndWludDMyIGlkeCwgZ3BvaW50ZXIgZGF0YSkN
CiB9DQogDQogc3RhdGljIHZvaWQgbmZjdG9vbF9wcmludF9hbmRfcmVtb3ZlX3NubChzdHJ1Y3Qg
bmZjX3NubCAqc2RyZXMsDQotCQkJCQkgZ3VpbnQzMiBhZGFwdGVyX2lkeCkNCisJCQkJCSBncG9p
bnRlciBhZGFwdGVyX2lkeCkNCiB7DQogCUdTTGlzdCAqZWxlbTsNCiANCiAJcHJpbnRmKCIgdXJp
OiAlcyAtIHNhcDogJWRcbiIsIHNkcmVzLT51cmksIHNkcmVzLT5zYXApOw0KIA0KLQlpZiAoYWRh
cHRlcl9pZHggPT0gb3B0cy5hZGFwdGVyX2lkeCkgew0KKwlpZiAoR1BPSU5URVJfVE9fVUlOVChh
ZGFwdGVyX2lkeCkgPT0gb3B0cy5hZGFwdGVyX2lkeCkgew0KIAkJZWxlbSA9IGdfc2xpc3RfZmlu
ZF9jdXN0b20ob3B0cy5zbmxfbGlzdCwgc2RyZXMtPnVyaSwNCiAJCQkJCSAgIChHQ29tcGFyZUZ1
bmMpZ19zdHJjbXAwKTsNCiANCi0tIA0KMi4yNy4wDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1uZmMgbWFpbGluZyBsaXN0IC0tIGxpbnV4LW5m
Y0BsaXN0cy4wMS5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBsaW51eC1uZmMt
bGVhdmVAbGlzdHMuMDEub3JnCiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShf
aW50ZXJuYWxfbmFtZSlz
