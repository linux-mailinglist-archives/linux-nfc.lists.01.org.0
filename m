Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F8D3CD333
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:40 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E16EE100F2257;
	Mon, 19 Jul 2021 04:09:38 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id F344D100F226E
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:36 -0700 (PDT)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 0E6F24060A
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692976;
	bh=RRLhwcdP3WtrDlOojSxiSSpew2cu6wAZlXa7rdvn210=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=uvlWu1+fXb1pSRpo3kyHmjpFGZprZf+DYSx3kTNhULvvK9szDE3EqXrXDJxqBya6r
	 IdiHTAWAp86xr5gPSGWPqqjB1C+n5A9895O7GzBd6ARjfd9choqv12fVq1EoM6fpSz
	 AKKILvp3IGeKxPHZ57V0E7t8S8SBWYkPF06hOVghK5CSmHFlZXKDPPOWSES5uFtYgH
	 lYs3MkubiLNrbCJb+PG6zhgHwMAeNYWNaKblANgKcfEOFVCAdNlRFspN8VP9pgeLZt
	 MMsIwdB7kM9TtAQLL6XjoLXcNPzZGI8Nm//ExuHKMJBUuiCHL2hSinwJpwxGGfCIEH
	 GjbbUyb8dvNSQ==
Received: by mail-lj1-f198.google.com with SMTP id 1-20020a2e0d010000b029015d8fce4f1bso9265757ljn.17
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RRLhwcdP3WtrDlOojSxiSSpew2cu6wAZlXa7rdvn210=;
        b=QBKwGhTUQoUS4gkxQI8hrkDoX6VY2jY+VvF6D39tDIrWujK6VMDVwNrxLWrSm9f1SM
         Fz4BNjplDj2HiZ8GcBMFugvBz7vFh/Quv4AhLuPEpsBBJfvwkllWKnLq+RttHNAoS7GM
         TJX94EEJf1yD3h7NAhAOJAJBJI+ufBBz+hLQ8VnTQdYKjd53cm26SavSJvktV/TxGOWS
         PR8q9ykY8tTXv8g2us7UpJSpKATYqjME+VN8gTo95o3DOqqTS83WYGfiL8XRhVHfv5l8
         yf2v6fg51Kq0XH+feRgGuMi5YJ1jP/ZdRN2c8nTUSQu94PpqPpVf+CVesTYHzXugjLK0
         JmsA==
X-Gm-Message-State: AOAM533lifn3rm9WrlKzJPRKA8J5EpfUaDT+mM+d2nWvCZZNP6YI3OfC
	zUHdld2SmfKCcO3hWZKMH4/F6gpB6lCzuH9fdxRlhamd52dzLmRG4jzE/aTO6hPJ8kA7NVcEGWC
	C3LVzaEOO0jmhv87p8bkZtwB3khQi+nkVAw==
X-Received: by 2002:a05:6512:2091:: with SMTP id t17mr17709415lfr.60.1626692975271;
        Mon, 19 Jul 2021 04:09:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSg0SaX8KnJcx7fVOcNo8PPzSsPQhciX9W2QQAZMwA3pHH95DUTm/3tTmlSs38ThnMC1jtJA==
X-Received: by 2002:a05:6512:2091:: with SMTP id t17mr17709401lfr.60.1626692975009;
        Mon, 19 Jul 2021 04:09:35 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:58 +0200
