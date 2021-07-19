Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1243CD325
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:25 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E8A0E100EB32A;
	Mon, 19 Jul 2021 04:09:23 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 601B1100EB32A
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:21 -0700 (PDT)
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 44F7140624
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692960;
	bh=xyqJ14wjmDRgY26+epCfc9QXHSbvavetjGVVMpq1w4g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pDa6gwInbyGSXKVKzFU0lVft0A1+9DBGtPzZBhioq9NbwNhse/e73UbA1SXwRC0p1
	 Of2GQwuRLl5PcJKmHV9Jx+FGbllbP85dD6gOcI+CPlUIfBIZn8RKLCcg2KHamCj4H7
	 TWyxemnIPn6NlI86XOhqwefjnnQ78QEVK3JfwAFs4w783BIooQRfEdKSjE2EgeU06J
	 P7osS80bvRQSI0/xrit/p19KXWeFQKfsU+1ioN2z7QgL+3JhtAMqJ4O3vICmdTgjdN
	 OROBiDHawtdgBDXW8/e/0vRG61h8tuMYo7AL2Tv9OoaslOMrSRvs8GjBTSfcohpusH
	 PAd3TktbxZSxw==
Received: by mail-lj1-f200.google.com with SMTP id q64-20020a2e5c430000b02901864030a0ecso9370858ljb.2
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xyqJ14wjmDRgY26+epCfc9QXHSbvavetjGVVMpq1w4g=;
        b=B1KEbbGizSz4W4m0n6rybnQGZByOY1jGsWQbnoNPS4KD2scSfomIfsHUbgfZdbOSNb
         J5Free8HiPPl6MUqN04XbV/ZwfEdrBBYYfX5GQGzd3sK/GgV1MNlErcRai6C02YkhXZF
         Z8FdpR1wzTcdT5ddZG88Dxt0FlMUKxlWiFfT3APnS2cjqq9K25YQmEOX5WXHBj9P6vk0
         aOdisZnvN14j30lo9rRmT4swci1iJP164jlfka5Obz4iqEqpz+pesUqwqT+Zq8spVjZY
         yZkvRa+7ip2TMvkVQah/QbpiYEipScgxq18jwcaKSyLmtwR/YX2i2yVVTSBHPoomZD8k
         bk6w==
X-Gm-Message-State: AOAM531UJVmWxwK5Jy+3dgA+AfJBX6wz7xm5u4HL3+GxxCySZX6DEGlQ
	c2SRScl1/b4izhQTXZT/Mx2Cb4ko2NktWZs12YB1/W6hBRGZg+vIG1uEQxoqVYXJrM6+zQ+jSH1
	nPkNpMWBw9Z1IBh/cIiw8KYDCZ8Ggg6BLwQ==
X-Received: by 2002:a2e:a44d:: with SMTP id v13mr21837325ljn.297.1626692959491;
        Mon, 19 Jul 2021 04:09:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydpmpvpMcOKC6MoCa5WNbz5Z+ThPL1ldMcY0kdbihm7hyJ67RKE77Xqn8GAnp5z+GhSPmbAg==
X-Received: by 2002:a2e:a44d:: with SMTP id v13mr21837312ljn.297.1626692959314;
        Mon, 19 Jul 2021 04:09:19 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:45 +0200
Message-Id: <20210719110819.27340-40-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: LBN3APURBLDAFO4TUX5YGL7XWVFXFACP
X-Message-ID-Hash: LBN3APURBLDAFO4TUX5YGL7XWVFXFACP
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 39/73] tag: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/LBN3APURBLDAFO4TUX5YGL7XWVFXFACP/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UHJvcGVybHkgcHJpbnQgc2lnbmVkIGFuZCB1bnNpZ25lZCBpbnRlZ2Vycy4gIFRoaXMgZml4ZXMg
d2FybmluZ3MgbGlrZToNCg0KICAgIHNyYy90YWcuYzogSW4gZnVuY3Rpb24g4oCYbmVhcl90YWdf
Z2V0X3RhZ+KAmToNCiAgICBzcmMvdGFnLmM6OTk6MzM6IGVycm9yOiBmb3JtYXQg4oCYJWTigJkg
ZXhwZWN0cyBhcmd1bWVudCBvZiB0eXBlIOKAmGludOKAmSwgYnV0IGFyZ3VtZW50IDMgaGFzIHR5
cGUg4oCYdWludDMyX3TigJkge2FrYSDigJh1bnNpZ25lZCBpbnTigJl9IFstV2Vycm9yPWZvcm1h
dD1dDQogICAgICAgOTkgfCAgcGF0aCA9IGdfc3RyZHVwX3ByaW50ZigiJXMvbmZjJWQvdGFnJWQi
LCBORkNfUEFUSCwNCiAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+
Xg0KICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8DQogICAgICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludA0KICAgICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICVkDQogICAgICAxMDAgfCAgICAgIGFkYXB0ZXJf
aWR4LCB0YXJnZXRfaWR4KTsNCiAgICAgICAgICB8ICAgICAgfn5+fn5+fn5+fn4NCiAgICAgICAg
ICB8ICAgICAgfA0KICAgICAgICAgIHwgICAgICB1aW50MzJfdCB7YWthIHVuc2lnbmVkIGludH0N
Cg0KICAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBzcmMvbmVhci5oOjM2LA0KICAgICAgICAgICAg
ICAgICAgICAgZnJvbSBzcmMvdGFnLmM6MzU6DQogICAgc3JjL3RhZy5jOiBJbiBmdW5jdGlvbiDi
gJhuZWFyX3RhZ19zZXRfbmZjaWTigJk6DQogICAgLi9pbmNsdWRlL25lYXIvbG9nLmg6NDU6MTQ6
IGVycm9yOiBmb3JtYXQg4oCYJXpk4oCZIGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDigJhzaWdu
ZWQgc2l6ZV904oCZLCBidXQgYXJndW1lbnQgNCBoYXMgdHlwZSDigJhzaXplX3TigJkge2FrYSDi
gJhsb25nIHVuc2lnbmVkIGludOKAmX0gWy1XZXJyb3I9Zm9ybWF0PV0NCiAgICAgICA0NSB8ICAg
bmVhcl9kZWJ1ZygiJXM6JXMoKSAiIGZtdCwgXA0KICAgICAgICAgIHwgICAgICAgICAgICAgIF5+
fn5+fn5+fn4NCiAgICBzcmMvdGFnLmM6NzkxOjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNy
byDigJhEQkfigJkNCiAgICAgIDc5MSB8ICBEQkcoIk5GQ0lEIGxlbiAlemQiLCBuZmNpZF9sZW4p
Ow0KICAgICAgICAgIHwgIF5+fg0KDQpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnp5c3p0b2Yua296bG93c2tpQGNhbm9uaWNhbC5jb20+DQotLS0NCiBzcmMvdGFnLmMgfCA4
ICsrKystLS0tDQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkNCg0KZGlmZiAtLWdpdCBhL3NyYy90YWcuYyBiL3NyYy90YWcuYw0KaW5kZXggOWViYTRlZWZl
ZjM1Li41MjAzNjhiMTU1MmMgMTAwNjQ0DQotLS0gYS9zcmMvdGFnLmMNCisrKyBiL3NyYy90YWcu
Yw0KQEAgLTk2LDcgKzk2LDcgQEAgc3RydWN0IG5lYXJfdGFnICpuZWFyX3RhZ19nZXRfdGFnKHVp
bnQzMl90IGFkYXB0ZXJfaWR4LCB1aW50MzJfdCB0YXJnZXRfaWR4KQ0KIAlzdHJ1Y3QgbmVhcl90
YWcgKnRhZzsNCiAJY2hhciAqcGF0aDsNCiANCi0JcGF0aCA9IGdfc3RyZHVwX3ByaW50ZigiJXMv
bmZjJWQvdGFnJWQiLCBORkNfUEFUSCwNCisJcGF0aCA9IGdfc3RyZHVwX3ByaW50ZigiJXMvbmZj
JXUvdGFnJXUiLCBORkNfUEFUSCwNCiAJCQkJCWFkYXB0ZXJfaWR4LCB0YXJnZXRfaWR4KTsNCiAJ
aWYgKCFwYXRoKQ0KIAkJcmV0dXJuIE5VTEw7DQpAQCAtNjU4LDcgKzY1OCw3IEBAIHN0YXRpYyBp
bnQgdGFnX2luaXRpYWxpemUoc3RydWN0IG5lYXJfdGFnICp0YWcsDQogew0KIAlEQkcoIiIpOw0K
IA0KLQl0YWctPnBhdGggPSBnX3N0cmR1cF9wcmludGYoIiVzL25mYyVkL3RhZyVkIiwgTkZDX1BB
VEgsDQorCXRhZy0+cGF0aCA9IGdfc3RyZHVwX3ByaW50ZigiJXMvbmZjJXUvdGFnJXUiLCBORkNf
UEFUSCwNCiAJCQkJCWFkYXB0ZXJfaWR4LCB0YXJnZXRfaWR4KTsNCiAJaWYgKCF0YWctPnBhdGgp
DQogCQlyZXR1cm4gLUVOT01FTTsNCkBAIC03ODgsNyArNzg4LDcgQEAgaW50IG5lYXJfdGFnX3Nl
dF9uZmNpZCh1aW50MzJfdCBhZGFwdGVyX2lkeCwgdWludDMyX3QgdGFyZ2V0X2lkeCwNCiB7DQog
CXN0cnVjdCBuZWFyX3RhZyAqdGFnOw0KIA0KLQlEQkcoIk5GQ0lEIGxlbiAlemQiLCBuZmNpZF9s
ZW4pOw0KKwlEQkcoIk5GQ0lEIGxlbiAlenUiLCBuZmNpZF9sZW4pOw0KIA0KIAl0YWcgPSBuZWFy
X3RhZ19nZXRfdGFnKGFkYXB0ZXJfaWR4LCB0YXJnZXRfaWR4KTsNCiAJaWYgKCF0YWcpDQpAQCAt
ODgxLDcgKzg4MSw3IEBAIGludCBuZWFyX3RhZ19hZGRfcmVjb3JkcyhzdHJ1Y3QgbmVhcl90YWcg
KnRhZywgR0xpc3QgKnJlY29yZHMsDQogCWZvciAobGlzdCA9IHJlY29yZHM7IGxpc3Q7IGxpc3Qg
PSBsaXN0LT5uZXh0KSB7DQogCQlyZWNvcmQgPSBsaXN0LT5kYXRhOw0KIA0KLQkJcGF0aCA9IGdf
c3RyZHVwX3ByaW50ZigiJXMvbmZjJWQvdGFnJWQvcmVjb3JkJWQiLA0KKwkJcGF0aCA9IGdfc3Ry
ZHVwX3ByaW50ZigiJXMvbmZjJXUvdGFnJXUvcmVjb3JkJXUiLA0KIAkJCQkJTkZDX1BBVEgsIHRh
Zy0+YWRhcHRlcl9pZHgsDQogCQkJCQl0YWctPnRhcmdldF9pZHgsIHRhZy0+bmV4dF9yZWNvcmQp
Ow0KIA0KLS0gDQoyLjI3LjANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW5mYyBtYWlsaW5nIGxpc3QgLS0gbGludXgtbmZjQGxpc3RzLjAxLm9y
ZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGxpbnV4LW5mYy1sZWF2ZUBsaXN0cy4w
MS5vcmcKJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1l
KXM=
