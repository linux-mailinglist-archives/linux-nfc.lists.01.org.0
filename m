Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A893C3F21
	for <lists+linux-nfc@lfdr.de>; Sun, 11 Jul 2021 22:24:57 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4B50C100EB325;
	Sun, 11 Jul 2021 13:24:56 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B3A3B100EB329
	for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:53 -0700 (PDT)
Received: from mail-wm1-f72.google.com ([209.85.128.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m2g0S-0001tq-Ed
	for linux-nfc@lists.01.org; Sun, 11 Jul 2021 20:24:52 +0000
Received: by mail-wm1-f72.google.com with SMTP id r1-20020a05600c35c1b0290223be6fd23dso96519wmq.1
        for <linux-nfc@lists.01.org>; Sun, 11 Jul 2021 13:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I+37ILDHjWO/y9chcbCij8+gvqiDUOYZag+6dwyGiMo=;
        b=jMsDX9909F3NLWxAJU93xpAeWb9wGPO9iPz2HT5kwtg6EBm3lhlRzEnkRSpFSKlUqM
         B+GFXXT/kjnEv5H8YYjySkmTlaRaBAq45XYgRhVOpRCFqiiwox/eYKTsiQkjTNCvedXL
         eq1strcL0/dCIWYr6G0+FNNnBFVtemJwWaR8rozVBhKJAH90rqIM4Wvq7Z5i+dYhzR+O
         Ez/3TgPOYcHFzgd1GMW+1cZW0Rs4RMxeyqr1HCXf0r/U7TGNlJ+3eS4VNV7YDtxRUzlg
         IwBCdau0o4F2/9Gh0Mp0S0V6srgfwThGF3b88VxQyZSb9TswWlipkPX6TCUlMRi/OdeT
         05oA==
X-Gm-Message-State: AOAM5312fnYy3/t9xY6+v/v31TaAosgfUUxBZznnvuYiL4kghzTexR9l
	8v+BrlV2y8Bg+XTZdeS7JvOITT8XipueiGHsuK0XdRetomegzfRp6yMJjoscFbXUcdSjGU3bdBN
	fZpyi+ZCHaq1bpicqBU48e6aR/pvsV5VkCg==
X-Received: by 2002:a05:600c:1c85:: with SMTP id k5mr10823104wms.47.1626035091927;
        Sun, 11 Jul 2021 13:24:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIWRpHE/aVnBRyyCh0Thv4mZgassKzZX7xH5uMG6S67yZOcZR85q+CnsdAYmsEzi6KP5l+bA==
X-Received: by 2002:a05:600c:1c85:: with SMTP id k5mr10823096wms.47.1626035091820;
        Sun, 11 Jul 2021 13:24:51 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id n12sm12501575wmq.5.2021.07.11.13.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 13:24:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Sun, 11 Jul 2021 22:23:44 +0200
Message-Id: <20210711202351.18363-15-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
References: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: GFWLBFJOWADAP3MDB4JIO3M2TNLO3XBH
X-Message-ID-Hash: GFWLBFJOWADAP3MDB4JIO3M2TNLO3XBH
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 27/34] manager: use proper format for integers (-Wformat)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/GFWLBFJOWADAP3MDB4JIO3M2TNLO3XBH/>
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
