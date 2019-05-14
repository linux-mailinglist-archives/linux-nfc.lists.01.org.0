Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 276A71C361
	for <lists+linux-nfc@lfdr.de>; Tue, 14 May 2019 08:43:05 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 57EFB212735C9;
	Mon, 13 May 2019 23:43:03 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=daniel.lezcano@linaro.org; receiver=linux-nfc@lists.01.org 
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id 0E87321268FB6
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 23:43:01 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id q15so1511655wmj.0
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 23:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vwQVGP4QMJolo/v2Azys7xjikuSvEhjgr8aoZ3xvWyM=;
 b=oCrzi9rPg9K49NhAOi+CVulTWPFGJ1tohB9AF7/d7QRTOOZz45dfqCFEIuiUXxwLKK
 iypZEb62/p4AqN4LXYgpVnlyvu0vK0ssc8GV/7tZga1+KUjwtQomP/6/JKHGYhWCA50d
 jApL1jUFGbblm+PjJ8rVSCNP3GFKKT8hASJ+0U2wyBg3iOkIc4+/lHvsQP7J15VgAaDi
 UqINCZr5elbkRHKumQapkd+HdTr1RJV+bIsTEOUoySN4KTUH6lPSyeZUzyiT1neLnRP3
 diFuzxeU/bRNWXlw0L95Av9Gm4dJCyw5rQoJ9lPnjBi4LD28ziFtHD7OJbnkbsvw7nHr
 la7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vwQVGP4QMJolo/v2Azys7xjikuSvEhjgr8aoZ3xvWyM=;
 b=BdmXoVWMyz4XOk/qKf2PqLlmv6ovcmhEtmqQn7fSDzT0GeUjfcKdJQsArnrDVRQ+YQ
 +G5LCwGuuWDFMrP6wz+LiZvXXj++ShQvyqGNYQ16dzfcR/vpT2AJbs6upwYfUaRzWrkH
 3PWfw07/hDcWqfR29UjnOgH2ux7QadiiZgmyEg77ps43bJB68g4HGx6YiS8C0DT1iFbm
 ZYBK18HrtmgY9q+AgFWM0rKpTgKG7LJhlavwTrHAAB3Avs13A+4wBXJzKv5hx004oy3E
 ADD3pJNsHpfOmnQPbWSirJHebacxchJk8qIs+8WjVc5jVTeLJf6wyeZ/i/cmSUcGfJ4d
 RQow==
X-Gm-Message-State: APjAAAXLx7K4R8lRL5Jx7N7bv2UN1TPIoMBBe1z5p/i9Lyjq+gP8F9IC
 8HYrsG/iCKNx/h/S+TJ3XvI0qg==
X-Google-Smtp-Source: APXvYqwCdlLuJ5iW9IHxxl01PuCrFJZRmBFwYI+9IRXKSHay1I3F461/+iIsYm81YJW14Q0nWxJefA==
X-Received: by 2002:a1c:ef09:: with SMTP id n9mr18185481wmh.104.1557816179945; 
 Mon, 13 May 2019 23:42:59 -0700 (PDT)
Received: from [192.168.0.41] (229.78.129.77.rev.sfr.net. [77.129.78.229])
 by smtp.googlemail.com with ESMTPSA id v192sm2227083wme.24.2019.05.13.23.42.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 May 2019 23:42:59 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: sedat.dilek@gmail.com
References: <c2d0d19f-d814-8f41-4860-77b9cc7f9d26@linaro.org>
 <CA+icZUVz7sB6hv4fhL_rqhR_D8RePBJFXk1PaUy5tMw2z4xC_Q@mail.gmail.com>
Message-ID: <5ae87449-83a1-ecce-c72c-b4742c507497@linaro.org>
Date: Tue, 14 May 2019 08:42:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+icZUVz7sB6hv4fhL_rqhR_D8RePBJFXk1PaUy5tMw2z4xC_Q@mail.gmail.com>
Content-Language: en-US
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
Cc: robert.dolca@intel.com, linux-nfc@lists.01.org,
 linux-wireless@vger.kernel.org, charles.gorand@effinnov.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-nfc-bounces@lists.01.org
Sender: "Linux-nfc" <linux-nfc-bounces@lists.01.org>

