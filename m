Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 501A01C388
	for <lists+linux-nfc@lfdr.de>; Tue, 14 May 2019 08:58:03 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id D4DC5212746FC;
	Mon, 13 May 2019 23:58:01 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=daniel.lezcano@linaro.org; receiver=linux-nfc@lists.01.org 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id 9EEC62126D81A
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 23:57:59 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id c66so1585090wme.0
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 23:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I0rBrXLg5VRcd0C8hroYvLC3dED5HBq3ulgFWJfT7NM=;
 b=Dfg9NpyRo9vu9s7Zdf9JK26sw3flcmt5i/OrYSz/H9MOS5quJdGSa4b+/7ptWv1KAE
 8xOQ4Qmc+7IpD9hFy45jtKR8pTY9SayZ5qN7puz0es4KpivdsYPpL8GAL+EIW3D33wDq
 zWt+yqDD0GNNWlBlV3IeNhEfOoYEq6IcnNUNj5Ellmj4QZd2fcYCLqlx+wrYax7v9z31
 TDNdK5QmOYEMgtJaMkFa1ToqQ3A7YLq/dal975L+B0LSm2xp4LrLErN6zJkWrPr6LXC0
 EBFeu6kXxhQBeAKAT4uPyGdd296jSF/+OTYaybOSczQ5k1/kgCF1JG5fqOuq5PvmUOXK
 LdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I0rBrXLg5VRcd0C8hroYvLC3dED5HBq3ulgFWJfT7NM=;
 b=kQHGuyIamnLEJsNpOMG1bn50TwXSAnR8etZXHmkrwuLWLNSMs7NELh58rAkFWeGYLo
 DRj95kAdax/VVE14oFexmkAKNoEaITjpSVSLMI2ChIDLKoVqHteT2BDOoOwu3VvsW6rb
 psFU4dKDrtMYDjaDKYytx9l6JFVAm5gYwc5y+SG6/SIeqdg3+Qe9KJKW6kuwF1lPW8/8
 KqdBspgC069xj7QF38j1SHz45mSvZqMs8Yl2bnySQbPKRZ0gF4rtCM4RGtereLLHti9a
 5iWAHqEwNLGUM7g9/indWtG7kQY9STMQURZeZEFsl4VAqynfQjrHcjKezhK/BBnODX/S
 3LwQ==
X-Gm-Message-State: APjAAAW2RSXVaGVntwR/IyvamOiIASFTEWTyLsz4D7f7kMbPTcSMqPT7
 452AaV41pqv2Dw8gOgZZmiHBGg==
X-Google-Smtp-Source: APXvYqxxGzNACTGLieUiUb0+plIRdIlRJVeIm2nbCILHxOl6bXyAdLvsze24o58FAW52dYCnsY3yVQ==
X-Received: by 2002:a1c:6783:: with SMTP id b125mr18759584wmc.41.1557817077715; 
 Mon, 13 May 2019 23:57:57 -0700 (PDT)
Received: from [192.168.0.41] (229.78.129.77.rev.sfr.net. [77.129.78.229])
 by smtp.googlemail.com with ESMTPSA id d3sm2363713wmf.46.2019.05.13.23.57.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 May 2019 23:57:57 -0700 (PDT)
To: sedat.dilek@gmail.com
References: <c2d0d19f-d814-8f41-4860-77b9cc7f9d26@linaro.org>
 <CA+icZUVz7sB6hv4fhL_rqhR_D8RePBJFXk1PaUy5tMw2z4xC_Q@mail.gmail.com>
 <5ae87449-83a1-ecce-c72c-b4742c507497@linaro.org>
 <CA+icZUWLBjTtcFS0Fo8M5gSb90GbEUpetUgwr3fy=NxGAVqCyw@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <ecfdf017-59b0-dcb8-f684-1e4ba3d82a28@linaro.org>
Date: Tue, 14 May 2019 08:57:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+icZUWLBjTtcFS0Fo8M5gSb90GbEUpetUgwr3fy=NxGAVqCyw@mail.gmail.com>
Content-Language: en-US
Subject: Re: [linux-nfc] NXP NFC version and ACPI
X-BeenThere: linux-nfc@lists.01.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: NFC on Linux <linux-nfc.lists.01.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nfc>,
 <mailto:linux-nfc-request@lists.01.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nfc/>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nfc>,
 <mailto:linux-nfc-request@lists.01.org?subject=subscribe>
Cc: robert.dolca@intel.com, linux-nfc@lists.01.org,
 linux-wireless@vger.kernel.org, charles.gorand@effinnov.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-nfc-bounces@lists.01.org
Sender: "Linux-nfc" <linux-nfc-bounces@lists.01.org>

