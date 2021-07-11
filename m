Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0669C3C3F05
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:21:43 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 98179100EB332;
	Sun, 11 Jul 2021 13:21:39 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 3E21B100EB32F
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:21:37 -0700 (PDT)
Received: from mail-wr1-f70.google.com ([209.85.221.70])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2fxH-0001c0-Vh
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:21:36 +0000
Received: by mail-wr1-f70.google.com with SMTP id r18-20020adfce920000b029013bbfb19640so4598539wrn.17
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K+zcq7Invn/MFYK1xbcEs3U/YujdW+1HgjWFSYUL3dI=;
        b=fIjOu4YBWVgf0JIlZPJNGMSZglUC4zzbbqRL5xN61PiVzb0r7quKvcLST7ZmIbxFwo
         T6B5LE2DIj1Vn0ZTK8hsPxYIfgBluD4u7fbnVlHoWqXRZ2sVJrSChrGRVTtcwIEBhV5v
         ggl4eLe4VqoVu1y9ZVCga+Tge92hzs6SA195QW/yy5aDAbahpQGnKpCj+aykXDZwrHQi
         VD9ZAKMfv0DL+fSfD3ij8cjD/HNhpq0F2jQUnjR2NdLy4Dxn9DOTS7CXZ3/4m8M0DJYM
         TgVS45GL4z456n1tJaSurD7K9uXqZ78Ll3YWZ66TJ2K9zwQSaRJvRbxKsaoCrQ0iuIGr
         uAbA==
X-Gm-Message-State: AOAM531IZPUCWqlqOcMMR+2jpf3cShnSE/dET4JSIcEf7qBJuzBzaPlz
	xaqySfkCIAiMtxBD03lXzwQEtqDfIoZQBHpQe+3FhCWxZv6eoIUHmB0WJ4NTjffyr89Thzzp+Zr
	nioslR/SuP2uXv+6s6giNhtWMnC77mT20QQ==
X-Received: by 2002:a5d:5692:: with SMTP id f18mr32858354wrv.135.1626034895399;
        Sun, 11 Jul 2021 13:21:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIHgNR68+AtxbY0I2pIOWGHhUBP3JRFTTOpat+ioXKxUFzNI5a4YUMZ61XPy24xk4rQQ32lw==
X-Received: by 2002:a5d:5692:: with SMTP id f18mr32858347wrv.135.1626034895291;
        Sun, 11 Jul 2021 13:21:35 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id d14sm1503256wrs.49.2021.07.11.13.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:21:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:20:38 +0200
Message-Id: <20210711202102.18094-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 3CGNSA2X3POXJGP6Z3OHJK34QT4U7DEO
X-Message-ID-Hash: 3CGNSA2X3POXJGP6Z3OHJK34QT4U7DEO
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 10/34] unit: use proper pointer to uint8_t in test_snep_read_recv_fragments()
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/3CGNSA2X3POXJGP6Z3OHJK34QT4U7DEO/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UmF3IGRhdGEgYnl0ZXMgc2hvdWxkIGJlIHBhc3NlZCBhcyBwb2ludGVyIHRvIHVpbnQ4X3QgYW5k
IHRoZSBjYWxsaW5nDQpmdW5jdGlvbiBhbHJlYWR5IHVzZXMgdGhhdCB0eXBlLiAgVGhpcyBmaXhl
cyB3YXJuaW5nOg0KDQogICAgdW5pdC90ZXN0LXNuZXAtcmVhZC5jOiBJbiBmdW5jdGlvbiDigJh0
ZXN0X3NuZXBfcmVhZF9yZWN2X2ZyYWdtZW50c+KAmToNCiAgICB1bml0L3Rlc3Qtc25lcC1yZWFk
LmM6NDA4OjIxOiBlcnJvcjogcG9pbnRlciBvZiB0eXBlIOKAmHZvaWQgKuKAmSB1c2VkIGluIGFy
aXRobWV0aWMgWy1XZXJyb3I9cG9pbnRlci1hcml0aF0NCiAgICAgIDQwOCB8ICAgbWVtY3B5KGRh
dGFfcmVjdmQgKyBvZmZzZXQsIHJlc3AsIG5ieXRlcyk7DQogICAgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgIF4NCg0KU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6
dG9mLmtvemxvd3NraUBjYW5vbmljYWwuY29tPg0KLS0tDQogdW5pdC90ZXN0LXNuZXAtcmVhZC5j
IHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0K
DQpkaWZmIC0tZ2l0IGEvdW5pdC90ZXN0LXNuZXAtcmVhZC5jIGIvdW5pdC90ZXN0LXNuZXAtcmVh
ZC5jDQppbmRleCA1NTExZmVjZjVjMTcuLjc4ZGI1OGJhODU5ZiAxMDA2NDQNCi0tLSBhL3VuaXQv
dGVzdC1zbmVwLXJlYWQuYw0KKysrIGIvdW5pdC90ZXN0LXNuZXAtcmVhZC5jDQpAQCAtMzg2LDcg
KzM4Niw3IEBAIHN0YXRpYyBib29sIHRlc3Rfc25lcF9yZWFkX3NlbmRfZnJhZ21lbnQoc2l6ZV90
IGZyYWdfbGVuLA0KICAqIEBwYXJhbVtvdXRdIGRhdGEgICAgICAgICAgICAgTXVzdCBiZSBwcmVh
bGxvY2F0ZWQNCiAgKi8NCiBzdGF0aWMgdm9pZCB0ZXN0X3NuZXBfcmVhZF9yZWN2X2ZyYWdtZW50
cyh1aW50MzJfdCBmcmFnX2xlbiwNCi0JCQkJdWludDMyX3QgcmVtYWluaW5nX2J5dGVzLCB2b2lk
ICpkYXRhX3JlY3ZkKQ0KKwkJCQl1aW50MzJfdCByZW1haW5pbmdfYnl0ZXMsIHVpbnQ4X3QgKmRh
dGFfcmVjdmQpDQogew0KIAlzdHJ1Y3QgcDJwX3NuZXBfcmVzcF9mcmFtZSAqcmVzcDsNCiAJdWlu
dDMyX3Qgb2Zmc2V0ID0gMDsNCi0tIA0KMi4yNy4wDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1uZmMgbWFpbGluZyBsaXN0IC0tIGxpbnV4LW5m
Y0BsaXN0cy4wMS5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBsaW51eC1uZmMt
bGVhdmVAbGlzdHMuMDEub3JnCiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShf
aW50ZXJuYWxfbmFtZSlz
