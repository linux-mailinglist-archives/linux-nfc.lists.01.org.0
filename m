Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D120B3942C2
	for <lists+linux-nfc@lfdr.de>; Fri, 28 May 2021 14:42:23 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 9EF79100EC1EB;
	Fri, 28 May 2021 05:42:21 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id D4A71100EC1DA
	for <linux-nfc@lists.01.org>; Fri, 28 May 2021 05:42:16 -0700 (PDT)
Received: from mail-ua1-f69.google.com ([209.85.222.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lmbod-0007yM-IR
	for linux-nfc@lists.01.org; Fri, 28 May 2021 12:42:15 +0000
Received: by mail-ua1-f69.google.com with SMTP id i33-20020ab042240000b029020adb6e9ffcso1813062uai.23
        for <linux-nfc@lists.01.org>; Fri, 28 May 2021 05:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jAqSfj4V8Ljuoku0z/gnZf+7DpK+uMQ7YFx87xd1taE=;
        b=Pl2OMuFt3QI0kkEKVkQy+9tmyaA4l7fsz9IoZqvOcFhU/LJmnklYagjvXRI8dfyC0e
         2Bw/lEZfuS+iLdGEoeDCc5RzHKC0djctMZO86OjP3oxuqU8dQynn+Bpzys41A9LUY3rg
         A1AqB+ttFXD2JESNLff4qmegP+ldtqCzYDMKqthtYdEkTpmfM9EPhW04S+0zI9zz8403
         oBkaneQ8QXOrisvqJDs+YXOpL3d/ZGMw92hW5zR2yXPzSsodVz3yS0/a4ffIM59OApYM
         AgCvtJJZ664xvl7FMjEcclyBL/+UG1x/tK+FERWp2wL/P1GbvSp0tGtA4/0EG/0t8wZg
         CNqA==
X-Gm-Message-State: AOAM53353zlMwNM3R6bFb80UCvNN/5p2jlzTl4uvZhxOrlg/PjjO8/oa
	9j1I8VRPFQLJhVbe5hgaOP5BHWQflrQ1dA/cu0s/nxWTGdoAUFK+jHTmOi6/LkQZ5QAHGHbD5+q
	C4JBxNSjRd6OzbuW7yU9urbhLiDlmTO0cVA==
X-Received: by 2002:a1f:2850:: with SMTP id o77mr5533756vko.23.1622205734690;
        Fri, 28 May 2021 05:42:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwP8YHtx6Nm7Vih9OSRSik8WCc8W76wXEqvpaj46Qq9kY3UA3420v5Vf1Pwn5+9Osz0Gz33sA==
X-Received: by 2002:a1f:2850:: with SMTP id o77mr5533616vko.23.1622205733050;
        Fri, 28 May 2021 05:42:13 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id b35sm782328uae.20.2021.05.28.05.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 05:42:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 28 May 2021 08:41:52 -0400
Message-Id: <20210528124200.79655-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
References: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 2V5KVXRTYB4EMJAE44OUKSLKSZSBJPJD
X-Message-ID-Hash: 2V5KVXRTYB4EMJAE44OUKSLKSZSBJPJD
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 04/12] nfc: pn533: drop of_match_ptr from device ID table
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/2V5KVXRTYB4EMJAE44OUKSLKSZSBJPJD/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIGRyaXZlciBjYW4gbWF0Y2ggb25seSB2aWEgdGhlIERUIHRhYmxlIHNvIHRoZSB0YWJsZSBz
aG91bGQgYmUgYWx3YXlzDQp1c2VkIGFuZCB0aGUgb2ZfbWF0Y2hfcHRyIGRvZXMgbm90IGhhdmUg
YW55IHNlbnNlICh0aGlzIGFsc28gYWxsb3dzIEFDUEkNCm1hdGNoaW5nIHZpYSBQUlAwMDAxLCBl
dmVuIHRob3VnaCBpdCBtaWdodCBiZSBub3QgcmVsZXZhbnQgaGVyZSkuICBUaGlzDQpmaXhlcyBj
b21waWxlIHdhcm5pbmcgKCFDT05GSUdfT0YpOg0KDQogICAgZHJpdmVycy9uZmMvcG41MzMvaTJj
LmM6MjUyOjM0OiB3YXJuaW5nOg0KICAgICAg4oCYb2ZfcG41MzNfaTJjX21hdGNo4oCZIGRlZmlu
ZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dDQoNClNpZ25lZC1vZmYt
Ynk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNv
bT4NCi0tLQ0KIGRyaXZlcnMvbmZjL3BuNTMzL3VhcnQuYyB8IDIgKy0NCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bmZjL3BuNTMzL3VhcnQuYyBiL2RyaXZlcnMvbmZjL3BuNTMzL3VhcnQuYw0KaW5kZXggYTA2NjVk
OGVhODViLi43YmRhZjgyNjMwNzAgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL25mYy9wbjUzMy91YXJ0
LmMNCisrKyBiL2RyaXZlcnMvbmZjL3BuNTMzL3VhcnQuYw0KQEAgLTMxOSw3ICszMTksNyBAQCBz
dGF0aWMgc3RydWN0IHNlcmRldl9kZXZpY2VfZHJpdmVyIHBuNTMyX3VhcnRfZHJpdmVyID0gew0K
IAkucmVtb3ZlID0gcG41MzJfdWFydF9yZW1vdmUsDQogCS5kcml2ZXIgPSB7DQogCQkubmFtZSA9
ICJwbjUzMl91YXJ0IiwNCi0JCS5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX3B0cihwbjUzMl91
YXJ0X29mX21hdGNoKSwNCisJCS5vZl9tYXRjaF90YWJsZSA9IHBuNTMyX3VhcnRfb2ZfbWF0Y2gs
DQogCX0sDQogfTsNCiANCi0tIA0KMi4yNy4wDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1uZmMgbWFpbGluZyBsaXN0IC0tIGxpbnV4LW5mY0Bs
aXN0cy4wMS5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBsaW51eC1uZmMtbGVh
dmVAbGlzdHMuMDEub3JnCiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50
ZXJuYWxfbmFtZSlz
