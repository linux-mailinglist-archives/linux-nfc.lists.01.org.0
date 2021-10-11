Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C7D4287CE
	for <lists+linux-nfc@lfdr.de>; Mon, 11 Oct 2021 09:39:58 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id AAD04100EAB17;
	Mon, 11 Oct 2021 00:39:53 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 1B60B100EAB0A
	for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 00:39:50 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 43B134001D
	for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 07:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633937987;
	bh=hrLA5o9OEIQ0nHS0Sc5B651Iz0OK3SR27lQhWVZgzKI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=I0mYu0D31VuK4pRmlCnk7ZywwcaMk+gp0zhdWj8iXMgwQewfI9QG6qIU91Pwhh+c2
	 9wGMiTvyaksVArjqqY/f8gbxgAOX2sNvaPds7LVIL888LQLe3Pe9Mb+dg1fn/KvpzV
	 E3sy0MKQDDQELkQMzsQ4E+RRWD8smZFiCX72yMd6n2+Mpi6+kOWIYPi/qC78Hlyzme
	 jjHQvA831DH0+HtG4sOSbORbLOqWx2Dp9e0FJbg5spbKEFYoYEq28FJvt5b2RbBOF0
	 Uj0rABuoFsPV0tvCyVslMnu9goVjeZBN1Pey87RySvXFIahhr3HAy4xea+A3NNdxM6
	 yl5Mryw2TRQig==
Received: by mail-ed1-f70.google.com with SMTP id c8-20020a50d648000000b003daa53c7518so15026113edj.21
        for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 00:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hrLA5o9OEIQ0nHS0Sc5B651Iz0OK3SR27lQhWVZgzKI=;
        b=ev7LbrJUUu4N93o4AbQwnXP/Vw3DpLyesMlnn3r2CiupUHZHPCS72cm+npIsDVfJ28
         xEizXyNn4W70iQTKihopY3i27V7KLHDaIaemzOmiFgjNodZtxhk5TZUqfv1SrS7SwCCj
         cnZ4PPGSHSX0qN/7sBl2GqgFqY3X4mppr2yHjHi9Jpzb7q/Ob/yjpZbvdOPXTMH30k5+
         cZTC5iRW7/DQgMZ4Rml7EPaSF/7ynS8V+s2yHdOMQf7hiHrVjyZ922hy+jgPAgmIR8Fi
         LoF/yoAkxfWC/zlXs9MbQ0Khz9YDbGPCyOb5yaF4u71tzkv7z7GL6fIduYzVJ6oZBh9g
         7WKg==
X-Gm-Message-State: AOAM532P1FQ8fq5fqeAFIUnpeF93JOoTVfUuO1OsqqZKQ1Ga98IGmw1M
	XhVZgkNF1uFifIQp2x6XX3OjrZcqObvH3ZCh8bzwsmj7kPbXYQ26a0Vh8FY8p2wep53wuIdWI1b
	SVDEgs4+BdYBqDC5NB1oRYCsm+T1pGhMP8A==
X-Received: by 2002:a50:be81:: with SMTP id b1mr39180539edk.59.1633937986050;
        Mon, 11 Oct 2021 00:39:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRojHIPPzkKpzS+divt5D4CXRSkB9G3jbMbb2k4RwWF1y3DeZtH0vRHHfAbA51bv493rwOpQ==
