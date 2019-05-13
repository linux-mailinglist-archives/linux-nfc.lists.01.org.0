Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EC41B2D6
	for <lists+linux-nfc@lfdr.de>; Mon, 13 May 2019 11:27:25 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 45DAA2125ADCA;
	Mon, 13 May 2019 02:27:23 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id 58B6121BADAB2
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 02:27:21 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id r4so14355077wro.10
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 02:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=9bk6EauoZZs35rRixLFtmrIOLz8P6rskznTT13qGWUE=;
 b=rE1MPjn8y2XTA+LFJ+qVbOEtR9+6U8H+FbjzLeKlUmgomJxh85cFdFaA0FNZO90NdM
 7OI8o/zRCY51M8I4MFPCzcvdm/AhHU1n6BKBPebVCKJG3HCU2XN+1LV0MvvA36uGm+jl
 MUUU0Jx5Tt+qhTF675136mDp0o3VM3kVGeRYYlghq0i8uuIfh69foGefuXYJNap/zKf2
 0RPlz5bZZ2d1Rs6StBjIzLvzyE6ArMDSck5tTqjrl/4rH5ZsXB+jEmy3h11gJXtMbI+6
 XumKjpC1n52t0nDV+/raCav2qSC86/FjKb8n0zYKY4QOY9JhjJvmyiD9DC18ewzgBwSN
 t+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=9bk6EauoZZs35rRixLFtmrIOLz8P6rskznTT13qGWUE=;
 b=LsmmU7YybQZv3QGLUgtY8XiOnUrqAJMBe6/z7sPrsRhFokh1wMzLlsjOB30UwpPV7G
 WCasJM6WvORmvxvr+zsLU0edwbjo6DJX6Ep+gxj3t4JIAuJew0J61gNU8GhEs/QaJCXb
 q1Ul7y7vUOSe3EJNMn5M2fkDhuS1BpmeOvZS4Ybsz+JkKN8z2ZGGejrkmoaOPePoLI2E
 8LK0lwiSM1bo/Mh+lFEf+TKIMvIWqOacEc3OKfuzcLnpLR0tXyyfNQK3SJnfxH37srwE
 fHLneE4W9Rf6nSXFhbw54vOk6Sf0JVZnU5YZ0TLffGOBYtD5zYM/DNeCT5+ChzR6fwVs
 G8Gw==
X-Gm-Message-State: APjAAAVavZ6wUhJnYTCArLuFFdd4TKeuOe7QiG/nfiSLrbm3nDU8i/Cz
 cgtqe68OekbecKga3Z2oLkBrn9Vr6AbnM6LW05o=
X-Google-Smtp-Source: APXvYqzwG/66abezFY+5is0yn7ttbCPQ0RRnaohq1EV0D0+92NLiqI4SvZ+iMS2nzrjaTAKaaxLFKmH9M3FcmeOfrh0=
X-Received: by 2002:adf:dd0d:: with SMTP id a13mr11257110wrm.153.1557739639328; 
 Mon, 13 May 2019 02:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUX+VNtk00YQnNYCnDeeH2Onq6s1vbdzYrv-OHf7q186Ww@mail.gmail.com>
 <154e3e74-38b5-850b-5993-295f9db8fe3c@intel.com>
 <CA+icZUWhBeup95PTP_k58xs8Lf2Ofqb0S_gkdBfbuc0-wdpF-w@mail.gmail.com>
 <06fbacb5-7739-1ca1-3bf4-8049a3ef019b@intel.com>
In-Reply-To: <06fbacb5-7739-1ca1-3bf4-8049a3ef019b@intel.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 13 May 2019 11:27:07 +0200
Message-ID: <CA+icZUWJ0kZSqogg18LdP2YkNXk=_SNnT7-ufkd_Xp1ak7uchg@mail.gmail.com>
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

