Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F32A21B50F
	for <lists+linux-nfc@lfdr.de>; Mon, 13 May 2019 13:36:38 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id B48C421268F8A;
	Mon, 13 May 2019 04:36:36 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id A0DE021243BC1
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 04:31:51 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id x64so2254785wmb.5
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 04:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=CkD7KwbrPUQx6UPSLwTwjUPT3LnQL1y1uwk7ETe3QYY=;
 b=E4pGpjrT+9MpyISgYYuoHrIFTgXLvRlaZL2rjAhhmyYLs/Qe6RSvfrfCbO/DBXaeku
 8CWk9f/amLPsrRFYPVeP857I241eP7uSqQg1fu7m7ZZIjBwzRD+uhMUB0sfEpskSjXzp
 qpWwi7ZO4BCq43PX0RwLoOkDUcMYzPwF6Yby8dsSxEVKVotEWkWkhrVue2+3p6agYawL
 NXq1gxP7wJ+TsVecCHBs0ZaVMu0z+imQ2dzhUO19WNfrzmic3AILNdKK0RSUMmO0WoCY
 MioqUB32OXVaUxvEwTqUJt01tzua+CKka2lRL2VVCEoFISYHVwJpxCDFxQ5xzlMZ/YH7
 SrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=CkD7KwbrPUQx6UPSLwTwjUPT3LnQL1y1uwk7ETe3QYY=;
 b=WX+bVOxE081ko0fopbgs1yGi77boFOL0JOQlkv+nT8fr0MNujmZrhiYEUF2eorwzj7
 NoGeGMZicn05Hb2Ju9o9YGStg4XtugR683DHzFfPc59+klhK1KkucZRcT1NDJn68quSq
 aqCz6MuRlmVi1wJJDgGjdR/OBKd06PO/LXC2TQoFaB3rxlEMhAw9GPOKBPoIZMT7ScFX
 +Fqf0HLyyy4D+w6GfEmYtmb9Jl1PRiRUqEEGdJ4Rq70ACbhaHzE0tJpo+iT8ezJUZO4M
 SXtgdqmigi2a4E39lhqp+ATVMUEvHfxQG/h2bsBLAR7MrQIiqDKu15ieDsdO4loqXrF9
 UUdg==
X-Gm-Message-State: APjAAAWTSsNXccQT8mLqIotl/dNQ1OurBM3JieWY+j4q8kJveCXAcWmw
 rmOWN1IUuOiD9pB33Rx6j5i1v85ev9x04RVd0MAmF08/QoM=
X-Google-Smtp-Source: APXvYqzGmN2+fJUSF+bDR92Rc2UOKHFPHGHAz8SnfLuX8TIF9/7I6cVmEFWdHz4aNCYXeGRTGtcA/e0BDZVZY1Q0jPw=
X-Received: by 2002:a7b:cb85:: with SMTP id m5mr2249534wmi.85.1557747108648;
 Mon, 13 May 2019 04:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUX+VNtk00YQnNYCnDeeH2Onq6s1vbdzYrv-OHf7q186Ww@mail.gmail.com>
 <154e3e74-38b5-850b-5993-295f9db8fe3c@intel.com>
 <CA+icZUWhBeup95PTP_k58xs8Lf2Ofqb0S_gkdBfbuc0-wdpF-w@mail.gmail.com>
 <06fbacb5-7739-1ca1-3bf4-8049a3ef019b@intel.com>
 <CA+icZUWJ0kZSqogg18LdP2YkNXk=_SNnT7-ufkd_Xp1ak7uchg@mail.gmail.com>
 <2b1bd56f-8797-fb90-e2af-218edaedd089@intel.com>
 <CA+icZUVMjCWwuC-ee1-+EPU6+mYqFZ7w4ai4t4EJcrsvZ2_BYg@mail.gmail.com>
 <3b7065a2-694f-63bf-fba3-a1641a03ea76@intel.com>
