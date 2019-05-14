Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2481C483
	for <lists+linux-nfc@lfdr.de>; Tue, 14 May 2019 10:17:19 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id B0AD22125ADDB;
	Tue, 14 May 2019 01:17:17 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=daniel.lezcano@linaro.org; receiver=linux-nfc@lists.01.org 
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id E1752212532F5
 for <linux-nfc@lists.01.org>; Tue, 14 May 2019 01:17:15 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id r4so18070836wro.10
 for <linux-nfc@lists.01.org>; Tue, 14 May 2019 01:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qhb/41FDEzVVSG2oq29fq+V0J1c955oqN4XMOiOUcJ0=;
 b=oe/9iARiGFwDztr5sO0EsirHAkk0ywLQj50w1bbOOQPCwvBd0SH1vj4a0B03mmmZ7t
 mR2fkTeYHXCWL5fncr5FYG43vWq/d3X65k3ZuWKVJYVzlMWM89EWj6MAO4TJQVbYkkA/
 CbnWOW6PRTKom7m+Arq3UB0VJxUHiNy85H81Kmx9I9ek/LpoifKm2nP6xCOofjwb3jSP
 GgrgCpXoYWm8+sHnKCPWLJmdQMc87UmG6oW0O6eNqguRbENG+ES+6KMo9cDooV6HdNVA
 XaRv3N73ltAAJ+djFRktZPSMHBeDDltzIw5goxVXr1MqBgRt8eRNUaMfFcYHvo2E2DRz
 WXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qhb/41FDEzVVSG2oq29fq+V0J1c955oqN4XMOiOUcJ0=;
 b=Ex2fLJKAPL2ndishoBTtPp14qxNFjVR075yMMU/1Kj0ZR78N0/wMrULGqf4fWfqUsG
 a82UsNjrqoAqFOVCES2mD8iBbGfnnbnbTr9Y7Emqvh0qZw4nLr9jVwDcA8GGPxvzFTkn
 aQ/69VI3ALj+taFEvpLhDtPOSz1DPQnttlRiW9THf0dz3oLyfowmVB59NB8YIGu42zys
 GCFhx8Cx8HmGc2A94mC8VC5d/Mw7FoSWD7CPwoprNOPPjBgxKAwqWupfs6o4tDgB8ZSj
 7g3kMu4GkbizREP4EGrzS8DqSOyTsbbdBJ1YmQTX+dLqW+1gcmhLNPEqroiTREro9vxk
 kBgw==
X-Gm-Message-State: APjAAAX2xHnajgPEJnwYlAiHPW93HET4RftKiXjhLeNpzpOHgYNS9Pk0
 wqnAXyD4huQ7bfZL+fOWxT7u9w==
X-Google-Smtp-Source: APXvYqx6bebFATEneaIDaQrTJuzF1tbRVVXqzquT7I64QS8c1tlnE7SIYT3a+ChSxVT3Y5NE5cPeIw==
X-Received: by 2002:adf:fb47:: with SMTP id c7mr6059253wrs.116.1557821834201; 
 Tue, 14 May 2019 01:17:14 -0700 (PDT)
Received: from [192.168.0.41] (sju31-1-78-210-255-2.fbx.proxad.net.
 [78.210.255.2])
 by smtp.googlemail.com with ESMTPSA id h15sm10686086wru.52.2019.05.14.01.17.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 01:17:13 -0700 (PDT)
To: sedat.dilek@gmail.com
References: <c2d0d19f-d814-8f41-4860-77b9cc7f9d26@linaro.org>
 <CA+icZUVz7sB6hv4fhL_rqhR_D8RePBJFXk1PaUy5tMw2z4xC_Q@mail.gmail.com>
 <5ae87449-83a1-ecce-c72c-b4742c507497@linaro.org>
 <CA+icZUXDLQKyTH-_pPi7A2=Bu5ratwab930Fcecrdr4NtMnFcw@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <27f2ce02-8deb-384f-af10-7737b703770a@linaro.org>
Date: Tue, 14 May 2019 10:17:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+icZUXDLQKyTH-_pPi7A2=Bu5ratwab930Fcecrdr4NtMnFcw@mail.gmail.com>
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

