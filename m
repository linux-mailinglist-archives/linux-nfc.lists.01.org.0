Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 723A54281BA
	for <lists+linux-nfc@lfdr.de>; Sun, 10 Oct 2021 16:23:32 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 22F76100EAB56;
	Sun, 10 Oct 2021 07:23:31 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 2561D100EAB54
	for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 07:23:28 -0700 (PDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AF8B440018
	for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 14:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633875806;
	bh=GFOKzNYALQa+608FIQZ/in0rfsEAI0+jCScuqGun71I=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	b=RKHCHLE4VlJGcf4P3HX9IK1O4Dy62hZqsal5DFYo3/OxKAgwHl6gRF3vWTDUMwClM
	 ZwYhyJTUWtJpDKgtVMNOSmh28qgwqqoWAe0IbYZo4mrlU/ckhVewDqZ5ii0sPr41dc
	 QMLoMnyDGHcn8Xns3I7CDWGTu/+wcAnNWmQTADhOadWW7/wcxpr83rctXRJlm9kIcU
	 fKStQLVt8YCbv+Sx2fQgbSX4f+rrauMXQ4Fy73o/3+EQeDk1l4M9FIc7AQmpRwyYXr
	 6UwFMwaasc/e840vqZg0u28ekDfRtHV2fsO23XZ1CNAHx7Ikz1TCmLkUPhuKT36xbN
	 2uydcxSgIPF5w==
Received: by mail-ed1-f72.google.com with SMTP id c8-20020a50d648000000b003daa53c7518so13415714edj.21
        for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 07:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GFOKzNYALQa+608FIQZ/in0rfsEAI0+jCScuqGun71I=;
        b=DX1viiX3h0GBHwr9rcdIV5Vl45NpPJ9B2ugiYfQtcRWgBrwwTvpb9b2UBWFI1bBsqx
         jpLp2cNnfediYMFgo40Q3wUQR4BRK/NyUtvOt565DlfT1Ayg4InlK6eER5dW0HOv62JA
         m4gyb0tboBo5YAVc5pza9rWhW4M8kNFSXifYNs/DuspPCh61y/Wjd/K0AJd4n2RwAq+z
         qe5g/+xoFGB9fTuPqWRwSTGTBP9hvkeqfJOLgf8ps75j+KJMkx5agGrSmJQJNenakcaZ
         nTkKeez8LGfCKNJGEOe4/Owlgorochs1ab3WVTONGWDrubrwSQEqudf8A6vzixP3pBnc
         D4xw==
X-Gm-Message-State: AOAM533aQukU2ERhyvJHzuP3GZdrtTBKGZR+ROVgrQrbGroa4awzB17v
	5LajWHR/SHkNqEQJ0SrwFif1j1jf6ogCGNcgTe5pZuIA8VqlI+ftOOODMYZ03je2oifPRU69Sx6
	1ZRAAd0lIQEvwCMUNK+beI2sInl06KY5EXQ==
X-Received: by 2002:a17:906:4452:: with SMTP id i18mr18335330ejp.374.1633875806375;
        Sun, 10 Oct 2021 07:23:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx94bZ2ipwW70tBjgvzGZ79+303zLFR8lQVDmyzo0Dkcvx/qGXoXfyUNj77BL8MoxAU7lKhuQ==
X-Received: by 2002:a17:906:4452:: with SMTP id i18mr18335272ejp.374.1633875805770;
        Sun, 10 Oct 2021 07:23:25 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 6sm2129017ejx.82.2021.10.10.07.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 07:23:25 -0700 (PDT)
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
Date: Sun, 10 Oct 2021 16:23:11 +0200
Message-Id: <20211010142317.168259-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Message-ID-Hash: SMWZFOJOBZEXNZC2R3VL4MT3WINJEDWH
X-Message-ID-Hash: SMWZFOJOBZEXNZC2R3VL4MT3WINJEDWH
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 1/7] dt-bindings: nfc: nxp,nci: convert to dtschema
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/SMWZFOJOBZEXNZC2R3VL4MT3WINJEDWH/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q29udmVydCB0aGUgTlhQIE5DSSBORkMgY29udHJvbGxlciB0byBEVCBzY2hlbWEgZm9ybWF0Lg0K
DQpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tp
QGNhbm9uaWNhbC5jb20+DQotLS0NCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvbmZjL254
cCxuY2kueWFtbCAgfCA2MSArKysrKysrKysrKysrKysrKysrDQogLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbmV0L25mYy9ueHAtbmNpLnR4dCAgIHwgMzMgLS0tLS0tLS0tLQ0KIE1BSU5UQUlORVJT
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsNCiAzIGZpbGVzIGNoYW5n
ZWQsIDYyIGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L25mYy9ueHAsbmNpLnlhbWwN
CiBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25l
dC9uZmMvbnhwLW5jaS50eHQNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9uZXQvbmZjL254cCxuY2kueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9uZXQvbmZjL254cCxuY2kueWFtbA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmlu
ZGV4IDAwMDAwMDAwMDAwMC4uZjg0ZTY5Nzc1ZWI1DQotLS0gL2Rldi9udWxsDQorKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L25mYy9ueHAsbmNpLnlhbWwNCkBAIC0w
LDAgKzEsNjEgQEANCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1Ig
QlNELTItQ2xhdXNlDQorJVlBTUwgMS4yDQorLS0tDQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvc2NoZW1hcy9uZXQvbmZjL254cCxuY2kueWFtbCMNCiskc2NoZW1hOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCisNCit0aXRsZTogTlhQIFNlbWljb25k
dWN0b3JzIE5DSSBORkMgY29udHJvbGxlcg0KKw0KK21haW50YWluZXJzOg0KKyAgLSBDaGFybGVz
IEdvcmFuZCA8Y2hhcmxlcy5nb3JhbmRAZWZmaW5ub3YuY29tPg0KKyAgLSBLcnp5c3p0b2YgS296
bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGNhbm9uaWNhbC5jb20+DQorDQorcHJvcGVydGll
czoNCisgIGNvbXBhdGlibGU6DQorICAgIGNvbnN0OiBueHAsbnhwLW5jaS1pMmMNCisNCisgIGNs
b2NrLWZyZXF1ZW5jeTogdHJ1ZQ0KKw0KKyAgZW5hYmxlLWdwaW9zOg0KKyAgICBkZXNjcmlwdGlv
bjogT3V0cHV0IEdQSU8gcGluIHVzZWQgZm9yIGVuYWJsaW5nL2Rpc2FibGluZyB0aGUgY29udHJv
bGxlcg0KKw0KKyAgZmlybXdhcmUtZ3Bpb3M6DQorICAgIGRlc2NyaXB0aW9uOiBPdXRwdXQgR1BJ
TyBwaW4gdXNlZCB0byBlbnRlciBmaXJtd2FyZSBkb3dubG9hZCBtb2RlDQorDQorICBpbnRlcnJ1
cHRzOg0KKyAgICBtYXhJdGVtczogMQ0KKw0KKyAgcmVnOg0KKyAgICBtYXhJdGVtczogMQ0KKw0K
K3JlcXVpcmVkOg0KKyAgLSBjb21wYXRpYmxlDQorICAtIGNsb2NrLWZyZXF1ZW5jeQ0KKyAgLSBl
bmFibGUtZ3Bpb3MNCisgIC0gaW50ZXJydXB0cw0KKyAgLSByZWcNCisNCithZGRpdGlvbmFsUHJv
cGVydGllczogZmFsc2UNCisNCitleGFtcGxlczoNCisgIC0gfA0KKyAgICAjaW5jbHVkZSA8ZHQt
YmluZGluZ3MvZ3Bpby9ncGlvLmg+DQorICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1
cHQtY29udHJvbGxlci9pcnEuaD4NCisNCisgICAgaTJjIHsNCisgICAgICAgICNhZGRyZXNzLWNl
bGxzID0gPDE+Ow0KKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQorDQorICAgICAgICBuZmNA
Mjkgew0KKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibnhwLG54cC1uY2ktaTJjIjsNCisNCisg
ICAgICAgICAgICByZWcgPSA8MHgyOT47DQorICAgICAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0g
PDEwMDAwMD47DQorDQorICAgICAgICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmZ3BpbzE+Ow0K
KyAgICAgICAgICAgIGludGVycnVwdHMgPSA8MjkgSVJRX1RZUEVfTEVWRUxfSElHSD47DQorDQor
ICAgICAgICAgICAgZW5hYmxlLWdwaW9zID0gPCZncGlvMCAzMCBHUElPX0FDVElWRV9ISUdIPjsN
CisgICAgICAgICAgICBmaXJtd2FyZS1ncGlvcyA9IDwmZ3BpbzAgMzEgR1BJT19BQ1RJVkVfSElH
SD47DQorICAgICAgICB9Ow0KKyAgICB9Ow0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9uZXQvbmZjL254cC1uY2kudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL25ldC9uZmMvbnhwLW5jaS50eHQNCmRlbGV0ZWQgZmlsZSBtb2RlIDEw
MDY0NA0KaW5kZXggMjg1YTM3YzJmMTg5Li4wMDAwMDAwMDAwMDANCi0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvbmZjL254cC1uY2kudHh0DQorKysgL2Rldi9udWxs
DQpAQCAtMSwzMyArMCwwIEBADQotKiBOWFAgU2VtaWNvbmR1Y3RvcnMgTlhQIE5DSSBORkMgQ29u
dHJvbGxlcnMNCi0NCi1SZXF1aXJlZCBwcm9wZXJ0aWVzOg0KLS0gY29tcGF0aWJsZTogU2hvdWxk
IGJlICJueHAsbnhwLW5jaS1pMmMiLg0KLS0gY2xvY2stZnJlcXVlbmN5OiBJwrJDIHdvcmsgZnJl
cXVlbmN5Lg0KLS0gcmVnOiBhZGRyZXNzIG9uIHRoZSBidXMNCi0tIGludGVycnVwdHM6IEdQSU8g
aW50ZXJydXB0IHRvIHdoaWNoIHRoZSBjaGlwIGlzIGNvbm5lY3RlZA0KLS0gZW5hYmxlLWdwaW9z
OiBPdXRwdXQgR1BJTyBwaW4gdXNlZCBmb3IgZW5hYmxpbmcvZGlzYWJsaW5nIHRoZSBjaGlwDQot
DQotT3B0aW9uYWwgU29DIFNwZWNpZmljIFByb3BlcnRpZXM6DQotLSBwaW5jdHJsLW5hbWVzOiBD
b250YWlucyBvbmx5IG9uZSB2YWx1ZSAtICJkZWZhdWx0Ii4NCi0tIHBpbnRjdHJsLTA6IFNwZWNp
ZmllcyB0aGUgcGluIGNvbnRyb2wgZ3JvdXBzIHVzZWQgZm9yIHRoaXMgY29udHJvbGxlci4NCi0t
IGZpcm13YXJlLWdwaW9zOiBPdXRwdXQgR1BJTyBwaW4gdXNlZCB0byBlbnRlciBmaXJtd2FyZSBk
b3dubG9hZCBtb2RlDQotDQotRXhhbXBsZSAoZm9yIEFSTS1iYXNlZCBCZWFnbGVCb25lIHdpdGgg
TlBDMTAwIE5GQyBjb250cm9sbGVyIG9uIEkyQzIpOg0KLQ0KLSZpMmMyIHsNCi0NCi0NCi0JbnBj
MTAwOiBucGMxMDBAMjkgew0KLQ0KLQkJY29tcGF0aWJsZSA9ICJueHAsbnhwLW5jaS1pMmMiOw0K
LQ0KLQkJcmVnID0gPDB4Mjk+Ow0KLQkJY2xvY2stZnJlcXVlbmN5ID0gPDEwMDAwMD47DQotDQot
CQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZncGlvMT47DQotCQlpbnRlcnJ1cHRzID0gPDI5IElSUV9U
WVBFX0xFVkVMX0hJR0g+Ow0KLQ0KLQkJZW5hYmxlLWdwaW9zID0gPCZncGlvMCAzMCBHUElPX0FD
VElWRV9ISUdIPjsNCi0JCWZpcm13YXJlLWdwaW9zID0gPCZncGlvMCAzMSBHUElPX0FDVElWRV9I
SUdIPjsNCi0JfTsNCi19Ow0KZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMN
CmluZGV4IDdjZmQ2M2NlNzEyMi4uMzI5NGFhZjVlNTZjIDEwMDY0NA0KLS0tIGEvTUFJTlRBSU5F
UlMNCisrKyBiL01BSU5UQUlORVJTDQpAQCAtMTM2MzIsNiArMTM2MzIsNyBAQCBOWFAtTkNJIE5G
QyBEUklWRVINCiBSOglDaGFybGVzIEdvcmFuZCA8Y2hhcmxlcy5nb3JhbmRAZWZmaW5ub3YuY29t
Pg0KIEw6CWxpbnV4LW5mY0BsaXN0cy4wMS5vcmcgKHN1YnNjcmliZXJzLW9ubHkpDQogUzoJU3Vw
cG9ydGVkDQorRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9uZmMvbnhw
LG5jaS55YW1sDQogRjoJZHJpdmVycy9uZmMvbnhwLW5jaQ0KIA0KIE5YUCBpLk1YIDhRWFAvOFFN
IEpQRUcgVjRMMiBEUklWRVINCi0tIA0KMi4zMC4yDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1uZmMgbWFpbGluZyBsaXN0IC0tIGxpbnV4LW5m
Y0BsaXN0cy4wMS5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBsaW51eC1uZmMt
bGVhdmVAbGlzdHMuMDEub3JnCiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShf
aW50ZXJuYWxfbmFtZSlz
