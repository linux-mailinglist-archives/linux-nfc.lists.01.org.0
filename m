Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FBF1B453
	for <lists+linux-nfc@lfdr.de>; Mon, 13 May 2019 12:52:12 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id D1F7721256BBE;
	Mon, 13 May 2019 03:52:10 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id 55FC621244A56
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 03:52:09 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id c66so5849943wme.0
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 03:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=AYtx5hBxa9dcVDHYSg+x/xz/m3EBPuTCozc29imMpkc=;
 b=UjRApXS2Ma7DFSBM2yH/4HdTzAoopwuNJ4zORhHVoCXdWNdOmVM9xl84JRcUoJUjfc
 hWcHBhvQqQKp34+skSyAf1DP2OSQz6Gw07oI0ypILwvaamuqaqs0nyrdfcruYoM1aqX8
 1mHnis/1YRHGrWAke8QCeE/HhB7pSGKBAUfGGt638hV3Z1YXUHlEHNpcJk8Prr1PFuWK
 /nu7R7WAwZDBYyD/cuFKSEVECWmegtIWSpEsXwdJsQwXQlZ0AEvFNdgBXYXDw5Tp/YBu
 plWIzxx0ZOVYrHvgn4YQ5L7VUMI60kTkafIj0JhxZo/+wQCb4pIUvTLc1CF2w06kTHty
 U2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=AYtx5hBxa9dcVDHYSg+x/xz/m3EBPuTCozc29imMpkc=;
 b=MJtuHsOUowpdsEBOchB6HpvVDrAfXytcJzMeCDxPZ2W6Mj6pw3oFm9bGhgogM+06Y8
 wNoDIOP7lPxpmwCFFkG2SvtYBR6Z93n0Y8wNKxecTHk3HYuaqjsediEbGPuY3iHiSY6n
 sU9p6yZDWMOVYfJ4xRpv4dYGKPan+AELZsRulVGTYxFXVO0Ed4SXWLGdVjAv+i57ogXq
 1AJOudUCZdfQ/D7LQXCGkceV2o4ZoTQRGQ5ZyP14c9gzfg6fbHp/CkXqlfBMKUgq8I1C
 ydkdGS3vQgJkfA1Dw2Z3QWj6TNoztO7c4HbffGn7CoNJY1H2PljdJEEMI9jUHxkz8tNK
 W/vA==
X-Gm-Message-State: APjAAAUhkhv5MWNk84g/26HGSitLW9I838TZScZiPiKS3DM3+qPC7d5x
 A6EJhkKolanQjxpL8/lFxpZGUpIR1G0wCsad1f8=
X-Google-Smtp-Source: APXvYqwChQbVqTQlTZgIMY+lJrzW7kWpx6AimfvhfXyEQWPCiGuidbvtNzzIuGMKkgz6n7KQ6TUMaIavMGL+fTKoOwg=
X-Received: by 2002:a1c:9616:: with SMTP id y22mr4499448wmd.73.1557744727424; 
 Mon, 13 May 2019 03:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUX+VNtk00YQnNYCnDeeH2Onq6s1vbdzYrv-OHf7q186Ww@mail.gmail.com>
 <154e3e74-38b5-850b-5993-295f9db8fe3c@intel.com>
 <CA+icZUWhBeup95PTP_k58xs8Lf2Ofqb0S_gkdBfbuc0-wdpF-w@mail.gmail.com>
 <06fbacb5-7739-1ca1-3bf4-8049a3ef019b@intel.com>
 <CA+icZUWJ0kZSqogg18LdP2YkNXk=_SNnT7-ufkd_Xp1ak7uchg@mail.gmail.com>
 <2b1bd56f-8797-fb90-e2af-218edaedd089@intel.com>
