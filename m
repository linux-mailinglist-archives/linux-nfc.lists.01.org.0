Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1F93CD302
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:08:47 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 3D8AC100EBB96;
	Mon, 19 Jul 2021 04:08:44 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 9F1F7100EBBD9
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:41 -0700 (PDT)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 67A2B408B2
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692920;
	bh=6pVXbBKnfqPbSsfd3F4+CDZojZbr/9mE3puhwbtYSTg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=UD3B3DEUeAzKM1fwsFUAILKiOVmODEnjmtWcovl1LKiHN+lzAVnORROviU7H+sMWC
	 B7PxoWYRriSMN/YqRQDr/8ykpAwT5LgmLLk0VXGZY09nxKM0oJ2u9T1cGRBhVgaz73
	 PefYj6OJM8Q4caZgdNI8mlJLO8jX41IyDTkuKFG4ol2sufEvns/rZZFnCWGFowvAc3
	 Vcns/XhpvTU0JaL0qZcC0nu0Ar7LH3YKXW6vFC2GUwLs8kjdT3nM0CgQ+wa2XijDCA
	 iADVsILnLlPEwp0yzXCEoDVjESS+m857kI80OrIMQ2jPeJxPjz5zm1oN96QwbkMxuU
	 /PjP9VJFTTRQg==
Received: by mail-lj1-f198.google.com with SMTP id v10-20020a2ea60a0000b029017fd05dc0aaso9301748ljp.1
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6pVXbBKnfqPbSsfd3F4+CDZojZbr/9mE3puhwbtYSTg=;
        b=N1dZuxMCyjeZviVziTOz/2rQk/drD+e9oGY4S7MS7Ap1Da4t6l8HhEwRFbKpkj7L4+
         dyyfAOlCSvuS4cX0YawjWcOqq8uRo20/0r2q2cHF5TRaEO3Ke01Zcf+z+naejK9p0DZO
         RNgeEILN2Cq0EmifPfy8gyyYdK3tSb2mqkp4sk7c0Zc3OqNtemrjYmAc+pC41/eYcety
         DS4Bva2scnsgpsfI635I1A+J6Gnv4tj9me8AlvRqvY5vdys1OOU4amDH9QuquVrhdPjs
         1Q9jFyeAx3ooj3IJk/JG+ptvtSzSzcoozdfFcXW3Azt3q5SOr9ugX+HqfREjOAjXyh89
         p2tw==
X-Gm-Message-State: AOAM531xULJ0yNmRwjzKpqAo6AnAqZyBjJW1Aj4tdc6e8rBwauLKeP4Y
	ESHCiR094BZYWb+E9aZeqERYNI9oyDdXqVsMYBYg8PdaXTpOObk/vhwPHm3qjxNtFPXKhkXszQ9
	gRMwVdFj6GlF2YHOlVPaesS/fDkw2jjiTFA==
X-Received: by 2002:a05:6512:3891:: with SMTP id n17mr18502377lft.333.1626692919665;
        Mon, 19 Jul 2021 04:08:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAjsxA4kPCMrslriheKjWA414WtD8AeacO6OyDovE3hudVeTFlbc14IhthEUdP8bLeSo/iRg==
X-Received: by 2002:a05:6512:3891:: with SMTP id n17mr18502369lft.333.1626692919520;
        Mon, 19 Jul 2021 04:08:39 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:08:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:11 +0200
