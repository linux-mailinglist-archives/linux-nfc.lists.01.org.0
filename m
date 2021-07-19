Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F02F73CD303
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:08:47 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4B3BF100EB858;
	Mon, 19 Jul 2021 04:08:44 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 93EB4100EB823
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:42 -0700 (PDT)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 808E140624
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692921;
	bh=LTkJTxoee0uJYSMrTNalpOG3ll+7YM/0ywuLldo8CbI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=PX3mWFSLhNkzNydPNZkd74RqUr8TpbQLHdYPilwjJ+ol2Kl54Xi7lAPvixUwvGH0P
	 DrEZ9uaW9nrR0jSN+4LkU/BLQXTz3iu3txusL2OQMHjQfAWmJ8A5fVl/CQHZtQSYdY
	 UMhmsa/Z8FTUKbPGsCmylL+vCYXErnQ38ZcoHkTV6PMqCDN50p7TGRscAE5w4CBTZs
	 A08vF+k/qrGYZHR8CvBSIpMWjteSgIgy4efOSWJRFQnQ5w4Ap/x6Q7dyUyHCHn5UCZ
	 ON5+cX4MZooHQLfBUJfDVugMbmyAxGoflo42ZxGjozQCaMGLQPn4quAgFTKtNcgVdh
	 JYhGtDVO0ApLw==
Received: by mail-lj1-f199.google.com with SMTP id b43-20020a05651c0b2bb0290199022fba24so541493ljr.13
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LTkJTxoee0uJYSMrTNalpOG3ll+7YM/0ywuLldo8CbI=;
        b=mFJy9SnsYfT+26p5X2eXf9p6D3tfe+cT7psX6caMp1r80zDvWsKooQ5+KalRlXcxjD
         sHj1KZ/QiHxqVEOAfAdDx7/I9Ozjh6EROny0HxFt8TlLRrc2T4oIdgVUlJQbHFoF+ZCQ
         AmIbrFCKbLDbPELEdFeYkzAYxJtpjmIb9YQdyhgXY4WH7blr0LyOb+P4RRaS5EUVpqxj
         /bChqwBjh8nt927SAdR74rpb77xaOqrJnsC5ndamv2BCFlWF6283oD6GIJBN5Hey5EkG
         vgCEQs1p0PnvWSO+nCe7sHyd34ahdvADlgjLtFcuXKl0DiTUzqAEH+0kM2BSAVPNjkaU
         gfvA==
X-Gm-Message-State: AOAM5306Z1eaEgSbyItWKfdGxc4hJ073FBBdr8pr7h9A6A4fFjVU2Hzp
	FwC5Q88j4AsOThxqUNfxuaDFdKEh1zbPiWPyDQHQtWqmw9wHQAm6LeltE0UQb+XT524e6b8Mo6Q
	rpBFbDOnpdWIY8bvlBGOjqa8ih0fS0qLbKQ==
X-Received: by 2002:a2e:9e8e:: with SMTP id f14mr21766485ljk.468.1626692920790;
        Mon, 19 Jul 2021 04:08:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznmSfQ8asRuLGSO5DwY3E8bygeiHAIABmfRZVWGQ174doCMd70soTFOIWql2fR/3PV2rZ4lw==
X-Received: by 2002:a2e:9e8e:: with SMTP id f14mr21766476ljk.468.1626692920655;
        Mon, 19 Jul 2021 04:08:40 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:08:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:12 +0200
Message-Id: <20210719110819.27340-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: Q5WQNSJEX4E5XNGMQ2RA46OX7APANF3J
X-Message-ID-Hash: Q5WQNSJEX4E5XNGMQ2RA46OX7APANF3J
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 06/73] nfctool: fix nfctool_send_dep_link_up() cast-function-type
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/Q5WQNSJEX4E5XNGMQ2RA46OX7APANF3J/>
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