T24gU2F0LCBNYXkgMTEsIDIwMTkgYXQgMzoyOCBQTSBPbGVnIFpodXJha2l2c2t5eQo8b2xlZy56
aHVyYWtpdnNreXlAaW50ZWwuY29tPiB3cm90ZToKPgo+Cj4gSGkgU2VkYXQsCj4KPiBPbiA1LzEw
LzE5IDEwOjQwIFBNLCBTZWRhdCBEaWxlayB3cm90ZToKPgo+ID4gQ2FuIHlvdSBndWlkZSBtZSBo
b3cgdG8gZG8gdGhhdD8KPgo+IEkgdHJ5IGFuZCB0aGVuIGRlY2lkZSB3aGV0aGVyIHRoaXMgaXMg
aGVscCBvciBub3QuCj4KPiBJZiBJIHJlbWVtYmVyIGNvcnJlY3RseSwgc3VwcG9ydCBmb3IgUE41
NDcgd2FzIGRvbmUgYnkgbXVsdGlwbGUgcGFydGllcyBmb3Igc29tZSBCcm9hZHdlbGwgYmFzZWQg
ZGVzaWducyB0aHJvdWdoIHRoZSB1cHN0cmVhbSwgYm90aCBvbiB0aGUga2VybmVsIGFuZCBuZWFy
ZCBzaWRlLgo+Cj4gQXNzdW1pbmcgdGhlIGludGVncmF0aW9uIGRldGFpbHMgb2YgUE41NDcgZGlk
buKAmXQgZGV2aWF0ZSBtdWNoLCB0aGlzIG1pZ2h0IGJlOgo+Cj4gLSBGcm9tIHJlbGF0aXZlbHkg
c2ltcGxlLCBpLmUuIGdldHRpbmcgdGhlIHJlbGV2YW50IGRhdGEgZnJvbSBBQ1BJIGFuZCBoaW50
aW5nIHRoZSBrZXJuZWwvZHJpdmVyIHdpdGggYSBtaW5pbWFsbHkgc3VmZmljaWVudCBjaGFuZ2Vz
LiBNb3N0IGxpa2VseSwgb25jZSB5b3Ugc29ydCB0aGUgYmFzaWMgZGV0YWlscyAoaTJjLCBncGlv
LCBldGMpLCBldmVyeXRoaW5nIHdvdWxkIGp1c3Qgd29yay4KPgo+IC0gVG8gbW9yZSBsYWJvcmlv
dXMgYW5kIHdvdWxkIHJlcXVpcmUgYSB3b3JraW5nIGFuZCBpZGVhbGx5IG9wZW4gc291cmNlIHJl
ZmVyZW5jZS4gQW4gb3B0aW9uIGhlcmUgbWlnaHQgYmUgQnJvYWR3ZWxsIGJhc2VkIENocm9tZWJv
b2tzIHdpdGggUE41NDcgKGp1c3Qgbm90IHN1cmUgd2hldGhlciBwbGFpbiBvciBPRU1zKS4KPgoK
QnkgY2xvbmluZyB0aGUgZHJpdmVyIGZyb20gWzFdIHdoaWNoIGVuaGFuY2VzIHRoZSBvcmlnaW5h
bCBkcml2ZXIgWzFdCndpdGggQUNQSSBzdXBwb3J0IGFuZCBhdXRvLWRldGVjdGluZy9hdXRvLWNv
bmZpZ3VyaW5nIHRoZSAiTlhQIDEwMDEiCmRldmljZSAoc2VlIFsxXSBhbmQgWzJdKS4uLgoKLi4u
YW5kIHVzaW5nIE5YUCdzIGxpYm5mYy1uY2kuLi4KCmNvbmZpZ3VyZS1saW5lOiBQUkVGSVg9Ii9v
cHQvbGlibmZjLW5jaSIgOyAuL2NvbmZpZ3VyZQotLXByZWZpeD0iJFBSRUZJWCIgLS1lbmFibGUt
aTJjIC0tZW5hYmxlLWRlYnVnCgouLi5hbmQgZW5hYmxpbmcgYWxsIGF2YWlsYWJsZSBkZWJ1ZyBv
cHRpb25zIGluIHRoZSBwcm92aWRlZCAqLmNvbmYKZmlsZXMgaW4gL3Vzci9sb2NhbC9ldGMvLi4u
CgouLi5lbiBwbHVzIEkgaGF2ZSBhY3RpdmF0ZWQgYWxsIHNvcnQgb2YgSTJDIGFuZCBHUElPIGRl
YnVnIGtlcm5lbCBvcHRpb25zLi4uCgouLi5JIHdhcyBhYmxlIHRvIHJ1biB0aGUgZGVtby1hcHAu
Li4KCiMgL29wdC9saWJuZmMtbmNpL3NiaW4vbmZjRGVtb0FwcCBwb2xsIDI+JjEgfCB0ZWUgL3Rt
cC9uZmNEZW1vQXBwLXBvbGwudHh0CgpXaGlsZSBpbiBwb2xsaW5nIG1vZGUsIEkgdGhyZXcgbXkg
WXViaUtleSBvbiB0aGUgTkZDIGRldmljZSBvbiBteQpMZW5vdm8gVGhpbmtQYWQgVDQ3MCBhbmQg
c2VlLi4uCgpOeHBUbWw6ICAgICBQTjU0WCAtIEkyQyBSZWFkIHN1Y2Nlc3NmdWwuLi4uLgoKTnhw
TmNpUjogICAgIGxlbiA9ICA0NCA+CjYxMDUyOTAxMDIwNDAwRkYwMTBDNDQwMDA3MjcwMDAwMDA5
MkQzNDkwMTIwMDAwMDAwMTIxMTc4QjM4NDAwODA3M0MwMjFDMDU3NTk3NTYyNjk0QjY1NzkKTnhw
VG1sOiAgICAgUE41NFggLSBQb3N0aW5nIHJlYWQgbWVzc2FnZS4uLi4uCgpOeHBIYWw6ICAgICBy
ZWFkIHN1Y2Nlc3NmdWwgc3RhdHVzID0gMHgwCk54cEhhbDogICAgIE54cE5jaTogUkYgSW50ZXJm
YWNlID0gSVNPLURFUApOeHBIYWw6ICAgICBOeHBOY2k6IFByb3RvY29sID0gSVNPLURFUApOeHBI
YWw6ICAgICBOeHBOY2k6IE1vZGUgPSBBIFBhc3NpdmUgUG9sbApOeHBGdW5jOiAgICBOZmNBZGFw
dGF0aW9uOjpIYWxEZXZpY2VDb250ZXh0RGF0YUNhbGxiYWNrOiBsZW49NDQKTnhwRnVuYzogICAg
TnhwVG1sOiAgICAgUE41NFggLSBSZWFkIHJlcXVlc3RlZC4uLi4uCgpUaGVuIEkgY2hlY2tlZCB3
aGF0IHRoZSB2YWx1ZS4uLgoKSEVYOiA2MTA1MjkwMTAyMDQwMEZGMDEwQzQ0MDAwNzI3MDAwMDAw
OTJEMzQ5MDEyMDAwMDAwMDEyMTE3OEIzODQwMDgwNzNDMDIxQzA1NzU5NzU2MjY5NEI2NTc5Cgou
Li5tZWFucyBpbiBBU0NJSS4uLgoKJCBjdXQgLWMgMTEtIEhFWC50eHQgfCB4eGQgLXIgLXAK77+9
CiBEJ++/ve+/vUkgeO+/ve+/ve+/vXPvv70h77+9V1l1YmlLZXkKClNvLCB0aGlzIHNlZW1zIHRv
IHdvcmsuCgpJIHN0aWxsIGhhdmUgbm8gZ2x1ZSBob3cgdG8gdXNlIHRoaXMgZXhwZXJpZW5jZSBp
biBMaW51eCB0byB1c2UgTkZDCmFuZCBlc3BlY2lhbGx5IG15IFl1YmlLZXkuCgpUaGUgYmluYXJp
ZXMgcHJvdmlkZWQgYnkgRGViaWFuJ3MgbGlibmZjLWJpbiBkbyBub3Qgd29yay4KClNvcnJ5IHRv
IHNheSwgSSBzdGlsbCBoYXZlIG5vdCBnZXQgYWxsIGNvcnJlbGF0aW9ucy4uLgoKLSBTZWRhdCAt
CgpbMF0gaHR0cHM6Ly9naXRodWIuY29tL25mYy10b29scy9saWJuZmMvaXNzdWVzLzQ1NQpbMV0g
aHR0cHM6Ly9naXRodWIuY29tL05YUE5GQ0xpbnV4L254cC1wbjV4eApbMl0gaHR0cHM6Ly9naXRo
dWIuY29tL2pyNjQvbnhwLXBuNXh4ClszXSBodHRwczovL2dpdGh1Yi5jb20vTlhQTkZDTGludXgv
bnhwLXBuNXh4L2lzc3Vlcy8yMApbNF0gaHR0cHM6Ly9naXRodWIuY29tL05YUE5GQ0xpbnV4L2xp
bnV4X2xpYm5mYy1uY2kKWzVdIGh0dHBzOi8vd3d3LnJhcGlkdGFibGVzLmNvbS9jb252ZXJ0L251
bWJlci9oZXgtdG8tYXNjaWkuaHRtbApbNl0gaHR0cHM6Ly9zdXBlcnVzZXIuY29tL3F1ZXN0aW9u
cy8yNDQwMjUvdG9vbC10by1jb252ZXJ0LWEtZmlsZS1vZi1oZXgtdG8tYXNjaWktY2hhcmFjdGVy
LXNldApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1uZmMgbWFpbGluZyBsaXN0CkxpbnV4LW5mY0BsaXN0cy4wMS5vcmcKaHR0cHM6Ly9saXN0cy4w
MS5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1uZmMK
