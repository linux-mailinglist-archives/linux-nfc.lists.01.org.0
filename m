Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3913C3F18
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:24:43 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 8A71C100EB329;
	Sun, 11 Jul 2021 13:24:41 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id ABE4D100EB858
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:38 -0700 (PDT)
Received: from mail-wr1-f70.google.com ([209.85.221.70])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2g0D-0001p8-CY
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:24:37 +0000
Received: by mail-wr1-f70.google.com with SMTP id z6-20020a5d4c860000b029013a10564614so5848100wrs.15
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t4+eBSkOd4ZyB5gXP8roorbD7dIPakfYNzF4msgvZyo=;
        b=tchoUlRVqMjFovjrN2D0RsISFKNwuJyhAXbZCyPGxoZCQxRikh8bl7FYlvIEVE1NJC
         jyOJawm/mmt+b07ZuqK2i2ht4DYQ01JBqU87DLJ3oVblOg8Pc0lP1BuvnKxtLpDzpm0F
         FtK7j+J0EAGC82xSPIbYwlsQAgrmRfiE5ppbzd7dWoBjWXJ1t2v6vsoaKDkOgLez0jaL
         OftueP+Hfn4Hdt1y1rtTaUgnB9P7hx5DPqI5oEeAbtzVus6g95R0JeW18WBJOllHHCCZ
         9Ew7yurjhoO0zZLGYHLhHCQ52qAzKpuWlT3bJpM8RkaiErG/WMfpGmBR+NIyvak9drZI
         3b5w==
X-Gm-Message-State: AOAM533CPYFcMiNcr6GO7pYo6yXL+NKQVh0OloQ/QOJP/KJEzru0ODlb
	bFbg/zmXaahvaaNoMLOHawOPvKB0e4TTw9UTqzUnX57XaoVkZ2BSm8bE3ksLjUQJkD8rIXrzk8X
	UPdbr1qqN2/wn1/bgY/65vsCRlopd5R6wcw==
X-Received: by 2002:adf:b605:: with SMTP id f5mr54893090wre.419.1626035076980;
        Sun, 11 Jul 2021 13:24:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMoXD7U+XroUbh8+LFkSF/nkZviBhU5M2DBOv3naNJuE6g3itpOxx7JQNW/Uynju2ul/78dg==
X-Received: by 2002:adf:b605:: with SMTP id f5mr54893075wre.419.1626035076814;
        Sun, 11 Jul 2021 13:24:36 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id n12sm12501575wmq.5.2021.07.11.13.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:24:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:23:35 +0200
