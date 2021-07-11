Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8ED3C3F15
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:24:39 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 2EFBE100EB83F;
	Sun, 11 Jul 2021 13:24:37 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 487B7100EB83E
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:35 -0700 (PDT)
Received: from mail-wr1-f72.google.com ([209.85.221.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2g0A-0001nn-24
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:24:34 +0000
Received: by mail-wr1-f72.google.com with SMTP id m9-20020a5d4a090000b029013e2b4a9d1eso1848109wrq.4
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5POKMiqdZ3oR7XAoRvYFQ3n+qaIEl/kU4nQCfHsJj10=;
        b=Q7U/uUoJiP6l+0RBm2hDMLxJTelshffUvlnZ/6p9NFNISnhH4HdYanwFYLOL6o1Ow9
         7uMnEMgFilWbXVYdxOnOYRMSRiV27OXoXslexLxYgminJG8u4e2Wzjlo+qpRunG9LSc4
         LArvsS5volTvHAEoXG0LJw0ET0xi7NVzTYVZowRAyPh3nR7iPdb3jCmdcjnoOpwyScXh
         p4OpQeHi2f9f8adjuH6uqiTSJvyhVVKRGrI7jMcm8VKffgSbkXdfovtD9y5XjKt+Nep5
         QNtofWvn1u8SDClGFPWph+GP1XYXJhOaHBbvIgBe7Oxrq6dZ6RzoOI7lKLyBAK4KVwAy
         OYFA==
X-Gm-Message-State: AOAM533L0QroZM8X+XSyKy7je+fQVs44eLnmSe/dY8IK0z3UfHuQ9ZfL
	VQsTYey/F1AiEQh88KUlR+eclzC9v2yMyST2pasXy4jaLLd7b37WWDMaEUqvLjeYuiNDaBdX8+8
	8c8n795K0kZZec2sxBDmnkYy2vBn1LMSfSw==
X-Received: by 2002:a5d:4e81:: with SMTP id e1mr3669455wru.48.1626035073604;
        Sun, 11 Jul 2021 13:24:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCq1+gSSLJGh9dt3SKvc6fyhhMpwLTV7cVOfLgMj5QCZiuJ65ndWPYWfBlen9P73zmZx6rYg==
X-Received: by 2002:a5d:4e81:: with SMTP id e1mr3669450wru.48.1626035073505;
        Sun, 11 Jul 2021 13:24:33 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id n12sm12501575wmq.5.2021.07.11.13.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:24:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:23:32 +0200
Message-Id: <20210711202351.18363-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: XJEZ3CAIVNMC5Y4SQMNXG6LC6FZC75DR
X-Message-ID-Hash: XJEZ3CAIVNMC5Y4SQMNXG6LC6FZC75DR
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 15/34] unit: do not shadow global 'uri' variable (-Wshadow)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/XJEZ3CAIVNMC5Y4SQMNXG6LC6FZC75DR/>
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
ZGVmLXBhcnNlLmMgYi91bml0L3Rlc3QtbmRlZi1wYXJzZS5jDQppbmRleCBhZmNlZGU1N2IwZDgu
LmNkZWIxYTFhMjRkZiAxMDA2NDQNCi0tLSBhL3VuaXQvdGVzdC1uZGVmLXBhcnNlLmMNCisrKyBi
L3VuaXQvdGVzdC1uZGVmLXBhcnNlLmMNCkBAIC0xNDIsNyArMTQyLDcgQEAgc3RydWN0IG5lYXJf
bmRlZl9hY19wYXlsb2FkIHsNCiB9Ow0KIA0KIC8qIGh0dHA6Ly93d3cuaW50ZWwuY29tIFVSSSBO
REVGICovDQotc3RhdGljIHVpbnQ4X3QgdXJpW10gPSB7MHhkMSwgMHgxLCAweGEsIDB4NTUsIDB4
MSwgMHg2OSwgMHg2ZSwgMHg3NCwNCitzdGF0aWMgdWludDhfdCB0ZXN0X3VyaVtdID0gezB4ZDEs
IDB4MSwgMHhhLCAweDU1LCAweDEsIDB4NjksIDB4NmUsIDB4NzQsDQogCQkJMHg2NSwgMHg2Yywg
MHgyZSwgMHg2MywgMHg2ZiwgMHg2ZH07DQogDQogLyogJ2hlbGxvIMW8w7PFgncnIC0gVVRGLTgg
LSBlbi1VUyBUZXh0IE5ERUYgKi8NCkBAIC0yMTAsNyArMjEwLDcgQEAgc3RhdGljIHZvaWQgdGVz
dF9uZGVmX3VyaSh2b2lkKQ0KIAlHTGlzdCAqcmVjb3JkczsNCiAJc3RydWN0IG5lYXJfbmRlZl9y
ZWNvcmQgKnJlY29yZDsNCiANCi0JcmVjb3JkcyA9IG5lYXJfbmRlZl9wYXJzZV9tc2codXJpLCBz
aXplb2YodXJpKSwgTlVMTCk7DQorCXJlY29yZHMgPSBuZWFyX25kZWZfcGFyc2VfbXNnKHRlc3Rf
dXJpLCBzaXplb2YodGVzdF91cmkpLCBOVUxMKTsNCiANCiAJZ19hc3NlcnQocmVjb3Jkcyk7DQog
CWdfYXNzZXJ0X2NtcHVpbnQoZ19saXN0X2xlbmd0aChyZWNvcmRzKSwgPT0sIDEpOw0KLS0gDQoy
LjI3LjANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW5mYyBtYWlsaW5nIGxpc3QgLS0gbGludXgtbmZjQGxpc3RzLjAxLm9yZwpUbyB1bnN1YnNj
cmliZSBzZW5kIGFuIGVtYWlsIHRvIGxpbnV4LW5mYy1sZWF2ZUBsaXN0cy4wMS5vcmcKJSh3ZWJf
cGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM=
