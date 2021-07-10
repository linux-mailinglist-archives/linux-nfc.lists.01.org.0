Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F70B3C3266
	for <lists+linux-nfc@lfdr.de>; Sat, 10 Jul 2021 05:39:35 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 7CC8C100EB32C;
	Fri,  9 Jul 2021 20:39:27 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 1AAC5100EB842
	for <linux-nfc@lists.01.org>; Fri,  9 Jul 2021 20:39:24 -0700 (PDT)
Received: from mail-wr1-f70.google.com ([209.85.221.70])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m23pq-0007V4-T5
	for linux-nfc@lists.01.org; Sat, 10 Jul 2021 03:39:22 +0000
Received: by mail-wr1-f70.google.com with SMTP id i10-20020a5d55ca0000b029013b976502b6so2346498wrw.2
        for <linux-nfc@lists.01.org>; Fri, 09 Jul 2021 20:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4JZOmZ3ruVXHUQ/EfkQl6lequMAP2bWoVroIwPpuLOM=;
        b=aLXgLDx855f7JcGrO5D0LsvwqxAGhslLUPHvjBcQop3UmHcXJprlBaT2lpbl93Evhc
         ZohUQz++qi2ncpUiF2rOUIyttLB1T8NxEVJHZHPEBGacQmxwE3TBghh1FrOvDO7cNsZU
         vdspa0pA7S42JFLNX6QJpKTVziYYeeL2FZ061JmmoUYdDo65DQxfgxkMPI+k4+KJvtO4
         M+ptB28dGTVN3P6sBNIgROq9OIVJZzfq+GqJKts9VcwUviNPVRRhMX6N5LByHLDWMhi0
         tWEMSDeAj5SrkchRYA6xfS0mTjpJUa2KvMhQtstQ/ClvJBkOwtj9227wM0PeXE5+Pauu
         KcfQ==
X-Gm-Message-State: AOAM533ZQpDD78Vi14qsXyjLX18VQkmPTl6WOBkTrd1A4BkCy0Qhcvct
	RYowmEPr0Ah5BENXnmXzH3+PHD/C9TnEu9rpZMiUPczOYVPWogKd6Ycax77fQ53Bwvel2/8PUhf
	r7L23khoWtlhqBVnZV6IJWuIfCrb4DirSMw==
X-Received: by 2002:a1c:7512:: with SMTP id o18mr13597544wmc.94.1625888362267;
        Fri, 09 Jul 2021 20:39:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSLzny5avDxQ20kgbThEp7bpOYZcCYi/t4+Y1w0aU/VkjG0LtLqGqMvedlpCZhgob0u2ZdYg==
X-Received: by 2002:a1c:7512:: with SMTP id o18mr13597539wmc.94.1625888362134;
        Fri, 09 Jul 2021 20:39:22 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id a12sm7444346wrh.26.2021.07.09.20.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 20:39:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sat, 10 Jul 2021 05:38:55 +0200
