Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9233CD313
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:05 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id A7277100EB32F;
	Mon, 19 Jul 2021 04:09:03 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 7FF7B100EB859
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:01 -0700 (PDT)
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 82E5840624
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692940;
	bh=D6JEPSfbaIb9BvIXAiNZTUqBvEZ3LSn9Ly+biOhu100=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=fPJHq5Hnfax+VxZ50f2/Barr9tyRuuE5DTwEFXCYrZzXCsMSOsxKg7NFbEXP5Gn/2
	 Zl/egoBR3T5pvuQjo7Dfd3ypbvFyaq+ufv/sHSJEPLcdnQEtuErLWL9usSy8aScsyR
	 Mhk7DUSQ4JFtR3xOAp8jiwW3s4R3XP7MGBUyol2N6TZTkyylKkFBkfXUcTzSLjwFBK
	 kGJIW5A4RxIS4oZwM2ZG0P8j8KNJnKxIDWz29xBo8kavolRrVRcAvsqNgUNTTaTgHX
	 EI5MmKuEtMC+aeDGslL8DEkuaQhDM8krmaDuGLeRUomBI+wQZFYsfqyLotX8WNynQB
	 z6x1Q1ZW1I2gg==
Received: by mail-lf1-f69.google.com with SMTP id l29-20020a19495d0000b02903606e832f3aso3275213lfj.14
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D6JEPSfbaIb9BvIXAiNZTUqBvEZ3LSn9Ly+biOhu100=;
        b=q+6ad51toZGYzY1QvLoTyYmTgU1hK3cUhuWkPlE71w/p39dYenmqNLwUNstBAWRBYD
         zqXYLbqJJSGed/uoYcO0lQLGevGlc0eJo9AvSAKsJOOkCV9CIov2wEF4ZoMv09WHFDPv
         3tjfoLhz2VmoNUT6grimomj0yIOgqVkaxacabM6xEM35a3Lup6VPwyXav0uMB57uqh7h
         QMwA/++be/iuPN6hvK181NtIuI/JTkWrfC0KNw+bGwgOkwriHRwH4S8Leu6iXHAnJrjG
         IasWEJ039dJBq09Fkw9alJ4/L13ZuWrc0QslPxWI9ZnZWpAcFK0M5m8cEkFgSJDXDPpv
         P4sw==
X-Gm-Message-State: AOAM5318IWHDmJm3uWhZpBNyWyifi7oLcaPxAje2prSfmESp4y20vl92
	S601bj1ATRgDoXcy5Z/j3PDt59i/suggCVkoJsMCUntg4YntpVMvez9SW0MEFs5Ld3FjsrYEpeJ
	xePqJTMzwQp0b2jsyUMgdTE6NUnD+FIoo8Q==
X-Received: by 2002:ac2:4ac6:: with SMTP id m6mr18777463lfp.73.1626692939777;
        Mon, 19 Jul 2021 04:08:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx545ZBa0L1fXylgl95NeOffyyyVGkeI1zy/08k0KQlG4VEgPRLO/LwHgMy7faGbKXsF1U2tQ==
X-Received: by 2002:ac2:4ac6:: with SMTP id m6mr18777457lfp.73.1626692939611;
        Mon, 19 Jul 2021 04:08:59 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:08:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:28 +0200
