Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C193CD300
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:08:44 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 1111E100EB846;
	Mon, 19 Jul 2021 04:08:41 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 3BBF0100EBB6E
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:39 -0700 (PDT)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 403BA40334
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692918;
	bh=EQNpjVN+uMTWLLgQiU4yFGqFkwZjjLhqOOf5PTeqrTg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BJIjaszPqp84rqNmdpMdtWXcyjTEJf4Fwm53LLMDL1e7aEXTY6Gs4EF5x7hjHaaMO
	 5I1aHevXYT4M+4NWu/DM0WyvNCLPts9W17uLLyPRb7xYZzJmj3sQFlto2uaw21RyBy
	 nWcXR/i5KEhLFLj3qzS1zd4N12+5NV5QkTPBceN+Lfx3tvs9VLh4DY3eLjpZUWhyt6
	 4EmOF5x7F8QBRSOGnQlG7whCdkSaCCxp8D9AmozIF9PLwYYmccVH/U4vWV/r+16HQG
	 FJLhZ4DWIcTPNAoKIEque95Ga2evPa0fNIVmc0zYDRX/K9xW8aJ+pk6OLGqdcUHkJ+
	 IF83nauWFwjzA==
Received: by mail-lf1-f71.google.com with SMTP id o9-20020a0565120529b029037e853a8057so3258355lfc.13
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EQNpjVN+uMTWLLgQiU4yFGqFkwZjjLhqOOf5PTeqrTg=;
        b=cNUjUNmmQOdg2hdPqWPldMiCsaWn1l5Du2I7Qzc1fl6arLhjvVOQJ8H38c5Xj9dr0o
         wHlzh0hxSPaxJbYRYIWc/tbkaoyUMV6TQtyes1wRZgg/wdd+LznNjBxNlnEBVHbcASEb
         GWSNg0C2Cx1vw3vqDQ+fDlBpwvatZhe1xc+Q7FRPyhZ9KT82qMVxFS7qgkUzjc9WPE6C
         zQCOxXvBMdfluP8i9Af5ooJCFc4vsRQRY9im9dzcmydAb1PsTDF8mykUI5n8bMMtOvVv
         j6n612sWyiX5ROPF1MA0xkW2Fn0lJb+9+ngc2n+55VmPA6iYv3aQlVUY4vCBtQqXtgyE
         GvAA==
X-Gm-Message-State: AOAM531hOexvxKTz/3BD1WFVeI5SMk/aFo8Tgocm2GpYqs8MZi1WWwRE
	ROQB+W6hwqqhukSbw5lpfxaM2AijEoaH8MsujlJ7mdLSQ/T3xchFfo3VjsdOXnBBUnyk9bpe8zb
	Nn+x0UJ6RU+qnXOZ2Z+8Nj2B12xchlbw19A==
X-Received: by 2002:a19:5e02:: with SMTP id s2mr17892390lfb.265.1626692917308;
        Mon, 19 Jul 2021 04:08:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzP7vngem3YO9sa4pisoIUnJrs5V4LmLIEWKDoy1ayeH0oS5F35xFw3jSGfGyZk8XcReA5fVA==
X-Received: by 2002:a19:5e02:: with SMTP id s2mr17892380lfb.265.1626692917137;
        Mon, 19 Jul 2021 04:08:37 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:08:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:09 +0200
Message-Id: <20210719110819.27340-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: XFJ7NZ37WURXG36E2S6GNIAWSBF4UOOX
X-Message-ID-Hash: XFJ7NZ37WURXG36E2S6GNIAWSBF4UOOX
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 03/73] nfctool: fix adapter_print_target() cast-function-type
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/XFJ7NZ37WURXG36E2S6GNIAWSBF4UOOX/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Rml4IG9uIEdDQyB2MTA6DQoNCiAgICB0b29scy9uZmN0b29sL2FkYXB0ZXIuYzogSW4gZnVuY3Rp
b24g4oCYYWRwYXRlcl9wcmludF90YXJnZXRz4oCZOg0KICAgIHRvb2xzL25mY3Rvb2wvYWRhcHRl
ci5jOjY5OjMzOiBlcnJvcjogY2FzdCBiZXR3ZWVuIGluY29tcGF0aWJsZSBmdW5jdGlvbiB0eXBl
cyBmcm9tIOKAmHZvaWQgKCopKGd1aW50MzIsICBnY2hhciAqKeKAmSB7YWthIOKAmHZvaWQgKCop
KHVuc2lnbmVkIGludCwgIGNoYXIgKinigJl9IHRvIOKAmHZvaWQgKCopKHZvaWQgKiwgdm9pZCAq
KeKAmSBbLVdlcnJvcj1jYXN0LWZ1bmN0aW9uLXR5cGVdDQogICAgICAgNjkgfCAgZ19zbGlzdF9m
b3JlYWNoKGFkYXB0ZXItPnRhZ3MsIChHRnVuYylhZGFwdGVyX3ByaW50X3RhcmdldCwgInRhZyIp
Ow0KICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeDQoNClNpZ25l
ZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25p
Y2FsLmNvbT4NCi0tLQ0KIHRvb2xzL25mY3Rvb2wvYWRhcHRlci5jIHwgNCArKy0tDQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBh
L3Rvb2xzL25mY3Rvb2wvYWRhcHRlci5jIGIvdG9vbHMvbmZjdG9vbC9hZGFwdGVyLmMNCmluZGV4
IDVhMGMzNGEwZjI4Yi4uNDUzYzJjMDk5MDA5IDEwMDY0NA0KLS0tIGEvdG9vbHMvbmZjdG9vbC9h
ZGFwdGVyLmMNCisrKyBiL3Rvb2xzL25mY3Rvb2wvYWRhcHRlci5jDQpAQCAtNTcsOSArNTcsOSBA
QCBpbnQgYWRhcHRlcl9hbGxfZ2V0X2RldmljZXModm9pZCkNCiAJcmV0dXJuIDA7DQogfQ0KIA0K
LXN0YXRpYyB2b2lkIGFkYXB0ZXJfcHJpbnRfdGFyZ2V0KGd1aW50MzIgaWR4LCBnY2hhciAqdHlw
ZSkNCitzdGF0aWMgdm9pZCBhZGFwdGVyX3ByaW50X3RhcmdldChncG9pbnRlciBpZHgsIGdjaGFy
ICp0eXBlKQ0KIHsNCi0JcHJpbnRmKCIlcyVkICIsIHR5cGUsIGlkeCk7DQorCXByaW50ZigiJXMl
ZCAiLCB0eXBlLCBHUE9JTlRFUl9UT19JTlQoaWR4KSk7DQogfQ0KIA0KIHZvaWQgYWRwYXRlcl9w
cmludF90YXJnZXRzKHN0cnVjdCBuZmNfYWRhcHRlciAqYWRhcHRlciwgZ2NoYXIgKnByZWZpeCkN
Ci0tIA0KMi4yNy4wDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1uZmMgbWFpbGluZyBsaXN0IC0tIGxpbnV4LW5mY0BsaXN0cy4wMS5vcmcKVG8g
dW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBsaW51eC1uZmMtbGVhdmVAbGlzdHMuMDEub3Jn
CiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlz
