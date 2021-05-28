Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4903942C8
	for <lists+linux-nfc@lfdr.de>; Fri, 28 May 2021 14:42:31 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 0E3CE100EBB63;
	Fri, 28 May 2021 05:42:29 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id CA458100ED4BA
	for <linux-nfc@lists.01.org>; Fri, 28 May 2021 05:42:26 -0700 (PDT)
Received: from mail-vs1-f72.google.com ([209.85.217.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lmbon-00082N-CE
	for linux-nfc@lists.01.org; Fri, 28 May 2021 12:42:25 +0000
Received: by mail-vs1-f72.google.com with SMTP id s18-20020a05610201d2b029023869267cc8so947916vsq.21
        for <linux-nfc@lists.01.org>; Fri, 28 May 2021 05:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fEIoPxNrP5T6kipF7UD+JljPXbq0d6mIipwUTUc2Oss=;
        b=E8M7fXAY0VUfkACwKSfW2td5357n56hsfjzqOyii9ZwvnVsDzEXjaZFXjKKEeQJphi
         tg1AjRTOyigBYnsTQsXyLPoiDJoArDPchc+jJ4CQc6HdFneLOxOYhn26wXuhENcIv0b+
         aaaWTm+qF7789lHoF3AmtYbdVaqObeoMgykct/YNUFDC91cewNuiles0+YnaT3rSuGMY
         vhYsjs0SeVEAofwOlcjvR0Usd7aMqVOfav12VhyMDBG3mFtbJ/4fEGhe/YQDntWh0Lz9
         dWYeGbUYvcpxBB62OAtpfGFC07mMilAxLEvTHkhH4bXK+KRCULKItQkG+nBhwq69x+sF
         f61w==
X-Gm-Message-State: AOAM532u/UUMP+SnM0Ss4/aLbX6GuXaZROoFLhsYVrYLhKG0m5X8w2qs
	1jIrUQLcEWoruMtfbH7hN1CIoCCuRpyiQJmt8CK9ZWdaR2ix7gpOvAOfqU2FxNaBY0Wc96pZd1y
	5DKObEC911fJwq5BEihiuTc/oTmlL1/V1iw==
X-Received: by 2002:a67:eccc:: with SMTP id i12mr6543361vsp.45.1622205744540;
        Fri, 28 May 2021 05:42:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDadRXlslcePxNwoxbVhHp/mJrPYDYLe6dnq3jjs9H35NrGNs3pqvcHUUKSdLjy0Qc0iiMKA==
X-Received: by 2002:a67:eccc:: with SMTP id i12mr6543352vsp.45.1622205744385;
        Fri, 28 May 2021 05:42:24 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id b35sm782328uae.20.2021.05.28.05.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 05:42:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 28 May 2021 08:41:59 -0400
Message-Id: <20210528124200.79655-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
References: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: B2KROY2HLX7HM7LA2PGCDLEJJXII52DO
X-Message-ID-Hash: B2KROY2HLX7HM7LA2PGCDLEJJXII52DO
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 11/12] nfc: st21nfca: mark ACPI and OF device ID tables as maybe unused
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/B2KROY2HLX7HM7LA2PGCDLEJJXII52DO/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIGRyaXZlciBjYW4gbWF0Y2ggZWl0aGVyIHZpYSBPRiBvciBBQ1BJIElEIHRhYmxlcy4gIElm
IG9uZQ0KY29uZmlndXJhdGlvbiBpcyBkaXNhYmxlZCwgdGhlIHRhYmxlIHdpbGwgYmUgdW51c2Vk
Og0KDQogICAgZHJpdmVycy9uZmMvc3QyMW5mY2EvaTJjLmM6NTkzOjM0OiB3YXJuaW5nOg0KICAg
ICAgICDigJhvZl9zdDIxbmZjYV9pMmNfbWF0Y2jigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1X
dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0NCg0KU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBjYW5vbmljYWwuY29tPg0KLS0tDQogZHJpdmVycy9u
ZmMvc3QyMW5mY2EvaTJjLmMgfCA0ICsrLS0NCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZmMvc3QyMW5mY2Ev
aTJjLmMgYi9kcml2ZXJzL25mYy9zdDIxbmZjYS9pMmMuYw0KaW5kZXggMjNlZDExZjkxMjEzLi5j
ZWJjNmMwNmExYjYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL25mYy9zdDIxbmZjYS9pMmMuYw0KKysr
IGIvZHJpdmVycy9uZmMvc3QyMW5mY2EvaTJjLmMNCkBAIC01ODQsMTMgKzU4NCwxMyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgc3QyMW5mY2FfaGNpX2kyY19pZF90YWJsZVtd
ID0gew0KIH07DQogTU9EVUxFX0RFVklDRV9UQUJMRShpMmMsIHN0MjFuZmNhX2hjaV9pMmNfaWRf
dGFibGUpOw0KIA0KLXN0YXRpYyBjb25zdCBzdHJ1Y3QgYWNwaV9kZXZpY2VfaWQgc3QyMW5mY2Ff
aGNpX2kyY19hY3BpX21hdGNoW10gPSB7DQorc3RhdGljIGNvbnN0IHN0cnVjdCBhY3BpX2Rldmlj
ZV9pZCBzdDIxbmZjYV9oY2lfaTJjX2FjcGlfbWF0Y2hbXSBfX21heWJlX3VudXNlZCA9IHsNCiAJ
eyJTTU8yMTAwIiwgMH0sDQogCXt9DQogfTsNCiBNT0RVTEVfREVWSUNFX1RBQkxFKGFjcGksIHN0
MjFuZmNhX2hjaV9pMmNfYWNwaV9tYXRjaCk7DQogDQotc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9k
ZXZpY2VfaWQgb2Zfc3QyMW5mY2FfaTJjX21hdGNoW10gPSB7DQorc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgb2Zfc3QyMW5mY2FfaTJjX21hdGNoW10gX19tYXliZV91bnVzZWQgPSB7
DQogCXsgLmNvbXBhdGlibGUgPSAic3Qsc3QyMW5mY2EtaTJjIiwgfSwNCiAJeyAuY29tcGF0aWJs
ZSA9ICJzdCxzdDIxbmZjYV9pMmMiLCB9LA0KIAl7fQ0KLS0gDQoyLjI3LjANCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW5mYyBtYWlsaW5nIGxp
c3QgLS0gbGludXgtbmZjQGxpc3RzLjAxLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWls
IHRvIGxpbnV4LW5mYy1sZWF2ZUBsaXN0cy4wMS5vcmcKJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZv
JShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM=
