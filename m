Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAAD3C3F20
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:24:55 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 35B9D100EB32C;
	Sun, 11 Jul 2021 13:24:54 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 51EFF100EB32F
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:52 -0700 (PDT)
Received: from mail-wr1-f71.google.com ([209.85.221.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2g0R-0001tM-0I
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:24:51 +0000
Received: by mail-wr1-f71.google.com with SMTP id r18-20020adff1120000b029013e2b4ee624so1852832wro.1
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wFCoptG4eYx+Hl2Coc0Zn5js6ggXyggcHUWMZN4YUjE=;
        b=MIcaQCthQRSsebR3lJhpk+4U++OoLkUpgL8lt5xXljrqwnt4w0z+szvVy+QiBGZ8w2
         1D91IWNlTGC7P4krr5npi5h/SUtXxOWc+sPy18dvawInerrDyUAkhNMsqRmKi2Y0XTdF
         vhgCU+Exxa/y9Nefrc3LED6Skcx7KFkufkzSLZu/BjHhLY3zHDPZspIwA10uA6e2CjSS
         GVNFrfja1UjgNIJpOsV5jvqaoHX8gVdVU7gbDCJNNNcdstOJWbilldybqNnn0A29QfsL
         9UdySLOmwqDzUlBdgGyj475R0k59eQMH5teUr+5OEwi5QmcPQRQTk2fFDJf588hnVgFd
         igmw==
X-Gm-Message-State: AOAM5330OLb/rk0abC26ZIQJ43bJ/nRCEkhxGhof1HyOTbkjG9NbkJD7
	4n6KMq2WvAcKAkDlkl8oPZ4FCZc0cKTMVdxPgibsrdi/8Cb8QK3kqTogJf1Ru1tMOItSU4qiFRc
	QDqCft3N7sQSuHOrJiTovh7vCajhdvP5MaQ==
X-Received: by 2002:a1c:b403:: with SMTP id d3mr51332096wmf.79.1626035090535;
        Sun, 11 Jul 2021 13:24:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDa0WWJ8kMCS3DSHGWaG81O64Bujkvfkjo06NB+E3ULwumijf/ExCXt3RI72BZENeV67kQIg==
X-Received: by 2002:a1c:b403:: with SMTP id d3mr51332090wmf.79.1626035090380;
        Sun, 11 Jul 2021 13:24:50 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id n12sm12501575wmq.5.2021.07.11.13.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:24:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:23:43 +0200
Message-Id: <20210711202351.18363-14-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: O2UVJWV3FN5HSIZAEBJUTVG3Y7SGWBJD
X-Message-ID-Hash: O2UVJWV3FN5HSIZAEBJUTVG3Y7SGWBJD
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 26/34] device: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/O2UVJWV3FN5HSIZAEBJUTVG3Y7SGWBJD/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UHJvcGVybHkgcHJpbnQgc2lnbmVkIGFuZCB1bnNpZ25lZCBpbnRlZ2Vycy4gIFRoaXMgZml4ZXMg
d2FybmluZ3MgbGlrZToNCg0KICAgIHNyYy9kZXZpY2UuYzogSW4gZnVuY3Rpb24g4oCYbmVhcl9k
ZXZpY2VfZ2V0X2RldmljZeKAmToNCiAgICBzcmMvZGV2aWNlLmM6ODU6MzM6IGVycm9yOiBmb3Jt
YXQg4oCYJWTigJkgZXhwZWN0cyBhcmd1bWVudCBvZiB0eXBlIOKAmGludOKAmSwgYnV0IGFyZ3Vt
ZW50IDMgaGFzIHR5cGUg4oCYdWludDMyX3TigJkge2FrYSDigJh1bnNpZ25lZCBpbnTigJl9IFst
V2Vycm9yPWZvcm1hdD1dDQogICAgICAgODUgfCAgcGF0aCA9IGdfc3RyZHVwX3ByaW50ZigiJXMv
bmZjJWQvZGV2aWNlJWQiLCBORkNfUEFUSCwNCiAgICAgICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB+Xg0KICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8DQogICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludA0K
ICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICVkDQogICAgICAgODYg
fCAgICAgIGFkYXB0ZXJfaWR4LCB0YXJnZXRfaWR4KTsNCiAgICAgICAgICB8ICAgICAgfn5+fn5+
fn5+fn4NCiAgICAgICAgICB8ICAgICAgfA0KICAgICAgICAgIHwgICAgICB1aW50MzJfdCB7YWth
IHVuc2lnbmVkIGludH0NCg0KU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
eXN6dG9mLmtvemxvd3NraUBjYW5vbmljYWwuY29tPg0KLS0tDQogc3JjL2RldmljZS5jIHwgNiAr
KystLS0NCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0K
DQpkaWZmIC0tZ2l0IGEvc3JjL2RldmljZS5jIGIvc3JjL2RldmljZS5jDQppbmRleCBhNjU5OGUw
ZGRkMjguLmFlYWU3ZDM5YTI5MCAxMDA2NDQNCi0tLSBhL3NyYy9kZXZpY2UuYw0KKysrIGIvc3Jj
L2RldmljZS5jDQpAQCAtODIsNyArODIsNyBAQCBzdHJ1Y3QgbmVhcl9kZXZpY2UgKm5lYXJfZGV2
aWNlX2dldF9kZXZpY2UodWludDMyX3QgYWRhcHRlcl9pZHgsDQogDQogCURCRygiIik7DQogDQot
CXBhdGggPSBnX3N0cmR1cF9wcmludGYoIiVzL25mYyVkL2RldmljZSVkIiwgTkZDX1BBVEgsDQor
CXBhdGggPSBnX3N0cmR1cF9wcmludGYoIiVzL25mYyV1L2RldmljZSV1IiwgTkZDX1BBVEgsDQog
CQkJCQlhZGFwdGVyX2lkeCwgdGFyZ2V0X2lkeCk7DQogCWlmICghcGF0aCkNCiAJCXJldHVybiBO
VUxMOw0KQEAgLTMwNSw3ICszMDUsNyBAQCBpbnQgbmVhcl9kZXZpY2VfYWRkX3JlY29yZHMoc3Ry
dWN0IG5lYXJfZGV2aWNlICpkZXZpY2UsIEdMaXN0ICpyZWNvcmRzLA0KIAlmb3IgKGxpc3QgPSBy
ZWNvcmRzOyBsaXN0OyBsaXN0ID0gbGlzdC0+bmV4dCkgew0KIAkJcmVjb3JkID0gbGlzdC0+ZGF0
YTsNCiANCi0JCXBhdGggPSBnX3N0cmR1cF9wcmludGYoIiVzL25mYyVkL2RldmljZSVkL3JlY29y
ZCVkIiwNCisJCXBhdGggPSBnX3N0cmR1cF9wcmludGYoIiVzL25mYyV1L2RldmljZSV1L3JlY29y
ZCV1IiwNCiAJCQkJCU5GQ19QQVRILCBkZXZpY2UtPmFkYXB0ZXJfaWR4LA0KIAkJCQkJZGV2aWNl
LT50YXJnZXRfaWR4LCBkZXZpY2UtPm5fcmVjb3Jkcyk7DQogDQpAQCAtMzQyLDcgKzM0Miw3IEBA
IHN0cnVjdCBuZWFyX2RldmljZSAqX19uZWFyX2RldmljZV9hZGQodWludDMyX3QgYWRhcHRlcl9p
ZHgsIHVpbnQzMl90IHRhcmdldF9pZHgsDQogCWlmICghZGV2aWNlKQ0KIAkJcmV0dXJuIE5VTEw7
DQogDQotCWRldmljZS0+cGF0aCA9IGdfc3RyZHVwX3ByaW50ZigiJXMvbmZjJWQvZGV2aWNlJWQi
LCBORkNfUEFUSCwNCisJZGV2aWNlLT5wYXRoID0gZ19zdHJkdXBfcHJpbnRmKCIlcy9uZmMldS9k
ZXZpY2UldSIsIE5GQ19QQVRILA0KIAkJCQkJYWRhcHRlcl9pZHgsIHRhcmdldF9pZHgpOw0KIAlp
ZiAoIWRldmljZS0+cGF0aCkgew0KIAkJZ19mcmVlKGRldmljZSk7DQotLSANCjIuMjcuMA0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbmZjIG1h
aWxpbmcgbGlzdCAtLSBsaW51eC1uZmNAbGlzdHMuMDEub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQg
YW4gZW1haWwgdG8gbGludXgtbmZjLWxlYXZlQGxpc3RzLjAxLm9yZwolKHdlYl9wYWdlX3VybClz
bGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpcw==