Message-Id: <20210710033859.3989-13-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
References: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: T3TOVK4TLPQMNHKWSRMLLQFGYT5QXKF6
X-Message-ID-Hash: T3TOVK4TLPQMNHKWSRMLLQFGYT5QXKF6
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 12/16] ndef: check UTF-16 text payload length
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/T3TOVK4TLPQMNHKWSRMLLQFGYT5QXKF6/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VVRGLTE2IGlzIHN1cHBvc2VkIHRvIGJlIGNvbnNpc3Rpbmcgb2YgMTYtYml0IGNvZGVzICgxNi1i
aXQgb3IgMngxNi1iaXQNCnBlciBjaGFyYWN0ZXIpIGFuZCBwYXJzaW5nIGFueXRoaW5nIGVsc2Ug
aXMgbm90IHNhZmUgYmVjYXVzZSBvZiBjYXN0IHRvDQpndW5pY2hhcjIuDQoNClNpZ25lZC1vZmYt
Ynk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNv
bT4NCi0tLQ0KIHNyYy9uZGVmLmMgICAgICAgICAgICAgfCAgNSArKysrKw0KIHVuaXQvdGVzdC1u
ZGVmLXBhcnNlLmMgfCAxOSArKysrKysrKysrKysrKysrKysrDQogMiBmaWxlcyBjaGFuZ2VkLCAy
NCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9zcmMvbmRlZi5jIGIvc3JjL25kZWYuYw0K
aW5kZXggM2Q4ODE1NjM0ZDQ2Li5mZGQ0NGI0NjcwMjcgMTAwNjQ0DQotLS0gYS9zcmMvbmRlZi5j
DQorKysgYi9zcmMvbmRlZi5jDQpAQCAtMTE4OSw2ICsxMTg5LDExIEBAIHBhcnNlX3RleHRfcGF5
bG9hZCh1aW50OF90ICpwYXlsb2FkLCB1aW50MzJfdCBsZW5ndGgpDQogDQogCWxlbiA9IGxlbmd0
aCAtIGxhbmdfbGVuZ3RoIC0gMTsNCiANCisJaWYgKHN0YXR1cyAmJiAobGVuICUgMikpIHsNCisJ
CURCRygiUGF5bG9hZCBub3QgdmFsaWQgVVRGLTE2IChsZW5ndGggJWQgZG9lcyBub3QgbWF0Y2gp
IiwgbGVuKTsNCisJCWdvdG8gZmFpbDsNCisJfQ0KKw0KIAlpZiAobGVuID4gMCkgew0KIAkJdHh0
ID0gKGNoYXIgKikocGF5bG9hZCArIG9mZnNldCk7DQogDQpkaWZmIC0tZ2l0IGEvdW5pdC90ZXN0
LW5kZWYtcGFyc2UuYyBiL3VuaXQvdGVzdC1uZGVmLXBhcnNlLmMNCmluZGV4IGQyNmY0YzU5NWQ5
YS4uNmM2MmM3YTkyOGM3IDEwMDY0NA0KLS0tIGEvdW5pdC90ZXN0LW5kZWYtcGFyc2UuYw0KKysr
IGIvdW5pdC90ZXN0LW5kZWYtcGFyc2UuYw0KQEAgLTE1MCw2ICsxNTAsMTUgQEAgc3RhdGljIHVp
bnQ4X3QgdGV4dFtdID0gezB4ZDEsIDB4MSwgMHgxMywgMHg1NCwgMHg1LCAweDY1LCAweDZlLCAw
eDJkLA0KIAkJCSAweDU1LCAweDUzLCAweDY4LCAweDY1LCAweDZjLCAweDZjLCAweDZmLCAweDIw
LCAweGM1LA0KIAkJCSAweGJjLCAweGMzLCAweGIzLCAweGM1LCAweDgyLCAweDc3fTsNCiANCisv
KiAnaGVsbG8gxbzDs8WCdycgLSBVVEYtMTYgLSBlbi1VUyBUZXh0IE5ERUYgVVRGLTE2IG1hbGZv
cm1lZCovDQorc3RhdGljIHVpbnQ4X3QgdGV4dF91dGYxNl9pbnZhbGlkW10gPSB7MHhkMSwgMHgx
LCAweDE5LCAweDU0LCAweDg1LA0KKwkJCS8qIGVuLVVTICovDQorCQkJMHg2NSwgMHg2ZSwgMHgy
ZCwgMHg1NSwgMHg1MywNCisJCQkvKiBoZWxsbyDFvMOzxYJ3ICovDQorCQkJMHg2OCwgMHgwMCwg
MHg2NSwgMHgwMCwgMHg2YywgMHgwMCwgMHg2YywgMHgwMCwgMHg2ZiwgMHgwMCwNCisJCQkvKiBN
aXNzaW5nIGxhc3QgYnl0ZSAqLw0KKwkJCTB4MjAsIDB4MDAsIDB4N2MsIDB4MDEsIDB4ZjMsIDB4
MDAsIDB4NDIsIDB4MDEsIDB4Nzd9Ow0KKw0KIC8qIFNtYXJ0IHBvc3RlciB3aXRoIGEgaHR0cDov
L2ludGVsLmNvbSBVUkkgcmVjb3JkICovDQogc3RhdGljIHVpbnQ4X3Qgc2luZ2xlX3NwW10gPSB7
MHhkMSwgMHgyLCAweGUsIDB4NTMsIDB4NzAsIDB4ZDEsIDB4MSwgMHhhLA0KIAkJCSAgICAgIDB4
NTUsIDB4MywgMHg2OSwgMHg2ZSwgMHg3NCwgMHg2NSwgMHg2YywgMHgyZSwNCkBAIC0yNTMsNiAr
MjYyLDE1IEBAIHN0YXRpYyB2b2lkIHRlc3RfbmRlZl90ZXh0KHZvaWQpDQogCXRlc3RfbmRlZl9m
cmVlX3JlY29yZChyZWNvcmQpOw0KIH0NCiANCitzdGF0aWMgdm9pZCB0ZXN0X25kZWZfdGV4dF9p
bnZhbGlkX3V0ZjE2KHZvaWQpDQorew0KKwlHTGlzdCAqcmVjb3JkczsNCisNCisJcmVjb3JkcyA9
IG5lYXJfbmRlZl9wYXJzZV9tc2codGV4dF91dGYxNl9pbnZhbGlkLCBzaXplb2YodGV4dF91dGYx
Nl9pbnZhbGlkKSwgTlVMTCk7DQorDQorCWdfYXNzZXJ0X251bGwocmVjb3Jkcyk7DQorfQ0KKw0K
IHN0YXRpYyB2b2lkIHRlc3RfbmRlZl9zaW5nbGVfc3Aodm9pZCkNCiB7DQogCUdMaXN0ICpyZWNv
cmRzOw0KQEAgLTQyMiw2ICs0NDAsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3Yp
DQogDQogCWdfdGVzdF9hZGRfZnVuYygiL3Rlc3ROREVGLXBhcnNlL1Rlc3QgVVJJIE5ERUYiLCB0
ZXN0X25kZWZfdXJpKTsNCiAJZ190ZXN0X2FkZF9mdW5jKCIvdGVzdE5ERUYtcGFyc2UvVGVzdCBU
ZXh0IE5ERUYiLCB0ZXN0X25kZWZfdGV4dCk7DQorCWdfdGVzdF9hZGRfZnVuYygiL3Rlc3ROREVG
LXBhcnNlL1Rlc3QgVGV4dCBOREVGIFVURi0xNiBtYWxmb3JtZWQiLCB0ZXN0X25kZWZfdGV4dF9p
bnZhbGlkX3V0ZjE2KTsNCiAJZ190ZXN0X2FkZF9mdW5jKCIvdGVzdE5ERUYtcGFyc2UvVGVzdCBT
aW5nbGUgcmVjb3JkIFNtYXJ0UG9zdGVyIE5ERUYiLA0KIAkJCQkJCQl0ZXN0X25kZWZfc2luZ2xl
X3NwKTsNCiAJZ190ZXN0X2FkZF9mdW5jKCIvdGVzdE5ERUYtcGFyc2UvVGVzdCBUaXRsZSByZWNv
cmQgU21hcnRQb3N0ZXIgTkRFRiIsDQotLSANCjIuMjcuMA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbmZjIG1haWxpbmcgbGlzdCAtLSBsaW51
eC1uZmNAbGlzdHMuMDEub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gbGludXgt
bmZjLWxlYXZlQGxpc3RzLjAxLm9yZwolKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClz
LyUoX2ludGVybmFsX25hbWUpcw==
