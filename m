Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 835C03C325F
	for <lists+linux-nfc@lfdr.de>; Sat, 10 Jul 2021 05:39:26 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id D5A67100EB83E;
	Fri,  9 Jul 2021 20:39:20 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 1689A100EB829
	for <linux-nfc@lists.01.org>; Fri,  9 Jul 2021 20:39:19 -0700 (PDT)
Received: from mail-wm1-f72.google.com ([209.85.128.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m23pl-0007Tn-Sn
	for linux-nfc@lists.01.org; Sat, 10 Jul 2021 03:39:17 +0000
Received: by mail-wm1-f72.google.com with SMTP id v25-20020a1cf7190000b0290197a4be97b7so4669003wmh.9
        for <linux-nfc@lists.01.org>; Fri, 09 Jul 2021 20:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0UMR+iF4BLe97HUXV0FPLBJGwqpRNf95v0+jF6rQwdg=;
        b=kWaS79flhsiAKUNVdUmYRPA4xVdMfkvj9nduVrXUox7Nl2MOwpLoRvz+FCmS0XpiKY
         TT7BgS05pI5dKUMnJ4kSH+94+1k3dVglXweFDSIdF5wfacbkbXUUR6Lo/TOUTL4BiZLi
         qbFDs1AwqAnCxFTaa3dGg3b37qRXwQRJAAHWkqBcBX9mEfosvGvtSlOyrgD8WERNcXZZ
         BmMgPTJKa5MgCC5dlXV4Vqm7GjDyEKSmGKPuSxqUjy1hVaBU6KqEXiNNRm8J1AAaF94I
         50A7JaDBNoFjAZmvTFBcOWCTY49HqVu/IC0M3sz35dgK3J6dBt1ZRI34slNywibMjl29
         lsWg==
X-Gm-Message-State: AOAM533aKdhp6SL4gS0qYU/wQeiX0H6HmZ3smplOY3xncrj0xerxavJv
	cGKdz04642sTf4wEsqCKrlxg72UvSXh1aV5r1c+R/XjGZBfC6go6t0VPGRau5uxkdutbmO1p5sZ
	dFscjaQAt+kOeM34bqjVS8bJUJjxwhuWN7w==
X-Received: by 2002:a7b:c4d3:: with SMTP id g19mr891522wmk.78.1625888357487;
        Fri, 09 Jul 2021 20:39:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6R3f6JHQ/hKPkOn7fkMBZbaqrx7JMe0JhIgURhAqucutoRaE1cqb9CAxvcDs1dNU0rlWWVg==
X-Received: by 2002:a7b:c4d3:: with SMTP id g19mr891518wmk.78.1625888357376;
        Fri, 09 Jul 2021 20:39:17 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id a12sm7444346wrh.26.2021.07.09.20.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 20:39:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sat, 10 Jul 2021 05:38:48 +0200
Message-Id: <20210710033859.3989-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
References: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: D3LNWWLTHCUN74EHQRUNDY4SOY6MP5OY
X-Message-ID-Hash: D3LNWWLTHCUN74EHQRUNDY4SOY6MP5OY
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 05/16] dbus: fix -Wformat in near_dbus_encode_string()
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/D3LNWWLTHCUN74EHQRUNDY4SOY6MP5OY/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Rml4IEdDQyB3YXJuaW5nOg0KDQogICAgc3JjL2RidXMuYzogSW4gZnVuY3Rpb24g4oCYbmVhcl9k
YnVzX2VuY29kZV9zdHJpbmfigJk6DQogICAgc3JjL2RidXMuYzo3MTozNzogZXJyb3I6IGZvcm1h
dCDigJgleOKAmSBleHBlY3RzIGFyZ3VtZW50IG9mIHR5cGUg4oCYdW5zaWduZWQgaW504oCZLCBi
dXQgYXJndW1lbnQgMyBoYXMgdHlwZSDigJhpbnTigJkgWy1XZXJyb3I9Zm9ybWF0PV0NCiAgICAg
ICA3MSB8ICAgIGdfc3RyaW5nX2FwcGVuZF9wcmludGYoc3RyLCAiXyUwMngiLCB0bXApOw0KICAg
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfn5+XiAgIH5+fg0KICAg
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIHwNCiAgICAg
ICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICBpbnQNCiAgICAg
ICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludA0K
ICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJTAyeA0KDQpTaWdu
ZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGNhbm9u
aWNhbC5jb20+DQotLS0NCiBzcmMvZGJ1cy5jIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvc3JjL2RidXMuYyBiL3Ny
Yy9kYnVzLmMNCmluZGV4IDljNjdhOWVlYzg5YS4uZWQ0NTcwZDk1MWVkIDEwMDY0NA0KLS0tIGEv
c3JjL2RidXMuYw0KKysrIGIvc3JjL2RidXMuYw0KQEAgLTY4LDcgKzY4LDcgQEAgY2hhciAqbmVh
cl9kYnVzX2VuY29kZV9zdHJpbmcoY29uc3QgY2hhciAqdmFsdWUpDQogCQljb25zdCBjaGFyIHRt
cCA9IHZhbHVlW2ldOw0KIAkJaWYgKCh0bXAgPCAnMCcgfHwgdG1wID4gJzknKSAmJiAodG1wIDwg
J0EnIHx8IHRtcCA+ICdaJykgJiYNCiAJCQkJCQkodG1wIDwgJ2EnIHx8IHRtcCA+ICd6JykpDQot
CQkJZ19zdHJpbmdfYXBwZW5kX3ByaW50ZihzdHIsICJfJTAyeCIsIHRtcCk7DQorCQkJZ19zdHJp
bmdfYXBwZW5kX3ByaW50ZihzdHIsICJfJTAyeCIsICh1bnNpZ25lZCBpbnQpdG1wKTsNCiAJCWVs
c2UNCiAJCQlzdHIgPSBnX3N0cmluZ19hcHBlbmRfYyhzdHIsIHRtcCk7DQogCX0NCi0tIA0KMi4y
Ny4wDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1uZmMgbWFpbGluZyBsaXN0IC0tIGxpbnV4LW5mY0BsaXN0cy4wMS5vcmcKVG8gdW5zdWJzY3Jp
YmUgc2VuZCBhbiBlbWFpbCB0byBsaW51eC1uZmMtbGVhdmVAbGlzdHMuMDEub3JnCiUod2ViX3Bh
Z2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlz
