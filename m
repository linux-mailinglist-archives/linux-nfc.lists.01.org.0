Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4422459F908
	for <lists+linux-nfc@lfdr.de>; Wed, 24 Aug 2022 14:09:10 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id C928B100E5D89;
	Wed, 24 Aug 2022 05:09:07 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN> 
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B9010100E5D87
	for <linux-nfc@lists.01.org>; Wed, 24 Aug 2022 05:09:05 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id s1so20902091lfp.6
        for <linux-nfc@lists.01.org>; Wed, 24 Aug 2022 05:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=3TZjmvONtK+gD+5sSDysrTZUWAGyVBjcACbDwWxOOvw=;
        b=RRHEsX/ysVQZ6JyBzwErwijne1lD5wlx7AGV/gWrn65CDcgowCDkt7JC+Cm0tBaiwH
         oz22Dut5ITtXGj3ZMCj9f5zmYpWkaLI+ik0P7yQDS1smbBdUkOScpz+hqO0bpzbORsv/
         c4W68grZbPLzvKdseLJ8hy8ihYHKE+g3KUBUcFnrC262yFNk+CGFwx586aghwC130qxf
         3HPynR9Tw6eYdWik1W48lwsIVEbkyOxkRMub9OMQPkhkedDOqQAoVhJw20XQT/8oHefU
         Wh8x5f8KndgOpClUoIbfvF8WpHpiMbvW+UqqlgOHJuvr31TThn2uYmVqtIkZOkh0bGTS
         9uGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=3TZjmvONtK+gD+5sSDysrTZUWAGyVBjcACbDwWxOOvw=;
        b=l+AFU0nMF3nvMo9kTYUmYpiMp1X7TBWIbrDn/YQeR5rHr0ZfNPcIIGt0Amj8xFnjXM
         VoT/GK6oQT0NiPtQqG6qKnihz0Y+wBC6xScKShfDtunpYVeldHm3fufSdyk4tAtkEwie
         GHGDAyDnR88y4288msBTXkR/R/ianR0DswCYXE+85ZK9ZjHbTfXJqItZ+xR5+DrPw4Su
         rrLMJWtfr/Wy2IWhTynFgzDyLa/kNVb7z2VBDojykGF1BRI467paMFR0lGcGOwB5n600
         3YORX02+sISOCBlhdQq4/FmkNUmuSrlpZIO1MTCIgglj8stYBcFQVuxEU3CgAqDomjV4
         6Tzg==
X-Gm-Message-State: ACgBeo2xrXYWCepbyiftCKNvBdyq6b5RhoDJVI+gzJOASpsPvp3uY9Wt
	zP4zOehqIKOWsbaNprZ5ZVCknQ==
X-Google-Smtp-Source: AA6agR66BNqFRXO4lN3u5lLo+pWSPom69F2kZ9+2AcybGpKKS+H6Jlgvu2CQEopxn1zWw9YmCgv5lQ==
X-Received: by 2002:a05:6512:541:b0:492:e86c:1def with SMTP id h1-20020a056512054100b00492e86c1defmr3882332lfl.644.1661342942843;
        Wed, 24 Aug 2022 05:09:02 -0700 (PDT)
Received: from [10.243.4.185] ([193.94.200.84])
        by smtp.gmail.com with ESMTPSA id u5-20020a05651c130500b0025fdf9eec1dsm2820718lja.111.2022.08.24.05.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 05:09:02 -0700 (PDT)
