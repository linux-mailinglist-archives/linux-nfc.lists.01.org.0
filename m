Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BBB3CD321
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:21 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id A4F42100EB33B;
	Mon, 19 Jul 2021 04:09:19 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B6A3C100EB339
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:17 -0700 (PDT)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id B7927408B2
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692956;
	bh=QGihbtkMO0WFHNEKCl9y+mJqPpciL18Y3FWFD4LGKBg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=kvY0XR68YEVWNKP0Mae2va0jk8nLkvprqJAQJtDpbioFryMvRQqyUKLXbN0ULGWvg
	 BjBigWCsDeKzEav2Tfs+A3xgJWfjyEXfKu9EkEAiS50blXqfNInMB79uMwpMSx8ww4
	 ybp5aYVluF6Xzj/Gko5PqXFQnOYsbGfXSNaQWWNOuhRV0nG+jppB2Ff2C+R3Ee87+u
	 Yxal+HWjvouv5gVuUBL8bVJbbY8YlaCWxRWX6JOAQwyzr9n1nxqwIQ/i0cOuolWKaw
	 m6vLnUV6aA5dGBKQG+pBecJgbCVWspyt52tcyJaeRIsjlsidn3ptY8GamzEAirag2I
	 saZ3WrYtWtJ5Q==
Received: by mail-lj1-f199.google.com with SMTP id r3-20020a2e80c30000b0290190289db7f9so9030885ljg.7
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QGihbtkMO0WFHNEKCl9y+mJqPpciL18Y3FWFD4LGKBg=;
        b=HyQfMmRvi1kTDspvVA9GdqbqHNckBYaIwzD0q4RyAUT4Pu248lICM35tMPEfdPbkkS
         JoklbEF28y4QBG7Tt0/0vNpD6VNL6kvK5pH+j+HL8BmgUJrOLgNNFoLPPCznjUM2c6fz
         Yn+Fl6m/+YbykgOo4vGzc33z5a9fi3expkWbssimjoJ77yzbe9qC4YMwL+RVCseKd19q
         ckXf1UenDPIGfP2tCAtf2oL0EQ3p+jF/zIS4bTnN61KeIoDwgnOVF7qvF5kP60QKPsGI
         E5qaAOIxSYlxNb2lSBCZV8vZtaeiTB68exZsM/SemIZk0oyaUOuyOZGfgEI//rfbssaK
         nJ6A==
X-Gm-Message-State: AOAM531KZrt7syQgQWgG+24yYZ/egrni3+ewlSp9RMY/GbYsJ2L3jO7d
	nZON80H+jSTGK/fQWqMNMsOL+s0TTaPvl2JnqsX8cLRzZaG88JX+VGJh5yC+Pdl2Cn+0kVY7kRz
	MkSCohs0+rRTCE3MtFb3sP4ule4AiQ/XsvQ==
X-Received: by 2002:a19:7408:: with SMTP id v8mr17883635lfe.508.1626692955785;
        Mon, 19 Jul 2021 04:09:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqjryLvPD5qcyVJ964re1AibHsPv9hQZrIl/eZZ5Ye2vO14X6m8Bas1snHCLjb1wrjv2Grtg==
X-Received: by 2002:a19:7408:: with SMTP id v8mr17883629lfe.508.1626692955616;
        Mon, 19 Jul 2021 04:09:15 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:42 +0200
Message-Id: <20210719110819.27340-37-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: ACKKJCTECRLKM3GVXTIZLLVJRJPOFMYR
X-Message-ID-Hash: ACKKJCTECRLKM3GVXTIZLLVJRJPOFMYR
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 36/73] netlink: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ACKKJCTECRLKM3GVXTIZLLVJRJPOFMYR/>
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
