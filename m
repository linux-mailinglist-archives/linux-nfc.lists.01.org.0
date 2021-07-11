Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B4F3C3F26
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:25:03 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id C0A0F100EB332;
	Sun, 11 Jul 2021 13:25:01 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id D278F100EB34A
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:59 -0700 (PDT)
Received: from mail-wr1-f71.google.com ([209.85.221.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2g0Y-0001wm-HB
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:24:58 +0000
Received: by mail-wr1-f71.google.com with SMTP id d9-20020adffbc90000b029011a3b249b10so6086601wrs.3
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GSuneos8kPSJld2Wh9zeOsQxgNAFsJiMECia4fIGwr4=;
        b=FV3WtMSW868uE6YLFcMz+z+HvXWC8gEZRQzTfP1xzV0g96TDQNqXpt/NMucVxSBs+N
         X5C8AMYZEY9U437qt8v53pxeU9UAJghOoD+GbvrTP1r+rbBQaXsASXCaaY2kNHo6SeKR
         muHGU/wxSidQxqXZc3AvCoToEcYduv5OVAS4hpdvWeh9LzbikDOW5p3xQXli0h6zzTG/
         zTs9YT+Ia472buAcI/TmVe4aqOqA5lnuvCMjsi8UIE3VUer2mC+zOMSOY9NfF3X8okQ8
         69AFqUuZTyhyYAxJjvZzTwDXrMkuijXOv62At6u8FATwUoW+S1EgM5Mo2PWXo4EwPZUv
         Rj3w==
X-Gm-Message-State: AOAM533YbSn+8YEiKxgVseGuePE/ASj7pnwE58+FjcNMrxbqqlokOA8D
	cr/HXH09+OMc9Tu3roWRlPn1oRta+tZ0XKiKPux/LxE/OaHSIMFsCxwAphSyvhFy90bJnx9PnVR
	wmE4DF0EZH5/Xb9FL5MQ/2O6d8qGUilDqOg==
X-Received: by 2002:a05:600c:354d:: with SMTP id i13mr10689087wmq.143.1626035098089;
        Sun, 11 Jul 2021 13:24:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgW3YpB8rbOK/QSWgqwnVu2X+nfoQFB36ini5rEintW5DmPB7nB4JzXZPcxcOHD3vD8lqcYA==
X-Received: by 2002:a05:600c:354d:: with SMTP id i13mr10689082wmq.143.1626035097910;
        Sun, 11 Jul 2021 13:24:57 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id n12sm12501575wmq.5.2021.07.11.13.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:24:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:23:49 +0200
Message-Id: <20210711202351.18363-20-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: YC6Q3O4HBVZQCOSUOQC7ADBASG7ZFCTD
X-Message-ID-Hash: YC6Q3O4HBVZQCOSUOQC7ADBASG7ZFCTD
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 32/34] unit: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/YC6Q3O4HBVZQCOSUOQC7ADBASG7ZFCTD/>
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
L3VuaXQvdGVzdC1uZGVmLXBhcnNlLmMNCmluZGV4IGNkZWIxYTFhMjRkZi4uMGJjNTNlZWFjMTI1
IDEwMDY0NA0KLS0tIGEvdW5pdC90ZXN0LW5kZWYtcGFyc2UuYw0KKysrIGIvdW5pdC90ZXN0LW5k
ZWYtcGFyc2UuYw0KQEAgLTMxNSw4ICszMTUsOCBAQCBzdGF0aWMgdm9pZCB0ZXN0X25kZWZfc2lu
Z2xlX3NwKHZvaWQpDQogCQkJCQl1cmktPmZpZWxkX2xlbmd0aCkgPT0gMCk7DQogDQogCWlmIChn
X3Rlc3RfdmVyYm9zZSgpKQ0KLQkJZ19wcmludCgiTkRFRiBTUCBVUkkgZmllbGQ6ICUuKnNcbiIs
IHVyaS0+ZmllbGRfbGVuZ3RoLA0KLQkJCQkJCQkoY2hhciAqKSB1cmktPmZpZWxkKTsNCisJCWdf
cHJpbnQoIk5ERUYgU1AgVVJJIGZpZWxkOiAlLipzXG4iLCAoaW50KXVyaS0+ZmllbGRfbGVuZ3Ro
LA0KKwkJCShjaGFyICopIHVyaS0+ZmllbGQpOw0KIA0KIAlnX2ZyZWUodXJpLT5maWVsZCk7DQog
CWdfZnJlZSh1cmkpOw0KQEAgLTM1OSw4ICszNTksOCBAQCBzdGF0aWMgdm9pZCB0ZXN0X25kZWZf
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
