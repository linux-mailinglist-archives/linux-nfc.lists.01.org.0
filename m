Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DBD1A371
	for <lists+linux-nfc@lfdr.de>; Fri, 10 May 2019 21:40:57 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id D70352126CF95;
	Fri, 10 May 2019 12:40:55 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id 8187121C93EEC
 for <linux-nfc@lists.01.org>; Fri, 10 May 2019 12:40:54 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id f204so3167678wme.0
 for <linux-nfc@lists.01.org>; Fri, 10 May 2019 12:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=b7CNSrJCC6jDkKxuON1hgz7BdbZu47CyI5hQf5tuyjY=;
 b=BlpTPD1AF/484jhDB7tBJ11stdfaRWyZEcc08YrbQEt2fQp8Id0u/3L7qq+ZiP9Nfx
 +xNZa3bmx7upb4n0u+/2nTxgS9hK2R393ljqjOfKewkx62Zm55HwO5ejV8QuvLiOfK+y
 k9HwxaZ08cqufHVZGflCjW2xekQDslyxXO5xmmWF8jD6heMV2lCq6xHi6nZnmEO4ecOf
 OthsCWkeQtzmxvK/UVMD3D3Epp0vbzTdltfRIAMBWJFH8jzgU8vRjBcGjO74B/NIvNUf
 oBliej1JM5qJX+krY2QgZ9R253+CtaJW1GnzujxPzHrijjutG9g4k1Fx9Zm994t7+HRl
 xDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=b7CNSrJCC6jDkKxuON1hgz7BdbZu47CyI5hQf5tuyjY=;
 b=QPjNnvKWFr/v3WNQCrHNxm7Xp+xuXbPdMwmb5xGOQv5lJtOrFYH9Ssu/bXOfixtpyL
 QRKOd2js6FSmstmz2Nc3DwoKIdgYybruikMWQyi8uNw4FZ7aFKXR1DwPAFp3YMdeNGwD
 N9yS0PCYQTK0ZUeecXbHqQxVxvLXjAYFopotUUZC1gbB1yh2h5bPVms3zhjOU82GIhKJ
 Nn9soknibepBp5K/fe25ZhkYSOqDcAB+qkD+SLtONGcmaXLeQ/T9xkpBZHL9CERUU5fB
 m779WX9uiSlY1Sk1HNcgXFXmhUNt6H0kZxuIJY7szMAx38Fq5X4IHbc0eX54kCKdoBGr
 irLQ==
X-Gm-Message-State: APjAAAUJSKcaEgN9Mhas0cNUUD+CX8KxVs2HFSNb5+n1CQWldUJCbybg
 OV5jCV0o9BbFoH0HBcytNAczgIyUycAnXFoJMxc=
X-Google-Smtp-Source: APXvYqxtmH2f5hAmohpUcsmcGKa800sPMjnAjRnyaUvtYVbx2RMlIrzBKWkAYcsZU6MxMr5wcrxZ6lkJGYgh/uBGlsE=
X-Received: by 2002:a1c:dd44:: with SMTP id u65mr8160906wmg.109.1557517252999; 
 Fri, 10 May 2019 12:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUX+VNtk00YQnNYCnDeeH2Onq6s1vbdzYrv-OHf7q186Ww@mail.gmail.com>
 <154e3e74-38b5-850b-5993-295f9db8fe3c@intel.com>
In-Reply-To: <154e3e74-38b5-850b-5993-295f9db8fe3c@intel.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Fri, 10 May 2019 21:40:37 +0200
Message-ID: <CA+icZUWhBeup95PTP_k58xs8Lf2Ofqb0S_gkdBfbuc0-wdpF-w@mail.gmail.com>
To: Oleg Zhurakivskyy <oleg.zhurakivskyy@intel.com>
Subject: Re: [linux-nfc] ThinkPad T470 and NXP PN5xx (PN547 or PN548)
X-BeenThere: linux-nfc@lists.01.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: NFC on Linux <linux-nfc.lists.01.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nfc>,
 <mailto:linux-nfc-request@lists.01.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nfc/>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nfc>,
 <mailto:linux-nfc-request@lists.01.org?subject=subscribe>
Reply-To: sedat.dilek@gmail.com
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-wireless@vger.kernel.org, linux-nfc@lists.01.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-nfc-bounces@lists.01.org
Sender: "Linux-nfc" <linux-nfc-bounces@lists.01.org>

T24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgODo1NiBQTSBPbGVnIFpodXJha2l2c2t5eQo8b2xlZy56
aHVyYWtpdnNreXlAaW50ZWwuY29tPiB3cm90ZToKPgo+Cj4gSGkgU2VkYXQsCj4KPiBJIHdvdWxk
IGxpa2UgdG8gaGVscCB5b3UsIGJ1dCBhdCB0aGUgc2FtZSB0aW1lIG5vdCB0byBtaXNsZWFkLCBh
cyBpdOKAmXMgYmVlbiBhIHRpbWUgc2luY2UgSSB0b3VjaGVkIHRoYXQuCj4KPiBTbyB0YWtlIGV2
ZXJ5dGhpbmcgd2l0aCBhIGdyYWluIG9mIHNhbHQgYW5kIGNvcnJlY3QgbWUgd2hlcmUgSSBtaWdo
dCBiZSB3cm9uZy9mb3Jnb3QuCj4KPiA+IEkgYW0gbm90IHN1cmUgaWYgSSBuZWVkIHRvIGxvYWQg
dGhlIFBONTQ0IChJMkMpIGRyaXZlcj8KPgo+IFllcywgdGhlIGRyaXZlciBpcyBuZWVkZWQsIGZv
ciBQTjU0NyBpdOKAmXMgTlhQIE5QQzEwMCwgdGhlIGRyaXZlciBpcyBkcml2ZXJzL25mYy9ueHAt
bmNpLgo+Cj4gPiBEbyBJIG5lZWQgdGhlc2UgZmlybXdhcmUgZmlsZXMgaW5zdGFsbGVkPwo+Cj4g
VG8gc3RhcnQgd2l0aCwgaS5lLiBmb3IgYSBzaW1wbGUgc2lnbmFsIHRocm91Z2ggbGlrZSByZWFk
aW5nIGEgdGFnLCBtb3N0IGxpa2VseSBub3QgKHRoZSBjaGlwIGlzIHVzdWFsbHkgcHJvdmlzaW9u
ZWQgd2l0aCBzb21lIEZXKS4KPgoKSGkgT2xlZywKCnRoYW5rcyBmb3IgYWxsIHRoZSBpbmZvcm1h
dGlvbnMuLi4KCiMgbW9kcHJvYmUgLXYgbnhwLW5jaV9pMmMKCi4uLmdpdmVzIG1lLi4uCgojIGxz
bW9kIHwgZWdyZXAgJ25mY3xyZmtpbGx8cG41NDR8aTJjfGdwaW98bWVpfG54cHxuY2knIHwgc29y
dAppMmNfYWxnb19iaXQgICAgICAgICAgIDI0NTc2ICAxIGk5MTUKaTJjX2RldiAgICAgICAgICAg
ICAgICAyNDU3NiAgMAppMmNfaTgwMSAgICAgICAgICAgICAgIDMyNzY4ICAwCm1laSAgICAgICAg
ICAgICAgICAgICAxMTg3ODQgIDEgbWVpX21lCm1laV9tZSAgICAgICAgICAgICAgICAgMzY4NjQg
IDAKbmNpICAgICAgICAgICAgICAgICAgICA3NzgyNCAgMiBueHBfbmNpLG54cF9uY2lfaTJjCm5m
YyAgICAgICAgICAgICAgICAgICAxMjI4ODAgIDIgbmNpLG54cF9uY2kKbnhwX25jaSAgICAgICAg
ICAgICAgICAxNjM4NCAgMSBueHBfbmNpX2kyYwpueHBfbmNpX2kyYyAgICAgICAgICAgIDE2Mzg0
ICAwCnJma2lsbCAgICAgICAgICAgICAgICAgMzI3NjggIDEwIG5mYyxibHVldG9vdGgsdGhpbmtw
YWRfYWNwaSxjZmc4MDIxMQoKV2hhdCB1c2Vyc3BhY2UgZG8gSSBuZWVkPwoKSSB0cmllZC4uLgoK
IyByZmtpbGwgbGlzdAowOiB0cGFjcGlfYmx1ZXRvb3RoX3N3OiBCbHVldG9vdGgKICAgICAgICBT
b2Z0IGJsb2NrZWQ6IG5vCiAgICAgICAgSGFyZCBibG9ja2VkOiBubwoxOiBwaHkwOiBXaXJlbGVz
cyBMQU4KICAgICAgICBTb2Z0IGJsb2NrZWQ6IG5vCiAgICAgICAgSGFyZCBibG9ja2VkOiBubwoy
OiBoY2kwOiBCbHVldG9vdGgKICAgICAgICBTb2Z0IGJsb2NrZWQ6IG5vCiAgICAgICAgSGFyZCBi
bG9ja2VkOiBubwoKIyBuZmMtbGlzdApuZmMtbGlzdCB1c2VzIGxpYm5mYyAxLjcuMQpObyBORkMg
ZGV2aWNlIGZvdW5kLgoKIyBuZmMtc2Nhbi1kZXZpY2UKbmZjLXNjYW4tZGV2aWNlIHVzZXMgbGli
bmZjIDEuNy4xCk5vIE5GQyBkZXZpY2UgZm91bmQuCgo+IFRvIHN0YXJ0IHdpdGgsIGkuZS4gZm9y
IGEgc2ltcGxlIHNpZ25hbCB0aHJvdWdoIGxpa2UgcmVhZGluZyBhIHRhZywgbW9zdCBsaWtlbHkg
bm90ICh0aGUgY2hpcCBpcyB1c3VhbGx5IHByb3Zpc2lvbmVkIHdpdGggc29tZSBGVykuCgpDYW4g
eW91IGd1aWRlIG1lIGhvdyB0byBkbyB0aGF0PwoKVGhhbmtzIQoKUmVnYXJkcywKLSBTZWRhdCAt
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW5m
YyBtYWlsaW5nIGxpc3QKTGludXgtbmZjQGxpc3RzLjAxLm9yZwpodHRwczovL2xpc3RzLjAxLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW5mYwo=
