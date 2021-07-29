Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B333DA23B
	for <lists+linux-nfc@lfdr.de>; Thu, 29 Jul 2021 13:35:51 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 7C205100EB826;
	Thu, 29 Jul 2021 04:35:49 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B23F9100EB823
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 04:35:47 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 119023F114
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 11:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627558546;
	bh=ecITBiExnfrz7s+2RNbpApFu8QtFtMdKsbfQbWi6TUo=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=jDFB8hynE9ZQwWHiGA6bOgl34CotqcdGlqgND74z+l5eKCqYmIoffXUvip3EDsdwC
	 cdmTqidmf2qhbREL2UsCSjJfHjMwiZFIK2vgjoQF+sqErVC2c/c8itsiTHlC/jSUAW
	 YUU8WC1fjEmUU+5TAfFTqyVdKaygGi3fnO0mtO25meIETEKrJvzlkcvcn+pF2HemVR
	 BzBuK9FIe/ym0ZdstE2nN/y7PsMpCKmG8FrxSOy+v9UqhRDJZOzAvp0Te+0CPiWUl9
	 RqZX1hsPO+a/lkU0CXHIxP3xYDtXpenGMIUyUNhIYhMjBx8ouF0UFjaBuXWWAJ9jkR
	 wctEuFnQwqdPQ==
Received: by mail-ed1-f70.google.com with SMTP id p2-20020a50c9420000b02903a12bbba1ebso2791570edh.6
        for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 04:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ecITBiExnfrz7s+2RNbpApFu8QtFtMdKsbfQbWi6TUo=;
        b=jZpe5FZfBvQY4hpuNgnlTdE3je+t3uhzuUEmWzL4r11CLmzkc99wQmFyI+05lbR95D
         NiEgnH7UlExxSrqQ+HUIQQ25SnxCo4Jdw7Clqr7oyJk2+GoJCVfoP6Dd1/ZlLnrdf38i
         fueYXhoB8w+brHOPECLVg56OJeTmNaWxQQSVGHAPVnaZSy/bHvwd4oP3gI0iNS7p1s3J
         CfB+vMnTnv6y+1o6jliizPte/nG//1ZY+nwmTUKS+tn2cKNOEZ5TgQqIqX/XDybI3saw
         MHGn2n7zN4MYJK4vIvNUn7moLDpuuDFqquNQ7r6Hm8kA76Kmf0+hPqUj58MCoXy/WTrh
         xS2g==
X-Gm-Message-State: AOAM533SNLz5BCUdQRNyKlznqI/wSfs9Y8HQqDWtYtvPzPSp8UJ1v6Su
	CkiZ0Pv0DaRYgy2Mcu/7A7qZtfTSA9kTDmpHrmTF5nOoelpbPd6xjuJAkXA3os7llPzgLywDQJe
	eoBmvlbv5Ts7/jG2VJErWomazGBGy41YSLg==
X-Received: by 2002:a05:6402:124e:: with SMTP id l14mr5714537edw.356.1627558545852;
        Thu, 29 Jul 2021 04:35:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOaujUGXPLJ56H1P6zQk70UrsB6Pwk0g/7UcJ0l0bQB/BF2GdMVdpMGIjWRvJLxo2hy2jOyQ==
X-Received: by 2002:a05:6402:124e:: with SMTP id l14mr5714522edw.356.1627558545691;
        Thu, 29 Jul 2021 04:35:45 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id u10sm868329ejf.121.2021.07.29.04.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 04:35:45 -0700 (PDT)
To: patchwork-bot+netdevbpf@kernel.org
References: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
 <162755820704.26856.6157999905884570707.git-patchwork-notify@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <7b0ae615-dcdc-251e-4067-959b31c28159@canonical.com>
Date: Thu, 29 Jul 2021 13:35:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <162755820704.26856.6157999905884570707.git-patchwork-notify@kernel.org>
Content-Language: en-US
Message-ID-Hash: X2ZXPY4L63ALTIQV7E5FNMOGKLOH2GOA
X-Message-ID-Hash: X2ZXPY4L63ALTIQV7E5FNMOGKLOH2GOA
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: bongsu.jeon@samsung.com, davem@davemloft.net, kuba@kernel.org, linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 00/12] nfc: constify, continued (part 2)
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/X2ZXPY4L63ALTIQV7E5FNMOGKLOH2GOA/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 29/07/2021 13:30, patchwork-bot+netdevbpf@kernel.org wrote:
> Hello:
> 
> This series was applied to netdev/net-next.git (refs/heads/master):
> 
> On Thu, 29 Jul 2021 12:40:10 +0200 you wrote:
>> Hi,
>>
>> On top of:
>> nfc: constify pointed data
>> https://lore.kernel.org/lkml/20210726145224.146006-1-krzysztof.kozlowski@canonical.com/
>>
>> Best regards,
>> Krzysztof
>>
>> [...]
> 
> Here is the summary with links:
>   - [01/12] nfc: constify passed nfc_dev
>     https://git.kernel.org/netdev/net-next/c/dd8987a394c0
>   - [02/12] nfc: mei_phy: constify buffer passed to mei_nfc_send()
>     https://git.kernel.org/netdev/net-next/c/894a6e158633
>   - [03/12] nfc: port100: constify several pointers
>     https://git.kernel.org/netdev/net-next/c/9a4af01c35a5
>   - [04/12] nfc: trf7970a: constify several pointers
>     https://git.kernel.org/netdev/net-next/c/ea050c5ee74a
>   - [05/12] nfc: virtual_ncidev: constify pointer to nfc_dev
>     https://git.kernel.org/netdev/net-next/c/83428dbbac51
>   - [06/12] nfc: nfcsim: constify drvdata (struct nfcsim)
>     https://git.kernel.org/netdev/net-next/c/582fdc98adc8
>   - [07/12] nfc: fdp: drop unneeded cast for printing firmware size in dev_dbg()
>     https://git.kernel.org/netdev/net-next/c/6c755b1d2511
>   - [08/12] nfc: fdp: use unsigned int as loop iterator
>     https://git.kernel.org/netdev/net-next/c/c3e26b6dc1b4
>   - [09/12] nfc: fdp: constify several pointers
>     https://git.kernel.org/netdev/net-next/c/3d463dd5023b
>   - [10/12] nfc: microread: constify several pointers
>     https://git.kernel.org/netdev/net-next/c/a751449f8b47
>   - [11/12] nfc: mrvl: constify several pointers
>     https://git.kernel.org/netdev/net-next/c/fe53159fe3e0

Oh, folks, too fast :)

Sorry for the mess, but the patch 11/12 has one const which is wrong
(I sent an email for it) and this should be on top of my
previous set:
https://lore.kernel.org/lkml/20210726145224.146006-1-krzysztof.kozlowski@canonical.com/
which I think you did not take in.

I am not sure if it compiles cleanly without the one above.

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
