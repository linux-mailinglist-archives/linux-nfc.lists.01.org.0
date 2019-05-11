Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 891151A7F3
	for <lists+linux-nfc@lfdr.de>; Sat, 11 May 2019 15:28:16 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 0995B2126D836;
	Sat, 11 May 2019 06:28:14 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=oleg.zhurakivskyy@intel.com; receiver=linux-nfc@lists.01.org 
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id 57D742126D832
 for <linux-nfc@lists.01.org>; Sat, 11 May 2019 06:28:12 -0700 (PDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 May 2019 06:28:11 -0700
X-ExtLoop1: 1
Received: from ozhuraki-desk.fi.intel.com (HELO [10.237.67.35])
 ([10.237.67.35])
 by orsmga006.jf.intel.com with ESMTP; 11 May 2019 06:28:09 -0700
To: sedat.dilek@gmail.com
References: <CA+icZUX+VNtk00YQnNYCnDeeH2Onq6s1vbdzYrv-OHf7q186Ww@mail.gmail.com>
 <154e3e74-38b5-850b-5993-295f9db8fe3c@intel.com>
 <CA+icZUWhBeup95PTP_k58xs8Lf2Ofqb0S_gkdBfbuc0-wdpF-w@mail.gmail.com>
From: Oleg Zhurakivskyy <oleg.zhurakivskyy@intel.com>
Message-ID: <06fbacb5-7739-1ca1-3bf4-8049a3ef019b@intel.com>
Date: Sat, 11 May 2019 16:27:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+icZUWhBeup95PTP_k58xs8Lf2Ofqb0S_gkdBfbuc0-wdpF-w@mail.gmail.com>
Content-Language: en-US
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-wireless@vger.kernel.org, linux-nfc@lists.01.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-nfc-bounces@lists.01.org
Sender: "Linux-nfc" <linux-nfc-bounces@lists.01.org>

CkhpIFNlZGF0LAoKT24gNS8xMC8xOSAxMDo0MCBQTSwgU2VkYXQgRGlsZWsgd3JvdGU6Cgo+IENh
biB5b3UgZ3VpZGUgbWUgaG93IHRvIGRvIHRoYXQ/CgpJIHRyeSBhbmQgdGhlbiBkZWNpZGUgd2hl
dGhlciB0aGlzIGlzIGhlbHAgb3Igbm90LgoJCklmIEkgcmVtZW1iZXIgY29ycmVjdGx5LCBzdXBw
b3J0IGZvciBQTjU0NyB3YXMgZG9uZSBieSBtdWx0aXBsZSBwYXJ0aWVzIGZvciBzb21lIEJyb2Fk
d2VsbCBiYXNlZCBkZXNpZ25zIHRocm91Z2ggdGhlIHVwc3RyZWFtLCBib3RoIG9uIHRoZSBrZXJu
ZWwgYW5kIG5lYXJkIHNpZGUuCgpBc3N1bWluZyB0aGUgaW50ZWdyYXRpb24gZGV0YWlscyBvZiBQ
TjU0NyBkaWRu4oCZdCBkZXZpYXRlIG11Y2gsIHRoaXMgbWlnaHQgYmU6CgotIEZyb20gcmVsYXRp
dmVseSBzaW1wbGUsIGkuZS4gZ2V0dGluZyB0aGUgcmVsZXZhbnQgZGF0YSBmcm9tIEFDUEkgYW5k
IGhpbnRpbmcgdGhlIGtlcm5lbC9kcml2ZXIgd2l0aCBhIG1pbmltYWxseSBzdWZmaWNpZW50IGNo
YW5nZXMuIE1vc3QgbGlrZWx5LCBvbmNlIHlvdSBzb3J0IHRoZSBiYXNpYyBkZXRhaWxzIChpMmMs
IGdwaW8sIGV0YyksIGV2ZXJ5dGhpbmcgd291bGQganVzdCB3b3JrLgoKLSBUbyBtb3JlIGxhYm9y
aW91cyBhbmQgd291bGQgcmVxdWlyZSBhIHdvcmtpbmcgYW5kIGlkZWFsbHkgb3BlbiBzb3VyY2Ug
cmVmZXJlbmNlLiBBbiBvcHRpb24gaGVyZSBtaWdodCBiZSBCcm9hZHdlbGwgYmFzZWQgQ2hyb21l
Ym9va3Mgd2l0aCBQTjU0NyAoanVzdCBub3Qgc3VyZSB3aGV0aGVyIHBsYWluIG9yIE9FTXMpLgoK
UmVnYXJkcywKT2xlZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1uZmMgbWFpbGluZyBsaXN0CkxpbnV4LW5mY0BsaXN0cy4wMS5vcmcKaHR0cHM6
Ly9saXN0cy4wMS5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1uZmMK
