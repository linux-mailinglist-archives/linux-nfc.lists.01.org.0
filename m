Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A333CD30C
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:08:58 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 0AE0F100EB846;
	Mon, 19 Jul 2021 04:08:55 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 35C1B100EBB94
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:53 -0700 (PDT)
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 36DB540334
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692932;
	bh=VmTeVFRASPlMd6LHZSa5cNUkOSWfcul8L6gIUxzNRyU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=rtAGvbcHpJGQyGbsai1Z4xIOOgsBtrvPQwqIcmMYecxOcnASm1pCDrQG+mW74jdPj
	 d1vLP06jLGrRTnsUNpCacATcnuLMccrpHVtU9TfXq2p3PqM71u46FmNtll2clLcVvQ
	 ejNoFbEJhlI6+inP3c0a64wAUN8zNZtJLQV5Ujt4hakBPiCMibT9YBbA1bhDHseKfk
	 Vrzj3yiTvjGqNM7w9cGYNhoWEJdNqqWqGQXmrsCd2GckKYUxJ4SDT3Y+pgrahkaEUF
	 qFzB+1vhSYuSlr37Q/+4tO7QL7FJ5eDhEvtJZuzSkQzovNTd7fQJXkxykFWLUc0A2+
	 r/P9nS4LfRhWQ==
Received: by mail-lf1-f72.google.com with SMTP id 12-20020ac2568c0000b02903788300276eso3253342lfr.19
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VmTeVFRASPlMd6LHZSa5cNUkOSWfcul8L6gIUxzNRyU=;
        b=NHiS9HSWO6uWLWPmEUPLhrKvLVu2Q8lxcKZoKB2WwOCyPYsDAkSivmlYTPxaYUNI21
         todeeyrOcMrNmHmdTq8bZKebDxtLH/jkkKhITQAox+pd8afyelsqrw6Gi1O0npmR2ESe
         SqgRbknqxnhol68cl3i9rN33kQ46W9Cl33d3pQLFYhROKHj8JMYXxtxTqEOMJ6iTYtqD
         Ge4eC4o8m1VQZET08PsaCdHukTCpnSZZXemMyZ2x7w/FJk66mG9H+kXJQXYepVdV6QOw
         sY2yqumFYRH0AcjNcaw9Yei7POJ/CzhqbXIXu+00wyue8KhLxTq+Vxxyl3mYNNuMaZgk
         weLA==
X-Gm-Message-State: AOAM5328lnLFT1BGmthpCrs6rUQc2iATaNlozYOPMI7I+4nzOCHl0ZCu
	o1aeWqrp7VHHPFU34uRC/ppulEFuS6AhxvT2cSq4mJKsctwqGj/PLYKZMjV663LG0m2Ua02e80y
	q2CKwT38III4Lsv7DzXP++iNw6Tv7JJBPnQ==
X-Received: by 2002:ac2:5e7a:: with SMTP id a26mr17892835lfr.446.1626692931472;
        Mon, 19 Jul 2021 04:08:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsYiGnHrgnyascLG3Xn+p5EpOQAjdIeL6Lslu2zY9lm3EfKJGfCNsgd6atPDS9/qJFk2hCkA==
X-Received: by 2002:ac2:5e7a:: with SMTP id a26mr17892830lfr.446.1626692931319;
        Mon, 19 Jul 2021 04:08:51 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:08:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:21 +0200
