Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CA63CD334
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:42 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id F2CA8100EB34A;
	Mon, 19 Jul 2021 04:09:40 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 5DDFE100EB331
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:38 -0700 (PDT)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 60BA040207
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692977;
	bh=7LKo+e9JUrqOMnUc4Q42fJmQ2hZZXcrZat0h4dEIjb8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XHijKZtGmRF/hvVkoZtS/p5ChIit8a4Tm3cc0v+fzOmRCq9fz9smEXUdq497OxMVi
	 Tfph8QJeMNJ/+tZHsereq//piY2fV0OLQrwEvQa1sttWQFeJdrJVUqzqWputIOtT/f
	 iUcQAlkZ6avIjtkXTaY1eixkcppMlFdhHR08RimtURnvtD9gkEc6cpPGK5ZODEIUtl
	 16SNkRbLFoa1s/fXkuKQkN5BITTh8k5DttdGLUif7do+eF6C/laYV1f594dg9EL7kC
	 A5hD/RlJ97d8cuvHPGF4TZLZhKXIFfutPw3sPa1ir9ZOJv9k907iu+axhV4ZYgTQbf
	 h3zH5dYyOHuEQ==
Received: by mail-lf1-f71.google.com with SMTP id a19-20020a195f530000b0290387ad3bb6e0so3244794lfj.10
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7LKo+e9JUrqOMnUc4Q42fJmQ2hZZXcrZat0h4dEIjb8=;
        b=iAtbVGs8U5515NrOEa4ikYwQR1f4MwYWiEwsSrw3NFBErFmhOFPhjdaYQ2tlicF9nJ
         HWoRxvo8XeSIIuJTKmYb0m9dCIHcoIprs7lCVuzUP4I8aQBLZMMkEZLa+2mArd9x8E82
         KGIXlAyBEoT0NYBJ2FcrwhhxsMONKH13qNuGFuO10FsFMZhLGnYIOpE8/r8x9XUxGWN/
         1Da6OVixVKKO4IQYLQ8G9qB+MQEUkZ38RyA6FR/q78xLpOieLHcknKU8ajsGz5iP1dZ/
         L48NG5C3ViJCKuQWVK+DL9J3hNOolGSg18YoZx7GlLEBiY8TzRKDkegRwJbFqzvPR0zO
         3dEA==
X-Gm-Message-State: AOAM53282l6opb26B49uUuvqRMVlCHHYA52H+R/cH78qQw5WN1bmr9so
	xNO7h//6prYPadBjM60U+1BbnYrIsaEp+ifXY8ulcOB7rl191/xOIXKIA8TjkYNx5KfzZp1YMcn
	KbrKggXYFm/WRxmGdTGMNgN92/Vp5eWlpkw==
X-Received: by 2002:a2e:9e8e:: with SMTP id f14mr21769331ljk.468.1626692976643;
        Mon, 19 Jul 2021 04:09:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuI9OCrUEa0cXlLs9J4mhyhbMJo1n9YbCl8+VIpoZHHBrhhlUb8PANJ5c2ji7i1u9Dr/yMXw==
X-Received: by 2002:a2e:9e8e:: with SMTP id f14mr21769321ljk.468.1626692976481;
        Mon, 19 Jul 2021 04:09:36 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:59 +0200
