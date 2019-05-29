Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1587D2D921
	for <lists+linux-nfc@lfdr.de>; Wed, 29 May 2019 11:33:21 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 672522128DD32;
	Wed, 29 May 2019 02:33:17 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::241; helo=mail-lj1-x241.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id BDD5C2128D862
 for <linux-nfc@lists.01.org>; Wed, 29 May 2019 02:33:15 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id h11so1759439ljb.2
 for <linux-nfc@lists.01.org>; Wed, 29 May 2019 02:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=khQe+ZPxYMqpBG1IezHbw09lCcnzVR0JRN8Fkyeq7b8=;
 b=sE6oWhvGektjgQ2nv82QgjE4E2YY/BOIETk6k+usn02woD4AyDAjZPwjQy0eWoVI6/
 DzIBrlcrXV+GiW7i6T9UxBDYyjRXfMPDS1dFgpNSN/4KH20pBM4RJx0iLvglAFJZ1YXN
 +UbNXphwb5NJphqNiX/L1Jg0B96FkfLMxBKpV/tO8zmGh0DN2oIJqRwJmHaYIV+cub7l
 JuLVxSBnMOwrzp64j/MmjYwF9n+mp5eEROY7LfYW+C85GwDD/XOg6dZ5Tmu1jiCwg/JC
 wrC3x06ZB/7u7nC3yiuIqq4NhfI/2mBFn4ssb5T7yKD4dfvTsQQxCSTJscMGWS5UUNxp
 RZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=khQe+ZPxYMqpBG1IezHbw09lCcnzVR0JRN8Fkyeq7b8=;
 b=SvDlKkovp5d54diMCE6dMrDS36P9AzmO4oaOl9PuxfqPweLdEUJJbQBsTclDZHA4iO
 Z7Ep3sEhUEDrsV7DbELXCV+6OPNqgHTOp14l7PcTZtcwqETjeIWjuEyOLPI43lAlNKat
 vCz/e00hwWoNVGUrtjw1Y+lAz6KjrVJz9FAlWYbF4TGge2vIfT0uXvhyU6e+50hRfIRZ
 GL+B0q+52YcCfD0NRKRJ10Xm2XjEvsOWhtphOa9e82DD/Pp5JcD15LhPayjec4G91P0i
 w7hWzdn0Pf9cRUwlnajt/NfX04eSkrjqjUZ5rrgLEsNQulTcF221VPymiLT18V1uDsUD
 WINw==
X-Gm-Message-State: APjAAAWNt0kqerr7wJyaD8nzZxKZj7nMB0EpAuuvq1zKQL/hT3MDtNpR
 +eDBOV/zbBEnAlRbpWVigqDTqw8a/lUXnF6r10Y=
X-Google-Smtp-Source: APXvYqyJs9ytxOvaS7WtJu2bOez7wZjUzL6XU9hg52gn5XanxdahjBLtr/+80Tk/gObfJudbJa7jdwum3qvi6bXEvmU=
X-Received: by 2002:a2e:9e4d:: with SMTP id g13mr24700101ljk.80.1559122393813; 
 Wed, 29 May 2019 02:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <c2d0d19f-d814-8f41-4860-77b9cc7f9d26@linaro.org>
 <CA+icZUVz7sB6hv4fhL_rqhR_D8RePBJFXk1PaUy5tMw2z4xC_Q@mail.gmail.com>
 <5ae87449-83a1-ecce-c72c-b4742c507497@linaro.org>
 <CA+icZUXDLQKyTH-_pPi7A2=Bu5ratwab930Fcecrdr4NtMnFcw@mail.gmail.com>
 <27f2ce02-8deb-384f-af10-7737b703770a@linaro.org>
 <CA+icZUVaBdswfmRfbRtdVJY8ymeDOwDSFEf7G6jneqEmpW84bg@mail.gmail.com>
 <525160f3-a76c-4b45-2e05-c27aaabbf74d@linaro.org>
In-Reply-To: <525160f3-a76c-4b45-2e05-c27aaabbf74d@linaro.org>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 29 May 2019 11:33:02 +0200
Message-ID: <CA+icZUWrP5avSSxzK45gza6VUYWiUDHv9jyC4vrF+aCYVmMCZQ@mail.gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [linux-nfc] NXP NFC version and ACPI
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
Cc: linux-nfc@lists.01.org, Martin Weinelt <hexa@darmstadt.ccc.de>,
 linux-wireless@vger.kernel.org, charles.gorand@effinnov.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-nfc-bounces@lists.01.org
Sender: "Linux-nfc" <linux-nfc-bounces@lists.01.org>

