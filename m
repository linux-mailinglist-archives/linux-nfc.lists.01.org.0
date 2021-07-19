Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 870573CD301
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:08:45 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 20516100EBB98;
	Mon, 19 Jul 2021 04:08:42 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 5B9ED100EB82A
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:40 -0700 (PDT)
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 4A65C40325
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692919;
	bh=lOZstt18Brm/klEhpjYL1UIdT7sEoAw51ckF8rGQwrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oF99xeirZcX4pnUcuYOM55B2o6YwC0xRd79gYBi8Hw0wELk3XVm8rKrkK88JvP/Ly
	 H2zR+9fcxS+sPligdtkNwckmahh9ctl2MqF6cQv2i06v67e76R8GR1pST6UaL1hRhr
	 emw/P2sHjzxYWT+KOzkW39dKAgSOWny+4fb2Pb09FX7x/uupsfOa4h1zEnXIYHfzhQ
	 9YHcHDZOaSZ/uKXdssuLgKx56btxcBveIx5pFL5GdKiTQPBH7U5DUgvDdOrsjfufJh
	 8hBxAG0qp/VoogBEE1eAy3xMWi2BDpd7AEDAkxfo3dI/eyqe5PgDs+uWPNOX2uajpt
	 u7R1Z6GZan5YA==
Received: by mail-lj1-f200.google.com with SMTP id q64-20020a2e5c430000b02901864030a0ecso9370022ljb.2
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lOZstt18Brm/klEhpjYL1UIdT7sEoAw51ckF8rGQwrQ=;
        b=LBs8/g1Sq72+gmS5U/YmkGz3e3uhK+4PGBhgQt0O3CM/vS6TyEMHGt78K9TyYW/MC7
         c/megSOBGfkOQ2giZKQEyycBJKiZag4hgo0wmnXJ6De47YoYhgKSxc24U0OyK6CkJv6l
         Wdh0EIYR61PcSf6Xie+sdrSKpxwVItxgGTI9UrmB6kGumzGlJ+UVx8nLIu0E+CgmJ1k6
         FV6Y0WOnhaTEA2OhQQ1Ra57eyPSLgNkTEhhk7W19iQkiUiu6XDAPy6UkJL+RST1sJKh/
         KuowfBEhNuijd14ZX7haPYuOAvigAVkV/c4vw4XaLxB53C79M77pLwoZ6UaDhHiNDPQ6
         xG8g==
X-Gm-Message-State: AOAM533sA4Nobp9ktA5PC1B8if/gDo7OxXrBclgViJ6h0DyWeVCk/nFX
	4h/vLVuPoB5HSOMkZq3869pj1D+vKk3VKJSBtH90JCEvfDPb9sa22f52QVqPHX0eoNg9TpD2rEu
	ArQXm2KJYCcXVhKzGwlnqXLblBr6w8LKjYg==
X-Received: by 2002:a2e:a793:: with SMTP id c19mr11126054ljf.426.1626692918567;
        Mon, 19 Jul 2021 04:08:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4tipzVuGTsYqNbRM/WzxiRK4If5iUTxeBiYGThNr+ycHpOw4bI3oAzoFHDKIORWe0OE3yng==
X-Received: by 2002:a2e:a793:: with SMTP id c19mr11126043ljf.426.1626692918431;
        Mon, 19 Jul 2021 04:08:38 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:08:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:10 +0200
