Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FD037BF1C
	for <lists+linux-nfc@lfdr.de>; Wed, 12 May 2021 16:00:59 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 889A1100EBB6C;
	Wed, 12 May 2021 07:00:58 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 36C83100EBB6B
	for <linux-nfc@lists.01.org>; Wed, 12 May 2021 07:00:56 -0700 (PDT)
Received: from mail-vs1-f72.google.com ([209.85.217.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lgpPy-0001i9-Pu
	for linux-nfc@lists.01.org; Wed, 12 May 2021 14:00:54 +0000
Received: by mail-vs1-f72.google.com with SMTP id d10-20020a67e10a0000b029022857e9d007so10381847vsl.14
        for <linux-nfc@lists.01.org>; Wed, 12 May 2021 07:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u38nZ0pTtHkniDD+jsScJheTZTLEaNhZSOY8TVKmDRU=;
        b=MaNFuexbKQgdArPu74UE0fPq4GT+fLt4oKYd+OeO98cAL8Vr0ezGbzgGmu8hrR5pqF
         tcmKp1s1M9xgk9Jt9f5JUUeFh0r3j+OpPvURB+Gvf14tOtcauHktuL9EhiHU3pQVXKeE
         30f2OTB99kxe8KxdG7bUrEava7kuXTsnkB9oaosPupPkIE4a/8FQR3jr2C323K/y7OUE
         Cn6aFsP6RhqRqsamFy3WjR2Uyfr9xHGCq7hqNTiIeBKQfk8aN30BFMLr0kzbHfunDwho
         Tuh1bXBziRhChb/MjuSxcMf+azxgMHJHvPkw+99ybARE0Ua2xuECDr0u4R8A7uOz4L5R
         lDEA==
X-Gm-Message-State: AOAM530dwkDctTgFkqL3lz9iVRg0qIq0CAoOa6ILI8Wd1Pxi3txNBJ0C
	jugEpH2pFbIeG+chQSHZ5YYKTKwN1mXtx1oLdxoOeHAlPCX9x/kg6gMrK5J4Kn38S1TDs2dT75/
	gn9lDl6CEli9t7Qv4t/PyLFZfebwbQMFkhA==
X-Received: by 2002:a05:6102:124d:: with SMTP id p13mr31050544vsg.21.1620828053628;
        Wed, 12 May 2021 07:00:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytaTLOcSZA3NzpgsIkFHShdPIHNDYEqFobPbJyqY0n/46iR+at+Pd1cdk9ox0eBJMtmUkyMA==
X-Received: by 2002:a05:6102:124d:: with SMTP id p13mr31050443vsg.21.1620828052929;
        Wed, 12 May 2021 07:00:52 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.2])
        by smtp.gmail.com with ESMTPSA id y4sm804927vsq.27.2021.05.12.07.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:00:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Charles Gorand <charles.gorand@effinnov.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>
Date: Wed, 12 May 2021 10:00:46 -0400
Message-Id: <20210512140046.25350-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Message-ID-Hash: 3FAWLROAZ7GMXGKR5L5HOT755OIL25O6
X-Message-ID-Hash: 3FAWLROAZ7GMXGKR5L5HOT755OIL25O6
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc]  [PATCH] =?utf-8?q?MAINTAINERS=3A_nfc=3A_drop_Cl=C3=A9ment_Perrochaud_from_NXP-NCI?=
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/3FAWLROAZ7GMXGKR5L5HOT755OIL25O6/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RW1haWxzIHRvIENsw6ltZW50IFBlcnJvY2hhdWQgYm91bmNlIHdpdGggcGVybWFuZW50IGVycm9y
ICJ1c2VyIGRvZXMgbm90DQpleGlzdCIsIHNvIHJlbW92ZSBDbMOpbWVudCBQZXJyb2NoYXVkIGZy
b20gTlhQLU5DSSBkcml2ZXIgbWFpbnRhaW5lcnMNCmVudHJ5Lg0KDQpTaWduZWQtb2ZmLWJ5OiBL
cnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGNhbm9uaWNhbC5jb20+DQot
LS0NCiBNQUlOVEFJTkVSUyB8IDEgLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pDQoN
CmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQppbmRleCBlZmVhZWJlMWJj
YWUuLmNjODE2NjdlOGJhYiAxMDA2NDQNCi0tLSBhL01BSU5UQUlORVJTDQorKysgYi9NQUlOVEFJ
TkVSUw0KQEAgLTEzMjA4LDcgKzEzMjA4LDYgQEAgRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3NvdW5kL3RmYTk4NzkudHh0DQogRjoJc291bmQvc29jL2NvZGVjcy90ZmE5ODc5
Kg0KIA0KIE5YUC1OQ0kgTkZDIERSSVZFUg0KLU06CUNsw6ltZW50IFBlcnJvY2hhdWQgPGNsZW1l
bnQucGVycm9jaGF1ZEBlZmZpbm5vdi5jb20+DQogUjoJQ2hhcmxlcyBHb3JhbmQgPGNoYXJsZXMu
Z29yYW5kQGVmZmlubm92LmNvbT4NCiBMOglsaW51eC1uZmNAbGlzdHMuMDEub3JnIChtb2RlcmF0
ZWQgZm9yIG5vbi1zdWJzY3JpYmVycykNCiBTOglTdXBwb3J0ZWQNCi0tIA0KMi4yNS4xDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1uZmMgbWFp
bGluZyBsaXN0IC0tIGxpbnV4LW5mY0BsaXN0cy4wMS5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBh
biBlbWFpbCB0byBsaW51eC1uZmMtbGVhdmVAbGlzdHMuMDEub3JnCiUod2ViX3BhZ2VfdXJsKXNs
aXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlz
