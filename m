Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA1C1B4D6
	for <lists+linux-nfc@lfdr.de>; Mon, 13 May 2019 13:22:30 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 60E3B2126050C;
	Mon, 13 May 2019 04:22:28 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id B2F742194EB7B
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 04:22:26 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id d12so14771006wrm.8
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 04:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=qkb9DqnL9mnIE6zOdp6NJcmfQ54eK3ym+z4ZrIXH+i8=;
 b=ZXACPMjbpjxI5hdYko+h9+rnVSbFrw+kb3NB2Y0fLxLz8foEfMzckP6EAi1+mMtFzA
 7xUxrMQ4DJEW8MSfXD4It1Ozt4HlpTOcOl8/Uw0IRcmV7SumYJ5Y7YHj6lt0R646fDjY
 PNP8fP5gj8F8BAHHl47+KQeETT7j52THIs1k1e8bCTf8Z9YYmtqlK3wFQF2GYmUQZ4Ax
 vjUNuP5BcmoyUiilqqIfUC/+JvIqGgn/5yjd8rPSKj+OWGasjVj15h+iVtMnT1lep6lG
 crUdv/1aLCLX2Pj/RNCkCA4anvbkl6adnShn1/cv6tA9sOEFJh4XqIOQm99W5HZiVR2Z
 1ogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=qkb9DqnL9mnIE6zOdp6NJcmfQ54eK3ym+z4ZrIXH+i8=;
 b=jKtoE23pyo6BqyG4RBI0IOGXu5AuJozP99wsD9TAkNJN/8lKfKFWiCSyD0j2NUWec6
 H9wuPZ6cFkfgK30Ge7Fk/3/R4Unwz6vxzifJwKSEiyNBTC2+PJODxgMwFe8UfgAWZyv3
 WFu5z8El86AaI+Y4XcjZbxh+WAyiA4XJNEHaTRptmL+XRXMFkN18yW4FG0/H70FDXcCb
 lXavySEkogkv8ZG+TUWe+RodWDUZehCn1vVP1yMUiwwdcYYPBwiqUyOJ3bfrTT4JjbbX
 3mimcC/alwAYIpEkqKM/3ryCyEr9Eg42BX/VFusUd8YQ/aUUAJrgw+lTNgmME3jRsNi2
 No6g==
X-Gm-Message-State: APjAAAUdNmGIcRRs78GdGFQYNWJuRwPnD6e1PA+Wx1dabLnBwGCHPl1x
 Z2tecipx1RhV1AHp7SrYyiKTEpFb9Q6OsUt2kCw=
X-Google-Smtp-Source: APXvYqzLlMZOpoDQxozscgNM6RUugIjYWmMICLN7o87gYxklznn+z6RsiGhv+kBpjR/tzv0kwXHd7GTC+KqBEgW/7s4=
X-Received: by 2002:a5d:430f:: with SMTP id h15mr16837817wrq.132.1557746545346; 
 Mon, 13 May 2019 04:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUX+VNtk00YQnNYCnDeeH2Onq6s1vbdzYrv-OHf7q186Ww@mail.gmail.com>
 <154e3e74-38b5-850b-5993-295f9db8fe3c@intel.com>
 <CA+icZUWhBeup95PTP_k58xs8Lf2Ofqb0S_gkdBfbuc0-wdpF-w@mail.gmail.com>
 <06fbacb5-7739-1ca1-3bf4-8049a3ef019b@intel.com>
 <CA+icZUWJ0kZSqogg18LdP2YkNXk=_SNnT7-ufkd_Xp1ak7uchg@mail.gmail.com>
 <20190513095059.GN9224@smile.fi.intel.com>
 <CA+icZUWXSup0BfXNZXxcrAAbu-b9KCiBU++OkC+eFqacMrTwRg@mail.gmail.com>
 <20190513105745.GR9224@smile.fi.intel.com>
 <CA+icZUVDTx_ZUuOgHVDmg5_a4tgrRkPp880+0KPaRJ1d=zF5VQ@mail.gmail.com>
In-Reply-To: <CA+icZUVDTx_ZUuOgHVDmg5_a4tgrRkPp880+0KPaRJ1d=zF5VQ@mail.gmail.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 13 May 2019 13:22:13 +0200
Message-ID: <CA+icZUWFKfO_1O6QLiy__tOo2m=v+hmG+rsaO+MpuXsvHOFXPw@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: linux-wireless@vger.kernel.org, linux-nfc@lists.01.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-nfc-bounces@lists.01.org
Sender: "Linux-nfc" <linux-nfc-bounces@lists.01.org>

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMToyMCBQTSBTZWRhdCBEaWxlayA8c2VkYXQuZGlsZWtA
Z21haWwuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgTWF5IDEzLCAyMDE5IGF0IDEyOjU3IFBNIEFu
ZHkgU2hldmNoZW5rbwo+IDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3Rl
Ogo+ID4KPiA+IE9uIE1vbiwgTWF5IDEzLCAyMDE5IGF0IDEyOjM4OjI3UE0gKzAyMDAsIFNlZGF0
IERpbGVrIHdyb3RlOgo+ID4gPiBPbiBNb24sIE1heSAxMywgMjAxOSBhdCAxMTo1MSBBTSBBbmR5
IFNoZXZjaGVua28KPiA+ID4gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3Jv
dGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBNb24sIE1heSAxMywgMjAxOSBhdCAxMToyNzowN0FNICsw
MjAwLCBTZWRhdCBEaWxlayB3cm90ZToKPiA+ID4gPgo+ID4gPiA+ID4gU29ycnkgdG8gc2F5LCBJ
IHN0aWxsIGhhdmUgbm90IGdldCBhbGwgY29ycmVsYXRpb25zLi4uCj4gPiA+ID4KPiA+ID4gPiBD
YW4geW91IHByb3ZpZGUgdGhlIG91dHB1dCBvZiB0aGUgZm9sbG93aW5nIG9uIHJ1bm5pbmcgTGlu
dXggc3lzdGVtIHdpdGggbGF0ZXN0Cj4gPiA+ID4gcG9zc2libGUga2VybmVsIHlvdSBjYW4gaW5z
dGFsbCAoSSBhbSBleHBlY3RpbmcgdjUuMSkgYW5kIGNvbW1hbmQgbGluZSB3aXRoCj4gPiA+ID4g
J2lnbm9yZV9sb2dsZXZlbCc/Cj4gPiA+ID4KPiA+ID4gPiAxLiBgZG1lc2dgCj4gPiA+ID4gMi4g
YGdyZXAgLUggMTUgL3N5cy9idXMvYWNwaS9kZXZpY2VzLyovc3RhdHVzYAo+ID4gPiA+IDMuIGBh
Y3BpZHVtcCAtbyB0NDcwLXRhYmxlcy5kYXRgICMgdGhlIGZpbGUgdDQ3MC10YWJsZXMuZGF0Cj4g
PiA+ID4gNC4gYGxzcGNpIC12diAtbmtgCj4gPiA+ID4KPiA+ID4gPiBQLlMuIFlvdSBtYXkgdXNl
IEdpdEh1YiBnaXN0IGZvciB0aGlzIHNldCAocGxlYXNlLCBkb24ndCBzaGFyZSBhcmNoaXZlcykg
b3IgYW55Cj4gPiA+ID4gb3RoZXIgcmVzb3VyY2UgbGlrZSBwYXN0ZWJpbi4KPiA+ID4gPgo+ID4g
Pgo+ID4gPiBMb29rcyBsaWtlIEkgYW0gdW5hYmxlIHRvIHVzZSBEZWJpYW4ncyBnaXN0LXBhc3Rl
IHBhY2thZ2UgdG9kYXkgb3IKPiA+ID4gbmVlZCBtb3JlIGNvZmZlZS4KPiA+ID4KPiA+ID4gU28s
IEkgYWRkIHRoaXMgaGVyZS4KPiA+ID4KPiA+ID4gSSBhZGRlZCBteSBrZXJuZWwtY29uZmlnLgo+
ID4KPiA+Cj4gPiBUaGFua3MuIEkganVzdCBzZW50IGEgc2VyaWVzIHRvIChob3BlZnVsbHkpIHN1
cHBvcnQgaXQgaW4gdGhlIHZhbmlsbGEga2VybmVsLgo+ID4gQ2FuIHlvdSB0ZXN0IGl0Pwo+ID4K
PiA+IFAuUy4gSSBzZWUgaW4gZG1lc2cgdGhlIHBuNTQ0IHRyaWVzIHRvIGJpbmQgdG8gdGhlIE5Y
UDEwMDEuIERvIHlvdSBoYXZlIHNvbWUKPiA+IGN1c3RvbSBwYXRjaGVzIGZvciB0aGF0IGluIHlv
dXIga2VybmVsPyBJZiBzbywgcGxlYXNlIGRyb3AgdGhlbS4KPiA+Cj4KPiBIaSBBbmR5LAo+Cj4g
dGhpcyBsb29rcyBwcm9taXNpbmchCj4KPiBJIGhhdmUgYXR0YWNoZWQgdjIgb2YgdGhlIGRpc2ly
ZWQgb3V0cHV0cy4KPgoKT3V0cHV0IG9mIG1vZGluZm8gbG9va3MgZ29vZCB0byBtZQoKcm9vdEBp
bml6YTp+IyBtb2RpbmZvIG54cC1uY2lfaTJjCmZpbGVuYW1lOgovbGliL21vZHVsZXMvNS4xLjEt
MS1hbWQ2NC1nY2M4LWxkYmZkL2tlcm5lbC9kcml2ZXJzL25mYy9ueHAtbmNpL254cC1uY2lfaTJj
LmtvCmF1dGhvcjogICAgICAgICBPbGVnIFpodXJha2l2c2t5eSA8b2xlZy56aHVyYWtpdnNreXlA
aW50ZWwuY29tPgphdXRob3I6ICAgICAgICAgQ2zDqW1lbnQgUGVycm9jaGF1ZCA8Y2xlbWVudC5w
ZXJyb2NoYXVkQG54cC5jb20+CmRlc2NyaXB0aW9uOiAgICBJMkMgZHJpdmVyIGZvciBOWFAgTkNJ
IE5GQyBjb250cm9sbGVycwpsaWNlbnNlOiAgICAgICAgR1BMCmFsaWFzOiAgICAgICAgICBpMmM6
bnhwLW5jaV9pMmMKYWxpYXM6ICAgICAgICAgIGFjcGkqOk5YUDc0NzE6KgphbGlhczogICAgICAg
ICAgYWNwaSo6TlhQMTAwMToqCmFsaWFzOiAgICAgICAgICBvZjpOKlQqQ254cCxueHAtbmNpLWky
Y0MqCmFsaWFzOiAgICAgICAgICBvZjpOKlQqQ254cCxueHAtbmNpLWkyYwpkZXBlbmRzOiAgICAg
ICAgbmNpLG54cC1uY2kKcmV0cG9saW5lOiAgICAgIFkKaW50cmVlOiAgICAgICAgIFkKbmFtZTog
ICAgICAgICAgIG54cF9uY2lfaTJjCnZlcm1hZ2ljOiAgICAgICA1LjEuMS0xLWFtZDY0LWdjYzgt
bGRiZmQgU01QIG1vZF91bmxvYWQgbW9kdmVyc2lvbnMKCi0gU2VkYXQgLQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1uZmMgbWFpbGluZyBsaXN0
CkxpbnV4LW5mY0BsaXN0cy4wMS5vcmcKaHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1uZmMK
