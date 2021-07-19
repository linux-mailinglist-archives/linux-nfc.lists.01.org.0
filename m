Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA91D3CD31D
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:16 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 5A4FF100EB337;
	Mon, 19 Jul 2021 04:09:15 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id CED65100EB33F
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:12 -0700 (PDT)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id CF16C40207
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692951;
	bh=wMDBYzABhu8ioRTTVLSHI/7/lg8unWWdzxP/adfRtNA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=S5ibuhsVvjrKedqE4qw0VhkKm7dMluW3QJ0Lo2UtoS3tK25Tr+pnfZT9zstvm+WHI
	 j4fw5bOt0aTcvT5bJGSK6MP8J5VO0WQrQ5E3h3gchrnod6WD8Ms1Alz97PGI57bBHq
	 obOb/43KNijhNAd9DHCkwX9O2Yw99EDRdcLECa9fRo1mNNhQZWG7rSaltEto7bpur+
	 9aTwmWGD0jHMQzgb6ezKWEmCpdb02Kl+KaAL5RsZOFL7DjsXte8knxtVrCzkRnB2X9
	 13VUEEa65tzpBTrDIH8JKZwYc1zCX9AeAxt6cqmNiUwTrXxKFHyLZIboZERcLPDi6G
	 yMMTC2bC8y3qQ==
Received: by mail-lf1-f71.google.com with SMTP id p13-20020a19604d0000b029038be656b5c5so2394266lfk.2
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wMDBYzABhu8ioRTTVLSHI/7/lg8unWWdzxP/adfRtNA=;
        b=CQT4kWnmZLaucsyNFp3B6YLoyqTrXcM1JbwzGBm0jC1BC3HJmOGclTg2iQuvDvDQUz
         m8UQbStaDOKec/ZtKRG2gj/MW4k9gQbvY44fCVIQXe21XgVXz8og1ynW1tcSDKXtdzcc
         qGIImPL/F0f0MaTv9xaMPg3df1g2JyRwkX9PoLY2dM8GPQ9oa3fmH0w20xFk34OgDwyy
         RZJ3rBsjZDy2npzTZVff1vgprD3wziYeVCg7nRoEhbHEvldJRUlpKOiHKSFQcj8Je7fq
         29OVNNTvNHuTQmVP9Nt0jZW1/GqfiZ6oa8K+zXk/TsKKbd7bo//40SxSAMgjjQx1VelF
         d7sA==
X-Gm-Message-State: AOAM532wKKnnP1jXNgXaKc5DaHojpWK974TxTUAW0ErSlUK8FHyELIRW
	YcEVeXYASpVPlsN0FDpPTyq69Dq/es0967Xh3SkJK3Am+ssy6htu1Oks4+B0qFp7rtuE8JAVVXk
	3B1bV0r+bjQok4p1sWfAy2cZq0QddgAQVww==
X-Received: by 2002:a2e:9ecd:: with SMTP id h13mr22259522ljk.162.1626692951128;
        Mon, 19 Jul 2021 04:09:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzn6gejImeHb47i2EAt9xQMGmFp57YgNvg99zygiBLN63A7rSMa6BP9mSgOSDbmGDKGIeONoA==
X-Received: by 2002:a2e:9ecd:: with SMTP id h13mr22259510ljk.162.1626692950993;
        Mon, 19 Jul 2021 04:09:10 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:38 +0200
Message-Id: <20210719110819.27340-33-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: BKCPG54JI5Z7SOXLEJNDPHWHV4FCBNDE
X-Message-ID-Hash: BKCPG54JI5Z7SOXLEJNDPHWHV4FCBNDE
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 32/73] p2p: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/BKCPG54JI5Z7SOXLEJNDPHWHV4FCBNDE/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UHJvcGVybHkgcHJpbnQgc2lnbmVkIGFuZCB1bnNpZ25lZCBpbnRlZ2Vycy4gIFRoaXMgZml4ZXMg
d2FybmluZ3MgbGlrZToNCg0KICAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBwbHVnaW5zL3AycC5j
OjM4Og0KICAgIHBsdWdpbnMvcDJwLmM6IEluIGZ1bmN0aW9uIOKAmHAycF9saXN0ZW5lcl9ldmVu
dOKAmToNCiAgICAuL2luY2x1ZGUvbmVhci9sb2cuaDo0NToxNDogZXJyb3I6IGZvcm1hdCDigJgl
ZOKAmSBleHBlY3RzIGFyZ3VtZW50IG9mIHR5cGUg4oCYaW504oCZLCBidXQgYXJndW1lbnQgNCBo
YXMgdHlwZSDigJhfX3UzMuKAmSB7YWthIOKAmHVuc2lnbmVkIGludOKAmX0gWy1XZXJyb3I9Zm9y
bWF0PV0NCiAgICAgICA0NSB8ICAgbmVhcl9kZWJ1ZygiJXM6JXMoKSAiIGZtdCwgXA0KICAgICAg
ICAgIHwgICAgICAgICAgICAgIF5+fn5+fn5+fn4NCiAgICBwbHVnaW5zL3AycC5jOjI2MToyOiBu
b3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYREJH4oCZDQogICAgICAyNjEgfCAgREJHKCJ0
YXJnZXQgaWR4ICVkIiwgY2xpZW50X2FkZHIudGFyZ2V0X2lkeCk7DQogICAgICAgICAgfCAgXn5+
DQoNClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dz
a2lAY2Fub25pY2FsLmNvbT4NCi0tLQ0KIHBsdWdpbnMvcDJwLmMgfCA0ICsrLS0NCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEv
cGx1Z2lucy9wMnAuYyBiL3BsdWdpbnMvcDJwLmMNCmluZGV4IDEzNzAyYWRlM2UxNC4uY2YzZTBh
Y2NhZjMzIDEwMDY0NA0KLS0tIGEvcGx1Z2lucy9wMnAuYw0KKysrIGIvcGx1Z2lucy9wMnAuYw0K
QEAgLTI1Niw5ICsyNTYsOSBAQCBzdGF0aWMgZ2Jvb2xlYW4gcDJwX2xpc3RlbmVyX2V2ZW50KEdJ
T0NoYW5uZWwgKmNoYW5uZWwsIEdJT0NvbmRpdGlvbiBjb25kaXRpb24sDQogCQlyZXR1cm4gRkFM
U0U7DQogCX0NCiANCi0JREJHKCJjbGllbnQgZHNhcCAlZCBzc2FwICVkIiwNCisJREJHKCJjbGll
bnQgZHNhcCAldSBzc2FwICV1IiwNCiAJCWNsaWVudF9hZGRyLmRzYXAsIGNsaWVudF9hZGRyLnNz
YXApOw0KLQlEQkcoInRhcmdldCBpZHggJWQiLCBjbGllbnRfYWRkci50YXJnZXRfaWR4KTsNCisJ
REJHKCJ0YXJnZXQgaWR4ICV1IiwgY2xpZW50X2FkZHIudGFyZ2V0X2lkeCk7DQogDQogCWNsaWVu
dF9kYXRhID0gZ190cnlfbWFsbG9jMChzaXplb2Yoc3RydWN0IHAycF9kYXRhKSk7DQogCWlmICgh
Y2xpZW50X2RhdGEpIHsNCi0tIA0KMi4yNy4wDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1uZmMgbWFpbGluZyBsaXN0IC0tIGxpbnV4LW5mY0Bs
aXN0cy4wMS5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBsaW51eC1uZmMtbGVh
dmVAbGlzdHMuMDEub3JnCiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50
ZXJuYWxfbmFtZSlz
