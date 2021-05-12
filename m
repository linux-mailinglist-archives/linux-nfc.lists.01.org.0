Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A69F37D46C
	for <lists+linux-nfc@lfdr.de>; Wed, 12 May 2021 23:31:13 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id A652F100F2270;
	Wed, 12 May 2021 14:31:11 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 3B9DC100F226E
	for <linux-nfc@lists.01.org>; Wed, 12 May 2021 14:31:08 -0700 (PDT)
Received: from mail-vs1-f69.google.com ([209.85.217.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lgwRe-0001wF-B9
	for linux-nfc@lists.01.org; Wed, 12 May 2021 21:31:06 +0000
Received: by mail-vs1-f69.google.com with SMTP id f5-20020a67e0850000b0290226ef8b7beaso11634976vsl.17
        for <linux-nfc@lists.01.org>; Wed, 12 May 2021 14:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=THR7nK7kAwdY9rO/aRV1zRGsF5kUDEhRB1tNMwQV0/s=;
        b=mdJzxCk5pvBwAfdN5fsv+4LPm8RnIxI2K5I2aq9I7zIKbPjt/QQzwON5S5oGkzs1zN
         xopTMBlqBZr7nPkuH1wLLrwNDDEAlYdvt/67WdXDqdzjs10k6bZs6GYc5vEk889405fm
         UUJMiIlDD1dw3ZxCRiR/LNxYJrHby6Id1jy75MHIl3MDSs8JMepj8n8tHfsqrDRnXXcr
         efRLndhZhXCiNjOoNrV0T7357gNghW3Ym/kUVYp2/CclpG7PfStZbTBECyM3S1lKk8ye
         XkycrQ/77Dacxhx3oLo03e8AOtgouE2x4Ko8pOgSXpIYvzR2f2/j9QJe1OAaNMpOxYgD
         pAAQ==
X-Gm-Message-State: AOAM530MQVh56i/kr4SJglcqBBNf6X78Oz8UB5JN9hAcgksCmgroPu0j
	VcECRaOfT5WHS18qwP02lfvqfclmGwErg5pW4HdSARlgGAhOJYzy9xjb4mFzJByO1+x23LWeZ99
	fndRUMp9nYT2UDd7vwTfs+btqHqrnkAojCA==
X-Received: by 2002:a67:bc5:: with SMTP id 188mr33039894vsl.50.1620855065114;
        Wed, 12 May 2021 14:31:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpqUE6lvffKGeZjMFpQf4nrDaZgY5JFbTilGc9Kdj2kbIfwyy7wHTLB+4d0jgEZKDZulELow==
X-Received: by 2002:a67:bc5:: with SMTP id 188mr33039870vsl.50.1620855064870;
        Wed, 12 May 2021 14:31:04 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.5])
        by smtp.gmail.com with ESMTPSA id k4sm153957vkk.27.2021.05.12.14.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 14:31:04 -0700 (PDT)
To: "David S. Miller" <davem@davemloft.net>, kuba@kernel.org
References: <20210512144319.30852-1-krzysztof.kozlowski@canonical.com>
 <162085441038.10928.7471974213298679002.git-patchwork-notify@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <c23ad421-2d8a-16c7-9297-e0df04062a8e@canonical.com>
Date: Wed, 12 May 2021 17:31:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <162085441038.10928.7471974213298679002.git-patchwork-notify@kernel.org>
Content-Language: en-US
Message-ID-Hash: RQVTK7NBQFD3BIKDKUBUAHLMUKN4VEUQ
X-Message-ID-Hash: RQVTK7NBQFD3BIKDKUBUAHLMUKN4VEUQ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 1/2] MAINTAINERS: nfc: add Krzysztof Kozlowski as maintainer
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/RQVTK7NBQFD3BIKDKUBUAHLMUKN4VEUQ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/05/2021 17:20, patchwork-bot+netdevbpf@kernel.org wrote:
> Hello:
> 
> This series was applied to netdev/net.git (refs/heads/master):
> 
> On Wed, 12 May 2021 10:43:18 -0400 you wrote:
>> The NFC subsystem is orphaned.  I am happy to spend some cycles to
>> review the patches, send pull requests and in general keep the NFC
>> subsystem running.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>
>>
>> [...]
> 
> Here is the summary with links:
>   - [1/2] MAINTAINERS: nfc: add Krzysztof Kozlowski as maintainer
>     https://git.kernel.org/netdev/net/c/8aa5713d8b2c
>   - [2/2] MAINTAINERS: nfc: include linux-nfc mailing list
>     https://git.kernel.org/netdev/net/c/4a64541f2ceb


Hi David and Jakub,

Thanks for taking the patches above. Can you share your view (or point
me to the docs) about maintenance process you would like to have?

For example:
1. Do you expect pull requests or only reviews?
2. Shall I update anything on patchwork (or pwbot will take care about
it entirely)?
https://patchwork.kernel.org/project/netdevbpf/list/

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
