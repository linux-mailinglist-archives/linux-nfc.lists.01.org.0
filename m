Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA433CD312
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:04 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 90929100EB333;
	Mon, 19 Jul 2021 04:09:01 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 25BE8100EB855
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:00 -0700 (PDT)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 3702840207
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692939;
	bh=iLo9oriWyOfHBsBsEoYg4hKQ8IGGXYdXKD17uVrYIIw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=LzlSWRgPF9o/MEu/ynUq4xfDCrU1zKaQrMsIe6LaCF9RKewXDo4cASO5iR9UwsQEU
	 LGsTyP0Dcf5s15Kyc2w9VkfPD9k+XsIN+sRz0OzJBtOeog01AcJ9U9DmpOYAUvJGnk
	 gY44hx31gr9erjnTK0wJS9cRjhsjpOyq7p0dF6FTiqVICd+DX147pVLFH7bUP90BsN
	 +GZcNCRrN5ZGtvlJV5+XGmhF614JTsZYaOIzQwgL3cLq7JjLw2nrk1oCM61A3DwJxN
	 pVgS0UpjC+xr9OpspV1SMKiagKq/6VUkULcu3BDHKs+s/yas0vRiXhar+KkW5bJCih
	 XaY/kiS17kxlQ==
Received: by mail-lj1-f198.google.com with SMTP id y11-20020a2eb00b0000b0290194aa1ae3efso5326039ljk.18
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iLo9oriWyOfHBsBsEoYg4hKQ8IGGXYdXKD17uVrYIIw=;
        b=DZY0JpNldCUiCJ8bi5L4KRvKwhZorxB09QjtJJxljWwAHWcBRObU2NmkclEEQjJ+7Y
         6FZMYqSY8q71/hI2Fs4MRZKuURI1Q7s6h/jLRXmuyVSiofYX0MOKBc5lmGZDjCLIqDYh
         FFa+MrzR3v1zLoVJqmqwaZYIvBEknvrYGgLe8cHwE9MnciOLAwE5uZ+HPdazg0RCZf8W
         ePcHx3ItDkGWVW05jMgmaBi0veEu5zkdYwla+X1LTbpQBTvSboDJLbo+4nsqN5g6FwqD
         W56mWpipa4X75frbj8JYk04vmPKMxCDCa3kAb5Ue5vDZmCPat8KmsLUCD1ZrQ3hM/y6J
         UTYg==
X-Gm-Message-State: AOAM532rxzOl3JfZQ7jQ1RAfH4+grvLjcngWliJ3QSqmdG1dhCXA34PQ
	mO9s6U7srGuX7eDcoBOcrr9K8g0EY2cyE5wCYfQAfrQOioDcuBLHD2nlnXjALpe6G8kSBCjHw3Z
	An2FCyKdyjgULwa7qxYKpyzHjqNJq+w5VEQ==
X-Received: by 2002:a2e:82c4:: with SMTP id n4mr21820397ljh.472.1626692938455;
        Mon, 19 Jul 2021 04:08:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwd1eNtPoDRCjFIpiggUa6jaQxtYLuOKt8QZCqoRqdqRuvi8EQhAydGyywFNvVgHy5ZwgqRHw==
X-Received: by 2002:a2e:82c4:: with SMTP id n4mr21820390ljh.472.1626692938274;
        Mon, 19 Jul 2021 04:08:58 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:08:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:27 +0200
