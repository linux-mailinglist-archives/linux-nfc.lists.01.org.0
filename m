Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E694281C1
	for <lists+linux-nfc@lfdr.de>; Sun, 10 Oct 2021 16:23:35 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4817F100EAB63;
	Sun, 10 Oct 2021 07:23:32 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 8B4AD100EAB54
	for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 07:23:30 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BFD663FFF6
	for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 14:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633875808;
	bh=Sqq+rJjHFyF04O1yXJWbxHdRB21zrCNZRwhAK9LaA+4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NE63b3ZyxlzmMTbbrNq5oTS7XywVrP7xFe7t/wBkvhnAiihd65iux9Rtvc5T3Fguq
	 VLuoInqhpukz2QBpwOZNOhnKat1H9b9x8/usF4tgsC19lr7OqyPSYLwU9idFBKsfwM
	 SJynte9Zvqm/6NvvmpFgjw4pdvWhZmNFboXw5ACQHklyLMgl2f2hKak3AL0jhwUxn4
	 azn8HFNUfxkj5/ThMrGbCaoSPg6T9bRucb511f2vJu3uJfCJhw1CZZoFayfj+XmeGn
	 hrDVpVX3SV6baRLZ+YsrnZDlvunvjSah80GEaLSZogB0ZE0edyG83XxFMKaionypSu
	 02cerbu+10LdA==
Received: by mail-ed1-f70.google.com with SMTP id v9-20020a50d849000000b003db459aa3f5so10864071edj.15
        for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 07:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sqq+rJjHFyF04O1yXJWbxHdRB21zrCNZRwhAK9LaA+4=;
        b=nLpUsG1ovYBDk8Ir+0lFPkiPR1NkRKn/oOUlfY7Y6ZyrlWQn5503VbVp0bASsLAzgS
         4fQzL5w3qzrpeCHA8g7EywfqEv8F+bHz/QOyGUxcy1F/QPE3RNnzcbivzc2Rd6RygkdV
         jmJQRds8w7KCJoL6Qr6Wezzoz+cutRLMiGGFpb3Zs4FUZQ0/kURBxWwwE8MoH5FA4ovq
         3dP0v2gtK3sID5HvOI4MspJ47d82AsOAmsLwolp7FRM0t+7VRG5vIt07sN3Z5VQzOKhD
         aNXQ3oSNXfcS0K+YEppAy9GzVjmPVO92LiWKDyaNCedgLHnoJLsulnkptTq/IM37tZhl
         IUiQ==
X-Gm-Message-State: AOAM532W1kmjacJbZoLrH3DWjvq1EwdLUI7jhqcqrqTQ3rpw0H9CTenZ
	zwsLSADr6j7lYEuSW3RFTJBH1TDtyQBs7Iz6r3F+FewVfKOo+fjKCiDnSH6/lznwuFPWmtQm416
	fqSj6S32hlEd2plFVaNkWDt4SVAER0a6ZMA==
X-Received: by 2002:a17:906:f243:: with SMTP id gy3mr19625850ejb.327.1633875808467;
        Sun, 10 Oct 2021 07:23:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygD3KxN2qJU4LDVv1B2y+f6WnK3BXJ1VsrwWfy7ykP5hc4CknX+W8Wk656n8tIDYBu5hp19A==
X-Received: by 2002:a17:906:f243:: with SMTP id gy3mr19625832ejb.327.1633875808307;
        Sun, 10 Oct 2021 07:23:28 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 6sm2129017ejx.82.2021.10.10.07.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 07:23:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Charles Gorand <charles.gorand@effinnov.com>,
	Mark Greer <mgreer@animalcreek.com>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Date: Sun, 10 Oct 2021 16:23:13 +0200
