Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE303CD316
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:08 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id DA642100EB339;
	Mon, 19 Jul 2021 04:09:05 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id DCC9F100EB329
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:04 -0700 (PDT)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id F11E840325
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692943;
	bh=yDhXsIs2jsFYqx0LFtrD/pgQivIk/Mv0diihqtesc/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hmKONd2n1mGvTBKfKuBhcmkvnzWNxgycRqD6OqV7tYFEsLQmxvPaUh+knOXJ/zjOT
	 OVFeRPmw7HhbYwoVwsTTgUirsKDxkTt52sMxYUrVTlh2LsMXNifzqCnzPdnMcUKsq4
	 gCC5uu+/sX9/91+7r71zWsOXfWRku2Fyw6OCbJIEzTsWMyTSP5fdBDIJJqrXyuxpMQ
	 cPLwgj4PLLDn8Rn5OvwK9lYqVQm5jcrdBQ4mWdZpQ7if09uNLf/6I6/pT/q2hO8/wa
	 yncDjWNAeyELVOMpYINdULqKTppqkkdZ9s1aAcsMpLyhoEBNRE+s/EQkD7lP6rMSoY
	 iKi5mURo3MIGQ==
Received: by mail-lj1-f198.google.com with SMTP id e9-20020a2e98490000b029018c799ba37bso9287373ljj.6
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yDhXsIs2jsFYqx0LFtrD/pgQivIk/Mv0diihqtesc/o=;
        b=tuCSMEQpKaOrqAP1XyUP/wESuGfnJBAJB0Zks6vZ3uS8HkYVLoHTfu5sFRzp+M0ikT
         pQ9jhCggAADK522i+qdt0wl56lxfxr0KLryFkORD/Ks+SgjWcesseVAFV4Z/+hIqKuFZ
         QmHPp/H6fa6SSK5AbweUvy8vCfD8PzqxETUlwFHcZdkjTzAgF2NPi+oaak13yGpCnL9q
         RGd0z3rSRVw0Q2kKRD8DkVfEEB+04BtJ2fyYQCpxJFV39vRcjib5VblOk+K93cw70/eM
         XQtBzueDiQD8Mb6XvRQPVuR5j38/zXxYLodWaCqnz28qNL5zKkBUHtHbkC588Yzi/KRG
         BDbg==
X-Gm-Message-State: AOAM5327uejOCqSdMClWG1PGn8DhlTER7QHU1A7GOoZKAQxGKh+8hW6A
	3A0wY8c2glkeubATEdZYTyiWpmdLkSi4+Dyjusz6oixRwb8fOSf/t4poBekFlR+BrusNz5pbP4q
	UaE+3si3iuYUyfAv1H64W+4P63GaH+mN+kw==
X-Received: by 2002:ac2:547b:: with SMTP id e27mr18466793lfn.200.1626692943224;
        Mon, 19 Jul 2021 04:09:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx32O6qhj0pRGnBUkRaKjL6XQrDmt2PMxsTXbtlf4L+ctO+SFeLas483hBxh0UPMU8eik/FIQ==
X-Received: by 2002:ac2:547b:: with SMTP id e27mr18466787lfn.200.1626692943053;
        Mon, 19 Jul 2021 04:09:03 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:31 +0200
