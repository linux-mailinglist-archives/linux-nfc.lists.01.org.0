Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4524B3C3F1D
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:24:50 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id EEBD1100EB848;
	Sun, 11 Jul 2021 13:24:48 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 44700100EB858
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:46 -0700 (PDT)
Received: from mail-wr1-f72.google.com ([209.85.221.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2g0L-0001rj-0n
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:24:45 +0000
Received: by mail-wr1-f72.google.com with SMTP id u7-20020a5d46870000b029012786ba1bc9so6165340wrq.21
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wMDBYzABhu8ioRTTVLSHI/7/lg8unWWdzxP/adfRtNA=;
        b=PrRTfQhNGBAuTOVKqIpUDAnv1cLIVXxqYPyWzowHlbQw4NcNcI5R4W189XMv5r9uch
         WkcmtyhLmO27SoEI20FxEtyR9X6gfFtrsOHPq6ghDTcNNNY7kEtzP86XWmbLuiz//q1i
         6yQEzTI7joVQW60uSHq4otNf6BHamFFpL/+XJEL1S4/GsD/7skSZxl+Sy9+nSuQDlBu9
         JKY0Z5+ROmRr3JiSX9YWr57jcl3wiTzD5OVrs444YEcQNJ75Apgm2/0mJ3Z05YyRH050
         DJCaBzrwNnjc4gxLYIoaj/Rr5Kr3bT4u59qa0pMQCaYPP/wyU7XCf9PR7viuAXAvlnUq
         btSQ==
X-Gm-Message-State: AOAM532n/wOu0Z9gtJTGKAhxOI4bsNf5QnH3qN+5ChEFV5KG2PJXXKZ1
	K5P1l9aZExHnI94mRdoNM6FTjpfOf+oYt+4SaHwRDdH4OVnIHW9tHdFKnID/Gu77Y7KKu4XytXR
	TuaFKKwGFWLlwUod6/hordiUdCDtdE8s5MA==
X-Received: by 2002:a1c:7314:: with SMTP id d20mr50451375wmb.167.1626035084640;
        Sun, 11 Jul 2021 13:24:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXz/kPQGmmk/FjPlh8LjZXN7blll0i+2sTpX+7GgeAaX7eY8kGnzDjr2kbJliov35a/9KPNg==
X-Received: by 2002:a1c:7314:: with SMTP id d20mr50451367wmb.167.1626035084479;
        Sun, 11 Jul 2021 13:24:44 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id n12sm12501575wmq.5.2021.07.11.13.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:24:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:23:40 +0200
Message-Id: <20210711202351.18363-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 2JBARUDYAZJZQWZVNFSMIJAZWPAZUYDD
X-Message-ID-Hash: 2JBARUDYAZJZQWZVNFSMIJAZWPAZUYDD
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 23/34] p2p: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/2JBARUDYAZJZQWZVNFSMIJAZWPAZUYDD/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UHJvcGVybHkgcHJpbnQgc2lnbmVkIGFuZCB1bnNpZ25lZCBpbnRlZ2Vycy4gIFRoaXMgZml4ZXMg
d2FybmluZ3MgbGlrZToNCg0KICAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBwbHVnaW5zL3AycC5j
OjM4Og0KICAgIHBsdWdpbnMvcDJwLmM6IEluIGZ1bmN0aW9uIOKAmHAycF9saXN0ZW5lcl9ldmVu
dOKAmToNCiAgICAuL2luY2x1ZGUvbmVhci9sb2cuaDo0NToxNDogZXJyb3I6IGZvcm1hdCDigJgl
ZOKAmSBleHBlY3RzIGFyZ3VtZW50IG9mIHR5cGUg4oCYaW504oCZLCBidXQgYXJndW1lbnQgNCBo
YXMgdHlwZSDigJhfX3UzMuKAmSB7YWthIOKAmHVuc2lnbmVkIGludOKAmX0gWy1XZXJyb3I9Zm9y
bWF0PV0NCiAgICAgICA0NSB8ICAgbmVhcl9kZWJ1ZygiJXM6JXMoKSAiIGZtdCwgXA0KICAgICAg
ICAgIHwgICAgICAgICAgICAgIF5+fn5+fn5+fn4NCiAgICBwbHVnaW5zL3AycC5jOjI2MToyOiBu
b3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYREJH4oCZDQogICAgICAyNjEgfCAgREJHKCJ0
YXJnZXQgaWR4ICVkIiwgY2xpZW50X2FkZHIudGFyZ2V0X2lkeCk7DQogICAgICAgICAgfCAgXn5+
DQoNClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dz
a2lAY2Fub25pY2FsLmNvbT4NCi0tLQ0KIHBsdWdpbnMvcDJwLmMgfCA0ICsrLS0NCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEv
cGx1Z2lucy9wMnAuYyBiL3BsdWdpbnMvcDJwLmMNCmluZGV4IDEzNzAyYWRlM2UxNC4uY2YzZTBh
Y2NhZjMzIDEwMDY0NA0KLS0tIGEvcGx1Z2lucy9wMnAuYw0KKysrIGIvcGx1Z2lucy9wMnAuYw0K
QEAgLTI1Niw5ICsyNTYsOSBAQCBzdGF0aWMgZ2Jvb2xlYW4gcDJwX2xpc3RlbmVyX2V2ZW50KEdJ
T0NoYW5uZWwgKmNoYW5uZWwsIEdJT0NvbmRpdGlvbiBjb25kaXRpb24sDQogCQlyZXR1cm4gRkFM
U0U7DQogCX0NCiANCi0JREJHKCJjbGllbnQgZHNhcCAlZCBzc2FwICVkIiwNCisJREJHKCJjbGll
bnQgZHNhcCAldSBzc2FwICV1IiwNCiAJCWNsaWVudF9hZGRyLmRzYXAsIGNsaWVudF9hZGRyLnNz
YXApOw0KLQlEQkcoInRhcmdldCBpZHggJWQiLCBjbGllbnRfYWRkci50YXJnZXRfaWR4KTsNCisJ
REJHKCJ0YXJnZXQgaWR4ICV1IiwgY2xpZW50X2FkZHIudGFyZ2V0X2lkeCk7DQogDQogCWNsaWVu
dF9kYXRhID0gZ190cnlfbWFsbG9jMChzaXplb2Yoc3RydWN0IHAycF9kYXRhKSk7DQogCWlmICgh
Y2xpZW50X2RhdGEpIHsNCi0tIA0KMi4yNy4wDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1uZmMgbWFpbGluZyBsaXN0IC0tIGxpbnV4LW5mY0Bs
aXN0cy4wMS5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBsaW51eC1uZmMtbGVh
dmVAbGlzdHMuMDEub3JnCiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50
ZXJuYWxfbmFtZSlz
