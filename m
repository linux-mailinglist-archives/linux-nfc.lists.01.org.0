Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E7759FF5E
	for <lists+linux-nfc@lfdr.de>; Wed, 24 Aug 2022 18:21:50 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4E209100E5D9A;
	Wed, 24 Aug 2022 09:21:49 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN> 
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 45DB7100EA2C8
	for <linux-nfc@lists.01.org>; Wed, 24 Aug 2022 09:21:48 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id u24so11327378lji.0
        for <linux-nfc@lists.01.org>; Wed, 24 Aug 2022 09:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=k6SNW7J2SfguWP3OtBkY8mnZEFPOGhbwfNAroApAm7s=;
        b=MDJnXAgDBHvTy76WavYOAveBAAEJ4DAnVQYs79aBAeInxvPqro6z4CvQfIAZaGVhM+
         aWSYYWovl4+EL2Flp1IaHQb0pgOHUx9an6lv6Yc3TjwnST6GRXFM2pyJeReqXU9IowHI
         J6x0unmhNJP//73W02rIysB8YfSB7CRnd4swVn9ybcgRL1BRPyzBBT/y/fiJlW1PgOB+
         fqcakNSaa34n4rjePG/3MiXn6WsBf93cdNvuZ0gQfgFu8qMfCxpGtMh3iXE/wF6QsXBa
         7TE2cj/LiP8TOuW4wCc35mbTMN9AsQ4rhePj0YP0XNLzvzT96Nh1MAUyjG1PUK315skg
         iRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=k6SNW7J2SfguWP3OtBkY8mnZEFPOGhbwfNAroApAm7s=;
        b=VZpxjJmhNPWr3ZB4H7r8x1kRcQRqQyiBlCWhWlaL6jq7qBbG2hFVUOr/WkBUCceZyr
         6wyh9CpFKhhpcqfoFaDrmXnvWXig8FOV6fHqBSjYn0bNO5KzH1qTl8wLy0+2ggMGlZZE
         qCpFCYq+KZtwIkoVYaPR8mb9qaZgSHaiSZSc48m+M5qrwYBYehG+yL7K7lQXAqo9Wwex
         QtydpWTsb0E7kWfdTy8JHb3j1eGp3EK1MSzfO0ihNi/2qMCn+jdH2MdC6ckPYpzRmdRG
         7Hrgb0us3KuA9WIeTC9n0Rh4fXD0aLPwbED+F4hqYgJ+6NLM/PtD3JpbAx7iYgLKuyQX
         xYFg==
X-Gm-Message-State: ACgBeo1Gr14JkPV068vHgLnzEPLSMW6j9mw7NB8tA9pwZWlvQHR224Wt
	rfdvz9xCIbyZ6kuOXuBVWL4UPQ==
X-Google-Smtp-Source: AA6agR7JPXg0zTi67AlYDYylMurz8hYT+xKnReiKHT727s+i59BNOBILUXH0f+RwwsQFXE9MsFctWQ==
X-Received: by 2002:a2e:505d:0:b0:261:ce76:52b7 with SMTP id v29-20020a2e505d000000b00261ce7652b7mr6356ljd.286.1661358106060;
        Wed, 24 Aug 2022 09:21:46 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id q9-20020a056512210900b0048b1d92991asm3019085lfr.303.2022.08.24.09.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 09:21:45 -0700 (PDT)
Message-ID: <cb9ee490-744d-bc5d-715d-7a23d2b682c8@linaro.org>
Date: Wed, 24 Aug 2022 19:21:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: =?UTF-8?B?157Xmdeb15DXnCDXqdeY16jXkNeV16E=?= <mdstrauss91@gmail.com>
References: <CAAMXCFnzLX-yWKSJ5JoBxcE8E0=cSQeDExGoFBxhkusUNeYncg@mail.gmail.com>
 <d499ec9a-a1e3-83e0-b66f-346a9186b4a6@linaro.org>
 <CAAMXCF=15tSmz7=nzVRgw166wDmMGiBuLx6Of-NLvboMN3nAuQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAAMXCF=15tSmz7=nzVRgw166wDmMGiBuLx6Of-NLvboMN3nAuQ@mail.gmail.com>
