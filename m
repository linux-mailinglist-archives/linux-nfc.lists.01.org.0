Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F06C3F49C6
	for <lists+linux-nfc@lfdr.de>; Mon, 23 Aug 2021 13:29:42 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id CAFFC100EBB96;
	Mon, 23 Aug 2021 04:29:34 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 6A202100EBBCE
	for <linux-nfc@lists.01.org>; Mon, 23 Aug 2021 04:29:32 -0700 (PDT)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6815440798
	for <linux-nfc@lists.01.org>; Mon, 23 Aug 2021 11:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1629718170;
	bh=5EWB6840VswFQ7fIyLppU1EPwZlI5zB8bhRGhBsgMuo=;
	h=To:References:From:Subject:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=bMwL8ODf0XJRQBk7k1ks5/Pzl7hOpkfepnDclZfIycw+p2GArtgN5Wxb6J8GHO4uv
	 iAyCqHLKrCiHYtuLie+M4z4JaZODgK5b/60DhKf+whECQptJPeuKwps/yqyxB9EgAP
	 EpByYK5b0GQ/tVOUK2M5yi6Ba+SGrFES1mLGmBmpMrGuXoU72tPT2CyRCV8mxuuBaA
	 tVUxuLkQmSvONDEEu1Xlcr9kg+ykoJOF3qTkDBFo8a4pDtO09Fd3pB1TuBJUnENF+K
	 na2EvQh8bt6VhNq93XRObkJBd4DenZP+brT7QJdhAjO9lCGMsYrgplAzy9duFvND/E
	 4nZDHQByWyFKw==
Received: by mail-ej1-f72.google.com with SMTP id v19-20020a170906b013b02905b2f1bbf8f3so5532150ejy.6
        for <linux-nfc@lists.01.org>; Mon, 23 Aug 2021 04:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5EWB6840VswFQ7fIyLppU1EPwZlI5zB8bhRGhBsgMuo=;
        b=p7Q2Iy1v7xL6FPWghq5Ev7gA0OA3uNrkSywtN9VBUl4fxIdlBvlkqDUVywMjS3l2we
         pOU8E+ciyruytpxmvSvluu1ojRaRAKook2T42l9x4pzqhWqNq2SKnRCAU5LeB74ZXM2X
         MreQzWGcbz3tIFwlpnXeNr5N67kh1q4QRfTq2fF4XKD07IJHKcOCijyiAsXC8hdkJnd3
         IgbrfIlHXwMvvi8piueFKl2EFwssX0RDO8BMmZ+/JyBtyzf0il8oXA78YDkEID7ZyRD1
         OFu8MlWJo0L1PAhLmQGlAadhiTU4lT1nIdxnavgsoF16xeD9rpKPvK49zdjcSWk/yk+m
         govQ==
X-Gm-Message-State: AOAM530hsPBy3PCgTB3WuR2xn3QneyNUEpvLJA8h9ADTSBt53QS8BGVz
	blcDqTklDS2blhbnpWNahZAiAK9ocpQsERD7/PETGPJ5gsNWDtCBfu9YHkirZZdNlKEa8gqMP2z
	KvBX8dZGPdZ6r6cXe9Jdn4N3aAln5TsX9IA==
X-Received: by 2002:a17:906:2691:: with SMTP id t17mr35655603ejc.158.1629718169609;
        Mon, 23 Aug 2021 04:29:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhc5DkqhdMyS/kIjhx9RVMHslLrgAwZIX1lI7B6r+4ueghoIw9V/99V86fCEoaXKqGtRjXRA==
X-Received: by 2002:a17:906:2691:: with SMTP id t17mr35655571ejc.158.1629718169196;
        Mon, 23 Aug 2021 04:29:29 -0700 (PDT)
Received: from [192.168.0.101] ([79.98.114.72])
        by smtp.gmail.com with ESMTPSA id ne22sm6181861ejc.113.2021.08.23.04.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 04:29:28 -0700 (PDT)
To: Oliver Neukum <oneukum@suse.com>, charles.gorand@effinnov.com,
 andy.shevchenko@gmail.com, linux-nfc@lists.01.org
References: <20210819140228.15591-1-oneukum@suse.com>
 <7ff001e9-8e82-cecb-96af-458baac30dfc@canonical.com>
 <3d825314-4fd5-ac5b-36e9-819cf2bbdb93@suse.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <9219eca0-d6e9-5cec-3113-995743549332@canonical.com>
