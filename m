Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1A73C3F1C
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:24:47 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id DEE58100EB338;
	Sun, 11 Jul 2021 13:24:44 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id CB3A8100EB33A
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:42 -0700 (PDT)
Received: from mail-wr1-f72.google.com ([209.85.221.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2g0H-0001rB-Gu
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:24:41 +0000
Received: by mail-wr1-f72.google.com with SMTP id d9-20020adffbc90000b029011a3b249b10so6086354wrs.3
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g+r/Xpd4hGQzux4e96l3o0AuJubspIkbIQeqKDbrbE4=;
        b=XDUJgTQZ5/vwmICkB6Oc8qtOxRiExiMMdON795YVrvcsDg+PEZAlXIuc2Mmit7UmVN
         8bfSm00jCPh8gWmLTdxDBSSaimXVhSOt/9c5OiGJLvZ7AyVw222/8y7L35wFn8f0EKsP
         66d8kyHUfF0YqkgVcZ5j/acp+fgOwRrozCC/nfutgI99UamPYd3tDoB1L+PzV22i0LGw
         FEoinBhELotEog7l444ygcaMhaJNczZs8aTOzhRk7SnteGqUFq//V9f+QZO8X1XB3MDE
         wpnU7F/hPUIyy6yacV5iMACAHctNKIbdgJLsMxsoBf2KXivKP1s3wM01yl0gQjTb83Jo
         VXrg==
X-Gm-Message-State: AOAM532rTlZgS2i3UL/MQdzQIIaZhXxucN9aKVudSMCikL/tL3DRDoms
	bB3/G9rNVW8jmz+rdRU+j8yEJot7PPwUm5uzn69YFuskXmNh4F4CYgSaBpzLjNCc7nzQFhcjh1V
	dGaOgN3ijxiWxBG/YyQAgKS1qzT2v6uM0EA==
X-Received: by 2002:adf:e78c:: with SMTP id n12mr36966201wrm.382.1626035081105;
        Sun, 11 Jul 2021 13:24:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXpTmPYhdQG2ycW14Wa4s88VEgoBS3Tw538Gea9C6djDJoJSKk3MWsiJrgqBjhBHMLIX3XAg==
X-Received: by 2002:adf:e78c:: with SMTP id n12mr36966194wrm.382.1626035081000;
        Sun, 11 Jul 2021 13:24:41 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id n12sm12501575wmq.5.2021.07.11.13.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:24:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:23:39 +0200
Message-Id: <20210711202351.18363-10-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: QF4R5C7NE6ONJ46ELMQZSKWQLJ7D7CIC
X-Message-ID-Hash: QF4R5C7NE6ONJ46ELMQZSKWQLJ7D7CIC
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 22/34] mifare: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/QF4R5C7NE6ONJ46ELMQZSKWQLJ7D7CIC/>
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
