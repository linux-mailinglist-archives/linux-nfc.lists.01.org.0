Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E1E3CB5D9
	for <lists+linux-nfc@lfdr.de>; Fri, 16 Jul 2021 12:17:51 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 43965100F2243;
	Fri, 16 Jul 2021 03:17:49 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id BC9E0100EB82E
	for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 03:17:46 -0700 (PDT)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id A348E408B5
	for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 10:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626430665;
	bh=v3+RLYbM3UPfxivfaj+1siONUqDJMNX83wOE1RNePYc=;
	h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=GlkSSPWzUNoyDrViplUKXCVDWTZfrBFmcJu50Yn3jEaMwqqq88EmCG0MbuBYLT0z5
	 4kmIVQcBfnm9xCXAPV4SnJMehdvh+f5/TGSOoeEhWfadvLifvoE9pIkVWnagulglp/
	 ly6G471H0Md8I5Kvo87eh9LtQIT/TnJoJa9q6k9dDnGmP4yzHHolnXzJFAK1qQGNwN
	 Ba4xYbHJEAtgJLtWQhWbiRXw4CDFz92e5kwDgFbyRilY7ROCK6q9+VhspD5svIRjQU
	 MQKOGjydWLjsMnJ1KBOLi3T3gLBD2Hz4RxPQdw7CaA1wWSg/QQvu4n4Iwh2AW1U1/Q
	 uC1AMK5CsjDTw==
Received: by mail-ej1-f70.google.com with SMTP id jr6-20020a170906a986b029051b3550f911so3434180ejb.18
        for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 03:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v3+RLYbM3UPfxivfaj+1siONUqDJMNX83wOE1RNePYc=;
        b=SSOKF9MUxIqTDt2lit+sDzaGBctNv6WIbcChK3hh98U6t4VwrlKKjCspv6tyipCBbI
         0lsShJQMR0aObSHm++SvkoQQfHz5D+9zUd80QSnOWWgss9N+h+X+XfcYp61fK3Gjz9w4
         Cg8l9gLWUbR+ORcPcGsOCmMQedJb8dmEsO8+t526uBQZzS0IY+3KOk3CAm752mrsqoix
         jBdKWwqSLo8pRX254g9Je773h9kMpuceAEQTVURo/AwooHJOch+iIIuNlpVx7Lnxu/KJ
         iulYD+deYIdGA5ZtZGamC1vDTu4OTaeW/oz3dEB6hKKW8VwudRTGNZa/oxVE9E4Gr06H
         XacA==
X-Gm-Message-State: AOAM5339GDGTW0rl6y2oJV24CTk9HtMoW580gfMa7zGuukmiJlJo6/Gh
	8wNWu7FPTKOMYYFbLT5bsXcmLzRwlHhlPftXHdtagMWGMA8cDE7gYThQa8vQen3Q5reXbsa7uC3
	+cnb8aZgkGN4w5nUtN24WLiSZtNhyci6+FA==
X-Received: by 2002:a17:907:7293:: with SMTP id dt19mr11100663ejc.122.1626430665067;
        Fri, 16 Jul 2021 03:17:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUeBBiF5voCxRBD7gMBibouSTs+WUBhrrxC8+v1gk5Qx3l74DaTZtODayVE04rID9L9uuxhQ==
X-Received: by 2002:a17:907:7293:: with SMTP id dt19mr11100652ejc.122.1626430664870;
        Fri, 16 Jul 2021 03:17:44 -0700 (PDT)
