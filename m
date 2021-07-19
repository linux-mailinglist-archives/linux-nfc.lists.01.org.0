Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1514E3CD320
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:20 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 9299B100EB33C;
	Mon, 19 Jul 2021 04:09:18 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 9D48F100F2268
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:16 -0700 (PDT)
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 6719940207
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692955;
	bh=I+37ILDHjWO/y9chcbCij8+gvqiDUOYZag+6dwyGiMo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NVyZ3uNLg/bV7B/tU9XM+2K0R6fs+mQ9rn/68Rck1rTPneVlSScHsAuEAHQMIW63H
	 rAVkPLqDAtvdRxx6ZmS5Rp3yS2YhhE+2mXAaGwokk5w/1Opq+Mx6lwS0npUukzRAlg
	 jniR9puK9HAd3PZ43S9V9UByQd/NFFRdEjkrKJhj9DZGPwCGbve7EgltXpsuRb+3da
	 ITpXTGaLsMhvaUvoXOasWN/qOfn5TjDaoW8l8YNn+HqRbLOQIx1wBdaVzlBIASIjA0
	 i9RKQhCNgGAHQC6UNf2PmJJAnVEQAZduWtISSJqLOJDc3MHKFvN162CZrr3T4W+yZP
	 0VfDKIL9tCSTw==
Received: by mail-lf1-f70.google.com with SMTP id s14-20020a056512214eb02903821c63a72aso3262130lfr.3
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I+37ILDHjWO/y9chcbCij8+gvqiDUOYZag+6dwyGiMo=;
        b=HhQT9qRYXpDAHUxwXMMAQClUlZ+ka6uADqf1DedJRsst9Kq5V8quqBWaBcgml+J8/o
         5/tStl0zyEH3Oj5az7JCZXxur7bo0Pnb5OXR/8oSaaX2HU6WAkwglyWbUoeNJnqEffSs
         zQhb8j+3leFdmSUVzueFlIh4Rbos35GlueXVLJrnUbD6Evc3eyUsCkLsXlh0lazIZKSw
         3zlN24wIPlGsXrV8+S7ghP3DEzn2Zn99Vd7BirB4SFqHUMLc+E0L+OlfEBHIBsmywzPK
         z9CEjdFt7+iio26blaoJYVjRcZmLVwlLz2fZo4bbaJL4Shixd+mZUbJntAdkv5Mm+wVA
         U1Rw==
X-Gm-Message-State: AOAM530NWZ2DNgXoQOUsJYanWPpM+r2kWRPxqLQQ3xygQ5tsD4oyajJw
	kekgT6PS+iM09RNZjxzecx/58RYiS/OSFR6zhBFqfC5HR7Gys4xQfATbGKqa4uDLu73VxurtGrM
	ynnv4KpfMJT+0IjR4a9Y0/v7wB8kYV0BQ+w==
X-Received: by 2002:ac2:41c5:: with SMTP id d5mr18055046lfi.56.1626692954679;
        Mon, 19 Jul 2021 04:09:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyt6NU2Xj8+kpQCG2u+2VRaAHQeLMjFh4n1JzscnFwgIRPprgySK37F/PxAU+6lJ64eOpoihw==
X-Received: by 2002:ac2:41c5:: with SMTP id d5mr18055035lfi.56.1626692954524;
        Mon, 19 Jul 2021 04:09:14 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:41 +0200
