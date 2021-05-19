Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF94389360
	for <lists+linux-nfc@lfdr.de>; Wed, 19 May 2021 18:13:19 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 12910100EAB5D;
	Wed, 19 May 2021 09:13:18 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id C7393100EAB58
	for <linux-nfc@lists.01.org>; Wed, 19 May 2021 09:13:15 -0700 (PDT)
Received: from mail-qv1-f72.google.com ([209.85.219.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1ljOos-0008PA-2h
	for linux-nfc@lists.01.org; Wed, 19 May 2021 16:13:14 +0000
Received: by mail-qv1-f72.google.com with SMTP id c5-20020a0ca9c50000b02901aede9b5061so10739054qvb.14
        for <linux-nfc@lists.01.org>; Wed, 19 May 2021 09:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eS+z7fWf9ik7UiPFy0EbImNsC/jTSa8AjK2vvxy5tQE=;
        b=cG+omjOi5nvndjEM9RXCNede6n5u2XSQwVXDrlx80dl+9y9GvO0Xlh34SZB2UJh/s5
         xRX8j9P2lUhTdAvdwrLu63/vBS3OZKbWWun2hvhSHc/dRQu50lxgHVInsG8O3BJitHO8
         mA7dz8ulXobtPPK5hsSgSJWegZKChc7G/9fzlSQEr3n7u+iLEvU/iyETRb+y3DUF5cK9
         LiqLiJMNjfhjXdMZDgARcXqjcDF0pIiW9K5KEEe5dSmzSdOHMvPwxdgveCEne7Y58pE3
         ZjJbgpQ9KkcVq3LULIa76Hj9zkqlQliV8VRricf3tMYaY8w8OOPRB/U/3o61G8zq0XNk
         DkeA==
X-Gm-Message-State: AOAM5330hYTyL9KOx0kvvcwkB42rMIznJNjZ1+d66HJlhvakBjn3asF8
	sj6KeHYlilhCylPRAH0aClTYoFcx8xb+ToGcL4yZsF6qtrWL8nTGKSyz151ZWUQ5CUhYO1QNljX
	yWEabuV3bqmrQvnW7jM9iBlmjssvAaX5qdQ==
X-Received: by 2002:a05:620a:13a6:: with SMTP id m6mr77895qki.370.1621440793225;
        Wed, 19 May 2021 09:13:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUghUkKBDIuGvqx1Nu07luWzepugYJj1I5VtklAhOR9KibnL6Cutz0I3Szhxs1G5QJhQj6OA==
X-Received: by 2002:a05:620a:13a6:: with SMTP id m6mr77852qki.370.1621440792900;
        Wed, 19 May 2021 09:13:12 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id f1sm83218qkl.93.2021.05.19.09.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 09:13:12 -0700 (PDT)
To: Stephan Gerhold <stephan@gerhold.net>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
References: <20210519091613.7343-1-stephan@gerhold.net>
 <20210519091613.7343-2-stephan@gerhold.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <86461091-617b-62ec-a9e5-2aec337d69ce@canonical.com>
Date: Wed, 19 May 2021 12:13:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519091613.7343-2-stephan@gerhold.net>
Content-Language: en-US
Message-ID-Hash: HFQCTG3FHYXRI7SXKJVCWBEE2J6C4GG3
X-Message-ID-Hash: HFQCTG3FHYXRI7SXKJVCWBEE2J6C4GG3
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>, linux-nfc@lists.01.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>, ~postmarketos/upstreaming@lists.sr.ht
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2 2/2] nfc: s3fwrn5: i2c: Enable optional clock from device tree
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/HFQCTG3FHYXRI7SXKJVCWBEE2J6C4GG3/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 19/05/2021 05:16, Stephan Gerhold wrote:
> S3FWRN5 depends on a clock input ("XI" pin) to function properly.
> Depending on the hardware configuration this could be an always-on
> oscillator or some external clock that must be explicitly enabled.
> 
> So far we assumed that the clock is always-on.
> Make the driver request an (optional) clock from the device tree
> and make sure the clock is running before starting S3FWRN5.
> 
> Note: S3FWRN5 asserts "GPIO2" whenever it needs the clock input to
> function correctly. On some hardware configurations, GPIO2 is
> connected directly to an input pin of the external clock provider
> (e.g. the main PMIC of the SoC). In that case, it can automatically
> AND the clock enable bit and clock request from S3FWRN5 so that
> the clock is actually only enabled when needed.
> 
> It is also conceivable that on some other hardware configuration
> S3FWRN5's GPIO2 might be connected as a regular GPIO input
> of the SoC. In that case, follow-up patches could extend the
> driver to request the GPIO, set up an interrupt and only enable
> the clock when requested by S3FWRN5.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
> This allows NFC to work properly on the Samsung Galaxy A3/A5 (2015).
> 
> Changes in v2: Rewrite commit message and comment based on discussion
> 
>   Note: I tried to explain the setup a bit better but dropped most of
>         the explanations about the exact configuration on the Samsung
>         Galaxy A5. I think the HW-specific details were more confusing
>         than helping. :)
> 
> v1: https://lore.kernel.org/netdev/20210518133935.571298-2-stephan@gerhold.net/
> ---
>  drivers/nfc/s3fwrn5/i2c.c | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