Message-Id: <20210719110819.27340-53-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: YGB5S5Y5P7Y7MDSSWAH5FL7C3S4HRZGX
X-Message-ID-Hash: YGB5S5Y5P7Y7MDSSWAH5FL7C3S4HRZGX
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 52/73] unit: do not shadow global 'uri' variable (-Wshadow)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/YGB5S5Y5P7Y7MDSSWAH5FL7C3S4HRZGX/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Rml4IC1Xc2hhZG93IHdhcm5pbmdzIGxpa2U6DQoNCiAgICB1bml0L3Rlc3QtbmRlZi1wYXJzZS5j
OiBJbiBmdW5jdGlvbiDigJh0ZXN0X25kZWZfc2luZ2xlX3Nw4oCZOg0KICAgIHVuaXQvdGVzdC1u
ZGVmLXBhcnNlLmM6MjkxOjMyOiBlcnJvcjogZGVjbGFyYXRpb24gb2Yg4oCYdXJp4oCZIHNoYWRv
d3MgYSBnbG9iYWwgZGVjbGFyYXRpb24gWy1XZXJyb3I9c2hhZG93XQ0KICAgICAgMjkxIHwgIHN0
cnVjdCBuZWFyX25kZWZfdXJpX3BheWxvYWQgKnVyaTsNCiAgICAgICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBefn4NCiAgICB1bml0L3Rlc3QtbmRlZi1wYXJzZS5jOjE0NTox
Njogbm90ZTogc2hhZG93ZWQgZGVjbGFyYXRpb24gaXMgaGVyZQ0KICAgICAgMTQ1IHwgc3RhdGlj
IHVpbnQ4X3QgdXJpW10gPSB7MHhkMSwgMHgxLCAweGEsIDB4NTUsIDB4MSwgMHg2OSwgMHg2ZSwg
MHg3NCwNCiAgICAgICAgICB8ICAgICAgICAgICAgICAgIF5+fg0KDQpTaWduZWQtb2ZmLWJ5OiBL
cnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGNhbm9uaWNhbC5jb20+DQot
LS0NCiB1bml0L3Rlc3QtbmRlZi1wYXJzZS5jIHwgNCArKy0tDQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL3VuaXQvdGVzdC1u
ZGVmLXBhcnNlLmMgYi91bml0L3Rlc3QtbmRlZi1wYXJzZS5jDQppbmRleCA2N2RlM2YyZTc3YmQu
LmY4YjNiN2JlM2E0YyAxMDA2NDQNCi0tLSBhL3VuaXQvdGVzdC1uZGVmLXBhcnNlLmMNCisrKyBi
L3VuaXQvdGVzdC1uZGVmLXBhcnNlLmMNCkBAIC0xNDIsNyArMTQyLDcgQEAgc3RydWN0IG5lYXJf
bmRlZl9hY19wYXlsb2FkIHsNCiB9Ow0KIA0KIC8qIGh0dHA6Ly93d3cuaW50ZWwuY29tIFVSSSBO
REVGICovDQotc3RhdGljIHVpbnQ4X3QgdXJpW10gPSB7MHhkMSwgMHgxLCAweGEsIDB4NTUsIDB4
MSwgMHg2OSwgMHg2ZSwgMHg3NCwNCitzdGF0aWMgdWludDhfdCB0ZXN0X3VyaVtdID0gezB4ZDEs
IDB4MSwgMHhhLCAweDU1LCAweDEsIDB4NjksIDB4NmUsIDB4NzQsDQogCQkJMHg2NSwgMHg2Yywg
MHgyZSwgMHg2MywgMHg2ZiwgMHg2ZH07DQogDQogLyogJ2hlbGxvIMW8w7PFgncnIC0gVVRGLTgg
LSBlbi1VUyBUZXh0IE5ERUYgKi8NCkBAIC0yMDMsNyArMjAzLDcgQEAgc3RhdGljIHZvaWQgdGVz
dF9uZGVmX3VyaSh2b2lkKQ0KIAlHTGlzdCAqcmVjb3JkczsNCiAJc3RydWN0IG5lYXJfbmRlZl9y
ZWNvcmQgKnJlY29yZDsNCiANCi0JcmVjb3JkcyA9IG5lYXJfbmRlZl9wYXJzZV9tc2codXJpLCBz
aXplb2YodXJpKSwgTlVMTCk7DQorCXJlY29yZHMgPSBuZWFyX25kZWZfcGFyc2VfbXNnKHRlc3Rf
dXJpLCBzaXplb2YodGVzdF91cmkpLCBOVUxMKTsNCiANCiAJZ19hc3NlcnQocmVjb3Jkcyk7DQog
CWdfYXNzZXJ0X2NtcHVpbnQoZ19saXN0X2xlbmd0aChyZWNvcmRzKSwgPT0sIDEpOw0KLS0gDQoy
LjI3LjANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW5mYyBtYWlsaW5nIGxpc3QgLS0gbGludXgtbmZjQGxpc3RzLjAxLm9yZwpUbyB1bnN1YnNj
cmliZSBzZW5kIGFuIGVtYWlsIHRvIGxpbnV4LW5mYy1sZWF2ZUBsaXN0cy4wMS5vcmcKJSh3ZWJf
cGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM=
