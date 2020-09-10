Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 006BD26496F
	for <lists+linux-nfc@lfdr.de>; Thu, 10 Sep 2020 18:12:58 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id C849114263423;
	Thu, 10 Sep 2020 09:12:56 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=krzk@kernel.org; receiver=<UNKNOWN> 
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id E88EC14263418
	for <linux-nfc@lists.01.org>; Thu, 10 Sep 2020 09:12:53 -0700 (PDT)
Received: from localhost.localdomain (unknown [194.230.155.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1291C221E3;
	Thu, 10 Sep 2020 16:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599754373;
	bh=LSW0uymH0OeH2QEOskyhHoNpO0V0yrS0w9bNxI5XbcU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=N3A2HH9u3+u9lRw+0UfmuLrQq9cxqa3DlrDeQRcS7m/Y+QeSqTpYwu6Fq3iLvxNCC
	 OPmNpNhelk+caKCa9tuFeHJCH8U9nyFe052Z3ZPvpJiOLpH+4vKRvWpwwWRcA615YV
	 VC1u+klljK+gGnC2C9UsOtej+1AgHU+hpTHSuJfU=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Opasiak <k.opasiak@samsung.com>,
	Kukjin Kim <kgene@kernel.org>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-nfc@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Date: Thu, 10 Sep 2020 18:12:18 +0200
Message-Id: <20200910161219.6237-8-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910161219.6237-1-krzk@kernel.org>
References: <20200910161219.6237-1-krzk@kernel.org>
MIME-Version: 1.0
Message-ID-Hash: ZWP5OA3JHNDQQ3CD3NFTMNO2N6ZST7NZ
X-Message-ID-Hash: ZWP5OA3JHNDQQ3CD3NFTMNO2N6ZST7NZ
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v3 7/8] MAINTAINERS: Add Krzysztof Kozlowski to Samsung S3FWRN5 and remove Robert
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ZWP5OA3JHNDQQ3CD3NFTMNO2N6ZST7NZ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Um9iZXJ0IEJhxYJkeWdhJ3MgZW1haWwgZG9lcyBub3Qgd29yayAoYm91bmNlcykgc2luY2UgMjAx
NiBzbyByZW1vdmUgaXQuDQpBZGRpdGlvbmFsbHkgdGhlcmUgYXJlIG5vIHJldmlldy9hY2svdGVz
dGVkIHRhZ3MgZnJvbSBLcnp5c3p0b2YgT3Bhc2lhaw0Kc28gaXQgbG9va3MgbGlrZSB0aGUgZHJp
dmVyIGlzIG5vdCBzdXBwb3J0ZWQuDQoNCkFzIGEgbWFpbnRhaW5lciBvZiBTYW1zdW5nIEFSTS9B
Uk02NCBTb0MsIEkgY2FuIHRha2UgY2FyZSBhYm91dCB0aGlzDQpkcml2ZXIgYW5kIHByb3ZpZGUg
c29tZSByZXZpZXcuICBIb3dldmVyIGNsZWFybHkgZHJpdmVyIGlzIG5vdCBpbg0Kc3VwcG9ydGVk
IG1vZGUgYXMgSSBkbyBub3Qgd29yayBpbiBTYW1zdW5nIGFueW1vcmUuDQoNClNpZ25lZC1vZmYt
Ynk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCi0tLQ0KIENSRURJVFMg
ICAgIHwgNCArKysrDQogTUFJTlRBSU5FUlMgfCA0ICsrLS0NCiAyIGZpbGVzIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL0NSRURJVFMgYi9D
UkVESVRTDQppbmRleCAzMmVlNzBhNzU2MmUuLjFkZjYzY2RmNzFkZiAxMDA2NDQNCi0tLSBhL0NS
RURJVFMNCisrKyBiL0NSRURJVFMNCkBAIC0xOTEsNiArMTkxLDEwIEBAIE46IEtyaXNobmEgQmFs
YXN1YnJhbWFuaWFuDQogRTogYmFsYXN1YkBjaXMub2hpby1zdGF0ZS5lZHUNCiBEOiBXcm90ZSBT
WVMgViBJUEMgKHBhcnQgb2Ygc3RhbmRhcmQga2VybmVsIHNpbmNlIDAuOTkuMTApDQogDQorQjog
Um9iZXJ0IEJhbGR5Z2ENCitFOiByLmJhbGR5Z2FAaGFja2VyaW9uLmNvbQ0KK0Q6IFNhbXN1bmcg
UzNGV1JONSBOQ0kgTkZDIENvbnRyb2xsZXINCisNCiBOOiBDaHJpcyBCYWxsDQogRTogY2hyaXNA
cHJpbnRmLm5ldA0KIEQ6IEZvcm1lciBtYWludGFpbmVyIG9mIHRoZSBNTUMvU0QvU0RJTyBzdWJz
eXN0ZW0uDQpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0KaW5kZXggZWM0
ZjFkOWNiM2RjLi42ODg4YmQ4NTFjYWYgMTAwNjQ0DQotLS0gYS9NQUlOVEFJTkVSUw0KKysrIGIv
TUFJTlRBSU5FUlMNCkBAIC0xNTI2OSwxMCArMTUyNjksMTAgQEAgRjoJZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9zM2MtY2FtaWYvDQogRjoJaW5jbHVkZS9tZWRpYS9kcnYtaW50Zi9zM2NfY2FtaWYu
aA0KIA0KIFNBTVNVTkcgUzNGV1JONSBORkMgRFJJVkVSDQotTToJUm9iZXJ0IEJhbGR5Z2EgPHIu
YmFsZHlnYUBzYW1zdW5nLmNvbT4NCitNOglLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5l
bC5vcmc+DQogTToJS3J6eXN6dG9mIE9wYXNpYWsgPGsub3Bhc2lha0BzYW1zdW5nLmNvbT4NCiBM
OglsaW51eC1uZmNAbGlzdHMuMDEub3JnIChtb2RlcmF0ZWQgZm9yIG5vbi1zdWJzY3JpYmVycykN
Ci1TOglTdXBwb3J0ZWQNCitTOglNYWludGFpbmVkDQogRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL25ldC9uZmMvc2Ftc3VuZyxzM2Z3cm41LnlhbWwNCiBGOglkcml2ZXJzL25m
Yy9zM2Z3cm41DQogDQotLSANCjIuMTcuMQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbmZjIG1haWxpbmcgbGlzdCAtLSBsaW51eC1uZmNAbGlz
dHMuMDEub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gbGludXgtbmZjLWxlYXZl
QGxpc3RzLjAxLm9yZwolKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVy
bmFsX25hbWUpcw==
