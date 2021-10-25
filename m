Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55717439920
	for <lists+linux-nfc@lfdr.de>; Mon, 25 Oct 2021 16:48:28 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 041CC100F2276;
	Mon, 25 Oct 2021 07:48:27 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id F0D05100F2274
	for <linux-nfc@lists.01.org>; Mon, 25 Oct 2021 07:48:24 -0700 (PDT)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CF2D33FFFF
	for <linux-nfc@lists.01.org>; Mon, 25 Oct 2021 14:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1635173303;
	bh=LH+S+D+GBCzu9tGuajRTF5P0LpOZ1vWiDJ3BDbAqLVU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=EvJh6ZIOpOhskE1A4x3Vr+s9g68xvTtYbaM+M+Pb9a8IEGKBuU3ZfAvMHwtJafkM5
	 owWEAXfldKHTMJ+g8kQl93iYP/GI56BTF5mwnfcWvYbZk7X/DTiYNrMxVFhQ1afT8r
	 PU6razINBsQeSQYv5H77Y0iPrPSSBA3JF2ey+sshn+H8T4Uqk2upyv64CqTFB8hwBF
	 lF+pNd4MTfzqepGDWm6Of5oZhxoxwYlQvWIxw7VKIwk1zobo72xUE7t959bvaSea2R
	 /KNjWzkqpDFm2kmMQ26qzMiMzgHWYXlMD6+ptW7m1M5WUbBh1U45WXlUDoeOUBuGpT
	 ZY71glKklVeMg==
Received: by mail-lj1-f199.google.com with SMTP id s5-20020a2e98c5000000b002112895b3f6so2850121ljj.21
        for <linux-nfc@lists.01.org>; Mon, 25 Oct 2021 07:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LH+S+D+GBCzu9tGuajRTF5P0LpOZ1vWiDJ3BDbAqLVU=;
        b=sQ1Ux9+98GvH0MFxp7ma8Lrf2l2aKjl7gTJvfUF/Mus+owAfV555bUsa5CfuKlFyCW
         S4uTB4yNM63qe1TxJQSs9xp65Qgb3W6F+rs30kdlQ5EEkNfSRN9xhFGeEtFPRaqOtPFp
         YaTNH3iLxJzb3oaekE+AbJcHujIBO8PsHP5NT24YPWQ/r7tHyx0lWUK6gj+kWHIIdNVT
         U1dQwJmEmqu+FoveMd3WWWf+IwsTLygPzwVVLWaLuU6GH5MVETkJMq53C8Cnzjwp8yzk
         X6sWvJS1c8uJfZrGp0hDYLLF20D2zk6/r+E8NqkKEyUIzEkqoiPz/EWvQIuxR7Hww0vq
         CHWw==
X-Gm-Message-State: AOAM5301cOM1zH+5BsCp496v9pmCqkN1/OX3t1oIOu5wJ8bRPct9C4Y3
	kXIj31WoQ8Zh5F8Lk6UDRoZ+HO9dStUKR2LPxGyeSfMkLmliqUTyvSdzk/qnrbM/mQXZeHBTIL2
	nf7wK+/SQ73kjIgd3mGuM0dnbwmYFLRAgvw==
X-Received: by 2002:a05:6512:b97:: with SMTP id b23mr7435094lfv.50.1635173303253;
        Mon, 25 Oct 2021 07:48:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxd6m499afz2jxS9BIn4Prm070HwxBO4wn8iB0xS8fXZQi09axQW2YeeTU0Wbfj4YyPtfX6Rw==
X-Received: by 2002:a05:6512:b97:: with SMTP id b23mr7435050lfv.50.1635173302733;
        Mon, 25 Oct 2021 07:48:22 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id o5sm1667767lft.278.2021.10.25.07.48.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 07:48:22 -0700 (PDT)
To: Thierry Escande <thierry.escande@linux.intel.com>,
 linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211025144751.555551-1-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <42e958ae-7786-4d80-7491-6955e37a4f25@canonical.com>
Date: Mon, 25 Oct 2021 16:48:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025144751.555551-1-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
Message-ID-Hash: XPOJMRNLABIONLGMOQMFZHCPISW67UCM
X-Message-ID-Hash: XPOJMRNLABIONLGMOQMFZHCPISW67UCM
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: stable@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] nfc: port100: fix using -ERRNO as command type mask
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/XPOJMRNLABIONLGMOQMFZHCPISW67UCM/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 25/10/2021 16:47, Krzysztof Kozlowski wrote:
> During probing, the driver tries to get a list (mask) of supported
> command types in port100_get_command_type_mask() function.  The value
> is u64 and 0 is treated as invalid mask (no commands supported).  The
> function however returns also -ERRNO as u64 which will be interpret as
> valid command mask.
> 
> Return 0 on every error case of port100_get_command_type_mask(), so the
> probing will stop.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 0347a6ab300a ("NFC: port100: Commands mechanism implementation")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  drivers/nfc/port100.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/nfc/port100.c b/drivers/nfc/port100.c
> index 1296148b4566..ec1630bfedf4 100644
> --- a/drivers/nfc/port100.c
> +++ b/drivers/nfc/port100.c
> @@ -1109,15 +1109,11 @@ static u64 port100_get_command_type_mask(struct port100 *dev)
>  
>  	skb = port100_alloc_skb(dev, 0);
>  	if (!skb)
> -		return -ENOMEM;
> +		return 0;
>  
> -	nfc_err(&dev->interface->dev, "%s:%d\n", __func__, __LINE__);

Mistake, please ignore.

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
