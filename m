Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5493CD31B
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:14 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 3E9B1100EB32F;
	Mon, 19 Jul 2021 04:09:12 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 7B1C5100EB859
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:10 -0700 (PDT)
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 8DE6440207
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692949;
	bh=g+r/Xpd4hGQzux4e96l3o0AuJubspIkbIQeqKDbrbE4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ucerWG/9sbAJCLtP12KPV2rHgEArnqN8eXz8/0/pN+F/iCUzGvT/R6/2chTNkAqLQ
	 +oXywFqAe1r7UzimE+vPH/ANGD0dRDR/Ypkre+iF0Ayu8x+RtpQDSz2uF62+MEiZfl
	 O2DDTyNPnumnCiZzJj4oadfNy/PVroG7uCo/vSISC51n11unEXS/y9CNugtIbfUGnB
	 MLNN0a3AIvqQOQCjk+5L9OgpBuq2dIUpygLRwopmez5TGwQ9Hy6axRbZEqkPOlyC3t
	 4H++v25DacXJTq3TxgqAdssNcjzu9Glw9tB9oQuhhNEG3x13qwlJ4THfFwVFBLtn5E
	 JTd+88iJjBVPw==
Received: by mail-lj1-f200.google.com with SMTP id z18-20020a2e96520000b0290178006de192so9320636ljh.3
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g+r/Xpd4hGQzux4e96l3o0AuJubspIkbIQeqKDbrbE4=;
        b=aOIxGlDczIQ5Ju6MqI8hd14ONL5xkYDfDlwLAGvilE9jvtrZ1EBuSX0gHwX/fLs0yO
         SUh9j5rem9H27SoyO8UzFjcvfeDReJtC4lZ/HJbtIaWjC8I0IpNAzrHRLOKnoC1ZV5mF
         2kVZEBN23Iw2iKfmYL6E4DSfq6oeYDYx+5y7nVswIZ6Kg37VxYvHQ/RWYOa1FOkkZbZq
         5IoJRWqYvh6y1IyKk5MP1bBxJ6H8efm3yggTlstViSWAZWnTmE7AMqvsOZJQCTvVBUcX
         jpFcSNyYMNeKU27l6UP3UL2Ijn4q/STTXYOTEcYnMNtXv7sJyATZxTKdTi+VSjTRYjHG
         sCiA==
X-Gm-Message-State: AOAM533U2/xg6dVZ780OF1EMB9IvOTfNtY9P3FOi1J3EPqgN1GoJKpHT
	eFMgu7lEFvwHNszvJY2aD4+wlRGrFBGLDMdczqJtmHW6F6xRAYbzHfz0V/7GELBDaGZ9W85Pmcd
	j/3MUc/Oo1xCBYkq4Joql0zsao02SGfiQiA==
X-Received: by 2002:a2e:b6c2:: with SMTP id m2mr450917ljo.91.1626692948854;
        Mon, 19 Jul 2021 04:09:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjHLT1x2zscnJmlBIJGWzus34tmHyMwxUugO0mzcgRPlToT4vXWr1Q/LURvlItUg2FZtxxow==
X-Received: by 2002:a2e:b6c2:: with SMTP id m2mr450906ljo.91.1626692948723;
        Mon, 19 Jul 2021 04:09:08 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:36 +0200
