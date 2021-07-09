Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F313C2182
	for <lists+linux-nfc@lfdr.de>; Fri,  9 Jul 2021 11:24:49 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id DD8E4100EBBCE;
	Fri,  9 Jul 2021 02:24:47 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 109DE100EBBCB
	for <linux-nfc@lists.01.org>; Fri,  9 Jul 2021 02:24:45 -0700 (PDT)
Received: from mail-wm1-f71.google.com ([209.85.128.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1m1mkV-0008Ez-QH
	for linux-nfc@lists.01.org; Fri, 09 Jul 2021 09:24:43 +0000
Received: by mail-wm1-f71.google.com with SMTP id n5-20020a05600c3b85b02902152e9caa1dso3357060wms.3
        for <linux-nfc@lists.01.org>; Fri, 09 Jul 2021 02:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7WNvZLwCMJPhU0LBKsV7xjBc2Y3AeokJ7ARXwaxrCLg=;
        b=PHkrmlySZzuqwTkKfuIs/hKC4HtsJ4unCrPvIK3QCO0njED7RYReYbAvs3p4KoB0c0
         tOy1EkQOr9nc9534jor6GfCSndTDOpH0Icp9GKoNa9K+5JNQcq+8yidN/iUzKB5Oos1v
         wbRsJI/ofhVO1Wi7gkTGq05ApGJeENR/QQTVnA5G8LvB4Z5Faa9iFzMf/8KxVnTU9/bk
         P32NzrOGM7NUT5n8aftwv2rAJ0Hlvj7kQlcuCB74qf1+gwXV5meh9ZfNXWtvFl+EBWAi
         Uopsmmr/bcvf10bYhkMRyYNzKsNO+Wwg3UJxrEOs6MzaKzm1WW8Ns9iWsAmrYHagi3bg
         uL3g==
X-Gm-Message-State: AOAM531saW5q8qQhdKhdKu6mYZKBicJQtIjlDylFFKLDZYLmjX43OaxA
	K2R0cqooZSDLFnA1XKkuRi8FITjHT2WhjUekaD694F3cYHh2qgdz91oaeNFguAgvgunJC8o6Nol
	nvQb5NA2c1/iigflEuW1djvi3xQXJ52YpXw==
X-Received: by 2002:a05:600c:3644:: with SMTP id y4mr10822218wmq.85.1625822683329;
        Fri, 09 Jul 2021 02:24:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDDs/3crxV8R4sxhCWt0V09XDArwN4UwXG2P9xer0we+T7bW0lP7ZWheySa024sJYcbNmN9Q==
X-Received: by 2002:a05:600c:3644:: with SMTP id y4mr10822184wmq.85.1625822682905;
        Fri, 09 Jul 2021 02:24:42 -0700 (PDT)
Received: from [192.168.3.211] (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id t22sm4497799wmi.22.2021.07.09.02.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jul 2021 02:24:42 -0700 (PDT)
To: Mark Greer <mgreer@animalcreek.com>
References: <20210512144319.30852-1-krzysztof.kozlowski@canonical.com>
 <961dc9c5-0eb0-586c-5e70-b21ca2f8e6f3@linaro.org>
 <d498c949-3b1e-edaa-81ed-60573cfb6ee9@canonical.com>
 <20210512164952.GA222094@animalcreek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <df2ec154-79fa-af7b-d337-913ed4a0692e@canonical.com>
Date: Fri, 9 Jul 2021 11:24:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210512164952.GA222094@animalcreek.com>
Content-Language: en-US
Message-ID-Hash: ADTBGADKQQHF7HZZV2NBVR3RHMQQCSA3
X-Message-ID-Hash: ADTBGADKQQHF7HZZV2NBVR3RHMQQCSA3
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 1/2] MAINTAINERS: nfc: add Krzysztof Kozlowski as maintainer
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ADTBGADKQQHF7HZZV2NBVR3RHMQQCSA3/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/05/2021 18:49, Mark Greer wrote:
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

I guess none of us have problem of too much spare time :), so it took me
a while before I looked at neard.

With newer Gcc, neard did not even compile (which I am fixing now). I
set up a fork:
https://github.com/krzk/neard
However I can give early disclaimer - playing with GLib userspace code
is not something I am in long term interested. If this was written in
Rust, would be different story. :)

I also configured basic CI (or rather continuous building):
https://github.com/krzk/neard/actions/runs/1014641944

However I still do not have proper testing setup. No hardware. Would be
nice if Samsung. ST, NXP or Intel could spare some development board
with the NFC chip supported by kernel. Till then, I will try the NFC
simulator and virtual NCI drivers.

My next plan for neard is to extend the CI. There is no way I (or anyone
else I believe) can keep good quality of releases without automated
checks. I'll add some more distros, clang and later many some linters or
cppcheck.


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
