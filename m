Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD9A4287CB
	for <lists+linux-nfc@lfdr.de>; Mon, 11 Oct 2021 09:39:54 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 5BE7C100EAB09;
	Mon, 11 Oct 2021 00:39:52 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 19964100EBBC4
	for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 00:39:50 -0700 (PDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 52A3A4002D
	for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 07:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633937989;
	bh=p7DB9CXnt9jgmm22VXqbPUHJTzgACaTPyFxSkRyfsXw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Jb9dYUxh7cJ1n/4ImLPAWmFpMHFm6OKrvHKEWTr7lox+lSpJOLKCQm0232c8n5qi7
	 XtrVQRQ9Sl34Lh8pmTbc+cg2tZDb86FzmwxOBCtgBZSRc4TyTAAtfDEQ18ejMb1m2I
	 nIMfmEWyXVUL32f7UpqURqn1RVVpjp4boxf10kRUlllhBwEUOpDHSfijjJJWJ+yaQk
	 yfeGnw7EJiiebT8O/kzRi9kWQeBrcw9/3muGeT059Dj52US9uEjA9DXHm4/Oev6n+P
	 QXpiykZBzGv/s/ug2UrDxQmX1N9L+CNfcuYStN//2FONwKwye4SL2xivFVqwA+cbDg
	 G+n5DyOeJZ/tQ==
Received: by mail-ed1-f69.google.com with SMTP id f4-20020a50e084000000b003db585bc274so9474865edl.17
        for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 00:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p7DB9CXnt9jgmm22VXqbPUHJTzgACaTPyFxSkRyfsXw=;
        b=c2NBJ5swNwDnWo+6eczTMOCjP2LFNvZ6rVwjhUvImBIOOVV25uhaTIRH9h/Ll76eRN
         QxCni1r1bnYLdYqT0wX99LsvjWJG4N10XwQkvR/BhcnMSksszM5ecM7muE+13eOJeO/Q
         /nOVw9RaRP1dTDa8bsZ/ZluFUT4Ha0Wktx6ukfdi4qEgYOOy1j73EJzIcref5P/+H87a
         aZ3h0IiqRfkO0g/HMwa4xcXOcfNs+s3+/wgWNi+unckpflN0upOnf/kwCvSYFu4C1BLG
         w/OlXsAyFguRINFgMpz1Tks0X1diUUrpjEuAnjyMAvUGQIvwFvGweNGTPI14jzIE2Bk9
         XlXg==
X-Gm-Message-State: AOAM5324kuSqlMIpGEa96CzESaEbhrBePgHzD24qm7riQ+rv5ZLywINI
	aO9h/7aPoupBP80WR0u1uoF27u8hxkvGWjIsQShkhnbElF7Vj5s2IqAigXTLobuqXQszMMq//5U
	9uPGyZR1JM0d1/ueWVPYn5pZ/DMko65fWkA==
X-Received: by 2002:a50:cf0d:: with SMTP id c13mr38438492edk.269.1633937988953;
        Mon, 11 Oct 2021 00:39:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtcAHNa5bqyvBP7uHLdC5fEGKfVXP1SsqWgMZIcsmIr3wnyRbIRzVESmj8E1CmPDnaMSvDJA==
X-Received: by 2002:a50:cf0d:: with SMTP id c13mr38438472edk.269.1633937988744;
        Mon, 11 Oct 2021 00:39:48 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y8sm3023965ejm.104.2021.10.11.00.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 00:39:48 -0700 (PDT)
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
Date: Mon, 11 Oct 2021 09:39:29 +0200
Message-Id: <20211011073934.34340-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211011073934.34340-1-krzysztof.kozlowski@canonical.com>
References: <20211011073934.34340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 32Q3YTCPQQFW7RPFVMLFB37IJN3TETZC
X-Message-ID-Hash: 32Q3YTCPQQFW7RPFVMLFB37IJN3TETZC
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 3/8] dt-bindings: nfc: nxp,pn532: convert to dtschema
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/32Q3YTCPQQFW7RPFVMLFB37IJN3TETZC/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q29udmVydCB0aGUgTlhQIFBONTMyIE5GQyBjb250cm9sbGVyIHRvIERUIHNjaGVtYSBmb3JtYXQu
DQoNCkRyb3AgdGhlICJjbG9jay1mcmVxdWVuY3kiIHByb3BlcnR5IGR1cmluZyBjb252ZXJzaW9u
IGJlY2F1c2UgaXQgaXMgYQ0KcHJvcGVydHkgb2YgSTJDIGJ1cyBjb250cm9sbGVyLCBub3QgSTJD
IHNsYXZlIGRldmljZS4gIEl0IHdhcyBhbHNvIG5ldmVyDQp1c2VkIGJ5IHRoZSBkcml2ZXIuDQoN
ClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lA
Y2Fub25pY2FsLmNvbT4NCi0tLQ0KIC4uLi9iaW5kaW5ncy9uZXQvbmZjL254cCxwbjUzMi55YW1s
ICAgICAgICAgICB8IDY1ICsrKysrKysrKysrKysrKysrKysNCiAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9uZXQvbmZjL3BuNTMyLnR4dCAgICAgfCA0NiAtLS0tLS0tLS0tLS0tDQogMiBmaWxlcyBj
aGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspLCA0NiBkZWxldGlvbnMoLSkNCiBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9uZmMvbnhwLHBuNTMy
LnlhbWwNCiBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL25ldC9uZmMvcG41MzIudHh0DQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbmV0L25mYy9ueHAscG41MzIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9uZXQvbmZjL254cCxwbjUzMi55YW1sDQpuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KaW5kZXggMDAwMDAwMDAwMDAwLi5kOGJhNWExOGRiOTgNCi0tLSAvZGV2L251bGwNCisr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvbmZjL254cCxwbjUzMi55
YW1sDQpAQCAtMCwwICsxLDY1IEBADQorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MC1vbmx5IE9SIEJTRC0yLUNsYXVzZQ0KKyVZQU1MIDEuMg0KKy0tLQ0KKyRpZDogaHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvbmV0L25mYy9ueHAscG41MzIueWFtbCMNCiskc2NoZW1hOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCisNCit0aXRsZTog
TlhQIFNlbWljb25kdWN0b3JzIFBONTMyIE5GQyBjb250cm9sbGVyDQorDQorbWFpbnRhaW5lcnM6
DQorICAtIEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2Fs
LmNvbT4NCisNCitwcm9wZXJ0aWVzOg0KKyAgY29tcGF0aWJsZToNCisgICAgb25lT2Y6DQorICAg
ICAgLSBjb25zdDogbnhwLHBuNTMyDQorICAgICAgLSBkZXNjcmlwdGlvbjogRGVwcmVjYXRlZCBi
aW5kaW5ncw0KKyAgICAgICAgZW51bToNCisgICAgICAgICAgLSBueHAscG41MzItaTJjDQorICAg
ICAgICAgIC0gbnhwLHBuNTMzLWkyYw0KKyAgICAgICAgZGVwcmVjYXRlZDogdHJ1ZQ0KKw0KKyAg
aW50ZXJydXB0czoNCisgICAgZGVzY3JpcHRpb246IFJlcXVpcmVkIGlmIGNvbm5lY3RlZCB2aWEg
STJDDQorICAgIG1heEl0ZW1zOiAxDQorDQorICByZWc6DQorICAgIGRlc2NyaXB0aW9uOiBSZXF1
aXJlZCBpZiBjb25uZWN0ZWQgdmlhIEkyQw0KKyAgICBtYXhJdGVtczogMQ0KKw0KK3JlcXVpcmVk
Og0KKyAgLSBjb21wYXRpYmxlDQorDQorZGVwZW5kZW5jaWVzOg0KKyAgaW50ZXJydXB0czogWyAn
cmVnJyBdDQorDQorYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQorDQorZXhhbXBsZXM6DQor
ICAjIFBONTMyIG9uIEkyQyBidXMNCisgIC0gfA0KKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
aW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+DQorDQorICAgIGkyYyB7DQorICAgICAgICAjYWRk
cmVzcy1jZWxscyA9IDwxPjsNCisgICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KKw0KKyAgICAg
ICAgbmZjQDI0IHsNCisgICAgICAgICAgICBjb21wYXRpYmxlID0gIm54cCxwbjUzMiI7DQorDQor
ICAgICAgICAgICAgcmVnID0gPDB4MjQ+Ow0KKw0KKyAgICAgICAgICAgIGludGVycnVwdC1wYXJl
bnQgPSA8JmdwaW8xPjsNCisgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDE3IElSUV9UWVBFX0xF
VkVMX0hJR0g+Ow0KKyAgICAgICAgfTsNCisgICAgfTsNCisNCisgICMgUE41MzIgY29ubmVjdGVk
IHZpYSBVQVJUDQorICAtIHwNCisgICAgc2VyaWFsQDQ5MDQyMDAwIHsNCisgICAgICAgIHJlZyA9
IDwweDQ5MDQyMDAwIDB4NDAwPjsNCisNCisgICAgICAgIG5mYyB7DQorICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJueHAscG41MzIiOw0KKyAgICAgICAgfTsNCisgICAgfTsNCmRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L25mYy9wbjUzMi50eHQgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L25mYy9wbjUzMi50eHQNCmRlbGV0
ZWQgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggYTU1MDdkYzQ5OWJjLi4wMDAwMDAwMDAwMDANCi0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvbmZjL3BuNTMyLnR4dA0K
KysrIC9kZXYvbnVsbA0KQEAgLTEsNDYgKzAsMCBAQA0KLSogTlhQIFNlbWljb25kdWN0b3JzIFBO
NTMyIE5GQyBDb250cm9sbGVyDQotDQotUmVxdWlyZWQgcHJvcGVydGllczoNCi0tIGNvbXBhdGli
bGU6IFNob3VsZCBiZQ0KLSAgICAtICJueHAscG41MzIiIFBsYWNlIGEgbm9kZSB3aXRoIHRoaXMg
aW5zaWRlIHRoZSBkZXZpY2V0cmVlIG5vZGUgb2YgdGhlIGJ1cw0KLSAgICAgICAgICAgICAgICAg
IHdoZXJlIHRoZSBORkMgY2hpcCBpcyBjb25uZWN0ZWQgdG8uDQotICAgICAgICAgICAgICAgICAg
Q3VycmVudGx5IHRoZSBrZXJuZWwgaGFzIHBoeSBiaW5kaW5ncyBmb3IgdWFydCBhbmQgaTJjLg0K
LSAgICAtICJueHAscG41MzItaTJjIiAoREVQUkVDQVRFRCkgb25seSB3b3JrcyBmb3IgdGhlIGky
YyBiaW5kaW5nLg0KLSAgICAtICJueHAscG41MzMtaTJjIiAoREVQUkVDQVRFRCkgb25seSB3b3Jr
cyBmb3IgdGhlIGkyYyBiaW5kaW5nLg0KLQ0KLVJlcXVpcmVkIHByb3BlcnRpZXMgaWYgY29ubmVj
dGVkIG9uIGkyYzoNCi0tIGNsb2NrLWZyZXF1ZW5jeTogScKyQyB3b3JrIGZyZXF1ZW5jeS4NCi0t
IHJlZzogZm9yIHRoZSBJwrJDIGJ1cyBhZGRyZXNzLiBUaGlzIGlzIGZpeGVkIGF0IDB4MjQgZm9y
IHRoZSBQTjUzMi4NCi0tIGludGVycnVwdHM6IEdQSU8gaW50ZXJydXB0IHRvIHdoaWNoIHRoZSBj
aGlwIGlzIGNvbm5lY3RlZA0KLQ0KLU9wdGlvbmFsIFNvQyBTcGVjaWZpYyBQcm9wZXJ0aWVzOg0K
LS0gcGluY3RybC1uYW1lczogQ29udGFpbnMgb25seSBvbmUgdmFsdWUgLSAiZGVmYXVsdCIuDQot
LSBwaW50Y3RybC0wOiBTcGVjaWZpZXMgdGhlIHBpbiBjb250cm9sIGdyb3VwcyB1c2VkIGZvciB0
aGlzIGNvbnRyb2xsZXIuDQotDQotRXhhbXBsZSAoZm9yIEFSTS1iYXNlZCBCZWFnbGVCb25lIHdp
dGggUE41MzIgb24gSTJDMik6DQotDQotJmkyYzIgew0KLQ0KLQ0KLQlwbjUzMjogbmZjQDI0IHsN
Ci0NCi0JCWNvbXBhdGlibGUgPSAibnhwLHBuNTMyIjsNCi0NCi0JCXJlZyA9IDwweDI0PjsNCi0J
CWNsb2NrLWZyZXF1ZW5jeSA9IDw0MDAwMDA+Ow0KLQ0KLQkJaW50ZXJydXB0LXBhcmVudCA9IDwm
Z3BpbzE+Ow0KLQkJaW50ZXJydXB0cyA9IDwxNyBJUlFfVFlQRV9FREdFX0ZBTExJTkc+Ow0KLQ0K
LQl9Ow0KLX07DQotDQotRXhhbXBsZSAoZm9yIFBONTMyIGNvbm5lY3RlZCB2aWEgdWFydCk6DQot
DQotdWFydDQ6IHNlcmlhbEA0OTA0MjAwMCB7DQotICAgICAgICBjb21wYXRpYmxlID0gInRpLG9t
YXAzLXVhcnQiOw0KLQ0KLSAgICAgICAgcG41MzI6IG5mYyB7DQotICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAibnhwLHBuNTMyIjsNCi0gICAgICAgIH07DQotfTsNCi0tIA0KMi4zMC4yDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1uZmMg
bWFpbGluZyBsaXN0IC0tIGxpbnV4LW5mY0BsaXN0cy4wMS5vcmcKVG8gdW5zdWJzY3JpYmUgc2Vu
ZCBhbiBlbWFpbCB0byBsaW51eC1uZmMtbGVhdmVAbGlzdHMuMDEub3JnCiUod2ViX3BhZ2VfdXJs
KXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlz
