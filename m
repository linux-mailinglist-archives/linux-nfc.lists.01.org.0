Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 461AA3CD304
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:08:49 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 58FF5100EB855;
	Mon, 19 Jul 2021 04:08:45 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 859C5100EBBC4
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:43 -0700 (PDT)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 97F65408B5
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692922;
	bh=B9GvEaDiTlLvILOzMPmki87NIJrewhb1QYBR+1FcFIk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=MyS3Rov+eab7zLkBHgT043yX7JS5ZCy/cPr+u5docr2hJ5RZPwks0pAQMrzBD2MVX
	 Wz/bFKAZwaHKxwZVYK/ZWgYU6Q2NP8uz/amVQuEl4utchOy2WbDaNM8vw8nZl8CpXr
	 WE9Mpqcsr9487psK4UEBrYEUJRBgxCGrfGGTmTEBTAJnX5ZywPVhDK86/2Xtnoired
	 kTOdbmbiuMKFjOQj7D4sZnmUgvrS2UXNMcBgumxHOuJrmr5rsJdxk+1+LE5nj2WZnN
	 zpQ9vp6PV84jc2QLRjhd95L4HC640U7zbeWwCidx0Xbkvir95w5hb3hxAgFmy+QbKk
	 7u5c9Yw2qfpGA==
Received: by mail-lj1-f199.google.com with SMTP id j2-20020a2e6e020000b02900f2f75a122aso9282556ljc.19
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B9GvEaDiTlLvILOzMPmki87NIJrewhb1QYBR+1FcFIk=;
        b=KmIDW1uIgX0VG0COguoU9eSj/uBo45v5/wm40sQd9JLIopBxni2EHPH1TriOPlbUY/
         YhdUK+9T2QStdjDntiX/hifUrjKLVH8c1Fim7BQlAJfm3nv/pLmsM65N+Kogqf76RK0q
         h+nP1fnRmyZFA83WkOi93j8ztdJ//JwtYu2h0VIRfWo2nXXWiubgH1t85ggZ4Jv40+Zm
         V+X/KxN6nF0YvHFEg2iG6pMqohmWQDIWEXjbO94DYNQ3d/VVbINQtorzrXTwuEU6aNOo
         iRu+SP0L4vrBdY+nOK9m/TGqYTWrKxzsroyfODwcusZFeL4D/901isMRea4vgp+J+0En
         sUbw==
X-Gm-Message-State: AOAM533nmkd/75gmhNZd5AWtKRGwaD9l5wrnVyvVkebD0NPuXMgKJwuw
	sRbig9Kj9orsYSF6RgXg+CVBZ6Ur8b5ZfwHRoO/YYrPMguNumIYLSTdRy12CTHjFZhiFRlxi43T
	/YQDDpKnWl5CfsfGffKp0hxXWpoA617eEyQ==
X-Received: by 2002:a2e:700f:: with SMTP id l15mr21652238ljc.149.1626692921895;
        Mon, 19 Jul 2021 04:08:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4a8yMPOGH8zmrZTvHvIm7Bqz3pSuRIGlvB5qnFABrw5W0UWrErzHYAfsKaLh4yZMnkueeMQ==
X-Received: by 2002:a2e:700f:: with SMTP id l15mr21652224ljc.149.1626692921743;
        Mon, 19 Jul 2021 04:08:41 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:08:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:13 +0200
