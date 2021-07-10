Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4A63C325C
	for <lists+linux-nfc@lfdr.de>; Sat, 10 Jul 2021 05:39:22 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 99CAB100EB82B;
	Fri,  9 Jul 2021 20:39:19 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 7B9C8100EBB75
	for <linux-nfc@lists.01.org>; Fri,  9 Jul 2021 20:39:16 -0700 (PDT)
Received: from mail-wr1-f70.google.com ([209.85.221.70])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m23pj-0007TI-6d
	for linux-nfc@lists.01.org; Sat, 10 Jul 2021 03:39:15 +0000
Received: by mail-wr1-f70.google.com with SMTP id l21-20020a0560000235b029013564642c78so3713295wrz.9
        for <linux-nfc@lists.01.org>; Fri, 09 Jul 2021 20:39:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LTkJTxoee0uJYSMrTNalpOG3ll+7YM/0ywuLldo8CbI=;
        b=F6VyEuYGjYnN2tKvjEQspDGusAApd0R0wKRmsJVX70Ut3Ztg7ffhwwpXCpoIMKUnjV
         EALNrJ5RUgqnxk2qSMQ9pNpsopDFP4HbgYXI5E+Puu4n58uu9N77Xar3zB3Ru6L9H2MY
         bl6as2iVNLbngVUuKZd1NfkirqnuwPB0PpHP3h+CloFGA4Fj4iWqbkVdTl3vUfqqz0ju
         0dSSQewHW0iahosL0lU6eeiXbr9/P3uqPxsJhldR8yuDKRtu9Ihdcdmv2ruSNmSXtj3s
         xPngfnyVsmkSHHw4Al+RmxzXYKyBPT7A/lMLc0nEQhSd7ku3WlfKYxmMwHXWLpBDOpRV
         qJfg==
X-Gm-Message-State: AOAM533taMK1fqAPOZncriQOvhyWYQYzDgobLE64btyZ0AGbyjfPOXt1
	hmX1S6UmX6N+MYcoZkAfbjpBrtRqkocH4+mg1TmvWuMHOHOmILJMdf29vPojPI2wVQGvJNhRG2k
	oVePvoaEPOxinOcxFhqHrRD3rpTDKXZG9tA==
X-Received: by 2002:adf:f54e:: with SMTP id j14mr7511388wrp.91.1625888354816;
        Fri, 09 Jul 2021 20:39:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmwv8A4RU1xoHsxkpXpJ2rVTARAkaLZ5nXIhfdCla2sDLfSFmDIQLW/yzGRPDibFt4nnS5lg==
X-Received: by 2002:adf:f54e:: with SMTP id j14mr7511379wrp.91.1625888354689;
        Fri, 09 Jul 2021 20:39:14 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id a12sm7444346wrh.26.2021.07.09.20.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 20:39:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sat, 10 Jul 2021 05:38:45 +0200
Message-Id: <20210710033859.3989-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
References: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 4ODLIKSYKJXSHWACXN5FAYVFWRUHPFTI
X-Message-ID-Hash: 4ODLIKSYKJXSHWACXN5FAYVFWRUHPFTI
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 02/16] nfctool: fix nfctool_send_dep_link_up() cast-function-type
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/4ODLIKSYKJXSHWACXN5FAYVFWRUHPFTI/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Rml4IG9uIEdDQyB2MTA6DQoNCiAgICB0b29scy9uZmN0b29sL21haW4uYzogSW4gZnVuY3Rpb24g
4oCYbmZjdG9vbF90YXJnZXRzX2ZvdW5k4oCZOg0KICAgIHRvb2xzL25mY3Rvb2wvbWFpbi5jOjI5
NDo1OiBlcnJvcjogY2FzdCBiZXR3ZWVuIGluY29tcGF0aWJsZSBmdW5jdGlvbiB0eXBlcyBmcm9t
IOKAmHZvaWQgKCopKGd1aW50MzIsICBndWludDMyKeKAmSB7YWthIOKAmHZvaWQgKCopKHVuc2ln
bmVkIGludCwgIHVuc2lnbmVkIGludCnigJl9IHRvIOKAmHZvaWQgKCopKHZvaWQgKiwgdm9pZCAq
KeKAmSBbLVdlcnJvcj1jYXN0LWZ1bmN0aW9uLXR5cGVdDQogICAgICAyOTQgfCAgICAgKEdGdW5j
KW5mY3Rvb2xfc2VuZF9kZXBfbGlua191cCwNCiAgICAgICAgICB8ICAgICBeDQoNClNpZ25lZC1v
ZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2Fs
LmNvbT4NCi0tLQ0KIHRvb2xzL25mY3Rvb2wvbWFpbi5jIHwgNCArKy0tDQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL3Rvb2xz
L25mY3Rvb2wvbWFpbi5jIGIvdG9vbHMvbmZjdG9vbC9tYWluLmMNCmluZGV4IGM0OGJmMDkxOTY1
Ny4uMjgyZGY1MTlmY2M4IDEwMDY0NA0KLS0tIGEvdG9vbHMvbmZjdG9vbC9tYWluLmMNCisrKyBi
L3Rvb2xzL25mY3Rvb2wvbWFpbi5jDQpAQCAtMjU5LDkgKzI1OSw5IEBAIHN0YXRpYyBpbnQgbmZj
dG9vbF9zbmwodm9pZCkNCiAJcmV0dXJuIG5mY3Rvb2xfc25sX3NlbmRfcmVxdWVzdChhZGFwdGVy
KTsNCiB9DQogDQotc3RhdGljIHZvaWQgbmZjdG9vbF9zZW5kX2RlcF9saW5rX3VwKGd1aW50MzIg
dGFyZ2V0X2lkeCwgZ3VpbnQzMiBhZGFwdGVyX2lkeCkNCitzdGF0aWMgdm9pZCBuZmN0b29sX3Nl
bmRfZGVwX2xpbmtfdXAoZ3BvaW50ZXIgdGFyZ2V0X2lkeCwgZ3BvaW50ZXIgYWRhcHRlcl9pZHgp
DQogew0KLQlubF9zZW5kX2RlcF9saW5rX3VwKGFkYXB0ZXJfaWR4LCB0YXJnZXRfaWR4KTsNCisJ
bmxfc2VuZF9kZXBfbGlua191cChHUE9JTlRFUl9UT19JTlQoYWRhcHRlcl9pZHgpLCBHUE9JTlRF
Ul9UT19JTlQodGFyZ2V0X2lkeCkpOw0KIH0NCiANCiBzdGF0aWMgaW50IG5mY3Rvb2xfdGFyZ2V0
c19mb3VuZChndWludDMyIGFkYXB0ZXJfaWR4KQ0KLS0gDQoyLjI3LjANCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW5mYyBtYWlsaW5nIGxpc3Qg
LS0gbGludXgtbmZjQGxpc3RzLjAxLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRv
IGxpbnV4LW5mYy1sZWF2ZUBsaXN0cy4wMS5vcmcKJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShj
Z2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM=
