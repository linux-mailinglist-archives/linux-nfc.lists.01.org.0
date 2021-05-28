Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F2C3942C9
	for <lists+linux-nfc@lfdr.de>; Fri, 28 May 2021 14:42:32 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 1F4E6100ED4AB;
	Fri, 28 May 2021 05:42:30 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 1178A100ED4A2
	for <linux-nfc@lists.01.org>; Fri, 28 May 2021 05:42:28 -0700 (PDT)
Received: from mail-vs1-f71.google.com ([209.85.217.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lmboo-00082r-Lp
	for linux-nfc@lists.01.org; Fri, 28 May 2021 12:42:26 +0000
Received: by mail-vs1-f71.google.com with SMTP id x2-20020a67c0820000b0290231d255cecdso948428vsi.4
        for <linux-nfc@lists.01.org>; Fri, 28 May 2021 05:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BVM99Rq9YYpmqFYN93ErdoKv+Sqk4U9Fa7zLEpo/FoQ=;
        b=fw/0NKW/mhMypZUNDPaAaxvtVSuHz9f7EGcr5k9uK2EA3BVP4rtkWILPtdbPDWYJ2y
         N2Bu+xKVhBCYeF0NziJE8mINOsE6pn1ykkinnDMveD6ApyQGoHNSKI7+/ijrPRO9+E9g
         WzdYjn248yRumqC7ZIzbe0yIprrMA9S2wUmBB1UrJbnph7O4tQidV76D/BH2xGBTLO9h
         DF+5VjIsElveo3WxWG8MXYohMrwziYHMOd/ECSyHVFxI9Vv+lmSVnLNRifO0avjsAN/W
         MlyelOuCA1OSW0iX/RocdF9h4CX22XLhunxcBGGpLc0C2Xmbm01QiHOpo7QciG4MKhv+
         YfOw==
X-Gm-Message-State: AOAM5326MJCyxCedxWaH+cX9LTfpaievdHLWUmkDu0y6zrJdJZb6PFVS
	Wip1P1DsnWKdeOsKlAgbjQ/dGioh28C/uXSBP44Za6ivd+R18Vr+XrnZBcjJsLqviApF61hrKAX
	RjBJ04Qc6o+zFFREfq2w59uJMtE5a89Q5Hg==
X-Received: by 2002:a1f:eac6:: with SMTP id i189mr6094878vkh.3.1622205745859;
        Fri, 28 May 2021 05:42:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxI4pXCt8bne0kZBifLt5Y1FotnUnE0PxhwFaZQXgWqXhUGHZi56pmTBuAwfHxymwdgrabXfQ==
X-Received: by 2002:a1f:eac6:: with SMTP id i189mr6094860vkh.3.1622205745730;
        Fri, 28 May 2021 05:42:25 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id b35sm782328uae.20.2021.05.28.05.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 05:42:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 28 May 2021 08:42:00 -0400
Message-Id: <20210528124200.79655-12-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
References: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 4RHU3YGXRK3IRG2GIIQX6Y6J5AITPYGD
X-Message-ID-Hash: 4RHU3YGXRK3IRG2GIIQX6Y6J5AITPYGD
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 12/12] nfc: st95hf: mark ACPI and OF device ID tables as maybe unused
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/4RHU3YGXRK3IRG2GIIQX6Y6J5AITPYGD/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIGRyaXZlciBjYW4gbWF0Y2ggZWl0aGVyIHZpYSBPRiBvciBBQ1BJIElEIHRhYmxlcy4gIElm
IG9uZQ0KY29uZmlndXJhdGlvbiBpcyBkaXNhYmxlZCwgdGhlIHRhYmxlIHdpbGwgYmUgdW51c2Vk
Og0KDQogICAgZHJpdmVycy9uZmMvc3Q5NWhmL2NvcmUuYzoxMDU5OjM0OiB3YXJuaW5nOg0KICAg
ICAgICDigJhzdDk1aGZfc3BpX29mX21hdGNo4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3Vu
dXNlZC1jb25zdC12YXJpYWJsZT1dDQoNClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNvbT4NCi0tLQ0KIGRyaXZlcnMvbmZj
L3N0OTVoZi9jb3JlLmMgfCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL25mYy9zdDk1aGYvY29yZS5jIGIv
ZHJpdmVycy9uZmMvc3Q5NWhmL2NvcmUuYw0KaW5kZXggODg5MjRiZThkZWNiLi4wZDk5MTgxYjZj
ZTMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL25mYy9zdDk1aGYvY29yZS5jDQorKysgYi9kcml2ZXJz
L25mYy9zdDk1aGYvY29yZS5jDQpAQCAtMTA1Niw3ICsxMDU2LDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBzcGlfZGV2aWNlX2lkIHN0OTVoZl9pZFtdID0gew0KIH07DQogTU9EVUxFX0RFVklDRV9U
QUJMRShzcGksIHN0OTVoZl9pZCk7DQogDQotc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgc3Q5NWhmX3NwaV9vZl9tYXRjaFtdID0gew0KK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2
aWNlX2lkIHN0OTVoZl9zcGlfb2ZfbWF0Y2hbXSBfX21heWJlX3VudXNlZCA9IHsNCiAgICAgICAg
IHsgLmNvbXBhdGlibGUgPSAic3Qsc3Q5NWhmIiB9LA0KICAgICAgICAgeyB9LA0KIH07DQotLSAN
CjIuMjcuMA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbmZjIG1haWxpbmcgbGlzdCAtLSBsaW51eC1uZmNAbGlzdHMuMDEub3JnClRvIHVuc3Vi
c2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gbGludXgtbmZjLWxlYXZlQGxpc3RzLjAxLm9yZwolKHdl
Yl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpcw==
