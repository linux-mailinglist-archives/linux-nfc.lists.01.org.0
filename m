Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E4C3CD32C
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:33 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 5D72C100EB34A;
	Mon, 19 Jul 2021 04:09:32 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 6BA89100F2270
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:28 -0700 (PDT)
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 6BD2C4060A
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692967;
	bh=sM2KcXrE4c/gXzXsFnlSNZ+mlo21MbMlQfMLrRSiE/I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Cgxe4H4jvCK+4pKG+KiH9QoRtnrlx4piqPKmCqb0xg76HMJo3qL5SmXddCaWsoj2+
	 uny0E1Y9NsSs9VfEPicv3WgDbfzEDTborVxQvRKZ/z8mF5O1Qp8WyzUweq5L4j2eRu
	 QnnKwWVgasQ6WqbjoSiMi3xZ9ze6LzMd9MX+Ey90pCoOl7zwSgKMp6FJhRbiVZoRjz
	 2dTgZ8PMrCpcNXpmv7cmJgNG0hF3yysGZu4cPleCegZUGOD4wr9XclMSDAAfAam226
	 3NeCKL1Ekwtmrgh0YGiyKqV+dZJ28mF9CFLynAeNzHe3BENmGGWPsTuAGEarFzZo1m
	 jq0CY70txeT1w==
Received: by mail-lf1-f70.google.com with SMTP id a19-20020a195f530000b0290387ad3bb6e0so3244643lfj.10
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sM2KcXrE4c/gXzXsFnlSNZ+mlo21MbMlQfMLrRSiE/I=;
        b=ey3SW02nQEVWzWT+jn2Rbj4MAMkH9tMuuQ67fJSUwN4+NTE4LT7QEnfLI9OgVbE3/6
         csiaMXDVrN8+XwEoylEyNyx7IDg4YuJxz/2imrqtCcEbdpxbFtzkXCOrMUT7yyRKMi+5
         4TTgQL3AEOj+Y6Mx1ARUfxffJmPUdPgKmRkaPoxZhhxdzhV6dBUnCx3Vug/v6lFmlGDJ
         swkpast0GEIxvUkC3ewJDvWPHghlqw5YMwzYcnncClIeWxLFgvV+sVEwXSbTUoS4ppmd
         ud8QMqvgg1cPRI+E2CSWP4OwhNIEaGBTtSDGAUL2YlaJ/v8hqm5449NO26jHZGAjn7ay
         gjmw==
X-Gm-Message-State: AOAM532RiJWYOashUEXgCy1pdnanPv0OF5dXCcRfEvk5sbKGO+AV/yb7
	i17lA94ftjh7ziKy7xIHKdP2DdD85wWOjcAjG69c964L083cPbZAE7CPWmHEtt+Wv+XLwah3s+8
	Xpx8KCAcBSyhHe5Y9aaVn4vgVPSKLAIIBSQ==
X-Received: by 2002:a19:5e02:: with SMTP id s2mr17894271lfb.265.1626692966665;
        Mon, 19 Jul 2021 04:09:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtQgo2EOMiBsQNAmujQh+U0zK/jzbtwvBA7rVRw7DdknL4QYBYLVaw5qZ9bt3ac1jf6hj7kw==
X-Received: by 2002:a19:5e02:: with SMTP id s2mr17894262lfb.265.1626692966495;
        Mon, 19 Jul 2021 04:09:26 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:51 +0200
