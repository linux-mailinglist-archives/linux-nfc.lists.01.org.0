Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A540D3C3F23
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:24:59 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 75CD6100EB32F;
	Sun, 11 Jul 2021 13:24:58 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id DED9C100EB858
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:55 -0700 (PDT)
Received: from mail-wr1-f70.google.com ([209.85.221.70])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2g0U-0001uv-L7
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:24:54 +0000
Received: by mail-wr1-f70.google.com with SMTP id u13-20020a5d6dad0000b029012e76845945so6133949wrs.11
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QGihbtkMO0WFHNEKCl9y+mJqPpciL18Y3FWFD4LGKBg=;
        b=mk/zq7RSHz8emUbMQWygnisDIEIog3mwsSji/wrgcrbobiwoPVJBcDG50tVF61WYhZ
         ygLKiH53v7ovnYEfbPWYMOTw2lWGS9P5y7W32Uo8nwwQdfODGSFE0WhnlJqstYWSqk46
         XssBGxrFyPjmjjmA5ICYmA+HFkzeSjOjXPkD0AKU5Svuddp3U4Lb5LDkKh0SRs85VM2U
         hIRBxAhCsqKV+0YG/CvZ55aMMV2JuIiu9uDe9ebWENYWozORBGkoM3lfmibZE97R8GVT
         VfH+YHDNdSQzbQD6JszfTOA2CAMk6wEOy52uGCJDF7CPGRp8K8d7mVXsTb8ijwZiyXCG
         z1/Q==
X-Gm-Message-State: AOAM5322t5a/dqB3eg3euRnBCDMyAp4vFyI4UvaGnAeyqkTmnwhDkAe7
	7rWaOZ4XRM1wCdSfK3NPlIAlG2IFKK0ShnoTaG5k8Lbby5mTjRIeUVyRsvDAyNtenJvp3MvvCql
	U+ZFrggK6FM5jbIXKRRSv0zgu4LfCH5Q/2Q==
X-Received: by 2002:adf:fac7:: with SMTP id a7mr54482797wrs.384.1626035094035;
        Sun, 11 Jul 2021 13:24:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8z383ol3JKqxoE/ztHxigPjw2tAvr8/hDyvzRgBUVb7hvqr4DPduC3LdRyuzuTQpGXl+G8A==
X-Received: by 2002:adf:fac7:: with SMTP id a7mr54482789wrs.384.1626035093927;
        Sun, 11 Jul 2021 13:24:53 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id n12sm12501575wmq.5.2021.07.11.13.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:24:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:23:46 +0200