Message-Id: <20210711202351.18363-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: BRE7IAXKR4BZX2H54HTNQEOJ6ZRKO63Y
X-Message-ID-Hash: BRE7IAXKR4BZX2H54HTNQEOJ6ZRKO63Y
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 18/34] ndef: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/BRE7IAXKR4BZX2H54HTNQEOJ6ZRKO63Y/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UHJvcGVybHkgcHJpbnQgc2lnbmVkIGFuZCB1bnNpZ25lZCBpbnRlZ2Vycy4gIFRoaXMgZml4ZXMg
d2FybmluZ3MgbGlrZToNCg0KICAgIC4vaW5jbHVkZS9uZWFyL2xvZy5oOjQ1OjE0OiBlcnJvcjog
Zm9ybWF0IOKAmCVk4oCZIGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDigJhpbnTigJksIGJ1dCBh
cmd1bWVudCA0IGhhcyB0eXBlIOKAmHVpbnQzMl904oCZIHtha2Eg4oCYdW5zaWduZWQgaW504oCZ
fSBbLVdlcnJvcj1mb3JtYXQ9XQ0KICAgICAgIDQ1IHwgICBuZWFyX2RlYnVnKCIlczolcygpICIg
Zm10LCBcDQogICAgICAgICAgfCAgICAgICAgICAgICAgXn5+fn5+fn5+fg0KICAgIHNyYy9uZGVm
LmM6MTA4NDoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYREJH4oCZDQogICAgIDEw
ODQgfCAgREJHKCJwYXlsb2FkIGxlbmd0aCAlZCIsIHJlY19oZWFkZXItPnBheWxvYWRfbGVuKTsN
CiAgICAgICAgICB8ICBefn4NCg0KU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6eXN6dG9mLmtvemxvd3NraUBjYW5vbmljYWwuY29tPg0KLS0tDQogc3JjL25kZWYuYyB8IDYg
KysrLS0tDQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL3NyYy9uZGVmLmMgYi9zcmMvbmRlZi5jDQppbmRleCA1NGUyZTFhZTE3
MGUuLjBkODRmZjRkYzE3YiAxMDA2NDQNCi0tLSBhL3NyYy9uZGVmLmMNCisrKyBiL3NyYy9uZGVm
LmMNCkBAIC01ODUsNyArNTg1LDcgQEAgc3RhdGljIGdib29sZWFuIHByb3BlcnR5X2dldF9zaXpl
KGNvbnN0IEdEQnVzUHJvcGVydHlUYWJsZSAqcHJvcGVydHksDQogew0KIAlzdHJ1Y3QgbmVhcl9u
ZGVmX3JlY29yZCAqcmVjb3JkID0gdXNlcl9kYXRhOw0KIA0KLQlEQkcoIiVkIiwgcmVjb3JkLT5z
cC0+c2l6ZSk7DQorCURCRygiJXUiLCByZWNvcmQtPnNwLT5zaXplKTsNCiANCiAJZGJ1c19tZXNz
YWdlX2l0ZXJfYXBwZW5kX2Jhc2ljKGl0ZXIsIERCVVNfVFlQRV9VSU5UMzIsICZyZWNvcmQtPnNw
LT5zaXplKTsNCiANCkBAIC0xMDQyLDcgKzEwNDIsNyBAQCBzdGF0aWMgc3RydWN0IG5lYXJfbmRl
Zl9yZWNvcmRfaGVhZGVyICpwYXJzZV9yZWNvcmRfaGVhZGVyKHVpbnQ4X3QgKnJlYywNCiAJdWlu
dDhfdCAqdHlwZSA9IE5VTEw7DQogCXVpbnQzMl90IGhlYWRlcl9sZW4gPSAwOw0KIA0KLQlEQkco
Imxlbmd0aCAlZCIsIGxlbmd0aCk7DQorCURCRygibGVuZ3RoICV1IiwgbGVuZ3RoKTsNCiANCiAJ
aWYgKCFyZWMgfHwgb2Zmc2V0ID49IGxlbmd0aCkNCiAJCXJldHVybiBOVUxMOw0KQEAgLTEwODEs
NyArMTA4MSw3IEBAIHN0YXRpYyBzdHJ1Y3QgbmVhcl9uZGVmX3JlY29yZF9oZWFkZXIgKnBhcnNl
X3JlY29yZF9oZWFkZXIodWludDhfdCAqcmVjLA0KIAkJCWdvdG8gZmFpbDsNCiAJfQ0KIA0KLQlE
QkcoInBheWxvYWQgbGVuZ3RoICVkIiwgcmVjX2hlYWRlci0+cGF5bG9hZF9sZW4pOw0KKwlEQkco
InBheWxvYWQgbGVuZ3RoICV1IiwgcmVjX2hlYWRlci0+cGF5bG9hZF9sZW4pOw0KIA0KIAlpZiAo
cmVjX2hlYWRlci0+aWwgPT0gMSkgew0KIAkJcmVjX2hlYWRlci0+aWxfbGVuZ3RoID0gcmVjW29m
ZnNldCsrXTsNCi0tIA0KMi4yNy4wDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1uZmMgbWFpbGluZyBsaXN0IC0tIGxpbnV4LW5mY0BsaXN0cy4w
MS5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBsaW51eC1uZmMtbGVhdmVAbGlz
dHMuMDEub3JnCiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxf
bmFtZSlz
