Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0804287CF
	for <lists+linux-nfc@lfdr.de>; Mon, 11 Oct 2021 09:39:59 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id BCAC9100EAB1E;
	Mon, 11 Oct 2021 00:39:54 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 8AAC7100EAB0C
	for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 00:39:52 -0700 (PDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D76F83FFE0
	for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 07:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633937990;
	bh=rLmXqmzzo5GGghYT5vRh2TAaGHt8AG7Im5K0tL2thlE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=MxI98pElNINJmZLSRHNaFFCe/89nleoBIIKm1mcVdRn3ELl3eTDFarJRzsCrD+rNl
	 XtUno3CA145wLKoixIi6w/ys2CnuU+b8ZuBvkl1a7/dfezyhq8N0NZ1adZuan3M2Mi
	 wuST04eprbwTtmkUGuXslPDmsw9jWMLKIud9kYyYtiNVxcopHKeTgv/ZFY53EoiWFF
	 6YF6YgtwjsGltis/rj+EluFXkJ/kv9F4tWoBL+6+liA1AHgJo9m9IaNXOUGE1+8vPG
	 h7vlm42ydkj04ylIl80zsRpzaTq5ydqfUranpbolucNUMOx/PDHXBoH4cipSk3z1z/
	 JTzmnJc1Wtssg==
Received: by mail-ed1-f69.google.com with SMTP id r11-20020aa7cfcb000000b003d4fbd652b9so13035538edy.14
        for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 00:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rLmXqmzzo5GGghYT5vRh2TAaGHt8AG7Im5K0tL2thlE=;
        b=WLHrF1JnVCil1XAIGULBdoiNkHCwgOybh7M1Ndu5MxdN7F11+gyfiBBP9wI3uXiVr6
         nqCSCJw8JXiISYLsuxgFjoU0Q1j0gyFuEj3ofkiGqewzJp1HQlAQdmvLbdJ8MwwUbrYu
         1zOQV8mKyjvPX/El1AkIvMT42g3coG7BrCsjtxNZpLV8SunfYdln9g3WIvTU03jgfDxX
         J1m2ZJ+ua9hy558cYro0NoDdJScSSUaGIOUum7FO72igO4BMDsHSWYqV3iqZZ1EzKC5Y
         bkbgYB3zOAku7iQPPzU4vIwy++CNaGwxSltpeaVW0UPq+nMUy+tBk1C19bwNwZi580Gx
         QtpQ==
X-Gm-Message-State: AOAM530C6nsz8AKq3qXAmEfrcocMmLcp7CkP0baziIVxRjtXVDo7pqyi
	u90IGqFEdIc1p1cFZEMi2UtlgHYR3lW1UwU5rV4lXFO1sj7QiheWV1ooCak9Pp8DH9vvw51GG7g
	jFp2ggin3kCjuKxX/uY/mAkHfSJFKlJMi7A==
X-Received: by 2002:a05:6402:348a:: with SMTP id v10mr16185658edc.0.1633937990458;
        Mon, 11 Oct 2021 00:39:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2Ucwh17SL6sj5EvOGVNYMDI+/+fXsfm0C96VKhvnPfPMpzHqS1gw2RJ59i7Z57suwl5vG/w==
X-Received: by 2002:a05:6402:348a:: with SMTP id v10mr16185642edc.0.1633937990273;
        Mon, 11 Oct 2021 00:39:50 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y8sm3023965ejm.104.2021.10.11.00.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 00:39:49 -0700 (PDT)
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
Date: Mon, 11 Oct 2021 09:39:30 +0200
Message-Id: <20211011073934.34340-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211011073934.34340-1-krzysztof.kozlowski@canonical.com>
References: <20211011073934.34340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 2O66WDOENI2EX7GFF625NB5UAK5LDUPF
X-Message-ID-Hash: 2O66WDOENI2EX7GFF625NB5UAK5LDUPF
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 4/8] dt-bindings: nfc: st,st21nfca: convert to dtschema
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/2O66WDOENI2EX7GFF625NB5UAK5LDUPF/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q29udmVydCB0aGUgU1QgU1QyMU5GQ0EgTkZDIGNvbnRyb2xsZXIgdG8gRFQgc2NoZW1hIGZvcm1h
dC4NCg0KQ2hhbmdlcyBkdXJpbmcgYmluZGluZ3MgY29udmVyc2lvbjoNCjEuIEFkZCBhIG5ldyBy
ZXF1aXJlZCAiaW50ZXJydXB0cyIgcHJvcGVydHksIGJlY2F1c2UgaXQgd2FzIG1pc3NpbmcgaW4N
CiAgIHRoZSBvbGQgYmluZGluZ3MgYnkgbWlzdGFrZS4NCjIuIERyb3AgdGhlICJjbG9jay1mcmVx
dWVuY3kiIHByb3BlcnR5IGR1cmluZyBjb252ZXJzaW9uIGJlY2F1c2UgaXQgaXMgYQ0KICAgcHJv
cGVydHkgb2YgSTJDIGJ1cyBjb250cm9sbGVyLCBub3QgSTJDIHNsYXZlIGRldmljZS4gIEl0IHdh
cyBhbHNvDQogICBuZXZlciB1c2VkIGJ5IHRoZSBkcml2ZXIuDQoNClNpZ25lZC1vZmYtYnk6IEty
enlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNvbT4NCi0t
LQ0KIC4uLi9iaW5kaW5ncy9uZXQvbmZjL3N0LHN0MjFuZmNhLnlhbWwgICAgICAgICB8IDY0ICsr
KysrKysrKysrKysrKysrKysNCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvbmZjL3N0MjFu
ZmNhLnR4dCAgfCAzNyAtLS0tLS0tLS0tLQ0KIDIgZmlsZXMgY2hhbmdlZCwgNjQgaW5zZXJ0aW9u
cygrKSwgMzcgZGVsZXRpb25zKC0pDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvbmZjL3N0LHN0MjFuZmNhLnlhbWwNCiBkZWxldGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9uZmMvc3QyMW5m
Y2EudHh0DQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bmV0L25mYy9zdCxzdDIxbmZjYS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL25ldC9uZmMvc3Qsc3QyMW5mY2EueWFtbA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4
IDAwMDAwMDAwMDAwMC4uNDM1NmVhY2RlOGFhDQotLS0gL2Rldi9udWxsDQorKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L25mYy9zdCxzdDIxbmZjYS55YW1sDQpAQCAt
MCwwICsxLDY0IEBADQorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9S
IEJTRC0yLUNsYXVzZQ0KKyVZQU1MIDEuMg0KKy0tLQ0KKyRpZDogaHR0cDovL2RldmljZXRyZWUu
b3JnL3NjaGVtYXMvbmV0L25mYy9zdCxzdDIxbmZjYS55YW1sIw0KKyRzY2hlbWE6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KKw0KK3RpdGxlOiBTVE1pY3Jv
ZWxlY3Ryb25pY3MgU0FTIFNUMjFORkNBIE5GQyBjb250cm9sbGVyDQorDQorbWFpbnRhaW5lcnM6
DQorICAtIEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2Fs
LmNvbT4NCisNCitwcm9wZXJ0aWVzOg0KKyAgY29tcGF0aWJsZToNCisgICAgY29uc3Q6IHN0LHN0
MjFuZmNhLWkyYw0KKw0KKyAgZW5hYmxlLWdwaW9zOg0KKyAgICBkZXNjcmlwdGlvbjogT3V0cHV0
IEdQSU8gcGluIHVzZWQgZm9yIGVuYWJsaW5nL2Rpc2FibGluZyB0aGUgY29udHJvbGxlcg0KKw0K
KyAgZXNlLXByZXNlbnQ6DQorICAgIHR5cGU6IGJvb2xlYW4NCisgICAgZGVzY3JpcHRpb246IHwN
CisgICAgICBTcGVjaWZpZXMgdGhhdCBhbiBlc2UgaXMgcGh5c2ljYWxseSBjb25uZWN0ZWQgdG8g
dGhlIGNvbnRyb2xsZXINCisNCisgIGludGVycnVwdHM6DQorICAgIG1heEl0ZW1zOiAxDQorDQor
ICByZWc6DQorICAgIG1heEl0ZW1zOiAxDQorDQorICB1aWNjLXByZXNlbnQ6DQorICAgIHR5cGU6
IGJvb2xlYW4NCisgICAgZGVzY3JpcHRpb246IHwNCisgICAgICBTcGVjaWZpZXMgdGhhdCB0aGUg
dWljYyBzd3Agc2lnbmFsIGNhbiBiZSBwaHlzaWNhbGx5IGNvbm5lY3RlZCB0byB0aGUNCisgICAg
ICBjb250cm9sbGVyDQorDQorcmVxdWlyZWQ6DQorICAtIGNvbXBhdGlibGUNCisgIC0gZW5hYmxl
LWdwaW9zDQorICAtIGludGVycnVwdHMNCisgIC0gcmVnDQorDQorYWRkaXRpb25hbFByb3BlcnRp
ZXM6IGZhbHNlDQorDQorZXhhbXBsZXM6DQorICAtIHwNCisgICAgI2luY2x1ZGUgPGR0LWJpbmRp
bmdzL2dwaW8vZ3Bpby5oPg0KKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNv
bnRyb2xsZXIvaXJxLmg+DQorDQorICAgIGkyYyB7DQorICAgICAgICAjYWRkcmVzcy1jZWxscyA9
IDwxPjsNCisgICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KKw0KKyAgICAgICAgbmZjQDEgew0K
KyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic3Qsc3QyMW5mY2EtaTJjIjsNCisgICAgICAgICAg
ICByZWcgPSA8MHgxPjsNCisNCisgICAgICAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZncGlv
NT47DQorICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwyIElSUV9UWVBFX0xFVkVMX0xPVz47DQor
ICAgICAgICAgICAgZW5hYmxlLWdwaW9zID0gPCZncGlvNSAyOSBHUElPX0FDVElWRV9ISUdIPjsN
CisNCisgICAgICAgICAgICBlc2UtcHJlc2VudDsNCisgICAgICAgICAgICB1aWNjLXByZXNlbnQ7
DQorICAgICAgICB9Ow0KKyAgICB9Ow0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9uZXQvbmZjL3N0MjFuZmNhLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9uZXQvbmZjL3N0MjFuZmNhLnR4dA0KZGVsZXRlZCBmaWxlIG1vZGUgMTAw
NjQ0DQppbmRleCBiOGJkOTBmODBlMTIuLjAwMDAwMDAwMDAwMA0KLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9uZmMvc3QyMW5mY2EudHh0DQorKysgL2Rldi9udWxs
DQpAQCAtMSwzNyArMCwwIEBADQotKiBTVE1pY3JvZWxlY3Ryb25pY3MgU0FTLiBTVDIxTkZDQSBO
RkMgQ29udHJvbGxlcg0KLQ0KLVJlcXVpcmVkIHByb3BlcnRpZXM6DQotLSBjb21wYXRpYmxlOiBT
aG91bGQgYmUgInN0LHN0MjFuZmNhLWkyYyIuDQotLSBjbG9jay1mcmVxdWVuY3k6IEnCskMgd29y
ayBmcmVxdWVuY3kuDQotLSByZWc6IGFkZHJlc3Mgb24gdGhlIGJ1cw0KLS0gZW5hYmxlLWdwaW9z
OiBPdXRwdXQgR1BJTyBwaW4gdXNlZCBmb3IgZW5hYmxpbmcvZGlzYWJsaW5nIHRoZSBTVDIxTkZD
QQ0KLQ0KLU9wdGlvbmFsIFNvQyBTcGVjaWZpYyBQcm9wZXJ0aWVzOg0KLS0gcGluY3RybC1uYW1l
czogQ29udGFpbnMgb25seSBvbmUgdmFsdWUgLSAiZGVmYXVsdCIuDQotLSBwaW50Y3RybC0wOiBT
cGVjaWZpZXMgdGhlIHBpbiBjb250cm9sIGdyb3VwcyB1c2VkIGZvciB0aGlzIGNvbnRyb2xsZXIu
DQotLSBlc2UtcHJlc2VudDogU3BlY2lmaWVzIHRoYXQgYW4gZXNlIGlzIHBoeXNpY2FsbHkgY29u
bmVjdGVkIHRvIHRoZSBuZmMNCi1jb250cm9sbGVyLg0KLS0gdWljYy1wcmVzZW50OiBTcGVjaWZp
ZXMgdGhhdCB0aGUgdWljYyBzd3Agc2lnbmFsIGNhbiBiZSBwaHlzaWNhbGx5DQotY29ubmVjdGVk
IHRvIHRoZSBuZmMgY29udHJvbGxlci4NCi0NCi1FeGFtcGxlIChmb3IgQVJNLWJhc2VkIEJlYWds
ZUJvYXJkIHhNIHdpdGggU1QyMU5GQ0Egb24gSTJDMik6DQotDQotJmkyYzIgew0KLQ0KLQ0KLQlz
dDIxbmZjYTogc3QyMW5mY2FAMSB7DQotDQotCQljb21wYXRpYmxlID0gInN0LHN0MjFuZmNhLWky
YyI7DQotDQotCQlyZWcgPSA8MHgwMT47DQotCQljbG9jay1mcmVxdWVuY3kgPSA8NDAwMDAwPjsN
Ci0NCi0JCWludGVycnVwdC1wYXJlbnQgPSA8JmdwaW81PjsNCi0JCWludGVycnVwdHMgPSA8MiBJ
UlFfVFlQRV9MRVZFTF9MT1c+Ow0KLQ0KLQkJZW5hYmxlLWdwaW9zID0gPCZncGlvNSAyOSBHUElP
X0FDVElWRV9ISUdIPjsNCi0NCi0JCWVzZS1wcmVzZW50Ow0KLQkJdWljYy1wcmVzZW50Ow0KLQl9
Ow0KLX07DQotLSANCjIuMzAuMg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbmZjIG1haWxpbmcgbGlzdCAtLSBsaW51eC1uZmNAbGlzdHMuMDEu
b3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gbGludXgtbmZjLWxlYXZlQGxpc3Rz
LjAxLm9yZwolKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25h
bWUpcw==
