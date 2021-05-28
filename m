Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1D63942BA
	for <lists+linux-nfc@lfdr.de>; Fri, 28 May 2021 14:42:18 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 5782D100ED4A2;
	Fri, 28 May 2021 05:42:15 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B9FED100ED4A0
	for <linux-nfc@lists.01.org>; Fri, 28 May 2021 05:42:12 -0700 (PDT)
Received: from mail-vs1-f69.google.com ([209.85.217.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lmboZ-0007xH-Ct
	for linux-nfc@lists.01.org; Fri, 28 May 2021 12:42:11 +0000
Received: by mail-vs1-f69.google.com with SMTP id a25-20020a0561020159b029024067c780c1so947425vsr.20
        for <linux-nfc@lists.01.org>; Fri, 28 May 2021 05:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c5PhAYJAgpgGf/ki2oqzdzivSFW2QLSW3v25wv1mU4g=;
        b=V/9aj1qujP4umT1C7LDXO7A6z2pWso3Mxgiu8JZTXuKjWSRSKQ2+cUPE++88jS6AEV
         f+UmDswB2rKssSKtG9WmTurZa+7N3345u2Ipv5UayX4YLN+oHM5FuwsvSBJntA/5xqvY
         CA5dm6/kk79D+qSeWrqyFBCu6Ttg5nkvW0RFKt8fJwTNdTxOUT2mkf3kK/RNqrzqkSZ6
         cT12QVCIVumyiZqGHoXDRQ4D0TxWuQLJQVSR/3p/0dMnVm8jAHTyu5wXex7Hw3Cbld16
         d8baBzGv/Ug2GPwwH2V6RVzW/oM6rgq83jg5pnVpok8rLp/9fobt8c4UFemYRaAwyjiu
         225A==
X-Gm-Message-State: AOAM533GIXLMOOWmbjn5XAoTYd6Bz509BqtA7o128tZUKtXDWQ3rpWgJ
	NJIvc36/pS6f84wiVmbXJSe8Bjco5VWoZIB3W4D35gXPWdJ6j6nNPpoj0vYi2kImOi644rqiGMz
	V/862KuElMXOw4r4y5dqdRdUMYcfqJh+wng==
X-Received: by 2002:ac5:c3ca:: with SMTP id t10mr1383173vkk.11.1622205730297;
        Fri, 28 May 2021 05:42:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAguSr2J93TSQQJDG3VnDliTUMEJaVy45IiQ+G+QWSSRLr762rLfLwGPi5FoNLdafPbJYLgw==
X-Received: by 2002:ac5:c3ca:: with SMTP id t10mr1383136vkk.11.1622205730053;
        Fri, 28 May 2021 05:42:10 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id b35sm782328uae.20.2021.05.28.05.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 05:42:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 28 May 2021 08:41:50 -0400
Message-Id: <20210528124200.79655-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
References: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: UJ37S7H6GILWVWGMKTLY7WCOZGR6SBIM
X-Message-ID-Hash: UJ37S7H6GILWVWGMKTLY7WCOZGR6SBIM
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 02/12] nfc: fdp: drop ACPI_PTR from device ID table
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/UJ37S7H6GILWVWGMKTLY7WCOZGR6SBIM/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIGRyaXZlciBjYW4gbWF0Y2ggb25seSB2aWEgdGhlIEFDUEkgSUQgdGFibGUgc28gdGhlIHRh
YmxlIHNob3VsZCBiZQ0KYWx3YXlzIHVzZWQgYW5kIHRoZSBBQ1BJX1BUUiBkb2VzIG5vdCBoYXZl
IGFueSBzZW5zZS4gIFRoaXMgZml4ZXMgZml4ZXMNCmNvbXBpbGUgd2FybmluZyAoIUNPTkZJR19B
Q1BJKToNCg0KICAgIGRyaXZlcnMvbmZjL2ZkcC9pMmMuYzozNjI6MzY6IHdhcm5pbmc6DQogICAg
ICAgIOKAmGZkcF9uY2lfaTJjX2FjcGlfbWF0Y2jigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1X
dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0NCg0KU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBjYW5vbmljYWwuY29tPg0KLS0tDQogZHJpdmVycy9u
ZmMvZmRwL2kyYy5jIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZmMvZmRwL2kyYy5jIGIvZHJpdmVy
cy9uZmMvZmRwL2kyYy5jDQppbmRleCBhZGFhMWE3MTQ3ZjkuLjk5N2UwODA2ODIxYSAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvbmZjL2ZkcC9pMmMuYw0KKysrIGIvZHJpdmVycy9uZmMvZmRwL2kyYy5j
DQpAQCAtMzY4LDcgKzM2OCw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUoYWNwaSwgZmRwX25jaV9p
MmNfYWNwaV9tYXRjaCk7DQogc3RhdGljIHN0cnVjdCBpMmNfZHJpdmVyIGZkcF9uY2lfaTJjX2Ry
aXZlciA9IHsNCiAJLmRyaXZlciA9IHsNCiAJCSAgIC5uYW1lID0gRkRQX0kyQ19EUklWRVJfTkFN
RSwNCi0JCSAgIC5hY3BpX21hdGNoX3RhYmxlID0gQUNQSV9QVFIoZmRwX25jaV9pMmNfYWNwaV9t
YXRjaCksDQorCQkgICAuYWNwaV9tYXRjaF90YWJsZSA9IGZkcF9uY2lfaTJjX2FjcGlfbWF0Y2gs
DQogCQkgIH0sDQogCS5wcm9iZV9uZXcgPSBmZHBfbmNpX2kyY19wcm9iZSwNCiAJLnJlbW92ZSA9
IGZkcF9uY2lfaTJjX3JlbW92ZSwNCi0tIA0KMi4yNy4wDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1uZmMgbWFpbGluZyBsaXN0IC0tIGxpbnV4
LW5mY0BsaXN0cy4wMS5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBsaW51eC1u
ZmMtbGVhdmVAbGlzdHMuMDEub3JnCiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMv
JShfaW50ZXJuYWxfbmFtZSlz
