Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A32437D431
	for <lists+linux-nfc@lfdr.de>; Wed, 12 May 2021 22:23:05 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 69AE7100F225A;
	Wed, 12 May 2021 13:23:04 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B56F6100F2257
	for <linux-nfc@lists.01.org>; Wed, 12 May 2021 13:23:02 -0700 (PDT)
Received: from mail-vk1-f200.google.com ([209.85.221.200])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lgvNl-0005l4-Ee
	for linux-nfc@lists.01.org; Wed, 12 May 2021 20:23:01 +0000
Received: by mail-vk1-f200.google.com with SMTP id u186-20020a1fddc30000b02901eb1ea824ddso3274096vkg.12
        for <linux-nfc@lists.01.org>; Wed, 12 May 2021 13:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9gJsXnEr4ZIoyQYIBIzO2lxuT2xnUGyt9hpWeVeGi8I=;
        b=ixS4/+XC/U5Hjj10bMubo5Jpj3EoGRzKHfoBe8F1KafJTl+arhDllHto3zDlhyRX9w
         pcSWKW4fJiGzjb03dCUY84Ihm5WBn1WnQTZleQgVo5rWxew0MBLkA0UMwydbRXQVyo5Y
         ZihofqyG8TgJ45d7GkXU2OoufSK8fR/UW4ZSlx+PqndlQWjm6wAfKHkOmQd1082r61V3
         T+l4gITz2a0p8C2T7WYmALuUHy/Pc0KHrB14YZbb6S1fH3u88tyRLEPcEDVBJZaIQz4e
         fkYt07Yj3vOqha7GasrZX7ifjbcOcwRElE8V3zalVw0KsA2881D962am+UF/jihqKDO8
         K1jA==
X-Gm-Message-State: AOAM532p6kmldFR1ONcfE0dQ1Jcu/1nnAif+o3li0BfzANPLbjfKKpc7
	eBGsvl1w3AMbt5GFL/bS3hLME5Hw9c9GfEYyhdO1mVFDGBajzM6/0950jAN5VtEkNQBIratN4vL
	JWfmhg4OYET2hsh73YVFdjgllUxXhJd4flA==
X-Received: by 2002:a67:ee4e:: with SMTP id g14mr35358346vsp.37.1620850979958;
        Wed, 12 May 2021 13:22:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzo1HcgGvTIwADZqFT4FFfzTBlNKsqR3dNu8u/ryzDxJLZoeNXUQ5nAD8NmfVFGhoZFuAnWMw==
X-Received: by 2002:a67:ee4e:: with SMTP id g14mr35358331vsp.37.1620850979717;
        Wed, 12 May 2021 13:22:59 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id y4sm122078vsq.27.2021.05.12.13.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 13:22:59 -0700 (PDT)
To: Mark Greer <mgreer@animalcreek.com>
References: <20210512144319.30852-1-krzysztof.kozlowski@canonical.com>
 <961dc9c5-0eb0-586c-5e70-b21ca2f8e6f3@linaro.org>
 <d498c949-3b1e-edaa-81ed-60573cfb6ee9@canonical.com>
 <20210512164952.GA222094@animalcreek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <06892f2b-e4af-66d4-f033-aff49039d1a9@canonical.com>
Date: Wed, 12 May 2021 16:22:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512164952.GA222094@animalcreek.com>
Content-Language: en-US
Message-ID-Hash: 5NJ4LI6GI4SELSFWKOM4P7A3DT5CIGOF
X-Message-ID-Hash: 5NJ4LI6GI4SELSFWKOM4P7A3DT5CIGOF
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 1/2] MAINTAINERS: nfc: add Krzysztof Kozlowski as maintainer
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/5NJ4LI6GI4SELSFWKOM4P7A3DT5CIGOF/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/05/2021 12:49, Mark Greer wrote:
> On Wed, May 12, 2021 at 11:43:13AM -0400, Krzysztof Kozlowski wrote:
>> On 12/05/2021 11:11, Daniel Lezcano wrote:
>>> On 12/05/2021 16:43, Krzysztof Kozlowski wrote:
>>>> The NFC subsystem is orphaned.  I am happy to spend some cycles to
>>>> review the patches, send pull requests and in general keep the NFC
>>>> subsystem running.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>>>
>>>> ---
>>>>
>>>> I admit I don't have big experience in NFC part but this will be nice
>>>> opportunity to learn something new. 
>>>
>>> NFC has been lost in the limbos since a while. Good to see someone
>>> volunteering to take care of it.
>>>
>>> May I suggest to create a simple nfc reading program in the 'tools'
>>> directory (could be a training exercise ;)
>>>
>>
>> Noted, thanks. I also need to get a simple hardware dongle for this....
> 
> Krzysztof, the NFC portion of the kernel has a counterpart in userspace
> called neard.  I'm supposed to be maintaining it but I have next to no
> time to do so.  If you have spare cycles, any help would be appreciated.
> 
> Anyway, in neard, there are some simple test scripts (python2 - I/we need
> to update to python3).  The current home of neard is:
> 
> git://git.kernel.org/pub/scm/network/nfc/neard.git

Thanks for sharing this. Let me take a look at it first, before
committing to something too big.

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
