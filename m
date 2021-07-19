Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C2D3CD309
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:08:54 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id C6FB6100EBB98;
	Mon, 19 Jul 2021 04:08:51 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 5C6D7100EB848
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:49 -0700 (PDT)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 53DFA40624
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692928;
	bh=4JZOmZ3ruVXHUQ/EfkQl6lequMAP2bWoVroIwPpuLOM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=evIw/kUjPKrobQyVCc48SVaFNgyZIKfh2TCGBTN//KInlF3Mzc5dzgv5jDl832bHr
	 LwibFdoLBuEy40fOHzyyveokzSH8xgIEophBpQtf7YURe2+iFbCnRLF7Hr8Z8Xol9C
	 6VhnlBzRdNl2Gc3FUmv7yPlWxzPGxnLq2Tu1NsEBfn+kLUeEF+Rjrd04wxjK8GuJz6
	 k+1eCiD0DzIEyOAqH3jVIPCiX9hUW7ZlwoP6emYJ6LKkaGwgOdHIcJvK43MD3DIsqS
	 sD6xtJa779FPVyt8jDWHT0KxqmwPSM98vWSgiQ/+T4fl6LrwGemYQH7DGg0Nu8X6pt
	 i2ur9I0qU+H1Q==
Received: by mail-lj1-f199.google.com with SMTP id y11-20020a2eb00b0000b0290194aa1ae3efso5325783ljk.18
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4JZOmZ3ruVXHUQ/EfkQl6lequMAP2bWoVroIwPpuLOM=;
        b=Ulh0YmxfurnlgcrNb2sq/xDcsjNunvFyMsQu5XoYe/TNnfBw5B5Hq2LV/REU59cGB6
         iWXhen3HNRCJSVlRUgJGTRPlJVikNnlO/ykyvwuD7P5HiSuR4BwsanzFyeNFm420PlR/
         vBQsv4BKEjll4oznvZcm7mbybwdhwhDdUpqp9SRHHkb7IIo4+L/DuQZk+9ho+ZiHRNbj
         IGK4oPHnCcZAfC0tFzE04cMb7SyfSKmxQ1jA6h4UFTsmK0lRroJDVWrMKyJKPTESrWEm
         ZNmn9pt5Ay78SwCpSWcHfQLVEuaAdWRWjhMh6uVd/Q/vruU92gqu2QilMY24ctRQD+Nn
         xiwQ==
X-Gm-Message-State: AOAM5331nlXmfvHi1uCOyuX4XlkMqFMpMAZ29LwQQY/DuvkP4bN7qbwR
	5lRxx2gjG1QUyFskFwjWy1kI7LhmqxxM9jvizSu490Oxk33ZJY0ewuEE5yHnciIsLmSiDjql7ai
	9ejHtCtsXi+Vny4nSUdHPM/kKDlnPdpoB/w==
X-Received: by 2002:a2e:2ac5:: with SMTP id q188mr5863826ljq.168.1626692927622;
        Mon, 19 Jul 2021 04:08:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7n5jvpZZBbs0kLTXW5/AV2uBBYUlTe3BB4uheEAcUM3RDG8KhQSibyFMltjgwvxruElAsbw==
X-Received: by 2002:a2e:2ac5:: with SMTP id q188mr5863815ljq.168.1626692927453;
        Mon, 19 Jul 2021 04:08:47 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:08:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:18 +0200
Message-Id: <20210719110819.27340-13-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 62MEIR7UX6ARKJ7X7SHVX7KYTGJ2LHF7
X-Message-ID-Hash: 62MEIR7UX6ARKJ7X7SHVX7KYTGJ2LHF7
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 12/73] ndef: check UTF-16 text payload length
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/62MEIR7UX6ARKJ7X7SHVX7KYTGJ2LHF7/>
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
