Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3C91C820
	for <lists+linux-nfc@lfdr.de>; Tue, 14 May 2019 14:04:15 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E034A21256BDF;
	Tue, 14 May 2019 05:04:13 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id 07F6C2124B90F
 for <linux-nfc@lists.01.org>; Tue, 14 May 2019 05:04:11 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id e15so6509956wrs.4
 for <linux-nfc@lists.01.org>; Tue, 14 May 2019 05:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=l7WDIT3xdi0gOSJQozDJ4q2UDbYV5Prpi350z/iT3mg=;
 b=K0uSptrdkId+Sb6Kw/D1WArRSbnA2B6DCCEYBp97NU68hoWX4m6qESepNGcrNacyCU
 OfT5Cax7tQ1/WUdA4FPvI9mqJNZe4im2jOBKMN7VfUWfcjretcWGJ10ijkg2mHJW0g8q
 eNHcLaHC4PBy1B3o9DL7Whv3CtV17EfHC6LerqziYDcUf8SU+Sz4kEjqtbNfAJvYbCSo
 ugFH0Y5JOel9ftLLAGWFCIe3U8b/9YzYDh3gc3phDiJouJUlyFFtGwKl3O5EHxRmnmkY
 n4/k+PWpD7+6L8/CNpiJBSn3Qj+FAyypVtSjJWZqeyD/oWaa0G85/t1wSM6S1iAMiWDY
 wesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=l7WDIT3xdi0gOSJQozDJ4q2UDbYV5Prpi350z/iT3mg=;
 b=nSKx7QpPjANRM1yvWoDTB95OL2An0gqLR2zddEJtzpIObEzM+ecjwRz2CJ70vISh4n
 5OPZNae5pi/L5GPLWNM4KKFVJbb2sj0/18wIb2zudFl78YzIWdxFS/URQ6jJyUaPi/bv
 6X9NWE543qMzXuuk2mXPHQ38FKCzvmW38uWEItDyt7bfdW5XVH2IBVy7TCBo1jhbxNGv
 tvgncnyGtTjY+391Jm8w8swHaFTWe6MKLazaDu/RstRHG2KV5ex1l66Ug8DlCELXulEj
 BsMl5G9jhONjDC/FpubRPyl/N3RsYjMEes8S3k3MJbHIyqrleFuNhEn29MuWXjxzdxlQ
 dX5g==
X-Gm-Message-State: APjAAAXce6FTwOtL5iqcrXnvFBAAs2JlTGCwbe+vvj5kHz45FR1cg8zH
 XWZfET8GuKxRVYsh/1PJFfn4rn8PTNj3tLzemZY=
X-Google-Smtp-Source: APXvYqx0coIeaiX7HouucYZfPpqoG4VHiTzn75fcd8lm77jsnx6iC4l5IQ1i+ZD+bG9JpPvJyldZGxr/MpXkpL2kQ+c=
X-Received: by 2002:adf:dc4b:: with SMTP id m11mr22090810wrj.66.1557835450452; 
 Tue, 14 May 2019 05:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190513104358.59716-1-andriy.shevchenko@linux.intel.com>
 <CA+icZUV_g5mJnmHQKZgtcPj3YfZSYp1DQJT9tmi+892AzRCm3A@mail.gmail.com>
 <20190513123751.GS9224@smile.fi.intel.com>
 <CA+icZUUA8TfU--6b+RwXMf=ui7ww0DK=EurzdMeDUkGvwcJ_rg@mail.gmail.com>
 <2d39b39b-27eb-abef-747f-400433daefee@intel.com>
In-Reply-To: <2d39b39b-27eb-abef-747f-400433daefee@intel.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 14 May 2019 14:03:58 +0200
Message-ID: <CA+icZUW6vttB8EvgBZYi3kT7uhcbQr+baYbif_V6D78ZNEDbHQ@mail.gmail.com>
To: Oleg Zhurakivskyy <oleg.zhurakivskyy@intel.com>
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
 Charles Gorand <charles.gorand@effinnov.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-nfc-bounces@lists.01.org
Sender: "Linux-nfc" <linux-nfc-bounces@lists.01.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMTo0NSBQTSBPbGVnIFpodXJha2l2c2t5eQo8b2xlZy56
aHVyYWtpdnNreXlAaW50ZWwuY29tPiB3cm90ZToKPgo+Cj4gT24gNS8xNC8xOSAxMTozNCBBTSwg
U2VkYXQgRGlsZWsgd3JvdGU6Cj4KPiA+IEFtIEkgY29ycmVjdCB0aGF0ICJOUEMxMDAiIGlzICJQ
TjU0NyIgYW5kICJOUEMzMDAiIGlzICJQTjU0OCI/Cj4KPiBZZXMsIE5QQzEwMCBpcyBQTjU0Ny4K
Pgo+IERvbuKAmXQga25vdyBvbiBOUEMzMDAsIGJ1dCBhIHF1aWNrIHdlYiBzZWFyY2ggcmV2ZWFs
cyBpdOKAmXMgUE41NDguCj4KPiBNaWdodCBpdCBtYWtlIHNlbnNlIHRvIGRyb3AgTlBDLi4uIGFu
ZCB0byBrZWVwIGp1c3QgdGhlIGNoaXAgbmFtZXMgaW4gS2NvbmZpZz8KPgoKVGhhbmtzIGZvciB0
aGUgY2xhcmlmaWNhdGlvbi4KCkkgZm91bmQgTlhQIE5QQzMwMCB3aW5kb3dzIGRyaXZlciBmcm9t
IExlbm92bydzIHN1cHBvcnQgd2Vic2l0ZSAtIG5vdApvbiB0aGUgc3VwcG9ydCB3ZWJzaXRlcyBm
b3IgVGhpbmtQYWQgVDQ3MCBidXQgZm9yIG90aGVyIFRoaW5rUGFkcyBsaWtlClQ0ODAuCkl0J3Mg
dGhlIHNhbWUgZHJpdmVyIGFuZCBieSBhY2NpZGVudCBJIGNvdWxkIHVwZGF0ZSB2aWEgTWljcm9z
b2Z0CmRldmljZS1tYW5hZ2VyIHRvIHZlcnNpb24gMTIuMC40LjAuCgpTbyBpZiB5b3Ugc2VhcmNo
IGluIHRoZSBXaWxkIFdpbGQgV2ViIGZvciBhIExpbnV4IGRyaXZlciBhbmQgaGF2ZSB0aGUKaW5m
b3JtYXRpb24gIk5YUCBOUEMzMDAiLCB5b3Ugd2lsbCBmaW5kIGl0LgpJdCdzIGdvb2QgdG8ga2Vl
cCBib3RoIGluZm9ybWF0aW9ucyAtIHByZWZlcmFibGUgcHV0IHRoZW0gaW50byB0aGUKS2NvbmZp
ZyBoZWxwIHRleHQ/CgotIFNlZGF0IC0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbmZjIG1haWxpbmcgbGlzdApMaW51eC1uZmNAbGlzdHMuMDEu
b3JnCmh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbmZjCg==