Message-ID-Hash: CJLTM2C5DYBPU2SVYZBWSKJCFLFC622M
X-Message-ID-Hash: CJLTM2C5DYBPU2SVYZBWSKJCFLFC622M
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: ST ST95HF DRIVER security bug
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/CJLTM2C5DYBPU2SVYZBWSKJCFLFC622M/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMjQvMDgvMjAyMiAxODoxMiwg157Xmdeb15DXnCDXqdeY16jXkNeV16Egd3JvdGU6DQo+Pg0K
Pj4gUGxlYXNlIHVzZSBzY3JpcHRzL2dldF9tYWludGFpbmVycy5wbCB0byBDYyByZWxldmFudCBw
ZW9wbGUuIFlvdSBnb3QgdGhlDQo+PiBzYW1lIGNvbW1lbnQgbGFzdCB0aW1lIGFzIHdlbGwuLi4N
Cj4+DQo+IFNvcnJ5IG15IGJhZCwgaSBmb3Jnb3Qgd2UgYWxyZWFkeSBjb250YWN0ZWQuDQo+IEkg
YWN0dWFsbHkgcmFuIGl0IGFuZCB5b3VyIG5hbWUgY2FtZSB1cCBmb3Igc29tZSByZWFzb24uDQo+
IA0KPj4gLi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIGRyaXZlcnMvbmZjL3N0OTVoZi9zcGku
Yw0KPiANCj4gQmFkIGRpdmlzb3IgaW4gbWFpbjo6dmNzX2Fzc2lnbjogMA0KPiANCj4gS3J6eXN6
dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiAobWFpbnRhaW5l
cjpORkMNCj4+IFNVQlNZU1RFTSkNCj4gDQo+IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcgKG9wZW4g
bGlzdDpORkMgU1VCDQoNCmFuZCBvdGhlciBhZGRyZXNzZXMuLi4gd2h5IHJlbW92aW5nIHRoZW0/
DQoNCj4gDQo+IA0KPiANCj4gDQo+PiAgV2hhdCBkb2VzIGl0IG1lYW4gImN1cnJlbnQgc291cmNl
Ij8gUGxlYXNlIGJlIHNwZWNpZmljIHdoaWNoIGV4YWN0bHkNCj4gDQo+IGtlcm5lbCB2ZXJzaW9u
IGlzIGFmZmVjdGVkLCB3aGljaCBjb21taXQgaW50cm9kdWNlZCBpdC4NCj4gDQo+ICpFZmZlY3Rl
ZCB2ZXJzaW9uOiAqDQo+IC0gdjYuMC1yYzIgPGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9s
aW51eC9yZWxlYXNlcy90YWcvdjYuMC1yYzI+ICAuLi4NCj4gLSAqdjQuNS1yYzEqIDxodHRwczov
L2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvcmVsZWFzZXMvdGFnL3Y0LjUtcmMxPg0KPiAqSW50
cm9kdWNpbmcgY29tbWl0OiAgKg0KPiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgv
Y29tbWl0L2NhYjQ3MzMzZjBmNzViNjg1YmNlMWZhY2VjYjczYmYzNjMyZTEzNjANCj4gDQo+IFRo
ZW4gdGhlIHJpc2sgaXMgcXVpdGUgbG93LCByaWdodD8gU1BJIGJ1c3NlcyBhcmUgbm90IHVzZXIg
aG90LXBsdWdnYWJsZQ0KPj4gZXhjZXB0IHNvbWUgZGV2ZWxvcG1lbnQgYm9hcmRzIChzbyBhZ2Fp
biBhIHJlYWwgbmljaGUpLiBCYXNpY2FsbHkgaXQncw0KPj4gaW1wYWN0IGlzIG5lZ2xpZ2libGUN
Cj4+DQo+IEFncmVlZC4NCj4gDQo+IFdoYXQgZG9lcyBpdCBtZWFuICJyZW1vdGUgZGV2aWNlIj8g
TkZDPyBORkMgdGFnIGRvZXMgbm90IHRhbGsgb3ZlciBTUEkuLi4NCj4+DQo+IEkgd2FzIHdvbmRl
cmluZyBtYXliZSB0aGUgdGFnIGlzIHRoZSBzb3VyY2UgZm9yIHRoZSBjb250ZW50IHRoYXQgYWN0
dWFsbHkNCj4gb3ZlcmZsb3dzIHRoZSBrZXJuZWwgYnVmZmVyLA0KPiBJbiB3aGljaCBjYXNlIGl0
IGNoYW5nZXMgdGhlIHBpY3R1cmUgYSBiaXQuDQoNClRoZSBidWZmZXIgaXMgdXNlZCBmb3IgU1BJ
IHRyYW5zZmVyLCBzbyB0aGUgTkZDIHRhZyAtIGV4Y2VwdCB0aGF0IGl0DQp3b3JrcyB3aXRoIHRo
YXQgZGV2aWNlIC0gaXMgcmF0aGVyIGxvbmcgc2hvdC4NCg0KDQpCZXN0IHJlZ2FyZHMsDQpLcnp5
c3p0b2YKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbmZjIG1haWxpbmcgbGlzdCAtLSBsaW51eC1uZmNAbGlzdHMuMDEub3JnClRvIHVuc3Vic2Ny
aWJlIHNlbmQgYW4gZW1haWwgdG8gbGludXgtbmZjLWxlYXZlQGxpc3RzLjAxLm9yZwolKHdlYl9w
YWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpcw==
