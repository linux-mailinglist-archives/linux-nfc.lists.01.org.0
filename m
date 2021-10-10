Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 743914281C0
	for <lists+linux-nfc@lfdr.de>; Sun, 10 Oct 2021 16:23:33 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 38572100EAB60;
	Sun, 10 Oct 2021 07:23:31 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 2643C100EAB56
	for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 07:23:28 -0700 (PDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7A04D40019
	for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 14:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633875807;
	bh=qgri1L0KhFh/RnI/H2zoBpT+z6G38bInX4GBDJQ63dQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vBf+CtRgg1YX0XgWGemt2XUUd6/EaEhl8B+AHMhFfgTINq4Y/ihYDNg5PaqbBZOo9
	 1XgjkJJtQQhozEKaaOlkNlOG7fQv4aDo7Vy2jDuuhUiQoE9O9GKFKYO5wqGwvJPgHD
	 GPme5UdhFeQccJJxxk6+F8tL10tnSSCRLB/e/W03AMD5gPi/IZ9Vn0jc59/USwEigt
	 R034tsQ4hBn5V3K0niLXaX0odHbvcXZi8BsKd1AWODg2OCGmAW3+iiIKVK5CUS5C1h
	 BZeWmXAaptMpucgRc73oenLb+licWtHr5VYULMCC429N66xpc8xLHNIKlxuslQzhty
	 paYDtC1JRT2Nw==
Received: by mail-ed1-f72.google.com with SMTP id f4-20020a50e084000000b003db585bc274so7864779edl.17
        for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 07:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qgri1L0KhFh/RnI/H2zoBpT+z6G38bInX4GBDJQ63dQ=;
        b=7nfcRT5F+6HW8/pIs6y45xMDUHOZr4177N1lyYx3rnjbyITQSV5DOiplUFZxbpasQO
         0uuP9atJnbGamQyEyWfuoY4I56mhu7k6Vvi6zGlOIckdtEr8cVxDYB4YBUDgTbqMAsBM
         vv55Vxq5iCf9WtmtCkPJCoYNcjUEVKwV5rGjrgKmns3A1zqLQxqxSsHY4CzHNUyB8D/B
         iYTuEUYP0VwHq0Ry8m3DYqCTgASrVzQksVLO9yhGy/2alFWdAjyVcydpoR2f9TZjrJFm
         XpkZUJ5JLhbmsq/uRCWcY3d56+QSlsLRC10fjT8d48ooXXu91Cwz0Cuh90xwz+O5J+iX
         UcFQ==
X-Gm-Message-State: AOAM532oMxqKx61CcKe/oTgOjHxhUF6kMjFfGKIgu/PCd7LONOW4wIXG
	1N6WHhMhFUfRSrdCS14+KyE7ZvrSA28UFbaOtfHz4gITiZPOXabAkljSVxpdZvcBIFMq6je/q5t
	6b+Hn9+Hj0phunzyWsSAj8wcdAOZ4ajBdPw==
X-Received: by 2002:a17:906:6819:: with SMTP id k25mr19643366ejr.423.1633875807178;
        Sun, 10 Oct 2021 07:23:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6gyduGgsH5Gq98NwhAmLbU7sM0X4/f1GLLStXo4wqXw1cZY5ufgiwDS3jywJhli65sNIoQw==
X-Received: by 2002:a17:906:6819:: with SMTP id k25mr19643345ejr.423.1633875807006;
        Sun, 10 Oct 2021 07:23:27 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 6sm2129017ejx.82.2021.10.10.07.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 07:23:26 -0700 (PDT)
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
Date: Sun, 10 Oct 2021 16:23:12 +0200
Message-Id: <20211010142317.168259-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211010142317.168259-1-krzysztof.kozlowski@canonical.com>
References: <20211010142317.168259-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: UECW6OZ7XGBTOHBSLLD3B7CD5PNPCH7M
X-Message-ID-Hash: UECW6OZ7XGBTOHBSLLD3B7CD5PNPCH7M
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 2/7] dt-bindings: nfc: nxp,pn532: convert to dtschema
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/UECW6OZ7XGBTOHBSLLD3B7CD5PNPCH7M/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q29udmVydCB0aGUgTlhQIFBONTMyIE5GQyBjb250cm9sbGVyIHRvIERUIHNjaGVtYSBmb3JtYXQu
DQoNClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dz
a2lAY2Fub25pY2FsLmNvbT4NCi0tLQ0KIC4uLi9iaW5kaW5ncy9uZXQvbmZjL254cCxwbjUzMi55
YW1sICAgICAgICAgICB8IDcwICsrKysrKysrKysrKysrKysrKysNCiAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy9uZXQvbmZjL3BuNTMyLnR4dCAgICAgfCA0NiAtLS0tLS0tLS0tLS0NCiAyIGZpbGVz
IGNoYW5nZWQsIDcwIGluc2VydGlvbnMoKyksIDQ2IGRlbGV0aW9ucygtKQ0KIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L25mYy9ueHAscG41
MzIueWFtbA0KIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbmV0L25mYy9wbjUzMi50eHQNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9uZXQvbmZjL254cCxwbjUzMi55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9uZmMvbnhwLHBuNTMyLnlhbWwNCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMDAuLmM2ZjQxYjQ4MzI5Nw0KLS0tIC9kZXYvbnVsbA0K
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9uZmMvbnhwLHBuNTMy
LnlhbWwNCkBAIC0wLDAgKzEsNzAgQEANCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlDQorJVlBTUwgMS4yDQorLS0tDQorJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9uZXQvbmZjL254cCxwbjUzMi55YW1sIw0KKyRzY2hlbWE6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KKw0KK3RpdGxl
OiBOWFAgU2VtaWNvbmR1Y3RvcnMgUE41MzIgTkZDIGNvbnRyb2xsZXINCisNCittYWludGFpbmVy
czoNCisgIC0gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBjYW5vbmlj
YWwuY29tPg0KKw0KK3Byb3BlcnRpZXM6DQorICBjb21wYXRpYmxlOg0KKyAgICBvbmVPZjoNCisg
ICAgICAtIGNvbnN0OiBueHAscG41MzINCisgICAgICAtIGRlc2NyaXB0aW9uOiBEZXByZWNhdGVk
IGJpbmRpbmdzDQorICAgICAgICBlbnVtOg0KKyAgICAgICAgICAtIG54cCxwbjUzMi1pMmMNCisg
ICAgICAgICAgLSBueHAscG41MzMtaTJjDQorICAgICAgICBkZXByZWNhdGVkOiB0cnVlDQorDQor
ICBjbG9jay1mcmVxdWVuY3k6DQorICAgIGRlc2NyaXB0aW9uOiBSZXF1aXJlZCBpZiBjb25uZWN0
ZWQgdmlhIEkyQw0KKw0KKyAgaW50ZXJydXB0czoNCisgICAgZGVzY3JpcHRpb246IFJlcXVpcmVk
IGlmIGNvbm5lY3RlZCB2aWEgSTJDDQorICAgIG1heEl0ZW1zOiAxDQorDQorICByZWc6DQorICAg
IGRlc2NyaXB0aW9uOiBSZXF1aXJlZCBpZiBjb25uZWN0ZWQgdmlhIEkyQw0KKyAgICBtYXhJdGVt
czogMQ0KKw0KK3JlcXVpcmVkOg0KKyAgLSBjb21wYXRpYmxlDQorDQorZGVwZW5kZW5jaWVzOg0K
KyAgY2xvY2stZnJlcXVlbmN5OiBbICdyZWcnIF0NCisgIGludGVycnVwdHM6IFsgJ3JlZycgXQ0K
Kw0KK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KKw0KK2V4YW1wbGVzOg0KKyAgIyBQTjUz
MiBvbiBJMkMgYnVzDQorICAtIHwNCisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVw
dC1jb250cm9sbGVyL2lycS5oPg0KKw0KKyAgICBpMmMgew0KKyAgICAgICAgI2FkZHJlc3MtY2Vs
bHMgPSA8MT47DQorICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCisNCisgICAgICAgIG5mY0Ay
NCB7DQorICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJueHAscG41MzIiOw0KKw0KKyAgICAgICAg
ICAgIHJlZyA9IDwweDI0PjsNCisgICAgICAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8NDAwMDAw
PjsNCisNCisgICAgICAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZncGlvMT47DQorICAgICAg
ICAgICAgaW50ZXJydXB0cyA9IDwxNyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCisgICAgICAgIH07
DQorICAgIH07DQorDQorICAjIFBONTMyIGNvbm5lY3RlZCB2aWEgVUFSVA0KKyAgLSB8DQorICAg
IHNlcmlhbEA0OTA0MjAwMCB7DQorICAgICAgICByZWcgPSA8MHg0OTA0MjAwMCAweDQwMD47DQor
DQorICAgICAgICBuZmMgew0KKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibnhwLHBuNTMyIjsN
CisgICAgICAgIH07DQorICAgIH07DQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL25ldC9uZmMvcG41MzIudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL25ldC9uZmMvcG41MzIudHh0DQpkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCmlu
ZGV4IGE1NTA3ZGM0OTliYy4uMDAwMDAwMDAwMDAwDQotLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbmV0L25mYy9wbjUzMi50eHQNCisrKyAvZGV2L251bGwNCkBAIC0xLDQ2
ICswLDAgQEANCi0qIE5YUCBTZW1pY29uZHVjdG9ycyBQTjUzMiBORkMgQ29udHJvbGxlcg0KLQ0K
LVJlcXVpcmVkIHByb3BlcnRpZXM6DQotLSBjb21wYXRpYmxlOiBTaG91bGQgYmUNCi0gICAgLSAi
bnhwLHBuNTMyIiBQbGFjZSBhIG5vZGUgd2l0aCB0aGlzIGluc2lkZSB0aGUgZGV2aWNldHJlZSBu
b2RlIG9mIHRoZSBidXMNCi0gICAgICAgICAgICAgICAgICB3aGVyZSB0aGUgTkZDIGNoaXAgaXMg
Y29ubmVjdGVkIHRvLg0KLSAgICAgICAgICAgICAgICAgIEN1cnJlbnRseSB0aGUga2VybmVsIGhh
cyBwaHkgYmluZGluZ3MgZm9yIHVhcnQgYW5kIGkyYy4NCi0gICAgLSAibnhwLHBuNTMyLWkyYyIg
KERFUFJFQ0FURUQpIG9ubHkgd29ya3MgZm9yIHRoZSBpMmMgYmluZGluZy4NCi0gICAgLSAibnhw
LHBuNTMzLWkyYyIgKERFUFJFQ0FURUQpIG9ubHkgd29ya3MgZm9yIHRoZSBpMmMgYmluZGluZy4N
Ci0NCi1SZXF1aXJlZCBwcm9wZXJ0aWVzIGlmIGNvbm5lY3RlZCBvbiBpMmM6DQotLSBjbG9jay1m
cmVxdWVuY3k6IEnCskMgd29yayBmcmVxdWVuY3kuDQotLSByZWc6IGZvciB0aGUgScKyQyBidXMg
YWRkcmVzcy4gVGhpcyBpcyBmaXhlZCBhdCAweDI0IGZvciB0aGUgUE41MzIuDQotLSBpbnRlcnJ1
cHRzOiBHUElPIGludGVycnVwdCB0byB3aGljaCB0aGUgY2hpcCBpcyBjb25uZWN0ZWQNCi0NCi1P
cHRpb25hbCBTb0MgU3BlY2lmaWMgUHJvcGVydGllczoNCi0tIHBpbmN0cmwtbmFtZXM6IENvbnRh
aW5zIG9ubHkgb25lIHZhbHVlIC0gImRlZmF1bHQiLg0KLS0gcGludGN0cmwtMDogU3BlY2lmaWVz
IHRoZSBwaW4gY29udHJvbCBncm91cHMgdXNlZCBmb3IgdGhpcyBjb250cm9sbGVyLg0KLQ0KLUV4
YW1wbGUgKGZvciBBUk0tYmFzZWQgQmVhZ2xlQm9uZSB3aXRoIFBONTMyIG9uIEkyQzIpOg0KLQ0K
LSZpMmMyIHsNCi0NCi0NCi0JcG41MzI6IG5mY0AyNCB7DQotDQotCQljb21wYXRpYmxlID0gIm54
cCxwbjUzMiI7DQotDQotCQlyZWcgPSA8MHgyND47DQotCQljbG9jay1mcmVxdWVuY3kgPSA8NDAw
MDAwPjsNCi0NCi0JCWludGVycnVwdC1wYXJlbnQgPSA8JmdwaW8xPjsNCi0JCWludGVycnVwdHMg
PSA8MTcgSVJRX1RZUEVfRURHRV9GQUxMSU5HPjsNCi0NCi0JfTsNCi19Ow0KLQ0KLUV4YW1wbGUg
KGZvciBQTjUzMiBjb25uZWN0ZWQgdmlhIHVhcnQpOg0KLQ0KLXVhcnQ0OiBzZXJpYWxANDkwNDIw
MDAgew0KLSAgICAgICAgY29tcGF0aWJsZSA9ICJ0aSxvbWFwMy11YXJ0IjsNCi0NCi0gICAgICAg
IHBuNTMyOiBuZmMgew0KLSAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm54cCxwbjUzMiI7
DQotICAgICAgICB9Ow0KLX07DQotLSANCjIuMzAuMg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbmZjIG1haWxpbmcgbGlzdCAtLSBsaW51eC1u
ZmNAbGlzdHMuMDEub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gbGludXgtbmZj
LWxlYXZlQGxpc3RzLjAxLm9yZwolKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUo
X2ludGVybmFsX25hbWUpcw==
