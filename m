Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD423C3F1E
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:24:50 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 097A7100EB325;
	Sun, 11 Jul 2021 13:24:49 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 8FC24100EB848
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:47 -0700 (PDT)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2g0M-0001sL-7o
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:24:46 +0000
Received: by mail-wr1-f69.google.com with SMTP id h15-20020adffd4f0000b0290137e68ed637so6118019wrs.22
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dQmw3RzfbFm8R3yYKI27KgUprC3fG3Hu244AKbtkhqg=;
        b=Cidqpcw0W7HF/wfL5bZnhoAbESVah6Jt6IMnGpDke04MRXR2A6pEz76NcgU5ZeB9Un
         UzQnyav3Vvo4MAcBEEPvR6JgTMbZz4xhdMrWnsbwexsUzvX6Wpn8fR22fmOLWwlh+1gT
         eT9iDTIYOpkfioJ4TbQsNv/l8ZGyYpM2LG4Ukat3KODTUwmtLfMXSWSs8SVKDfEaN5r9
         x63PW/IqJfu5BAk+BLY12qqpJ8E5gxQVxA4jNBDL6B7oIRha65nBrdIh4LUZUjB8XIon
         tb5vLVyWdj9r64+aMlHcN32sSEwF/q4Um+jFgHuHoDVWot0RhDMB+ZWAwZgcQ/PXMyNC
         ePwA==
X-Gm-Message-State: AOAM532ZDcb7ndt8jTO0EibC1on7GdqcxR4Hc92Q7y/cJ89Y63K4aRYP
	UOdot2AgsAIxoUDOzUF5VAPXMoeYxbGLD+5eb/YREQ2p8EHO8wQr9bG8KS7PxbSLDtaUGIE9h9D
	BPcSI9R2JWmVlCumgT4dOZaILD2942G3ynQ==
X-Received: by 2002:adf:fb51:: with SMTP id c17mr56003891wrs.106.1626035085726;
        Sun, 11 Jul 2021 13:24:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9Ur4Z74Xks6h6xsX+yuVyoUV3eSEe+YcX9kSo4ozxZ4I4AqxK96gXSF/azjAdD5X6wIE7SA==
X-Received: by 2002:adf:fb51:: with SMTP id c17mr56003885wrs.106.1626035085620;
        Sun, 11 Jul 2021 13:24:45 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id n12sm12501575wmq.5.2021.07.11.13.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:24:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:23:41 +0200
Message-Id: <20210711202351.18363-12-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 6P3TWYSBS2UG4WFHPY3WKMTQE6MCYWGB
X-Message-ID-Hash: 6P3TWYSBS2UG4WFHPY3WKMTQE6MCYWGB
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 24/34] npp: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/6P3TWYSBS2UG4WFHPY3WKMTQE6MCYWGB/>
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
