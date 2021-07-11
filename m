Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA043C3F1A
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:24:45 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id B0AF9100EB334;
	Sun, 11 Jul 2021 13:24:41 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id DABD7100EB859
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:40 -0700 (PDT)
Received: from mail-wr1-f72.google.com ([209.85.221.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2g0F-0001qK-JR
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:24:39 +0000
Received: by mail-wr1-f72.google.com with SMTP id g4-20020a5d64e40000b029013398ce8904so6169027wri.16
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ALPYuisJuNTTb6DTEUnqid+7H8k7Xl+3dqbIQ9EBvc4=;
        b=brYXc5FI64KpfLa+iBYIsqgDaZiYj9OBWP4pPhYDK44Zq/J/fROOKMvpiSOUxyCDIJ
         z5eBEsSIN2ulN03PChxPW4jJdlj8b/YIUC38ygACibL0Yyz7CzXsp85LJ14TVX6bGOtV
         zJpVIotiCy72f+HzbD+1eTfI6mV+h2NvaPQgwHuDqVsTg2lQ/wAx0rENppM4smSjQJNY
         ru7/fAi8CPjn6z39lgBfCfXgtWK5eArdVBwbD1e5mAjFfrdYeHVV4GqJNBh/ENjn1F1j
         bFnO7Or/vOi2yJw6Eb6IMqHi4mGEp+y9m2ZiqXLUe4J/1y8tjqp5piU3xuvbH8cNFu8Y
         Vl3g==
X-Gm-Message-State: AOAM531Bf1KHJqjZ1QjNwUqyZxx0F9UYExk+MBK/1z1XXv5z6PstqTii
	tc3LN4/0XDZ4hkqGFEroTgYNh9eUIOTBbjh6BnCwAnJJZTm6b5FcgPol1MBdTUBtdC0qcH0M3bd
	9wZzF9+bC9upC2+Mz91TiNXf7JX1piz5pvA==
X-Received: by 2002:a5d:591c:: with SMTP id v28mr17332690wrd.373.1626035078983;
        Sun, 11 Jul 2021 13:24:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkyHOxIcg2rkWPYMelPmJlPqcFi7L4wi82p3LBxUVcmKAMblT/chTOPgqAJBaRhPTXVkMdvQ==
X-Received: by 2002:a5d:591c:: with SMTP id v28mr17332685wrd.373.1626035078885;
        Sun, 11 Jul 2021 13:24:38 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id n12sm12501575wmq.5.2021.07.11.13.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:24:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:23:37 +0200
Message-Id: <20210711202351.18363-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: MP7WYULEWG5YRQTGRADZ5CGE4ZZ7X62P
X-Message-ID-Hash: MP7WYULEWG5YRQTGRADZ5CGE4ZZ7X62P
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 20/34] nfctype3: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/MP7WYULEWG5YRQTGRADZ5CGE4ZZ7X62P/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UHJvcGVybHkgcHJpbnQgc2lnbmVkIGFuZCB1bnNpZ25lZCBpbnRlZ2Vycy4gIFRoaXMgZml4ZXMg
d2FybmluZ3MgbGlrZToNCg0KICAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBwbHVnaW5zL25mY3R5
cGUzLmM6MzY6DQogICAgcGx1Z2lucy9uZmN0eXBlMy5jOiBJbiBmdW5jdGlvbiDigJhkYXRhX3Jl
Y3bigJk6DQogICAgLi9pbmNsdWRlL25lYXIvbG9nLmg6NDU6MTQ6IGVycm9yOiBmb3JtYXQg4oCY
JXpk4oCZIGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDigJhzaWduZWQgc2l6ZV904oCZLCBidXQg
YXJndW1lbnQgNCBoYXMgdHlwZSDigJhzaXplX3TigJkge2FrYSDigJhsb25nIHVuc2lnbmVkIGlu
dOKAmX0gWy1XZXJyb3I9Zm9ybWF0PV0NCiAgICAgICA0NSB8ICAgbmVhcl9kZWJ1ZygiJXM6JXMo
KSAiIGZtdCwgXA0KICAgICAgICAgIHwgICAgICAgICAgICAgIF5+fn5+fn5+fn4NCiAgICBwbHVn
aW5zL25mY3R5cGUzLmM6MjQ5OjM6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhEQkfi
gJkNCiAgICAgIDI0OSB8ICAgREJHKCJEb25lIHJlYWRpbmcgJXpkIGJ5dGVzIGF0ICVwIiwgZGF0
YV9sZW5ndGgsIG5mY19kYXRhKTsNCiAgICAgICAgICB8ICAgXn5+DQoNClNpZ25lZC1vZmYtYnk6
IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNvbT4N
Ci0tLQ0KIHBsdWdpbnMvbmZjdHlwZTMuYyB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL3BsdWdpbnMvbmZjdHlwZTMu
YyBiL3BsdWdpbnMvbmZjdHlwZTMuYw0KaW5kZXggZDRmYmVkMGRmYzJmLi5jMDUwMmYxNWQ5ZjIg
MTAwNjQ0DQotLS0gYS9wbHVnaW5zL25mY3R5cGUzLmMNCisrKyBiL3BsdWdpbnMvbmZjdHlwZTMu
Yw0KQEAgLTI0Niw3ICsyNDYsNyBAQCBzdGF0aWMgaW50IGRhdGFfcmVjdih1aW50OF90ICpyZXNw
LCBpbnQgbGVuZ3RoLCB2b2lkICpkYXRhKQ0KIA0KIAkJdGFnLT5jdXJyZW50X2Jsb2NrID0gMDsN
CiANCi0JCURCRygiRG9uZSByZWFkaW5nICV6ZCBieXRlcyBhdCAlcCIsIGRhdGFfbGVuZ3RoLCBu
ZmNfZGF0YSk7DQorCQlEQkcoIkRvbmUgcmVhZGluZyAlenUgYnl0ZXMgYXQgJXAiLCBkYXRhX2xl
bmd0aCwgbmZjX2RhdGEpOw0KIAkJcmVjb3JkcyA9IG5lYXJfbmRlZl9wYXJzZV9tc2cobmZjX2Rh
dGEsIGRhdGFfbGVuZ3RoLCBOVUxMKTsNCiAJCW5lYXJfdGFnX2FkZF9yZWNvcmRzKHRhZy0+dGFn
LCByZWNvcmRzLCB0YWctPmNiLCAwKTsNCiANCi0tIA0KMi4yNy4wDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1uZmMgbWFpbGluZyBsaXN0IC0t
IGxpbnV4LW5mY0BsaXN0cy4wMS5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBs
aW51eC1uZmMtbGVhdmVAbGlzdHMuMDEub3JnCiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dp
ZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlz
