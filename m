Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1DB3C3268
	for <lists+linux-nfc@lfdr.de>; Sat, 10 Jul 2021 05:39:37 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id A5EC0100EB338;
	Fri,  9 Jul 2021 20:39:27 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 9243B100EB85C
	for <linux-nfc@lists.01.org>; Fri,  9 Jul 2021 20:39:25 -0700 (PDT)
Received: from mail-wr1-f71.google.com ([209.85.221.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m23ps-0007VM-Aw
	for linux-nfc@lists.01.org; Sat, 10 Jul 2021 03:39:24 +0000
Received: by mail-wr1-f71.google.com with SMTP id g4-20020a5d64e40000b029013398ce8904so3770984wri.16
        for <linux-nfc@lists.01.org>; Fri, 09 Jul 2021 20:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/dCtcR835mk3zyLelM8yzjp13Pd0GhK+y+XX1SR3tfE=;
        b=lCqq44zBcnNKwZk1xBS8J5hANBobaaIN848Q834fNayIr+QK6o6/ocSK6bjp8kj1cI
         72hbNVOHEEUIvk8QVJhSGgype1DcEG4w8O0rm/jzmGwAzHw5gjOkBvyBBYStVsMoYZzT
         4ZjUQcqZPl6mDYtpzYTRYJxCRPis4xsgYIC/yyOUbOVqMnjrxIUboKf1KFc6eTAFrb7M
         M29vJurhqA+aGquYlOCWzCxr/R/oNJMbHesNEfdEHv4Pju9yAIMLSBcOjgYSY1QhOAQW
         bGc0au4uynwfXDToxOuyVZHnauLB/G3BSoPWzezbzvl0NmL1Go5boRvtInc5lJC6qDiX
         H/gA==
X-Gm-Message-State: AOAM531uHptNXkxaD/1jLVry2hZvWoFcerSgR/6yGE1+jwD1Z+SRWKXX
	ZpHRefHojn0LkXmJiggPTkIGMgHxwyxue4X+WgDxrGKERfFN/qaKfOql90ndYF7viYWHj7Mh2fY
	HmAusmHC5VKWjZ8fCYDLEbZvxIq4ax+Ssvw==
X-Received: by 2002:a05:600c:35c1:: with SMTP id r1mr1955959wmq.181.1625888363710;
        Fri, 09 Jul 2021 20:39:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzes3oybMZ6qilxbZD54NOM/Tie1GbbHTLFi2FNHZylrLwBKtALqdFXPszxKyaq0/6YUIFesQ==
X-Received: by 2002:a05:600c:35c1:: with SMTP id r1mr1955953wmq.181.1625888363581;
        Fri, 09 Jul 2021 20:39:23 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id a12sm7444346wrh.26.2021.07.09.20.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 20:39:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sat, 10 Jul 2021 05:38:57 +0200
Message-Id: <20210710033859.3989-15-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
References: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 7DSREX3UQVW7HAKVCMLWMZJ4HJU2HDHP
X-Message-ID-Hash: 7DSREX3UQVW7HAKVCMLWMZJ4HJU2HDHP
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 14/16] ndef: fix parsing of UTF-16 text payload
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/7DSREX3UQVW7HAKVCMLWMZJ4HJU2HDHP/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIHN0cmluZw0KDQpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0
b2Yua296bG93c2tpQGNhbm9uaWNhbC5jb20+DQotLS0NCiBzcmMvbmRlZi5jICAgICAgICAgICAg
IHwgMjIgKysrKysrKysrKysrKystLS0tLS0tLQ0KIHVuaXQvdGVzdC1uZGVmLXBhcnNlLmMgfCAy
NyArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0NCiAyIGZpbGVzIGNoYW5nZWQsIDM0IGluc2Vy
dGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvc3JjL25kZWYuYyBiL3Ny
Yy9uZGVmLmMNCmluZGV4IDEzZTMzNTZjMmM0Yy4uMDkzZWJhOTEwMDI3IDEwMDY0NA0KLS0tIGEv
c3JjL25kZWYuYw0KKysrIGIvc3JjL25kZWYuYw0KQEAgLTExNTAsNyArMTE1MCw4IEBAIHBhcnNl
X3RleHRfcGF5bG9hZCh1aW50OF90ICpwYXlsb2FkLCB1aW50MzJfdCBsZW5ndGgpDQogew0KIAlz
dHJ1Y3QgbmVhcl9uZGVmX3RleHRfcGF5bG9hZCAqdGV4dF9wYXlsb2FkID0gTlVMTDsNCiAJdWlu
dDhfdCBzdGF0dXMsIGxhbmdfbGVuZ3RoLCBsZW47DQotCWNoYXIgKmdfc3RyLCAqdHh0Ow0KKwlj
aGFyICpnX3N0ciA9IE5VTEw7DQorCWNoYXIgKnR4dDsNCiAJdWludDMyX3Qgb2Zmc2V0Ow0KIAln
Ym9vbGVhbiB2YWxpZDsNCiANCkBAIC0xMTg5LDkgKzExOTAsMTIgQEAgcGFyc2VfdGV4dF9wYXls
b2FkKHVpbnQ4X3QgKnBheWxvYWQsIHVpbnQzMl90IGxlbmd0aCkNCiANCiAJbGVuID0gbGVuZ3Ro
IC0gbGFuZ19sZW5ndGggLSAxOw0KIA0KLQlpZiAoc3RhdHVzICYmIChsZW4gJSAyKSkgew0KLQkJ
REJHKCJQYXlsb2FkIG5vdCB2YWxpZCBVVEYtMTYgKGxlbmd0aCAlZCBkb2VzIG5vdCBtYXRjaCki
LCBsZW4pOw0KLQkJZ290byBmYWlsOw0KKwlpZiAoc3RhdHVzKSB7DQorCQlpZiAobGVuICUgMikg
ew0KKwkJCURCRygiUGF5bG9hZCBub3QgdmFsaWQgVVRGLTE2IChsZW5ndGggJWQgZG9lcyBub3Qg
bWF0Y2gpIiwgbGVuKTsNCisJCQlnb3RvIGZhaWw7DQorCQl9DQorCQlsZW4gLz0gMjsNCiAJfQ0K
IA0KIAlpZiAobGVuID4gMCkgew0KQEAgLTEyMDYsMTMgKzEyMTAsMTMgQEAgcGFyc2VfdGV4dF9w
YXlsb2FkKHVpbnQ4X3QgKnBheWxvYWQsIHVpbnQzMl90IGxlbmd0aCkNCiANCiAJCXZhbGlkID0g
Z191dGY4X3ZhbGlkYXRlKGdfc3RyLCBsZW4sIE5VTEwpOw0KIA0KLQkJaWYgKHN0YXR1cykNCi0J
CQlnX2ZyZWUoZ19zdHIpOw0KLQ0KIAkJaWYgKCF2YWxpZCkNCiAJCQlnb3RvIGZhaWw7DQogDQot
CQl0ZXh0X3BheWxvYWQtPmRhdGEgPSBnX3N0cm5kdXAodHh0LCBsZW4pOw0KKwkJLyogRklYTUU6
IHRoaXMgd29uJ3QgcGFyc2UgcHJvcGVybHkgVVRGLTggKi8NCisJCXRleHRfcGF5bG9hZC0+ZGF0
YSA9IGdfc3RybmR1cChnX3N0ciwgbGVuKTsNCisJCWlmIChzdGF0dXMpDQorCQkJZ19mcmVlKGdf
c3RyKTsNCiAJfSBlbHNlIHsNCiAJCXRleHRfcGF5bG9hZC0+ZGF0YSA9IE5VTEw7DQogCX0NCkBA
IC0xMjI3LDYgKzEyMzEsOCBAQCBwYXJzZV90ZXh0X3BheWxvYWQodWludDhfdCAqcGF5bG9hZCwg
dWludDMyX3QgbGVuZ3RoKQ0KIAlyZXR1cm4gdGV4dF9wYXlsb2FkOw0KIA0KIGZhaWw6DQorCWlm
IChzdGF0dXMpDQorCQlnX2ZyZWUoZ19zdHIpOw0KIAluZWFyX2Vycm9yKCJ0ZXh0IHBheWxvYWQg
cGFyc2luZyBmYWlsZWQiKTsNCiAJZnJlZV90ZXh0X3BheWxvYWQodGV4dF9wYXlsb2FkKTsNCiAN
CmRpZmYgLS1naXQgYS91bml0L3Rlc3QtbmRlZi1wYXJzZS5jIGIvdW5pdC90ZXN0LW5kZWYtcGFy
c2UuYw0KaW5kZXggNmM2MmM3YTkyOGM3Li4wNzNiMzZhYzQ4ZmYgMTAwNjQ0DQotLS0gYS91bml0
L3Rlc3QtbmRlZi1wYXJzZS5jDQorKysgYi91bml0L3Rlc3QtbmRlZi1wYXJzZS5jDQpAQCAtMTQ2
LDkgKzE0NiwxNiBAQCBzdGF0aWMgdWludDhfdCB1cmlbXSA9IHsweGQxLCAweDEsIDB4YSwgMHg1
NSwgMHgxLCAweDY5LCAweDZlLCAweDc0LA0KIAkJCTB4NjUsIDB4NmMsIDB4MmUsIDB4NjMsIDB4
NmYsIDB4NmR9Ow0KIA0KIC8qICdoZWxsbyDFvMOzxYJ3JyAtIFVURi04IC0gZW4tVVMgVGV4dCBO
REVGICovDQotc3RhdGljIHVpbnQ4X3QgdGV4dFtdID0gezB4ZDEsIDB4MSwgMHgxMywgMHg1NCwg
MHg1LCAweDY1LCAweDZlLCAweDJkLA0KLQkJCSAweDU1LCAweDUzLCAweDY4LCAweDY1LCAweDZj
LCAweDZjLCAweDZmLCAweDIwLCAweGM1LA0KLQkJCSAweGJjLCAweGMzLCAweGIzLCAweGM1LCAw
eDgyLCAweDc3fTsNCitzdGF0aWMgdWludDhfdCB0ZXh0X3V0ZjhbXSA9IHsweGQxLCAweDEsIDB4
MTMsIDB4NTQsIDB4NSwgMHg2NSwgMHg2ZSwgMHgyZCwNCisJCQkweDU1LCAweDUzLCAweDY4LCAw
eDY1LCAweDZjLCAweDZjLCAweDZmLCAweDIwLCAweGM1LA0KKwkJCTB4YmMsIDB4YzMsIDB4YjMs
IDB4YzUsIDB4ODIsIDB4Nzd9Ow0KKw0KKy8qICdoZWxsbycgLSBVVEYtMTYgLSBlbi1VUyBUZXh0
IE5ERUYgKi8NCitzdGF0aWMgdWludDhfdCB0ZXh0X3V0ZjE2W10gPSB7MHhkMSwgMHgxLCAweDEw
LCAweDU0LCAweDg1LA0KKwkJCS8qIGVuLVVTICovDQorCQkJMHg2NSwgMHg2ZSwgMHgyZCwgMHg1
NSwgMHg1MywNCisJCQkvKiBoZWxsbyDFvMOzxYJ3ICovDQorCQkJMHg2OCwgMHgwMCwgMHg2NSwg
MHgwMCwgMHg2YywgMHgwMCwgMHg2YywgMHgwMCwgMHg2ZiwgMHgwMH07DQogDQogLyogJ2hlbGxv
IMW8w7PFgncnIC0gVVRGLTE2IC0gZW4tVVMgVGV4dCBOREVGIFVURi0xNiBtYWxmb3JtZWQqLw0K
IHN0YXRpYyB1aW50OF90IHRleHRfdXRmMTZfaW52YWxpZFtdID0gezB4ZDEsIDB4MSwgMHgxOSwg
MHg1NCwgMHg4NSwNCkBAIC0yMjcsMTIgKzIzNCwxMiBAQCBzdGF0aWMgdm9pZCB0ZXN0X25kZWZf
dXJpKHZvaWQpDQogCXRlc3RfbmRlZl9mcmVlX3JlY29yZChyZWNvcmQpOw0KIH0NCiANCi1zdGF0
aWMgdm9pZCB0ZXN0X25kZWZfdGV4dCh2b2lkKQ0KK3N0YXRpYyB2b2lkIHRlc3RfbmRlZl90ZXh0
X2VuY29kaW5nKHVpbnQ4X3QgKnRleHQsIHNpemVfdCBsZW4sIGNvbnN0IGNoYXIgKmVuY29kaW5n
LCBjb25zdCBjaGFyICpleHBlY3RlZCkNCiB7DQogCUdMaXN0ICpyZWNvcmRzOw0KIAlzdHJ1Y3Qg
bmVhcl9uZGVmX3JlY29yZCAqcmVjb3JkOw0KIA0KLQlyZWNvcmRzID0gbmVhcl9uZGVmX3BhcnNl
X21zZyh0ZXh0LCBzaXplb2YodGV4dCksIE5VTEwpOw0KKwlyZWNvcmRzID0gbmVhcl9uZGVmX3Bh
cnNlX21zZyh0ZXh0LCBsZW4sIE5VTEwpOw0KIA0KIAlnX2Fzc2VydChyZWNvcmRzKTsNCiAJZ19h
c3NlcnQoZ19saXN0X2xlbmd0aChyZWNvcmRzKSA9PSAxKTsNCkBAIC0yNDQsOCArMjUxLDggQEAg
c3RhdGljIHZvaWQgdGVzdF9uZGVmX3RleHQodm9pZCkNCiAJZ19hc3NlcnQocmVjb3JkLT5oZWFk
ZXItPm1lID09IDEpOw0KIA0KIAlnX2Fzc2VydChyZWNvcmQtPnRleHQpOw0KLQlnX2Fzc2VydChz
dHJjbXAocmVjb3JkLT50ZXh0LT5kYXRhLCAiaGVsbG8gxbzDs8WCdyIpID09IDApOw0KLQlnX2Fz
c2VydChzdHJjbXAocmVjb3JkLT50ZXh0LT5lbmNvZGluZywgIlVURi04IikgPT0gMCk7DQorCWdf
YXNzZXJ0KHN0cmNtcChyZWNvcmQtPnRleHQtPmRhdGEsIGV4cGVjdGVkKSA9PSAwKTsNCisJZ19h
c3NlcnQoc3RyY21wKHJlY29yZC0+dGV4dC0+ZW5jb2RpbmcsIGVuY29kaW5nKSA9PSAwKTsNCiAJ
Z19hc3NlcnQoc3RyY21wKHJlY29yZC0+dGV4dC0+bGFuZ3VhZ2VfY29kZSwgImVuLVVTIikgPT0g
MCk7DQogDQogCWlmIChnX3Rlc3RfdmVyYm9zZSgpKSB7DQpAQCAtMjYyLDYgKzI2OSwxMiBAQCBz
dGF0aWMgdm9pZCB0ZXN0X25kZWZfdGV4dCh2b2lkKQ0KIAl0ZXN0X25kZWZfZnJlZV9yZWNvcmQo
cmVjb3JkKTsNCiB9DQogDQorc3RhdGljIHZvaWQgdGVzdF9uZGVmX3RleHQodm9pZCkNCit7DQor
CXRlc3RfbmRlZl90ZXh0X2VuY29kaW5nKHRleHRfdXRmOCwgc2l6ZW9mKHRleHRfdXRmOCksICJV
VEYtOCIsICJoZWxsbyDFvMOzxYJ3Iik7DQorCXRlc3RfbmRlZl90ZXh0X2VuY29kaW5nKHRleHRf
dXRmMTYsIHNpemVvZih0ZXh0X3V0ZjE2KSwgIlVURi0xNiIsICJoZWxsbyIpOw0KK30NCisNCiBz
dGF0aWMgdm9pZCB0ZXN0X25kZWZfdGV4dF9pbnZhbGlkX3V0ZjE2KHZvaWQpDQogew0KIAlHTGlz
dCAqcmVjb3JkczsNCi0tIA0KMi4yNy4wDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1uZmMgbWFpbGluZyBsaXN0IC0tIGxpbnV4LW5mY0BsaXN0
cy4wMS5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBsaW51eC1uZmMtbGVhdmVA
bGlzdHMuMDEub3JnCiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJu
YWxfbmFtZSlz
