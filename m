Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC1F1CD1C
	for <lists+linux-nfc@lfdr.de>; Tue, 14 May 2019 18:36:08 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id BCB5421275447;
	Tue, 14 May 2019 09:36:06 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=daniel.lezcano@linaro.org; receiver=linux-nfc@lists.01.org 
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id A769C2125F1FE
 for <linux-nfc@lists.01.org>; Tue, 14 May 2019 09:36:05 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id h4so19978670wre.7
 for <linux-nfc@lists.01.org>; Tue, 14 May 2019 09:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XveLFzCb5KHPyye9JOs96NPh1yJsNROqoUari4A22f4=;
 b=W0mtepiRX95RHyP1+6mzs1OABESMcQl6C2JwbmSF1CTn7BXzoNNKIEv9KgrPFy13K6
 ZwG3xFotsCBpaaVJfuvmt1X1rJDByICesO8VkguK+4Wgo2TOxk5G7ujBd4z0AuT1FG/K
 /o3R7hQca5HAXrJAbIW7SeiaAiX83UhL2zY3FNuKBCZBUuNAgaqlwUbiLsk5wvh/Iar3
 777yjQAQlRlmc+DRIT6HOCARz0ttbxnJAEcI9MckzwjQt4kGEwYmaSxKhTHTToekSXFg
 bWj6xRpHfsWVYdN9vzHqKctcw0LIifIaNEml7DjkhNNfsEf4Soz7/fieOn/X8coKO9Id
 lrpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XveLFzCb5KHPyye9JOs96NPh1yJsNROqoUari4A22f4=;
 b=pj9A0gZMgegCMk21tAoEJ8JNW37KQsyl4NkYsjp8FP85hJxqZ7w6CIymuoBsuRJB9e
 Dfx/S2KbsNLe1BrszuiFGoSlORJxPbI278tjHp0iVQmRdhJ76C9uq2h+Av36VSGMdVPl
 Y0Pm+yDzhaJtMPEGS5qhwU8Lz6CLLrAHH2K5TQYTn+6JCZPaP3kI4fSfRxOluhkbbngP
 LYJhxlDDQIh5l6YDnM2j7juvdRtHgezk3kv+1Rocb418FyWSJgejXBqcMEnLffFAm6q5
 MQhehjlM2eGbQ+IXEdUFrPv+bOY9MP2WC3VrbHIdQX8qFoY6P+IPiCN5wpV1UD/SQNSF
 yOOQ==
X-Gm-Message-State: APjAAAXg6dZNAHOK3+8+zX7XJFdXZfUuHCBN7NCGuD4XkLLwIgegNbL6
 3fjtTNQNsOaAJ39asB3K6TT1zw==
X-Google-Smtp-Source: APXvYqwzu9DXFh7MRoFOA1+bogimnRcdJNLazl0C3QmsrUD2jWawVP8Eo1nxf//2+gHBMSOeO4j1AQ==
X-Received: by 2002:a5d:4308:: with SMTP id h8mr1844962wrq.22.1557851762202;
 Tue, 14 May 2019 09:36:02 -0700 (PDT)
Received: from [192.168.0.41] (sju31-1-78-210-255-2.fbx.proxad.net.
 [78.210.255.2])
 by smtp.googlemail.com with ESMTPSA id s22sm4995768wmh.45.2019.05.14.09.36.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 09:36:01 -0700 (PDT)
To: sedat.dilek@gmail.com
References: <c2d0d19f-d814-8f41-4860-77b9cc7f9d26@linaro.org>
 <CA+icZUVz7sB6hv4fhL_rqhR_D8RePBJFXk1PaUy5tMw2z4xC_Q@mail.gmail.com>
 <5ae87449-83a1-ecce-c72c-b4742c507497@linaro.org>
 <CA+icZUXDLQKyTH-_pPi7A2=Bu5ratwab930Fcecrdr4NtMnFcw@mail.gmail.com>
 <27f2ce02-8deb-384f-af10-7737b703770a@linaro.org>
 <CA+icZUVaBdswfmRfbRtdVJY8ymeDOwDSFEf7G6jneqEmpW84bg@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <a44f7d09-a0f0-6e3b-c097-f736cfa28444@linaro.org>
Date: Tue, 14 May 2019 18:36:00 +0200
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

T24gMTQvMDUvMjAxOSAxNjo1OSwgU2VkYXQgRGlsZWsgd3JvdGU6Cj4gT24gVHVlLCBNYXkgMTQs
IDIwMTkgYXQgMTA6MTcgQU0gRGFuaWVsIExlemNhbm8KPiA8ZGFuaWVsLmxlemNhbm9AbGluYXJv
Lm9yZz4gd3JvdGU6Cj4gWy4uLl0KPiAKPiBKdXN0IGZvciB0aGUgcmVjb3JkczoKPiAKPiByb290
QGluaXphOn4jIHJma2lsbCAtLW91dHB1dCBJRCxUWVBFCj4gSUQgVFlQRQo+ICAwIGJsdWV0b290
aAo+ICAxIG5mYwo+ICAyIHdsYW4KPiAgMyBibHVldG9vdGgKPiAKPiByb290QGluaXphOn4jIHJm
a2lsbCBsaXN0IG5mYwo+IDE6IG5mYzA6IE5GQwo+ICAgICAgICAgU29mdCBibG9ja2VkOiBubwo+
ICAgICAgICAgSGFyZCBibG9ja2VkOiBubwo+IAoKVGhhbmtzLCBJIGhhdmUgY2hlY2tlZCBhbmQg
aXQgaXMgdGhlIHNhbWUgdmFsdWVzLgotLSAKIDxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5h
cm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5h
cm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8Cjxo
dHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGlu
YXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW5mYyBtYWlsaW5nIGxpc3QKTGludXgtbmZjQGxpc3Rz
LjAxLm9yZwpodHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW5mYwo=
