Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 783A847F6B2
	for <lists+linux-nfc@lfdr.de>; Sun, 26 Dec 2021 13:04:08 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 52CF6100F226A;
	Sun, 26 Dec 2021 04:04:06 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 26D9A100EB338
	for <linux-nfc@lists.01.org>; Sun, 26 Dec 2021 04:04:03 -0800 (PST)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D9FCC3F1B2
	for <linux-nfc@lists.01.org>; Sun, 26 Dec 2021 12:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1640520241;
	bh=7ZRYcQP4gwZ7osyzmEc94Zg7aNBaID54stiX6ii0ERI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
	b=C5brFjRTtRh8Jfdf8eu9Ei8jXVoouQ+ikrK4MFR94yUsYoazv83u7+a6nQezAGz4x
	 u2/QJJT8gPYP5crV3okAhkRNjd49qyeqT4VV+mhC9fqe/EbfKXANNd5yxxjYRH6P4z
	 YbemOoWN48Qp0zMZT55M/GeJpdfVWhONOM8U3Arh3yASU0lmdcuOQiDWpt0aZWcR1h
	 +4YQEO+PheeYfB1g0Y5eT6vXvzF3tEdQCeW9ldL1vj0bGsYSH4ReuB0Og2s3s8Ayl3
	 mhz6elnkpkr7zM6AmPdMTIhIdz2gPfz46F8Wcvv2ibS9dw2gvR7QcWJl4bVy62JIle
	 MKbmepNSb59ew==
Received: by mail-lj1-f199.google.com with SMTP id 83-20020a2e0956000000b0022d68f4a68aso3785176ljj.12
        for <linux-nfc@lists.01.org>; Sun, 26 Dec 2021 04:04:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7ZRYcQP4gwZ7osyzmEc94Zg7aNBaID54stiX6ii0ERI=;
        b=BkRC9iEOH/xyLro+9+IbMrlhuI2BiQ/tr9OFsZWHH9RSjA7RuyNnVvl3K9bKni0pM1
         +Zyv+5UFzeY1pVBGV38ibkmNByT+7oApL8qOtO9jJDm83kblLlks8P2BSUXVYmKZTRi9
         lh7LLMX0ri0pcOHLolsz3rW5dON6JLq7svfOCVgja66c2xjrSCgCNS3BGmki8D8+yj5a
         DV//xI5LB/k6T3RSzEh9w7EHYnYp0o1eXmYE889GMBhBi2e5IH2oRYZBAUlO/Kw8P3Jf
         rSUEZlqRUvkL5PI2b+emmq15Wq1KTRaDMGCQYDVMj6yXdZhJbAqrTkz5AwB7zNVtfCGR
         EOHw==
X-Gm-Message-State: AOAM532AylkRo8tfvj1IiD0nO6IbcV+RSGOQVH65KDeDzHvkLKKopMLE
	aO+1eSFOZhAtbWgfi42nIy38gf/8mUpNv3liKz0ptMWqV7bqKv3GzsR/YZN3CBq4nKT/uZpRh+F
	UjPf8iZV+L+mj0duPX1XkNmL0BVOQulfVuA==
X-Received: by 2002:a2e:8718:: with SMTP id m24mr4689976lji.306.1640520241363;
        Sun, 26 Dec 2021 04:04:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx25kcEr8SE2hE6DjZsPPB2SMeCupPe4TFn7Tj9CgX294X8VTyEvkJQoREMl23Oi+cK2yxXkA==
X-Received: by 2002:a2e:8718:: with SMTP id m24mr4689941lji.306.1640520240712;
        Sun, 26 Dec 2021 04:04:00 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id cf29sm1348719lfb.262.2021.12.26.04.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Dec 2021 04:04:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Sun, 26 Dec 2021 13:03:47 +0100
Message-Id: <20211226120347.77602-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Message-ID-Hash: V7VAX6SLN44XWMZOTENENT4H7TY5Z42O
X-Message-ID-Hash: V7VAX6SLN44XWMZOTENENT4H7TY5Z42O
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: "Dmitry V . Levin" <ldv@altlinux.org>, Arnd Bergmann <arnd@arndb.de>, stable@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH] nfc: uapi: use kernel size_t to fix user-space builds
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/V7VAX6SLN44XWMZOTENENT4H7TY5Z42O/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Rml4IHVzZXItc3BhY2UgYnVpbGRzIGlmIGl0IGluY2x1ZGVzIC91c3IvaW5jbHVkZS9saW51eC9u
ZmMuaCBiZWZvcmUNCnNvbWUgb2Ygb3RoZXIgaGVhZGVyczoNCg0KICAvdXNyL2luY2x1ZGUvbGlu
dXgvbmZjLmg6MjgxOjk6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJhzaXplX3TigJkNCiAg
ICAyODEgfCAgICAgICAgIHNpemVfdCBzZXJ2aWNlX25hbWVfbGVuOw0KICAgICAgICB8ICAgICAg
ICAgXn5+fn5+DQoNCkZpeGVzOiBkNjQ2OTYwZjc5ODYgKCJORkM6IEluaXRpYWwgTExDUCBzdXBw
b3J0IikNCkNjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4NClNpZ25lZC1vZmYtYnk6IEtyenlz
enRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNvbT4NCi0tLQ0K
IGluY2x1ZGUvdWFwaS9saW51eC9uZmMuaCB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51
eC9uZmMuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9uZmMuaA0KaW5kZXggZjZlM2M4YzljNzQ0Li5i
Yjk0YWFjNTYzNmMgMTAwNjQ0DQotLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvbmZjLmgNCisrKyBi
L2luY2x1ZGUvdWFwaS9saW51eC9uZmMuaA0KQEAgLTI3OCw3ICsyNzgsNyBAQCBzdHJ1Y3Qgc29j
a2FkZHJfbmZjX2xsY3Agew0KIAlfX3U4IGRzYXA7IC8qIERlc3RpbmF0aW9uIFNBUCwgaWYga25v
d24gKi8NCiAJX191OCBzc2FwOyAvKiBTb3VyY2UgU0FQIHRvIGJlIGJvdW5kIHRvICovDQogCWNo
YXIgc2VydmljZV9uYW1lW05GQ19MTENQX01BWF9TRVJWSUNFX05BTUVdOyAvKiBTZXJ2aWNlIG5h
bWUgVVJJICovOw0KLQlzaXplX3Qgc2VydmljZV9uYW1lX2xlbjsNCisJX19rZXJuZWxfc2l6ZV90
IHNlcnZpY2VfbmFtZV9sZW47DQogfTsNCiANCiAvKiBORkMgc29ja2V0IHByb3RvY29scyAqLw0K
LS0gDQoyLjMyLjANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW5mYyBtYWlsaW5nIGxpc3QgLS0gbGludXgtbmZjQGxpc3RzLjAxLm9yZwpUbyB1
bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGxpbnV4LW5mYy1sZWF2ZUBsaXN0cy4wMS5vcmcK
JSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM=