Message-Id: <20210719110819.27340-22-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: MLBRUT5SUNFCVAB7PXT4AVVSQDVDWBUH
X-Message-ID-Hash: MLBRUT5SUNFCVAB7PXT4AVVSQDVDWBUH
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 21/73] adapter: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/MLBRUT5SUNFCVAB7PXT4AVVSQDVDWBUH/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UHJvcGVybHkgcHJpbnQgc2lnbmVkIGFuZCB1bnNpZ25lZCBpbnRlZ2Vycy4gIFRoaXMgZml4ZXMg
d2FybmluZ3MgbGlrZToNCg0KICAgIHNyYy9hZGFwdGVyLmM6IEluIGZ1bmN0aW9uIOKAmG5lYXJf
YWRhcHRlcl9kaXNjb25uZWN04oCZOg0KICAgIC4vaW5jbHVkZS9uZWFyL2xvZy5oOjQ1OjE0OiBl
cnJvcjogZm9ybWF0IOKAmCVk4oCZIGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDigJhpbnTigJks
IGJ1dCBhcmd1bWVudCA0IGhhcyB0eXBlIOKAmHVpbnQzMl904oCZIHtha2Eg4oCYdW5zaWduZWQg
aW504oCZfSBbLVdlcnJvcj1mb3JtYXQ9XQ0KICAgICAgIDQ1IHwgICBuZWFyX2RlYnVnKCIlczol
cygpICIgZm10LCBcDQogICAgICAgICAgfCAgICAgICAgICAgICAgXn5+fn5+fn5+fg0KICAgIHNy
Yy9hZGFwdGVyLmM6MTA5NToyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYREJH4oCZ
DQogICAgIDEwOTUgfCAgREJHKCJpZHggJWQiLCBpZHgpOw0KICAgICAgICAgIHwgIF5+fg0KDQpT
aWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGNh
bm9uaWNhbC5jb20+DQotLS0NCiBzcmMvYWRhcHRlci5jIHwgMjggKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlv
bnMoLSkNCg0KZGlmZiAtLWdpdCBhL3NyYy9hZGFwdGVyLmMgYi9zcmMvYWRhcHRlci5jDQppbmRl
eCA1YThmMDgzYTY4NmMuLjQyMDEyN2Y0ZjM5NiAxMDA2NDQNCi0tLSBhL3NyYy9hZGFwdGVyLmMN
CisrKyBiL3NyYy9hZGFwdGVyLmMNCkBAIC01NjYsNyArNTY2LDcgQEAgc3RydWN0IG5lYXJfYWRh
cHRlciAqX19uZWFyX2FkYXB0ZXJfY3JlYXRlKHVpbnQzMl90IGlkeCwNCiAJCQkJCQkJTlVMTCwg
ZnJlZV9kZXZpY2UpOw0KIAlhZGFwdGVyLT5kZXZpY2Vfc29jayA9IC0xOw0KIA0KLQlhZGFwdGVy
LT5wYXRoID0gZ19zdHJkdXBfcHJpbnRmKCIlcy9uZmMlZCIsIE5GQ19QQVRILCBpZHgpOw0KKwlh
ZGFwdGVyLT5wYXRoID0gZ19zdHJkdXBfcHJpbnRmKCIlcy9uZmMldSIsIE5GQ19QQVRILCBpZHgp
Ow0KIA0KIAlyZXR1cm4gYWRhcHRlcjsNCiB9DQpAQCAtNTk3LDcgKzU5Nyw3IEBAIGludCBfX25l
YXJfYWRhcHRlcl9zZXRfZGVwX3N0YXRlKHVpbnQzMl90IGlkeCwgYm9vbCBkZXApDQogew0KIAlz
dHJ1Y3QgbmVhcl9hZGFwdGVyICphZGFwdGVyOw0KIA0KLQlEQkcoImlkeCAlZCIsIGlkeCk7DQor
CURCRygiaWR4ICV1IiwgaWR4KTsNCiANCiAJYWRhcHRlciA9IGdfaGFzaF90YWJsZV9sb29rdXAo
YWRhcHRlcl9oYXNoLCBHSU5UX1RPX1BPSU5URVIoaWR4KSk7DQogCWlmICghYWRhcHRlcikNCkBA
IC02MzksNyArNjM5LDcgQEAgYm9vbCBfX25lYXJfYWRhcHRlcl9nZXRfZGVwX3N0YXRlKHVpbnQz
Ml90IGlkeCkNCiB7DQogCXN0cnVjdCBuZWFyX2FkYXB0ZXIgKmFkYXB0ZXI7DQogDQotCURCRygi
aWR4ICVkIiwgaWR4KTsNCisJREJHKCJpZHggJXUiLCBpZHgpOw0KIA0KIAlhZGFwdGVyID0gZ19o
YXNoX3RhYmxlX2xvb2t1cChhZGFwdGVyX2hhc2gsIEdJTlRfVE9fUE9JTlRFUihpZHgpKTsNCiAJ
aWYgKCFhZGFwdGVyKQ0KQEAgLTgyMSw3ICs4MjEsNyBAQCBpbnQgX19uZWFyX2FkYXB0ZXJfYWRk
X3RhcmdldCh1aW50MzJfdCBpZHgsIHVpbnQzMl90IHRhcmdldF9pZHgsDQogCXN0cnVjdCBuZWFy
X2FkYXB0ZXIgKmFkYXB0ZXI7DQogCWludCByZXQ7DQogDQotCURCRygiaWR4ICVkIiwgaWR4KTsN
CisJREJHKCJpZHggJXUiLCBpZHgpOw0KIA0KIAlhZGFwdGVyID0gZ19oYXNoX3RhYmxlX2xvb2t1
cChhZGFwdGVyX2hhc2gsIEdJTlRfVE9fUE9JTlRFUihpZHgpKTsNCiAJaWYgKCFhZGFwdGVyKQ0K
QEAgLTg1Miw3ICs4NTIsNyBAQCBpbnQgX19uZWFyX2FkYXB0ZXJfcmVtb3ZlX3RhcmdldCh1aW50
MzJfdCBpZHgsIHVpbnQzMl90IHRhcmdldF9pZHgpDQogew0KIAlzdHJ1Y3QgbmVhcl9hZGFwdGVy
ICphZGFwdGVyOw0KIA0KLQlEQkcoImlkeCAlZCIsIGlkeCk7DQorCURCRygiaWR4ICV1IiwgaWR4
KTsNCiANCiAJYWRhcHRlciA9IGdfaGFzaF90YWJsZV9sb29rdXAoYWRhcHRlcl9oYXNoLCBHSU5U
X1RPX1BPSU5URVIoaWR4KSk7DQogCWlmICghYWRhcHRlcikNCkBAIC04NzUsMTEgKzg3NSwxMSBA
QCBzdGF0aWMgZ2Jvb2xlYW4gcG9sbF9lcnJvcihncG9pbnRlciB1c2VyX2RhdGEpDQogCXN0cnVj
dCBuZWFyX2FkYXB0ZXIgKmFkYXB0ZXIgPSB1c2VyX2RhdGE7DQogCWJvb2wgcmVzZXQ7DQogDQot
CURCRygiYWRhcHRlciAlZCIsIGFkYXB0ZXItPmlkeCk7DQorCURCRygiYWRhcHRlciAldSIsIGFk
YXB0ZXItPmlkeCk7DQogDQogCXJlc2V0ID0gbmVhcl9zZXR0aW5nX2dldF9ib29sKCJSZXNldE9u
RXJyb3IiKTsNCiAJaWYgKHJlc2V0KSB7DQotCQluZWFyX2Vycm9yKCJSZXNldHRpbmcgbmZjJWQi
LCBhZGFwdGVyLT5pZHgpOw0KKwkJbmVhcl9lcnJvcigiUmVzZXR0aW5nIG5mYyV1IiwgYWRhcHRl
ci0+aWR4KTsNCiAJCSBfX25lYXJfbmV0bGlua19hZGFwdGVyX2VuYWJsZShhZGFwdGVyLT5pZHgs
IGZhbHNlKTsNCiAJCSBfX25lYXJfbmV0bGlua19hZGFwdGVyX2VuYWJsZShhZGFwdGVyLT5pZHgs
IHRydWUpOw0KIAl9DQpAQCAtODkzLDcgKzg5Myw3IEBAIGludCBfX25lYXJfYWRhcHRlcl9nZXRf
dGFyZ2V0c19kb25lKHVpbnQzMl90IGlkeCkNCiB7DQogCXN0cnVjdCBuZWFyX2FkYXB0ZXIgKmFk
YXB0ZXI7DQogDQotCURCRygiaWR4ICVkIiwgaWR4KTsNCisJREJHKCJpZHggJXUiLCBpZHgpOw0K
IA0KIAlhZGFwdGVyID0gZ19oYXNoX3RhYmxlX2xvb2t1cChhZGFwdGVyX2hhc2gsIEdJTlRfVE9f
UE9JTlRFUihpZHgpKTsNCiAJaWYgKCFhZGFwdGVyKQ0KQEAgLTkyMCw3ICs5MjAsNyBAQCBpbnQg
X19uZWFyX2FkYXB0ZXJfYWRkX2RldmljZSh1aW50MzJfdCBpZHgsIHVpbnQ4X3QgKm5mY2lkLCB1
aW50OF90IG5mY2lkX2xlbikNCiAJc3RydWN0IG5lYXJfYWRhcHRlciAqYWRhcHRlcjsNCiAJaW50
IHJldDsNCiANCi0JREJHKCJpZHggJWQiLCBpZHgpOw0KKwlEQkcoImlkeCAldSIsIGlkeCk7DQog
DQogCWFkYXB0ZXIgPSBnX2hhc2hfdGFibGVfbG9va3VwKGFkYXB0ZXJfaGFzaCwgR0lOVF9UT19Q
T0lOVEVSKGlkeCkpOw0KIAlpZiAoIWFkYXB0ZXIpDQpAQCAtOTQ0LDcgKzk0NCw3IEBAIGludCBf
X25lYXJfYWRhcHRlcl9yZW1vdmVfZGV2aWNlKHVpbnQzMl90IGlkeCkNCiAJc3RydWN0IG5lYXJf
YWRhcHRlciAqYWRhcHRlcjsNCiAJdWludDMyX3QgZGV2aWNlX2lkeCA9IDA7DQogDQotCURCRygi
aWR4ICVkIiwgaWR4KTsNCisJREJHKCJpZHggJXUiLCBpZHgpOw0KIA0KIAlhZGFwdGVyID0gZ19o
YXNoX3RhYmxlX2xvb2t1cChhZGFwdGVyX2hhc2gsIEdJTlRfVE9fUE9JTlRFUihpZHgpKTsNCiAJ
aWYgKCFhZGFwdGVyKQ0KQEAgLTEwNDAsNyArMTA0MCw3IEBAIGludCBuZWFyX2FkYXB0ZXJfY29u
bmVjdCh1aW50MzJfdCBpZHgsIHVpbnQzMl90IHRhcmdldF9pZHgsIHVpbnQ4X3QgcHJvdG9jb2wp
DQogCXN0cnVjdCBzb2NrYWRkcl9uZmMgYWRkcjsNCiAJaW50IGVyciwgc29jazsNCiANCi0JREJH
KCJpZHggJWQiLCBpZHgpOw0KKwlEQkcoImlkeCAldSIsIGlkeCk7DQogDQogCWFkYXB0ZXIgPSBn
X2hhc2hfdGFibGVfbG9va3VwKGFkYXB0ZXJfaGFzaCwgR0lOVF9UT19QT0lOVEVSKGlkeCkpOw0K
IAlpZiAoIWFkYXB0ZXIpDQpAQCAtMTA5Miw3ICsxMDkyLDcgQEAgaW50IG5lYXJfYWRhcHRlcl9k
aXNjb25uZWN0KHVpbnQzMl90IGlkeCkNCiAJdWludDMyX3QgdGFyZ2V0X2lkeDsNCiAJdWludDE2
X3QgdGFnX3R5cGU7DQogDQotCURCRygiaWR4ICVkIiwgaWR4KTsNCisJREJHKCJpZHggJXUiLCBp
ZHgpOw0KIA0KIAlhZGFwdGVyID0gZ19oYXNoX3RhYmxlX2xvb2t1cChhZGFwdGVyX2hhc2gsIEdJ
TlRfVE9fUE9JTlRFUihpZHgpKTsNCiAJaWYgKCFhZGFwdGVyKQ0KQEAgLTExMDYsNyArMTEwNiw3
IEBAIGludCBuZWFyX2FkYXB0ZXJfZGlzY29ubmVjdCh1aW50MzJfdCBpZHgpDQogCXRhZ190eXBl
ID0gX19uZWFyX3RhZ19nZXRfdHlwZShhZGFwdGVyLT50YWdfbGluayk7DQogCXRhcmdldF9pZHgg
PSBuZWFyX3RhZ19nZXRfdGFyZ2V0X2lkeChhZGFwdGVyLT50YWdfbGluayk7DQogDQotCURCRygi
dGFnIHR5cGUgJWQiLCB0YWdfdHlwZSk7DQorCURCRygidGFnIHR5cGUgJXUiLCB0YWdfdHlwZSk7
DQogDQogCV9fbmVhcl9hZGFwdGVyX3JlbW92ZV90YXJnZXQoYWRhcHRlci0+aWR4LCB0YXJnZXRf
aWR4KTsNCiANCkBAIC0xMTMzLDcgKzExMzMsNyBAQCBpbnQgbmVhcl9hZGFwdGVyX3NlbmQodWlu
dDMyX3QgaWR4LCB1aW50OF90ICpidWYsIHNpemVfdCBsZW5ndGgsDQogCXN0cnVjdCBuZWFyX2Fk
YXB0ZXJfaW9yZXEgKnJlcSA9IE5VTEw7DQogCWludCBlcnI7DQogDQotCURCRygiaWR4ICVkIiwg
aWR4KTsNCisJREJHKCJpZHggJXUiLCBpZHgpOw0KIA0KIAlhZGFwdGVyID0gZ19oYXNoX3RhYmxl
X2xvb2t1cChhZGFwdGVyX2hhc2gsIEdJTlRfVE9fUE9JTlRFUihpZHgpKTsNCiAJaWYgKCFhZGFw
dGVyKSB7DQotLSANCjIuMjcuMA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbmZjIG1haWxpbmcgbGlzdCAtLSBsaW51eC1uZmNAbGlzdHMuMDEu
b3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gbGludXgtbmZjLWxlYXZlQGxpc3Rz
LjAxLm9yZwolKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNnaWV4dClzLyUoX2ludGVybmFsX25h
bWUpcw==
