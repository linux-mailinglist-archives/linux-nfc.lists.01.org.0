Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 171451C422
	for <lists+linux-nfc@lfdr.de>; Tue, 14 May 2019 09:49:17 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 9418B212746D5;
	Tue, 14 May 2019 00:49:15 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id 34C392125330C
 for <linux-nfc@lists.01.org>; Tue, 14 May 2019 00:49:13 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id 198so1711197wme.3
 for <linux-nfc@lists.01.org>; Tue, 14 May 2019 00:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=wkkzAeBSr5IRd0ouYGcN8bTsUi6rqw1eAt0fzyLJGqo=;
 b=O2ajfBiF1g7f+4WhobB597W1hFAP9PeQ3g0JbVYTY9UIGeEzrAWtGo2zcaMh1z2NTi
 m+iYSYE2ODjEftC91g4adKCsiuL20/0seMd03et1oxjEESgtgCfLhNfKh6GX702eaz5H
 615G4qiS3ZObEm85EOSWWU4h8E+K0Rz7HZYEJH6J1Dquo6GDFAR2dtQSifsO0yxHuPWk
 4xL4m1jcVTYrm3whtKfA/PwcuXsoBks7xYAK1LVdMlAnYbMds33pU8ln5hNGerDCzxNu
 jN39595hXGCsrMOsLtPC04AkYx2EKP5l2Ph3QLuBDyU1SsilQUo8WP9GbOqMet+01egY
 PBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=wkkzAeBSr5IRd0ouYGcN8bTsUi6rqw1eAt0fzyLJGqo=;
 b=ildB9PiMgH0z2s53ghuoMTwurZshSPHwq5YdNAxThOUW+RfWhmVEkRB2VFnScUYhNJ
 zv7+CjMJ4HjOzM3C0v/KjXYmnQMr0kTpb8PdxuQWqVzssD6x8myx/RAWdqHIZywOv56S
 VhtM+i6mJVF+4xFrGQG/mz+w3iAzsOpWty0/U22svSdquHlrJZJEm4LHWYKC8LQHv/6K
 TuBplOL7Tw8PHvc3x62c5GZADMTAscT5gI3JaJ3OEN9rYK2Iek48RrghyCL0Dc0kfEfd
 h0znEuYLE+GC9CMmfDjcrKpgKB0KTs3AbkSYU7cMGcmOSwyPNpg3uSUhVbLk6+Ynj4rb
 2Tbw==
X-Gm-Message-State: APjAAAXJl3j9v0mBPSWI95si7NiySGiQ2kmBdFCK0q/1kaxk1Oj+9kuc
 i5TjP1DqMXk9DGcs0ZPZvNwrrpgtOD4SJKMBv1E=
X-Google-Smtp-Source: APXvYqynBEUp3Zq7Rai7hX7keATr438iv01j+6V/KgW7GTohdi+mVPWR1KhZBOluJh4jaP8WpKnST4SBjGUNDIeZCVs=
X-Received: by 2002:a7b:cc12:: with SMTP id f18mr18740855wmh.40.1557820152337; 
 Tue, 14 May 2019 00:49:12 -0700 (PDT)
MIME-Version: 1.0
References: <c2d0d19f-d814-8f41-4860-77b9cc7f9d26@linaro.org>
 <CA+icZUVz7sB6hv4fhL_rqhR_D8RePBJFXk1PaUy5tMw2z4xC_Q@mail.gmail.com>
 <5ae87449-83a1-ecce-c72c-b4742c507497@linaro.org>
In-Reply-To: <5ae87449-83a1-ecce-c72c-b4742c507497@linaro.org>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 14 May 2019 09:49:01 +0200
Message-ID: <CA+icZUXDLQKyTH-_pPi7A2=Bu5ratwab930Fcecrdr4NtMnFcw@mail.gmail.com>
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
Cc: robert.dolca@intel.com, linux-nfc@lists.01.org,
 linux-wireless@vger.kernel.org, charles.gorand@effinnov.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-nfc-bounces@lists.01.org
