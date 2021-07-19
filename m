Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 131D13CD315
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:08 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id C7CA1100EB334;
	Mon, 19 Jul 2021 04:09:05 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id CCBA3100EB84D
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:03 -0700 (PDT)
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id DE9BC40334
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692942;
	bh=QlVeWLCP37wjQtVWx2Wm/uN/23/DcIwbOYGyujY/11Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ebbGfHO+5QJHalX2iSsHTq7Qm/StR+W8G+d2veWUuA94bX03l6jcznuUFAqH62lqr
	 Eyfdb/9RRemxt7w+Ftu1Sb4UJEyOQesCkAsf8t+TVTwQcvEbEGSUvwumLeXpqKPPqg
	 K+9sbMdCY5/i8yvezqzFw5dUBMaCMJitN6Gi3c6AGns2rLyX2UKTQLFGQe29Wm7l7H
	 nw2TlFdPKLLkseSdewADEdgmpDqRyuZFQu93rtL7LQ79eLaYJ1jyatuowX4E6i57y+
	 n/L6CUyu4zLLwDSmg+CoXW5Y3pBd7dDwRrkhN5eiafDQvV60TdSrlFRIhJRqPO6i1d
	 Adef0e9P9XJwA==
Received: by mail-lf1-f70.google.com with SMTP id n10-20020a196f4a0000b0290379403f4d35so3265626lfk.12
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QlVeWLCP37wjQtVWx2Wm/uN/23/DcIwbOYGyujY/11Q=;
        b=La425kIxhjT1I13LQRK4mU+AftHmDYKbkn78zPw1QSxBKOIC4GG0yg8VMk1/3+wdRy
         oOSrtDKuHqUKLutDrYyF3Nn5Md4e1jfD7XIMYPiK/p2bmi7Zn1IcvtYewg47qweNQdZA
         flzFwh0i1Q+WjLuUhrOFTUEswLRaUFWpV3B56CIqOD0ybpSn43F5TM96m+I8OeMr5B9m
         mk1S7ko2Kfp8ya1onGKFlQCWCxhncViSoRr4M+evRex/GejJv5Wyd8PO+/FKL3O2mZ1f
         Wt0IFaAjjak3a38na2z7U2PMbnT8VDRksGTmoLC14Z1eSXIq8ZlW0SRjbh+2b3iYIcsC
         X05A==
X-Gm-Message-State: AOAM530mSFiP2BbCHNskJ/OO82+4d4TjUNbeb5N3UgOJEQZRg63PRw2Y
	s/lCNeVbIwJ9RNCl/R79QIow0TO1oIwcp3I9ASpQhEP2QzUjrlfACqAIAkQF7cnEgwEOJAMRLyO
	u8hQlFSBRvDLG+3uDFcnd7DyCp8dg4MNkrQ==
X-Received: by 2002:a2e:9653:: with SMTP id z19mr21633337ljh.386.1626692942137;
        Mon, 19 Jul 2021 04:09:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPsrR4GLlbD0FomwTpy0QPZjycKsvEKc7BTLEeOlkCftLX159Hy3jxL8hgwe7VcPQOB5fA/g==
X-Received: by 2002:a2e:9653:: with SMTP id z19mr21633329ljh.386.1626692941939;
        Mon, 19 Jul 2021 04:09:01 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:30 +0200
Message-Id: <20210719110819.27340-25-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 2LJFEPSD3FU6PNFR7IACVYLC77GYXDY6
X-Message-ID-Hash: 2LJFEPSD3FU6PNFR7IACVYLC77GYXDY6
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 24/73] nciattach: do not shadow other local 'opt' variable (-Wshadow)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/2LJFEPSD3FU6PNFR7IACVYLC77GYXDY6/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Rml4IC1Xc2hhZG93IHdhcm5pbmc6DQoNCiAgICB0b29scy9uY2lhdHRhY2guYzogSW4gZnVuY3Rp
b24g4oCYbWFpbuKAmToNCiAgICB0b29scy9uY2lhdHRhY2guYzoyNzI6OTogZXJyb3I6IGRlY2xh
cmF0aW9uIG9mIOKAmG9wdOKAmSBzaGFkb3dzIGEgcHJldmlvdXMgbG9jYWwgWy1XZXJyb3I9c2hh
ZG93XQ0KICAgICAgMjcyIHwgICBjaGFyICpvcHQ7DQogICAgICAgICAgfCAgICAgICAgIF5+fg0K
ICAgIHRvb2xzL25jaWF0dGFjaC5jOjIzNjoyNDogbm90ZTogc2hhZG93ZWQgZGVjbGFyYXRpb24g
aXMgaGVyZQ0KICAgICAgMjM2IHwgIGludCBkZXRhY2gsIHByaW50cGlkLCBvcHQsIGksIG4sIGxk
LCBlcnI7DQogICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgIF5+fg0KDQpTaWduZWQt
b2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGNhbm9uaWNh
bC5jb20+DQotLS0NCiB0b29scy9uY2lhdHRhY2guYyB8IDggKysrKy0tLS0NCiAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvdG9v
bHMvbmNpYXR0YWNoLmMgYi90b29scy9uY2lhdHRhY2guYw0KaW5kZXggNTc0YzBmYmU3ODRhLi40
YWMzN2Q4MmQ1NDUgMTAwNjQ0DQotLS0gYS90b29scy9uY2lhdHRhY2guYw0KKysrIGIvdG9vbHMv
bmNpYXR0YWNoLmMNCkBAIC0yNjksMTYgKzI2OSwxNiBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hh
ciAqYXJndltdKQ0KIAl9DQogDQogCWZvciAobiA9IDA7IG9wdGluZCA8IGFyZ2M7IG4rKywgb3B0
aW5kKyspIHsNCi0JCWNoYXIgKm9wdDsNCisJCWNoYXIgKm9wdGlvbjsNCiANCi0JCW9wdCA9IGFy
Z3Zbb3B0aW5kXTsNCisJCW9wdGlvbiA9IGFyZ3Zbb3B0aW5kXTsNCiANCiAJCXN3aXRjaChuKSB7
DQogCQljYXNlIDA6DQogCQkJZGV2WzBdID0gMDsNCi0JCQlpZiAoIXN0cmNocihvcHQsICcvJykp
DQorCQkJaWYgKCFzdHJjaHIob3B0aW9uLCAnLycpKQ0KIAkJCQlzdHJjcHkoZGV2LCAiL2Rldi8i
KTsNCi0JCQlzdHJjYXQoZGV2LCBvcHQpOw0KKwkJCXN0cmNhdChkZXYsIG9wdGlvbik7DQogCQkJ
YnJlYWs7DQogDQogCQljYXNlIDE6DQotLSANCjIuMjcuMA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbmZjIG1haWxpbmcgbGlzdCAtLSBsaW51
eC1uZmNAbGlzdHMuMDEub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gbGludXgt
bmZjLWxlYXZlQGxpc3RzLjAxLm9yZwolKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClz
LyUoX2ludGVybmFsX25hbWUpcw==