T24gMTMvMDUvMjAxOSAyMjoxNSwgU2VkYXQgRGlsZWsgd3JvdGU6Cj4gT24gV2VkLCBEZWMgNSwg
MjAxOCBhdCA4OjM4IEFNIERhbmllbCBMZXpjYW5vIDxkYW5pZWwubGV6Y2Fub0BsaW5hcm8ub3Jn
PiB3cm90ZToKPj4KPj4KPj4gSGksCj4+Cj4+IHRoZSBkaXNjdXNzaW9uIHJlZmVyZW5jZSBpcyBv
biBnaXRodWIgWzFdLgo+Pgo+PiBJIGFjcXVpcmVkIGEgTGVub3ZvIHgyODAgd2l0aCBhIE5GQyBj
aGlwLiBJdCBpcyB1bmNsZWFyIHdoYXQgY2hpcCBpcyBpdAo+PiByZWFsbHksIGl0IGlzIGNhbGxl
ZCBOWFAgTlBDMzAwIHdoaWNoIGNvdWxkIGJlIGEgUE43eHh4IGNoaXAgcmFuZ2UuCj4+Cj4+IEEg
aGFja2VkIHZlcnNpb24gb2YgYW4gb2xkIGRlcHJlY2F0ZWQgb3V0LW9mLXRyZWUgbW9kdWxlIG1h
ZGUgdGhlIFBONXh4eAo+PiB0byB3b3JrIHdpdGggbXkgbGFwdG9wIGJ1dCBJIHN1c3BlY3QgaXQg
YnJvdWdodCBzb21lIHN1YnRsZSBpbnN0YWJpbGl0eQo+PiBvbiBteSBzeXN0ZW0uCj4+Cj4+IE5v
dyBpdCB3b3VsZCBiZSBuaWNlIHRvIGhhdmUgdGhpcyBjb3JyZWN0bHkgc3VwcG9ydGVkIHVwc3Ry
ZWFtLgo+Pgo+PiBJIGR1bXBlZCB0aGUgQUNQSSBEU0RUIHRhYmxlIGFuZCBnb3QgdGhlIGlkIE5Y
UDEwMDEuIFRoaXMgb25lIGlzIG5vdAo+PiBsaXN0ZWQgaW4gdGhlIG1hdGNoIHRhYmxlIG9mIHRo
ZSBueHAtbmNpIGRyaXZlci4KPj4KPj4gIC0gaXMgdGhlIGRyaXZlciBtaXNzaW5nIGZvciB0aGUg
c28gY2FsbGVkIE5YUCBOUEMzMDAgPwo+PiAgLSBzaG91bGQgdGhlIE5YUDEwMDEgbWF0Y2hpbmcg
c3RyaW5nIHRvIGJlIGFkZGVkIHRvIG54cC1uY2k/Cj4+ICAtIGlzIG15IGZpcm13YXJlIHNlbmRp
bmcgbWUgZ2FyYmFnZSA/Cj4+Cj4+IFRoYW5rcyBpbiBhZHZhbmNlIGZvciBhbnkgaW5wdXQKPj4K
PiAKPiBbIENDIEFuZHkgXQo+IAo+IEhpIERhbmllbCwKPiAKPiBJIHdhcyBhYmxlIHRvIGdldCBh
IE5YUCBOUEMzMDAgTkZDIGRldmljZSBydW4gb24gTGVub3ZvIFRoaW5rUGFkIFQ0NzAuCj4gCj4g
TG9vayBhdCB0aGUgcGF0Y2hzZXQgIltQQVRDSCB2MiAwMC8xMl0gTkZDOiBueHAtbmNpOiBjbGVh
biB1cCBhbmQKPiBzdXBwb3J0IG5ldyBJRCIuCj4gSSBoYXZlIHRlc3RlZCBvbiB0b3Agb2YgTGlu
dXggdjUuMS4xLgoKSGkgU2VkYXQsCgp5ZXMsIEkgaGF2ZSB0aGVtIHNlZS4gVGhhbmtzIGZvciBs
ZXR0aW5nIG1lIGtub3cuCgo+IEhlcmUgSSBoYXZlIHNldC4uLgo+IAo+IHNjcmlwdHMvY29uZmln
IC1tIE5GQ19OQ0kgLW0gTkZDX05YUF9OQ0kgLW0gTkZDX05YUF9OQ0lfSTJDIC1lCj4gUElOQ1RS
TF9TVU5SSVNFUE9JTlQKPiAKPiBQbGVhc2UgZ2l2ZSB0aGlzIGEgdHJ5IGFuZCByZXBvcnQuCgpN
eSBsYXB0b3AgaXMgdGhlIGZpcnN0IG9uZSBJIGhhdmUgd2l0aCBhIE5GQyByZWFkZXIsIHNvIEkn
bSBub3QgdXNlZCB0bwp0ZXN0IHRoaXMgYXMgaXQgd2FzIG5vdCB3b3JraW5nIHlldC4KCkkgYm9v
dGVkIHRoZSBtYWNoaW5lIHdpdGggYSA1LjEuMSwgdGhlIHNlcmllcyBhcHBsaWVkIG9uIHRvcCwg
YW5kIHRoZQpjb25maWcgb3B0aW9ucyBzZXQgYXMgbWVudGlvbmVkIGFib3ZlLgoKVGhlIG54cC1u
Y2kga2VybmVsIG1vZHVsZSBpcyBsb2FkZWQgYW5kIG5lYXJkIGlzIGluc3RhbGxlZC4KCkkgdXNl
ZCB0aGUgc25pZmZpbmcgdG9vbCB3aXRoIHRoZSBjb21tYW5kIGxpYm5mYyAtZCBuZmMwIC1uIGJ1
dCB3aGVuCnBhc3NpbmcgbXkgTkZDIGRldmljZXMgb24gdGhlIGxhcHRvcCdzIE5GQyBtYXJrLCBu
b3RoaW5nIGhhcHBlbnMuCgpJcyB0aGF0IGNvcnJlY3Q/CgotLSAKIDxodHRwOi8vd3d3LmxpbmFy
by5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MK
CkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBG
YWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0
dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW5mYyBtYWlsaW5nIGxpc3QKTGlu
dXgtbmZjQGxpc3RzLjAxLm9yZwpodHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW5mYwo=