Message-Id: <20211010142317.168259-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211010142317.168259-1-krzysztof.kozlowski@canonical.com>
References: <20211010142317.168259-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: EOE7RKNMLIK2QORMN5SDXNEQYMBBDDLJ
X-Message-ID-Hash: EOE7RKNMLIK2QORMN5SDXNEQYMBBDDLJ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 3/7] dt-bindings: nfc: st,st21nfca: convert to dtschema
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/EOE7RKNMLIK2QORMN5SDXNEQYMBBDDLJ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q29udmVydCB0aGUgU1QgU1QyMU5GQ0EgTkZDIGNvbnRyb2xsZXIgdG8gRFQgc2NoZW1hIGZvcm1h
dC4gIFRoZQ0KY29udmVyc2lvbiBhbHNvIGFkZHMgYSBuZXcgcmVxdWlyZWQgcHJvcGVydHkgLSBp
bnRlcnJ1cHRzIC0gYmVjYXVzZSBpdA0Kd2FzIG1pc3NpbmcgaW4gdGhlIG9sZCBiaW5kaW5ncyBi
eSBtaXN0YWtlLg0KDQpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0
b2Yua296bG93c2tpQGNhbm9uaWNhbC5jb20+DQotLS0NCiAuLi4vYmluZGluZ3MvbmV0L25mYy9z
dCxzdDIxbmZjYS55YW1sICAgICAgICAgfCA2OCArKysrKysrKysrKysrKysrKysrDQogLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbmV0L25mYy9zdDIxbmZjYS50eHQgIHwgMzcgLS0tLS0tLS0tLQ0K
IDIgZmlsZXMgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pDQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvbmZj
L3N0LHN0MjFuZmNhLnlhbWwNCiBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL25ldC9uZmMvc3QyMW5mY2EudHh0DQoNCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L25mYy9zdCxzdDIxbmZjYS55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9uZmMvc3Qsc3QyMW5mY2EueWFt
bA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAwMC4uMmNiNjVmZDUxN2Vk
DQotLS0gL2Rldi9udWxsDQorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bmV0L25mYy9zdCxzdDIxbmZjYS55YW1sDQpAQCAtMCwwICsxLDY4IEBADQorIyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQ0KKyVZQU1MIDEuMg0K
Ky0tLQ0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbmV0L25mYy9zdCxzdDIx
bmZjYS55YW1sIw0KKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMv
Y29yZS55YW1sIw0KKw0KK3RpdGxlOiBTVE1pY3JvZWxlY3Ryb25pY3MgU0FTIFNUMjFORkNBIE5G
QyBjb250cm9sbGVyDQorDQorbWFpbnRhaW5lcnM6DQorICAtIEtyenlzenRvZiBLb3psb3dza2kg
PGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNvbT4NCisNCitwcm9wZXJ0aWVzOg0KKyAg
Y29tcGF0aWJsZToNCisgICAgY29uc3Q6IHN0LHN0MjFuZmNhLWkyYw0KKw0KKyAgY2xvY2stZnJl
cXVlbmN5OiB0cnVlDQorDQorICBlbmFibGUtZ3Bpb3M6DQorICAgIGRlc2NyaXB0aW9uOiBPdXRw
dXQgR1BJTyBwaW4gdXNlZCBmb3IgZW5hYmxpbmcvZGlzYWJsaW5nIHRoZSBjb250cm9sbGVyDQor
DQorICBlc2UtcHJlc2VudDoNCisgICAgdHlwZTogYm9vbGVhbg0KKyAgICBkZXNjcmlwdGlvbjog
fA0KKyAgICAgIFNwZWNpZmllcyB0aGF0IGFuIGVzZSBpcyBwaHlzaWNhbGx5IGNvbm5lY3RlZCB0
byB0aGUgY29udHJvbGxlcg0KKw0KKyAgaW50ZXJydXB0czoNCisgICAgbWF4SXRlbXM6IDENCisN
CisgIHJlZzoNCisgICAgbWF4SXRlbXM6IDENCisNCisgIHVpY2MtcHJlc2VudDoNCisgICAgdHlw
ZTogYm9vbGVhbg0KKyAgICBkZXNjcmlwdGlvbjogfA0KKyAgICAgIFNwZWNpZmllcyB0aGF0IHRo
ZSB1aWNjIHN3cCBzaWduYWwgY2FuIGJlIHBoeXNpY2FsbHkgY29ubmVjdGVkIHRvIHRoZQ0KKyAg
ICAgIGNvbnRyb2xsZXINCisNCityZXF1aXJlZDoNCisgIC0gY29tcGF0aWJsZQ0KKyAgLSBjbG9j
ay1mcmVxdWVuY3kNCisgIC0gZW5hYmxlLWdwaW9zDQorICAtIGludGVycnVwdHMNCisgIC0gcmVn
DQorDQorYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQorDQorZXhhbXBsZXM6DQorICAtIHwN
CisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPg0KKyAgICAjaW5jbHVkZSA8
ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+DQorDQorICAgIGkyYyB7DQor
ICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCisgICAgICAgICNzaXplLWNlbGxzID0gPDA+
Ow0KKw0KKyAgICAgICAgbmZjQDEgew0KKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic3Qsc3Qy
MW5mY2EtaTJjIjsNCisgICAgICAgICAgICByZWcgPSA8MHgxPjsNCisNCisgICAgICAgICAgICBj
bG9jay1mcmVxdWVuY3kgPSA8NDAwMDAwPjsNCisgICAgICAgICAgICBpbnRlcnJ1cHQtcGFyZW50
ID0gPCZncGlvNT47DQorICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwyIElSUV9UWVBFX0xFVkVM
X0xPVz47DQorICAgICAgICAgICAgZW5hYmxlLWdwaW9zID0gPCZncGlvNSAyOSBHUElPX0FDVElW
RV9ISUdIPjsNCisNCisgICAgICAgICAgICBlc2UtcHJlc2VudDsNCisgICAgICAgICAgICB1aWNj
LXByZXNlbnQ7DQorICAgICAgICB9Ow0KKyAgICB9Ow0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvbmZjL3N0MjFuZmNhLnR4dCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvbmZjL3N0MjFuZmNhLnR4dA0KZGVsZXRlZCBmaWxl
IG1vZGUgMTAwNjQ0DQppbmRleCBiOGJkOTBmODBlMTIuLjAwMDAwMDAwMDAwMA0KLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9uZmMvc3QyMW5mY2EudHh0DQorKysg
L2Rldi9udWxsDQpAQCAtMSwzNyArMCwwIEBADQotKiBTVE1pY3JvZWxlY3Ryb25pY3MgU0FTLiBT
VDIxTkZDQSBORkMgQ29udHJvbGxlcg0KLQ0KLVJlcXVpcmVkIHByb3BlcnRpZXM6DQotLSBjb21w
YXRpYmxlOiBTaG91bGQgYmUgInN0LHN0MjFuZmNhLWkyYyIuDQotLSBjbG9jay1mcmVxdWVuY3k6
IEnCskMgd29yayBmcmVxdWVuY3kuDQotLSByZWc6IGFkZHJlc3Mgb24gdGhlIGJ1cw0KLS0gZW5h
YmxlLWdwaW9zOiBPdXRwdXQgR1BJTyBwaW4gdXNlZCBmb3IgZW5hYmxpbmcvZGlzYWJsaW5nIHRo
ZSBTVDIxTkZDQQ0KLQ0KLU9wdGlvbmFsIFNvQyBTcGVjaWZpYyBQcm9wZXJ0aWVzOg0KLS0gcGlu
Y3RybC1uYW1lczogQ29udGFpbnMgb25seSBvbmUgdmFsdWUgLSAiZGVmYXVsdCIuDQotLSBwaW50
Y3RybC0wOiBTcGVjaWZpZXMgdGhlIHBpbiBjb250cm9sIGdyb3VwcyB1c2VkIGZvciB0aGlzIGNv
bnRyb2xsZXIuDQotLSBlc2UtcHJlc2VudDogU3BlY2lmaWVzIHRoYXQgYW4gZXNlIGlzIHBoeXNp
Y2FsbHkgY29ubmVjdGVkIHRvIHRoZSBuZmMNCi1jb250cm9sbGVyLg0KLS0gdWljYy1wcmVzZW50
OiBTcGVjaWZpZXMgdGhhdCB0aGUgdWljYyBzd3Agc2lnbmFsIGNhbiBiZSBwaHlzaWNhbGx5DQot
Y29ubmVjdGVkIHRvIHRoZSBuZmMgY29udHJvbGxlci4NCi0NCi1FeGFtcGxlIChmb3IgQVJNLWJh
c2VkIEJlYWdsZUJvYXJkIHhNIHdpdGggU1QyMU5GQ0Egb24gSTJDMik6DQotDQotJmkyYzIgew0K
LQ0KLQ0KLQlzdDIxbmZjYTogc3QyMW5mY2FAMSB7DQotDQotCQljb21wYXRpYmxlID0gInN0LHN0
MjFuZmNhLWkyYyI7DQotDQotCQlyZWcgPSA8MHgwMT47DQotCQljbG9jay1mcmVxdWVuY3kgPSA8
NDAwMDAwPjsNCi0NCi0JCWludGVycnVwdC1wYXJlbnQgPSA8JmdwaW81PjsNCi0JCWludGVycnVw
dHMgPSA8MiBJUlFfVFlQRV9MRVZFTF9MT1c+Ow0KLQ0KLQkJZW5hYmxlLWdwaW9zID0gPCZncGlv
NSAyOSBHUElPX0FDVElWRV9ISUdIPjsNCi0NCi0JCWVzZS1wcmVzZW50Ow0KLQkJdWljYy1wcmVz
ZW50Ow0KLQl9Ow0KLX07DQotLSANCjIuMzAuMg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbmZjIG1haWxpbmcgbGlzdCAtLSBsaW51eC1uZmNA
bGlzdHMuMDEub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gbGludXgtbmZjLWxl
YXZlQGxpc3RzLjAxLm9yZwolKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2lu
dGVybmFsX25hbWUpcw==
