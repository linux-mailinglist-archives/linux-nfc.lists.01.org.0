Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C283C3F17
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:24:42 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 6A0AC100EB85F;
	Sun, 11 Jul 2021 13:24:41 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B2C75100EB847
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:37 -0700 (PDT)
Received: from mail-wr1-f72.google.com ([209.85.221.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2g0C-0001oh-Eq
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:24:36 +0000
Received: by mail-wr1-f72.google.com with SMTP id y15-20020a5d614f0000b029013cd60e9baaso3762320wrt.7
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yDhXsIs2jsFYqx0LFtrD/pgQivIk/Mv0diihqtesc/o=;
        b=cbt24Hu77Pdl6WufVoBo5yLjN1SDt31SJMGjyiPvv8OZ0ZKrpqoNdwOD4iwzOzT6Hs
         KzrBxpDUUjaY8tKtbupJBBLC8Mjx5OEy5DE5GNkyDPgWFhxi2pfDyF2xwK6TbhZMnUKP
         4rRLWDwJFbx4CBmGSDU7WdH1lwXOK870NdR+DLeqWHl3OIybbl9y41X4MmH/aYGgOMrK
         Yd8nWOGK1m5yhk5A0XDvok7CNhLWOfclI7iVIBwidjll/FEXxlTCYMhwMFCvxyyDfqaV
         j1/UAeuZSkb+99hwET2hNxECOa4B2KSh4kgGfuxsIDRaWpjtA1H4sGOqO90Wp3OrxEIw
         CpuA==
X-Gm-Message-State: AOAM532fYZpXW/urDcPTjdUD7PyjTzaslttq6buSUKn8Ec1heD5GZI86
	FpOXFtdday401GvfasmSO2FuvI3erTBqW3+3E/ydtyFqRLofBfN5sqfc9Uom/QUjMv7Q24dUk1X
	ci6oom9EA6OiUFS6xFS3gOVXmBs8a45tLTw==
X-Received: by 2002:a5d:4e01:: with SMTP id p1mr24898714wrt.171.1626035076050;
        Sun, 11 Jul 2021 13:24:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy94SBJ/6yaL7EvrwxUjv6Gj1xpyKjpdMmCjU8+OFUOBqZcOTQM0fwiLxETxIYAamNn4/2wHQ==
X-Received: by 2002:a5d:4e01:: with SMTP id p1mr24898687wrt.171.1626035075724;
        Sun, 11 Jul 2021 13:24:35 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id n12sm12501575wmq.5.2021.07.11.13.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:24:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:23:34 +0200
Message-Id: <20210711202351.18363-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: XZYOYAAFA5RJC72B2PA6XNH7HLYWEVWX
X-Message-ID-Hash: XZYOYAAFA5RJC72B2PA6XNH7HLYWEVWX
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 17/34] bluetooth: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/XZYOYAAFA5RJC72B2PA6XNH7HLYWEVWX/>
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
