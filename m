Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0EB54047A
	for <lists+linux-nfc@lfdr.de>; Tue,  7 Jun 2022 19:13:47 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 8F8F7100F2275;
	Tue,  7 Jun 2022 10:13:44 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN> 
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 08A50100EB856
	for <linux-nfc@lists.01.org>; Tue,  7 Jun 2022 10:13:41 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id s12so29318492ejx.3
        for <linux-nfc@lists.01.org>; Tue, 07 Jun 2022 10:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=l5jecJ7m6j6+wfJuaqL9TGi12DzOxHHnCuf6mP4CPsk=;
        b=w7M+C0ahijC0B5bCeZUW56ccB+U14/4XaFNlbPajEWNY4D3QmZd+Z/NAU9yzJyYr4U
         R7Jx/ojQ8aPKjojbyH/h1fab4Md0weTfxuTxVCpLeZVanf2ezcYP0pfFLiNtfQjfXuQ4
         jLSq1U4egGPuSPIiN4zbA8XSua49XD0PMrAsJ0eapthyJQSSuHJWohuQBjrJSDZxaojC
         V6U+tchZeJ+U9/fISn3ka080i+l4dupD0mPfUZ8+fjI1mXJ2bWHreq9cESDHxTSuz2uT
         1fBFpmEaljN9m2CUBO8zQ5kHPGdGaeZ39kt+ioHEXadSFWbhxev4cYsEbLoCZZCMRUg5
         hkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=l5jecJ7m6j6+wfJuaqL9TGi12DzOxHHnCuf6mP4CPsk=;
        b=hGRSuxBquQFHm9NqN0eUPDx27vmBSQ0icfBUVD8OqR/TM6X9oC/quyDNufYKH+F3YH
         xuZ3Aq+67jiLIfjACXru9x5vWFKtS5RgU+oeTUAeLBDrDKiyFUXKErEQzPBl+mOmqrCj
         A+wWcS1tYm0r8Fg42D0AYVTZRK8rTm5DtvOMXrYTgRxltrh8Q8SDcLyoOlBwDmDB2hQV
         mwwC0vLh1RX6N1+Pv7aaUsCZz+kl48kYRUgvIoVTX2q9rlMBgQClcUwG2ov/eQ9ebgZ/
         vh36q6ubbdpxH1aHow4caxSK3dbEhf2Hl/SkWSf0bldUwtQzJims+vlI4Fo6mBIjRKWJ
         ec7g==
X-Gm-Message-State: AOAM531fW9op6COVw4x9s1vLvLExRqOkn6zhLkMLJ36uuG0sqGFRHPyl
	DkuesK21q2Lslek3LjSz8UQO3A==
X-Google-Smtp-Source: ABdhPJyW10sSpBHf1hhEgmGHXRYXoBPu1ntTLE8Y/VNzIW34xyZ5qg5+Mno2iViaMjRzgjN9HrJCdQ==
X-Received: by 2002:a17:906:7944:b0:6da:b834:2f3e with SMTP id l4-20020a170906794400b006dab8342f3emr28510928ejo.353.1654622019855;
        Tue, 07 Jun 2022 10:13:39 -0700 (PDT)
Received: from [192.168.0.186] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a23-20020aa7cf17000000b0042dc882c823sm10738047edy.70.2022.06.07.10.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 10:13:39 -0700 (PDT)
Message-ID: <e24f904b-0eaa-dd48-2647-8aaee510beca@linaro.org>
Date: Tue, 7 Jun 2022 19:13:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Martin Faltesek <mfaltesek@google.com>, kuba@kernel.org
References: <20220607025729.1673212-1-mfaltesek@google.com>
 <20220607025729.1673212-2-mfaltesek@google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220607025729.1673212-2-mfaltesek@google.com>
Message-ID-Hash: HKM3GJLDD3MDA76I4Y54EIHLERW7F6H7
X-Message-ID-Hash: HKM3GJLDD3MDA76I4Y54EIHLERW7F6H7
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: christophe.ricard@gmail.com, gregkh@linuxfoundation.org, groeck@google.com, jordy@pwning.systems, krzk@kernel.org, martin.faltesek@gmail.com, netdev@vger.kernel.org, linux-nfc@lists.01.org, wklin@google.com, theflamefire89@gmail.com, stable@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net v3 1/3] nfc: st21nfca: fix incorrect validating logic in EVT_TRANSACTION
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/HKM3GJLDD3MDA76I4Y54EIHLERW7F6H7/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 07/06/2022 04:57, Martin Faltesek wrote:
> The first validation check for EVT_TRANSACTION has two different checks
> tied together with logical AND. One is a check for minimum packet length,
> and the other is for a valid aid_tag. If either condition is true (fails),
> then an error should be triggered.  The fix is to change && to ||.
> 
> Fixes: 26fc6c7f02cb ("NFC: st21nfca: Add HCI transaction event support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Martin Faltesek <mfaltesek@google.com>
> ---
>  drivers/nfc/st21nfca/se.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.



Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
