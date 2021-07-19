Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7F33CD318
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:10 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 088C9100EB330;
	Mon, 19 Jul 2021 04:09:09 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 2BE54100EB33C
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:07 -0700 (PDT)
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 2B85140207
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692946;
	bh=ALPYuisJuNTTb6DTEUnqid+7H8k7Xl+3dqbIQ9EBvc4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NOpZFmdz4fQCaJ/qXWoLLesnFAADPXcJGpqZfU/Yeu6y7dOxV4rFdTWaweEIUqLl6
	 LbQ4gKiF2FWlB/kzNt3FUyjuuEGKzacijXyE0++HWErn1LWa4wo0onPkoQ6fKm6JHW
	 jLefPYQshNJq7xizgfsbLmxtKT5eSYVMLEyzEQ6uDuDTMxYlqr5Y9GpkRhHMCv0FUj
	 nRVFlU5kT17soXm9YCK0HEn9Kfb2wUBzrb/X+4XIUXHq9pmjk8pSeADmsjYbg4ZiDI
	 gDYP/4Ysgv8z+qpz3oa22DpuH83LRoSh873QVSw+urKWq/TS3YlXbhvFB2c2wG/+MX
	 R8NwKOyVq6UaA==
Received: by mail-lj1-f197.google.com with SMTP id z18-20020a2e96520000b0290178006de192so9320558ljh.3
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ALPYuisJuNTTb6DTEUnqid+7H8k7Xl+3dqbIQ9EBvc4=;
        b=qdDKa3ozNuSPxhIy1VL4xSmH61OKRoUDgIKgvzWJEdfrX7ya3vm+a9ZeF3ekhCiUIq
         H/vdG9P7K4HZgmqx3gw4cnye/k8Ocv2Ehoy+cWQI62SoF7G9tvzdC278zziNOiNeHVcE
         +vCNd5BruEe9eivok1hB61gfik6KnJRKsWFdm6DEtIpHp0hvVOu2JjqJG+dB4Rjbc0aK
         YriYyJ/Uy7l6rknHgL4dkEdaCxgl5VRth72fM4n8662cCr5DSyr2frWZRP4E5V/+kKjk
         Ks+9FRvE3xOaOlGVZiy1zADY1q/ply3oNbNj15iblnx034DZX1kj1gfgfG9Omzgtvhg5
         hVwA==
X-Gm-Message-State: AOAM5325owEhPBrf/OqwDm9C0rrimxfbw9PybeoPxD9lAZ+WIsz+H8qi
	57IAxZECB9gwnxirkmScgDxPSGDM4g+LCvyL1hoNzy+h4vG9x0qGafGPQbfxpowlhOmFqzc893j
	7pHpz42xSvCf7adK2pIZM+YO1T+nSQu9XzQ==
X-Received: by 2002:ac2:5472:: with SMTP id e18mr18566573lfn.26.1626692945439;
        Mon, 19 Jul 2021 04:09:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/yXh+DPMp2sWEA7YXsWwmsHtQIzUQcXkArP7rnuyLclzF0WC9z5/rG+ITJ4+3v5atnnB+tw==
X-Received: by 2002:ac2:5472:: with SMTP id e18mr18566561lfn.26.1626692945274;
        Mon, 19 Jul 2021 04:09:05 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:33 +0200
Message-Id: <20210719110819.27340-28-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: IKYKVPP5CPC6UPHDHG3K5GINWPIKTMXI
X-Message-ID-Hash: IKYKVPP5CPC6UPHDHG3K5GINWPIKTMXI
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 27/73] nfctype3: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/IKYKVPP5CPC6UPHDHG3K5GINWPIKTMXI/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UHJvcGVybHkgcHJpbnQgc2lnbmVkIGFuZCB1bnNpZ25lZCBpbnRlZ2Vycy4gIFRoaXMgZml4ZXMg
d2FybmluZ3MgbGlrZToNCg0KICAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBwbHVnaW5zL25mY3R5
cGUzLmM6MzY6DQogICAgcGx1Z2lucy9uZmN0eXBlMy5jOiBJbiBmdW5jdGlvbiDigJhkYXRhX3Jl
Y3bigJk6DQogICAgLi9pbmNsdWRlL25lYXIvbG9nLmg6NDU6MTQ6IGVycm9yOiBmb3JtYXQg4oCY
JXpk4oCZIGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDigJhzaWduZWQgc2l6ZV904oCZLCBidXQg
YXJndW1lbnQgNCBoYXMgdHlwZSDigJhzaXplX3TigJkge2FrYSDigJhsb25nIHVuc2lnbmVkIGlu
dOKAmX0gWy1XZXJyb3I9Zm9ybWF0PV0NCiAgICAgICA0NSB8ICAgbmVhcl9kZWJ1ZygiJXM6JXMo
KSAiIGZtdCwgXA0KICAgICAgICAgIHwgICAgICAgICAgICAgIF5+fn5+fn5+fn4NCiAgICBwbHVn
aW5zL25mY3R5cGUzLmM6MjQ5OjM6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhEQkfi
gJkNCiAgICAgIDI0OSB8ICAgREJHKCJEb25lIHJlYWRpbmcgJXpkIGJ5dGVzIGF0ICVwIiwgZGF0
YV9sZW5ndGgsIG5mY19kYXRhKTsNCiAgICAgICAgICB8ICAgXn5+DQoNClNpZ25lZC1vZmYtYnk6
IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNvbT4N
Ci0tLQ0KIHBsdWdpbnMvbmZjdHlwZTMuYyB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL3BsdWdpbnMvbmZjdHlwZTMu
YyBiL3BsdWdpbnMvbmZjdHlwZTMuYw0KaW5kZXggZDRmYmVkMGRmYzJmLi5jMDUwMmYxNWQ5ZjIg
MTAwNjQ0DQotLS0gYS9wbHVnaW5zL25mY3R5cGUzLmMNCisrKyBiL3BsdWdpbnMvbmZjdHlwZTMu
Yw0KQEAgLTI0Niw3ICsyNDYsNyBAQCBzdGF0aWMgaW50IGRhdGFfcmVjdih1aW50OF90ICpyZXNw
LCBpbnQgbGVuZ3RoLCB2b2lkICpkYXRhKQ0KIA0KIAkJdGFnLT5jdXJyZW50X2Jsb2NrID0gMDsN
CiANCi0JCURCRygiRG9uZSByZWFkaW5nICV6ZCBieXRlcyBhdCAlcCIsIGRhdGFfbGVuZ3RoLCBu
ZmNfZGF0YSk7DQorCQlEQkcoIkRvbmUgcmVhZGluZyAlenUgYnl0ZXMgYXQgJXAiLCBkYXRhX2xl
bmd0aCwgbmZjX2RhdGEpOw0KIAkJcmVjb3JkcyA9IG5lYXJfbmRlZl9wYXJzZV9tc2cobmZjX2Rh
dGEsIGRhdGFfbGVuZ3RoLCBOVUxMKTsNCiAJCW5lYXJfdGFnX2FkZF9yZWNvcmRzKHRhZy0+dGFn
LCByZWNvcmRzLCB0YWctPmNiLCAwKTsNCiANCi0tIA0KMi4yNy4wDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1uZmMgbWFpbGluZyBsaXN0IC0t
IGxpbnV4LW5mY0BsaXN0cy4wMS5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBs
aW51eC1uZmMtbGVhdmVAbGlzdHMuMDEub3JnCiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dp
ZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlz
