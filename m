Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 742E8402D73
	for <lists+linux-nfc@lfdr.de>; Tue,  7 Sep 2021 19:07:06 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 17920100EB831;
	Tue,  7 Sep 2021 10:07:04 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B29E5100EB82B
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 10:06:59 -0700 (PDT)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 38D453F329
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 17:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631034417;
	bh=VG0JhmyVLkk6Ofw6jiVRBn2qayN7edeiW2niGR0upjE=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=DW9tvDKCIFDG49oCgdTZGYsao7WHQCFCyDvehY118aOJ24awi4yK43QaQ68ljseDq
	 72WKRLcwYHOujiFHJ428KRFtU8p4aJgGVCzfMIVfQkOq/N+63MdzMob6Qc8GSGyl1q
	 U8PpPEgklRs6+n22GNtH3S4RuyJi90x7jJDqqa1XHwhnsbRzgBKDEO1J4vyhUAktb7
	 r5IxAjGVg0wmgBn+WCGnqu0/2+p+7vLVAEWvm3E9ZKHu2e9kDIAOvoFCREfJRnxQrL
	 vGN1vYKTlRJUN/li7EdJ7gNa50yClNRZElbF8Gjo17bKiGzWZodss00CzcanMb4EqL
	 7Tn8Uu4pHtWqA==
Received: by mail-wm1-f70.google.com with SMTP id u14-20020a7bcb0e0000b0290248831d46e4so1342740wmj.6
        for <linux-nfc@lists.01.org>; Tue, 07 Sep 2021 10:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VG0JhmyVLkk6Ofw6jiVRBn2qayN7edeiW2niGR0upjE=;
        b=NbktdzD0446ST/IuUoNaCBHlPpflBrv5eNDuTHaI2tHuo/+K0fkOzfMSmwaVFrb+2d
         Mp6EFXw43vyWwE+yXq67vCZbaMOhOI2gOOAgrUxehd8/c7hk+hhWFaNT9FfUlsoKWIMv
         1R8lLb2slNN9QnfYuR5tqLqg0HOB+ET4XWf+EL5RsjlfJbZKfiKeaWSbj+Y+Iu6+c65Q
         qxPM6cG8SULZ+bvdHTUNjzBjkSXGyvbSVJfUd8NtdWcYKJrwxcBfvLQBwhOa7SruQLNt
         4ILbwvmQi+XfdCI2vxgfxZyDxLbQ0CRf+Azv0W3qLkZj8nn8B93Gm9VeChjDvz49gHr5
         6NeQ==
X-Gm-Message-State: AOAM530EfbnaXTZRQK+ashVrd4/SVv21MN9INm5ldQ5cx+iO0htfY7Mx
	dHmv6aPAlckLKxV6ob/LBCbxDFfKckHCRV8o4wr5OZvyBzB12dA6Puw88jBi/3wu9NZVK5jDCIl
	G/C8TpXxiUvB2f0iSA7Pa9OF3iZBAEg7Y3Q==
X-Received: by 2002:a05:6000:186:: with SMTP id p6mr20176883wrx.210.1631034416921;
        Tue, 07 Sep 2021 10:06:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzE/K0JY0VlMzZwE0MrSbz25moOxrUCE+1AcR5gJXHm/zeMeF7W8lJAkFYZcpZ3SugSoUEeOg==
X-Received: by 2002:a05:6000:186:: with SMTP id p6mr20176851wrx.210.1631034416728;
        Tue, 07 Sep 2021 10:06:56 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.113.47])
        by smtp.gmail.com with ESMTPSA id w29sm11722496wra.88.2021.09.07.10.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 10:06:56 -0700 (PDT)
To: Jakub Kicinski <kuba@kernel.org>
References: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
 <20210907121816.37750-6-krzysztof.kozlowski@canonical.com>
 <35626061-ff2e-cb01-21ff-87a6f776dc28@canonical.com>
 <20210907100310.0cdec18b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <f6677c91-30ba-132d-20d2-0ec7edf40025@canonical.com>
Date: Tue, 7 Sep 2021 19:06:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210907100310.0cdec18b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Language: en-US
Message-ID-Hash: 5JTJERGCWG3I7K2LZ56O3FQBC3THNOLL
X-Message-ID-Hash: 5JTJERGCWG3I7K2LZ56O3FQBC3THNOLL
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: "David S. Miller" <davem@davemloft.net>, linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 05/15] nfc: pn533: drop unneeded debug prints
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/5JTJERGCWG3I7K2LZ56O3FQBC3THNOLL/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 07/09/2021 19:03, Jakub Kicinski wrote:
> On Tue, 7 Sep 2021 18:05:25 +0200 Krzysztof Kozlowski wrote:
>> On 07/09/2021 14:18, Krzysztof Kozlowski wrote:
>>> ftrace is a preferred and standard way to debug entering and exiting
>>> functions so drop useless debug prints.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>> ---
>>>  drivers/nfc/pn533/i2c.c   | 1 -
>>>  drivers/nfc/pn533/pn533.c | 2 --
>>>  2 files changed, 3 deletions(-)
>>>
>>> diff --git a/drivers/nfc/pn533/i2c.c b/drivers/nfc/pn533/i2c.c
>>> index e6bf8cfe3aa7..91d4a035eb63 100644
>>> --- a/drivers/nfc/pn533/i2c.c
>>> +++ b/drivers/nfc/pn533/i2c.c
>>> @@ -138,7 +138,6 @@ static irqreturn_t pn533_i2c_irq_thread_fn(int irq, void *data)
>>>  	}
>>>  
>>>  	client = phy->i2c_dev;  
>>
>> This line should also be removed (reported by kbuild robot).
>>
>> I will send a v2.
> 
> Dave marked the series as Deferred (although this patch is Changes
> Requested, I'm guessing you did that, if so please don't change patch
> states in netdev pw)

Yes, that was me. Sorry for disturbing the process.

>, please hold off:
> 
> 
> # Form letter - net-next is closed
> 
> We have already sent the networking pull request for 5.15
> and therefore net-next is closed for new drivers, features,
> code refactoring and optimizations. We are currently accepting
> bug fixes only.
> 
> Please repost when net-next reopens after 5.15-rc1 is cut.
> 
> Look out for the announcement on the mailing list or check:
> http://vger.kernel.org/~davem/net-next.html
> 
> RFC patches sent for review only are obviously welcome at any time.

Sure, I'll wait till end of merge window.


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