In-Reply-To: <2b1bd56f-8797-fb90-e2af-218edaedd089@intel.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 13 May 2019 12:51:55 +0200
Message-ID: <CA+icZUVMjCWwuC-ee1-+EPU6+mYqFZ7w4ai4t4EJcrsvZ2_BYg@mail.gmail.com>
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

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMTI6MTUgUE0gT2xlZyBaaHVyYWtpdnNreXkKPG9sZWcu
emh1cmFraXZza3l5QGludGVsLmNvbT4gd3JvdGU6Cj4KPgo+IEhpIFNlZGF0LAo+Cj4gT24gNS8x
My8xOSAxMjoyNyBQTSwgU2VkYXQgRGlsZWsgd3JvdGU6Cj4KPiA+IFNvLCB0aGlzIHNlZW1zIHRv
IHdvcmsuCj4KPiBJIHNwZW50IGEgYml0IG9mIHRpbWUgdHJ5aW5nIHRvIGZpbmQgVDQ3MCwgY291
bGRu4oCZdCwgYW55d2F5IG1hbmFnZWQgdG8gZ2V0IHRvIOKAnU5YUCAxMDAx4oCdIGFuZCB3YXMg
Z29pbmcgdG8gaGludCB5b3UgZnVydGhlci4KPgo+IENvbmdyYXR1bGF0aW9ucywgZ3JlYXQgam9i
IQo+Cj4gQW5kIHRoYW5rcyBhIGxvdCBmb3IgZG9jdW1lbnRpbmcgZXZlcnl0aGluZyBhbmQgcG9z
dGluZyBpdCBoZXJlLiBQZXJoYXBzLCBldmVudHVhbGx5IGl0IGNvdWxkIGJlIHVwc3RyZWFtZWQu
Cj4KCkhpIE9sZWcsCgpUaGFua3MgdG8geW91IGFuZCBBbmR5LgoKQXMgZmFyIGFzIEkgaGF2ZSB1
bmRlcnN0b29kIHRoZSBwbjV4eF9pMmMga2VybmVsIGRyaXZlciAoZnJvbSBOWFAgb3IKYmV0dGVy
IHRvIHNheSB0aGUgQUNQSSBzdXBwb3J0IG1vZGlmaWVkIG9uZSBieSBqcjY0IHVzZXIpIGlzIG5l
ZWRlZCBhcwp0aGUgTkZDIGRldmljZSBpcyBub3QgYXV0by1kZXRlY3RlZC9jb25maWd1cmVkIHZp
YSBJMkMgYW5kIEdQSU8gYW5kCkFDUEkuCgpVbnN1cmUsIHdoeSB0aGUgcG41NDRfaTJjIE5GQyBk
cml2ZXIgc2hpcHBlZCB3aXRoIHRoZSBMaW51eCB2NS4xLjEKZG9lcyBub3Qgd29yay4KT3Igd2hh
dCBpdCBpcyBtaXNzaW5nLgoKSGVscGZ1bCB3YXMgdGhlIFBERiBmcm9tIFsxXS4KCkZ1cnRoZXJt
b3JlLCBJIGhhdmUgc2VlbiB0aGF0IERlYmlhbiByZWZ1c2VkIHRvIGludGVncmF0ZSB0aGUgTlhQ
CmxpYm5mYy1uY2kgbGlicmFyeSBkdWUgdG8gcG9saWN5IGlzc3VlcyAoc2VlIFsyXSkuCgpsaWJu
ZmMgbGlicmFyeSBzaGlwcGVkIHdpdGggRGViaWFuIGRvZXMgbm90IHdvcmsuCgotIFNlZGF0IC0K
ClsxXSBodHRwOi8vd3d3Lm54cC5jb20vZG9jdW1lbnRzL2FwcGxpY2F0aW9uX25vdGUvQU4xMTY5
Ny5wZGYKWzJdIGh0dHBzOi8vYnVncy5kZWJpYW4ub3JnL2NnaS1iaW4vYnVncmVwb3J0LmNnaT9i
dWc9ODU0NjA2Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW5mYyBtYWlsaW5nIGxpc3QKTGludXgtbmZjQGxpc3RzLjAxLm9yZwpodHRwczovL2xp
c3RzLjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW5mYwo=
