Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA6D3C3F22
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:24:58 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 657F1100EB330;
	Sun, 11 Jul 2021 13:24:57 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 0C601100EB858
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:55 -0700 (PDT)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2g0T-0001uU-OF
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:24:53 +0000
Received: by mail-wr1-f69.google.com with SMTP id 32-20020adf82a30000b029013b21c75294so4933662wrc.14
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xyqJ14wjmDRgY26+epCfc9QXHSbvavetjGVVMpq1w4g=;
        b=hEofd+dndcVYJSsdVQTZkNmcaSJfZ9DAvsAN4EGfuXZ9b2WMvAl1QjioHN2Kso+fOf
         OSs4m7jLv+ecY3fhAdWINPTAxurQzapAy3esra8CDHLba9+0ixd0tJmp/p5X7rA7EMrC
         PBJq2xjdSgkFIuTv1aEmNFAMUpaWlKORO1WxuMo6VuYlqSqW1XqABUbDnRx+ZZwSbr2a
         SpGpbEDwVI7402w9Zt6x6plwfnQy3vtN0WEMou50CIptfRyzak9Cw9xh4IHFl7bbcyTo
         5sxKPA9BjaXPo9mNO/qz8wmaDHZKGsaora9l11RFHJBqKreLhINyiuoDNIaktDr1aJo7
         SbMg==
X-Gm-Message-State: AOAM531tdEIJSiFxtJCojaUTY0MkFWdE1vuzZNczPPBtlizl5WVr5yBv
	ZXbBFehBWoekqV7OqG4Z+WOrp8t45VUAw+DxuGvr+cn32wegi86napLVD4q/jYoXgZNl1FljSND
	NuSwSN2A3Ja9JHwj5NQkNJvp2//iHOQpWDQ==
X-Received: by 2002:a1c:4603:: with SMTP id t3mr21616531wma.113.1626035093079;
        Sun, 11 Jul 2021 13:24:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZasct4iKYReA9/Y8UOvkYg/UTiIEPqU5k8ncrkC4fwzackr6jtm3Y+/ehKgRfPLnXnXIU0g==
X-Received: by 2002:a1c:4603:: with SMTP id t3mr21616522wma.113.1626035092965;
        Sun, 11 Jul 2021 13:24:52 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id n12sm12501575wmq.5.2021.07.11.13.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:24:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:23:45 +0200
