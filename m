Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 083724CBE97
	for <lists+linux-nfc@lfdr.de>; Thu,  3 Mar 2022 14:13:38 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 8E1FD100EAB65;
	Thu,  3 Mar 2022 05:13:36 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 7B1E2100EAB4E
	for <linux-nfc@lists.01.org>; Thu,  3 Mar 2022 05:13:34 -0800 (PST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9FCEE3F5FC
	for <linux-nfc@lists.01.org>; Thu,  3 Mar 2022 13:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1646313212;
	bh=LMY/CePsTOMSqNYl6Ts31E/1/fcnzCoQjKnJ0fOnEQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type;
	b=VXC59FZ/yvUOtxhhfQPWntnmeYqNbP8P+qXIxEI5qW3733+/8ivWZlpgMz2l4ePtv
	 UTbVWg98DmW3aBcnKCd4MxhTie5CL3ZYucFR9kS9zXyrQRBVzJPpeitPQ+MYB6JxZ+
	 whn1jBPMThw6C/uCMo4ubccxsaYdfw1lxdCiwG3FNKdaqwvuYipDA/LZDFmwhr3kdt
	 aznJ+Lp1rrXcifz5UntldxdpgdvI8UvAk6SFX8rMfqGKRDO9Lpk8XAzGW6V9NXjAM7
	 xywO808tYrBbaycSLqy0AyRLMen+0Zc1/r5YCjZ0/uOQJmdOCAYdhSrP6W88cI2RMi
	 QauhOoCjX3i5A==
Received: by mail-wm1-f72.google.com with SMTP id 26-20020a05600c22da00b00388307f3503so346925wmg.1
        for <linux-nfc@lists.01.org>; Thu, 03 Mar 2022 05:13:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LMY/CePsTOMSqNYl6Ts31E/1/fcnzCoQjKnJ0fOnEQc=;
        b=IUwIqLIKe9BMB5Elt66s900SSERWNzxHPbBdqU8lXOU8Hzh7VrrmkxuD0CFUo/QcrY
         VaDyLDuOWXsApBoIPHx1C4I7sdwby1k9L1moo+O2OKME9bwWgnbBgkxsmJ7ZvlOdUsWq
         uPjJxoKt880DGfHJbaTkibDJHAra1ylSekBb+u5YdHMiy5cheFgBgnrynUwdndAshgwu
         GWemDrkqyk5loFUs6+inNesM+GrDvCqGcrMIz/Fba9lLi4NhkMmFZlwn3ed7Z+wgxvy/
         jfU8GO27puEl7mdd8TxNPfIArz/fwCia2RXkpd2kAdekQpMv/eH6RAVN34Yvg6oZsZq9
         7usg==
X-Gm-Message-State: AOAM533bj4OZ/OKMvH7Pr/3Ln9/YQBv1A2MHDClR7fBjlZj1pC4kD6Pu
	pMSBxcvbmtlyUqpnACp5uUDwzWMVO8IAu99iAXucy0Uq4W/AK9o/tseeYT/HbFWtqM3pQ04dy30
	1hmOqT/9g7OcwBu10vV4i3l8Zkq4FrqPJHA==
X-Received: by 2002:a05:600c:1c1c:b0:381:45b4:3f69 with SMTP id j28-20020a05600c1c1c00b0038145b43f69mr3697483wms.86.1646313212176;
        Thu, 03 Mar 2022 05:13:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvYjeIPKK1xybBBwrybTxPehOwM+dcpiu2dLD6jZaYYr/U3PXkimjpZxKtXdvaWl32PpTVkA==
X-Received: by 2002:a05:600c:1c1c:b0:381:45b4:3f69 with SMTP id j28-20020a05600c1c1c00b0038145b43f69mr3697468wms.86.1646313211951;
        Thu, 03 Mar 2022 05:13:31 -0800 (PST)
Received: from [192.168.0.137] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id p5-20020a05600c358500b0038167e239a2sm2444025wmq.19.2022.03.03.05.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 05:13:31 -0800 (PST)
Message-ID: <92ecef5a-cd8d-09e6-a8af-201e04b251c1@canonical.com>
Date: Thu, 3 Mar 2022 14:13:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220302192523.57444-1-krzysztof.kozlowski@canonical.com>
 <20220302192523.57444-5-krzysztof.kozlowski@canonical.com>
 <7fc4cb250bb8406cadf80649e366b249@AcuMS.aculab.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <7fc4cb250bb8406cadf80649e366b249@AcuMS.aculab.com>
Message-ID-Hash: 3NU74QQM5OJFNN34XKWRXZ5VML7W3DU3
X-Message-ID-Hash: 3NU74QQM5OJFNN34XKWRXZ5VML7W3DU3
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [RESEND PATCH v2 4/6] nfc: llcp: use test_bit()
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/3NU74QQM5OJFNN34XKWRXZ5VML7W3DU3/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 03/03/2022 01:10, David Laight wrote:
> From: Krzysztof Kozlowski
>> Sent: 02 March 2022 19:25
>>
>> Use test_bit() instead of open-coding it, just like in other places
>> touching the bitmap.
> 
> Except it isn't a bitmap, it is just a structure member that contains bits.
> So all the other places should be changes to use C shifts and masks (etc).
> 

It's not declared as bitmap but it is unsigned long, so an appropriate
type (and same type) for test_bit.


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
