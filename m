Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F513CD317
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:09 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E7E2E100EB85D;
	Mon, 19 Jul 2021 04:09:06 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id EEE87100EB33C
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:05 -0700 (PDT)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 0AF09408B2
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692945;
	bh=FnGOMkb6vm1N6nQJ/tXcyc0bIWiCO0YVJqND2woVkxw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=iEmfubGpNNlJG6o5HoXK/Luy/yn9bxfzZtzTVCCnDkqmcYXjr1WlIZp3Ffl7i4I2k
	 ayGzkhWAem+ukQU0TGD1DYC3zXDr5J5Ies0IFDZthqtRo8By+mTBAj8GEGzv99reV7
	 L0l2j5HclBriyobhyOVYpjnewsfyNEzqHBoAd/RLyMV3Dl8uYj3UmFk4dumYEpm67o
	 hGchTphKViHQykd/Ey2/tra26lpWQpUSDF0udKeCZ2qgk7ZDUpVnw7HGweOIJX+tMI
	 CKvJ2O6fFY67qOXLMaZh95m5HCcGgQagQQ4skWrWqM6yYjzRJXWqeMcMQVvoktRrP5
	 86Gjt9sg1jL7Q==
Received: by mail-lf1-f71.google.com with SMTP id n10-20020a196f4a0000b0290379403f4d35so3265649lfk.12
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FnGOMkb6vm1N6nQJ/tXcyc0bIWiCO0YVJqND2woVkxw=;
        b=G6Jl1xl/JFnviCFWpXbenPcyXYLlvNJWF6lvbKrl7UfV7p0tpCSRSpzgX7c0MBKRcB
         grm3N4GNqpDSQs27g55eldnbmy8L37G6x93WphU+FAfsuhnTzEW1WNsQq+pMVdJWDiP3
         n6u6/0yUcuf1slh9kmcGzGjpUg4x+bvwXtgB51wxnMCjU+ACWM4f9gXMDV2e60BxRbeC
         WUz0x55KYzg/6BB8uCWY6Jo1In8AulH97UyaBJ9t35altI0WmqDc6orkPDozeb7aK2DE
         GfFHOr7WPPxgsPrfbO4+XzAeLbq7GzPE7CSFzwT3e9CPSd/y1VrD+IGMsEeKSZscHPQ3
         WLtA==
X-Gm-Message-State: AOAM532qHYrbUy8+rv51QWAQ07SsKtDAq9VCdnpZc1Kyp6MNfy0mcIem
	kPC7Jf4u5OEVbKe4X7ZJhPcYGf7Zd0Db6SbdmhXnHPg5/KGpzfOvbNgODPv8x2Xlr94T5oF+fGf
	McMKT7wqv2QBWLUe4TLN3XwmKNbNGy4iu2Q==
X-Received: by 2002:a05:651c:b2b:: with SMTP id b43mr7985670ljr.476.1626692944280;
        Mon, 19 Jul 2021 04:09:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRd9FQr2Fsm8qDkrPI7pdY5F6zz53Q/6Ve/+8C517hsmKM4AKZcTQ/lZGj5RrrjonGfcW6zw==
X-Received: by 2002:a05:651c:b2b:: with SMTP id b43mr7985664ljr.476.1626692944126;
        Mon, 19 Jul 2021 04:09:04 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:32 +0200
