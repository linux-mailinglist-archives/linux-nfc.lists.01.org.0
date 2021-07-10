Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4BE3C3265
	for <lists+linux-nfc@lfdr.de>; Sat, 10 Jul 2021 05:39:33 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 5DCB3100EB325;
	Fri,  9 Jul 2021 20:39:25 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 3D6E7100EB323
	for <linux-nfc@lists.01.org>; Fri,  9 Jul 2021 20:39:23 -0700 (PDT)
Received: from mail-wr1-f71.google.com ([209.85.221.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m23pp-0007Us-V3
	for linux-nfc@lists.01.org; Sat, 10 Jul 2021 03:39:22 +0000
Received: by mail-wr1-f71.google.com with SMTP id x4-20020a5d60c40000b029013cfb5f33b0so1162275wrt.4
        for <linux-nfc@lists.01.org>; Fri, 09 Jul 2021 20:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cd7mrOYX4go98WFmpd1UhHw4fx3lifzjGna7LwARHwY=;
        b=UVCcK8bx297qBRctMdE3nUkEolQxJxrpEdrM36Entp43NvmG8PUTH+gU6t+8gLSUf+
         +/NO14zUUGoz0aHO4MPlrjn5mEXOMdgJhIHmGU8EXRBdoJe6ZGDiZhVW+LwtBvVP7Xk7
         JEMGBHrZc+QrrANxx/T9KPKOEQVVG0XshOIR+d8MwVgnIf/H2QLHNl8ETtXoOK4MfbAS
         2edIllEb8n7Bcx37LZrulrMkd1xA/EnhtuL5uLSxZMBE+C37fWgNVS6bs0SAeeGmFlKL
         2lyyHGzgihTapP9qySrJ35ViOnZwR6NugCYSAZle2reNbVUeM97an5SpLSzZ+yDeY85Q
         neEQ==
X-Gm-Message-State: AOAM531Kw/OxzZsO5cLgpSOGEXW81pJ3jv6n4RRik0Zy0ttSpKTMnh+d
	4FIxUtRl+Az5VS54hFgkc6drgL1KJ5kVYy/er5bcoQQwIsGDoAkgUUIwgN9vsTrhBejxpqLwsW0
	IAx353a1sgCQoF8b92OKxIjWgPLd5dveSVw==
X-Received: by 2002:a05:600c:358e:: with SMTP id p14mr42343156wmq.136.1625888361555;
        Fri, 09 Jul 2021 20:39:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykFI/QKmo7IsW4AFdP3wc/U3GGVzi3hVkUXxf4YcmRXxkKiJzNdRkAU8sDVr1rOmKhU9qYew==
X-Received: by 2002:a05:600c:358e:: with SMTP id p14mr42343150wmq.136.1625888361452;
        Fri, 09 Jul 2021 20:39:21 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id a12sm7444346wrh.26.2021.07.09.20.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 20:39:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sat, 10 Jul 2021 05:38:54 +0200
Message-Id: <20210710033859.3989-12-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
References: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 3B72RYGQBNVWKFIP7RJVTYUYSSOKHQHY
X-Message-ID-Hash: 3B72RYGQBNVWKFIP7RJVTYUYSSOKHQHY
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 11/16] unit: pass real UTF-8 for testing text NDEF
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/3B72RYGQBNVWKFIP7RJVTYUYSSOKHQHY/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

TGV0J3MgcG9saXNoIHRoaXMgVVRGLTguIDopDQoNClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBL
b3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNvbT4NCi0tLQ0KIHVuaXQv
dGVzdC1uZGVmLXBhcnNlLmMgfCA5ICsrKysrLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS91bml0L3Rlc3QtbmRlZi1w
YXJzZS5jIGIvdW5pdC90ZXN0LW5kZWYtcGFyc2UuYw0KaW5kZXggOGNmZGM4ZjJjYjlkLi5kMjZm
NGM1OTVkOWEgMTAwNjQ0DQotLS0gYS91bml0L3Rlc3QtbmRlZi1wYXJzZS5jDQorKysgYi91bml0
L3Rlc3QtbmRlZi1wYXJzZS5jDQpAQCAtMTQ1LDkgKzE0NSwxMCBAQCBzdHJ1Y3QgbmVhcl9uZGVm
X2FjX3BheWxvYWQgew0KIHN0YXRpYyB1aW50OF90IHVyaVtdID0gezB4ZDEsIDB4MSwgMHhhLCAw
eDU1LCAweDEsIDB4NjksIDB4NmUsIDB4NzQsDQogCQkJMHg2NSwgMHg2YywgMHgyZSwgMHg2Mywg
MHg2ZiwgMHg2ZH07DQogDQotLyogJ2hlbGxvJyAtIFVURi04IC0gZW4tVVMgVGV4dCBOREVGICov
DQotc3RhdGljIHVpbnQ4X3QgdGV4dFtdID0gezB4ZDEsIDB4MSwgMHhiLCAweDU0LCAweDUsICAw
eDY1LCAweDZlLCAweDJkLA0KLQkJCSAweDU1LCAweDUzLCAweDY4LCAweDY1LCAweDZjLCAweDZj
LCAweDZmfTsNCisvKiAnaGVsbG8gxbzDs8WCdycgLSBVVEYtOCAtIGVuLVVTIFRleHQgTkRFRiAq
Lw0KK3N0YXRpYyB1aW50OF90IHRleHRbXSA9IHsweGQxLCAweDEsIDB4MTMsIDB4NTQsIDB4NSwg
MHg2NSwgMHg2ZSwgMHgyZCwNCisJCQkgMHg1NSwgMHg1MywgMHg2OCwgMHg2NSwgMHg2YywgMHg2
YywgMHg2ZiwgMHgyMCwgMHhjNSwNCisJCQkgMHhiYywgMHhjMywgMHhiMywgMHhjNSwgMHg4Miwg
MHg3N307DQogDQogLyogU21hcnQgcG9zdGVyIHdpdGggYSBodHRwOi8vaW50ZWwuY29tIFVSSSBy
ZWNvcmQgKi8NCiBzdGF0aWMgdWludDhfdCBzaW5nbGVfc3BbXSA9IHsweGQxLCAweDIsIDB4ZSwg
MHg1MywgMHg3MCwgMHhkMSwgMHgxLCAweGEsDQpAQCAtMjM0LDcgKzIzNSw3IEBAIHN0YXRpYyB2
b2lkIHRlc3RfbmRlZl90ZXh0KHZvaWQpDQogCWdfYXNzZXJ0KHJlY29yZC0+aGVhZGVyLT5tZSA9
PSAxKTsNCiANCiAJZ19hc3NlcnQocmVjb3JkLT50ZXh0KTsNCi0JZ19hc3NlcnQoc3RyY21wKHJl
Y29yZC0+dGV4dC0+ZGF0YSwgImhlbGxvIikgPT0gMCk7DQorCWdfYXNzZXJ0KHN0cmNtcChyZWNv
cmQtPnRleHQtPmRhdGEsICJoZWxsbyDFvMOzxYJ3IikgPT0gMCk7DQogCWdfYXNzZXJ0KHN0cmNt
cChyZWNvcmQtPnRleHQtPmVuY29kaW5nLCAiVVRGLTgiKSA9PSAwKTsNCiAJZ19hc3NlcnQoc3Ry
Y21wKHJlY29yZC0+dGV4dC0+bGFuZ3VhZ2VfY29kZSwgImVuLVVTIikgPT0gMCk7DQogDQotLSAN
CjIuMjcuMA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbmZjIG1haWxpbmcgbGlzdCAtLSBsaW51eC1uZmNAbGlzdHMuMDEub3JnClRvIHVuc3Vi
c2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gbGludXgtbmZjLWxlYXZlQGxpc3RzLjAxLm9yZwolKHdl
Yl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpcw==