Message-Id: <20210719110819.27340-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: FBFWOGIGELFVQUW7ISEYI7LYWRVK6553
X-Message-ID-Hash: FBFWOGIGELFVQUW7ISEYI7LYWRVK6553
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 04/73] nfctool: fix adapter_print_info() cast-function-type
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/FBFWOGIGELFVQUW7ISEYI7LYWRVK6553/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Rml4IG9uIEdDQyB2MTA6DQoNCiAgICB0b29scy9uZmN0b29sL2FkYXB0ZXIuYzogSW4gZnVuY3Rp
b24g4oCYYWRhcHRlcl9pZHhfcHJpbnRfaW5mb+KAmToNCiAgICB0b29scy9uZmN0b29sL2FkYXB0
ZXIuYzoxMzk6Mjk6IGVycm9yOiBjYXN0IGJldHdlZW4gaW5jb21wYXRpYmxlIGZ1bmN0aW9uIHR5
cGVzIGZyb20g4oCYdm9pZCAoKikoc3RydWN0IG5mY19hZGFwdGVyICop4oCZIHRvIOKAmHZvaWQg
KCopKHZvaWQgKiwgdm9pZCAqKeKAmSBbLVdlcnJvcj1jYXN0LWZ1bmN0aW9uLXR5cGVdDQogICAg
ICAxMzkgfCAgIGdfc2xpc3RfZm9yZWFjaChhZGFwdGVycywgKEdGdW5jKWFkYXB0ZXJfcHJpbnRf
aW5mbywgTlVMTCk7DQogICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXg0K
DQpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tp
QGNhbm9uaWNhbC5jb20+DQotLS0NCiB0b29scy9uZmN0b29sL2FkYXB0ZXIuYyB8IDQgKystLQ0K
IHRvb2xzL25mY3Rvb2wvYWRhcHRlci5oIHwgMiArLQ0KIHRvb2xzL25mY3Rvb2wvbWFpbi5jICAg
IHwgMiArLQ0KIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQ0KDQpkaWZmIC0tZ2l0IGEvdG9vbHMvbmZjdG9vbC9hZGFwdGVyLmMgYi90b29scy9uZmN0b29s
L2FkYXB0ZXIuYw0KaW5kZXggNDUzYzJjMDk5MDA5Li41ZTNiZjQxODg0ZDEgMTAwNjQ0DQotLS0g
YS90b29scy9uZmN0b29sL2FkYXB0ZXIuYw0KKysrIGIvdG9vbHMvbmZjdG9vbC9hZGFwdGVyLmMN
CkBAIC03OCw3ICs3OCw3IEBAIHZvaWQgYWRwYXRlcl9wcmludF90YXJnZXRzKHN0cnVjdCBuZmNf
YWRhcHRlciAqYWRhcHRlciwgZ2NoYXIgKnByZWZpeCkNCiAJcHJpbnRmKCJdXG4iKTsNCiB9DQog
DQotdm9pZCBhZGFwdGVyX3ByaW50X2luZm8oc3RydWN0IG5mY19hZGFwdGVyICphZGFwdGVyKQ0K
K3ZvaWQgYWRhcHRlcl9wcmludF9pbmZvKHN0cnVjdCBuZmNfYWRhcHRlciAqYWRhcHRlciwgZ3Bv
aW50ZXIgdXNlcl9kYXRhKQ0KIHsNCiAJZ2NoYXIgKnJmX21vZGVfc3RyOw0KIA0KQEAgLTEzNCw3
ICsxMzQsNyBAQCB2b2lkIGFkYXB0ZXJfcHJpbnRfaW5mbyhzdHJ1Y3QgbmZjX2FkYXB0ZXIgKmFk
YXB0ZXIpDQogdm9pZCBhZGFwdGVyX2lkeF9wcmludF9pbmZvKGd1aW50MzIgaWR4KQ0KIHsNCiAJ
aWYgKGlkeCAhPSBJTlZBTElEX0FEQVBURVJfSURYKQ0KLQkJYWRhcHRlcl9wcmludF9pbmZvKGFk
YXB0ZXJfZ2V0KGlkeCkpOw0KKwkJYWRhcHRlcl9wcmludF9pbmZvKGFkYXB0ZXJfZ2V0KGlkeCks
IE5VTEwpOw0KIAllbHNlDQogCQlnX3NsaXN0X2ZvcmVhY2goYWRhcHRlcnMsIChHRnVuYylhZGFw
dGVyX3ByaW50X2luZm8sIE5VTEwpOw0KIH0NCmRpZmYgLS1naXQgYS90b29scy9uZmN0b29sL2Fk
YXB0ZXIuaCBiL3Rvb2xzL25mY3Rvb2wvYWRhcHRlci5oDQppbmRleCBjMjJkZWQ4YmEzNGQuLmQy
NzA3Y2ExYzEwNyAxMDA2NDQNCi0tLSBhL3Rvb2xzL25mY3Rvb2wvYWRhcHRlci5oDQorKysgYi90
b29scy9uZmN0b29sL2FkYXB0ZXIuaA0KQEAgLTUyLDcgKzUyLDcgQEAgaW50IGFkYXB0ZXJfYWxs
X2dldF9kZXZpY2VzKHZvaWQpOw0KIA0KIHZvaWQgYWRhcHRlcl9pZHhfcHJpbnRfaW5mbyhndWlu
dDMyIGlkeCk7DQogDQotdm9pZCBhZGFwdGVyX3ByaW50X2luZm8oc3RydWN0IG5mY19hZGFwdGVy
ICphZGFwdGVyKTsNCit2b2lkIGFkYXB0ZXJfcHJpbnRfaW5mbyhzdHJ1Y3QgbmZjX2FkYXB0ZXIg
KmFkYXB0ZXIsIGdwb2ludGVyIHVzZXJfZGF0YSk7DQogDQogdm9pZCBhZHBhdGVyX3ByaW50X3Rh
cmdldHMoc3RydWN0IG5mY19hZGFwdGVyICphZGFwdGVyLCBnY2hhciAqcHJlZml4KTsNCiANCmRp
ZmYgLS1naXQgYS90b29scy9uZmN0b29sL21haW4uYyBiL3Rvb2xzL25mY3Rvb2wvbWFpbi5jDQpp
bmRleCBjOWEyMzZmZTQxMjIuLmM0OGJmMDkxOTY1NyAxMDA2NDQNCi0tLSBhL3Rvb2xzL25mY3Rv
b2wvbWFpbi5jDQorKysgYi90b29scy9uZmN0b29sL21haW4uYw0KQEAgLTExOCw3ICsxMTgsNyBA
QCBzdGF0aWMgaW50IG5mY3Rvb2xfc2V0X3BhcmFtcyh2b2lkKQ0KIA0KIAlubF9nZXRfcGFyYW1z
KGFkYXB0ZXIpOw0KIA0KLQlhZGFwdGVyX3ByaW50X2luZm8oYWRhcHRlcik7DQorCWFkYXB0ZXJf
cHJpbnRfaW5mbyhhZGFwdGVyLCBOVUxMKTsNCiANCiBleGl0Og0KIAlyZXR1cm4gZXJyOw0KLS0g
DQoyLjI3LjANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW5mYyBtYWlsaW5nIGxpc3QgLS0gbGludXgtbmZjQGxpc3RzLjAxLm9yZwpUbyB1bnN1
YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGxpbnV4LW5mYy1sZWF2ZUBsaXN0cy4wMS5vcmcKJSh3
ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM=
