Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C58237C292
	for <lists+linux-nfc@lfdr.de>; Wed, 12 May 2021 17:11:16 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E7230100EBB6B;
	Wed, 12 May 2021 08:11:14 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=daniel.lezcano@linaro.org; receiver=<UNKNOWN> 
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 32E93100EBB6A
	for <linux-nfc@lists.01.org>; Wed, 12 May 2021 08:11:12 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id s8so24000120wrw.10
        for <linux-nfc@lists.01.org>; Wed, 12 May 2021 08:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W4XgYJ8+mVcGs+SfB2znlX/BtQuwWvv6RmitvV0I9Us=;
        b=ill6EvDGlsrM18q3cJsbpVTXryJwQRW6hgBDs2vy9rngryYawBom2xFCOKD3fOamO2
         AyxmpxqNCBLPiEZWmtd+bZKDW2qr2z9FVA7peUW4SrLuvRM4xga0GXaTp9hAIzbSzOnX
         spX6mEbGactsUGVCCX35iL08puJpeHAW3cVGBAhz/qQ3YWk7mDIMKM6tqgF04i5mXEeR
         lS4Nca9zlQ05j+jQ39eokkiGUxIni4r8DdgvzgICUGC1dZJSlDV1xQiYMeN0aRFKJ+dy
         8Bs6rQJJhpSaCb+qvToXn9NG6g/icdLH5zqFFIO1YHYHQlD1CDVELW1hAQDAMS386Lag
         Wlcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W4XgYJ8+mVcGs+SfB2znlX/BtQuwWvv6RmitvV0I9Us=;
        b=iad4r8PLJrT2lnuz94OoLW651MlCflS0DbrtWJkvqnIbqzDzbbkxZPNfxX7LUGPe7k
         tXGuVIDrIa6SheF4FLP73jJefXZMzdthc8Esj7yugURFXD2+kzSDRSx8G95DMuBr/wzO
         GgbDTc6unpgLi5087djWEjfWxd4MhoD7unVzrcsP5SSXt6N+6B3Gt2rXlpZk+2GSiLpo
         g33Y0zCCWDVJeFdknJPSSJYEEjW7+dJsehFHL/A8MEVim4C7hlQ8cnMlCIiz5pbHUoGU
         eARAy3F6kHMR0ebjcoi+rMMFG/abcspN+Z4qfIf/Zu9QFIwTE9NOkhTRy5D8HKvPlFNm
         s1Dg==
X-Gm-Message-State: AOAM53109KwWqZcI4ZX2GFqA4IAHtIfrQlNF0nGR4Iar1PQBXVD1Atuc
	mbcNCx2y7s6BbSrbNnBqZXZt5rEP48W5lA==
