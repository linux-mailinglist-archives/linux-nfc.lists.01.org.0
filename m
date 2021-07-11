Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6323C3F1B
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:24:46 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id CD32C100EB847;
	Sun, 11 Jul 2021 13:24:43 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id D0D7A100EB33A
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:41 -0700 (PDT)
Received: from mail-wr1-f70.google.com ([209.85.221.70])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2g0G-0001qg-FR
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:24:40 +0000
Received: by mail-wr1-f70.google.com with SMTP id u7-20020a5d46870000b029012786ba1bc9so6165278wrq.21
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OScaimav8fKNCVO10qTfBoAr9Q6YP2NtpVSXI6Luy6s=;
        b=IStDl7hC27EcGTnHPnfnYnCjZpHj3yR8vfUMctNezRfHykM+ILyPv2Mv6RJWXFMH/l
         CPCnUQUlBAurBwAvGrM0/sEBON61h/1vFJvEQHoelORL8KGDU30F59liKSpNyxKJ7Iuw
         G2zdHuifE+YXwuwj9wt9UzHfJ4we50w16SAA3yhn+SR8a3YnfKT6b+wbSvvQfQ5mBvI3
         c4Im6uI9aPeXHt/VG3T31d3rG2PRREP6diuvvPN79SD9OUnKRDgepLRoHmfNZCDOwtkO
         T2VuBsolpd/22f8cWLQ7ipoJJ+uoFGI7CZCXAKfXTiP/ywwQczJi78xPN/t4s0jntIqU
         kNJw==
X-Gm-Message-State: AOAM532YLKr6XtUjlxOf8KV7yYSnlJtYvQu4jI6qRapOs2JbNYgOiWjO
	9RXk5+XwBSYYl7RsHOL5EuZb0osmrqFRcY3u8/gZP6A3cK63ehFNspxlQWA+u4LkY9R2Piw2Fdr
	A3m4nowNSl5bmSo478msQcl2cclxy3LRiRg==
X-Received: by 2002:adf:f8cd:: with SMTP id f13mr15383390wrq.328.1626035080023;
        Sun, 11 Jul 2021 13:24:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+xxkKyOPL7I31jWe6qqBJQIoteorD1jsCyG11UZCmkKfMvzBtrVk8fYWQCDQALDj530/64w==
X-Received: by 2002:adf:f8cd:: with SMTP id f13mr15383386wrq.328.1626035079921;
        Sun, 11 Jul 2021 13:24:39 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id n12sm12501575wmq.5.2021.07.11.13.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:24:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:23:38 +0200
Message-Id: <20210711202351.18363-9-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: ONB4OYE4X43IWVHGVIA4N7R5GUOJ62XI
X-Message-ID-Hash: ONB4OYE4X43IWVHGVIA4N7R5GUOJ62XI
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 21/34] nfctype5: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ONB4OYE4X43IWVHGVIA4N7R5GUOJ62XI/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UHJvcGVybHkgcHJpbnQgc2lnbmVkIGFuZCB1bnNpZ25lZCBpbnRlZ2Vycy4gIFRoaXMgZml4ZXMg
d2FybmluZ3MgbGlrZToNCg0KICAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBwbHVnaW5zL25mY3R5
cGU1LmM6Mjk6DQogICAgcGx1Z2lucy9uZmN0eXBlNS5jOiBJbiBmdW5jdGlvbiDigJh0NV9yZWFk
4oCZOg0KICAgIC4vaW5jbHVkZS9uZWFyL2xvZy5oOjQ1OjE0OiBlcnJvcjogZm9ybWF0IOKAmCV6
ZOKAmSBleHBlY3RzIGFyZ3VtZW50IG9mIHR5cGUg4oCYc2lnbmVkIHNpemVfdOKAmSwgYnV0IGFy
Z3VtZW50IDQgaGFzIHR5cGUg4oCYc2l6ZV904oCZIHtha2Eg4oCYbG9uZyB1bnNpZ25lZCBpbnTi
gJl9IFstV2Vycm9yPWZvcm1hdD1dDQogICAgICAgNDUgfCAgIG5lYXJfZGVidWcoIiVzOiVzKCkg
IiBmbXQsIFwNCiAgICAgICAgICB8ICAgICAgICAgICAgICBefn5+fn5+fn5+DQogICAgcGx1Z2lu
cy9uZmN0eXBlNS5jOjQzNzoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYREJH4oCZ
DQogICAgICA0MzcgfCAgREJHKCJSZWFkaW5nICV6ZCBieXRlcyBzdGFydGluZyBhdCBvZmZzZXQg
JWRcbiIsIGxlbiwgb2Zmc2V0KTsNCiAgICAgICAgICB8ICBefn4NCg0KU2lnbmVkLW9mZi1ieTog
S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBjYW5vbmljYWwuY29tPg0K
LS0tDQogcGx1Z2lucy9uZmN0eXBlNS5jIHwgNiArKystLS0NCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvcGx1Z2lucy9uZmN0
eXBlNS5jIGIvcGx1Z2lucy9uZmN0eXBlNS5jDQppbmRleCBiN2QyNDBlNTE5YmUuLmVlZjJhZmU5
ZjZkMCAxMDA2NDQNCi0tLSBhL3BsdWdpbnMvbmZjdHlwZTUuYw0KKysrIGIvcGx1Z2lucy9uZmN0
eXBlNS5jDQpAQCAtNDM0LDcgKzQzNCw3IEBAIHN0YXRpYyBpbnQgdDVfcmVhZChzdHJ1Y3QgbmVh
cl90YWcgKnRhZywgdWludDhfdCBvZmZzZXQsIHVpbnQ4X3QgKmJ1ZiwNCiAJdWludDhfdCBibGtf
c2l6ZSA9IG5lYXJfdGFnX2dldF9ibGtfc2l6ZSh0YWcpOw0KIAlpbnQgZXJyOw0KIA0KLQlEQkco
IlJlYWRpbmcgJXpkIGJ5dGVzIHN0YXJ0aW5nIGF0IG9mZnNldCAlZFxuIiwgbGVuLCBvZmZzZXQp
Ow0KKwlEQkcoIlJlYWRpbmcgJXp1IGJ5dGVzIHN0YXJ0aW5nIGF0IG9mZnNldCAldVxuIiwgbGVu
LCBvZmZzZXQpOw0KIA0KIAllcnIgPSB0NV9jbWRfaGRyX2luaXQodGFnLCAmdDVfY21kLmhkciwg
Q01EX1JFQURfU0lOR0xFX0JMT0NLKTsNCiAJaWYgKGVycikNCkBAIC01MzIsMTAgKzUzMiwxMCBA
QCBzdGF0aWMgaW50IHQ1X3dyaXRlKHN0cnVjdCBuZWFyX3RhZyAqdGFnLCB1aW50OF90IG9mZnNl
dCwgdWludDhfdCAqYnVmLA0KIAl1aW50OF90IGJsa19zaXplID0gbmVhcl90YWdfZ2V0X2Jsa19z
aXplKHRhZyk7DQogCWludCBlcnI7DQogDQotCURCRygiV3JpdGluZyAlemQgYnl0ZXMgc3RhcnRp
bmcgYXQgb2Zmc2V0ICVkXG4iLCBsZW4sIG9mZnNldCk7DQorCURCRygiV3JpdGluZyAlenUgYnl0
ZXMgc3RhcnRpbmcgYXQgb2Zmc2V0ICV1XG4iLCBsZW4sIG9mZnNldCk7DQogDQogCWlmIChvZmZz
ZXQgJSBibGtfc2l6ZSkgew0KLQkJbmVhcl9lcnJvcigiV3JpdGUgLSBJbnZhbGlkIG9mZnNldCAt
IG9mZnNldDogJWQsIGJsa19zaXplOiAlZCIsDQorCQluZWFyX2Vycm9yKCJXcml0ZSAtIEludmFs
aWQgb2Zmc2V0IC0gb2Zmc2V0OiAldSwgYmxrX3NpemU6ICV1IiwNCiAJCQkgICBvZmZzZXQsIGJs
a19zaXplKTsNCiAJCXJldHVybiAtRUlOVkFMOw0KIAl9DQotLSANCjIuMjcuMA0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbmZjIG1haWxpbmcg
bGlzdCAtLSBsaW51eC1uZmNAbGlzdHMuMDEub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1h
aWwgdG8gbGludXgtbmZjLWxlYXZlQGxpc3RzLjAxLm9yZwolKHdlYl9wYWdlX3VybClzbGlzdGlu
Zm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpcw==