Sender: "Linux-nfc" <linux-nfc-bounces@lists.01.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgODo0MyBBTSBEYW5pZWwgTGV6Y2Fubwo8ZGFuaWVsLmxl
emNhbm9AbGluYXJvLm9yZz4gd3JvdGU6ClsuLi5dCgo+IFRoZSBueHAtbmNpIGtlcm5lbCBtb2R1
bGUgaXMgbG9hZGVkIGFuZCBuZWFyZCBpcyBpbnN0YWxsZWQuCgpZb3UgaGF2ZSB0by4uLgoKIyBt
b2Rwcm9iZSAtdiBueHAtbmNpX2kyYwoKIyBsc21vZCB8IGVncmVwICduZmN8bmNpfG54cHxpMmMn
IHwgc29ydAppMmNfYWxnb19iaXQgICAgICAgICAgIDE2Mzg0ICAxIGk5MTUKaTJjX2RldiAgICAg
ICAgICAgICAgICAyNDU3NiAgMAppMmNfaTgwMSAgICAgICAgICAgICAgIDMyNzY4ICAwCm5jaSAg
ICAgICAgICAgICAgICAgICAgNzc4MjQgIDIgbnhwX25jaSxueHBfbmNpX2kyYwpuZmMgICAgICAg
ICAgICAgICAgICAgMTMxMDcyICAxNiBuY2ksbnhwX25jaQpueHBfbmNpICAgICAgICAgICAgICAg
IDE2Mzg0ICAxIG54cF9uY2lfaTJjCm54cF9uY2lfaTJjICAgICAgICAgICAgMTYzODQgIDAKcmZr
aWxsICAgICAgICAgICAgICAgICAyODY3MiAgMTAgbmZjLGJsdWV0b290aCx0aGlua3BhZF9hY3Bp
LGNmZzgwMjExCgojIG1vZGluZm8gbnhwX25jaV9pMmMKZmlsZW5hbWU6Ci9saWIvbW9kdWxlcy81
LjEuMS0xLWFtZDY0LWluaXphL2tlcm5lbC9kcml2ZXJzL25mYy9ueHAtbmNpL254cC1uY2lfaTJj
LmtvCmF1dGhvcjogICAgICAgICBPbGVnIFpodXJha2l2c2t5eSA8b2xlZy56aHVyYWtpdnNreXlA
aW50ZWwuY29tPgphdXRob3I6ICAgICAgICAgQ2zDqW1lbnQgUGVycm9jaGF1ZCA8Y2xlbWVudC5w
ZXJyb2NoYXVkQG54cC5jb20+CmRlc2NyaXB0aW9uOiAgICBJMkMgZHJpdmVyIGZvciBOWFAgTkNJ
IE5GQyBjb250cm9sbGVycwpsaWNlbnNlOiAgICAgICAgR1BMCmFsaWFzOiAgICAgICAgICBpMmM6
bnhwLW5jaV9pMmMKYWxpYXM6ICAgICAgICAgIGFjcGkqOk5YUDc0NzE6KgphbGlhczogICAgICAg
ICAgYWNwaSo6TlhQMTAwMToqCmFsaWFzOiAgICAgICAgICBvZjpOKlQqQ254cCxueHAtbmNpLWky
Y0MqCmFsaWFzOiAgICAgICAgICBvZjpOKlQqQ254cCxueHAtbmNpLWkyYwpkZXBlbmRzOiAgICAg
ICAgbmNpLG54cC1uY2kKcmV0cG9saW5lOiAgICAgIFkKaW50cmVlOiAgICAgICAgIFkKbmFtZTog
ICAgICAgICAgIG54cF9uY2lfaTJjCnZlcm1hZ2ljOiAgICAgICA1LjEuMS0xLWFtZDY0LWluaXph
IFNNUCBtb2RfdW5sb2FkIG1vZHZlcnNpb25zCgotIFNlZGF0IC0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbmZjIG1haWxpbmcgbGlzdApMaW51
eC1uZmNAbGlzdHMuMDEub3JnCmh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbmZjCg==