Message-Id: <20210719110819.27340-27-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: NP7J25B62CUTUWEAZR3EOJ4O5EEIWGCW
X-Message-ID-Hash: NP7J25B62CUTUWEAZR3EOJ4O5EEIWGCW
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 26/73] nfctype2: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/NP7J25B62CUTUWEAZR3EOJ4O5EEIWGCW/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UHJvcGVybHkgcHJpbnQgc2lnbmVkIGFuZCB1bnNpZ25lZCBpbnRlZ2Vycy4gIFRoaXMgZml4ZXMg
d2FybmluZ3MgbGlrZToNCg0KICAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBwbHVnaW5zL25mY3R5
cGUyLmM6MzY6DQogICAgcGx1Z2lucy9uZmN0eXBlMi5jOiBJbiBmdW5jdGlvbiDigJhkYXRhX3Jl
Y3bigJk6DQogICAgLi9pbmNsdWRlL25lYXIvbG9nLmg6NDU6MTQ6IGVycm9yOiBmb3JtYXQg4oCY
JWTigJkgZXhwZWN0cyBhcmd1bWVudCBvZiB0eXBlIOKAmGludOKAmSwgYnV0IGFyZ3VtZW50IDQg
aGFzIHR5cGUg4oCYdWludDMyX3TigJkge2FrYSDigJh1bnNpZ25lZCBpbnTigJl9IFstV2Vycm9y
PWZvcm1hdD1dDQogICAgICAgNDUgfCAgIG5lYXJfZGVidWcoIiVzOiVzKCkgIiBmbXQsIFwNCiAg
ICAgICAgICB8ICAgICAgICAgICAgICBefn5+fn5+fn5+DQogICAgcGx1Z2lucy9uZmN0eXBlMi5j
OjE5NToyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYREJH4oCZDQogICAgICAxOTUg
fCAgREJHKCJhZGFwdGVyICVkIiwgYWRhcHRlcl9pZHgpOw0KICAgICAgICAgIHwgIF5+fg0KDQog
ICAgcGx1Z2lucy9uZmN0eXBlMi5jOiBJbiBmdW5jdGlvbiDigJhuZmN0eXBlMl93cml0ZeKAmToN
CiAgICBwbHVnaW5zL25mY3R5cGUyLmM6NDU4OjQzOiBlcnJvcjogZm9ybWF0IOKAmCV6ZOKAmSBl
eHBlY3RzIGFyZ3VtZW50IG9mIHR5cGUg4oCYc2lnbmVkIHNpemVfdOKAmSwgYnV0IGFyZ3VtZW50
IDIgaGFzIHR5cGUg4oCYc2l6ZV904oCZIHtha2Eg4oCYbG9uZyB1bnNpZ25lZCBpbnTigJl9IFst
V2Vycm9yPWZvcm1hdD1dDQogICAgICA0NTggfCAgICAgbmVhcl9lcnJvcigiTm90IGVub3VnaCBz
cGFjZSBvbiB0YWcgJXpkICV6ZCIsDQogICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfn5eDQogICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8DQogICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBsb25nIGludA0KICAgICAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICVsZA0KICAgICAgNDU5IHwgICAgICAgbmRlZi0+bGVu
Z3RoLA0KICAgICAgICAgIHwgICAgICAgfn5+fn5+fn5+fn5+DQogICAgICAgICAgfCAgICAgICAg
ICAgfA0KICAgICAgICAgIHwgICAgICAgICAgIHNpemVfdCB7YWthIGxvbmcgdW5zaWduZWQgaW50
fQ0KDQpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93
c2tpQGNhbm9uaWNhbC5jb20+DQotLS0NCiBwbHVnaW5zL25mY3R5cGUyLmMgfCAxMiArKysrKyst
LS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0K
DQpkaWZmIC0tZ2l0IGEvcGx1Z2lucy9uZmN0eXBlMi5jIGIvcGx1Z2lucy9uZmN0eXBlMi5jDQpp
bmRleCBkZWM5NjE1YjY5YWYuLjM2MThjYTE3NzM2MyAxMDA2NDQNCi0tLSBhL3BsdWdpbnMvbmZj
dHlwZTIuYw0KKysrIGIvcGx1Z2lucy9uZmN0eXBlMi5jDQpAQCAtMTkyLDcgKzE5Miw3IEBAIHN0
YXRpYyBpbnQgZGF0YV9yZWN2KHVpbnQ4X3QgKnJlc3AsIGludCBsZW5ndGgsIHZvaWQgKmRhdGEp
DQogCWNtZC5jbWQgPSBDTURfUkVBRDsNCiAJY21kLmJsb2NrID0gREFUQV9CTE9DS19TVEFSVCAr
IHRhZy0+Y3VycmVudF9ibG9jazsNCiANCi0JREJHKCJhZGFwdGVyICVkIiwgYWRhcHRlcl9pZHgp
Ow0KKwlEQkcoImFkYXB0ZXIgJXUiLCBhZGFwdGVyX2lkeCk7DQogDQogCXJldHVybiBuZWFyX2Fk
YXB0ZXJfc2VuZChhZGFwdGVyX2lkeCwNCiAJCQkJKHVpbnQ4X3QgKikgJmNtZCwgQ01EX1JFQURf
U0laRSwNCkBAIC0zNDEsNyArMzQxLDcgQEAgc3RhdGljIGludCBuZmN0eXBlMl9yZWFkKHVpbnQz
Ml90IGFkYXB0ZXJfaWR4LA0KIAkJCWNiLCB0Z3Rfc3VidHlwZSk7DQogDQogCWRlZmF1bHQ6DQot
CQlEQkcoIlVua25vd24gVGFnIFR5cGUgMiBzdWJ0eXBlICVkIiwgdGd0X3N1YnR5cGUpOw0KKwkJ
REJHKCJVbmtub3duIFRhZyBUeXBlIDIgc3VidHlwZSAldSIsIHRndF9zdWJ0eXBlKTsNCiAJCXJl
dHVybiAtMTsNCiAJfQ0KIH0NCkBAIC00NTUsNyArNDU1LDcgQEAgc3RhdGljIGludCBuZmN0eXBl
Ml93cml0ZSh1aW50MzJfdCBhZGFwdGVyX2lkeCwgdWludDMyX3QgdGFyZ2V0X2lkeCwNCiAJCSAq
Lw0KIAkJaWYgKG5lYXJfdGFnX2dldF9tZW1vcnlfbGF5b3V0KHRhZykgPT0gTkVBUl9UQUdfTUVN
T1JZX1NUQVRJQykgew0KIAkJCWlmICgobmRlZi0+bGVuZ3RoICsgMykgPiBuZWFyX3RhZ19nZXRf
ZGF0YV9sZW5ndGgodGFnKSkgew0KLQkJCQluZWFyX2Vycm9yKCJOb3QgZW5vdWdoIHNwYWNlIG9u
IHRhZyAlemQgJXpkIiwNCisJCQkJbmVhcl9lcnJvcigiTm90IGVub3VnaCBzcGFjZSBvbiB0YWcg
JXp1ICV6dSIsDQogCQkJCQkJbmRlZi0+bGVuZ3RoLA0KIAkJCQkJCW5lYXJfdGFnX2dldF9kYXRh
X2xlbmd0aCh0YWcpKTsNCiAJCQkJZXJyID0gLUVOT1NQQzsNCkBAIC00NzEsNyArNDcxLDcgQEAg
c3RhdGljIGludCBuZmN0eXBlMl93cml0ZSh1aW50MzJfdCBhZGFwdGVyX2lkeCwgdWludDMyX3Qg
dGFyZ2V0X2lkeCwNCiAJCXJldHVybiBtaWZhcmVfd3JpdGUoYWRhcHRlcl9pZHgsIHRhcmdldF9p
ZHgsIG5kZWYsDQogCQkJCWNiLCB0Z3Rfc3VidHlwZSk7DQogCWRlZmF1bHQ6DQotCQlEQkcoIlVu
a25vd24gVEFHIFR5cGUgMiBzdWJ0eXBlICVkIiwgdGd0X3N1YnR5cGUpOw0KKwkJREJHKCJVbmtu
b3duIFRBRyBUeXBlIDIgc3VidHlwZSAldSIsIHRndF9zdWJ0eXBlKTsNCiAJCWVyciA9IC1FSU5W
QUw7DQogCQlnb3RvIG91dF9lcnI7DQogCX0NCkBAIC01MzMsNyArNTMzLDcgQEAgc3RhdGljIGlu
dCBuZmN0eXBlMl9jaGVja19wcmVzZW5jZSh1aW50MzJfdCBhZGFwdGVyX2lkeCwgdWludDMyX3Qg
dGFyZ2V0X2lkeCwNCiAJCQkJCQkJY2IsIHRndF9zdWJ0eXBlKTsNCiANCiAJZGVmYXVsdDoNCi0J
CURCRygiVW5rbm93biBUQUcgVHlwZSAyIHN1YnR5cGUgJWQiLCB0Z3Rfc3VidHlwZSk7DQorCQlE
QkcoIlVua25vd24gVEFHIFR5cGUgMiBzdWJ0eXBlICV1IiwgdGd0X3N1YnR5cGUpOw0KIA0KIAkJ
cmV0dXJuIC0xOw0KIAl9DQpAQCAtNTg2LDcgKzU4Niw3IEBAIHN0YXRpYyBpbnQgbmZjdHlwZTJf
Zm9ybWF0KHVpbnQzMl90IGFkYXB0ZXJfaWR4LCB1aW50MzJfdCB0YXJnZXRfaWR4LA0KIAl0Z3Rf
c3VidHlwZSA9IG5lYXJfdGFnX2dldF9zdWJ0eXBlKGFkYXB0ZXJfaWR4LCB0YXJnZXRfaWR4KTsN
CiANCiAJaWYgKHRndF9zdWJ0eXBlICE9IE5FQVJfVEFHX05GQ19UMl9NSUZBUkVfVUxUUkFMSUdI
VCkgew0KLQkJREJHKCJVbmtub3duIFRhZyBUeXBlIDIgc3VidHlwZSAlZCIsIHRndF9zdWJ0eXBl
KTsNCisJCURCRygiVW5rbm93biBUYWcgVHlwZSAyIHN1YnR5cGUgJXUiLCB0Z3Rfc3VidHlwZSk7
DQogCQlyZXR1cm4gLTE7DQogCX0NCiANCi0tIA0KMi4yNy4wDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1uZmMgbWFpbGluZyBsaXN0IC0tIGxp
bnV4LW5mY0BsaXN0cy4wMS5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBsaW51
eC1uZmMtbGVhdmVAbGlzdHMuMDEub3JnCiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0
KXMvJShfaW50ZXJuYWxfbmFtZSlz
