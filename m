Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A2250C892
	for <lists+linux-nfc@lfdr.de>; Sat, 23 Apr 2022 11:28:43 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id D4270100EAAEF;
	Sat, 23 Apr 2022 02:28:40 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN> 
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id C2A7F100EB857
	for <linux-nfc@lists.01.org>; Sat, 23 Apr 2022 02:28:38 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id l7so20659964ejn.2
        for <linux-nfc@lists.01.org>; Sat, 23 Apr 2022 02:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=XwRX3dQQKVCbO7y3tkBOfJG0TaUkfPDXzwv86ykznLY=;
        b=boWjgTSfPOJYrFX2B0Ktpyn5wSiTeF8DJCpuoxmuJ5hXlU9dNVdJCtMl5uvEoKYFgG
         anir+PwRSZmLlILbfYNShfNFRvRW4MIT6EemUwjMm2EYb2vWis8kzsJXy+6r/bK2u0jr
         tmMgZeXQ0YsI7F8esO+qzObvcgW2D42acLxKF+m4Z00P5y5B/fnHMZWEGJSGi7s7KVX4
         qQObLL9gWTC2MQU3uwcCjqo9hRBE1rpGgEklbKcVtfcz+ujYY5W4ErnoBqfZgQtTHOLO
         vwfV9E+OvRZ3284K9e5NU+r16af/bGCVTKJvbJ141gzri749z6Z2ib2N7pFJ8gR/Pbed
         2TEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XwRX3dQQKVCbO7y3tkBOfJG0TaUkfPDXzwv86ykznLY=;
        b=rA52SEEEsEb5TwB8DpBZp+CaRfil9hJ+LLto7DzwxEqlBiokPYR/SeXuCAn0iXB8uR
         nYaGBvjTgAyvQQXURE1Xkwn9bWvDwFTInHG0tGdLMV70vbTeOrslT32QC27LoZQ+HVRc
         DCx0wjaPGiWynZzhT2ws+mwUQm5OMnmiitj9mj48qDYf8azL5kquyFzvxND/wbeJKs4I
         5lX7pL7FquZ+3diEivN0pkTzpa/iBsAhemkFE0+Ih4uot1urFRUB5DimF8tzykH92ZXB
         EruZ+W3DTqjF5iWk+zRJEQWjV2x5iJggmEZyUSVuvnIi/xnB4wMN7gGLNEWfdTR4EUMr
         1KVA==
X-Gm-Message-State: AOAM5325w27ISfXir/NxO89bIwN1yi4z0DyDlobDCHZaAmZ7Iw9LV1Cr
	S+yAoOiTnpLb9CM6BJz9HqLy1g==
X-Google-Smtp-Source: ABdhPJwQyTIIz1uqkkA/2Gzfz8WyLrZPTzJtXQA4DG3JJPeEuT8o/0o90kidYqWbdlzjNwJ9n9n+3w==
X-Received: by 2002:a17:907:2da3:b0:6f3:6e74:67b0 with SMTP id gt35-20020a1709072da300b006f36e7467b0mr2726572ejc.766.1650706116579;
        Sat, 23 Apr 2022 02:28:36 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id tk22-20020a170907c29600b006de43e9605asm1450030ejc.181.2022.04.23.02.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 02:28:36 -0700 (PDT)
Message-ID: <e7eb0c05-7056-7aeb-ebca-399f11d22122@linaro.org>
Date: Sat, 23 Apr 2022 11:28:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>
References: <20220422104758.64039-1-krzysztof.kozlowski@linaro.org>
 <20220422161305.59e0be38@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422161305.59e0be38@kernel.org>
Message-ID-Hash: SV5FJKVYQSCHPMYVYNKBMPCBFJUZGBL3
X-Message-ID-Hash: SV5FJKVYQSCHPMYVYNKBMPCBFJUZGBL3
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] nfc: nfcmrvl: spi: Fix irq_of_parse_and_map() return value
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/SV5FJKVYQSCHPMYVYNKBMPCBFJUZGBL3/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 23/04/2022 01:13, Jakub Kicinski wrote:
> On Fri, 22 Apr 2022 12:47:58 +0200 Krzysztof Kozlowski wrote:
>> The irq_of_parse_and_map() returns 0 on failure, not a negative ERRNO.
>>
>> Fixes: caf6e49bf6d0 ("NFC: nfcmrvl: add spi driver")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>> This is another issue to https://lore.kernel.org/all/20220422084605.2775542-1-lv.ruyi@zte.com.cn/
> 
> Maybe send one patch that fixes both and also fixes the usage of ret?

Bah, I just blindly copied one part of his patch without deeper check.
Thanks for noticing it.


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
