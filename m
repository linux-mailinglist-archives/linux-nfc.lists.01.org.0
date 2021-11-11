Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7F444D53F
	for <lists+linux-nfc@lfdr.de>; Thu, 11 Nov 2021 11:46:50 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id F12A7100F3FC8;
	Thu, 11 Nov 2021 02:46:47 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 9BD20100EAB77
	for <linux-nfc@lists.01.org>; Thu, 11 Nov 2021 02:46:43 -0800 (PST)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 843643F1CB
	for <linux-nfc@lists.01.org>; Thu, 11 Nov 2021 10:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1636627601;
	bh=9pIehEHKQJFl9hagB1WikPLc/CGBzQRhpMZJvOOOlEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=rvDxhlIXhr4+CwrC/3N0YbpChPtBKg8cvqB5OP2tGrxEPkZRKupEIy7R0YHT0r1Sg
	 2WGmoO3XaLMTBH135MvTGoUFXOuMk0KrNYWyiMc5ZIUoUzpG23nZJRetmeTAwTslxg
	 UTsfFVzAD4gECGclZ6rKlr1mhBj8QqG0IQHjhCy3yPqDAFNpICPzFmCaKd6avLlzhz
	 xrqzcJoG0uRyluzcrr8BB7dRY7MdDhfPnMn4JH3CtfH2SlQ1kS4e29GCcyoZSVYC0T
	 eLEmEW02fbydXxKWbzmeigzzBk9Y8gEeFL0XySwOdk11h3BUy5WTQSz6drxsVjOQ6+
	 7rrWR4hynTFrA==
Received: by mail-lj1-f199.google.com with SMTP id g19-20020a2eb5d3000000b00219f21cb32bso302169ljn.7
        for <linux-nfc@lists.01.org>; Thu, 11 Nov 2021 02:46:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9pIehEHKQJFl9hagB1WikPLc/CGBzQRhpMZJvOOOlEE=;
        b=3EFVROVuP9F/hBic1sKSQaX+4kJl1PPNhIiTKqTbQCwz3DM/bVMQkTEbtEFOfmlYMS
         ZDYW9XVsT4wD5sWjv9xCghBO2KPU/isDNweG5QBrrog4ZnPvO7kdCLyQouvZDNwm6c6w
         0kvUP/8bqdUgzCLxUwZjxhUSnqyYog2iF5E4yBOmUrUBfNyDOOEB0soQpNSQXQJA/7zN
         xJVDA1jT/gObm6X+B7LrSnSjH5NZaYaxRaub2cBxPiHMJfhljiCgILdkqfmfyShKeuYS
         sNdaNi6t26Ws04t80vCpEUgrt1pxo7K3kJ5tmeq1IcjLi2bDMvmNSIxEHx9mrGFFG+5Y
         KHgw==
X-Gm-Message-State: AOAM5314vGRs50+OMNScMd2BMN0JC5sZw3EVAEYmUD8M0U9bXtKWnsQF
	+yp+10ahcgIB2ZMg3vW3aF3OAfFaUtLPHwfc/N12aad0ymAQa44sZ8sAWA1xXXbroTiBRQGcqDj
	j+T0EF0Y1A3IWUhzAbMMMsSHHemY/9y4z5g==
X-Received: by 2002:a05:6512:398b:: with SMTP id j11mr5742786lfu.461.1636627600667;
        Thu, 11 Nov 2021 02:46:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxgXq0rDkXcQqWEdqGo5vCnWZRu7wFGedbOSDoMmeqxGF7tHwF0EPHkH9p1rb+rurnvOnYvA==
X-Received: by 2002:a05:6512:398b:: with SMTP id j11mr5742768lfu.461.1636627600402;
        Thu, 11 Nov 2021 02:46:40 -0800 (PST)
Received: from [192.168.0.27] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id w6sm231963ljj.118.2021.11.11.02.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 02:46:40 -0800 (PST)
Message-ID: <5026dab0-fc8b-06a1-dcd8-8f2af9cecdc9@canonical.com>
Date: Thu, 11 Nov 2021 11:46:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Content-Language: en-US
To: linux-nfc@lists.01.org
Cc: Mark Greer <mgreer@animalcreek.com>
References: <20211107172619.13560-1-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211107172619.13560-1-krzysztof.kozlowski@canonical.com>
Message-ID-Hash: PHFA25MUMP5CLZCJDMZIGSN5VX4ILLDL
X-Message-ID-Hash: PHFA25MUMP5CLZCJDMZIGSN5VX4ILLDL
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [neard][PATCH 1/4] include: include endian.h to fix missing __BYTE_ORDER definition on Debian Stretch
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/PHFA25MUMP5CLZCJDMZIGSN5VX4ILLDL/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 07/11/2021 18:26, Krzysztof Kozlowski wrote:
> Code should pull explicitly headers for necessary symbols instead of
> relying on dependencies.  Lack of endian.h caused build failures on
> Debian Stretch:
> 
>     In file included from tools/nfctool/ndef-decode.c:28:0:
>     include/near/types.h:43:5: error: "__BYTE_ORDER" is not defined [-Werror=undef]
>      #if __BYTE_ORDER == __LITTLE_ENDIAN
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  include/types.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied.


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
