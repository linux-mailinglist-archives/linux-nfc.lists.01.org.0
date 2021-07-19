Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A82E83CD307
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:08:52 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 99967100EB84F;
	Mon, 19 Jul 2021 04:08:49 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 20DA6100EB847
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:47 -0700 (PDT)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 31E17418CF
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692926;
	bh=0UMR+iF4BLe97HUXV0FPLBJGwqpRNf95v0+jF6rQwdg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ANrNntplzQm4VlHRgR4BMh6KIb66IMwGPoP2a5OtL+a7hXb3RTsyR80eYNE+SB8u8
	 yu0+hPlyXiUvJlv5+WDo1E23vWqBRZzpQi2eFk3FeSTp8aKBF6Cjkom2ADtxqVycgh
	 CuxcVfQdGkS8CzbOcScUAeo25/Eh1EC43Rp4Q7FDJc+ZoWAIcSoOATbBGYW/ReM25w
	 9UVJW/w6OOeOVTrrHcrUlLXxRVLdYYEfmCEQFFiRa9fn05j+Fv4nWFwCTo9+wLfQwA
	 DhSXabYTthX0XndflqnmvA9iuD1X/UF7E6TZnXEWys2lIVdjbOEPws5XKhsB+7090o
	 CDKC5kUVXcgCw==
Received: by mail-lj1-f198.google.com with SMTP id e9-20020a2e98490000b029018c799ba37bso9287016ljj.6
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0UMR+iF4BLe97HUXV0FPLBJGwqpRNf95v0+jF6rQwdg=;
        b=DI83igFRpQvswQwjt5BaHNb9NRkD4r93j51w+digx4Vimwj91r7kVaDJti+jzONaQr
         66oE9MIGBroQbB+m2ymOMbZRtMYwfQt+sK+h0AH2yhEX4J01N1uIGHCfzXAnKHQYhXfG
         spBKqu6eSNqVYUAhIbA1z4CP7MDtV/KQ1TPWK3LwGLb5NmEmuzgMRp0lkWDJCBH+7rpg
         xTTTqd7hDiT3ioZQDJPWHJOYYXEJEmqqYKj0ZpCOKSmbvUlDmZWV+Dy83CaE9yQHJNiZ
         6j7Q231QS9og+9WJKUlO6m/IYLVkg3cjGQKU5lHXlIfyv0q4GBHQWUG9c2kN40IAv7LY
         TZEA==
X-Gm-Message-State: AOAM533Pa38SM2tGxAO0F9eD3s/JKvd4JJwCQOUyYbpYJwdPMtCIiUPA
	4+W1hyvQPfkTaBfK4wJMaUniAtPs5ROGHat4w8CW93AVcYrLsV3KVYfET2Y9f5pecHJ1cIk/w1F
	F05BJ0M2F9jUGsfY+BVFSYMe8mgqu3TJwkg==
X-Received: by 2002:a05:651c:2051:: with SMTP id t17mr9143409ljo.118.1626692925464;
        Mon, 19 Jul 2021 04:08:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhybsvDvUSd3TUYcEOIHo6ujFMvnV6OM4b/9YGQq7szPWWYUlNhv32K/owD/p/SvP52/EDog==
X-Received: by 2002:a05:651c:2051:: with SMTP id t17mr9143403ljo.118.1626692925333;
        Mon, 19 Jul 2021 04:08:45 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:08:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:16 +0200
Message-Id: <20210719110819.27340-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 5IAOHZU4KVCGKFGCWTTVMYARGEG4J7OO
X-Message-ID-Hash: 5IAOHZU4KVCGKFGCWTTVMYARGEG4J7OO
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 10/73] dbus: fix -Wformat in near_dbus_encode_string()
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/5IAOHZU4KVCGKFGCWTTVMYARGEG4J7OO/>
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