Message-Id: <20210719110819.27340-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: AXWT4TWSGJDECUGADML6WVV5NPMIWG5X
X-Message-ID-Hash: AXWT4TWSGJDECUGADML6WVV5NPMIWG5X
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 05/73] nfctool: fix adapter_compare_idx() cast-function-type
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/AXWT4TWSGJDECUGADML6WVV5NPMIWG5X/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Rml4IG9uIEdDQyB2MTA6DQoNCiAgICB0b29scy9uZmN0b29sL2FkYXB0ZXIuYzogSW4gZnVuY3Rp
b24g4oCYYWRhcHRlcl9nZXTigJk6DQogICAgdG9vbHMvbmZjdG9vbC9hZGFwdGVyLmM6MTU1Ojg6
IGVycm9yOiBjYXN0IGJldHdlZW4gaW5jb21wYXRpYmxlIGZ1bmN0aW9uIHR5cGVzIGZyb20g4oCY
Z2ludCAoKikoc3RydWN0IG5mY19hZGFwdGVyICosIGd1aW50MzIp4oCZIHtha2Eg4oCYaW50ICgq
KShzdHJ1Y3QgbmZjX2FkYXB0ZXIgKiwgdW5zaWduZWQgaW50KeKAmX0gdG8g4oCYZ2ludCAoKiko
Y29uc3Qgdm9pZCAqLCBjb25zdCB2b2lkICop4oCZIHtha2Eg4oCYaW50ICgqKShjb25zdCB2b2lk
ICosIGNvbnN0IHZvaWQgKinigJl9IFstV2Vycm9yPWNhc3QtZnVuY3Rpb24tdHlwZV0NCiAgICAg
IDE1NSB8ICAgICAgICAoR0NvbXBhcmVGdW5jKWFkYXB0ZXJfY29tcGFyZV9pZHgpOw0KICAgICAg
ICAgIHwgICAgICAgIF4NCg0KU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
eXN6dG9mLmtvemxvd3NraUBjYW5vbmljYWwuY29tPg0KLS0tDQogdG9vbHMvbmZjdG9vbC9hZGFw
dGVyLmMgfCA2ICsrKystLQ0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS90b29scy9uZmN0b29sL2FkYXB0ZXIuYyBiL3Rvb2xz
L25mY3Rvb2wvYWRhcHRlci5jDQppbmRleCA1ZTNiZjQxODg0ZDEuLjM0M2M0YWI3ZDBmZiAxMDA2
NDQNCi0tLSBhL3Rvb2xzL25mY3Rvb2wvYWRhcHRlci5jDQorKysgYi90b29scy9uZmN0b29sL2Fk
YXB0ZXIuYw0KQEAgLTEzOSw5ICsxMzksMTEgQEAgdm9pZCBhZGFwdGVyX2lkeF9wcmludF9pbmZv
KGd1aW50MzIgaWR4KQ0KIAkJZ19zbGlzdF9mb3JlYWNoKGFkYXB0ZXJzLCAoR0Z1bmMpYWRhcHRl
cl9wcmludF9pbmZvLCBOVUxMKTsNCiB9DQogDQotc3RhdGljIGdpbnQgYWRhcHRlcl9jb21wYXJl
X2lkeChzdHJ1Y3QgbmZjX2FkYXB0ZXIgKmFkYXB0ZXIsIGd1aW50MzIgaWR4KQ0KK3N0YXRpYyBn
aW50IGFkYXB0ZXJfY29tcGFyZV9pZHgoc3RydWN0IG5mY19hZGFwdGVyICphZGFwdGVyLCBncG9p
bnRlciBpZHhfcHRyKQ0KIHsNCi0JcmV0dXJuIChnaW50KWFkYXB0ZXItPmlkeCAtIChnaW50KWlk
eDsNCisJZ2ludCBpZHggPSBHUE9JTlRFUl9UT19JTlQoaWR4X3B0cik7DQorDQorCXJldHVybiAo
Z2ludClhZGFwdGVyLT5pZHggLSBpZHg7DQogfQ0KIA0KIHN0cnVjdCBuZmNfYWRhcHRlciAqYWRh
cHRlcl9nZXQoZ3VpbnQzMiBpZHgpDQotLSANCjIuMjcuMA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbmZjIG1haWxpbmcgbGlzdCAtLSBsaW51
eC1uZmNAbGlzdHMuMDEub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gbGludXgt
bmZjLWxlYXZlQGxpc3RzLjAxLm9yZwolKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClz
LyUoX2ludGVybmFsX25hbWUpcw==