Message-Id: <20210719110819.27340-54-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 2RNBU7UPUKGEBKV6TOTJX5JNQWTRW6GF
X-Message-ID-Hash: 2RNBU7UPUKGEBKV6TOTJX5JNQWTRW6GF
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 53/73] unit: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/2RNBU7UPUKGEBKV6TOTJX5JNQWTRW6GF/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UHJvcGVybHkgcHJpbnQgc2lnbmVkIGFuZCB1bnNpZ25lZCBpbnRlZ2Vycy4gIFRoaXMgZml4ZXMg
d2FybmluZ3MgbGlrZToNCg0KICAgIHVuaXQvdGVzdC1uZGVmLXBhcnNlLmM6IEluIGZ1bmN0aW9u
IOKAmHRlc3RfbmRlZl9zaW5nbGVfc3DigJk6DQogICAgdW5pdC90ZXN0LW5kZWYtcGFyc2UuYzoz
MTg6MzM6IGVycm9yOiBmaWVsZCBwcmVjaXNpb24gc3BlY2lmaWVyIOKAmC4q4oCZIGV4cGVjdHMg
YXJndW1lbnQgb2YgdHlwZSDigJhpbnTigJksIGJ1dCBhcmd1bWVudCAyIGhhcyB0eXBlIOKAmHVp
bnQzMl904oCZIHtha2Eg4oCYdW5zaWduZWQgaW504oCZfSBbLVdlcnJvcj1mb3JtYXQ9XQ0KICAg
ICAgMzE4IHwgICBnX3ByaW50KCJOREVGIFNQIFVSSSBmaWVsZDogJS4qc1xuIiwgdXJpLT5maWVs
ZF9sZW5ndGgsDQogICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+fl5+
ICAgICB+fn5+fn5+fn5+fn5+fn5+fg0KICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgICAgICAgfA0KICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpbnQgICAgICAgdWludDMyX3Qge2FrYSB1bnNpZ25lZCBpbnR9DQoNCiAgICB1
bml0L3Rlc3Qtc25lcC1yZWFkLmM6IEluIGZ1bmN0aW9uIOKAmHRlc3Rfc25lcF9kdW1teV9yZXFf
cHV04oCZOg0KICAgIHVuaXQvdGVzdC1zbmVwLXJlYWQuYzo0MjoxMjogZXJyb3I6IGZvcm1hdCDi
gJglZOKAmSBleHBlY3RzIGFyZ3VtZW50IG9mIHR5cGUg4oCYaW504oCZLCBidXQgYXJndW1lbnQg
MyBoYXMgdHlwZSDigJh1aW50MzJfdOKAmSB7YWthIOKAmHVuc2lnbmVkIGludOKAmX0gWy1XZXJy
b3I9Zm9ybWF0PV0NCiAgICAgICA0MiB8ICAgZ19wcmludGYoIltTTkVQIHVuaXRdICIgZm10LCAj
I19fVkFfQVJHU19fKTsgXA0KICAgICAgICAgIHwgICAgICAgICAgICBefn5+fn5+fn5+fn5+fg0K
ICAgIC4uLi4uLg0KICAgICAgMTE4IHwgICAgIGZyYWdfY250LCBmcmFnbWVudC0+bmZjX2RhdGFf
bGVuZ3RoLA0KICAgICAgICAgIHwgICAgICAgICAgICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+DQogICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgfA0KICAgICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHtha2EgdW5zaWduZWQgaW50fQ0KDQogICAgdW5p
dC90ZXN0LXNuZXAtcmVhZC5jOiBJbiBmdW5jdGlvbiDigJh0ZXN0X3NuZXBfcmVhZF92ZXJpZnlf
cmVzcOKAmToNCiAgICB1bml0L3Rlc3Qtc25lcC1yZWFkLmM6NDI6MTI6IGVycm9yOiBmb3JtYXQg
4oCYJVjigJkgZXhwZWN0cyBhcmd1bWVudCBvZiB0eXBlIOKAmHVuc2lnbmVkIGludOKAmSwgYnV0
IGFyZ3VtZW50IDMgaGFzIHR5cGUg4oCYaW504oCZIFstV2Vycm9yPWZvcm1hdD1dDQogICAgICAg
NDIgfCAgIGdfcHJpbnRmKCJbU05FUCB1bml0XSAiIGZtdCwgIyNfX1ZBX0FSR1NfXyk7IFwNCiAg
ICAgICAgICB8ICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn4NCiAgICAuLi4uLi4NCiAgICAgIDQ1
NCB8ICAgIHJlc3AtPnJlc3BvbnNlLCBleHBfcmVzcF9jb2RlKTsNCiAgICAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICB+fn5+fn5+fn5+fn5+DQogICAgICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgfA0KICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgIGludA0KDQpTaWduZWQtb2ZmLWJ5
OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGNhbm9uaWNhbC5jb20+
DQotLS0NCiB1bml0L3Rlc3QtbmRlZi1wYXJzZS5jIHwgOCArKysrLS0tLQ0KIHVuaXQvdGVzdC1z
bmVwLXJlYWQuYyAgfCA2ICsrKy0tLQ0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCA3IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvdW5pdC90ZXN0LW5kZWYtcGFyc2UuYyBi
L3VuaXQvdGVzdC1uZGVmLXBhcnNlLmMNCmluZGV4IGY4YjNiN2JlM2E0Yy4uMjRmN2QyZjJjM2Fj
IDEwMDY0NA0KLS0tIGEvdW5pdC90ZXN0LW5kZWYtcGFyc2UuYw0KKysrIGIvdW5pdC90ZXN0LW5k
ZWYtcGFyc2UuYw0KQEAgLTMwMiw4ICszMDIsOCBAQCBzdGF0aWMgdm9pZCB0ZXN0X25kZWZfc2lu
Z2xlX3NwKHZvaWQpDQogCQkJCQl1cmktPmZpZWxkX2xlbmd0aCkgPT0gMCk7DQogDQogCWlmIChn
X3Rlc3RfdmVyYm9zZSgpKQ0KLQkJZ19wcmludCgiTkRFRiBTUCBVUkkgZmllbGQ6ICUuKnNcbiIs
IHVyaS0+ZmllbGRfbGVuZ3RoLA0KLQkJCQkJCQkoY2hhciAqKSB1cmktPmZpZWxkKTsNCisJCWdf
cHJpbnQoIk5ERUYgU1AgVVJJIGZpZWxkOiAlLipzXG4iLCAoaW50KXVyaS0+ZmllbGRfbGVuZ3Ro
LA0KKwkJCShjaGFyICopIHVyaS0+ZmllbGQpOw0KIA0KIAlnX2ZyZWUodXJpLT5maWVsZCk7DQog
CWdfZnJlZSh1cmkpOw0KQEAgLTM0Niw4ICszNDYsOCBAQCBzdGF0aWMgdm9pZCB0ZXN0X25kZWZf
dGl0bGVfc3Aodm9pZCkNCiAJCQkJCXVyaS0+ZmllbGRfbGVuZ3RoKSA9PSAwKTsNCiANCiAJaWYg
KGdfdGVzdF92ZXJib3NlKCkpDQotCQlnX3ByaW50KCJOREVGIFNQIFVSSSBmaWVsZDogJS4qc1xu
IiwgdXJpLT5maWVsZF9sZW5ndGgsDQotCQkJCQkJCShjaGFyICopIHVyaS0+ZmllbGQpOw0KKwkJ
Z19wcmludCgiTkRFRiBTUCBVUkkgZmllbGQ6ICUuKnNcbiIsIChpbnQpdXJpLT5maWVsZF9sZW5n
dGgsDQorCQkJKGNoYXIgKikgdXJpLT5maWVsZCk7DQogDQogCWdfYXNzZXJ0X2NtcHN0cih0ZXh0
LT5kYXRhLCA9PSwgIkludGVsIik7DQogCWdfYXNzZXJ0X2NtcHN0cih0ZXh0LT5lbmNvZGluZywg
PT0sICJVVEYtOCIpOw0KZGlmZiAtLWdpdCBhL3VuaXQvdGVzdC1zbmVwLXJlYWQuYyBiL3VuaXQv
dGVzdC1zbmVwLXJlYWQuYw0KaW5kZXggNzhkYjU4YmE4NTlmLi40MTRiODAxYTVlNzEgMTAwNjQ0
DQotLS0gYS91bml0L3Rlc3Qtc25lcC1yZWFkLmMNCisrKyBiL3VuaXQvdGVzdC1zbmVwLXJlYWQu
Yw0KQEAgLTExNCw3ICsxMTQsNyBAQCBzdGF0aWMgYm9vbCB0ZXN0X3NuZXBfZHVtbXlfcmVxX3B1
dChpbnQgZmQsIHZvaWQgKmRhdGEpDQogCQlzdGF0aWMgaW50IGZyYWdfY250Ow0KIAkJc3RydWN0
IHAycF9zbmVwX2RhdGEgKmZyYWdtZW50ID0gdGVzdF9mcmFnbWVudHMtPmRhdGE7DQogDQotCQlU
RVNUX1NORVBfTE9HKCJcdGR1bW15X3JlcV9wdXQgZnJhZz0lZCwgbGVuPSVkLCBjdXJyZW50PSVk
XG4iLA0KKwkJVEVTVF9TTkVQX0xPRygiXHRkdW1teV9yZXFfcHV0IGZyYWc9JWQsIGxlbj0ldSwg
Y3VycmVudD0ldVxuIiwNCiAJCQkJZnJhZ19jbnQsIGZyYWdtZW50LT5uZmNfZGF0YV9sZW5ndGgs
DQogCQkJCWZyYWdtZW50LT5uZmNfZGF0YV9jdXJyZW50X2xlbmd0aCk7DQogCQl0ZXN0X2ZyYWdt
ZW50cyA9IGdfc2xpc3RfcmVtb3ZlKHRlc3RfZnJhZ21lbnRzLCBmcmFnbWVudCk7DQpAQCAtNDM3
LDcgKzQzNyw3IEBAIHN0YXRpYyB2b2lkIHRlc3Rfc25lcF9yZWFkX25vX3Jlc3BvbnNlKHZvaWQp
DQogICogQHBhcmFtW2luXSBleHBfcmVzcF9pbmZvX2xlbiAgRXhwZWN0ZWQgcmVzcG9uc2UgaW5m
byBsZW5ndGgNCiAgKiBAcGFyYW1baW5dIGV4cF9yZXNwX2luZm8gICAgICBFeHBlY3RlZCByZXNw
b25zZSBpbmZvDQogICovDQotc3RhdGljIHZvaWQgdGVzdF9zbmVwX3JlYWRfdmVyaWZ5X3Jlc3Ao
aW50IGV4cF9yZXNwX2NvZGUsDQorc3RhdGljIHZvaWQgdGVzdF9zbmVwX3JlYWRfdmVyaWZ5X3Jl
c3AodWludDhfdCBleHBfcmVzcF9jb2RlLA0KIAkJdWludDMyX3QgZXhwX3Jlc3BfaW5mb19sZW4s
IHVpbnQ4X3QgKmV4cF9yZXNwX2luZm8pDQogew0KIAlzdHJ1Y3QgcDJwX3NuZXBfcmVzcF9mcmFt
ZSAqcmVzcDsNCkBAIC00NjcsNyArNDY3LDcgQEAgc3RhdGljIHZvaWQgdGVzdF9zbmVwX3JlYWRf
dmVyaWZ5X3Jlc3AoaW50IGV4cF9yZXNwX2NvZGUsDQogICoNCiAgKiBAcGFyYW1baW5dIGV4cF9y
ZXNwX2NvZGUgIEV4cGVjdGVkIHJlc3BvbnNlIGNvZGUNCiAgKi8NCi1zdGF0aWMgdm9pZCB0ZXN0
X3NuZXBfcmVhZF92ZXJpZnlfcmVzcF9jb2RlKGludCBleHBfcmVzcF9jb2RlKQ0KK3N0YXRpYyB2
b2lkIHRlc3Rfc25lcF9yZWFkX3ZlcmlmeV9yZXNwX2NvZGUodWludDhfdCBleHBfcmVzcF9jb2Rl
KQ0KIHsNCiAJdGVzdF9zbmVwX3JlYWRfdmVyaWZ5X3Jlc3AoZXhwX3Jlc3BfY29kZSwgMCwgTlVM
TCk7DQogfQ0KLS0gDQoyLjI3LjANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW5mYyBtYWlsaW5nIGxpc3QgLS0gbGludXgtbmZjQGxpc3RzLjAx
Lm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGxpbnV4LW5mYy1sZWF2ZUBsaXN0
cy4wMS5vcmcKJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9u
YW1lKXM=
