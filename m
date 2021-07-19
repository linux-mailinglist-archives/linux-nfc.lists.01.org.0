Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 212003CD31E
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:18 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 7683B100EB349;
	Mon, 19 Jul 2021 04:09:16 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 15A89100EB323
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:14 -0700 (PDT)
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 2844140325
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692953;
	bh=dQmw3RzfbFm8R3yYKI27KgUprC3fG3Hu244AKbtkhqg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=bD/COB7iCV0D7tuWaZ4ytJ+gGYVAlDUKkkLICJzJWbXrM7jeZfi/PQ9DLmg9GFAy0
	 IsBo71fdJM0s0zT/1VweR4QJoiCqXlyrfrtfkufNb5GuuGadzW7nZcNpk8t3wOqM0X
	 JH58SYpn8PKB4wBCCp06VfC4qP2mYjeS6Sf3zHLEFoF93mke+Dwu0LIL71x1uvS7xF
	 rxRpqYmBQopCkZ49uyZdBckaYOjyXcQZj0VLJGqr3R1pGBA2enFrHDBU0dEZ75up2G
	 KQs5IvDO2ka1euUdvYsju7ffvQnIBElkbX6p+1bXJ1zAUDYHZuHwo9f49Kdk8Q+Rpz
	 Eoey+ediKGxyQ==
Received: by mail-lj1-f197.google.com with SMTP id v10-20020a2ea60a0000b029017fd05dc0aaso9302394ljp.1
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dQmw3RzfbFm8R3yYKI27KgUprC3fG3Hu244AKbtkhqg=;
        b=hi5rZ5joMK9G0znGMi/T+X4FNvGHexNgoFCkw9omkgIbjvmnMbBCnkyv9xVR/3aq4q
         yKM1GnRV47Rs6PUaXbjWQQTT+s8ezQYQjxgL835ASGGdhrCza0VuR9eGEYp2AjgTCJeW
         RY6V9UJMKsjoo6dORkJK9h+dCwLEfeu/fc3N8CVZzdCdxrCMvtkxwYTjVyaTocUdM4+x
         W+EiJLOa37tx86Sj6xFJB7Doou/B80i3Yznv8rnCz6z+LqA4cfL4IUNdJA0E45t9EVBS
         leBSCKKHVD1rrh0UP1VPKAPcO8bTTy2iJV33d3kAmA4kMji8vJBy8szsmW6FegWgYigo
         yfTg==
X-Gm-Message-State: AOAM533Beo1wNj/gGjyEZAlDv0c/Shp0WuxOjG98MPpCS/wWKiwWC5bx
	yv8hqdr+h/zUOVk+LEKzWADnpC9v/EaAFdxg6/S6SkEf+/YJqPwHtLt89qORvDVL6Se6HWItY6s
	DfxU06a44oEAF1xablGVoFXAOQeSS6iP0wA==
X-Received: by 2002:ac2:4f82:: with SMTP id z2mr17202006lfs.39.1626692952320;
        Mon, 19 Jul 2021 04:09:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycvCnwEhT7QaGSf04cTlphK6MURzVvd2qBMvhB+9HaF4Fecax9qslOdf8JD+UTCRIpuDiZAw==
X-Received: by 2002:ac2:4f82:: with SMTP id z2mr17202002lfs.39.1626692952183;
        Mon, 19 Jul 2021 04:09:12 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:39 +0200
Message-Id: <20210719110819.27340-34-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: K2FYEHDDGDCVJO7Y5VCXTCPY3VBFKVJ5
X-Message-ID-Hash: K2FYEHDDGDCVJO7Y5VCXTCPY3VBFKVJ5
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 33/73] npp: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/K2FYEHDDGDCVJO7Y5VCXTCPY3VBFKVJ5/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UHJvcGVybHkgcHJpbnQgc2lnbmVkIGFuZCB1bnNpZ25lZCBpbnRlZ2Vycy4gIFRoaXMgZml4ZXMg
d2FybmluZ3MgbGlrZToNCg0KICAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBwbHVnaW5zL25wcC5j
OjM2Og0KICAgIHBsdWdpbnMvbnBwLmM6IEluIGZ1bmN0aW9uIOKAmG5wcF9wdXNo4oCZOg0KICAg
IC4vaW5jbHVkZS9uZWFyL2xvZy5oOjQ1OjE0OiBlcnJvcjogZm9ybWF0IOKAmCV6ZOKAmSBleHBl
Y3RzIGFyZ3VtZW50IG9mIHR5cGUg4oCYc2lnbmVkIHNpemVfdOKAmSwgYnV0IGFyZ3VtZW50IDQg
aGFzIHR5cGUg4oCYc2l6ZV904oCZIHtha2Eg4oCYbG9uZyB1bnNpZ25lZCBpbnTigJl9IFstV2Vy
cm9yPWZvcm1hdD1dDQogICAgICAgNDUgfCAgIG5lYXJfZGVidWcoIiVzOiVzKCkgIiBmbXQsIFwN
CiAgICAgICAgICB8ICAgICAgICAgICAgICBefn5+fn5+fn5+DQogICAgcGx1Z2lucy9ucHAuYzox
ODU6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmERCR+KAmQ0KICAgICAgMTg1IHwg
IERCRygiU2VuZGluZyAlemQgYnl0ZXMiLCBmcmFtZV9sZW5ndGgpOw0KICAgICAgICAgIHwgIF5+
fg0KDQpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93
c2tpQGNhbm9uaWNhbC5jb20+DQotLS0NCiBwbHVnaW5zL25wcC5jIHwgMiArLQ0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvcGx1
Z2lucy9ucHAuYyBiL3BsdWdpbnMvbnBwLmMNCmluZGV4IDZiZWQzMDJiNGE4Zi4uNWM5ZDJlMGNk
MDAzIDEwMDY0NA0KLS0tIGEvcGx1Z2lucy9ucHAuYw0KKysrIGIvcGx1Z2lucy9ucHAuYw0KQEAg
LTE4Miw3ICsxODIsNyBAQCBzdGF0aWMgaW50IG5wcF9wdXNoKGludCBmZCwgdWludDMyX3QgYWRh
cHRlcl9pZHgsIHVpbnQzMl90IHRhcmdldF9pZHgsDQogCWVudHJ5LT5uZGVmX2xlbmd0aCA9IEdJ
TlRfVE9fQkUobmRlZi0+bGVuZ3RoKTsNCiAJbWVtY3B5KGVudHJ5LT5uZGVmLCBuZGVmLT5kYXRh
LCBuZGVmLT5sZW5ndGgpOw0KIA0KLQlEQkcoIlNlbmRpbmcgJXpkIGJ5dGVzIiwgZnJhbWVfbGVu
Z3RoKTsNCisJREJHKCJTZW5kaW5nICV6dSBieXRlcyIsIGZyYW1lX2xlbmd0aCk7DQogDQogCWVy
ciA9IHNlbmQoZmQsIGZyYW1lLCBmcmFtZV9sZW5ndGgsIE1TR19ET05UV0FJVCk7DQogDQotLSAN
CjIuMjcuMA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbmZjIG1haWxpbmcgbGlzdCAtLSBsaW51eC1uZmNAbGlzdHMuMDEub3JnClRvIHVuc3Vi
c2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gbGludXgtbmZjLWxlYXZlQGxpc3RzLjAxLm9yZwolKHdl
Yl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpcw==