Message-Id: <20210719110819.27340-16-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: S7GBLAJQERH6OLIBBHXI7YEWCPV3ROGI
X-Message-ID-Hash: S7GBLAJQERH6OLIBBHXI7YEWCPV3ROGI
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 15/73] ndef: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/S7GBLAJQERH6OLIBBHXI7YEWCPV3ROGI/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UHJvcGVybHkgcHJpbnQgc2lnbmVkIGFuZCB1bnNpZ25lZCBpbnRlZ2Vycy4gIFRoaXMgZml4ZXMg
d2FybmluZ3MgbGlrZToNCg0KICAgIC4vaW5jbHVkZS9uZWFyL2xvZy5oOjQ1OjE0OiBlcnJvcjog
Zm9ybWF0IOKAmCVk4oCZIGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDigJhpbnTigJksIGJ1dCBh
cmd1bWVudCA0IGhhcyB0eXBlIOKAmHVpbnQzMl904oCZIHtha2Eg4oCYdW5zaWduZWQgaW504oCZ
fSBbLVdlcnJvcj1mb3JtYXQ9XQ0KICAgICAgIDQ1IHwgICBuZWFyX2RlYnVnKCIlczolcygpICIg
Zm10LCBcDQogICAgICAgICAgfCAgICAgICAgICAgICAgXn5+fn5+fn5+fg0KICAgIHNyYy9uZGVm
LmM6MTA4NDoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYREJH4oCZDQogICAgIDEw
ODQgfCAgREJHKCJwYXlsb2FkIGxlbmd0aCAlZCIsIHJlY19oZWFkZXItPnBheWxvYWRfbGVuKTsN
CiAgICAgICAgICB8ICBefn4NCg0KU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6eXN6dG9mLmtvemxvd3NraUBjYW5vbmljYWwuY29tPg0KLS0tDQogc3JjL25kZWYuYyB8IDEy
ICsrKysrKy0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pDQoNCmRpZmYgLS1naXQgYS9zcmMvbmRlZi5jIGIvc3JjL25kZWYuYw0KaW5kZXggOTI4
ZTZhMTBhOTk5Li43OTA2NTVhMjc5YmEgMTAwNjQ0DQotLS0gYS9zcmMvbmRlZi5jDQorKysgYi9z
cmMvbmRlZi5jDQpAQCAtNTAzLDggKzUwMyw4IEBAIHN0YXRpYyBnYm9vbGVhbiBwcm9wZXJ0eV9n
ZXRfdXJpKGNvbnN0IEdEQnVzUHJvcGVydHlUYWJsZSAqcHJvcGVydHksDQogDQogCURCRygiVVJJ
IHByZWZpeCAlcyIsIHByZWZpeCk7DQogDQotCXZhbHVlID0gZ19zdHJkdXBfcHJpbnRmKCIlcyUu
KnMiLCBwcmVmaXgsIHVyaS0+ZmllbGRfbGVuZ3RoLA0KLQkJCQkJCQkgdXJpLT5maWVsZCk7DQor
CXZhbHVlID0gZ19zdHJkdXBfcHJpbnRmKCIlcyUuKnMiLCBwcmVmaXgsIChpbnQpdXJpLT5maWVs
ZF9sZW5ndGgsDQorCQkJCXVyaS0+ZmllbGQpOw0KIA0KIAlkYnVzX21lc3NhZ2VfaXRlcl9hcHBl
bmRfYmFzaWMoaXRlciwgREJVU19UWVBFX1NUUklORywgJnZhbHVlKTsNCiANCkBAIC01ODUsNyAr
NTg1LDcgQEAgc3RhdGljIGdib29sZWFuIHByb3BlcnR5X2dldF9zaXplKGNvbnN0IEdEQnVzUHJv
cGVydHlUYWJsZSAqcHJvcGVydHksDQogew0KIAlzdHJ1Y3QgbmVhcl9uZGVmX3JlY29yZCAqcmVj
b3JkID0gdXNlcl9kYXRhOw0KIA0KLQlEQkcoIiVkIiwgcmVjb3JkLT5zcC0+c2l6ZSk7DQorCURC
RygiJXUiLCByZWNvcmQtPnNwLT5zaXplKTsNCiANCiAJZGJ1c19tZXNzYWdlX2l0ZXJfYXBwZW5k
X2Jhc2ljKGl0ZXIsIERCVVNfVFlQRV9VSU5UMzIsICZyZWNvcmQtPnNwLT5zaXplKTsNCiANCkBA
IC0xMDQyLDcgKzEwNDIsNyBAQCBzdGF0aWMgc3RydWN0IG5lYXJfbmRlZl9yZWNvcmRfaGVhZGVy
ICpwYXJzZV9yZWNvcmRfaGVhZGVyKHVpbnQ4X3QgKnJlYywNCiAJdWludDhfdCAqdHlwZSA9IE5V
TEw7DQogCXVpbnQzMl90IGhlYWRlcl9sZW4gPSAwOw0KIA0KLQlEQkcoImxlbmd0aCAlZCIsIGxl
bmd0aCk7DQorCURCRygibGVuZ3RoICV1IiwgbGVuZ3RoKTsNCiANCiAJaWYgKCFyZWMgfHwgb2Zm
c2V0ID49IGxlbmd0aCkNCiAJCXJldHVybiBOVUxMOw0KQEAgLTEwODEsNyArMTA4MSw3IEBAIHN0
YXRpYyBzdHJ1Y3QgbmVhcl9uZGVmX3JlY29yZF9oZWFkZXIgKnBhcnNlX3JlY29yZF9oZWFkZXIo
dWludDhfdCAqcmVjLA0KIAkJCWdvdG8gZmFpbDsNCiAJfQ0KIA0KLQlEQkcoInBheWxvYWQgbGVu
Z3RoICVkIiwgcmVjX2hlYWRlci0+cGF5bG9hZF9sZW4pOw0KKwlEQkcoInBheWxvYWQgbGVuZ3Ro
ICV1IiwgcmVjX2hlYWRlci0+cGF5bG9hZF9sZW4pOw0KIA0KIAlpZiAocmVjX2hlYWRlci0+aWwg
PT0gMSkgew0KIAkJcmVjX2hlYWRlci0+aWxfbGVuZ3RoID0gcmVjW29mZnNldCsrXTsNCkBAIC0x
Mjc0LDcgKzEyNzQsNyBAQCBwYXJzZV91cmlfcGF5bG9hZCh1aW50OF90ICpwYXlsb2FkLCB1aW50
MzJfdCBsZW5ndGgpDQogCX0NCiANCiAJREJHKCJJZGVudGlmaWVyICAnMFglWCciLCB1cmlfcGF5
bG9hZC0+aWRlbnRpZmllcik7DQotCURCRygiRmllbGQgICclLipzJyIsIHVyaV9wYXlsb2FkLT5m
aWVsZF9sZW5ndGgsIHVyaV9wYXlsb2FkLT5maWVsZCk7DQorCURCRygiRmllbGQgICclLipzJyIs
IChpbnQpdXJpX3BheWxvYWQtPmZpZWxkX2xlbmd0aCwgdXJpX3BheWxvYWQtPmZpZWxkKTsNCiAN
CiAJcmV0dXJuIHVyaV9wYXlsb2FkOw0KIA0KLS0gDQoyLjI3LjANCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW5mYyBtYWlsaW5nIGxpc3QgLS0g
bGludXgtbmZjQGxpc3RzLjAxLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGxp
bnV4LW5mYy1sZWF2ZUBsaXN0cy4wMS5vcmcKJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2ll
eHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM=
