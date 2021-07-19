Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4674E3CCF04
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 10:04:51 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 84D90100EBBBD;
	Mon, 19 Jul 2021 01:04:49 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id DFBEA100EBBBB
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 01:04:47 -0700 (PDT)
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id A61A140334
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 08:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626681885;
	bh=7dMc4mAq+4+h4MP3fWDKoLoiLttNvA8sVGnMiQKhjWo=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=elDcvk8L+egIFyFpoI7jHsQXh6xw6UjhsA4vIF2DhB/CRddNAX7RgdIcCrJVsjrM8
	 G0q407/75us21X5lAzlu18O2jHEINmeeAzT3J6gv5WBmHoXKrlGS/GatJD86zL40+L
	 8vvccYrHFc6BkchNVEalSGgyiOortKL2EaWjxw35q6D925YgTX+LXJHs4Vhav7NFBo
	 kNlF/A3O9uv1dZkPMzGIqpsAcIMzIa7FKydHJZW5ix6LIJa5Y8JQeKuINw+YmfcWON
	 ri3h7hwhrXrhSO3ThWZ7yo/GO8qWW9v7WgsZlMaxnvYWab44gfRC13WTzqrjp4399o
	 M56p/bm0pXjjg==
Received: by mail-lf1-f70.google.com with SMTP id y10-20020ac255aa0000b0290374e0ce9d3eso3087021lfg.20
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 01:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7dMc4mAq+4+h4MP3fWDKoLoiLttNvA8sVGnMiQKhjWo=;
        b=XRXnfi9dWO5fhKn5mp5Bu1XUVdDQGXWowjyGLgC9iUgEIKaD0ldxUjrwG6lltqovo/
         KIWymvNnq+PDeGmmO+KDxX+wYUTFcN3W7C+dstO4mmLw1fHVqxjObHl0Z0aNhIYDMbLC
         6VgDAaQki8W7+v+3yEI8ARd1Vm7Az+xUIdAi+4pYY80xAVu8zhCLfDz+DmER9Q6w4pNw
         Fj+jJGjq4gMy9UJKJ28IoYXwVULOfKikg7JIy1IQYQTY/a0dxot50Nj+IRu4rYGxX3d2
         97m/ogri+33qDIS7Dbw/meISrfuGqE4j7CaJ5WhIyJGZH5yBqlL0QgaSDzcHbt8ylEck
         85aQ==
X-Gm-Message-State: AOAM533dmUPf0LO8ltRHXO0HkvxWB8SqhtE3aXl16mxgHhfZo/AsToC0
	/7I3/pCARN1vcl5/u5bAfbTma7kDDWV5jhcuBWOL5heLpO7iKqD5yDieeKzpriCY03nVdn85lwo
	gIorC5dUWzH2VPB49pDCsBhaKAxnUwrgZtA==
X-Received: by 2002:a2e:7c03:: with SMTP id x3mr2566994ljc.281.1626681883172;
        Mon, 19 Jul 2021 01:04:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyeE7kDwgozIU1No46w+aPbm5QzAg6WAn0+9XzNnAnf2T/IvlAzwDJ6AvuK/kcBryF/YQYLw==
X-Received: by 2002:a2e:7c03:: with SMTP id x3mr2566968ljc.281.1626681882725;
        Mon, 19 Jul 2021 01:04:42 -0700 (PDT)
Received: from [192.168.8.102] (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id x17sm2015984ljx.75.2021.07.19.01.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jul 2021 01:04:42 -0700 (PDT)
To: Mark Greer <mgreer@animalcreek.com>
References: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
 <20210719014045.GA705685@animalcreek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6c5d40c7-3143-17a7-cc38-5f83f3c04ad1@canonical.com>
Date: Mon, 19 Jul 2021 10:04:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210719014045.GA705685@animalcreek.com>
Content-Language: en-US
Message-ID-Hash: 54UFQZN3U3MJYU5MHOWQQ6DF2EU52HBR
X-Message-ID-Hash: 54UFQZN3U3MJYU5MHOWQQ6DF2EU52HBR
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [neard][PATCH 00/16] neard CI under Github and rouund of fixes
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/54UFQZN3U3MJYU5MHOWQQ6DF2EU52HBR/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 19/07/2021 03:40, Mark Greer wrote:
> On Sat, Jul 10, 2021 at 05:38:43AM +0200, Krzysztof Kozlowski wrote:
>> Hi,
> 
> Hi Krzysztof
> 
>> Mark proposed to do some work around neard (the user-space counterpart
>> of NFC drivers) [1], so here it is.
>>
>> I made a fork on Github [2] and I add here Continuous Integration via
>> Github actions. These are pretty easy to set up. For starting only few
>> builds are done, but I have also more in the queue - just need to fix
>> 32-bit and clang builds.
>>
>> The neard fails to compile on GCC v10 (earlier maybe as well) in
>> maintainer moe (so with some warnings enabled) which is fixed here. It
>> is also first round of fixes around UTF-8 and UTF-16 parsing, although
>> this is not finished yet.
>>
>> Further plans:
>> 1. Decide whether official releases should be made from Github or
>>    kernel.org.
>> 2. Fix for clang.
>> 3. Fix UTF-8 and UTF-16 in ndef.
>> 4. Add more unit tests around ndef and others (help would be here
>>    appreciated).
>> 5. Add more GCC/clang warnings and fix them.
>> 6. Add some static analysis checks in Github CI.
>>
>> [1] https://lore.kernel.org/linux-nfc/20210512144319.30852-1-krzysztof.kozlowski@canonical.com/T/#m6a1cdae5f435b295cc7670c361b5bdc1daf30273
>> [2] https://github.com/krzk/neard
> 
> [This pertains to all of your patch sets that you've submitted.]
> 
> I started looking at these today but this patch series does not apply on
> top of the current neard master branch.  Also, there are CI patches
> intermingled with code-changing patches (and at least one patch that
> changes both (12th patch of second patch series).  Looking at your
> neard repository, there seems to be some patches in there that haven't
> been submitted via email.  Would you mind separating out CI patches from
> code patches (i.e., separate patch sets and email threads), ensuring
> that all patches are included, then re-submitting?

Sure, good point!


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
