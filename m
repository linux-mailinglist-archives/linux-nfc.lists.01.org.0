Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4A73CD308
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:08:53 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id B2441100EB85D;
	Mon, 19 Jul 2021 04:08:50 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 4D62F100EB85F
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:48 -0700 (PDT)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 3DB69408B5
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692927;
	bh=Cd7mrOYX4go98WFmpd1UhHw4fx3lifzjGna7LwARHwY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hxA1O61jwVah6W9ipe7g6Ed694POOIT4jaXeVB7U0fzGAkUEjrmb18AoHzKKbQjGF
	 Z104Oeu5OryFgE4bmgMJStu+5ka8y0MNy0w+t8hDIIWrLQGwYiZNd+RrTpk6OW05Oa
	 8P49ikdjQQtmMILUIkR4qNcdLQ3FSPW0b1KuGDlhRp6UWkMk5/I2/igdS9vfRKDTLd
	 SJY7+mu2o1xlwXPcjR0n0oKTzoPGefUMcVUdg6N2wHDMQwgC6dFAeLUuKNvdtPGhZa
	 LP/xjBWEjVsLQbZ48hprg+TZMmgFG49a5xPdljjiIsIrTyHplOSVhN5S9JwOyh2MmH
	 SEj4BKOu0UDvQ==
Received: by mail-lj1-f198.google.com with SMTP id y11-20020a2eb00b0000b0290194aa1ae3efso5325766ljk.18
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cd7mrOYX4go98WFmpd1UhHw4fx3lifzjGna7LwARHwY=;
        b=S5L4Z50YHyQpRtW40jLChNWqMHKUNefB7DqbuAyQyIVXl0kjNqneS3/PZCVvZSOhEa
         DbEbaopM+X0P16LJpFn3pGT+mfsmDhCToTGUSAvlcAoWvwepy6r6JP4v0GT+ucWVgJuk
         TVPinmuvZu4CIvD28laFbmeCUNRuEkQEmGMsWvjTXlDVsADFRsowSJyxcT0WV1XhvEyk
         w1O9mJr1kmjopEBex0fubP5gX1+aIYeBsHbi9TJ58Y+JSjYO5Bq0hNHd4Ul2CHcrzhPH
         mI/ZtHYOmmmDyYL8/N5DcTF3qMX3pOKrFa3IX6Z2scPlnizBHNsgEg6xK/vyoh0Zi65S
         lgWw==
X-Gm-Message-State: AOAM533JY+CkP5dxD7FrjSnuf1RFZM0mADy60gbPC6YHcaOYb3CHwN8j
	mCJkks885E3xHCNcPKjwVNkqTFMofX/bzF2NPfjDdJBQImAnfVYi9ZYpfUM01Y/WLL5KnuLU3I4
	q8tg2Scf2EYOtPyeaU7ds4UF+wd/8x2sBBg==
X-Received: by 2002:a2e:5810:: with SMTP id m16mr22019769ljb.323.1626692926529;
        Mon, 19 Jul 2021 04:08:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZrUWdDsuEiwO7UEFac13gTph8xfwsviBFK+SSsxARdDHcf1feoXQmbUghWPzLH/q86eJkoA==
X-Received: by 2002:a2e:5810:: with SMTP id m16mr22019766ljb.323.1626692926383;
        Mon, 19 Jul 2021 04:08:46 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:08:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:17 +0200
Message-Id: <20210719110819.27340-12-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: XNRPBA43AL72NAU5F6W7WQC2WOP2QABP
X-Message-ID-Hash: XNRPBA43AL72NAU5F6W7WQC2WOP2QABP
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 11/73] unit: pass real UTF-8 for testing text NDEF
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/XNRPBA43AL72NAU5F6W7WQC2WOP2QABP/>
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
