Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B613CD331
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:38 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id BDCA9100F2276;
	Mon, 19 Jul 2021 04:09:36 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id BD6F4100EAB44
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:34 -0700 (PDT)
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id CBD6440207
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692973;
	bh=K+zcq7Invn/MFYK1xbcEs3U/YujdW+1HgjWFSYUL3dI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=rvVuzgIJAghXXgSai98r+aFYaNG0yMo/uftgUzVbnOXmq3qmGwely84uUHMw0hAkg
	 2Zs+5i4SpNq/cFIuy8ZgJQTb0J3HO4p5U1H3u8eTZ1I1gtMmG3WPzl0eljW+K3ju9D
	 wij0wrZqUVVhLF+7dZ0oI6NfDPtJQbUNnVmyzMqnMg60wDjJu8YFhaoL27Mg91VCY9
	 lKbAb8i0J7ttWaQ80h0bpY+tB45VqMjf98mdsmhRBPfxEu2MX7W13KmP86d8A1NKAL
	 iZaKmRrvhSx0zc6ciCTomupKPi2f2T7PX7fAljp5VG3Vs1hVVwQ98rYoa7DaVNXfK9
	 ebTD1aKo0XFGw==
Received: by mail-lf1-f69.google.com with SMTP id p13-20020a19604d0000b029038be656b5c5so2394574lfk.2
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K+zcq7Invn/MFYK1xbcEs3U/YujdW+1HgjWFSYUL3dI=;
        b=qtoVwLbPMu5eYEzWpOGUio6XmubfsyTNdUGA4YI+1v8owyriZBwJlcJXUwu7QGLI1v
         K0phqxBVrqh5ndx7IdQnWKPN8JL4f09zb2azuvnlj8lOsBQuEvcc3HgastgCkAdJgeZU
         VqL2H19Ax250WT1ty0UkExuO2fVKkspfbj6qGI5vTnVDZmvGE9eJyCTEEB8U7Jq+5JbE
         VKM/R0IWOT6iTIhhyiOymHbkDIikD04Vb5UULKR30YnBsDJ6IYjsHQG0kjPz6wJXtn3g
         zg9IZzyE9ZKfKi10pj3NJYLR40bMJdcfm6cCo9ubZuK7hbTY02GL31iXytzowBHJP2p+
         F4Ew==
X-Gm-Message-State: AOAM533pCEdkxnYYwerrb7l4IdBWMGK0vi34UG1Zr3k/hhf0HPtctVEZ
	KUEPER/cf4rkoXzU24yvOcFYKG7EBbU3IlK06NUWCWwNA702xMNiiIwdB9QO7PJcXGJEFYbAvLA
	zqoCQt/U5WxgdDmfHrEOe4lEQS+7mq2X1SA==
X-Received: by 2002:a05:6512:3709:: with SMTP id z9mr17601143lfr.182.1626692973042;
        Mon, 19 Jul 2021 04:09:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7iIbXL2beQt+rh56ljTdJ+BZdB2pSWreBhdgLAtvwaYsLrN6Rdvl9pdrCZIcSJZHxi3Nn8A==
X-Received: by 2002:a05:6512:3709:: with SMTP id z9mr17601134lfr.182.1626692972891;
        Mon, 19 Jul 2021 04:09:32 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:56 +0200
Message-Id: <20210719110819.27340-51-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 2WG2B3MUJRIER4LBPLIEHTEHTZ7456ZR
X-Message-ID-Hash: 2WG2B3MUJRIER4LBPLIEHTEHTZ7456ZR
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 50/73] unit: use proper pointer to uint8_t in test_snep_read_recv_fragments()
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/2WG2B3MUJRIER4LBPLIEHTEHTZ7456ZR/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UmF3IGRhdGEgYnl0ZXMgc2hvdWxkIGJlIHBhc3NlZCBhcyBwb2ludGVyIHRvIHVpbnQ4X3QgYW5k
IHRoZSBjYWxsaW5nDQpmdW5jdGlvbiBhbHJlYWR5IHVzZXMgdGhhdCB0eXBlLiAgVGhpcyBmaXhl
cyB3YXJuaW5nOg0KDQogICAgdW5pdC90ZXN0LXNuZXAtcmVhZC5jOiBJbiBmdW5jdGlvbiDigJh0
ZXN0X3NuZXBfcmVhZF9yZWN2X2ZyYWdtZW50c+KAmToNCiAgICB1bml0L3Rlc3Qtc25lcC1yZWFk
LmM6NDA4OjIxOiBlcnJvcjogcG9pbnRlciBvZiB0eXBlIOKAmHZvaWQgKuKAmSB1c2VkIGluIGFy
aXRobWV0aWMgWy1XZXJyb3I9cG9pbnRlci1hcml0aF0NCiAgICAgIDQwOCB8ICAgbWVtY3B5KGRh
dGFfcmVjdmQgKyBvZmZzZXQsIHJlc3AsIG5ieXRlcyk7DQogICAgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgIF4NCg0KU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6
dG9mLmtvemxvd3NraUBjYW5vbmljYWwuY29tPg0KLS0tDQogdW5pdC90ZXN0LXNuZXAtcmVhZC5j
IHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0K
DQpkaWZmIC0tZ2l0IGEvdW5pdC90ZXN0LXNuZXAtcmVhZC5jIGIvdW5pdC90ZXN0LXNuZXAtcmVh
ZC5jDQppbmRleCA1NTExZmVjZjVjMTcuLjc4ZGI1OGJhODU5ZiAxMDA2NDQNCi0tLSBhL3VuaXQv
dGVzdC1zbmVwLXJlYWQuYw0KKysrIGIvdW5pdC90ZXN0LXNuZXAtcmVhZC5jDQpAQCAtMzg2LDcg
KzM4Niw3IEBAIHN0YXRpYyBib29sIHRlc3Rfc25lcF9yZWFkX3NlbmRfZnJhZ21lbnQoc2l6ZV90
IGZyYWdfbGVuLA0KICAqIEBwYXJhbVtvdXRdIGRhdGEgICAgICAgICAgICAgTXVzdCBiZSBwcmVh
bGxvY2F0ZWQNCiAgKi8NCiBzdGF0aWMgdm9pZCB0ZXN0X3NuZXBfcmVhZF9yZWN2X2ZyYWdtZW50
cyh1aW50MzJfdCBmcmFnX2xlbiwNCi0JCQkJdWludDMyX3QgcmVtYWluaW5nX2J5dGVzLCB2b2lk
ICpkYXRhX3JlY3ZkKQ0KKwkJCQl1aW50MzJfdCByZW1haW5pbmdfYnl0ZXMsIHVpbnQ4X3QgKmRh
dGFfcmVjdmQpDQogew0KIAlzdHJ1Y3QgcDJwX3NuZXBfcmVzcF9mcmFtZSAqcmVzcDsNCiAJdWlu
dDMyX3Qgb2Zmc2V0ID0gMDsNCi0tIA0KMi4yNy4wDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1uZmMgbWFpbGluZyBsaXN0IC0tIGxpbnV4LW5m
Y0BsaXN0cy4wMS5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBsaW51eC1uZmMt
bGVhdmVAbGlzdHMuMDEub3JnCiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShf
aW50ZXJuYWxfbmFtZSlz
