Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9873CD319
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:12 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 15592100EB859;
	Mon, 19 Jul 2021 04:09:11 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 4E1F7100EB855
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:08 -0700 (PDT)
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 576C0408B2
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692947;
	bh=Z7DGWJIas6tMyxRKMwFWiecihVoQTXMJAjHX+immGKk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=cqKz7998q/lRi8v+2LJ+cbJXnDAG5o2Ix66/HQlIaYiuPggvM84Z376aVMO/TLfhu
	 9UXJ2iQfUDlmbcymQmm/l/MDhaIxoa1MsxprG6tQ8Tw0UYqbkMxxsJLw5WFYZn6531
	 ITPJe01A1TtHcl+XZaZCFaAiP71RJKosDA5c9aRyM5RXl9Il5ilPybJUjMSMOYHCz6
	 AKfB1TgGYEfvrVc7qQfypsfic1+vu4oDZBtv7mBHWtJvZ4vIwzXhtBvc03cwFyd1Gt
	 uL1nJ8m/dLfpBzWPUoPvSRFHJ1HvjjpNPNI20J4/4RtcJQiWG9lSuprEKS6Y8qEm2V
	 xI8ikhc0XZkzg==
Received: by mail-lj1-f200.google.com with SMTP id v10-20020a2ea60a0000b029017fd05dc0aaso9302288ljp.1
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z7DGWJIas6tMyxRKMwFWiecihVoQTXMJAjHX+immGKk=;
        b=oHm3l0Q5rMJVYZIkB2M0XJaV0ePVO6obYuEfdcLrCqonir8ozOuwN91iGGlH78wcEJ
         LbsmnsxRGIW3yFV7nPJJMJqES/bAaqV7q+ZXOVyNWBuCUAwe68wnrBud4YBoya8Xl7xv
         967E1ayen656gkdWzHIm9VFb6qaj7JIAHJIfH2cm1ZJCX+7Ifmi6ehBdDmJY76MqnRrj
         xbpy+DS9eOVxqP82oP131f8wImcWzkp39WLWd0vIgrMD4KhOw1fcZNOTpDkogtWFnHQw
         9ktsLbRZK5hCJjuQUt1Af9MQA7/buRM39U0EJTT2x0wXMFKjlFqAfzyctUuBUojRFC4v
         8gvA==
X-Gm-Message-State: AOAM530J+4qNy7oRE/6Ll9duV3ls1VN00UWgrIRAlmLMpJVdZBj/o6jU
	cvEBSDp0pi2drdORugDV0SaSjfXvnAJvhoJmA+RTdKZ3DRs/QIauqDW48Fln5yfJQd6XLx/kK4R
	pdprYGf/SysvHH8Su3wPugPZNroXdDx9ung==
X-Received: by 2002:a2e:309:: with SMTP id 9mr22079337ljd.82.1626692946629;
        Mon, 19 Jul 2021 04:09:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9BEOY3F3sucpW4CarhAxj4J2kYwcQY7exWaD1X9esKyUPuGNdeI414+nSYGnPULt6VNdrKg==
X-Received: by 2002:a2e:309:: with SMTP id 9mr22079330ljd.82.1626692946496;
        Mon, 19 Jul 2021 04:09:06 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:34 +0200
Message-Id: <20210719110819.27340-29-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: QGHPBNPWJYB72E6T3M6S26BZGVRL6TIU
X-Message-ID-Hash: QGHPBNPWJYB72E6T3M6S26BZGVRL6TIU
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 28/73] nfctype5: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/QGHPBNPWJYB72E6T3M6S26BZGVRL6TIU/>
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
eXBlNS5jIGIvcGx1Z2lucy9uZmN0eXBlNS5jDQppbmRleCAzZDJjZGYwMzBkNGYuLjBmOTBlNTVh
YjI2OCAxMDA2NDQNCi0tLSBhL3BsdWdpbnMvbmZjdHlwZTUuYw0KKysrIGIvcGx1Z2lucy9uZmN0
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