T24gMTQvMDUvMjAxOSAwODo1MiwgU2VkYXQgRGlsZWsgd3JvdGU6CgpbIC4uLiBdCgo+Pj4gUGxl
YXNlIGdpdmUgdGhpcyBhIHRyeSBhbmQgcmVwb3J0Lgo+Pgo+PiBNeSBsYXB0b3AgaXMgdGhlIGZp
cnN0IG9uZSBJIGhhdmUgd2l0aCBhIE5GQyByZWFkZXIsIHNvIEknbSBub3QgdXNlZCB0bwo+PiB0
ZXN0IHRoaXMgYXMgaXQgd2FzIG5vdCB3b3JraW5nIHlldC4KPj4KPj4gSSBib290ZWQgdGhlIG1h
Y2hpbmUgd2l0aCBhIDUuMS4xLCB0aGUgc2VyaWVzIGFwcGxpZWQgb24gdG9wLCBhbmQgdGhlCj4+
IGNvbmZpZyBvcHRpb25zIHNldCBhcyBtZW50aW9uZWQgYWJvdmUuCj4+Cj4+IFRoZSBueHAtbmNp
IGtlcm5lbCBtb2R1bGUgaXMgbG9hZGVkIGFuZCBuZWFyZCBpcyBpbnN0YWxsZWQuCj4+Cj4+IEkg
dXNlZCB0aGUgc25pZmZpbmcgdG9vbCB3aXRoIHRoZSBjb21tYW5kIGxpYm5mYyAtZCBuZmMwIC1u
IGJ1dCB3aGVuCj4+IHBhc3NpbmcgbXkgTkZDIGRldmljZXMgb24gdGhlIGxhcHRvcCdzIE5GQyBt
YXJrLCBub3RoaW5nIGhhcHBlbnMuCj4+Cj4+IElzIHRoYXQgY29ycmVjdD8KPj4KPiAKPiBIaSBE
YW5pZWwsCj4gCj4gSSBhbSBuZXcgdG8gdGhlIHRvcGljIExpbnV4IE5GQy4KPiAKPiBJIGhhdmUg
aW5zdGFsbGVkIG5lYXJkIChkYWVtb24pIHYwLjE2IGFuZCBuZWFyZC10b29scyBmcm9tIERlYmlh
bi9idXN0ZXIgQU1ENjQuCj4gCj4gcm9vdEBpbml6YTp+IyBzeXN0ZW1jdGwgaXMtYWN0aXZlIG5l
YXJkLnNlcnZpY2UKPiBhY3RpdmUKClNhbWUgZm9yIG1lCgo+IHJvb3RAaW5pemE6fiMgbmZjdG9v
bCAtLWxpc3QKPiBuZmMwOgo+ICAgICAgICAgICBUYWdzOiBbIF0KPiAgICAgICAgICAgRGV2aWNl
czogWyBdCj4gICAgICAgICAgIFByb3RvY29sczogWyBGZWxpY2EgTUlGQVJFIEpld2VsIElTTy1E
RVAgTkZDLURFUCBdCj4gICAgICAgICAgIFBvd2VyZWQ6IE5vCj4gICAgICAgICAgIFJGIE1vZGU6
IE5vbmUKPiAgICAgICAgICAgbHRvOiAxNTAKPiAgICAgICAgICAgcnc6IDE1Cj4gICAgICAgICAg
IG1pdXg6IDIwNDcKCkkgaGF2ZToKCm5mYzA6CiAgICAgICAgICBUYWdzOiBbIF0KICAgICAgICAg
IERldmljZXM6IFsgXQogICAgICAgICAgUHJvdG9jb2xzOiBbIEZlbGljYSBNSUZBUkUgSmV3ZWwg
SVNPLURFUCBORkMtREVQIF0KICAgICAgICAgIFBvd2VyZWQ6IFllcwogICAgICAgICAgUkYgTW9k
ZTogTm9uZQogICAgICAgICAgbHRvOiAxNTAKICAgICAgICAgIHJ3OiAxNQogICAgICAgICAgbWl1
eDogMjA0NwoKVGhlIHBvd2VyZWQgZmllbGQgaXMgZGlmZmVyZW50LgoKPiByb290QGluaXphOn4j
IG5mY3Rvb2wgLS1wb2xsIC1kIG5mYzAKCj4gU3RhcnQgcG9sbGluZyBvbiBuZmMwIGFzIGluaXRp
YXRvcgo+IAoKSSBoYXZlOgoKUHJvdG9jb2wgZXJyb3IKCgpBbmQgdGhlIGRtZXNnIHNob3cgbWUg
dGhlIGVycm9ycyByZWxhdGVkIHRvIG5jaToKClsgIDM0My4wNTYwMjFdIG5jaTogbmNpX250Zl9w
YWNrZXQ6IHVua25vd24gbnRmIG9wY29kZSAweDAKLi4uClszMTYxMS4zOTQzMDhdIG5jaTogbmNp
X3N0YXJ0X3BvbGw6IGZhaWxlZCB0byBzZXQgbG9jYWwgZ2VuZXJhbCBieXRlcwoKCgoKLS0gCiA8
aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdh
cmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29t
L3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29y
Zz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1uZmMg
bWFpbGluZyBsaXN0CkxpbnV4LW5mY0BsaXN0cy4wMS5vcmcKaHR0cHM6Ly9saXN0cy4wMS5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1uZmMK