T24gU3VuLCBNYXkgMTksIDIwMTkgYXQgNjo0NiBQTSBEYW5pZWwgTGV6Y2Fubwo8ZGFuaWVsLmxl
emNhbm9AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPgo+IEZZSSwgd2hlbiBJIHRyaWVkIHRvIG1ha2Ug
dGhlIE5GQyB3b3JrIG9uIG15IHgyODAsIEkgdHJpZWQgdGhlIG1vZHVsZSBhdDoKPgo+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9qcjY0L254cC1wbjV4eAo+Cj4gQUZBSVIsIGl0IGZpbmFsbHkgd29ya2Vk
IHNvbWVob3cuCj4KPiBNYXkgYmUgeW91IGNhbiBjcm9zcyBjaGVjayB3aXRoIHlvdXIgc2VyaWVz
IGFuZCB0aGUgY2hhbmdlIGluIHRoaXMKPiBtb2R1bGUgdG8gZmluZCBvdXQgd2hhdCBjb3VsZCBi
ZSBtaXNzaW5nPyAoSSBjYW4gZG8gdGhhdCBidXQgaXQgd2lsbCBiZQo+IGNlcnRhaW5seSBlYXNp
ZXIgZm9yIHlvdSBzcG90IHNvbWV0aGluZyBpbiB0aGUgY29kZSB5b3Ugd3JvdGUpLgo+Cj4gSSBj
YW4gZXhwZXJpbWVudCB5b3VyIGNoYW5nZXMgaW4gbXkgbGFwdG9wIGlmIG5lZWRlZC4KPgoKWyBD
QyBNYXJ0aW4gVy4gXQoKSGkgRGFuaWVsLAoKSSB3YXMgb24gaG9saWRheXMgdGhlIGxhc3Qgd2Vl
ayBhbmQgc3RhcnRlZCB3b3JraW5nIHllc3RlcmRheS4KClRoZSBwYXRjaHNldCBpcyBmcm9tIEFu
ZHkgUy4gKHNlZSBDQyBsaXN0KS4KSG1tLCBJIGhhdmVuJ3Qgc2VlIGEgdjMgeWV0LgoKQXMgc2Fp
ZCBJIGFtIG5ldyB0byBORkMgYW5kIHBsYXllZCBhIGJpdCB3aXRoIEFuZHkncyB2MiBwYXRjaHNl
dCBhbmQKbmVhcmQgKGRhZW1vbikuCkJlZm9yZSB0aGlzIEkgcGxheWVkIHdpdGggc3R1ZmYgZnJv
bSBodHRwczovL2dpdGh1Yi5jb20vanI2NC9ueHAtcG41eHgKdG9nZXRoZXIgd2l0aCBOWFAncyBs
aWJuZmMtbmNpLgpNYXJ0aW4gVy4gaXMgcmVwb3J0aW5nIHByb2JsZW1zIHdpdGggdjIgaW4gWzFd
LgoKSXMgaXQgcG9zc2libGUgdG8gcmVwb3J0IHlvdXIgZXhwZXJpZW5jZXMvZmluZGluZ3MgdG8g
QW5keSdzIHYyCnBhdGNoc2V0L2NvdmVyLWxldHRlciAiW1BBVENIIHYyIDAwLzEyXSBORkM6IG54
cC1uY2k6IGNsZWFuIHVwIGFuZApzdXBwb3J0IG5ldyBJRCI/CgpUaGFua3MuCgpSZWdhcmRzLAot
IFNlZGF0IC0KClsxXSBodHRwczovL2dpdGh1Yi5jb20vbmZjLXRvb2xzL2xpYm5mYy9pc3N1ZXMv
NDU1I2lzc3VlY29tbWVudC00OTM1NzY3NDAKCgoKCgoKPgo+IE9uIDE0LzA1LzIwMTkgMTY6NTks
IFNlZGF0IERpbGVrIHdyb3RlOgo+ID4gT24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMTA6MTcgQU0g
RGFuaWVsIExlemNhbm8KPiA+IDxkYW5pZWwubGV6Y2Fub0BsaW5hcm8ub3JnPiB3cm90ZToKPiA+
IFsuLi5dCj4gPgo+ID4gSnVzdCBmb3IgdGhlIHJlY29yZHM6Cj4gPgo+ID4gcm9vdEBpbml6YTp+
IyByZmtpbGwgLS1vdXRwdXQgSUQsVFlQRQo+ID4gSUQgVFlQRQo+ID4gIDAgYmx1ZXRvb3RoCj4g
PiAgMSBuZmMKPiA+ICAyIHdsYW4KPiA+ICAzIGJsdWV0b290aAo+ID4KPiA+IHJvb3RAaW5pemE6
fiMgcmZraWxsIGxpc3QgbmZjCj4gPiAxOiBuZmMwOiBORkMKPiA+ICAgICAgICAgU29mdCBibG9j
a2VkOiBubwo+ID4gICAgICAgICBIYXJkIGJsb2NrZWQ6IG5vCj4gPgo+ID4gLSBTZWRhdCAtCj4g
Pgo+Cj4KPiAtLQo+ICA8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3Bl
biBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCj4KPiBGb2xsb3cgTGluYXJvOiAgPGh0dHA6
Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo+IDxodHRwOi8vdHdp
dHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPiA8aHR0cDovL3d3dy5saW5hcm8ub3Jn
L2xpbmFyby1ibG9nLz4gQmxvZwo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW5mYyBtYWlsaW5nIGxpc3QKTGludXgtbmZjQGxpc3RzLjAxLm9y
ZwpodHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW5mYwo=
