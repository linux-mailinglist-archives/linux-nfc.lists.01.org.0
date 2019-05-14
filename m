Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F311C4FE
	for <lists+linux-nfc@lfdr.de>; Tue, 14 May 2019 10:31:17 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 87B07212746CE;
	Tue, 14 May 2019 01:31:15 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id ECD8421237ADF
 for <linux-nfc@lists.01.org>; Tue, 14 May 2019 01:31:12 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id f8so312468wrt.1
 for <linux-nfc@lists.01.org>; Tue, 14 May 2019 01:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=u6tl+Ifw5QQe79ZvuXQPkJ9D7TkExDuPgGsND9OkpAo=;
 b=ef4iPNpNhJt4nT/oY72Lq9mZ1T6CHfS2Epp2Z1i+i3BVNkZO4FExiiruTVLvisqEXC
 1sd2R0H/AB1/4FH0RNN5/I8Ikmgh79XtHUdj3Sx6gfx3XEpYqaOIpwNU9/egL+NlzAka
 o7x7Vj+Au/c/B37Z3YY7tXXd2V4Eb5RlhL5ehRMzEQCR+RrQ22pUbhOgaKGONIobKAoj
 reUrX4KmufrR9p0hqxwxOZF+DweNaFOweK+plr1ZNwj4Dn+kx5iejTDwYCxBu2r0EMSx
 aohYlw/63qzwxhZxGSXDInOEF/hr4ZIzJUSoY5rfwbSNGGc0kSFDybdyTgl2oKySCekK
 zcgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=u6tl+Ifw5QQe79ZvuXQPkJ9D7TkExDuPgGsND9OkpAo=;
 b=KW3AUcTnnN6FtLcejPGWrQ8hfql/PUtto3pIcPVWld0gEueQMd8/KE61zolwGNR+dG
 8wEo0VWqKMb50WiJmUVaoTUH1rK4R4dikWKrLtA76lP7t7b8MY6y8tpj1h8vZKTiE0fc
 aQZmkIXFKIgTLKf/aHb3TgWg4UIY6NR2/p2yyLKlAHUBk1Fizh6xdlCV4QIu25pTt8y8
 0BxelSBjb4H89bFEQ5LTVHHvSgaXHxGTZbGgtj5bQ6qYgMLSWGOKJ574/PLX/mdFNPTM
 kizCqInH+mN6wPmEZXSirQF1aUBXE65L+tQjLFY86eJO9DB2sr09rVw7a79IgBl8bhdy
 B1ww==
X-Gm-Message-State: APjAAAV2KEjbv6gdYVcEKhPZ0sGzvu97fxXR3RqBHi3pfWhaaYAgRPz5
 ORdmYqnSyEFkswoSwmLW7SJczE2YMjrWIigJGk9aMsZO
X-Google-Smtp-Source: APXvYqxGwhc5aZI4+oS3BDbMXI+y/GcYiGI4n6TEunXE84FU5BFgY0JcI3NgF8V1cCAZhO36cBFNGnwpZYmSExDHY64=
X-Received: by 2002:adf:dc4b:: with SMTP id m11mr21321753wrj.66.1557822671465; 
 Tue, 14 May 2019 01:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <c2d0d19f-d814-8f41-4860-77b9cc7f9d26@linaro.org>
 <CA+icZUVz7sB6hv4fhL_rqhR_D8RePBJFXk1PaUy5tMw2z4xC_Q@mail.gmail.com>
 <5ae87449-83a1-ecce-c72c-b4742c507497@linaro.org>
 <CA+icZUXDLQKyTH-_pPi7A2=Bu5ratwab930Fcecrdr4NtMnFcw@mail.gmail.com>
 <27f2ce02-8deb-384f-af10-7737b703770a@linaro.org>
In-Reply-To: <27f2ce02-8deb-384f-af10-7737b703770a@linaro.org>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 14 May 2019 10:30:59 +0200
Message-ID: <CA+icZUVa_Sfcp-P=cLyH1VOpZ=pFmrLDG1Epebe9s7Qa9fghaA@mail.gmail.com>
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
Cc: linux-nfc@lists.01.org, linux-wireless@vger.kernel.org,
 charles.gorand@effinnov.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-nfc-bounces@lists.01.org