Message-Id: <20210719110819.27340-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: NDIAG7DTBRHVHLK55UJYSNXHFWU6R5CH
X-Message-ID-Hash: NDIAG7DTBRHVHLK55UJYSNXHFWU6R5CH
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 07/73] nfctool: fix nfctool_print_and_remove_snl() cast-function-type
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/NDIAG7DTBRHVHLK55UJYSNXHFWU6R5CH/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Rml4IG9uIEdDQyB2MTA6DQoNCiAgICB0b29scy9uZmN0b29sL21haW4uYzogSW4gZnVuY3Rpb24g
4oCYbmZjdG9vbF9zbmxfY2LigJk6DQogICAgdG9vbHMvbmZjdG9vbC9tYWluLmM6MzUyOjMwOiBl
cnJvcjogY2FzdCBiZXR3ZWVuIGluY29tcGF0aWJsZSBmdW5jdGlvbiB0eXBlcyBmcm9tIOKAmHZv
aWQgKCopKHN0cnVjdCBuZmNfc25sICosIGd1aW50MzIp4oCZIHtha2Eg4oCYdm9pZCAoKikoc3Ry
dWN0IG5mY19zbmwgKiwgdW5zaWduZWQgaW50KeKAmX0gdG8g4oCYdm9pZCAoKikodm9pZCAqLCB2
b2lkICop4oCZIFstV2Vycm9yPWNhc3QtZnVuY3Rpb24tdHlwZV0NCiAgICAgIDM1MiB8ICBnX3Ns
aXN0X2ZvcmVhY2goc2RyZXNfbGlzdCwgKEdGdW5jKW5mY3Rvb2xfcHJpbnRfYW5kX3JlbW92ZV9z
bmwsDQogICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4NCg0KU2lnbmVk
LW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBjYW5vbmlj
YWwuY29tPg0KLS0tDQogdG9vbHMvbmZjdG9vbC9tYWluLmMgfCA0ICsrLS0NCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvdG9v
bHMvbmZjdG9vbC9tYWluLmMgYi90b29scy9uZmN0b29sL21haW4uYw0KaW5kZXggMjgyZGY1MTlm
Y2M4Li43MmEzOWRlM2NjYmYgMTAwNjQ0DQotLS0gYS90b29scy9uZmN0b29sL21haW4uYw0KKysr
IGIvdG9vbHMvbmZjdG9vbC9tYWluLmMNCkBAIC0zMjUsMTMgKzMyNSwxMyBAQCBzdGF0aWMgaW50
IG5mY3Rvb2xfcG9sbF9jYihndWludDggY21kLCBndWludDMyIGlkeCwgZ3BvaW50ZXIgZGF0YSkN
CiB9DQogDQogc3RhdGljIHZvaWQgbmZjdG9vbF9wcmludF9hbmRfcmVtb3ZlX3NubChzdHJ1Y3Qg
bmZjX3NubCAqc2RyZXMsDQotCQkJCQkgZ3VpbnQzMiBhZGFwdGVyX2lkeCkNCisJCQkJCSBncG9p
bnRlciBhZGFwdGVyX2lkeCkNCiB7DQogCUdTTGlzdCAqZWxlbTsNCiANCiAJcHJpbnRmKCIgdXJp
OiAlcyAtIHNhcDogJWRcbiIsIHNkcmVzLT51cmksIHNkcmVzLT5zYXApOw0KIA0KLQlpZiAoYWRh
cHRlcl9pZHggPT0gb3B0cy5hZGFwdGVyX2lkeCkgew0KKwlpZiAoR1BPSU5URVJfVE9fVUlOVChh
ZGFwdGVyX2lkeCkgPT0gb3B0cy5hZGFwdGVyX2lkeCkgew0KIAkJZWxlbSA9IGdfc2xpc3RfZmlu
ZF9jdXN0b20ob3B0cy5zbmxfbGlzdCwgc2RyZXMtPnVyaSwNCiAJCQkJCSAgIChHQ29tcGFyZUZ1
bmMpZ19zdHJjbXAwKTsNCiANCi0tIA0KMi4yNy4wDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1uZmMgbWFpbGluZyBsaXN0IC0tIGxpbnV4LW5m
Y0BsaXN0cy4wMS5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBsaW51eC1uZmMt
bGVhdmVAbGlzdHMuMDEub3JnCiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShf
aW50ZXJuYWxfbmFtZSlz
