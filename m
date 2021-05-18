Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1101387B25
	for <lists+linux-nfc@lfdr.de>; Tue, 18 May 2021 16:30:58 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 473CD100EBB9C;
	Tue, 18 May 2021 07:30:56 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 6F753100EBB72
	for <linux-nfc@lists.01.org>; Tue, 18 May 2021 07:30:50 -0700 (PDT)
Received: from mail-qt1-f197.google.com ([209.85.160.197])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lj0kC-0003bN-72
	for linux-nfc@lists.01.org; Tue, 18 May 2021 14:30:48 +0000
Received: by mail-qt1-f197.google.com with SMTP id v13-20020ac8578d0000b02901e4f5d48831so7429066qta.14
        for <linux-nfc@lists.01.org>; Tue, 18 May 2021 07:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zIep+mDf5u2lcxAQ599gQS4SQzw/nWv5n3LYaeTIvWc=;
        b=TDzHThAot6sfnrwst3Bl+cN0bxJhGZdSxgnj+QQNWpwcoSjsQ0lWcyWj1GBJdT+pdG
         oVVIs43u1JCINxXTPFsuu60u7YbG4nCStI6s/Axs+fDpLqWpvKx7VR5gKyVyClJBb05h
         zQoVdS6AcpRqXFU6LvUOySmMcT5BZzXXPp4uIEpCnKpUiyXDM49Ov1LwnQoZtB0+I+CM
         MDB4wW43NAlh2pcf/OIKIN5/04U7RzXGHdcv7MB05zCwH1ouXrUAVF6Yl9sZnseDrUOp
         WpbymMKBHk3SWVekMTD+E8dpDvQUv8x6aL3wGJ6zk2XMmdAGuFH35SL3UPp8mP3/nicM
         doNg==
X-Gm-Message-State: AOAM5328498e4/BEq0hndLWRajIPZGqvG0DOvUvvh0xtgN+sRsnAIg6W
	+NrY+GeDBBCNuDaFDoRahEu+YV7FqU02jOOLxmvAn10GlpDg+vanvZbGg4uggCsjaqNIzESKD4t
	UMJiEa+b+LdfDlNvCJdz4y39NZAUJnkbxvw==
X-Received: by 2002:a05:622a:210:: with SMTP id b16mr5045103qtx.51.1621348247352;
        Tue, 18 May 2021 07:30:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpyWpzh/kiWyRW2rwQmit2HXqGLgcp+uEU++c6YSGJ4CJjKAvVgy4lKK8lBiy0QbkQAnCnZA==
X-Received: by 2002:a05:622a:210:: with SMTP id b16mr5044978qtx.51.1621348246015;
        Tue, 18 May 2021 07:30:46 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id h14sm3811162qto.58.2021.05.18.07.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 May 2021 07:30:45 -0700 (PDT)
To: Stephan Gerhold <stephan@gerhold.net>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
References: <20210518133935.571298-1-stephan@gerhold.net>
 <20210518133935.571298-2-stephan@gerhold.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ac04821e-359d-aaaa-7e07-280156f64036@canonical.com>
Date: Tue, 18 May 2021 10:30:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518133935.571298-2-stephan@gerhold.net>
Content-Language: en-US
Message-ID-Hash: 6JCREHO2INUNCBJOH6CJPMZI6VU4CIT2
X-Message-ID-Hash: 6JCREHO2INUNCBJOH6CJPMZI6VU4CIT2
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>, linux-nfc@lists.01.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>, ~postmarketos/upstreaming@lists.sr.ht
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 2/2] nfc: s3fwrn5: i2c: Enable optional clock from device tree
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/6JCREHO2INUNCBJOH6CJPMZI6VU4CIT2/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi,

Thanks for the patch.

On 18/05/2021 09:39, Stephan Gerhold wrote:
> s3fwrn5 has a NFC_CLK_REQ output GPIO, which is asserted whenever
> the clock is needed for the current operation. This GPIO can be either
> connected directly to the clock provider, or must be monitored by
> this driver.
> 
> As an example for the first case, on many Qualcomm devices the
> NFC clock is provided by the main PMIC. The clock can be either
> permanently enabled (clocks = <&rpmcc RPM_SMD_BB_CLK2>) or enabled
> only when requested through a special input pin on the PMIC
> (clocks = <&rpmcc RPM_SMD_BB_CLK2_PIN>).
> 
> On the Samsung Galaxy A3/A5 (2015, Qualcomm MSM8916) this mechanism
> is used with S3FWRN5's NFC_CLK_REQ output GPIO to enable the clock
> only when necessary. However, to make that work the s3fwrn5 driver
> must keep the RPM_SMD_BB_CLK2_PIN clock enabled.

This contradicts the code. You wrote that pin should be kept enabled
(somehow... by driver? by it's firmware?) but your code requests the
clock from provider.

> 
> This commit adds support for this by requesting an optional clock

Don't write "This commit".
https://elixir.bootlin.com/linux/latest/source/Documentation/process/submitting-patches.rst#L89

> and keeping it permanently enabled. Note that the actual (physical)
> clock won't be permanently enabled since this will depend on the
> output of NFC_CLK_REQ from S3FWRN5.

What pin is that "NFC_CLK_REQ"? I cannot find such name. Is it GPIO2?
What clock are you talking here? The one going to the modem part?

I also don't see here how this clock is going to be automatically
on-off... driver does not perform such. Unless you speak about your
particular HW configuration where the GPIO is somehow connected with AND
(but then it is not relevant to the code).

> 
> In the future (when needed by some other device) this could be
> extended to work for the second case (monitoring the NFC_CLK_REQ
> GPIO and enabling the clock from the kernel when needed).
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  drivers/nfc/s3fwrn5/i2c.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