T24gMTQvMDUvMjAxOSAwOTo0OSwgU2VkYXQgRGlsZWsgd3JvdGU6Cj4gT24gVHVlLCBNYXkgMTQs
IDIwMTkgYXQgODo0MyBBTSBEYW5pZWwgTGV6Y2Fubwo+IDxkYW5pZWwubGV6Y2Fub0BsaW5hcm8u
b3JnPiB3cm90ZToKPiBbLi4uXQo+IAo+PiBUaGUgbnhwLW5jaSBrZXJuZWwgbW9kdWxlIGlzIGxv
YWRlZCBhbmQgbmVhcmQgaXMgaW5zdGFsbGVkLgo+IAo+IFlvdSBoYXZlIHRvLi4uCj4gCj4gIyBt
b2Rwcm9iZSAtdiBueHAtbmNpX2kyYwo+IAo+ICMgbHNtb2QgfCBlZ3JlcCAnbmZjfG5jaXxueHB8
aTJjJyB8IHNvcnQKPiBpMmNfYWxnb19iaXQgICAgICAgICAgIDE2Mzg0ICAxIGk5MTUKPiBpMmNf
ZGV2ICAgICAgICAgICAgICAgIDI0NTc2ICAwCj4gaTJjX2k4MDEgICAgICAgICAgICAgICAzMjc2
OCAgMAo+IG5jaSAgICAgICAgICAgICAgICAgICAgNzc4MjQgIDIgbnhwX25jaSxueHBfbmNpX2ky
Ywo+IG5mYyAgICAgICAgICAgICAgICAgICAxMzEwNzIgIDE2IG5jaSxueHBfbmNpCj4gbnhwX25j
aSAgICAgICAgICAgICAgICAxNjM4NCAgMSBueHBfbmNpX2kyYwo+IG54cF9uY2lfaTJjICAgICAg
ICAgICAgMTYzODQgIDAKPiByZmtpbGwgICAgICAgICAgICAgICAgIDI4NjcyICAxMCBuZmMsYmx1
ZXRvb3RoLHRoaW5rcGFkX2FjcGksY2ZnODAyMTEKCkkgaGF2ZSB0aGUgc2FtZSBtb2R1bGVzIGV4
Y2VwdCAncmZraWxsJwoKPiAjIG1vZGluZm8gbnhwX25jaV9pMmMKPiBmaWxlbmFtZToKPiAvbGli
L21vZHVsZXMvNS4xLjEtMS1hbWQ2NC1pbml6YS9rZXJuZWwvZHJpdmVycy9uZmMvbnhwLW5jaS9u
eHAtbmNpX2kyYy5rbwo+IGF1dGhvcjogICAgICAgICBPbGVnIFpodXJha2l2c2t5eSA8b2xlZy56
aHVyYWtpdnNreXlAaW50ZWwuY29tPgo+IGF1dGhvcjogICAgICAgICBDbMOpbWVudCBQZXJyb2No
YXVkIDxjbGVtZW50LnBlcnJvY2hhdWRAbnhwLmNvbT4KPiBkZXNjcmlwdGlvbjogICAgSTJDIGRy
aXZlciBmb3IgTlhQIE5DSSBORkMgY29udHJvbGxlcnMKPiBsaWNlbnNlOiAgICAgICAgR1BMCj4g
YWxpYXM6ICAgICAgICAgIGkyYzpueHAtbmNpX2kyYwo+IGFsaWFzOiAgICAgICAgICBhY3BpKjpO
WFA3NDcxOioKPiBhbGlhczogICAgICAgICAgYWNwaSo6TlhQMTAwMToqCj4gYWxpYXM6ICAgICAg
ICAgIG9mOk4qVCpDbnhwLG54cC1uY2ktaTJjQyoKPiBhbGlhczogICAgICAgICAgb2Y6TipUKkNu
eHAsbnhwLW5jaS1pMmMKPiBkZXBlbmRzOiAgICAgICAgbmNpLG54cC1uY2kKPiByZXRwb2xpbmU6
ICAgICAgWQo+IGludHJlZTogICAgICAgICBZCj4gbmFtZTogICAgICAgICAgIG54cF9uY2lfaTJj
Cj4gdmVybWFnaWM6ICAgICAgIDUuMS4xLTEtYW1kNjQtaW5pemEgU01QIG1vZF91bmxvYWQgbW9k
dmVyc2lvbnMKClNhbWUgcmVzdWx0IGZvciB0aGUgbW9kaW5mby4KCi0tLS0tCgpTbyB0aGUgZmly
c3QgdGltZSBJIHJ1bjoKClttYXJrXQpuZmN0b29sIC1kIG5mYzAgLXAKU3RhcnQgcG9sbGluZyBv
biBuZmMwIGFzIGluaXRpYXRvcgoKV2l0aCBhbiBlcnJvciBpbiBzeXNsb2cvZG1lc2c6Cm5jaTog
bmNpX250Zl9wYWNrZXQ6IHVua25vd24gbnRmIG9wY29kZSAweDAKCgpUaGUgc2Vjb25kIHRpbWU6
CgpuZmN0b29sIC1wIC1kIG5mYzAKUHJvdG9jb2wgZXJyb3IKCldpdGggYW4gZXJyb3IgaW4gc3lz
bG9nL2RtZXNnOgpuY2k6IG5jaV9zdGFydF9wb2xsOiBmYWlsZWQgdG8gc2V0IGxvY2FsIGdlbmVy
YWwgYnl0ZXMKClRoZW4gSSBkbzoKCm5mY3Rvb2wgLTAgLWQgbmZjMAoKaXQgcmV0dXJucyB0byBw
b2ludCBbbWFya10KCgoKCi0tIAogPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg
4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxo
dHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90
d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3Jn
L2xpbmFyby1ibG9nLz4gQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbmZjIG1haWxpbmcgbGlzdApMaW51eC1uZmNAbGlzdHMuMDEub3Jn
Cmh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbmZjCg==
