Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A67733987B9
	for <lists+linux-nfc@lfdr.de>; Wed,  2 Jun 2021 13:10:25 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id ACCAB100EF276;
	Wed,  2 Jun 2021 04:10:21 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 61C83100EF267
	for <linux-nfc@lists.01.org>; Wed,  2 Jun 2021 04:10:20 -0700 (PDT)
Received: from mail-ed1-f71.google.com ([209.85.208.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1loOlO-0004Tv-B3
	for linux-nfc@lists.01.org; Wed, 02 Jun 2021 11:10:18 +0000
Received: by mail-ed1-f71.google.com with SMTP id f12-20020a056402150cb029038fdcfb6ea2so1177282edw.14
        for <linux-nfc@lists.01.org>; Wed, 02 Jun 2021 04:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GM346qMDm5SkBVsnz+0MTRWteUg3MTSMm7l18tLMkIc=;
        b=jnH1T4AMUPT6dQiAkSfn+OMxQqR5FC80lAivVoWIEP0JcLgHjVExj7llknLX9GoKvJ
         tG//sLLcYNeDGiOYczXvA50s8eqLtk5rbuaJ7YOj87AYRXSilNqCaKc2FwpU4s7qAYaP
         vjoeZIc46fdEzj/HeoqKZ2P8Fne1zvJIFsiNnYbme55Rsi0LaXoKTkyHyysexhPfIOeY
         ytcunl1RjTbnBoq/qdCTS5ghoa28ASY1Z1ZbK5pgXcoDmFxAk/qeiqMHNnV+FJdM5FqQ
         OpEiVAiDKGyLa6VrQ1hvZRTDdLcZOi3BF1jtnp5V7vBoX7g+FOw59PbHmxADf6wmTldN
         ypVg==
X-Gm-Message-State: AOAM530uKAqEHSPNaZ9uii+7nIg3/lli+lFygYhbXGPd0FqGb0IFDGIQ
	fTDuHDJYcR5eAZg6TJ3PlTmwqH4MCPSGS9hVZ/K5sa16aF0eTQ9E/gIsLC/2R3sKCV5FEn6yt7v
	t+DM1C09Z5YnD0seZtXVmIT7usslspMzDLQ==
X-Received: by 2002:a50:fd13:: with SMTP id i19mr13052919eds.280.1622632218114;
        Wed, 02 Jun 2021 04:10:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw06pkyMIjDmtQIx52ngcNxG9a4Pd49N7BCx77O2/Snm6f9UtSwWihRBF+HkFpauz9Ft3wqoQ==
X-Received: by 2002:a50:fd13:: with SMTP id i19mr13052906eds.280.1622632217929;
        Wed, 02 Jun 2021 04:10:17 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id d24sm1142127edp.7.2021.06.02.04.10.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 04:10:17 -0700 (PDT)
To: Joe Perches <joe@perches.com>, linux-nfc@lists.01.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210601160713.312622-1-krzysztof.kozlowski@canonical.com>
 <5780056e09dbbd285d470a313939e5d3cc1a0c3e.camel@perches.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <c3641235-6cd0-99dc-2e4b-c61875bdb52c@canonical.com>
Date: Wed, 2 Jun 2021 13:10:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <5780056e09dbbd285d470a313939e5d3cc1a0c3e.camel@perches.com>
Content-Language: en-US
Message-ID-Hash: TW7DGCYT3Z3E66AS57222ZBXZBR72AJL
X-Message-ID-Hash: TW7DGCYT3Z3E66AS57222ZBXZBR72AJL
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] nfc: mrvl: remove useless "continue" at end of loop
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/TW7DGCYT3Z3E66AS57222ZBXZBR72AJL/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMDEvMDYvMjAyMSAxODozMCwgSm9lIFBlcmNoZXMgd3JvdGU6DQo+IE9uIFR1ZSwgMjAyMS0w
Ni0wMSBhdCAxODowNyArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4+IFRoZSAi
Y29udGludWUiIHN0YXRlbWVudCBhdCB0aGUgZW5kIG9mIGEgZm9yIGxvb3AgZG9lcyBub3QgaGF2
ZSBhbg0KPj4gZWZmZWN0Lg0KPiBbXQ0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmZjL25mY21y
dmwvdXNiLmMgYi9kcml2ZXJzL25mYy9uZmNtcnZsL3VzYi5jDQo+IFtdDQo+PiBAQCAtMzI1LDcg
KzMyNSw2IEBAIHN0YXRpYyBpbnQgbmZjbXJ2bF9wcm9iZShzdHJ1Y3QgdXNiX2ludGVyZmFjZSAq
aW50ZiwNCj4+IMKgCQlpZiAoIWRydl9kYXRhLT5idWxrX3J4X2VwICYmDQo+PiDCoAkJICAgIHVz
Yl9lbmRwb2ludF9pc19idWxrX2luKGVwX2Rlc2MpKSB7DQo+PiDCoAkJCWRydl9kYXRhLT5idWxr
X3J4X2VwID0gZXBfZGVzYzsNCj4+IC0JCQljb250aW51ZTsNCj4+IMKgCQl9DQo+PiDCoAl9DQo+
IA0KPiBJIHRoaW5rIHRoaXMgY29kZSB3b3VsZCBiZSBjbGVhcmVyIHdpdGggYW4gaWYvZWxzZSBp
bnN0ZWFkIG9mDQo+IG11bHRpcGxlIGNvbnRpbnVlcy4NCg0KTWFrZXMgc2Vuc2UuIEknbGwgc2Vu
ZCBhIHYyLg0KDQoNCkJlc3QgcmVnYXJkcywNCktyenlzenRvZgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1uZmMgbWFpbGluZyBsaXN0IC0tIGxp
bnV4LW5mY0BsaXN0cy4wMS5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBsaW51
eC1uZmMtbGVhdmVAbGlzdHMuMDEub3JnCiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0
KXMvJShfaW50ZXJuYWxfbmFtZSlz