Message-Id: <20210711202351.18363-16-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: TFNNTPS3DY37XXWYHZ3E7T763CD4EWBS
X-Message-ID-Hash: TFNNTPS3DY37XXWYHZ3E7T763CD4EWBS
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 28/34] tag: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/TFNNTPS3DY37XXWYHZ3E7T763CD4EWBS/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UHJvcGVybHkgcHJpbnQgc2lnbmVkIGFuZCB1bnNpZ25lZCBpbnRlZ2Vycy4gIFRoaXMgZml4ZXMg
d2FybmluZ3MgbGlrZToNCg0KICAgIHNyYy90YWcuYzogSW4gZnVuY3Rpb24g4oCYbmVhcl90YWdf
Z2V0X3RhZ+KAmToNCiAgICBzcmMvdGFnLmM6OTk6MzM6IGVycm9yOiBmb3JtYXQg4oCYJWTigJkg
ZXhwZWN0cyBhcmd1bWVudCBvZiB0eXBlIOKAmGludOKAmSwgYnV0IGFyZ3VtZW50IDMgaGFzIHR5
cGUg4oCYdWludDMyX3TigJkge2FrYSDigJh1bnNpZ25lZCBpbnTigJl9IFstV2Vycm9yPWZvcm1h
dD1dDQogICAgICAgOTkgfCAgcGF0aCA9IGdfc3RyZHVwX3ByaW50ZigiJXMvbmZjJWQvdGFnJWQi
LCBORkNfUEFUSCwNCiAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+
Xg0KICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8DQogICAgICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludA0KICAgICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICVkDQogICAgICAxMDAgfCAgICAgIGFkYXB0ZXJf
aWR4LCB0YXJnZXRfaWR4KTsNCiAgICAgICAgICB8ICAgICAgfn5+fn5+fn5+fn4NCiAgICAgICAg
ICB8ICAgICAgfA0KICAgICAgICAgIHwgICAgICB1aW50MzJfdCB7YWthIHVuc2lnbmVkIGludH0N
Cg0KICAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBzcmMvbmVhci5oOjM2LA0KICAgICAgICAgICAg
ICAgICAgICAgZnJvbSBzcmMvdGFnLmM6MzU6DQogICAgc3JjL3RhZy5jOiBJbiBmdW5jdGlvbiDi
gJhuZWFyX3RhZ19zZXRfbmZjaWTigJk6DQogICAgLi9pbmNsdWRlL25lYXIvbG9nLmg6NDU6MTQ6
IGVycm9yOiBmb3JtYXQg4oCYJXpk4oCZIGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDigJhzaWdu
ZWQgc2l6ZV904oCZLCBidXQgYXJndW1lbnQgNCBoYXMgdHlwZSDigJhzaXplX3TigJkge2FrYSDi
gJhsb25nIHVuc2lnbmVkIGludOKAmX0gWy1XZXJyb3I9Zm9ybWF0PV0NCiAgICAgICA0NSB8ICAg
bmVhcl9kZWJ1ZygiJXM6JXMoKSAiIGZtdCwgXA0KICAgICAgICAgIHwgICAgICAgICAgICAgIF5+
fn5+fn5+fn4NCiAgICBzcmMvdGFnLmM6NzkxOjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNy
byDigJhEQkfigJkNCiAgICAgIDc5MSB8ICBEQkcoIk5GQ0lEIGxlbiAlemQiLCBuZmNpZF9sZW4p
Ow0KICAgICAgICAgIHwgIF5+fg0KDQpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnp5c3p0b2Yua296bG93c2tpQGNhbm9uaWNhbC5jb20+DQotLS0NCiBzcmMvdGFnLmMgfCA4
ICsrKystLS0tDQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkNCg0KZGlmZiAtLWdpdCBhL3NyYy90YWcuYyBiL3NyYy90YWcuYw0KaW5kZXggOWViYTRlZWZl
ZjM1Li41MjAzNjhiMTU1MmMgMTAwNjQ0DQotLS0gYS9zcmMvdGFnLmMNCisrKyBiL3NyYy90YWcu
Yw0KQEAgLTk2LDcgKzk2LDcgQEAgc3RydWN0IG5lYXJfdGFnICpuZWFyX3RhZ19nZXRfdGFnKHVp
bnQzMl90IGFkYXB0ZXJfaWR4LCB1aW50MzJfdCB0YXJnZXRfaWR4KQ0KIAlzdHJ1Y3QgbmVhcl90
YWcgKnRhZzsNCiAJY2hhciAqcGF0aDsNCiANCi0JcGF0aCA9IGdfc3RyZHVwX3ByaW50ZigiJXMv
bmZjJWQvdGFnJWQiLCBORkNfUEFUSCwNCisJcGF0aCA9IGdfc3RyZHVwX3ByaW50ZigiJXMvbmZj
JXUvdGFnJXUiLCBORkNfUEFUSCwNCiAJCQkJCWFkYXB0ZXJfaWR4LCB0YXJnZXRfaWR4KTsNCiAJ
aWYgKCFwYXRoKQ0KIAkJcmV0dXJuIE5VTEw7DQpAQCAtNjU4LDcgKzY1OCw3IEBAIHN0YXRpYyBp
bnQgdGFnX2luaXRpYWxpemUoc3RydWN0IG5lYXJfdGFnICp0YWcsDQogew0KIAlEQkcoIiIpOw0K
IA0KLQl0YWctPnBhdGggPSBnX3N0cmR1cF9wcmludGYoIiVzL25mYyVkL3RhZyVkIiwgTkZDX1BB
VEgsDQorCXRhZy0+cGF0aCA9IGdfc3RyZHVwX3ByaW50ZigiJXMvbmZjJXUvdGFnJXUiLCBORkNf
UEFUSCwNCiAJCQkJCWFkYXB0ZXJfaWR4LCB0YXJnZXRfaWR4KTsNCiAJaWYgKCF0YWctPnBhdGgp
DQogCQlyZXR1cm4gLUVOT01FTTsNCkBAIC03ODgsNyArNzg4LDcgQEAgaW50IG5lYXJfdGFnX3Nl
dF9uZmNpZCh1aW50MzJfdCBhZGFwdGVyX2lkeCwgdWludDMyX3QgdGFyZ2V0X2lkeCwNCiB7DQog
CXN0cnVjdCBuZWFyX3RhZyAqdGFnOw0KIA0KLQlEQkcoIk5GQ0lEIGxlbiAlemQiLCBuZmNpZF9s
ZW4pOw0KKwlEQkcoIk5GQ0lEIGxlbiAlenUiLCBuZmNpZF9sZW4pOw0KIA0KIAl0YWcgPSBuZWFy
X3RhZ19nZXRfdGFnKGFkYXB0ZXJfaWR4LCB0YXJnZXRfaWR4KTsNCiAJaWYgKCF0YWcpDQpAQCAt
ODgxLDcgKzg4MSw3IEBAIGludCBuZWFyX3RhZ19hZGRfcmVjb3JkcyhzdHJ1Y3QgbmVhcl90YWcg
KnRhZywgR0xpc3QgKnJlY29yZHMsDQogCWZvciAobGlzdCA9IHJlY29yZHM7IGxpc3Q7IGxpc3Qg
PSBsaXN0LT5uZXh0KSB7DQogCQlyZWNvcmQgPSBsaXN0LT5kYXRhOw0KIA0KLQkJcGF0aCA9IGdf
c3RyZHVwX3ByaW50ZigiJXMvbmZjJWQvdGFnJWQvcmVjb3JkJWQiLA0KKwkJcGF0aCA9IGdfc3Ry
ZHVwX3ByaW50ZigiJXMvbmZjJXUvdGFnJXUvcmVjb3JkJXUiLA0KIAkJCQkJTkZDX1BBVEgsIHRh
Zy0+YWRhcHRlcl9pZHgsDQogCQkJCQl0YWctPnRhcmdldF9pZHgsIHRhZy0+bmV4dF9yZWNvcmQp
Ow0KIA0KLS0gDQoyLjI3LjANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW5mYyBtYWlsaW5nIGxpc3QgLS0gbGludXgtbmZjQGxpc3RzLjAxLm9y
ZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGxpbnV4LW5mYy1sZWF2ZUBsaXN0cy4w
MS5vcmcKJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1l
KXM=