Message-Id: <20210719110819.27340-46-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 2D5KJQQJWQAAWLMD7XV5GYKXH2KWOCI3
X-Message-ID-Hash: 2D5KJQQJWQAAWLMD7XV5GYKXH2KWOCI3
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 45/73] unit: use g_assert_cmpstr()
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/2D5KJQQJWQAAWLMD7XV5GYKXH2KWOCI3/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q29tcGFyaXNvbnMgb2Ygc2ltcGxlIHZhbHVlcyBzaG91bGQgdXNlIHRlc3QgbWFjcm9zIGluc3Rl
YWQgb2YgY2hlY2tpbmcNCnN0YW5kYXJkIGxpYnJhcnkgY2FsbCByZXR1cm4gdmFsdWUuICBUaGlz
IHByaW50cyBtb3JlIGluZm9ybWF0aW9uOg0KDQpnX2Fzc2VydCgpOg0KICAgIEVSUk9SOnVuaXQv
dGVzdC1uZGVmLXBhcnNlLmM6MjU2OnRlc3RfbmRlZl90ZXh0X2VuY29kaW5nOiBhc3NlcnRpb24g
ZmFpbGVkOiAoc3RyY21wKHJlY29yZC0+dGV4dC0+bGFuZ3VhZ2VfY29kZSwgImVuLVVTMSIpID09
IDApDQoNCmdfYXNzZXJ0X2NtcHN0cigpOg0KICAgIEVSUk9SOnVuaXQvdGVzdC1uZGVmLXBhcnNl
LmM6MjU2OnRlc3RfbmRlZl90ZXh0X2VuY29kaW5nOiBhc3NlcnRpb24gZmFpbGVkIChyZWNvcmQt
PnRleHQtPmxhbmd1YWdlX2NvZGUgPT0gImVuLVVTMSIpOiAoImVuLVVTIiA9PSAiZW4tVVMxIikN
Cg0KU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3Nr
aUBjYW5vbmljYWwuY29tPg0KLS0tDQogdW5pdC90ZXN0LW5kZWYtcGFyc2UuYyB8IDE2ICsrKysr
KysrLS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9u
cygtKQ0KDQpkaWZmIC0tZ2l0IGEvdW5pdC90ZXN0LW5kZWYtcGFyc2UuYyBiL3VuaXQvdGVzdC1u
ZGVmLXBhcnNlLmMNCmluZGV4IDZjNjJjN2E5MjhjNy4uOTFkYzFmN2MxODVlIDEwMDY0NA0KLS0t
IGEvdW5pdC90ZXN0LW5kZWYtcGFyc2UuYw0KKysrIGIvdW5pdC90ZXN0LW5kZWYtcGFyc2UuYw0K
QEAgLTI0NCw5ICsyNDQsOSBAQCBzdGF0aWMgdm9pZCB0ZXN0X25kZWZfdGV4dCh2b2lkKQ0KIAln
X2Fzc2VydChyZWNvcmQtPmhlYWRlci0+bWUgPT0gMSk7DQogDQogCWdfYXNzZXJ0KHJlY29yZC0+
dGV4dCk7DQotCWdfYXNzZXJ0KHN0cmNtcChyZWNvcmQtPnRleHQtPmRhdGEsICJoZWxsbyDFvMOz
xYJ3IikgPT0gMCk7DQotCWdfYXNzZXJ0KHN0cmNtcChyZWNvcmQtPnRleHQtPmVuY29kaW5nLCAi
VVRGLTgiKSA9PSAwKTsNCi0JZ19hc3NlcnQoc3RyY21wKHJlY29yZC0+dGV4dC0+bGFuZ3VhZ2Vf
Y29kZSwgImVuLVVTIikgPT0gMCk7DQorCWdfYXNzZXJ0X2NtcHN0cihyZWNvcmQtPnRleHQtPmRh
dGEsID09LCAiaGVsbG8gxbzDs8WCdyIpOw0KKwlnX2Fzc2VydF9jbXBzdHIocmVjb3JkLT50ZXh0
LT5lbmNvZGluZyw9PSwgICJVVEYtOCIpOw0KKwlnX2Fzc2VydF9jbXBzdHIocmVjb3JkLT50ZXh0
LT5sYW5ndWFnZV9jb2RlLCA9PSwgImVuLVVTIik7DQogDQogCWlmIChnX3Rlc3RfdmVyYm9zZSgp
KSB7DQogCQlnX3ByaW50KCJOREVGIFRleHQgZGF0YTogJXNcbiIsIHJlY29yZC0+dGV4dC0+ZGF0
YSk7DQpAQCAtMzQ5LDkgKzM0OSw5IEBAIHN0YXRpYyB2b2lkIHRlc3RfbmRlZl90aXRsZV9zcCh2
b2lkKQ0KIAkJZ19wcmludCgiTkRFRiBTUCBVUkkgZmllbGQ6ICUuKnNcbiIsIHVyaS0+ZmllbGRf
bGVuZ3RoLA0KIAkJCQkJCQkoY2hhciAqKSB1cmktPmZpZWxkKTsNCiANCi0JZ19hc3NlcnQoc3Ry
Y21wKHRleHQtPmRhdGEsICJJbnRlbCIpID09IDApOw0KLQlnX2Fzc2VydChzdHJjbXAodGV4dC0+
ZW5jb2RpbmcsICJVVEYtOCIpID09IDApOw0KLQlnX2Fzc2VydChzdHJjbXAodGV4dC0+bGFuZ3Vh
Z2VfY29kZSwgImVuIikgPT0gMCk7DQorCWdfYXNzZXJ0X2NtcHN0cih0ZXh0LT5kYXRhLCA9PSwg
IkludGVsIik7DQorCWdfYXNzZXJ0X2NtcHN0cih0ZXh0LT5lbmNvZGluZywgPT0sICJVVEYtOCIp
Ow0KKwlnX2Fzc2VydF9jbXBzdHIodGV4dC0+bGFuZ3VhZ2VfY29kZSwgPT0sICJlbiIpOw0KIA0K
IAlpZiAoZ190ZXN0X3ZlcmJvc2UoKSkgew0KIAkJZ19wcmludCgiTkRFRiBTUCBUaXRsZSBkYXRh
OiAlc1xuIiwgdGV4dC0+ZGF0YSk7DQpAQCAtMzg5LDcgKzM4OSw3IEBAIHN0YXRpYyB2b2lkIHRl
c3RfbmRlZl9hYXIodm9pZCkNCiANCiAJZ19hc3NlcnQocmVjb3JkLT5hYXIpOw0KIAlnX2Fzc2Vy
dChyZWNvcmQtPmFhci0+cGFja2FnZSk7DQotCWdfYXNzZXJ0KHN0cmNtcCgoY2hhciAqKSByZWNv
cmQtPmFhci0+cGFja2FnZSwgImNvbS5leGFtcGxlLmFhciIpID09IDApOw0KKwlnX2Fzc2VydF9j
bXBzdHIoKGNoYXIgKikgcmVjb3JkLT5hYXItPnBhY2thZ2UsID09LCAiY29tLmV4YW1wbGUuYWFy
Iik7DQogDQogDQogCWlmIChnX3Rlc3RfdmVyYm9zZSgpKQ0KQEAgLTQzMSw3ICs0MzEsNyBAQCBz
dGF0aWMgdm9pZCB0ZXN0X25kZWZfaG9faHNfYnQodm9pZCkNCiANCiAJcmVjb3JkcyA9IGdfbGlz
dF9uZXh0KHJlY29yZHMpOw0KIAlyZWNvcmQgPSByZWNvcmRzLT5kYXRhOw0KLQlnX2Fzc2VydChz
dHJjbXAocmVjb3JkLT50eXBlLCBCVF9NSU1FX1NUUklOR18yXzEpID09IDApOw0KKwlnX2Fzc2Vy
dF9jbXBzdHIocmVjb3JkLT50eXBlLCA9PSwgQlRfTUlNRV9TVFJJTkdfMl8xKTsNCiB9DQogDQog
aW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQ0KLS0gDQoyLjI3LjANCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW5mYyBtYWlsaW5nIGxp
c3QgLS0gbGludXgtbmZjQGxpc3RzLjAxLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWls
IHRvIGxpbnV4LW5mYy1sZWF2ZUBsaXN0cy4wMS5vcmcKJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZv
JShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM=
