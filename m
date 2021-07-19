Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 768203CD332
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:39 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id CECEF100EAB44;
	Mon, 19 Jul 2021 04:09:36 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id CE1F4100EAB47
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:35 -0700 (PDT)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id CF5C040334
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692974;
	bh=B704Yz43njya+Pq6ylacDggykhnxRhUkAy01ztceY6w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=eCt7waSi1m3k1qgWPlCn197+ERXMxXsB5loRupOIVSa/1VqSRMY87WHbb/HPc/RFA
	 agJzZ+jFtfzcMgdqeFEyMxpXGogz8Y5PVC02ie34TvTWTHzTgYp810vaHPZTGiSb2Y
	 wX6FH2uBnaPBzFyPxBJ4tW7UNslXd19+WCOYBGvElQvBmsLzLSXPOZBL2g60dPrvrb
	 qt0FH/vLoca3NM8r4t9+fAX1Y9W4aw+81h6Z2uT0frMN/9pKaSy/hor026UOCaOLSK
	 u8EbDR6ZxKwvVEiOGmU23MIm6ho/aCV7AcGNnJ+O9O/8SCwsEZolCyc+t/dpbboXhO
	 VVMKToTwYBfcg==
Received: by mail-lf1-f71.google.com with SMTP id l20-20020a19c2140000b029037ad1141c33so3268935lfc.8
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B704Yz43njya+Pq6ylacDggykhnxRhUkAy01ztceY6w=;
        b=lwNYqld1RIrGYzMnH9Ty9VwmGe/iw9pn5/3xjzw4oPX2PibRdAy36Gs6BnzdmPU0j0
         5cn4UWxk31sszahwq/8a+1tQ4tPSj72CVwWsteEGMedzgWPocm6nUIsU+kBLn/OIX/6O
         kZkXurcBw4RwnIvx0nwtbvQH46Wo3G19UN4tLe8RoGy0J7skefH/X+PMC9dzJGqs57YT
         /0ce6kNIqmFEFzjJR9Bbt/krl6SGzIFLPncsrP05JWyToxtGP6jxpqI7RH5HHVh1zBUe
         kdATo/0NeyFC3LD7u8lhsDa31AFVgZ8hWasCBTjVh5K28yLiIsejamLVs+0peaYzDOBE
         H6NQ==
X-Gm-Message-State: AOAM530VvjHDowWc/JfVqne3pk1YCNobEWLu+dAwFu+p/sJlb/qfxp+d
	7NWVWZRdMmMdZ7jtUEpLrE+ERo79IrUZyovLW0tXCwIo4Kl97xXORdq8YEAZMnJXgoVgT/OhHek
	yu47y8cp4MXjHgcA0EzjhKhu28o8hQJqtug==
X-Received: by 2002:a2e:a793:: with SMTP id c19mr11128942ljf.426.1626692974102;
        Mon, 19 Jul 2021 04:09:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzj7ga56YnkjzTbWxOapzWLGBBhPUmWZTZhV1xJ54TDmI14qbvgRHrA1Ai4Urd0kUsbr24AOA==
X-Received: by 2002:a2e:a793:: with SMTP id c19mr11128933ljf.426.1626692973947;
        Mon, 19 Jul 2021 04:09:33 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:57 +0200
Message-Id: <20210719110819.27340-52-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 6THL7B56OD5VW45SMYLJI7XRTC4T6CBN
X-Message-ID-Hash: 6THL7B56OD5VW45SMYLJI7XRTC4T6CBN
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 51/73] unit: do not shadow global 'text' variable (-Wshadow)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/6THL7B56OD5VW45SMYLJI7XRTC4T6CBN/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Rml4IC1Xc2hhZG93IHdhcm5pbmc6DQoNCnVuaXQvdGVzdC1uZGVmLXBhcnNlLmM6IEluIGZ1bmN0
aW9uIOKAmHRlc3RfbmRlZl90aXRsZV9zcOKAmToNCnVuaXQvdGVzdC1uZGVmLXBhcnNlLmM6MTk0
OjMzOiBlcnJvcjogZGVjbGFyYXRpb24gb2Yg4oCYdGV4dOKAmSBzaGFkb3dzIGEgZ2xvYmFsIGRl
Y2xhcmF0aW9uIFstV2Vycm9yPXNoYWRvd10NCiAgMTk0IHwgIHN0cnVjdCBuZWFyX25kZWZfdGV4
dF9wYXlsb2FkICp0ZXh0Ow0KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF5+fn4NCnVuaXQvdGVzdC1uZGVmLXBhcnNlLmM6NDI6MTY6IG5vdGU6IHNoYWRvd2VkIGRlY2xh
cmF0aW9uIGlzIGhlcmUNCiAgIDQyIHwgc3RhdGljIHVpbnQ4X3QgdGV4dFtdID0gezB4ZDEsIDB4
MSwgMHgxMywgMHg1NCwgMHg1LCAweDY1LCAweDZlLCAweDJkLA0KICAgICAgfCAgICAgICAgICAg
ICAgICBefn5+DQoNClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRv
Zi5rb3psb3dza2lAY2Fub25pY2FsLmNvbT4NCi0tLQ0KIHVuaXQvdGVzdC1uZGVmLXBhcnNlLmMg
fCA4ICsrKystLS0tDQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkNCg0KZGlmZiAtLWdpdCBhL3VuaXQvdGVzdC1uZGVmLXBhcnNlLmMgYi91bml0L3Rlc3Qt
bmRlZi1wYXJzZS5jDQppbmRleCA5NjI4OGYyOWY0NGQuLjY3ZGUzZjJlNzdiZCAxMDA2NDQNCi0t
LSBhL3VuaXQvdGVzdC1uZGVmLXBhcnNlLmMNCisrKyBiL3VuaXQvdGVzdC1uZGVmLXBhcnNlLmMN
CkBAIC0xNDYsOSArMTQ2LDkgQEAgc3RhdGljIHVpbnQ4X3QgdXJpW10gPSB7MHhkMSwgMHgxLCAw
eGEsIDB4NTUsIDB4MSwgMHg2OSwgMHg2ZSwgMHg3NCwNCiAJCQkweDY1LCAweDZjLCAweDJlLCAw
eDYzLCAweDZmLCAweDZkfTsNCiANCiAvKiAnaGVsbG8gxbzDs8WCdycgLSBVVEYtOCAtIGVuLVVT
IFRleHQgTkRFRiAqLw0KLXN0YXRpYyB1aW50OF90IHRleHRbXSA9IHsweGQxLCAweDEsIDB4MTMs
IDB4NTQsIDB4NSwgMHg2NSwgMHg2ZSwgMHgyZCwNCi0JCQkgMHg1NSwgMHg1MywgMHg2OCwgMHg2
NSwgMHg2YywgMHg2YywgMHg2ZiwgMHgyMCwgMHhjNSwNCi0JCQkgMHhiYywgMHhjMywgMHhiMywg
MHhjNSwgMHg4MiwgMHg3N307DQorc3RhdGljIHVpbnQ4X3QgdGV4dF91dGY4W10gPSB7MHhkMSwg
MHgxLCAweDEzLCAweDU0LCAweDUsIDB4NjUsIDB4NmUsIDB4MmQsDQorCQkJMHg1NSwgMHg1Mywg
MHg2OCwgMHg2NSwgMHg2YywgMHg2YywgMHg2ZiwgMHgyMCwgMHhjNSwNCisJCQkweGJjLCAweGMz
LCAweGIzLCAweGM1LCAweDgyLCAweDc3fTsNCiANCiAvKiAnaGVsbG8gxbzDs8WCdycgLSBVVEYt
MTYgLSBlbi1VUyBUZXh0IE5ERUYgVVRGLTE2IG1hbGZvcm1lZCovDQogc3RhdGljIHVpbnQ4X3Qg
dGV4dF91dGYxNl9pbnZhbGlkW10gPSB7MHhkMSwgMHgxLCAweDE5LCAweDU0LCAweDg1LA0KQEAg
LTIzMiw3ICsyMzIsNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X25kZWZfdGV4dCh2b2lkKQ0KIAlHTGlz
dCAqcmVjb3JkczsNCiAJc3RydWN0IG5lYXJfbmRlZl9yZWNvcmQgKnJlY29yZDsNCiANCi0JcmVj
b3JkcyA9IG5lYXJfbmRlZl9wYXJzZV9tc2codGV4dCwgc2l6ZW9mKHRleHQpLCBOVUxMKTsNCisJ
cmVjb3JkcyA9IG5lYXJfbmRlZl9wYXJzZV9tc2codGV4dF91dGY4LCBzaXplb2YodGV4dF91dGY4
KSwgTlVMTCk7DQogDQogCWdfYXNzZXJ0KHJlY29yZHMpOw0KIAlnX2Fzc2VydF9jbXB1aW50KGdf
bGlzdF9sZW5ndGgocmVjb3JkcyksID09LCAxKTsNCi0tIA0KMi4yNy4wDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1uZmMgbWFpbGluZyBsaXN0
IC0tIGxpbnV4LW5mY0BsaXN0cy4wMS5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0
byBsaW51eC1uZmMtbGVhdmVAbGlzdHMuMDEub3JnCiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUo
Y2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlz
