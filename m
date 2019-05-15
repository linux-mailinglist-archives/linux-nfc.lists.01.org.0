Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB041EA30
	for <lists+linux-nfc@lfdr.de>; Wed, 15 May 2019 10:32:52 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 1532C21276BA8;
	Wed, 15 May 2019 01:32:51 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id 66D3D2126578B
 for <linux-nfc@lists.01.org>; Wed, 15 May 2019 01:32:49 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id s17so1642156wru.3
 for <linux-nfc@lists.01.org>; Wed, 15 May 2019 01:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=2PRdHD+YHensJnwISHyY5pFCrqq6RfcJQGlSygjfgvE=;
 b=PadiKoxQRsPFCyjAREfZA3dWoErXC9/SVPdfOK8u5o2HQDmFzsuJ/d+jQKdwaIcqCj
 ujW5XR2xFfKuBmcEa2AHRB/sV62susMCxmoiA/InbZiDLp+5tvc6aG2dWY14Sxj2ETsZ
 p4dVrbJLOreijev81W2TP9XplndgEvNvhPqAlab+VDuxq0bqaBtuhfC133LYld2ldWTI
 8qBOU4c5RN1a5vqsWBO+gn2/wXrcm+7PjwlY0ouCVdMiiNkk+dXrlr3FzWBx01CxvZNw
 TGb/w/VfuGEekemrN3MP/4RygINktsmebZXqnT/NappxNp3NQMbZeGiJxkqldTqwWgDU
 eaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=2PRdHD+YHensJnwISHyY5pFCrqq6RfcJQGlSygjfgvE=;
 b=VvwSy0UqJVLP6pJfVisAaDfQZ6RtZ96PSjUZEwFOOOtWNHJE/VzRVcTuVWfy77qkpt
 bMiLseoZY2otRHK+xtOWGpGfOnlO/B3FSj0nj2kLKz8FqYW90m77moPXOP9EvNVRacdx
 CZsPnvmPX8RXaT3lE/7SV9QKCpTdRwLFA54wZb3k9d1JZtzkEZ2OH0QjZB1wlo9yNtHy
 vD0Y560oNjvdeAolMFTEoCftC12MqTnq72ZVlqJ/uoLaUO6r+DeLxphM+R5OcHWR/DJA
 zVb/tgstZYS/+ripZiBxsRGIUWjbEDL5BpR+OdXi54vvkYI8So6OUqPGxKP7zMc1RMEg
 8PFA==
X-Gm-Message-State: APjAAAXlQT1oJtTvNIsVGWTE8D1e2pUtjIOWAA+gjX85zIX7f+D0rqEr
 6/1pNIkpTPno5klnTyUGIm9Q0AsarxJ5k14oGyw=
X-Google-Smtp-Source: APXvYqy3st9WZQznZfPmo2qxWxf8jfyQgT5oVTHe1hmoCj3MFxSYdFtlYJbOz+jTcDowENaRu/c/YqmklIprFFNeM8M=
X-Received: by 2002:adf:dc4b:: with SMTP id m11mr25686833wrj.66.1557909167564; 
 Wed, 15 May 2019 01:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190513104358.59716-1-andriy.shevchenko@linux.intel.com>
 <CA+icZUV_g5mJnmHQKZgtcPj3YfZSYp1DQJT9tmi+892AzRCm3A@mail.gmail.com>
 <20190513123751.GS9224@smile.fi.intel.com>
 <CA+icZUUA8TfU--6b+RwXMf=ui7ww0DK=EurzdMeDUkGvwcJ_rg@mail.gmail.com>
 <2d39b39b-27eb-abef-747f-400433daefee@intel.com>
 <CA+icZUW6vttB8EvgBZYi3kT7uhcbQr+baYbif_V6D78ZNEDbHQ@mail.gmail.com>
 <4f297fa0-257d-5036-8a1a-0f5434bb5d26@intel.com>
 <CA+icZUWZH-JS=JHLieVd2ga=Zutac2BXd4tk0tSXs+izQ5txOQ@mail.gmail.com>
 <787aff34-b1b9-b9e2-faf3-409d7fc95a52@intel.com>
 <CA+icZUV=TBfabHsbzj_JPnxXBjo114LWVJ==xSS7zVPkajmNgw@mail.gmail.com>
 <20190514170136.GI9224@smile.fi.intel.com>
In-Reply-To: <20190514170136.GI9224@smile.fi.intel.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 15 May 2019 10:32:36 +0200
Message-ID: <CA+icZUW0KM07sUH=muhRwFBZQKQpeqN6wCDHSDrQM-L35bA+SQ@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [linux-nfc] [PATCH v2 00/12] NFC: nxp-nci: clean up and support
 new ID
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
Cc: linux-nfc@lists.01.org, linux-wireless@vger.kernel.org,
 Charles Gorand <charles.gorand@effinnov.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-nfc-bounces@lists.01.org
Sender: "Linux-nfc" <linux-nfc-bounces@lists.01.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgNzowMSBQTSBBbmR5IFNoZXZjaGVua28KPGFuZHJpeS5z
aGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1heSAxNCwgMjAx
OSBhdCAwNDo1MzoxMFBNICswMjAwLCBTZWRhdCBEaWxlayB3cm90ZToKPiA+IE9uIFR1ZSwgTWF5
IDE0LCAyMDE5IGF0IDM6NTcgUE0gT2xlZyBaaHVyYWtpdnNreXkKPiA+IDxvbGVnLnpodXJha2l2
c2t5eUBpbnRlbC5jb20+IHdyb3RlOgo+Cj4gPiBXaGF0IGFib3V0IHRoaXMgb25lPwo+ID4KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL25mYy9ueHAtbmNpL0tjb25maWcgYi9kcml2ZXJzL25mYy9u
eHAtbmNpL0tjb25maWcKPiA+IGluZGV4IGEyOGM0MjY1MzU0ZC4uYjllNjQ4NmFhOGZlIDEwMDY0
NAo+ID4gLS0tIGEvZHJpdmVycy9uZmMvbnhwLW5jaS9LY29uZmlnCj4gPiArKysgYi9kcml2ZXJz
L25mYy9ueHAtbmNpL0tjb25maWcKPiA+IEBAIC0yLDggKzIsOCBAQCBjb25maWcgTkZDX05YUF9O
Q0kKPiA+ICAgICAgICAgdHJpc3RhdGUgIk5YUC1OQ0kgTkZDIGRyaXZlciIKPiA+ICAgICAgICAg
ZGVwZW5kcyBvbiBORkNfTkNJCj4gPiAgICAgICAgIC0tLWhlbHAtLS0KPiA+IC0gICAgICAgICBH
ZW5lcmljIGNvcmUgZHJpdmVyIGZvciBOWFAgTkNJIGNoaXBzIHN1Y2ggYXMgdGhlIE5QQzEwMAo+
ID4gLSAgICAgICAgIG9yIFBONzE1MCBmYW1pbGllcy4KPiA+ICsgICAgICAgICBHZW5lcmljIGNv
cmUgZHJpdmVyIGZvciBOWFAgTkNJIGNoaXBzIHN1Y2ggYXMgdGhlIE5QQzEwMCAoUE41NDcpLAo+
ID4gKyAgICAgICAgIE5QQzMwMCAoUE41NDgpIG9yIFBONzE1MCBmYW1pbGllcy4KPiA+ICAgICAg
ICAgICBUaGlzIGlzIGEgZHJpdmVyIGJhc2VkIG9uIHRoZSBOQ0kgTkZDIGtlcm5lbCBsYXllcnMg
YW5kCj4gPiAgICAgICAgICAgd2lsbCB0aHVzIG5vdCB3b3JrIHdpdGggTlhQIGxpYm5mYyBsaWJy
YXJ5Lgo+ID4KPiA+IEBAIC0xOSw2ICsxOSwxMSBAQCBjb25maWcgTkZDX05YUF9OQ0lfSTJDCj4g
PiAgICAgICAgICAgY2hpcHMuCj4gPiAgICAgICAgICAgU2VsZWN0IHRoaXMgaWYgeW91ciBwbGF0
Zm9ybSBpcyB1c2luZyB0aGUgSTJDIGJ1cy4KPiA+Cj4gPiArICAgICAgICAgIEZ1cnRoZXJtb3Jl
LCB0aGUgcGluIGNvbnRyb2wgYW5kIEdQSU8gZHJpdmVyIG9mIHRoZSBhY3R1YWwgU29DIG9yCj4g
PiArICAgICAgICAgIFBDSCBpcyBuZWVkZWQuCj4gPiArICAgICAgICAgIEZvciBleGFtcGxlIHNl
dCBDT05GSUdfUElOQ1RSTF9TVU5SSVNFUE9JTlQ9eSB0byBhY3RpdmF0ZSB0aGUKPiA+ICsgICAg
ICAgICAgSW50ZWwgU3VucmlzZXBvaW50IChQQ0ggb2YgSW50ZWwgU2t5bGFrZSkgcGluY3RybCBh
bmQgR1BJTyBkcml2ZXIuCj4gPiArCj4KPiBCZXNpZGVzIHNvbWUgaW5kZW50YXRpb24gcHJvYmxl
bXMgKHRoZSBoZWxwIGxpbmVzIHNob3VsZCBiZSBwcmVmaXhlZCB3aXRoCj4gJ1RBQiArIDIgc3Bh
Y2VzJyksIHRoaXMgaXMgbm90IG5lZWRlZCDigJQgaXQncyBvYnZpb3VzIGFuZCB1c3VhbGx5IGRp
c3Ryb3MKPiBwcm92aWRlIGFsbCBvZiBwaW4gY29udHJvbCBkcml2ZXJzIGFueXdheS4KPgo+IEZv
ciBkZWJ1Z2dpbmcgb25lIG1heSBjaGVjayBkZWZlcnJlZCBkZXZpY2VzIHZpYSBEZWJ1Z0ZTLCBv
ciB1c2UKPiAnaW5pdGNhbGxfZGVidWcnLCBvciBvdGhlciBmYWNpbGl0aWVzLgo+Cj4gPiAgICAg
ICAgICAgVG8gY29tcGlsZSB0aGlzIGRyaXZlciBhcyBhIG1vZHVsZSwgY2hvb3NlIG0gaGVyZS4g
VGhlIG1vZHVsZSB3aWxsCj4gPiAgICAgICAgICAgYmUgY2FsbGVkIG54cF9uY2lfaTJjLgo+ID4g
LSAgICAgICAgIFNheSBZIGlmIHVuc3VyZS4KPiA+ICsgICAgICAgICBTYXkgTiBpZiB1bnN1cmUu
Cj4KPgo+IC0tCj4gV2l0aCBCZXN0IFJlZ2FyZHMsCj4gQW5keSBTaGV2Y2hlbmtvCj4KPgoKRXhj
ZWxsZW50IGV5ZXMgKFRBQiArIDIgc3BhY2VzKSEKClNvLCB0aGlzIGlzIGVub3VnaD8KCiQgZ2l0
IGRpZmYKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmZjL254cC1uY2kvS2NvbmZpZyBiL2RyaXZlcnMv
bmZjL254cC1uY2kvS2NvbmZpZwppbmRleCBhMjhjNDI2NTM1NGQuLmQ4NWE0NzYxZTI3MSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9uZmMvbnhwLW5jaS9LY29uZmlnCisrKyBiL2RyaXZlcnMvbmZjL254
cC1uY2kvS2NvbmZpZwpAQCAtMiw4ICsyLDggQEAgY29uZmlnIE5GQ19OWFBfTkNJCiAgICAgICAg
dHJpc3RhdGUgIk5YUC1OQ0kgTkZDIGRyaXZlciIKICAgICAgICBkZXBlbmRzIG9uIE5GQ19OQ0kK
ICAgICAgICAtLS1oZWxwLS0tCi0gICAgICAgICBHZW5lcmljIGNvcmUgZHJpdmVyIGZvciBOWFAg
TkNJIGNoaXBzIHN1Y2ggYXMgdGhlIE5QQzEwMAotICAgICAgICAgb3IgUE43MTUwIGZhbWlsaWVz
LgorICAgICAgICAgR2VuZXJpYyBjb3JlIGRyaXZlciBmb3IgTlhQIE5DSSBjaGlwcyBzdWNoIGFz
IHRoZSBQTjU0NyAoTlBDMTAwKSwKKyAgICAgICAgIFBONTQ4IChOUEMzMDApIG9yIFBONzE1MCBm
YW1pbGllcy4KICAgICAgICAgIFRoaXMgaXMgYSBkcml2ZXIgYmFzZWQgb24gdGhlIE5DSSBORkMg
a2VybmVsIGxheWVycyBhbmQKICAgICAgICAgIHdpbGwgdGh1cyBub3Qgd29yayB3aXRoIE5YUCBs
aWJuZmMgbGlicmFyeS4KCkBAIC0yMSw0ICsyMSw0IEBAIGNvbmZpZyBORkNfTlhQX05DSV9JMkMK
CiAgICAgICAgICBUbyBjb21waWxlIHRoaXMgZHJpdmVyIGFzIGEgbW9kdWxlLCBjaG9vc2UgbSBo
ZXJlLiBUaGUgbW9kdWxlIHdpbGwKICAgICAgICAgIGJlIGNhbGxlZCBueHBfbmNpX2kyYy4KLSAg
ICAgICAgIFNheSBZIGlmIHVuc3VyZS4KKyAgICAgICAgIFNheSBOIGlmIHVuc3VyZS4KClNoYWxs
IEkgc2VudCBhIHBhdGNoIGZvciB0aGlzLCBvciBkbyB5b3Ugd2FudCB0byB0aGF0IHlvdXJzZWxm
PwoKVGhhbmtzLgoKLSBTZWRhdCAtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW5mYyBtYWlsaW5nIGxpc3QKTGludXgtbmZjQGxpc3RzLjAxLm9y
ZwpodHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW5mYwo=