Message-ID: <d499ec9a-a1e3-83e0-b66f-346a9186b4a6@linaro.org>
Date: Wed, 24 Aug 2022 15:08:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: =?UTF-8?B?157Xmdeb15DXnCDXqdeY16jXkNeV16E=?= <mdstrauss91@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CAAMXCFnzLX-yWKSJ5JoBxcE8E0=cSQeDExGoFBxhkusUNeYncg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAAMXCFnzLX-yWKSJ5JoBxcE8E0=cSQeDExGoFBxhkusUNeYncg@mail.gmail.com>
Message-ID-Hash: AD4R6FFH2IFAPV5UVLAWOCRZKTFNU5HX
X-Message-ID-Hash: AD4R6FFH2IFAPV5UVLAWOCRZKTFNU5HX
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: ST ST95HF DRIVER security bug
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/AD4R6FFH2IFAPV5UVLAWOCRZKTFNU5HX/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMjQvMDgvMjAyMiAxMjoxMCwg157Xmdeb15DXnCDXqdeY16jXkNeV16Egd3JvdGU6DQo+IEhp
LA0KPiBJIGZvdW5kIGEgc21hbGwgc2VjdXJpdHkgYnVnIGluIHRoZSBTVDk1SEYgZHJpdmVyIGlu
IExpbnV4IGtlcm5lbCAuDQo+IFRob3VnaHQgaXQgaXMgcmVzcG9uc2libGUgdG8gcmVwb3J0IGl0
IHRvIHlvdSBndXlzIHNvIHlvdSB3ZSBjYW4gcGF0Y2ggaXQNCj4gdXAuDQoNClBsZWFzZSB1c2Ug
c2NyaXB0cy9nZXRfbWFpbnRhaW5lcnMucGwgdG8gQ2MgcmVsZXZhbnQgcGVvcGxlLiBZb3UgZ290
IHRoZQ0Kc2FtZSBjb21tZW50IGxhc3QgdGltZSBhcyB3ZWxsLi4uDQoNCj4gQ1ZFIElEIHdhcyBy
ZXF1ZXN0ZWQsICB3aGVuIGl0IGlzIHJlc2VydmVkIEkgd2lsbCB1cGRhdGUuDQo+IA0KPiBTVCBT
VDk1SEYgRFJJVkVSDQo+IFNUOTVIRiBpcyBhbiBpbnRlZ3JhdGVkIHRyYW5zY2VpdmVyIGZvciBO
RkMgbWFkZSBieSBTVCwNCj4gQnVmZmVyIG92ZXJmbG93IGNhbiBiZSB0cmlnZ2VyZWQgYnkgdGhl
IGF0dGFja2VyIGJ5IHByb3ZpZGluZyBtYWxpY2lvdXMNCj4gc2l6ZSBpbiBvbmUgb2YgdGhlIFNQ
SSByZWNlaXZlIHJlZ2lzdGVycy4NCj4gDQo+ICpEZXRhaWxzOioNCj4gYGBganN4DQo+IHVuc2ln
bmVkIGNoYXIgc3Q5NWhmX3Jlc3BvbnNlX2FyclsyXTsNCj4gcmV0ID0gc3Q5NWhmX3NwaV9yZWN2
X3Jlc3BvbnNlKCZzdDk1Y29udGV4dC0+c3BpY29udGV4dCwNCj4gICAgICAgc3Q5NWhmX3Jlc3Bv
bnNlX2Fycik7DQo+IC4uLg0KPiANCj4gLyogU3VwcG9ydCBvZiBsb25nIGZyYW1lICovDQo+IGlm
IChyZWNlaXZlYnVmZlswXSAmIDB4NjApDQo+IGxlbiArPSAoKChyZWNlaXZlYnVmZlswXSAmIDB4
NjApID4+IDUpIDw8IDgpIHwgcmVjZWl2ZWJ1ZmZbMV07DQo+IGVsc2UNCj4gbGVuICs9IHJlY2Vp
dmVidWZmWzFdOw0KPiANCj4gLyogTm93IG1ha2UgYSB0cmFuc2ZlciB0byByZWFkIG9ubHkgcmVs
ZXZhbnQgYnl0ZXMgKi8NCj4gdHhfdGFrZWRhdGEucnhfYnVmID0gJnJlY2VpdmVidWZmWzJdOw0K
PiB0eF90YWtlZGF0YS5sZW4gPSBsZW4gLSAyOw0KPiANCj4gc3BpX21lc3NhZ2VfaW5pdCgmbSk7
DQo+IHNwaV9tZXNzYWdlX2FkZF90YWlsKCZ0eF90YWtlZGF0YSwgJm0pOw0KPiBgYGANCj4gRHJp
dmVyIHNldHMgYSBidWZmZXIgb2YgMiBieXRlcyBmb3IgdGhlIGlucHV0IGJ5dGVzIGJ1dCBhY3R1
YWxseSBhbGxvd3MgdGhlDQo+IGRyaXZlciB0byBvdmVyZmxvdyBpdCB3aXRoIGFueSB2YWxpZCBT
UEkgbWVzc2FnZSAoc2hvcnQgb3IgbG9uZyBmcmFtZSkgaW4NCj4gdGhlIHR4X3Rha2VkYXRhIHN0
YWdlLg0KPiBJdCBzZWVtcyBsaWtlIGEgbWlzdGFrZSwgYnV0IGkgbWF5IGJlIG1pc3Npbmcgc29t
ZXRoaW5nIGFuZCBpIGFtIHRvdGFsbHkNCj4gd3JvbmcuDQo+IA0KPiAqRWZmZWN0ZWQgY29tbWl0
czoqIEN1cnJlbnQgc291cmNlIGluY2x1ZGVzIGlzc3VlLg0KDQpXaGF0IGRvZXMgaXQgbWVhbiAi
Y3VycmVudCBzb3VyY2UiPyBQbGVhc2UgYmUgc3BlY2lmaWMgd2hpY2ggZXhhY3RseQ0Ka2VybmVs
IHZlcnNpb24gaXMgYWZmZWN0ZWQsIHdoaWNoIGNvbW1pdCBpbnRyb2R1Y2VkIGl0Lg0KDQo+ICpF
eHBsb2l0YWJsZToqIEkgYWN0dWFsbHkgdGhpbmsgdnVsbmVyYWJpbGl0eSBjYW4gYmUgZXhwbG9p
dGFibGUgYnkgYW55DQo+IGRldmljZSBvbiB0aGUgU1BJIGJ1cy4NCg0KVGhlbiB0aGUgcmlzayBp
cyBxdWl0ZSBsb3csIHJpZ2h0PyBTUEkgYnVzc2VzIGFyZSBub3QgdXNlciBob3QtcGx1Z2dhYmxl
DQpleGNlcHQgc29tZSBkZXZlbG9wbWVudCBib2FyZHMgKHNvIGFnYWluIGEgcmVhbCBuaWNoZSku
IEJhc2ljYWxseSBpdCdzDQppbXBhY3QgaXMgbmVnbGlnaWJsZSwgY29uc2lkZXJpbmcgdGhhdCBz
eXN0ZW0gd291bGQgbmVlZCB0byBoYXZlIHN1Y2gNCmRldmljZSByZXBvcnRlZCBhbmQgY29uZmln
dXJlZCAod2hpY2ggZm9yIERUIHN5c3RlbXMgaXMgc3RhdGljKSBhbmQgYXQNCnRoZSBzYW1lIHRp
bWUgbWFsZnVuY3Rpb25pbmcgb3IgYmVoYXZpbmcgaW5jb3JyZWN0bHk/DQoNCllvdSBhbHJlYWR5
IHNlbnQgbWUgYSBtZXNzYWdlIGFib3V0IGl0IGluIE1heSBhbmQgdGhpcyBkb2VzIG5vdCBicmlu
Zw0KYW55dGhpbmcgcGFydGljdWxhcmx5IG5ldyBzaW5jZSB0aGVuLiBZb3UgZGlkIG5vdCByZXNw
b25kIHRvIG15IHJlcGx5DQp0aGF0IHRpbWUsIGFsdGhvdWdoIG1heWJlIHRoYXQncyBjb250aW51
YXRpb24uDQoNCkFueXdheSBwcm9wZXIgYW5hbHl6aW5nIG9mIHRoaXMgaXNzdWUgYW5kIGEgcGF0
Y2ggd291bGQgYmUgbmljZS4NCg0KPiAqQ29kZToqDQo+IDxodHRwczovL2dpdGh1Yi5jb20vdG9y
dmFsZHMvbGludXgvYmxhbWUvbWFzdGVyL2RyaXZlcnMvbmZjL3N0OTVoZi9jb3JlLmMjTDI4ND4N
Cj4gaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2JsYW1lL21hc3Rlci9kcml2ZXJz
L25mYy9zdDk1aGYvY29yZS5jI0wyODQNCj4gLA0KPiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFs
ZHMvbGludXgvYmxvYi9tYXN0ZXIvZHJpdmVycy9uZmMvc3Q5NWhmL3NwaS5jI0wxMDcNCj4gDQo+
IEkgd2FzIG5vdCBhYmxlIHRvIHVuZGVyc3RhbmQgaWYgdGhlIHJlbW90ZSBkZXZpY2UgaGFzIGFi
aWxpdHkgdG8gdHJpZ2dlcg0KPiB0aGUgaXNzdWUgb3Igb25seSB0aGUgU1BJIGNvbm5lY3RlZCBk
ZXZpY2U/DQoNCg0KV2hhdCBkb2VzIGl0IG1lYW4gInJlbW90ZSBkZXZpY2UiPyBORkM/IE5GQyB0
YWcgZG9lcyBub3QgdGFsayBvdmVyIFNQSS4uLg0KDQpCZXN0IHJlZ2FyZHMsDQpLcnp5c3p0b2YK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbmZj
IG1haWxpbmcgbGlzdCAtLSBsaW51eC1uZmNAbGlzdHMuMDEub3JnClRvIHVuc3Vic2NyaWJlIHNl
bmQgYW4gZW1haWwgdG8gbGludXgtbmZjLWxlYXZlQGxpc3RzLjAxLm9yZwolKHdlYl9wYWdlX3Vy
bClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpcw==