Date: Mon, 23 Aug 2021 13:29:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3d825314-4fd5-ac5b-36e9-819cf2bbdb93@suse.com>
Content-Language: en-US
Message-ID-Hash: LPL546ECBP6LJMCV2JXLKRHKOUNV6GA3
X-Message-ID-Hash: LPL546ECBP6LJMCV2JXLKRHKOUNV6GA3
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] NFC: NCI: make parent aware in PM terms
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/LPL546ECBP6LJMCV2JXLKRHKOUNV6GA3/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 23/08/2021 12:50, Oliver Neukum wrote:
> 
> On 19.08.21 16:45, Krzysztof Kozlowski wrote
> Hi,
>> Hi,
>>
>> Thanks for the patch.
>> However this
>> is unparseable.
>> Please wrap commit
>> message around 75th character:
>> https://elixir.bootlin.com/linux/v5.13/source/Documentation/process/submitting-patches.rst#L124
>>
>> The subject prefix: "nfc: nxp-nci: "
> OK.
>> Please also Cc all people and lists. You missed here netdev
>> and linux-kernel, so this cannot be applied.
> Do you really want LKML on CC for all NFC patches?

I personally like it a lot because I have filters organized with it.
Nowadays no one reads LKML itself (too big volume) so it is purely for
archiving on lore.kernel.org for searching and for people's filters.

Therefore unless someone here objects, I would prefer to Cc LKML as
well. Anyway, netdev is important as it is tracked by patchwork.

>>> The necessary extension of runtime PM
>>> to the NFC device requires that it
>>> be activated as a child of the i2c device.
>>> It is not necessary to do any runtime PM
>>> operations. This will disable runtime PM
>>> for this branch of the tree, but otherwise
>>> the NFC device is inoperable.
>>>
>>> Signed-off-by: Oliver Neukum <oneukum@suse.com>
>>> ---
>>>  drivers/nfc/nxp-nci/i2c.c | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/nfc/nxp-nci/i2c.c b/drivers/nfc/nxp-nci/i2c.c
>>> index 94f7f6d9cbad..dba78a5d217a 100644
>>> --- a/drivers/nfc/nxp-nci/i2c.c
>>> +++ b/drivers/nfc/nxp-nci/i2c.c
>>> @@ -18,6 +18,7 @@
>>>  #include <linux/interrupt.h>
>>>  #include <linux/module.h>
>>>  #include <linux/nfc.h>
>>> +#include <linux/pm_runtime.h>
>>>  #include <linux/gpio/consumer.h>
>>>  #include <asm/unaligned.h>
>>>  
>>> @@ -261,6 +262,7 @@ static int nxp_nci_i2c_probe(struct i2c_client *client,
>>>  {
>>>  	struct device *dev = &client->dev;
>>>  	struct nxp_nci_i2c_phy *phy;
>>> +	struct nfc_dev *ndev;
>>>  	int r;
>>>  
>>>  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
>>> @@ -297,6 +299,11 @@ static int nxp_nci_i2c_probe(struct i2c_client *client,
>>>  	if (r < 0)
>>>  		return r;
>>>  
>>> +	ndev = phy->ndev->nfc_dev;
>>> +	pm_runtime_set_active(&ndev->dev);
>>> +	pm_runtime_enable(&ndev->dev);
>>> +	pm_runtime_mark_last_busy(&ndev->dev);
>> Setting PM for someone else does not look correct. This breaks
> As far as I can tell I am doing this for the device noted in nfc_dev.
> Could you elaborate?

I meant that it looks unusual that you don't do it for your own device
(client->dev) but for device allocated in different unit. Here, you
receive client->dev and mostly you should play only with it.

While I am looking at this more, there is another issue actually - you
touch runtime PM of NFC/NCI core device but it's the NFC/NCI core who
should handle it's own runtime PM.

>> encapsulation and separation of these files. The NCI device
>> (nxp_nci_probe() and other parts of core.c) should instead manage
>> it's own runtime PM.
> 
> That would be better. The problem I encountered is that i2c and USB have
> different
> needs concerning runtime PM. Any ideas?

I think we look at different code bases. I failed to find the USB
device... It's difficult for me to judge how the final runtime PM should
look like because actually you don't do any runtime PM here. You just
enable it. Where are the callbacks? Where is suspending and resuming
(get/put)?


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