Received: from [192.168.3.211] (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id w10sm2738433ejb.85.2021.07.16.03.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jul 2021 03:17:44 -0700 (PDT)
To: Mark Greer <mgreer@animalcreek.com>
References: <20210512144319.30852-1-krzysztof.kozlowski@canonical.com>
 <961dc9c5-0eb0-586c-5e70-b21ca2f8e6f3@linaro.org>
 <d498c949-3b1e-edaa-81ed-60573cfb6ee9@canonical.com>
 <20210512164952.GA222094@animalcreek.com>
 <df2ec154-79fa-af7b-d337-913ed4a0692e@canonical.com>
 <20210715183413.GB525255@animalcreek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <d996605f-020c-95c9-6ab4-cfb101cb3802@canonical.com>
Date: Fri, 16 Jul 2021 12:17:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210715183413.GB525255@animalcreek.com>
Content-Language: en-US
Message-ID-Hash: I5X44GW6ABNVIMYE7C6ZUWTLIM7KR4LS
X-Message-ID-Hash: I5X44GW6ABNVIMYE7C6ZUWTLIM7KR4LS
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 1/2] MAINTAINERS: nfc: add Krzysztof Kozlowski as maintainer
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/I5X44GW6ABNVIMYE7C6ZUWTLIM7KR4LS/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 15/07/2021 20:34, Mark Greer wrote:
> On Fri, Jul 09, 2021 at 11:24:41AM +0200, Krzysztof Kozlowski wrote:
>> On 12/05/2021 18:49, Mark Greer wrote:
>>> On Wed, May 12, 2021 at 11:43:13AM -0400, Krzysztof Kozlowski wrote:
>>>> On 12/05/2021 11:11, Daniel Lezcano wrote:
>>>>> On 12/05/2021 16:43, Krzysztof Kozlowski wrote:
>>>>>> The NFC subsystem is orphaned.  I am happy to spend some cycles to
>>>>>> review the patches, send pull requests and in general keep the NFC
>>>>>> subsystem running.
>>>>>>
>>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>>>>>
>>>>>> ---
>>>>>>
>>>>>> I admit I don't have big experience in NFC part but this will be nice
>>>>>> opportunity to learn something new. 
>>>>>
>>>>> NFC has been lost in the limbos since a while. Good to see someone
>>>>> volunteering to take care of it.
>>>>>
>>>>> May I suggest to create a simple nfc reading program in the 'tools'
>>>>> directory (could be a training exercise ;)
>>>>>
>>>>
>>>> Noted, thanks. I also need to get a simple hardware dongle for this....
>>>
>>> Krzysztof, the NFC portion of the kernel has a counterpart in userspace
>>> called neard.  I'm supposed to be maintaining it but I have next to no
>>> time to do so.  If you have spare cycles, any help would be appreciated.
>>>
>>> Anyway, in neard, there are some simple test scripts (python2 - I/we need
>>> to update to python3).  The current home of neard is:
>>>
>>> git://git.kernel.org/pub/scm/network/nfc/neard.git
>>
>> I guess none of us have problem of too much spare time :), so it took me
>> a while before I looked at neard.
>>
>> With newer Gcc, neard did not even compile (which I am fixing now). I
>> set up a fork:
>> https://github.com/krzk/neard
>> However I can give early disclaimer - playing with GLib userspace code
>> is not something I am in long term interested. If this was written in
>> Rust, would be different story. :)
>>
>> I also configured basic CI (or rather continuous building):
>> https://github.com/krzk/neard/actions/runs/1014641944
>>
>> However I still do not have proper testing setup. No hardware. Would be
>> nice if Samsung. ST, NXP or Intel could spare some development board
>> with the NFC chip supported by kernel. Till then, I will try the NFC
>> simulator and virtual NCI drivers.
>>
>> My next plan for neard is to extend the CI. There is no way I (or anyone
>> else I believe) can keep good quality of releases without automated
>> checks. I'll add some more distros, clang and later many some linters or
>> cppcheck.
> 
> Hi Krzysztof, I see you've been busy.  Thanks for that.
> 
> FYI, I made a repo on github some time back but never announced it.  The
> only reason I mention it is because the name/link looks more official:
> 
> 	https://github.com/linux-nfc/neard
> 
> Let see what happens with permssion on kernel.org and go from there.

For the kernel.org I think you need an account @kernel.org (which itself
requires your key to be signed by someone), but I am not sure.

I am happy to move entire development to github and keep kernel.org only
for releases till some distro packages notice the change. If Github,
then your linux-nfc looks indeed nicer.

> Re: hardware - I don't have much reader hardware either.  I almost
> exclusively use BeagleBone[Black] + RF Cape + trf7970atb.  I also have
> a USB dongle with a pn533, FWIW. I do have a decent collection of NFC tags,
> though.  I'll contact you privately to arrange to send some to you.

Thanks! I managed to do some testing with nfc-sim modules, although I am
not sure how much is supported.

> For peer-to-peer testing, your smartphone probably has an NFC reader but
> you'll have to play around to find the sweet spot where they put the
> antenna (older phones were notoriously bad for NFC antenna design; newer
> ones are generally better).
> 
> I will review your patch sets but the earliest I will get to them will
> be Sunday.

I just sent one more set :)


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