Sender: "Linux-nfc" <linux-nfc-bounces@lists.01.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMTA6MTcgQU0gRGFuaWVsIExlemNhbm8KPGRhbmllbC5s
ZXpjYW5vQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gT24gMTQvMDUvMjAxOSAwOTo0OSwgU2VkYXQg
RGlsZWsgd3JvdGU6Cj4gPiBPbiBUdWUsIE1heSAxNCwgMjAxOSBhdCA4OjQzIEFNIERhbmllbCBM
ZXpjYW5vCj4gPiA8ZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiBbLi4uXQo+
ID4KPiA+PiBUaGUgbnhwLW5jaSBrZXJuZWwgbW9kdWxlIGlzIGxvYWRlZCBhbmQgbmVhcmQgaXMg
aW5zdGFsbGVkLgo+ID4KPiA+IFlvdSBoYXZlIHRvLi4uCj4gPgo+ID4gIyBtb2Rwcm9iZSAtdiBu
eHAtbmNpX2kyYwo+ID4KPiA+ICMgbHNtb2QgfCBlZ3JlcCAnbmZjfG5jaXxueHB8aTJjJyB8IHNv
cnQKPiA+IGkyY19hbGdvX2JpdCAgICAgICAgICAgMTYzODQgIDEgaTkxNQo+ID4gaTJjX2RldiAg
ICAgICAgICAgICAgICAyNDU3NiAgMAo+ID4gaTJjX2k4MDEgICAgICAgICAgICAgICAzMjc2OCAg
MAo+ID4gbmNpICAgICAgICAgICAgICAgICAgICA3NzgyNCAgMiBueHBfbmNpLG54cF9uY2lfaTJj
Cj4gPiBuZmMgICAgICAgICAgICAgICAgICAgMTMxMDcyICAxNiBuY2ksbnhwX25jaQo+ID4gbnhw
X25jaSAgICAgICAgICAgICAgICAxNjM4NCAgMSBueHBfbmNpX2kyYwo+ID4gbnhwX25jaV9pMmMg
ICAgICAgICAgICAxNjM4NCAgMAo+ID4gcmZraWxsICAgICAgICAgICAgICAgICAyODY3MiAgMTAg
bmZjLGJsdWV0b290aCx0aGlua3BhZF9hY3BpLGNmZzgwMjExCj4KPiBJIGhhdmUgdGhlIHNhbWUg
bW9kdWxlcyBleGNlcHQgJ3Jma2lsbCcKPgo+ID4gIyBtb2RpbmZvIG54cF9uY2lfaTJjCj4gPiBm
aWxlbmFtZToKPiA+IC9saWIvbW9kdWxlcy81LjEuMS0xLWFtZDY0LWluaXphL2tlcm5lbC9kcml2
ZXJzL25mYy9ueHAtbmNpL254cC1uY2lfaTJjLmtvCj4gPiBhdXRob3I6ICAgICAgICAgT2xlZyBa
aHVyYWtpdnNreXkgPG9sZWcuemh1cmFraXZza3l5QGludGVsLmNvbT4KPiA+IGF1dGhvcjogICAg
ICAgICBDbMOpbWVudCBQZXJyb2NoYXVkIDxjbGVtZW50LnBlcnJvY2hhdWRAbnhwLmNvbT4KPiA+
IGRlc2NyaXB0aW9uOiAgICBJMkMgZHJpdmVyIGZvciBOWFAgTkNJIE5GQyBjb250cm9sbGVycwo+
ID4gbGljZW5zZTogICAgICAgIEdQTAo+ID4gYWxpYXM6ICAgICAgICAgIGkyYzpueHAtbmNpX2ky
Ywo+ID4gYWxpYXM6ICAgICAgICAgIGFjcGkqOk5YUDc0NzE6Kgo+ID4gYWxpYXM6ICAgICAgICAg
IGFjcGkqOk5YUDEwMDE6Kgo+ID4gYWxpYXM6ICAgICAgICAgIG9mOk4qVCpDbnhwLG54cC1uY2kt
aTJjQyoKPiA+IGFsaWFzOiAgICAgICAgICBvZjpOKlQqQ254cCxueHAtbmNpLWkyYwo+ID4gZGVw
ZW5kczogICAgICAgIG5jaSxueHAtbmNpCj4gPiByZXRwb2xpbmU6ICAgICAgWQo+ID4gaW50cmVl
OiAgICAgICAgIFkKPiA+IG5hbWU6ICAgICAgICAgICBueHBfbmNpX2kyYwo+ID4gdmVybWFnaWM6
ICAgICAgIDUuMS4xLTEtYW1kNjQtaW5pemEgU01QIG1vZF91bmxvYWQgbW9kdmVyc2lvbnMKPgo+
IFNhbWUgcmVzdWx0IGZvciB0aGUgbW9kaW5mby4KPgo+IC0tLS0tCj4KPiBTbyB0aGUgZmlyc3Qg
dGltZSBJIHJ1bjoKPgo+IFttYXJrXQo+IG5mY3Rvb2wgLWQgbmZjMCAtcAo+IFN0YXJ0IHBvbGxp
bmcgb24gbmZjMCBhcyBpbml0aWF0b3IKPgo+IFdpdGggYW4gZXJyb3IgaW4gc3lzbG9nL2RtZXNn
Ogo+IG5jaTogbmNpX250Zl9wYWNrZXQ6IHVua25vd24gbnRmIG9wY29kZSAweDAKPgo+Cj4gVGhl
IHNlY29uZCB0aW1lOgo+Cj4gbmZjdG9vbCAtcCAtZCBuZmMwCj4gUHJvdG9jb2wgZXJyb3IKPgo+
IFdpdGggYW4gZXJyb3IgaW4gc3lzbG9nL2RtZXNnOgo+IG5jaTogbmNpX3N0YXJ0X3BvbGw6IGZh
aWxlZCB0byBzZXQgbG9jYWwgZ2VuZXJhbCBieXRlcwo+Cj4gVGhlbiBJIGRvOgo+Cj4gbmZjdG9v
bCAtMCAtZCBuZmMwCj4KPiBpdCByZXR1cm5zIHRvIHBvaW50IFttYXJrXQo+CgpJIGNhbm5vdCBo
ZWxwIHdpdGggKGRlYnVnZ2luZykgbmNpLgoKSSBoYWQgYWxsIEkyQyBhbmQgR1BJTyBkZWJ1ZyBL
Y29uZmlncyBlbmFibGVkIHRvIHNlZSBhIGJpdCBtb3JlCmluZm9ybWF0aW9ucyBpbiB0aGUgbG9n
cy4KTWF5YmUgdGhhdCBoZWxwcyB5b3UuCgotIFNlZGF0IC0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbmZjIG1haWxpbmcgbGlzdApMaW51eC1u
ZmNAbGlzdHMuMDEub3JnCmh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbmZjCg==