X-Received: by 2002:a50:be81:: with SMTP id b1mr39180520edk.59.1633937985884;
        Mon, 11 Oct 2021 00:39:45 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y8sm3023965ejm.104.2021.10.11.00.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 00:39:45 -0700 (PDT)
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
Date: Mon, 11 Oct 2021 09:39:27 +0200
Message-Id: <20211011073934.34340-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211011073934.34340-1-krzysztof.kozlowski@canonical.com>
References: <20211011073934.34340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: DSWD4IAOQYBJKD7OWGFUIYK6Z2664JFC
X-Message-ID-Hash: DSWD4IAOQYBJKD7OWGFUIYK6Z2664JFC
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 1/8] dt-bindings: nfc: nxp,nci: convert to dtschema
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/DSWD4IAOQYBJKD7OWGFUIYK6Z2664JFC/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q29udmVydCB0aGUgTlhQIE5DSSBORkMgY29udHJvbGxlciB0byBEVCBzY2hlbWEgZm9ybWF0Lg0K
DQpEcm9wIHRoZSAiY2xvY2stZnJlcXVlbmN5IiBwcm9wZXJ0eSBkdXJpbmcgY29udmVyc2lvbiBi
ZWNhdXNlIGl0IGlzIGENCnByb3BlcnR5IG9mIEkyQyBidXMgY29udHJvbGxlciwgbm90IEkyQyBz
bGF2ZSBkZXZpY2UuICBJdCB3YXMgYWxzbyBuZXZlcg0KdXNlZCBieSB0aGUgZHJpdmVyLg0KDQpT
aWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGNh
bm9uaWNhbC5jb20+DQotLS0NCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvbmZjL254cCxu
Y2kueWFtbCAgfCA1NyArKysrKysrKysrKysrKysrKysrDQogLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvbmV0L25mYy9ueHAtbmNpLnR4dCAgIHwgMzMgLS0tLS0tLS0tLS0NCiBNQUlOVEFJTkVSUyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArDQogMyBmaWxlcyBjaGFuZ2Vk
LCA1OCBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlvbnMoLSkNCiBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9uZmMvbnhwLG5jaS55YW1sDQog
ZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQv
bmZjL254cC1uY2kudHh0DQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbmV0L25mYy9ueHAsbmNpLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbmV0L25mYy9ueHAsbmNpLnlhbWwNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRl
eCAwMDAwMDAwMDAwMDAuLjcwNjM0ZDIwZDRkNw0KLS0tIC9kZXYvbnVsbA0KKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9uZmMvbnhwLG5jaS55YW1sDQpAQCAtMCww
ICsxLDU3IEBADQorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJT
RC0yLUNsYXVzZQ0KKyVZQU1MIDEuMg0KKy0tLQ0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3Jn
L3NjaGVtYXMvbmV0L25mYy9ueHAsbmNpLnlhbWwjDQorJHNjaGVtYTogaHR0cDovL2RldmljZXRy
ZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQorDQordGl0bGU6IE5YUCBTZW1pY29uZHVj
dG9ycyBOQ0kgTkZDIGNvbnRyb2xsZXINCisNCittYWludGFpbmVyczoNCisgIC0gQ2hhcmxlcyBH
b3JhbmQgPGNoYXJsZXMuZ29yYW5kQGVmZmlubm92LmNvbT4NCisgIC0gS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBjYW5vbmljYWwuY29tPg0KKw0KK3Byb3BlcnRpZXM6
DQorICBjb21wYXRpYmxlOg0KKyAgICBjb25zdDogbnhwLG54cC1uY2ktaTJjDQorDQorICBlbmFi
bGUtZ3Bpb3M6DQorICAgIGRlc2NyaXB0aW9uOiBPdXRwdXQgR1BJTyBwaW4gdXNlZCBmb3IgZW5h
YmxpbmcvZGlzYWJsaW5nIHRoZSBjb250cm9sbGVyDQorDQorICBmaXJtd2FyZS1ncGlvczoNCisg
ICAgZGVzY3JpcHRpb246IE91dHB1dCBHUElPIHBpbiB1c2VkIHRvIGVudGVyIGZpcm13YXJlIGRv
d25sb2FkIG1vZGUNCisNCisgIGludGVycnVwdHM6DQorICAgIG1heEl0ZW1zOiAxDQorDQorICBy
ZWc6DQorICAgIG1heEl0ZW1zOiAxDQorDQorcmVxdWlyZWQ6DQorICAtIGNvbXBhdGlibGUNCisg
IC0gZW5hYmxlLWdwaW9zDQorICAtIGludGVycnVwdHMNCisgIC0gcmVnDQorDQorYWRkaXRpb25h
bFByb3BlcnRpZXM6IGZhbHNlDQorDQorZXhhbXBsZXM6DQorICAtIHwNCisgICAgI2luY2x1ZGUg
PGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPg0KKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50
ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+DQorDQorICAgIGkyYyB7DQorICAgICAgICAjYWRkcmVz
cy1jZWxscyA9IDwxPjsNCisgICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KKw0KKyAgICAgICAg
bmZjQDI5IHsNCisgICAgICAgICAgICBjb21wYXRpYmxlID0gIm54cCxueHAtbmNpLWkyYyI7DQor
DQorICAgICAgICAgICAgcmVnID0gPDB4Mjk+Ow0KKw0KKyAgICAgICAgICAgIGludGVycnVwdC1w
YXJlbnQgPSA8JmdwaW8xPjsNCisgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDI5IElSUV9UWVBF
X0xFVkVMX0hJR0g+Ow0KKw0KKyAgICAgICAgICAgIGVuYWJsZS1ncGlvcyA9IDwmZ3BpbzAgMzAg
R1BJT19BQ1RJVkVfSElHSD47DQorICAgICAgICAgICAgZmlybXdhcmUtZ3Bpb3MgPSA8JmdwaW8w
IDMxIEdQSU9fQUNUSVZFX0hJR0g+Ow0KKyAgICAgICAgfTsNCisgICAgfTsNCmRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L25mYy9ueHAtbmNpLnR4dCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvbmZjL254cC1uY2kudHh0DQpk
ZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDI4NWEzN2MyZjE4OS4uMDAwMDAwMDAwMDAw
DQotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L25mYy9ueHAtbmNp
LnR4dA0KKysrIC9kZXYvbnVsbA0KQEAgLTEsMzMgKzAsMCBAQA0KLSogTlhQIFNlbWljb25kdWN0
b3JzIE5YUCBOQ0kgTkZDIENvbnRyb2xsZXJzDQotDQotUmVxdWlyZWQgcHJvcGVydGllczoNCi0t
IGNvbXBhdGlibGU6IFNob3VsZCBiZSAibnhwLG54cC1uY2ktaTJjIi4NCi0tIGNsb2NrLWZyZXF1
ZW5jeTogScKyQyB3b3JrIGZyZXF1ZW5jeS4NCi0tIHJlZzogYWRkcmVzcyBvbiB0aGUgYnVzDQot
LSBpbnRlcnJ1cHRzOiBHUElPIGludGVycnVwdCB0byB3aGljaCB0aGUgY2hpcCBpcyBjb25uZWN0
ZWQNCi0tIGVuYWJsZS1ncGlvczogT3V0cHV0IEdQSU8gcGluIHVzZWQgZm9yIGVuYWJsaW5nL2Rp
c2FibGluZyB0aGUgY2hpcA0KLQ0KLU9wdGlvbmFsIFNvQyBTcGVjaWZpYyBQcm9wZXJ0aWVzOg0K
LS0gcGluY3RybC1uYW1lczogQ29udGFpbnMgb25seSBvbmUgdmFsdWUgLSAiZGVmYXVsdCIuDQot
LSBwaW50Y3RybC0wOiBTcGVjaWZpZXMgdGhlIHBpbiBjb250cm9sIGdyb3VwcyB1c2VkIGZvciB0
aGlzIGNvbnRyb2xsZXIuDQotLSBmaXJtd2FyZS1ncGlvczogT3V0cHV0IEdQSU8gcGluIHVzZWQg
dG8gZW50ZXIgZmlybXdhcmUgZG93bmxvYWQgbW9kZQ0KLQ0KLUV4YW1wbGUgKGZvciBBUk0tYmFz
ZWQgQmVhZ2xlQm9uZSB3aXRoIE5QQzEwMCBORkMgY29udHJvbGxlciBvbiBJMkMyKToNCi0NCi0m
aTJjMiB7DQotDQotDQotCW5wYzEwMDogbnBjMTAwQDI5IHsNCi0NCi0JCWNvbXBhdGlibGUgPSAi
bnhwLG54cC1uY2ktaTJjIjsNCi0NCi0JCXJlZyA9IDwweDI5PjsNCi0JCWNsb2NrLWZyZXF1ZW5j
eSA9IDwxMDAwMDA+Ow0KLQ0KLQkJaW50ZXJydXB0LXBhcmVudCA9IDwmZ3BpbzE+Ow0KLQkJaW50
ZXJydXB0cyA9IDwyOSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCi0NCi0JCWVuYWJsZS1ncGlvcyA9
IDwmZ3BpbzAgMzAgR1BJT19BQ1RJVkVfSElHSD47DQotCQlmaXJtd2FyZS1ncGlvcyA9IDwmZ3Bp
bzAgMzEgR1BJT19BQ1RJVkVfSElHSD47DQotCX07DQotfTsNCmRpZmYgLS1naXQgYS9NQUlOVEFJ
TkVSUyBiL01BSU5UQUlORVJTDQppbmRleCA3Y2ZkNjNjZTcxMjIuLjMyOTRhYWY1ZTU2YyAxMDA2
NDQNCi0tLSBhL01BSU5UQUlORVJTDQorKysgYi9NQUlOVEFJTkVSUw0KQEAgLTEzNjMyLDYgKzEz
NjMyLDcgQEAgTlhQLU5DSSBORkMgRFJJVkVSDQogUjoJQ2hhcmxlcyBHb3JhbmQgPGNoYXJsZXMu
Z29yYW5kQGVmZmlubm92LmNvbT4NCiBMOglsaW51eC1uZmNAbGlzdHMuMDEub3JnIChzdWJzY3Jp
YmVycy1vbmx5KQ0KIFM6CVN1cHBvcnRlZA0KK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9uZXQvbmZjL254cCxuY2kueWFtbA0KIEY6CWRyaXZlcnMvbmZjL254cC1uY2kNCiAN
CiBOWFAgaS5NWCA4UVhQLzhRTSBKUEVHIFY0TDIgRFJJVkVSDQotLSANCjIuMzAuMg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbmZjIG1haWxp
bmcgbGlzdCAtLSBsaW51eC1uZmNAbGlzdHMuMDEub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4g
ZW1haWwgdG8gbGludXgtbmZjLWxlYXZlQGxpc3RzLjAxLm9yZwolKHdlYl9wYWdlX3VybClzbGlz
dGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpcw==
