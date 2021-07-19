Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDF73CD2FF
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:08:42 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 0036D100EBB9E;
	Mon, 19 Jul 2021 04:08:40 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id E6078100EBBBD
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:37 -0700 (PDT)
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id E8EB640325
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692916;
	bh=fIvrs8pHprqccvURZntNnQjPezrOSaFpM9ZQccZ8JA0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=nXrw3hk++i1TqqSDxV6hFVj6qReTWLbl3nR7mi3vPw2kf+JoOFVS8GIZgmg07R3cG
	 z988YVqMIKJBOZ5opxFz2TtV2yVrlIurp4xwERbYCSTQ5D0jYBJ/tz2onbv+Szndd5
	 Yn8SqAgSTHjZ8TtrgAiuSFZzcJncY0Bjw6GpDWBtVwtN0u5Weh7e6WUWfLjRBR5uft
	 kzxRkDQKlYD4ID7jCx5c2JoCngtxVlJ7WwIF2zFvOYpFVEQU1U2oORyOVyLkqnsTZK
	 ULqzSu1NDNhQZTSkzJ3PEeHeHCThQgI4kaOCvh0DfpaSMB5tX1ijKArhbq828NGb4x
	 AkDgXSlvf5D2g==
Received: by mail-lj1-f197.google.com with SMTP id q64-20020a2e5c430000b02901864030a0ecso9369943ljb.2
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fIvrs8pHprqccvURZntNnQjPezrOSaFpM9ZQccZ8JA0=;
        b=glbMN0NTGzMzNBU9wjZhcFV4WwZgLFSqDUrrE+PX2z9L0XCIRB+1j0ruJbC3IEQS1F
         6UPhmwQOofZ1etnb3jJ5O0hI4kZjGbxHliclbNyOCN/zMa0tcCbqp67kiy4IKVMgFxD2
         6T7p+MAQzKBf6kmwduDHxmWIFzmy0RL/3TR2IBySknhS3vbmFb2VHYcuCBgmERFqUOF4
         BzPDFSg/xsbMEueOvZGs/9sq6ZVUVCllbVW0stS9OHyQE3lesupN1VV3ogI+SkdpAmBJ
         oe+a9Egzf37COf+Nx6+JrfXl2NqkdvySZvHW4jkKVKCcJVIpIx1yVqb2uLeXrnQFpFO1
         DcJw==
X-Gm-Message-State: AOAM530qwiYV4E0K2ZvZ43g9yVOVFf6/IaIFyir+qUueEDH1Zf7U5+aq
	J2ssnzAPXqOJwOvRjdg75FTX6E/p8I8QFVsvwCGET2qhIfnTbAMywgu2SZy9gVTDqxNWDi7Nreg
	Zs0vXZPiOuX38mp4CtqCgmhvRymhZLgfCdg==
X-Received: by 2002:a05:651c:1587:: with SMTP id h7mr21992017ljq.285.1626692916221;
        Mon, 19 Jul 2021 04:08:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCcXMcY0vzYK3muFpLmTT9kaIQETbG6s7m5mMIa6NaklHkh309yOLfVIK6UmoXBvoUMa44EA==
X-Received: by 2002:a05:651c:1587:: with SMTP id h7mr21992007ljq.285.1626692916086;
        Mon, 19 Jul 2021 04:08:36 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:08:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:08 +0200
Message-Id: <20210719110819.27340-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: VVFLGJYLUTBJ3OB3FY6BTCFYNVLQGWNH
X-Message-ID-Hash: VVFLGJYLUTBJ3OB3FY6BTCFYNVLQGWNH
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 02/73] nfctool: fix adapter_get_devices() cast-function-type
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/VVFLGJYLUTBJ3OB3FY6BTCFYNVLQGWNH/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Rml4IG9uIEdDQyB2MTA6DQoNCiAgICB0b29scy9uZmN0b29sL2FkYXB0ZXIuYzogSW4gZnVuY3Rp
b24g4oCYYWRhcHRlcl9hbGxfZ2V0X2RldmljZXPigJk6DQogICAgdG9vbHMvbmZjdG9vbC9hZGFw
dGVyLmM6NTU6Mjg6IGVycm9yOiBjYXN0IGJldHdlZW4gaW5jb21wYXRpYmxlIGZ1bmN0aW9uIHR5
cGVzIGZyb20g4oCYdm9pZCAoKikoc3RydWN0IG5mY19hZGFwdGVyICop4oCZIHRvIOKAmHZvaWQg
KCopKHZvaWQgKiwgdm9pZCAqKeKAmSBbLVdlcnJvcj1jYXN0LWZ1bmN0aW9uLXR5cGVdDQogICAg
ICAgNTUgfCAgZ19zbGlzdF9mb3JlYWNoKGFkYXB0ZXJzLCAoR0Z1bmMpYWRhcHRlcl9nZXRfZGV2
aWNlcywgTlVMTCk7DQogICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICBeDQoN
ClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lA
Y2Fub25pY2FsLmNvbT4NCi0tLQ0KIHRvb2xzL25mY3Rvb2wvYWRhcHRlci5jIHwgMiArLQ0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0
IGEvdG9vbHMvbmZjdG9vbC9hZGFwdGVyLmMgYi90b29scy9uZmN0b29sL2FkYXB0ZXIuYw0KaW5k
ZXggYmVhZWU1MzI0M2NhLi41YTBjMzRhMGYyOGIgMTAwNjQ0DQotLS0gYS90b29scy9uZmN0b29s
L2FkYXB0ZXIuYw0KKysrIGIvdG9vbHMvbmZjdG9vbC9hZGFwdGVyLmMNCkBAIC0zNiw3ICszNiw3
IEBAIHN0YXRpYyBHU0xpc3QgKmFkYXB0ZXJzOw0KIA0KIHN0YXRpYyBzdHJ1Y3QgbmZjX2FkYXB0
ZXIgKnNlbGVjdGVkX2FkYXB0ZXI7DQogDQotc3RhdGljIHZvaWQgYWRhcHRlcl9nZXRfZGV2aWNl
cyhzdHJ1Y3QgbmZjX2FkYXB0ZXIgKmFkYXB0ZXIpDQorc3RhdGljIHZvaWQgYWRhcHRlcl9nZXRf
ZGV2aWNlcyhzdHJ1Y3QgbmZjX2FkYXB0ZXIgKmFkYXB0ZXIsIGdwb2ludGVyIHVzZXJfZGF0YSkN
CiB7DQogCWlmIChhZGFwdGVyLT5yZl9tb2RlID09IE5GQ19SRl9JTklUSUFUT1IpDQogCQlubF9n
ZXRfdGFyZ2V0cyhhZGFwdGVyKTsNCi0tIA0KMi4yNy4wDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1uZmMgbWFpbGluZyBsaXN0IC0tIGxpbnV4
LW5mY0BsaXN0cy4wMS5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBsaW51eC1u
ZmMtbGVhdmVAbGlzdHMuMDEub3JnCiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMv
JShfaW50ZXJuYWxfbmFtZSlz
