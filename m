Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 603513F58F2
	for <lists+linux-nfc@lfdr.de>; Tue, 24 Aug 2021 09:24:44 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 1C9F9100EB835;
	Tue, 24 Aug 2021 00:24:41 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 06212100EB82A
	for <linux-nfc@lists.01.org>; Tue, 24 Aug 2021 00:24:38 -0700 (PDT)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 319F84032C
	for <linux-nfc@lists.01.org>; Tue, 24 Aug 2021 07:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1629789877;
	bh=sQ1ouKwwZSaFuT6SxewsMZMkQUpMl5k1KbK7nlIucMw=;
	h=To:References:From:Subject:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=TzJJD8MBB8BsjRoe3Ld0UysnMYK3W9DEqVo9uGQXh/SR73iuWXzQ38/Kcw9OiG+hG
	 w90PqmrTl5Vf2VL5KDnRwAJ8KfEiARK2G+9OcpvKbFt1tgFWTAlEKmyqudkVuQ//F8
	 7BnFFH6SGE+l1bw/FpYBjJck09yHXWAEEnI4iVxHYKGClZzOaeJinJTKjdzD+5wRxj
	 JjRZSikCelcef3tviz+lPYwObheE5RtyiS51BV1JsXv7xzue4N9zDRh3Z7cqfQu8+T
	 SgTCnlhkyAqk+c3vwj8P9kBNYjsyis4bYocCLUDdb0u8nuWvPG3xlR03XIavWq64g6
	 3G4wShdszaaJg==
Received: by mail-ej1-f72.google.com with SMTP id s11-20020a170906060b00b005be824f15daso6687254ejb.2
        for <linux-nfc@lists.01.org>; Tue, 24 Aug 2021 00:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sQ1ouKwwZSaFuT6SxewsMZMkQUpMl5k1KbK7nlIucMw=;
        b=kdRF+STSdWM5juMXh7cpHpksHw1ixwujayiRyfTQDyb6tGNjg7DtsjA59DNPeJcWph
         iCZEs/PxnV2Adzh+bJ8wJ3LSXgHpZ24+sopIdL/74h8rq7DRqGcJVaWwxU7/07KkH+mY
         Nn/l5UjFp1GWmwgLucr27OE9ybYfj07Ry+2ngsVqE2y5yyEI9XJUdaD+Dfwfn9BT83c5
         x7lQWXjel/etr6v5NUUgfQnnfqG6FwqcZ3J1Ibp41Rpm70pU1DMs33p+QA0JuokJ1G4p
         HsFrYY/Ka/ZCVhQCL8jP9s8dxNSRPl6W7jt3MCpaMjw2BBcrjJwU6CX/d3LXhpIJ79c0
         Su9Q==
X-Gm-Message-State: AOAM533/xWyapS6fqvu37HSiBzAt0W0WWWXDLIq2iaZIgKqVKP2UmofX
	7tHAXMObOVu77J8RbGQ8tBg6+xJfF3c0mHy6T89mpQoh1QXfkxphk2UQmk59q6+Dsv/L1aQENed
	95nIduuR4+LvpM8GzJrQ9TMfPcHebTRKpqg==
X-Received: by 2002:a17:906:32cf:: with SMTP id k15mr40161934ejk.68.1629789876463;
        Tue, 24 Aug 2021 00:24:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4upqSkel8yaFsU1Yt1ftt6JxIYncUhVIQnCUyjF3l69J5+hJhWlzK8THI47za7buriSGrBQ==
X-Received: by 2002:a17:906:32cf:: with SMTP id k15mr40161915ejk.68.1629789876188;
        Tue, 24 Aug 2021 00:24:36 -0700 (PDT)
Received: from [192.168.0.102] ([79.98.114.235])
        by smtp.gmail.com with ESMTPSA id y24sm1097844ejc.80.2021.08.24.00.24.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 00:24:35 -0700 (PDT)
To: Oliver Neukum <oneukum@suse.com>, charles.gorand@effinnov.com,
 andy.shevchenko@gmail.com, linux-nfc@lists.01.org
References: <20210819140228.15591-1-oneukum@suse.com>
 <7ff001e9-8e82-cecb-96af-458baac30dfc@canonical.com>
 <3d825314-4fd5-ac5b-36e9-819cf2bbdb93@suse.com>
 <9219eca0-d6e9-5cec-3113-995743549332@canonical.com>
 <b9d1fd42-290e-e60e-92a0-5f0cf3003f90@suse.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <4cdc831f-1db9-ead2-bac5-5b9ea9f06aa0@canonical.com>
Date: Tue, 24 Aug 2021 09:24:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b9d1fd42-290e-e60e-92a0-5f0cf3003f90@suse.com>
Content-Language: en-US
Message-ID-Hash: EPAV7E6ACXRKEQOXG5JTCHAXNO2TWQ3S
X-Message-ID-Hash: EPAV7E6ACXRKEQOXG5JTCHAXNO2TWQ3S
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] NFC: NCI: make parent aware in PM terms
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/EPAV7E6ACXRKEQOXG5JTCHAXNO2TWQ3S/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 23/08/2021 13:52, Oliver Neukum wrote:
> 
> On 23.08.21 13:29, Krzysztof Kozlowski wrote:
>> On 23/08/2021 12:50, Oliver Neukum wrote:
>>> On 19.08.21 16:45, Krzysztof Kozlowski wrote
> 
> 
> Hi,
> 
>>> I personally like it a lot because I have filters organized with it.
>>> Nowadays no one reads LKML itself (too big volume) so it is purely for
>>> archiving on lore.kernel.org for searching and for people's filters.
>>>
>>> Therefore unless someone here objects, I would prefer to Cc LKML as
>>> well. Anyway, netdev is important as it is tracked by patchwork.
> very well, It shall be done.
>>> As far as I can tell I am doing this for the device noted in nfc_dev.
>>> Could you elaborate?
>> I meant that it looks unusual that you don't do it for your own device
>> (client->dev) but for device allocated in different unit. Here, you
>> receive client->dev and mostly you should play only with it.
>>
>> While I am looking at this more, there is another issue actually - you
>> touch runtime PM of NFC/NCI core device but it's the NFC/NCI core who
>> should handle it's own runtime PM.
> 
> Well, I looked into that and that was very difficult. The NFC core has
> no idea what hardware it is running on. On my test hardware as far as
> I can tell, the power supply of my NFC hardware is just tied to
> the power supply of the i2c host controller, which is a PCI device.
> 
> It goes into D3cold when the i2c bus is not transferring anything.
> That makes it impossible to actually communicate over NFC.
> 
> However, at least on USB sending a device into USB suspend with
> remote wakeup should work. So I do not see how to put this into
> NFC core.

If I understand your case correctly, you have a tree of devices:
PCI I2C bus controller
 - NXP NFC I2C device
   - NFC NCI device

and the only thing you care is to make PCI I2C bus resumed all the time.
The simplest seems to add PM runtime to the NXP NFC I2C device (so
i2c.c) with get_noresume+active+enable.


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
