Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C34B3C3F25
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:25:01 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id A8765100EB339;
	Sun, 11 Jul 2021 13:24:59 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id AB9B9100EB339
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:58 -0700 (PDT)
Received: from mail-wr1-f71.google.com ([209.85.221.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2g0X-0001wI-Cu
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:24:57 +0000
Received: by mail-wr1-f71.google.com with SMTP id u13-20020a5d6dad0000b029012e76845945so6133989wrs.11
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FAWh1ZaI6bDxoqyQYYXPx36IQzdvMIbvBnp1i5jVahA=;
        b=LVMpt8P/ZEReY2cUpzCBIxS/0dxLmflwj4kBHg13jtLeM2FSOkPsawEPeauXxq0rU/
         +kuZKAw28ZYPSW7KP+ZLFH10AqnPvJHJot8YroSip4o7hejDBBPI5FWq5ssk6RJozEPF
         6qAxHRz4+h209qpJXP/aCdwXj2/jMiS6V55+EyRz20lC1JhBqPFdAItCACB5iqHngDyc
         dqgAsXSwWcdoB9sLDC/d+9FOya4zDmfQkug4ii89Yz06qlYOifDkNQRfatG4lkMReQGO
         Xk5ZsSouFJh2Muq5D/O/xRU2y0UGt7rUi/JYmu/elbMt/zRbGLrBlwXe+ff9+lh8s2Et
         HkTw==
X-Gm-Message-State: AOAM531a9lnRciObEFxZqSTgQfDkBekIdEOEotMZ/wM/0V0m4FGBeFNS
	8p7iYCXAO92AGoJ7Xq7qJ7OScU2jXkb3p4bELDic5/UzH8seTj/yuNDhJwm63NgpZ2w2KZU6yrX
	MGGiP962/29z6jOcp4/D6j+rXT92vJ4+5aQ==
X-Received: by 2002:a1c:9a51:: with SMTP id c78mr10669699wme.103.1626035096954;
        Sun, 11 Jul 2021 13:24:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjvQpxVZINdLOqQjuNlUXIXGUjxmEqgbgwU1M2M8wDGYPqp7wG3JaGtBxlrH+tIvETMqX+jw==
X-Received: by 2002:a1c:9a51:: with SMTP id c78mr10669694wme.103.1626035096849;
        Sun, 11 Jul 2021 13:24:56 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id n12sm12501575wmq.5.2021.07.11.13.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:24:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:23:48 +0200
Message-Id: <20210711202351.18363-19-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: W3M2FXWKXAQ26PTKXUJOYSOPBI4VDQVT
X-Message-ID-Hash: W3M2FXWKXAQ26PTKXUJOYSOPBI4VDQVT
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 31/34] ndef: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/W3M2FXWKXAQ26PTKXUJOYSOPBI4VDQVT/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UHJvcGVybHkgcHJpbnQgc2lnbmVkIGFuZCB1bnNpZ25lZCBpbnRlZ2Vycy4gIFRoaXMgZml4ZXMg
d2FybmluZ3MgbGlrZToNCg0KICAgIHNyYy9uZGVmLmM6IEluIGZ1bmN0aW9uIOKAmHByb3BlcnR5
X2dldF91cmnigJk6DQogICAgc3JjL25kZWYuYzo1MDY6MzE6IGVycm9yOiBmaWVsZCBwcmVjaXNp
b24gc3BlY2lmaWVyIOKAmC4q4oCZIGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDigJhpbnTigJks
IGJ1dCBhcmd1bWVudCAzIGhhcyB0eXBlIOKAmHVpbnQzMl904oCZIHtha2Eg4oCYdW5zaWduZWQg
aW504oCZfSBbLVdlcnJvcj1mb3JtYXQ9XQ0KICAgICAgNTA2IHwgIHZhbHVlID0gZ19zdHJkdXBf
cHJpbnRmKCIlcyUuKnMiLCBwcmVmaXgsIHVyaS0+ZmllbGRfbGVuZ3RoLA0KICAgICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIH5+Xn4gICAgICAgICAgIH5+fn5+fn5+fn5+fn5+
fn5+DQogICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAg
ICAgICAgfA0KICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ICAg
ICAgICAgICAgIHVpbnQzMl90IHtha2EgdW5zaWduZWQgaW50fQ0KICAgIHNyYy9uZGVmLmM6IElu
IGZ1bmN0aW9uIOKAmHByb3BlcnR5X2dldF91cmnigJk6DQogICAgc3JjL25kZWYuYzo1MDY6MzE6
IGVycm9yOiBmaWVsZCBwcmVjaXNpb24gc3BlY2lmaWVyIOKAmC4q4oCZIGV4cGVjdHMgYXJndW1l
bnQgb2YgdHlwZSDigJhpbnTigJksIGJ1dCBhcmd1bWVudCAzIGhhcyB0eXBlIOKAmHVpbnQzMl90
4oCZIHtha2Eg4oCYdW5zaWduZWQgaW504oCZfSBbLVdlcnJvcj1mb3JtYXQ9XQ0KICAgICAgNTA2
IHwgIHZhbHVlID0gZ19zdHJkdXBfcHJpbnRmKCIlcyUuKnMiLCBwcmVmaXgsIHVyaS0+ZmllbGRf
bGVuZ3RoLA0KICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH5+Xn4gICAg
ICAgICAgIH5+fn5+fn5+fn5+fn5+fn5+DQogICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgICAgICAgICAgICAgfA0KICAgICAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgaW50ICAgICAgICAgICAgIHVpbnQzMl90IHtha2EgdW5zaWduZWQgaW50
fQ0KDQpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93
c2tpQGNhbm9uaWNhbC5jb20+DQotLS0NCiBzcmMvbmRlZi5jIHwgNiArKystLS0NCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEv
c3JjL25kZWYuYyBiL3NyYy9uZGVmLmMNCmluZGV4IDBkODRmZjRkYzE3Yi4uNjZmYWY3ODY3Mzk5
IDEwMDY0NA0KLS0tIGEvc3JjL25kZWYuYw0KKysrIGIvc3JjL25kZWYuYw0KQEAgLTUwMyw4ICs1
MDMsOCBAQCBzdGF0aWMgZ2Jvb2xlYW4gcHJvcGVydHlfZ2V0X3VyaShjb25zdCBHREJ1c1Byb3Bl
cnR5VGFibGUgKnByb3BlcnR5LA0KIA0KIAlEQkcoIlVSSSBwcmVmaXggJXMiLCBwcmVmaXgpOw0K
IA0KLQl2YWx1ZSA9IGdfc3RyZHVwX3ByaW50ZigiJXMlLipzIiwgcHJlZml4LCB1cmktPmZpZWxk
X2xlbmd0aCwNCi0JCQkJCQkJIHVyaS0+ZmllbGQpOw0KKwl2YWx1ZSA9IGdfc3RyZHVwX3ByaW50
ZigiJXMlLipzIiwgcHJlZml4LCAoaW50KXVyaS0+ZmllbGRfbGVuZ3RoLA0KKwkJCQl1cmktPmZp
ZWxkKTsNCiANCiAJZGJ1c19tZXNzYWdlX2l0ZXJfYXBwZW5kX2Jhc2ljKGl0ZXIsIERCVVNfVFlQ
RV9TVFJJTkcsICZ2YWx1ZSk7DQogDQpAQCAtMTI4MCw3ICsxMjgwLDcgQEAgcGFyc2VfdXJpX3Bh
eWxvYWQodWludDhfdCAqcGF5bG9hZCwgdWludDMyX3QgbGVuZ3RoKQ0KIAl9DQogDQogCURCRygi
SWRlbnRpZmllciAgJzBYJVgnIiwgdXJpX3BheWxvYWQtPmlkZW50aWZpZXIpOw0KLQlEQkcoIkZp
ZWxkICAnJS4qcyciLCB1cmlfcGF5bG9hZC0+ZmllbGRfbGVuZ3RoLCB1cmlfcGF5bG9hZC0+Zmll
bGQpOw0KKwlEQkcoIkZpZWxkICAnJS4qcyciLCAoaW50KXVyaV9wYXlsb2FkLT5maWVsZF9sZW5n
dGgsIHVyaV9wYXlsb2FkLT5maWVsZCk7DQogDQogCXJldHVybiB1cmlfcGF5bG9hZDsNCiANCi0t
IA0KMi4yNy4wDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1uZmMgbWFpbGluZyBsaXN0IC0tIGxpbnV4LW5mY0BsaXN0cy4wMS5vcmcKVG8gdW5z
dWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBsaW51eC1uZmMtbGVhdmVAbGlzdHMuMDEub3JnCiUo
d2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlz
