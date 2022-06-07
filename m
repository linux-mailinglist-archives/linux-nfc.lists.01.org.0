Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB2D540481
	for <lists+linux-nfc@lfdr.de>; Tue,  7 Jun 2022 19:15:38 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id D2679100EAB6F;
	Tue,  7 Jun 2022 10:15:36 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN> 
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id A6A71100EAB44
	for <linux-nfc@lists.01.org>; Tue,  7 Jun 2022 10:15:34 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id kq6so23511521ejb.11
        for <linux-nfc@lists.01.org>; Tue, 07 Jun 2022 10:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=PDWg3UHkCjLROtwQj1Oq7XtgJytN19UuedYPqE55MPM=;
        b=xt3dz4+UZeTfxDm22DYwo949d3Wdc7Me+Q+GFyZ0A17oVos1owEtm2ujMXK2hC381P
         RMyw5i5Loyjt/4jzeJHgfUXwThkDdcEPtpDcPJWdIUitVF5YVaKwTwc3p/WIZ0z0rqXr
         6YnGwX+ZYOQXHgIOaVoepM8HIpT2YiGqLyGPt9IcPf8C+4c/WRX4xdBWlFv9HE3y3Khe
         P2o8KRxXtt41Ma9lVr4YqlNAtQMdoLZlVMNurpmjeSPmqPwpuNI7fexQqf4PiE4uGrFb
         L7PySl3poU0wy4NwgzRpyuHuIl5zXpwB12qHdSRAqJCd2DNYUw1pxZ82jnON5c/pX1N4
         XjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PDWg3UHkCjLROtwQj1Oq7XtgJytN19UuedYPqE55MPM=;
        b=lWqOuytco/2r03zBt9t3QNXzj2xXPxQstEsf6YDyJANcrh10yhavtWPWid6bVutrBx
         0WGhORNRfVpvYk61tJpxz78he22NwIx9dTEKLcGW27pwNLgkMPXudWcqtNe4Ip/yBGiy
         ffCgSAM72ncg20JwLNBtta7nmyOF7YCRizTd7B0+VsWgnfG7udJSaRXQYwjRCxBHsDH8
         bVdGmYrt/b9e+vTyJCZWllXfkFj/Uy48g7u0TmHN+YqAQPxb2AQM4KLaJG1EtlT3xMtb
         JA0yw2GIMZcQ4TJBvm4y8CxLBQZ5tfuDHautvLf7YG3q/7N7qytIYKKrUINZeNg10kX+
         GeFg==
X-Gm-Message-State: AOAM532+HafrtfdWYDaGyoXNWB15PbU8ExjQcYffaB7gfizUNGwopJmV
	VshFza+2HFByLrfu0DYZOuVWDg==
X-Google-Smtp-Source: ABdhPJz4dSfM8z/+nBrTY8flquXOJXkXaF/FAFA5ReQSH5TvzkKVFABlF9yzovjXVbs28lUqFKcl7g==
X-Received: by 2002:a17:906:53ca:b0:6fe:ae32:e01e with SMTP id p10-20020a17090653ca00b006feae32e01emr27758308ejo.455.1654622133250;
        Tue, 07 Jun 2022 10:15:33 -0700 (PDT)
Received: from [192.168.0.186] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ge16-20020a170907909000b00709e786c7b2sm7023557ejb.213.2022.06.07.10.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 10:15:32 -0700 (PDT)
Message-ID: <83fd531e-9135-37b5-e92a-76b6c949587e@linaro.org>
Date: Tue, 7 Jun 2022 19:15:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Martin Faltesek <mfaltesek@google.com>, kuba@kernel.org
References: <20220607025729.1673212-1-mfaltesek@google.com>
 <20220607025729.1673212-3-mfaltesek@google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220607025729.1673212-3-mfaltesek@google.com>
Message-ID-Hash: 4QED7TQEYTZZAQ422D7H7EC7JAK6IYLQ
X-Message-ID-Hash: 4QED7TQEYTZZAQ422D7H7EC7JAK6IYLQ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: christophe.ricard@gmail.com, gregkh@linuxfoundation.org, groeck@google.com, jordy@pwning.systems, krzk@kernel.org, martin.faltesek@gmail.com, netdev@vger.kernel.org, linux-nfc@lists.01.org, wklin@google.com, theflamefire89@gmail.com, stable@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net v3 2/3] nfc: st21nfca: fix memory leaks in EVT_TRANSACTION handling
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/4QED7TQEYTZZAQ422D7H7EC7JAK6IYLQ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 07/06/2022 04:57, Martin Faltesek wrote:
> Error paths do not free previously allocated memory. Add devm_kfree() to
> those failure paths.
> 
> Fixes: 26fc6c7f02cb ("NFC: st21nfca: Add HCI transaction event support")
> Fixes: 4fbcc1a4cb20 ("nfc: st21nfca: Fix potential buffer overflows in EVT_TRANSACTION")
> Cc: stable@vger.kernel.org
> Signed-off-by: Martin Faltesek <mfaltesek@google.com>

Standard disclaimer:
---------
Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.
---------

So you dropped all my review tags?

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
