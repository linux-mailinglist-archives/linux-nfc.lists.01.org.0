Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9EF3CD31F
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:18 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 875A0100EB353;
	Mon, 19 Jul 2021 04:09:16 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 0BBA5100EB334
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:15 -0700 (PDT)
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 200CB40207
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692954;
	bh=wFCoptG4eYx+Hl2Coc0Zn5js6ggXyggcHUWMZN4YUjE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=VrZJ5RL7PQTj/ErtUuowXmtEG+O9q5RD9wwY6BdF1+UeKYjhqd2f3iwldPUoCFJvU
	 qy6ehDwVkHtuGlgnh3wc+KC3Wq0UV17MqM19hwRI+y2MHUJVtuinhRUTz63zE7oQOC
	 QLRv5LOdzY4NLfHYUFYG1pD68qVtN28kmSWr/PADZTaESWkWSiMFePW2G8aXslVef0
	 NqCNDQSD/+WNu4qqxY05xouWihxRlqyiOnbs3KVbFDh1dsaw+dPXJDNsY1/MvPphWe
	 XV4NgOav1rvDy3OhjwGymUIE2RHT5LWZh11j8yY6AHTfGY/CZcqA0JWn9GiDrVND4t
	 5BA2XsYDsTlaA==
Received: by mail-lj1-f200.google.com with SMTP id t1-20020a2e9d010000b02900f5b2b52da7so9342230lji.8
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wFCoptG4eYx+Hl2Coc0Zn5js6ggXyggcHUWMZN4YUjE=;
        b=t1PoQw1S7UJN/l0KvpYMHUDGUU8YgKkEgJWqpWRKLAZsOLrLBYIKThw7UayRBt6e/U
         hj9aBc6gc4eUsaO27vqF2XptlxmleuOuQ0gsURcSwNde4s/n9IYJFHTA5lTwBitJ8/RS
         H5qg7R5mLGFxmANAlW65D55ZL0qW998daReyFA57BZzy1snmb9GnEXR8X+ypUngaX3UH
         vOrWxXuO2/AVPZ9VWin4xwWUIX6WP8jDR/g/u7T50ee24XhBhj53ChDQdTlZsOFpFFZ3
         dlfzLW2wRKT3iRaT3XjKd5yXmwovRRLbg1Uso8j7pBF+F+Mw8T9EBKHwYCVyYu8N8Hse
         RIKw==
X-Gm-Message-State: AOAM53034DolpMacHfFoEF/bOF0ZVVHI9+SsOJO0bU7yhMoEG1kPPIII
	9EE9LgK4VLEZhNZwaZe4NN0LwvwPDyVXPCdo50TFXl0FitPRPtFkvrdY1i3Ee4zzQpJoxGjZgrr
	qOlVDppKVeqZntPZZhmL2MifwHk4RNiKxmw==
X-Received: by 2002:a2e:bf20:: with SMTP id c32mr21791423ljr.311.1626692953387;
        Mon, 19 Jul 2021 04:09:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwrkMeAYmnSWXHqJrFK/2qNGaTVqCILxyHOsePv7ngMg+xF6/Ycj7vAi4F7b90FB0cZwypbw==
X-Received: by 2002:a2e:bf20:: with SMTP id c32mr21791418ljr.311.1626692953243;
        Mon, 19 Jul 2021 04:09:13 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:40 +0200
Message-Id: <20210719110819.27340-35-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: QGCTM7TK3QGNNYUW5KVVP5XC4WCDRD6X
X-Message-ID-Hash: QGCTM7TK3QGNNYUW5KVVP5XC4WCDRD6X
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 34/73] device: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/QGCTM7TK3QGNNYUW5KVVP5XC4WCDRD6X/>
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
