Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A8E37C5D8
	for <lists+linux-nfc@lfdr.de>; Wed, 12 May 2021 17:43:23 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 524C2100EBB6B;
	Wed, 12 May 2021 08:43:22 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 35D81100EBB6A
	for <linux-nfc@lists.01.org>; Wed, 12 May 2021 08:43:18 -0700 (PDT)
Received: from mail-vk1-f200.google.com ([209.85.221.200])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lgr13-0001p9-BN
	for linux-nfc@lists.01.org; Wed, 12 May 2021 15:43:17 +0000
Received: by mail-vk1-f200.google.com with SMTP id y70-20020a1f32490000b02901df8c87c514so3166149vky.4
        for <linux-nfc@lists.01.org>; Wed, 12 May 2021 08:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9U0ez24YYqRM0bUzj0cJkOD9iTgQukzTFGowhKKRb/U=;
        b=ilE9rJ14ox+kE6wGoJRKlgB70h3drCxgI55ZGemfZldi3S9NpNNaHtkXxMG6xdzFXB
         TXLRO7omWea6VyWqb/veSk+dJfacOJkQw35YfRYvXRXqtW7xEBjoz9Ql45pcGA3STb0s
         uPPKdWolnrTgREiTtytLS+4FU3K8wC9DFK1jFM/WP7/GP1gBsVm0Bl3GpBsIF7+/9Gzg
         8RHFHtdSOmDR/DDJJwSprYsrKHTG7v6WSlL2pAWmn+Z+XXA9Qb5jXn/rW1ick1pkAN0a
         PI1t7a8odCtaoIsXHpM3FUGdhxkxG0xwBUvOBjtTd/+T1MKIsJV+pxLhsA8pWbhceda5
         BykQ==
X-Gm-Message-State: AOAM533OraOJD9ZENtfOJ2AyLx1YcG4Ey3wCV+mExnm8u5ZKiN23pec7
	u8zRRtX9hY3cNR/MVXG8kQCXim5ugP57twpFR+XUq8Kt6D58Thk32THdzRion0YMOTHM9dNbmAS
	dCC2eQTpbC61wndQzDEu2gjVGBnTuTF3Bcg==
X-Received: by 2002:a67:ad03:: with SMTP id t3mr31669272vsl.23.1620834195896;
        Wed, 12 May 2021 08:43:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzirDmtdNmCE1i/o7cAXop5KOBGCC9s59JF+LWGQbuCR2/27ZEYoKsxnLq0Jfq3DW++gYpelg==
X-Received: by 2002:a67:ad03:: with SMTP id t3mr31669254vsl.23.1620834195759;
        Wed, 12 May 2021 08:43:15 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id d12sm31183vsc.8.2021.05.12.08.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 08:43:15 -0700 (PDT)
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210512144319.30852-1-krzysztof.kozlowski@canonical.com>
 <961dc9c5-0eb0-586c-5e70-b21ca2f8e6f3@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <d498c949-3b1e-edaa-81ed-60573cfb6ee9@canonical.com>
Date: Wed, 12 May 2021 11:43:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <961dc9c5-0eb0-586c-5e70-b21ca2f8e6f3@linaro.org>
Content-Language: en-US
Message-ID-Hash: C77N25TSCL7HIFMTPDNKXOPL4DQZ5CTY
X-Message-ID-Hash: C77N25TSCL7HIFMTPDNKXOPL4DQZ5CTY
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 1/2] MAINTAINERS: nfc: add Krzysztof Kozlowski as maintainer
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/C77N25TSCL7HIFMTPDNKXOPL4DQZ5CTY/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/05/2021 11:11, Daniel Lezcano wrote:
> On 12/05/2021 16:43, Krzysztof Kozlowski wrote:
>> The NFC subsystem is orphaned.  I am happy to spend some cycles to
>> review the patches, send pull requests and in general keep the NFC
>> subsystem running.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>
>> ---
>>
>> I admit I don't have big experience in NFC part but this will be nice
>> opportunity to learn something new. 
> 
> NFC has been lost in the limbos since a while. Good to see someone
> volunteering to take care of it.
> 
> May I suggest to create a simple nfc reading program in the 'tools'
> directory (could be a training exercise ;)
> 

Noted, thanks. I also need to get a simple hardware dongle for this....


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