Message-Id: <20210719110819.27340-23-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: A64DABJ6NUEWYYTKSIXMWOZXUO5HDPSC
X-Message-ID-Hash: A64DABJ6NUEWYYTKSIXMWOZXUO5HDPSC
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 22/73] gdbus: do not shadow global 'pending' variable (-Wshadow)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/A64DABJ6NUEWYYTKSIXMWOZXUO5HDPSC/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Rml4IC1Xc2hhZG93IHdhcm5pbmdzOg0KDQogICAgZ2RidXMvb2JqZWN0LmM6IEluIGZ1bmN0aW9u
IOKAmGdfZGJ1c19wZW5kaW5nX3N1Y2Nlc3PigJk6DQogICAgZ2RidXMvb2JqZWN0LmM6Mjg2OjI0
OiBlcnJvcjogZGVjbGFyYXRpb24gb2Yg4oCYcGVuZGluZ+KAmSBzaGFkb3dzIGEgZ2xvYmFsIGRl
Y2xhcmF0aW9uIFstV2Vycm9yPXNoYWRvd10NCiAgICAgIDI4NiB8ICAgICAgR0RCdXNQZW5kaW5n
UmVwbHkgcGVuZGluZykNCiAgICAgICAgICB8ICAgICAgfn5+fn5+fn5+fn5+fn5+fn5+Xn5+fn5+
fg0KICAgIGdkYnVzL29iamVjdC5jOjg5OjE2OiBub3RlOiBzaGFkb3dlZCBkZWNsYXJhdGlvbiBp
cyBoZXJlDQogICAgICAgODkgfCBzdGF0aWMgR1NMaXN0ICpwZW5kaW5nID0gTlVMTDsNCiAgICAg
ICAgICB8ICAgICAgICAgICAgICAgIF5+fn5+fn4NCiAgICBnZGJ1cy9vYmplY3QuYzogSW4gZnVu
Y3Rpb24g4oCYZ19kYnVzX3BlbmRpbmdfZXJyb3JfdmFsaXN04oCZOg0KICAgIGdkYnVzL29iamVj
dC5jOjMwODoyMzogZXJyb3I6IGRlY2xhcmF0aW9uIG9mIOKAmHBlbmRpbmfigJkgc2hhZG93cyBh
IGdsb2JhbCBkZWNsYXJhdGlvbiBbLVdlcnJvcj1zaGFkb3ddDQogICAgICAzMDggfCAgICAgR0RC
dXNQZW5kaW5nUmVwbHkgcGVuZGluZywgY29uc3QgY2hhciAqbmFtZSwNCiAgICAgICAgICB8ICAg
ICB+fn5+fn5+fn5+fn5+fn5+fn5efn5+fn5+DQogICAgZ2RidXMvb2JqZWN0LmM6ODk6MTY6IG5v
dGU6IHNoYWRvd2VkIGRlY2xhcmF0aW9uIGlzIGhlcmUNCiAgICAgICA4OSB8IHN0YXRpYyBHU0xp
c3QgKnBlbmRpbmcgPSBOVUxMOw0KICAgICAgICAgIHwgICAgICAgICAgICAgICAgXn5+fn5+fg0K
ICAgIGdkYnVzL29iamVjdC5jOiBJbiBmdW5jdGlvbiDigJhnX2RidXNfcGVuZGluZ19lcnJvcuKA
mToNCiAgICBnZGJ1cy9vYmplY3QuYzozMzE6MjM6IGVycm9yOiBkZWNsYXJhdGlvbiBvZiDigJhw
ZW5kaW5n4oCZIHNoYWRvd3MgYSBnbG9iYWwgZGVjbGFyYXRpb24gWy1XZXJyb3I9c2hhZG93XQ0K
ICAgICAgMzMxIHwgICAgIEdEQnVzUGVuZGluZ1JlcGx5IHBlbmRpbmcsDQogICAgICAgICAgfCAg
ICAgfn5+fn5+fn5+fn5+fn5+fn5+Xn5+fn5+fg0KICAgIGdkYnVzL29iamVjdC5jOjg5OjE2OiBu
b3RlOiBzaGFkb3dlZCBkZWNsYXJhdGlvbiBpcyBoZXJlDQogICAgICAgODkgfCBzdGF0aWMgR1NM
aXN0ICpwZW5kaW5nID0gTlVMTDsNCiAgICAgICAgICB8ICAgICAgICAgICAgICAgIF5+fn5+fn4N
CiAgICBnZGJ1cy9vYmplY3QuYzogSW4gZnVuY3Rpb24g4oCYYnVpbHRpbl9zZWN1cml0eV9mdW5j
dGlvbuKAmToNCiAgICBnZGJ1cy9vYmplY3QuYzozNzA6MjU6IGVycm9yOiBkZWNsYXJhdGlvbiBv
ZiDigJhwZW5kaW5n4oCZIHNoYWRvd3MgYSBnbG9iYWwgZGVjbGFyYXRpb24gWy1XZXJyb3I9c2hh
ZG93XQ0KICAgICAgMzcwIHwgICAgICAgR0RCdXNQZW5kaW5nUmVwbHkgcGVuZGluZykNCiAgICAg
ICAgICB8ICAgICAgIH5+fn5+fn5+fn5+fn5+fn5+fl5+fn5+fn4NCiAgICBnZGJ1cy9vYmplY3Qu
Yzo4OToxNjogbm90ZTogc2hhZG93ZWQgZGVjbGFyYXRpb24gaXMgaGVyZQ0KICAgICAgIDg5IHwg
c3RhdGljIEdTTGlzdCAqcGVuZGluZyA9IE5VTEw7DQogICAgICAgICAgfCAgICAgICAgICAgICAg
ICBefn5+fn5+DQoNClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRv
Zi5rb3psb3dza2lAY2Fub25pY2FsLmNvbT4NCi0tLQ0KIGdkYnVzL29iamVjdC5jIHwgMjIgKysr
KysrKysrKystLS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAx
MSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2dkYnVzL29iamVjdC5jIGIvZ2RidXMvb2Jq
ZWN0LmMNCmluZGV4IDk2ZGI1MTY2NTMwMS4uZjM5NDMzNGQ0NTk0IDEwMDY0NA0KLS0tIGEvZ2Ri
dXMvb2JqZWN0LmMNCisrKyBiL2dkYnVzL29iamVjdC5jDQpAQCAtMjgzLDE0ICsyODMsMTQgQEAg
c3RhdGljIEdTTGlzdCAqcGVuZGluZ19zZWN1cml0eSA9IE5VTEw7DQogc3RhdGljIGNvbnN0IEdE
QnVzU2VjdXJpdHlUYWJsZSAqc2VjdXJpdHlfdGFibGUgPSBOVUxMOw0KIA0KIHZvaWQgZ19kYnVz
X3BlbmRpbmdfc3VjY2VzcyhEQnVzQ29ubmVjdGlvbiAqY29ubmVjdGlvbiwNCi0JCQkJCUdEQnVz
UGVuZGluZ1JlcGx5IHBlbmRpbmcpDQorCQkJICAgIEdEQnVzUGVuZGluZ1JlcGx5IHBlbmRpbmdf
cmVwbHkpDQogew0KIAlHU0xpc3QgKmxpc3Q7DQogDQogCWZvciAobGlzdCA9IHBlbmRpbmdfc2Vj
dXJpdHk7IGxpc3Q7IGxpc3QgPSBsaXN0LT5uZXh0KSB7DQogCQlzdHJ1Y3Qgc2VjdXJpdHlfZGF0
YSAqc2VjZGF0YSA9IGxpc3QtPmRhdGE7DQogDQotCQlpZiAoc2VjZGF0YS0+cGVuZGluZyAhPSBw
ZW5kaW5nKQ0KKwkJaWYgKHNlY2RhdGEtPnBlbmRpbmcgIT0gcGVuZGluZ19yZXBseSkNCiAJCQlj
b250aW51ZTsNCiANCiAJCXBlbmRpbmdfc2VjdXJpdHkgPSBnX3NsaXN0X3JlbW92ZShwZW5kaW5n
X3NlY3VyaXR5LCBzZWNkYXRhKTsNCkBAIC0zMDUsNyArMzA1LDcgQEAgdm9pZCBnX2RidXNfcGVu
ZGluZ19zdWNjZXNzKERCdXNDb25uZWN0aW9uICpjb25uZWN0aW9uLA0KIH0NCiANCiB2b2lkIGdf
ZGJ1c19wZW5kaW5nX2Vycm9yX3ZhbGlzdChEQnVzQ29ubmVjdGlvbiAqY29ubmVjdGlvbiwNCi0J
CQkJR0RCdXNQZW5kaW5nUmVwbHkgcGVuZGluZywgY29uc3QgY2hhciAqbmFtZSwNCisJCQkJR0RC
dXNQZW5kaW5nUmVwbHkgcGVuZGluZ19yZXBseSwgY29uc3QgY2hhciAqbmFtZSwNCiAJCQkJCWNv
bnN0IGNoYXIgKmZvcm1hdCwgdmFfbGlzdCBhcmdzKQ0KIHsNCiAJR1NMaXN0ICpsaXN0Ow0KQEAg
LTMxMyw3ICszMTMsNyBAQCB2b2lkIGdfZGJ1c19wZW5kaW5nX2Vycm9yX3ZhbGlzdChEQnVzQ29u
bmVjdGlvbiAqY29ubmVjdGlvbiwNCiAJZm9yIChsaXN0ID0gcGVuZGluZ19zZWN1cml0eTsgbGlz
dDsgbGlzdCA9IGxpc3QtPm5leHQpIHsNCiAJCXN0cnVjdCBzZWN1cml0eV9kYXRhICpzZWNkYXRh
ID0gbGlzdC0+ZGF0YTsNCiANCi0JCWlmIChzZWNkYXRhLT5wZW5kaW5nICE9IHBlbmRpbmcpDQor
CQlpZiAoc2VjZGF0YS0+cGVuZGluZyAhPSBwZW5kaW5nX3JlcGx5KQ0KIAkJCWNvbnRpbnVlOw0K
IA0KIAkJcGVuZGluZ19zZWN1cml0eSA9IGdfc2xpc3RfcmVtb3ZlKHBlbmRpbmdfc2VjdXJpdHks
IHNlY2RhdGEpOw0KQEAgLTMyOCwxNCArMzI4LDE0IEBAIHZvaWQgZ19kYnVzX3BlbmRpbmdfZXJy
b3JfdmFsaXN0KERCdXNDb25uZWN0aW9uICpjb25uZWN0aW9uLA0KIH0NCiANCiB2b2lkIGdfZGJ1
c19wZW5kaW5nX2Vycm9yKERCdXNDb25uZWN0aW9uICpjb25uZWN0aW9uLA0KLQkJCQlHREJ1c1Bl
bmRpbmdSZXBseSBwZW5kaW5nLA0KKwkJCSAgR0RCdXNQZW5kaW5nUmVwbHkgcGVuZGluZ19yZXBs
eSwNCiAJCQkJY29uc3QgY2hhciAqbmFtZSwgY29uc3QgY2hhciAqZm9ybWF0LCAuLi4pDQogew0K
IAl2YV9saXN0IGFyZ3M7DQogDQogCXZhX3N0YXJ0KGFyZ3MsIGZvcm1hdCk7DQogDQotCWdfZGJ1
c19wZW5kaW5nX2Vycm9yX3ZhbGlzdChjb25uZWN0aW9uLCBwZW5kaW5nLCBuYW1lLCBmb3JtYXQs
IGFyZ3MpOw0KKwlnX2RidXNfcGVuZGluZ19lcnJvcl92YWxpc3QoY29ubmVjdGlvbiwgcGVuZGlu
Z19yZXBseSwgbmFtZSwgZm9ybWF0LCBhcmdzKTsNCiANCiAJdmFfZW5kKGFyZ3MpOw0KIH0NCkBA
IC0zNjUsMTkgKzM2NSwxOSBAQCBzdGF0aWMgdm9pZCBidWlsdGluX3NlY3VyaXR5X3Jlc3VsdChk
YnVzX2Jvb2xfdCBhdXRob3JpemVkLCB2b2lkICp1c2VyX2RhdGEpDQogfQ0KIA0KIHN0YXRpYyB2
b2lkIGJ1aWx0aW5fc2VjdXJpdHlfZnVuY3Rpb24oREJ1c0Nvbm5lY3Rpb24gKmNvbm4sDQotCQkJ
CQkJY29uc3QgY2hhciAqYWN0aW9uLA0KLQkJCQkJCWdib29sZWFuIGludGVyYWN0aW9uLA0KLQkJ
CQkJCUdEQnVzUGVuZGluZ1JlcGx5IHBlbmRpbmcpDQorCQkJCSAgICAgIGNvbnN0IGNoYXIgKmFj
dGlvbiwNCisJCQkJICAgICAgZ2Jvb2xlYW4gaW50ZXJhY3Rpb24sDQorCQkJCSAgICAgIEdEQnVz
UGVuZGluZ1JlcGx5IHBlbmRpbmdfcmVwbHkpDQogew0KIAlzdHJ1Y3QgYnVpbHRpbl9zZWN1cml0
eV9kYXRhICpkYXRhOw0KIA0KIAlkYXRhID0gZ19uZXcwKHN0cnVjdCBidWlsdGluX3NlY3VyaXR5
X2RhdGEsIDEpOw0KIAlkYXRhLT5jb25uID0gY29ubjsNCi0JZGF0YS0+cGVuZGluZyA9IHBlbmRp
bmc7DQorCWRhdGEtPnBlbmRpbmcgPSBwZW5kaW5nX3JlcGx5Ow0KIA0KIAlpZiAocG9sa2l0X2No
ZWNrX2F1dGhvcml6YXRpb24oY29ubiwgYWN0aW9uLCBpbnRlcmFjdGlvbiwNCiAJCQkJYnVpbHRp
bl9zZWN1cml0eV9yZXN1bHQsIGRhdGEsIDMwMDAwKSA8IDApDQotCQlnX2RidXNfcGVuZGluZ19l
cnJvcihjb25uLCBwZW5kaW5nLCBOVUxMLCBOVUxMKTsNCisJCWdfZGJ1c19wZW5kaW5nX2Vycm9y
KGNvbm4sIHBlbmRpbmdfcmVwbHksIE5VTEwsIE5VTEwpOw0KIH0NCiANCiBzdGF0aWMgZ2Jvb2xl
YW4gY2hlY2tfcHJpdmlsZWdlKERCdXNDb25uZWN0aW9uICpjb25uLCBEQnVzTWVzc2FnZSAqbXNn
LA0KLS0gDQoyLjI3LjANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW5mYyBtYWlsaW5nIGxpc3QgLS0gbGludXgtbmZjQGxpc3RzLjAxLm9yZwpU
byB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGxpbnV4LW5mYy1sZWF2ZUBsaXN0cy4wMS5v
cmcKJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM=