Message-Id: <20210719110819.27340-31-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: BTGXPJ5H33LMU4CXC4SD7ZN5ARJTU7F2
X-Message-ID-Hash: BTGXPJ5H33LMU4CXC4SD7ZN5ARJTU7F2
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 30/73] mifare: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/BTGXPJ5H33LMU4CXC4SD7ZN5ARJTU7F2/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UHJvcGVybHkgcHJpbnQgc2lnbmVkIGFuZCB1bnNpZ25lZCBpbnRlZ2Vycy4gIFRoaXMgZml4ZXMg
d2FybmluZ3MgbGlrZToNCg0KICAgIHBsdWdpbnMvbWlmYXJlLmM6IEluIGZ1bmN0aW9uIOKAmG1p
ZmFyZV9yZWFk4oCZOg0KICAgIHBsdWdpbnMvbWlmYXJlLmM6ODM2OjMzOiBlcnJvcjogZm9ybWF0
IOKAmCVk4oCZIGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDigJhpbnTigJksIGJ1dCBhcmd1bWVu
dCAyIGhhcyB0eXBlIOKAmHVuc2lnbmVkIGludOKAmSBbLVdlcnJvcj1mb3JtYXQ9XQ0KICAgICAg
ODM2IHwgICBuZWFyX2Vycm9yKCJNaWZhcmUgdGFnIHR5cGUgWyVkXSBub3Qgc3VwcG9ydGVkLiIs
IHRndF9zdWJ0eXBlKTsNCiAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB+XiAgICAgICAgICAgICAgICAgICB+fn5+fn5+fn5+fg0KICAgICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgIHwNCiAgICAgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBpbnQNCiAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAlZA0K
DQpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tp
QGNhbm9uaWNhbC5jb20+DQotLS0NCiBwbHVnaW5zL21pZmFyZS5jIHwgOCArKysrLS0tLQ0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1n
aXQgYS9wbHVnaW5zL21pZmFyZS5jIGIvcGx1Z2lucy9taWZhcmUuYw0KaW5kZXggM2QzNzY1MjY3
MzVkLi5hNGU0YmE0NDM5OTUgMTAwNjQ0DQotLS0gYS9wbHVnaW5zL21pZmFyZS5jDQorKysgYi9w
bHVnaW5zL21pZmFyZS5jDQpAQCAtODMzLDcgKzgzMyw3IEBAIGludCBtaWZhcmVfcmVhZCh1aW50
MzJfdCBhZGFwdGVyX2lkeCwgdWludDMyX3QgdGFyZ2V0X2lkeCwNCiAJY2FzZSBORUFSX1RBR19O
RkNfVDJfTUlGQVJFX0NMQVNTSUNfNEs6DQogCQlicmVhazsNCiAJZGVmYXVsdDoNCi0JCW5lYXJf
ZXJyb3IoIk1pZmFyZSB0YWcgdHlwZSBbJWRdIG5vdCBzdXBwb3J0ZWQuIiwgdGd0X3N1YnR5cGUp
Ow0KKwkJbmVhcl9lcnJvcigiTWlmYXJlIHRhZyB0eXBlIFsldV0gbm90IHN1cHBvcnRlZC4iLCB0
Z3Rfc3VidHlwZSk7DQogCQlyZXR1cm4gLTE7DQogCX0NCiANCkBAIC05MDAsNyArOTAwLDcgQEAg
aW50IG1pZmFyZV9jaGVja19wcmVzZW5jZSh1aW50MzJfdCBhZGFwdGVyX2lkeCwgdWludDMyX3Qg
dGFyZ2V0X2lkeCwNCiAJY2FzZSBORUFSX1RBR19ORkNfVDJfTUlGQVJFX0NMQVNTSUNfNEs6DQog
CQlicmVhazsNCiAJZGVmYXVsdDoNCi0JCW5lYXJfZXJyb3IoIk1pZmFyZSB0YWcgdHlwZSAlZCBu
b3Qgc3VwcG9ydGVkLiIsIHRndF9zdWJ0eXBlKTsNCisJCW5lYXJfZXJyb3IoIk1pZmFyZSB0YWcg
dHlwZSAldSBub3Qgc3VwcG9ydGVkLiIsIHRndF9zdWJ0eXBlKTsNCiAJCXJldHVybiAtMTsNCiAJ
fQ0KIA0KQEAgLTEyMjgsNyArMTIyOCw3IEBAIHN0YXRpYyBpbnQgd3JpdGluZ19ub3RfcGVybWl0
dGVkKHZvaWQgKmRhdGEpDQogCQl9DQogCX0NCiANCi0JREJHKCJUQUcgd3JpdGFibGUgc2VjdG9y
cycgc2l6ZTogWyVkXS4iLCBuZXdfdGFnX3NpemUpOw0KKwlEQkcoIlRBRyB3cml0YWJsZSBzZWN0
b3JzJyBzaXplOiBbJXVdLiIsIG5ld190YWdfc2l6ZSk7DQogDQogCS8qIENoZWNrIGlmIHRoZXJl
J3MgZW5vdWdoIHNwYWNlIG9uIHRhZyAqLw0KIAlpZiAobmV3X3RhZ19zaXplIDwgbWZfY2stPm5k
ZWYtPmxlbmd0aCkgew0KQEAgLTEyOTMsNyArMTI5Myw3IEBAIGludCBtaWZhcmVfd3JpdGUodWlu
dDMyX3QgYWRhcHRlcl9pZHgsIHVpbnQzMl90IHRhcmdldF9pZHgsDQogCWNhc2UgTkVBUl9UQUdf
TkZDX1QyX01JRkFSRV9DTEFTU0lDXzRLOg0KIAkJYnJlYWs7DQogCWRlZmF1bHQ6DQotCQluZWFy
X2Vycm9yKCJNaWZhcmUgdGFnIHR5cGUgJWQgbm90IHN1cHBvcnRlZC4iLCB0Z3Rfc3VidHlwZSk7
DQorCQluZWFyX2Vycm9yKCJNaWZhcmUgdGFnIHR5cGUgJXUgbm90IHN1cHBvcnRlZC4iLCB0Z3Rf
c3VidHlwZSk7DQogCQlyZXR1cm4gLTE7DQogCX0NCiANCi0tIA0KMi4yNy4wDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1uZmMgbWFpbGluZyBs
aXN0IC0tIGxpbnV4LW5mY0BsaXN0cy4wMS5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFp
bCB0byBsaW51eC1uZmMtbGVhdmVAbGlzdHMuMDEub3JnCiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5m
byUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlz
