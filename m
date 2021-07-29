Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6AE3DA2AE
	for <lists+linux-nfc@lfdr.de>; Thu, 29 Jul 2021 13:58:41 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 28791100EB826;
	Thu, 29 Jul 2021 04:58:40 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 8B273100EBB9E
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 04:58:37 -0700 (PDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 5A6EB3F10B
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 11:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627559915;
	bh=mJegt6nAKectUckt+rbFcl6x63P1a1GPjk8ahj5YQQU=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=bQGamwfephWaMoWpVCkkn6eCMN3KZaBoWqWicZ/qbKALsfgq4hHLFVuaMtxQWYAe6
	 /SoeM+AKnrhtCw2Izm17aHvKnl1DeKyE39GgEIdY1DKgxYWcAe2hBKDjPE0Lgz4BWp
	 w28yBjEQOLTe14gTT4MVxOGq2cahZs3scRYruWtIWCiHxQq4zZPtQCp/gf5xed38ru
	 0Pi4Y6uqp779oBX/W+n7BelGsVbD6+ubLDIRvE+E9ArgKmalQ0vbqLSULXFFmfj3gi
	 eCG7jKJpRw0Hn05NSmjREt6ODJPb1YsR8ETYYs3Eirrk8fssajqcvSVPS2XEyXIPpq
	 ANnjJ6G20RQwg==
Received: by mail-ed1-f69.google.com with SMTP id a23-20020a50ff170000b02903b85a16b672so2838978edu.1
        for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 04:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mJegt6nAKectUckt+rbFcl6x63P1a1GPjk8ahj5YQQU=;
        b=lP4cOgUJu0OAgDFFExJCnH7/tSe/Aq9zIXybmxD/ut8j4u6m6P1V7wRxD1/9cjvN4N
         ygirzZhZPXBqTjptNYJ4nblrvwpvEArKJ26J2s4sByhRY016XB3vSiwECNdfuXcTpSui
         9gcpeluvh4M3dQgBm68JUqbvH+0Jq/O2EAEemBo8Gtytaho2TB0fIXNu3wyqay4LhKn+
         w7kSIwVLg4hX9GfR31eBizR3dKe6R2IakvmNA6S4zayVSUEuvjgm4pLD4smUptpqzBX3
         AYDD3C3VJ7D9B+nbRXNwTQ2a447u1sKakgNeBEoPWJCUipFyJQExL6Lv888RnIS0/4kS
         RmcA==
X-Gm-Message-State: AOAM5304Qf6MsLrZtRNqaUiSqRsNQ8VpmrQAhIZTn4T6LRVRKmTsNHvd
	A/CxOLiDVmXOj8pPRb7pd793i8HPuOIBOGCb8OHnwfBeTB1XPw7qO9P+Uv33i+QvfXo5jgS2Jzu
	RljfivgHwecybsW68L+jLsS7FIefJMC04LA==
X-Received: by 2002:a17:906:c085:: with SMTP id f5mr4338574ejz.250.1627559914476;
        Thu, 29 Jul 2021 04:58:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzv4BAiKXa3/y/e8C9RanIKpgbXJfSN4+8ZZEBon9lao+WKG0BTNjyji29VQ1OsQPbAi6/DMw==
X-Received: by 2002:a17:906:c085:: with SMTP id f5mr4338563ejz.250.1627559914327;
        Thu, 29 Jul 2021 04:58:34 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id n11sm908803ejg.111.2021.07.29.04.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 04:58:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: patchwork-bot+netdevbpf@kernel.org, davem@davemloft.net
References: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
 <162755820704.26856.6157999905884570707.git-patchwork-notify@kernel.org>
 <7b0ae615-dcdc-251e-4067-959b31c28159@canonical.com>
Message-ID: <f3521001-58f3-8c6c-5b07-9dd8dae0cba8@canonical.com>
Date: Thu, 29 Jul 2021 13:58:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7b0ae615-dcdc-251e-4067-959b31c28159@canonical.com>
Content-Language: en-US
Message-ID-Hash: E6MKSQKQETZ6T3TIWDLQCLM5YP3N2G6C
X-Message-ID-Hash: E6MKSQKQETZ6T3TIWDLQCLM5YP3N2G6C
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: bongsu.jeon@samsung.com, kuba@kernel.org, linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 00/12] nfc: constify, continued (part 2)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/E6MKSQKQETZ6T3TIWDLQCLM5YP3N2G6C/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMjkvMDcvMjAyMSAxMzozNSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gMjkv
MDcvMjAyMSAxMzozMCwgcGF0Y2h3b3JrLWJvdCtuZXRkZXZicGZAa2VybmVsLm9yZyB3cm90ZToN
Cj4+IEhlbGxvOg0KPj4NCj4+IFRoaXMgc2VyaWVzIHdhcyBhcHBsaWVkIHRvIG5ldGRldi9uZXQt
bmV4dC5naXQgKHJlZnMvaGVhZHMvbWFzdGVyKToNCj4+DQo+PiBPbiBUaHUsIDI5IEp1bCAyMDIx
IDEyOjQwOjEwICswMjAwIHlvdSB3cm90ZToNCj4+PiBIaSwNCj4+Pg0KPj4+IE9uIHRvcCBvZjoN
Cj4+PiBuZmM6IGNvbnN0aWZ5IHBvaW50ZWQgZGF0YQ0KPj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xrbWwvMjAyMTA3MjYxNDUyMjQuMTQ2MDA2LTEta3J6eXN6dG9mLmtvemxvd3NraUBjYW5v
bmljYWwuY29tLw0KPj4+DQo+Pj4gQmVzdCByZWdhcmRzLA0KPj4+IEtyenlzenRvZg0KPj4+DQo+
Pj4gWy4uLl0NCj4+DQo+PiBIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6DQo+PiAgIC0g
WzAxLzEyXSBuZmM6IGNvbnN0aWZ5IHBhc3NlZCBuZmNfZGV2DQo+PiAgICAgaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9uZXRkZXYvbmV0LW5leHQvYy9kZDg5ODdhMzk0YzANCj4+ICAgLSBbMDIvMTJd
IG5mYzogbWVpX3BoeTogY29uc3RpZnkgYnVmZmVyIHBhc3NlZCB0byBtZWlfbmZjX3NlbmQoKQ0K
Pj4gICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvbmV0ZGV2L25ldC1uZXh0L2MvODk0YTZlMTU4
NjMzDQo+PiAgIC0gWzAzLzEyXSBuZmM6IHBvcnQxMDA6IGNvbnN0aWZ5IHNldmVyYWwgcG9pbnRl
cnMNCj4+ICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL25ldGRldi9uZXQtbmV4dC9jLzlhNGFm
MDFjMzVhNQ0KPj4gICAtIFswNC8xMl0gbmZjOiB0cmY3OTcwYTogY29uc3RpZnkgc2V2ZXJhbCBw
b2ludGVycw0KPj4gICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvbmV0ZGV2L25ldC1uZXh0L2Mv
ZWEwNTBjNWVlNzRhDQo+PiAgIC0gWzA1LzEyXSBuZmM6IHZpcnR1YWxfbmNpZGV2OiBjb25zdGlm
eSBwb2ludGVyIHRvIG5mY19kZXYNCj4+ICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL25ldGRl
di9uZXQtbmV4dC9jLzgzNDI4ZGJiYWM1MQ0KPj4gICAtIFswNi8xMl0gbmZjOiBuZmNzaW06IGNv
bnN0aWZ5IGRydmRhdGEgKHN0cnVjdCBuZmNzaW0pDQo+PiAgICAgaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9uZXRkZXYvbmV0LW5leHQvYy81ODJmZGM5OGFkYzgNCj4+ICAgLSBbMDcvMTJdIG5mYzog
ZmRwOiBkcm9wIHVubmVlZGVkIGNhc3QgZm9yIHByaW50aW5nIGZpcm13YXJlIHNpemUgaW4gZGV2
X2RiZygpDQo+PiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9uZXRkZXYvbmV0LW5leHQvYy82
Yzc1NWIxZDI1MTENCj4+ICAgLSBbMDgvMTJdIG5mYzogZmRwOiB1c2UgdW5zaWduZWQgaW50IGFz
IGxvb3AgaXRlcmF0b3INCj4+ICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL25ldGRldi9uZXQt
bmV4dC9jL2MzZTI2YjZkYzFiNA0KPj4gICAtIFswOS8xMl0gbmZjOiBmZHA6IGNvbnN0aWZ5IHNl
dmVyYWwgcG9pbnRlcnMNCj4+ICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL25ldGRldi9uZXQt
bmV4dC9jLzNkNDYzZGQ1MDIzYg0KPj4gICAtIFsxMC8xMl0gbmZjOiBtaWNyb3JlYWQ6IGNvbnN0
aWZ5IHNldmVyYWwgcG9pbnRlcnMNCj4+ICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL25ldGRl
di9uZXQtbmV4dC9jL2E3NTE0NDlmOGI0Nw0KPj4gICAtIFsxMS8xMl0gbmZjOiBtcnZsOiBjb25z
dGlmeSBzZXZlcmFsIHBvaW50ZXJzDQo+PiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9uZXRk
ZXYvbmV0LW5leHQvYy9mZTUzMTU5ZmUzZTANCj4gDQo+IE9oLCBmb2xrcywgdG9vIGZhc3QgOikN
Cj4gDQo+IFNvcnJ5IGZvciB0aGUgbWVzcywgYnV0IHRoZSBwYXRjaCAxMS8xMiBoYXMgb25lIGNv
bnN0IHdoaWNoIGlzIHdyb25nDQo+IChJIHNlbnQgYW4gZW1haWwgZm9yIGl0KSBhbmQgdGhpcyBz
aG91bGQgYmUgb24gdG9wIG9mIG15DQo+IHByZXZpb3VzIHNldDoNCj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGttbC8yMDIxMDcyNjE0NTIyNC4xNDYwMDYtMS1rcnp5c3p0b2Yua296bG93c2tp
QGNhbm9uaWNhbC5jb20vDQo+IHdoaWNoIEkgdGhpbmsgeW91IGRpZCBub3QgdGFrZSBpbi4NCj4g
DQo+IEkgYW0gbm90IHN1cmUgaWYgaXQgY29tcGlsZXMgY2xlYW5seSB3aXRob3V0IHRoZSBvbmUg
YWJvdmUuDQoNCkhpIERhdmlkLA0KDQpUaGlzIGZhaWxzIGJlY2F1c2Ugb2YgbWlzc2luZyBwYXRj
aHNldCBhYm92ZToNCi4uL2RyaXZlcnMvbmZjL2ZkcC9mZHAuYzogSW4gZnVuY3Rpb24g4oCYZmRw
X25jaV9zZXRfcHJvZHVjdGlvbl9kYXRh4oCZOg0KLi4vZHJpdmVycy9uZmMvZmRwL2ZkcC5jOjEx
Njo2MDogd2FybmluZzogcGFzc2luZyBhcmd1bWVudCA0IG9mDQrigJhuY2lfcHJvcF9jbWTigJkg
ZGlzY2FyZHMg4oCYY29uc3TigJkgcXVhbGlmaWVyIGZyb20gcG9pbnRlciB0YXJnZXQgdHlwZQ0K
Wy1XZGlzY2FyZGVkLXF1YWxpZmllcnNdDQogIDExNiB8ICByZXR1cm4gbmNpX3Byb3BfY21kKG5k
ZXYsIE5DSV9PUF9QUk9QX1NFVF9QREFUQV9PSUQsIGxlbiwgZGF0YSk7DQoNCkl0IGFsc28gaGFz
IG9uZSBpc3N1ZSBpbiBwYXRjaCAxMS8xMi4gQ2FuIHlvdSBkcm9wIHRoaXMgZnJvbQ0KbmV0LWRl
di9tYXN0ZXI/IEkgY2FuIHNlbmQgYSB2MiBvZiBib3RoIHBhdGNoc2V0cyBjb21iaW5lZC4NCg0K
QmVzdCByZWdhcmRzLA0KS3J6eXN6dG9mCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW5mYyBtYWlsaW5nIGxpc3QgLS0gbGludXgtbmZjQGxpc3Rz
LjAxLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGxpbnV4LW5mYy1sZWF2ZUBs
aXN0cy4wMS5vcmcKJSh3ZWJfcGFnZV91cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5h
bF9uYW1lKXM=