Message-Id: <20210719110819.27340-36-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 2SEMMZXPMQFTQX5FR3TIR4WCKVTPBTKR
X-Message-ID-Hash: 2SEMMZXPMQFTQX5FR3TIR4WCKVTPBTKR
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 35/73] manager: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/2SEMMZXPMQFTQX5FR3TIR4WCKVTPBTKR/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UHJvcGVybHkgcHJpbnQgc2lnbmVkIGFuZCB1bnNpZ25lZCBpbnRlZ2Vycy4gIFRoaXMgZml4ZXMg
d2FybmluZ3MgbGlrZToNCg0KICAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBzcmMvbmVhci5oOjM2
LA0KICAgICAgICAgICAgICAgICAgICAgZnJvbSBzcmMvbWFuYWdlci5jOjM0Og0KICAgIHNyYy9t
YW5hZ2VyLmM6IEluIGZ1bmN0aW9uIOKAmF9fbmVhcl9tYW5hZ2VyX2FkYXB0ZXJfYWRk4oCZOg0K
ICAgIC4vaW5jbHVkZS9uZWFyL2xvZy5oOjQ1OjE0OiBlcnJvcjogZm9ybWF0IOKAmCVk4oCZIGV4
cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDigJhpbnTigJksIGJ1dCBhcmd1bWVudCA0IGhhcyB0eXBl
IOKAmHVpbnQzMl904oCZIHtha2Eg4oCYdW5zaWduZWQgaW504oCZfSBbLVdlcnJvcj1mb3JtYXQ9
XQ0KICAgICAgIDQ1IHwgICBuZWFyX2RlYnVnKCIlczolcygpICIgZm10LCBcDQogICAgICAgICAg
fCAgICAgICAgICAgICAgXn5+fn5+fn5+fg0KICAgIHNyYy9tYW5hZ2VyLmM6NDU6Mjogbm90ZTog
aW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmERCR+KAmQ0KICAgICAgIDQ1IHwgIERCRygiaWR4ICVk
IiwgaWR4KTsNCiAgICAgICAgICB8ICBefn4NCg0KU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBjYW5vbmljYWwuY29tPg0KLS0tDQogc3JjL21h
bmFnZXIuYyB8IDQgKystLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9zcmMvbWFuYWdlci5jIGIvc3JjL21hbmFnZXIuYw0K
aW5kZXggZTRiNzJhNzNmY2JiLi43NTRjMjU0ZDg1YWQgMTAwNjQ0DQotLS0gYS9zcmMvbWFuYWdl
ci5jDQorKysgYi9zcmMvbWFuYWdlci5jDQpAQCAtNDIsNyArNDIsNyBAQCBpbnQgX19uZWFyX21h
bmFnZXJfYWRhcHRlcl9hZGQodWludDMyX3QgaWR4LCBjb25zdCBjaGFyICpuYW1lLA0KIAljb25z
dCBjaGFyICpwYXRoOw0KIAlpbnQgZXJyOw0KIA0KLQlEQkcoImlkeCAlZCIsIGlkeCk7DQorCURC
RygiaWR4ICV1IiwgaWR4KTsNCiANCiAJYWRhcHRlciA9IF9fbmVhcl9hZGFwdGVyX2NyZWF0ZShp
ZHgsIG5hbWUsIHByb3RvY29scywgcG93ZXJlZCk7DQogCWlmICghYWRhcHRlcikNCkBAIC02Niw3
ICs2Niw3IEBAIHZvaWQgX19uZWFyX21hbmFnZXJfYWRhcHRlcl9yZW1vdmUodWludDMyX3QgaWR4
KQ0KIAlzdHJ1Y3QgbmVhcl9hZGFwdGVyICphZGFwdGVyOw0KIAljb25zdCBjaGFyICpwYXRoOw0K
IA0KLQlEQkcoImlkeCAlZCIsIGlkeCk7DQorCURCRygiaWR4ICV1IiwgaWR4KTsNCiANCiAJYWRh
cHRlciA9IF9fbmVhcl9hZGFwdGVyX2dldChpZHgpOw0KIAlpZiAoIWFkYXB0ZXIpDQotLSANCjIu
MjcuMA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbmZjIG1haWxpbmcgbGlzdCAtLSBsaW51eC1uZmNAbGlzdHMuMDEub3JnClRvIHVuc3Vic2Ny
aWJlIHNlbmQgYW4gZW1haWwgdG8gbGludXgtbmZjLWxlYXZlQGxpc3RzLjAxLm9yZwolKHdlYl9w
YWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25hbWUpcw==