In-Reply-To: <3b7065a2-694f-63bf-fba3-a1641a03ea76@intel.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 13 May 2019 13:31:37 +0200
Message-ID: <CA+icZUUJYOYXmXRYyerY4QmiYoktT3_+kqQMpxyGFdb-8bfsuA@mail.gmail.com>
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

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMToyOCBQTSBPbGVnIFpodXJha2l2c2t5eQo8b2xlZy56
aHVyYWtpdnNreXlAaW50ZWwuY29tPiB3cm90ZToKPgo+Cj4gSGkgU2VkYXQsIEFuZHksCj4KPiBB
bmR5LCB0aGFua3MgYSBsb3QgZm9yIGV4dGVuZGluZyBhbmQgY2xlYW5pbmcgdGhhdCB1cC4KPgo+
ID4gVW5zdXJlLCB3aHkgdGhlIHBuNTQ0X2kyYyBORkMgZHJpdmVyIHNoaXBwZWQgd2l0aCB0aGUg
TGludXggdjUuMS4xCj4gZG9lcyBub3Qgd29yay4KPgo+IEkgYnJpZWZseSBsb29rZWQgaW50byBk
cml2ZXJzL25mYy9wbjU0NCwgdGhhdCBzZWVtcyBsaWtlIGFuIEhDSSBiYXNlZCBjaGlwIChhcyBv
cHBvc2VkIHRvIE5DSSBiYXNlZCBQTjU0NykuCj4KPiBJdCBtaWdodCBiZSB0aGF0IGNoYW5nZXMg
dGhhdCBBbmR5IHBvc3RlZCBhcmUgYWxyZWFkeSBzdWZmaWNpZW50IGZvciBQTjU0NyB0byBqdXN0
IHdvcmsgd2l0aCBuZWFyZCAoaWYgSSBhbSBub3QgbWlzc2luZyBhbnl0aGluZykuCj4KPiAjIHN1
ZG8gYXB0LWdldCBpbnN0YWxsIG5lYXJkIG5lYXJkLXRvb2xzCj4gIyBtYW4gbmZjdG9vbAo+CgpB
d2F5IHdpdGggTlhQJ3MgbGlibmZjLW5jaS4uLgoKcm9vdEBpbml6YTp+IyBzeXN0ZW1jdGwgc3Rh
dHVzIG5lYXJkLnNlcnZpY2UK4pePIG5lYXJkLnNlcnZpY2UgLSBMU0I6IE5GQyBkYWVtb24KICAg
TG9hZGVkOiBsb2FkZWQgKC9ldGMvaW5pdC5kL25lYXJkOyBnZW5lcmF0ZWQpCiAgIEFjdGl2ZTog
YWN0aXZlIChydW5uaW5nKSBzaW5jZSBNb24gMjAxOS0wNS0xMyAxMzoxNDoxMiBDRVNUOyAxNm1p
biBhZ28KICAgICBEb2NzOiBtYW46c3lzdGVtZC1zeXN2LWdlbmVyYXRvcig4KQogIFByb2Nlc3M6
IDgxMCBFeGVjU3RhcnQ9L2V0Yy9pbml0LmQvbmVhcmQgc3RhcnQgKGNvZGU9ZXhpdGVkLCBzdGF0
dXM9MC9TVUNDRVNTKQogICAgVGFza3M6IDEgKGxpbWl0OiA0OTE1KQogICBNZW1vcnk6IDEuNk0K
ICAgQ0dyb3VwOiAvc3lzdGVtLnNsaWNlL25lYXJkLnNlcnZpY2UKICAgICAgICAgICDilJTilIA4
ODUgL3Vzci9saWIvbmVhcmQvbmVhcmQKCk1haSAxMyAxMzoxNDoxMiBpbml6YSBzeXN0ZW1kWzFd
OiBTdGFydGluZyBMU0I6IE5GQyBkYWVtb24uLi4KTWFpIDEzIDEzOjE0OjEyIGluaXphIG5lYXJk
Wzg3N106IE5FQVIgZGFlbW9uIHZlcnNpb24gMC4xNgpNYWkgMTMgMTM6MTQ6MTIgaW5pemEgbmVh
cmRbODEwXTogU3RhcnRpbmcgTkZDIGRhZW1vbjogbmVhcmQuCk1haSAxMyAxMzoxNDoxMiBpbml6
YSBzeXN0ZW1kWzFdOiBTdGFydGVkIExTQjogTkZDIGRhZW1vbi4KCnJvb3RAaW5pemE6fiMgbmZj
dG9vbCAtLWxpc3QKbmZjMDoKICAgICAgICAgIFRhZ3M6IFsgXQogICAgICAgICAgRGV2aWNlczog
WyBdCiAgICAgICAgICBQcm90b2NvbHM6IFsgRmVsaWNhIE1JRkFSRSBKZXdlbCBJU08tREVQIE5G
Qy1ERVAgXQogICAgICAgICAgUG93ZXJlZDogTm8KICAgICAgICAgIFJGIE1vZGU6IE5vbmUKICAg
ICAgICAgIGx0bzogMTUwCiAgICAgICAgICBydzogMTUKICAgICAgICAgIG1pdXg6IDIwNDcKClB1
dHRpbmcgbXkgWXViaUtleSBvbiB0aGUgVDQ3MC4uLgoKcm9vdEBpbml6YTp+IyBuZmN0b29sIC0t
cG9sbCAtZCBuZmMwClN0YXJ0IHBvbGxpbmcgb24gbmZjMCBhcyBpbml0aWF0b3IKClRhcmdldHMg
Zm91bmQgZm9yIG5mYzAKICBUYWdzOiBbIHRhZzAgXQogIERldmljZXM6IFsgXQoKQ2FuIEkgZ2V0
IGEgZGV0YWlsZWQgdmlldyBvbiB0aGUgcG9sbGluZz8KCi0gU2VkYXQgLQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1uZmMgbWFpbGluZyBsaXN0
CkxpbnV4LW5mY0BsaXN0cy4wMS5vcmcKaHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1uZmMK