X-Google-Smtp-Source: ABdhPJwohaeGeQcb6BDOkXEhXQQTdwLBIcHRW6ytEUym4yqXARME4CLJyos9DGAAn7I3yqDtZnlyXw==
X-Received: by 2002:adf:9c8e:: with SMTP id d14mr46741550wre.140.1620832269287;
        Wed, 12 May 2021 08:11:09 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:1412:ffb:31a1:6c9d? ([2a01:e34:ed2f:f020:1412:ffb:31a1:6c9d])
        by smtp.googlemail.com with ESMTPSA id q12sm31540104wrx.17.2021.05.12.08.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 08:11:08 -0700 (PDT)
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210512144319.30852-1-krzysztof.kozlowski@canonical.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <961dc9c5-0eb0-586c-5e70-b21ca2f8e6f3@linaro.org>
Date: Wed, 12 May 2021 17:11:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512144319.30852-1-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
Message-ID-Hash: JSNMQZEMBSKS4YRAUTA4FUUAB2QOR7CP
X-Message-ID-Hash: JSNMQZEMBSKS4YRAUTA4FUUAB2QOR7CP
X-MailFrom: daniel.lezcano@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 1/2] MAINTAINERS: nfc: add Krzysztof Kozlowski as maintainer
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/JSNMQZEMBSKS4YRAUTA4FUUAB2QOR7CP/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMTIvMDUvMjAyMSAxNjo0MywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gVGhlIE5G
QyBzdWJzeXN0ZW0gaXMgb3JwaGFuZWQuICBJIGFtIGhhcHB5IHRvIHNwZW5kIHNvbWUgY3ljbGVz
IHRvDQo+IHJldmlldyB0aGUgcGF0Y2hlcywgc2VuZCBwdWxsIHJlcXVlc3RzIGFuZCBpbiBnZW5l
cmFsIGtlZXAgdGhlIE5GQw0KPiBzdWJzeXN0ZW0gcnVubmluZy4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNv
bT4NCj4gDQo+IC0tLQ0KPiANCj4gSSBhZG1pdCBJIGRvbid0IGhhdmUgYmlnIGV4cGVyaWVuY2Ug
aW4gTkZDIHBhcnQgYnV0IHRoaXMgd2lsbCBiZSBuaWNlDQo+IG9wcG9ydHVuaXR5IHRvIGxlYXJu
IHNvbWV0aGluZyBuZXcuIA0KDQpORkMgaGFzIGJlZW4gbG9zdCBpbiB0aGUgbGltYm9zIHNpbmNl
IGEgd2hpbGUuIEdvb2QgdG8gc2VlIHNvbWVvbmUNCnZvbHVudGVlcmluZyB0byB0YWtlIGNhcmUg
b2YgaXQuDQoNCk1heSBJIHN1Z2dlc3QgdG8gY3JlYXRlIGEgc2ltcGxlIG5mYyByZWFkaW5nIHBy
b2dyYW0gaW4gdGhlICd0b29scycNCmRpcmVjdG9yeSAoY291bGQgYmUgYSB0cmFpbmluZyBleGVy
Y2lzZSA7KQ0KDQoNCj4gSSBhbSBhbHJlYWR5IG1haW50YWluZXIgb2YgZmV3DQo+IG90aGVyIHBh
cnRzOiBtZW1vcnkgY29udHJvbGxlciBkcml2ZXJzLCBTYW1zdW5nIEFSTS9BUk02NCBTb0MgYW5k
IHNvbWUNCj4gZHJ2aWVycy4gIEkgaGF2ZSBhIGtlcm5lbC5vcmcgYWNjb3VudCBhbmQgbXkgR1BH
IGtleSBpczoNCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2RvY3Mva2VybmVsL3Bn
cGtleXMuZ2l0L3RyZWUva2V5cy8xQjkzNDM3RDNCNDE2MjlCLmFzYw0KPiANCj4gQmVzdCByZWdh
cmRzLA0KPiBLcnp5c3p0b2YNCj4gLS0tDQo+ICBNQUlOVEFJTkVSUyB8IDMgKystDQo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0KPiBpbmRleCBjYzgxNjY3ZThiYWIuLmFk
YzZjYmUyOWY3OCAxMDA2NDQNCj4gLS0tIGEvTUFJTlRBSU5FUlMNCj4gKysrIGIvTUFJTlRBSU5F
UlMNCj4gQEAgLTEyODk5LDggKzEyODk5LDkgQEAgRjoJaW5jbHVkZS91YXBpL2xpbnV4L25leHRo
b3AuaA0KPiAgRjoJbmV0L2lwdjQvbmV4dGhvcC5jDQo+ICANCj4gIE5GQyBTVUJTWVNURU0NCj4g
K006CUtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNv
bT4NCj4gIEw6CW5ldGRldkB2Z2VyLmtlcm5lbC5vcmcNCj4gLVM6CU9ycGhhbg0KPiArUzoJTWFp
bnRhaW5lZA0KPiAgRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9uZmMv
DQo+ICBGOglkcml2ZXJzL25mYy8NCj4gIEY6CWluY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9u
ZmNtcnZsLmgNCg0KDQoNCg0KLS0gDQo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9y
ZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzDQoNCkZvbGxvdyBMaW5hcm86
ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8DQo8aHR0
cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8DQo8aHR0cDovL3d3dy5saW5h
cm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1uZmMgbWFpbGluZyBsaXN0IC0tIGxpbnV4LW5mY0BsaXN0
cy4wMS5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBsaW51eC1uZmMtbGVhdmVA
bGlzdHMuMDEub3JnCiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJu
YWxfbmFtZSlz
