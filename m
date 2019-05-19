Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB4922752
	for <lists+linux-nfc@lfdr.de>; Sun, 19 May 2019 18:47:01 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 7DAD421237802;
	Sun, 19 May 2019 09:46:59 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=daniel.lezcano@linaro.org; receiver=linux-nfc@lists.01.org 
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id 5EC962125584A
 for <linux-nfc@lists.01.org>; Sun, 19 May 2019 09:46:56 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id y3so10954192wmm.2
 for <linux-nfc@lists.01.org>; Sun, 19 May 2019 09:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xkxGVcb/77uzRi9cmphx8JSnSWCsLlQ9QImuGf0r2IE=;
 b=ROhtCdJa3qfV4yIDib/kA/GIp9fvd/eUOPU0QV9RHfkHv5jrn3sjqY4sQTSk0SuL7Y
 LcDwxcsJfXBr5QImgbNR+rcXHsS3ylkU6rOKAUhQp+ESPqIQpEHwqYR1/PLbp1Q0THYF
 1mFBR2trT/inMXu+7ZE2Ox2UOAcC+lhrEkpsuq1Jc6D/Fpbv+Sr4tiuX1m0PkpoGfx9L
 A5ObRv19kw26fl6dNazvVwWWiuCMCcfYSZp2XTTSmMVAu3LjENEcnJ3JRbVJNAB6J35d
 XeCWIiHBKTkIvOyY7aJORquGYX6n2pg33ZZrtU5dy0RPq2M+ZRTbUV8Kxu6voR5IgJx9
 /Bcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xkxGVcb/77uzRi9cmphx8JSnSWCsLlQ9QImuGf0r2IE=;
 b=UiB3oboE5iE4FjNJncRjhoc9EKxyzxfvetUBKlCJFTjOws+pRrGJokblkOSTsSTrKM
 64LY26ePliVUU/rrql1ojSUIRA0g9zHJiNqD9pSFocnOJgnhOs49eRFU3P+KObbU8W5E
 45+j0bQp8NNzs2OqHZtk1LLY4K/y3TOQ1wMgnD8ygejzHGj0l6PhkbhEe6W1IFCKc1IY
 8my+WlhPugLMIEaGsAO37VV5u/QzVQM6o3+O6Uy/H88RCulqKqHAi++RA3YlIfg2VgO+
 kZ96Ah4LIy0Tu1j8nq4zYggHWkXuu1V2heuimV0JIGBJGdYusfyqrTfTwUst+mtuCPSJ
 lJug==
X-Gm-Message-State: APjAAAUSs6fCCw3weJEz48IXyQWCxfaMz+itN0ZvMCT32W2AZmm75AlX
 hMw8J7FvLS9Mx/HemyyMSTc9Ww==
X-Google-Smtp-Source: APXvYqySHDycEg9IZP1aFaVeWvf5z9VF77Q8YdVuLrMQgpB2nEfMz9SfosOPjJphGWXmphBWq6KejA==
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr2347418wml.31.1558284414974; 
 Sun, 19 May 2019 09:46:54 -0700 (PDT)
Received: from [172.19.45.184] (static-186-95-145-212.ipcom.comunitel.net.
 [212.145.95.186])
 by smtp.googlemail.com with ESMTPSA id s11sm26734340wrb.71.2019.05.19.09.46.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 May 2019 09:46:53 -0700 (PDT)
To: sedat.dilek@gmail.com
References: <c2d0d19f-d814-8f41-4860-77b9cc7f9d26@linaro.org>
 <CA+icZUVz7sB6hv4fhL_rqhR_D8RePBJFXk1PaUy5tMw2z4xC_Q@mail.gmail.com>
 <5ae87449-83a1-ecce-c72c-b4742c507497@linaro.org>
 <CA+icZUXDLQKyTH-_pPi7A2=Bu5ratwab930Fcecrdr4NtMnFcw@mail.gmail.com>
 <27f2ce02-8deb-384f-af10-7737b703770a@linaro.org>
 <CA+icZUVaBdswfmRfbRtdVJY8ymeDOwDSFEf7G6jneqEmpW84bg@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <525160f3-a76c-4b45-2e05-c27aaabbf74d@linaro.org>
Date: Sun, 19 May 2019 18:46:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+icZUVaBdswfmRfbRtdVJY8ymeDOwDSFEf7G6jneqEmpW84bg@mail.gmail.com>
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
Cc: linux-nfc@lists.01.org, linux-wireless@vger.kernel.org,
 charles.gorand@effinnov.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-nfc-bounces@lists.01.org
Sender: "Linux-nfc" <linux-nfc-bounces@lists.01.org>

CkZZSSwgd2hlbiBJIHRyaWVkIHRvIG1ha2UgdGhlIE5GQyB3b3JrIG9uIG15IHgyODAsIEkgdHJp
ZWQgdGhlIG1vZHVsZSBhdDoKCmh0dHBzOi8vZ2l0aHViLmNvbS9qcjY0L254cC1wbjV4eAoKQUZB
SVIsIGl0IGZpbmFsbHkgd29ya2VkIHNvbWVob3cuCgpNYXkgYmUgeW91IGNhbiBjcm9zcyBjaGVj
ayB3aXRoIHlvdXIgc2VyaWVzIGFuZCB0aGUgY2hhbmdlIGluIHRoaXMKbW9kdWxlIHRvIGZpbmQg
b3V0IHdoYXQgY291bGQgYmUgbWlzc2luZz8gKEkgY2FuIGRvIHRoYXQgYnV0IGl0IHdpbGwgYmUK
Y2VydGFpbmx5IGVhc2llciBmb3IgeW91IHNwb3Qgc29tZXRoaW5nIGluIHRoZSBjb2RlIHlvdSB3
cm90ZSkuCgpJIGNhbiBleHBlcmltZW50IHlvdXIgY2hhbmdlcyBpbiBteSBsYXB0b3AgaWYgbmVl
ZGVkLgoKCk9uIDE0LzA1LzIwMTkgMTY6NTksIFNlZGF0IERpbGVrIHdyb3RlOgo+IE9uIFR1ZSwg
TWF5IDE0LCAyMDE5IGF0IDEwOjE3IEFNIERhbmllbCBMZXpjYW5vCj4gPGRhbmllbC5sZXpjYW5v
QGxpbmFyby5vcmc+IHdyb3RlOgo+IFsuLi5dCj4gCj4gSnVzdCBmb3IgdGhlIHJlY29yZHM6Cj4g
Cj4gcm9vdEBpbml6YTp+IyByZmtpbGwgLS1vdXRwdXQgSUQsVFlQRQo+IElEIFRZUEUKPiAgMCBi
bHVldG9vdGgKPiAgMSBuZmMKPiAgMiB3bGFuCj4gIDMgYmx1ZXRvb3RoCj4gCj4gcm9vdEBpbml6
YTp+IyByZmtpbGwgbGlzdCBuZmMKPiAxOiBuZmMwOiBORkMKPiAgICAgICAgIFNvZnQgYmxvY2tl
ZDogbm8KPiAgICAgICAgIEhhcmQgYmxvY2tlZDogbm8KPiAKPiAtIFNlZGF0IC0KPiAKCgotLSAK
IDxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0
d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5j
b20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJv
b3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW5m
YyBtYWlsaW5nIGxpc3QKTGludXgtbmZjQGxpc3RzLjAxLm9yZwpodHRwczovL2xpc3RzLjAxLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW5mYwo=
