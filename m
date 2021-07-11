Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 833D93C3F19
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:24:44 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 9EFF4100EB32F;
	Sun, 11 Jul 2021 13:24:41 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 946D2100EB846
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:39 -0700 (PDT)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2g0E-0001pa-95
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:24:38 +0000
Received: by mail-wr1-f69.google.com with SMTP id 32-20020adf82a30000b029013b21c75294so4933424wrc.14
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FnGOMkb6vm1N6nQJ/tXcyc0bIWiCO0YVJqND2woVkxw=;
        b=mRKBaVv/MBmBhKgkO5rFJHZT/2Szb5nmPF8nblQQ2iwmJWz9Rzu9UlzJdjaGtZjl3+
         M5mtC1GB1Cob7o8v6Mq4SYi6G2A/xZHDL7KzSbx3KOjqxoO2lgIct4j1JQbJM8X8FTWa
         cK07p28JHmyIk8eTbPNEGKgmWaQjo+xSNkyvRHDfJYRTOeYbtK5dkfud/7+oszdMdcvY
         izFsBSYhswP08NJYR+VHTVXtvgdueGsLOjv9KMRcSnp2K7crixVqxB7XllPqhM7M8nPN
         baPMALlimRo68xY0vnfFQu/qo5rte6j/+ALQVlOHHsJu/+t4RaTrz+xeMvNhCZpzKtSt
         knXQ==
X-Gm-Message-State: AOAM533dU4A0BML16w0tX0o/z3eXaT7L/ghOdow0VQYU0Afw75CuE1Cb
	Cxe2kzaI1QDGaulkyjJwFq2SXwYv0JQ2Fn8cSA6O6AkOjWxrDGRxFhDLRXlh3Ck+nGif+GvZpoK
	KPpAZsMuGIw8YubQV6xXnrQdzi59dsiAghA==
X-Received: by 2002:adf:fb88:: with SMTP id a8mr2554852wrr.409.1626035077853;
        Sun, 11 Jul 2021 13:24:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcPH4BwylP687BO201H+HUzQFHLTMPYzqZnTLt1eEPASGOjNc6BY4v/gRqC5E8uPf2Algdhg==
X-Received: by 2002:adf:fb88:: with SMTP id a8mr2554842wrr.409.1626035077696;
        Sun, 11 Jul 2021 13:24:37 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id n12sm12501575wmq.5.2021.07.11.13.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:24:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:23:36 +0200
Message-Id: <20210711202351.18363-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: UXCFKPOLWST7OLU5CWJ4FTTTI5CZ2KIM
X-Message-ID-Hash: UXCFKPOLWST7OLU5CWJ4FTTTI5CZ2KIM
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 19/34] nfctype2: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/UXCFKPOLWST7OLU5CWJ4FTTTI5CZ2KIM/>
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