Message-Id: <20210719110819.27340-26-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: EEWXHZYZQKTFXNIXBJVQGOPKHCNG3GQB
X-Message-ID-Hash: EEWXHZYZQKTFXNIXBJVQGOPKHCNG3GQB
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 25/73] bluetooth: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/EEWXHZYZQKTFXNIXBJVQGOPKHCNG3GQB/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UHJvcGVybHkgcHJpbnQgc2lnbmVkIGFuZCB1bnNpZ25lZCBpbnRlZ2Vycy4gIFRoaXMgZml4ZXMg
d2FybmluZ3MgbGlrZToNCg0KICAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBzcmMvbmVhci5oOjM2
LA0KICAgICAgICAgICAgICAgICAgICAgZnJvbSBzcmMvYmx1ZXRvb3RoLmM6MzI6DQogICAgc3Jj
L2JsdWV0b290aC5jOiBJbiBmdW5jdGlvbiDigJhidF9hZGFwdGVyX3Byb3BlcnR5X2NoYW5nZWTi
gJk6DQogICAgLi9pbmNsdWRlL25lYXIvbG9nLmg6NDU6MTQ6IGVycm9yOiBmb3JtYXQg4oCYJXji
gJkgZXhwZWN0cyBhcmd1bWVudCBvZiB0eXBlIOKAmHVuc2lnbmVkIGludOKAmSwgYnV0IGFyZ3Vt
ZW50IDUgaGFzIHR5cGUg4oCYaW504oCZIFstV2Vycm9yPWZvcm1hdD1dDQogICAgICAgNDUgfCAg
IG5lYXJfZGVidWcoIiVzOiVzKCkgIiBmbXQsIFwNCiAgICAgICAgICB8ICAgICAgICAgICAgICBe
fn5+fn5+fn5+DQogICAgc3JjL2JsdWV0b290aC5jOjQ2NTozOiBub3RlOiBpbiBleHBhbnNpb24g
b2YgbWFjcm8g4oCYREJH4oCZDQogICAgICA0NjUgfCAgIERCRygiJXM6ICV4IiwgcHJvcGVydHks
IGJ0X2RlZl9vb2JfZGF0YS5jbGFzc19vZl9kZXZpY2UpOw0KICAgICAgICAgIHwgICBefn4NCg0K
ICAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBzcmMvbmVhci5oOjM2LA0KICAgICAgICAgICAgICAg
ICAgICAgZnJvbSBzcmMvYmx1ZXRvb3RoLmM6MzI6DQogICAgc3JjL2JsdWV0b290aC5jOiBJbiBm
dW5jdGlvbiDigJhidF9hZGFwdGVyX3Byb3BlcnR5X2NoYW5nZWTigJk6DQogICAgLi9pbmNsdWRl
L25lYXIvbG9nLmg6NDU6MTQ6IGVycm9yOiBmb3JtYXQg4oCYJXXigJkgZXhwZWN0cyBhcmd1bWVu
dCBvZiB0eXBlIOKAmHVuc2lnbmVkIGludOKAmSwgYnV0IGFyZ3VtZW50IDUgaGFzIHR5cGUg4oCY
aW504oCZIFstV2Vycm9yPWZvcm1hdD1dDQogICAgICAgNDUgfCAgIG5lYXJfZGVidWcoIiVzOiVz
KCkgIiBmbXQsIFwNCiAgICAgICAgICB8ICAgICAgICAgICAgICBefn5+fn5+fn5+DQogICAgc3Jj
L2JsdWV0b290aC5jOjQ3NTozOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYREJH4oCZ
DQogICAgICA0NzUgfCAgIERCRygiJXM6ICV1IiwgcHJvcGVydHksIGJ0X2RlZl9vb2JfZGF0YS5w
b3dlcmVkKTsNCiAgICAgICAgICB8ICAgXn5+DQoNClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBL
b3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNvbT4NCi0tLQ0KIHNyYy9i
bHVldG9vdGguYyB8IDQgKystLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9zcmMvYmx1ZXRvb3RoLmMgYi9zcmMvYmx1ZXRv
b3RoLmMNCmluZGV4IDNlNjdmMWM4OGI4NC4uNzljZmJiMzhlMzM0IDEwMDY0NA0KLS0tIGEvc3Jj
L2JsdWV0b290aC5jDQorKysgYi9zcmMvYmx1ZXRvb3RoLmMNCkBAIC00NjIsNyArNDYyLDcgQEAg
c3RhdGljIGdib29sZWFuIGJ0X2FkYXB0ZXJfcHJvcGVydHlfY2hhbmdlZChEQnVzQ29ubmVjdGlv
biAqY29ubiwNCiAJCWRidXNfbWVzc2FnZV9pdGVyX2dldF9iYXNpYygmdmFyLCAmY2xhc3MpOw0K
IAkJYnRfZGVmX29vYl9kYXRhLmNsYXNzX29mX2RldmljZSA9IGNsYXNzOw0KIA0KLQkJREJHKCIl
czogJXgiLCBwcm9wZXJ0eSwgYnRfZGVmX29vYl9kYXRhLmNsYXNzX29mX2RldmljZSk7DQorCQlE
QkcoIiVzOiAleCIsIHByb3BlcnR5LCAodW5zaWduZWQgaW50KWJ0X2RlZl9vb2JfZGF0YS5jbGFz
c19vZl9kZXZpY2UpOw0KIAl9IGVsc2UgaWYgKGdfc3RyX2VxdWFsKHByb3BlcnR5LCAiUG93ZXJl
ZCIpKSB7DQogCQlkYnVzX2Jvb2xfdCBwb3dlcmVkOw0KIA0KQEAgLTQ3Miw3ICs0NzIsNyBAQCBz
dGF0aWMgZ2Jvb2xlYW4gYnRfYWRhcHRlcl9wcm9wZXJ0eV9jaGFuZ2VkKERCdXNDb25uZWN0aW9u
ICpjb25uLA0KIAkJZGJ1c19tZXNzYWdlX2l0ZXJfZ2V0X2Jhc2ljKCZ2YXIsICZwb3dlcmVkKTsN
CiAJCWJ0X2RlZl9vb2JfZGF0YS5wb3dlcmVkID0gcG93ZXJlZDsNCiANCi0JCURCRygiJXM6ICV1
IiwgcHJvcGVydHksIGJ0X2RlZl9vb2JfZGF0YS5wb3dlcmVkKTsNCisJCURCRygiJXM6ICVkIiwg
cHJvcGVydHksIGJ0X2RlZl9vb2JfZGF0YS5wb3dlcmVkKTsNCiAJfQ0KIA0KIAlyZXR1cm4gVFJV
RTsNCi0tIA0KMi4yNy4wDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1uZmMgbWFpbGluZyBsaXN0IC0tIGxpbnV4LW5mY0BsaXN0cy4wMS5vcmcK
VG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBsaW51eC1uZmMtbGVhdmVAbGlzdHMuMDEu
b3JnCiUod2ViX3BhZ2VfdXJsKXNsaXN0aW5mbyUoY2dpZXh0KXMvJShfaW50ZXJuYWxfbmFtZSlz
