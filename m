Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 521FB3C3F14
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:24:28 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 178A0100EB83E;
	Sun, 11 Jul 2021 13:24:27 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 62D8D100EB83E
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:25 -0700 (PDT)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2g00-0001nE-2V
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:24:24 +0000
Received: by mail-wr1-f69.google.com with SMTP id h15-20020adffd4f0000b0290137e68ed637so6117687wrs.22
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QlVeWLCP37wjQtVWx2Wm/uN/23/DcIwbOYGyujY/11Q=;
        b=U4fm/+EoB6ZX3w6Xyu+sWU93hWgoTIUDPYeTB+JFdHinEAHwlnNd2S6lnVNOiI/wip
         Ypz2TC8ir9NIFfN0hCUtXTtcSfyeJ/IVVpv3251VFjOEevHtSBMOtSaHPPm66NDrhxS/
         N73YHTGgB9qJdrKVmf47SAzYMcNrsPpQPgDuadmUQPCRTPda+Q7q356vJOpf0HocRZxi
         Uta4A27/CQpMqijyNnAw8q0C6vWB/Tw1Yvup1VbDmmd20u51+7FUi7se2W0HoscQ6gj1
         m/+HXP1pcSytD8oLu/AZIGlNRQ563nmV8qhQXDUm29qnI2if7oN8BWqZ5jpoWMJKXT5c
         Yq8Q==
X-Gm-Message-State: AOAM531ZwHR3d+k3k4FOFbQZeE6tdB0HR398x4ahkbj3PlmAGCGm3v0b
	nIOdZhVksR/SqOi5eo0w4Wd6BHF3EnRg3SDlQ4X6IFJEOAauOuCiMbgWnLQJZYa5N2Leqt6Evkv
	MdbomyMqrRFkwAWhpDFGKSV4ZaqCA2FFIqA==
X-Received: by 2002:a5d:5913:: with SMTP id v19mr36524531wrd.14.1626035063688;
        Sun, 11 Jul 2021 13:24:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNnaynomXCATqcN/GBptIsWXNZWTDOxFNHBS4ogtd4Z9rIHMMvybOsURLyviH/Ov4EoJBN4A==
X-Received: by 2002:a5d:5913:: with SMTP id v19mr36524526wrd.14.1626035063581;
        Sun, 11 Jul 2021 13:24:23 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id n12sm12501575wmq.5.2021.07.11.13.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:24:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:23:31 +0200
Message-Id: <20210711202351.18363-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: K6PLTKTZ2I3Z4XQEAVVVHX43FRKLUX6Q
X-Message-ID-Hash: K6PLTKTZ2I3Z4XQEAVVVHX43FRKLUX6Q
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 14/34] nciattach: do not shadow other local 'opt' variable (-Wshadow)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/K6PLTKTZ2I3Z4XQEAVVVHX43FRKLUX6Q/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Rml4IC1Xc2hhZG93IHdhcm5pbmc6DQoNCiAgICB0b29scy9uY2lhdHRhY2guYzogSW4gZnVuY3Rp
b24g4oCYbWFpbuKAmToNCiAgICB0b29scy9uY2lhdHRhY2guYzoyNzI6OTogZXJyb3I6IGRlY2xh
cmF0aW9uIG9mIOKAmG9wdOKAmSBzaGFkb3dzIGEgcHJldmlvdXMgbG9jYWwgWy1XZXJyb3I9c2hh
ZG93XQ0KICAgICAgMjcyIHwgICBjaGFyICpvcHQ7DQogICAgICAgICAgfCAgICAgICAgIF5+fg0K
ICAgIHRvb2xzL25jaWF0dGFjaC5jOjIzNjoyNDogbm90ZTogc2hhZG93ZWQgZGVjbGFyYXRpb24g
aXMgaGVyZQ0KICAgICAgMjM2IHwgIGludCBkZXRhY2gsIHByaW50cGlkLCBvcHQsIGksIG4sIGxk
LCBlcnI7DQogICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgIF5+fg0KDQpTaWduZWQt
b2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGNhbm9uaWNh
bC5jb20+DQotLS0NCiB0b29scy9uY2lhdHRhY2guYyB8IDggKysrKy0tLS0NCiAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvdG9v
bHMvbmNpYXR0YWNoLmMgYi90b29scy9uY2lhdHRhY2guYw0KaW5kZXggNTc0YzBmYmU3ODRhLi40
YWMzN2Q4MmQ1NDUgMTAwNjQ0DQotLS0gYS90b29scy9uY2lhdHRhY2guYw0KKysrIGIvdG9vbHMv
bmNpYXR0YWNoLmMNCkBAIC0yNjksMTYgKzI2OSwxNiBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hh
ciAqYXJndltdKQ0KIAl9DQogDQogCWZvciAobiA9IDA7IG9wdGluZCA8IGFyZ2M7IG4rKywgb3B0
aW5kKyspIHsNCi0JCWNoYXIgKm9wdDsNCisJCWNoYXIgKm9wdGlvbjsNCiANCi0JCW9wdCA9IGFy
Z3Zbb3B0aW5kXTsNCisJCW9wdGlvbiA9IGFyZ3Zbb3B0aW5kXTsNCiANCiAJCXN3aXRjaChuKSB7
DQogCQljYXNlIDA6DQogCQkJZGV2WzBdID0gMDsNCi0JCQlpZiAoIXN0cmNocihvcHQsICcvJykp
DQorCQkJaWYgKCFzdHJjaHIob3B0aW9uLCAnLycpKQ0KIAkJCQlzdHJjcHkoZGV2LCAiL2Rldi8i
KTsNCi0JCQlzdHJjYXQoZGV2LCBvcHQpOw0KKwkJCXN0cmNhdChkZXYsIG9wdGlvbik7DQogCQkJ
YnJlYWs7DQogDQogCQljYXNlIDE6DQotLSANCjIuMjcuMA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbmZjIG1haWxpbmcgbGlzdCAtLSBsaW51
eC1uZmNAbGlzdHMuMDEub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gbGludXgt
bmZjLWxlYXZlQGxpc3RzLjAxLm9yZwolKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClz
LyUoX2ludGVybmFsX25hbWUpcw==