Message-Id: <20210711202351.18363-17-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: HZXFZBWNYRIMYJXGOKTOQOGDFX6VK64J
X-Message-ID-Hash: HZXFZBWNYRIMYJXGOKTOQOGDFX6VK64J
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 29/34] netlink: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/HZXFZBWNYRIMYJXGOKTOQOGDFX6VK64J/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UHJvcGVybHkgcHJpbnQgc2lnbmVkIGFuZCB1bnNpZ25lZCBpbnRlZ2Vycy4gIFRoaXMgZml4ZXMg
d2FybmluZ3MgbGlrZToNCg0KICAgIHNyYy9uZXRsaW5rLmM6IEluIGZ1bmN0aW9uIOKAmG5mY19u
ZXRsaW5rX2V2ZW50X3RtX2RlYWN0aXZhdGVk4oCZOg0KICAgIC4vaW5jbHVkZS9uZWFyL2xvZy5o
OjQ1OjE0OiBlcnJvcjogZm9ybWF0IOKAmCVk4oCZIGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDi
gJhpbnTigJksIGJ1dCBhcmd1bWVudCA0IGhhcyB0eXBlIOKAmHVpbnQzMl904oCZIHtha2Eg4oCY
dW5zaWduZWQgaW504oCZfSBbLVdlcnJvcj1mb3JtYXQ9XQ0KICAgICAgIDQ1IHwgICBuZWFyX2Rl
YnVnKCIlczolcygpICIgZm10LCBcDQogICAgICAgICAgfCAgICAgICAgICAgICAgXn5+fn5+fn5+
fg0KICAgIHNyYy9uZXRsaW5rLmM6NzU5OjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDi
gJhEQkfigJkNCiAgICAgIDc1OSB8ICBEQkcoIiVkIiwgaWR4KTsNCiAgICAgICAgICB8ICBefn4N
CiAgICBzcmMvbmV0bGluay5jOiBJbiBmdW5jdGlvbiDigJhuZmNfbmV0bGlua19ldmVudOKAmToN
CiAgICBzcmMvbmV0bGluay5jOjc3Mjo1NDogZXJyb3I6IGZvcm1hdCDigJglZOKAmSBleHBlY3Rz
IGFyZ3VtZW50IG9mIHR5cGUg4oCYaW504oCZLCBidXQgYXJndW1lbnQgMiBoYXMgdHlwZSDigJhf
X3UzMuKAmSB7YWthIOKAmHVuc2lnbmVkIGludOKAmX0gWy1XZXJyb3I9Zm9ybWF0PV0NCiAgICAg
IDc3MiB8ICAgbmVhcl9lcnJvcigiV0FSTklORzogV3JvbmcgbmV0bGluayBtZXNzYWdlIHNlbmRl
ciAlZCIsDQogICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfl4NCiAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KICAgICAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQNCiAgICAgICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAlZA0KICAg
ICAgNzczIHwgICAgICAgICBzcmMtPm5sX3BpZCk7DQogICAgICAgICAgfCAgICAgICAgIH5+fn5+
fn5+fn5+DQogICAgICAgICAgfCAgICAgICAgICAgIHwNCiAgICAgICAgICB8ICAgICAgICAgICAg
X191MzIge2FrYSB1bnNpZ25lZCBpbnR9DQoNClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3ps
b3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNvbT4NCi0tLQ0KIHNyYy9uZXRs
aW5rLmMgfCAxNiArKysrKysrKy0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgOCBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL3NyYy9uZXRsaW5rLmMgYi9zcmMv
bmV0bGluay5jDQppbmRleCAzYzc3OTk5YTA1ZjIuLmEzYjIwNmFlYWE4OCAxMDA2NDQNCi0tLSBh
L3NyYy9uZXRsaW5rLmMNCisrKyBiL3NyYy9uZXRsaW5rLmMNCkBAIC01NjcsNyArNTY3LDcgQEAg
c3RhdGljIGludCBnZXRfdGFyZ2V0c19oYW5kbGVyKHN0cnVjdCBubF9tc2cgKm4sIHZvaWQgKmFy
ZykNCiAJCWlzbzE1NjkzX3VpZF9sZW4gPSAwOw0KIAl9DQogDQotCURCRygidGFyZ2V0IGlkeCAl
ZCBwcm90byAweCV4IHNlbnNfcmVzIDB4JXggc2VsX3JlcyAweCV4IE5GQ0lEIGxlbiAlZCIsDQor
CURCRygidGFyZ2V0IGlkeCAldSBwcm90byAweCV4IHNlbnNfcmVzIDB4JXggc2VsX3JlcyAweCV4
IE5GQ0lEIGxlbiAlZCIsDQogCSAgICB0YXJnZXRfaWR4LCBwcm90b2NvbHMsIHNlbnNfcmVzLCBz
ZWxfcmVzLCBuZmNpZF9sZW4pOw0KIAlEQkcoIlx0aXNvMTU2OTNfdWlkX2xlbiAlZCIsIGlzbzE1
NjkzX3VpZF9sZW4pOw0KIA0KQEAgLTYwNyw3ICs2MDcsNyBAQCBzdGF0aWMgaW50IG5mY19uZXRs
aW5rX2V2ZW50X3RhcmdldHNfZm91bmQoc3RydWN0IGdlbmxtc2doZHIgKmdubGgpDQogDQogCWFk
YXB0ZXJfaWR4ID0gbmxhX2dldF91MzIoYXR0cltORkNfQVRUUl9ERVZJQ0VfSU5ERVhdKTsNCiAN
Ci0JREJHKCJhZGFwdGVyICVkIiwgYWRhcHRlcl9pZHgpOw0KKwlEQkcoImFkYXB0ZXIgJXUiLCBh
ZGFwdGVyX2lkeCk7DQogDQogCW1zZyA9IG5sbXNnX2FsbG9jKCk7DQogCWlmICghbXNnKQ0KQEAg
LTY1Myw3ICs2NTMsNyBAQCBzdGF0aWMgaW50IG5mY19uZXRsaW5rX2V2ZW50X3RhcmdldF9sb3N0
KHN0cnVjdCBnZW5sbXNnaGRyICpnbmxoKQ0KIAlhZGFwdGVyX2lkeCA9IG5sYV9nZXRfdTMyKGF0
dHJbTkZDX0FUVFJfREVWSUNFX0lOREVYXSk7DQogCXRhcmdldF9pZHggPSBubGFfZ2V0X3UzMihh
dHRyW05GQ19BVFRSX1RBUkdFVF9JTkRFWF0pOw0KIA0KLQlEQkcoImFkYXB0ZXIgJWQgdGFyZ2V0
ICVkIiwgYWRhcHRlcl9pZHgsIHRhcmdldF9pZHgpOw0KKwlEQkcoImFkYXB0ZXIgJXUgdGFyZ2V0
ICV1IiwgYWRhcHRlcl9pZHgsIHRhcmdldF9pZHgpOw0KIA0KIAlyZXR1cm4gX19uZWFyX2FkYXB0
ZXJfcmVtb3ZlX3RhcmdldChhZGFwdGVyX2lkeCwgdGFyZ2V0X2lkeCk7DQogfQ0KQEAgLTY5MCw3
ICs2OTAsNyBAQCBzdGF0aWMgaW50IG5mY19uZXRsaW5rX2V2ZW50X2RlcF91cChzdHJ1Y3QgZ2Vu
bG1zZ2hkciAqZ25saCkNCiANCiAJCXRhcmdldF9pZHggPSBubGFfZ2V0X3UzMihhdHRyc1tORkNf
QVRUUl9UQVJHRVRfSU5ERVhdKTsNCiANCi0JCURCRygiJWQgJWQiLCBpZHgsIHRhcmdldF9pZHgp
Ow0KKwkJREJHKCIldSAldSIsIGlkeCwgdGFyZ2V0X2lkeCk7DQogDQogCQlyZXR1cm4gX19uZWFy
X2FkYXB0ZXJfc2V0X2RlcF9zdGF0ZShpZHgsIHRydWUpOw0KIAl9IGVsc2Ugew0KQEAgLTczNSw3
ICs3MzUsNyBAQCBzdGF0aWMgaW50IG5mY19uZXRsaW5rX2V2ZW50X3RtX2FjdGl2YXRlZChzdHJ1
Y3QgZ2VubG1zZ2hkciAqZ25saCkNCiANCiAJaWR4ID0gbmxhX2dldF91MzIoYXR0cnNbTkZDX0FU
VFJfREVWSUNFX0lOREVYXSk7DQogDQotCURCRygiJWQiLCBpZHgpOw0KKwlEQkcoIiV1IiwgaWR4
KTsNCiANCiAJcmV0dXJuIF9fbmVhcl9hZGFwdGVyX2FkZF9kZXZpY2UoaWR4LCBOVUxMLCAwKTsN
CiB9DQpAQCAtNzU2LDcgKzc1Niw3IEBAIHN0YXRpYyBpbnQgbmZjX25ldGxpbmtfZXZlbnRfdG1f
ZGVhY3RpdmF0ZWQoc3RydWN0IGdlbmxtc2doZHIgKmdubGgpDQogDQogCWlkeCA9IG5sYV9nZXRf
dTMyKGF0dHJzW05GQ19BVFRSX0RFVklDRV9JTkRFWF0pOw0KIA0KLQlEQkcoIiVkIiwgaWR4KTsN
CisJREJHKCIldSIsIGlkeCk7DQogDQogCXJldHVybiBfX25lYXJfYWRhcHRlcl9yZW1vdmVfZGV2
aWNlKGlkeCk7DQogfQ0KQEAgLTc2OSw4ICs3NjksOCBAQCBzdGF0aWMgaW50IG5mY19uZXRsaW5r
X2V2ZW50KHN0cnVjdCBubF9tc2cgKm4sIHZvaWQgKmFyZykNCiAJREJHKCJldmVudCAweCV4Iiwg
Z25saC0+Y21kKTsNCiANCiAJaWYgKHNyYy0+bmxfcGlkKSB7DQotCQluZWFyX2Vycm9yKCJXQVJO
SU5HOiBXcm9uZyBuZXRsaW5rIG1lc3NhZ2Ugc2VuZGVyICVkIiwNCi0JCQkJCQkJCXNyYy0+bmxf
cGlkKTsNCisJCW5lYXJfZXJyb3IoIldBUk5JTkc6IFdyb25nIG5ldGxpbmsgbWVzc2FnZSBzZW5k
ZXIgJXUiLA0KKwkJCSAgIHNyYy0+bmxfcGlkKTsNCiAJCXJldHVybiBOTF9TS0lQOw0KIAl9DQog
DQotLSANCjIuMjcuMA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbmZjIG1haWxpbmcgbGlzdCAtLSBsaW51eC1uZmNAbGlzdHMuMDEub3JnClRv
IHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gbGludXgtbmZjLWxlYXZlQGxpc3RzLjAxLm9y
ZwolKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpcw==
