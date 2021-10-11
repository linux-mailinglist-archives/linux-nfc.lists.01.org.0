Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6E3428E0F
	for <lists+linux-nfc@lfdr.de>; Mon, 11 Oct 2021 15:34:03 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 51581100F395B;
	Mon, 11 Oct 2021 06:34:01 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 47077100EA92F
	for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 06:33:57 -0700 (PDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2A4273FFD9
	for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 13:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633959236;
	bh=TCIb7WK8/iuKN7T7OPw+tlF5ym+d4BoIMWwoVr8feEY=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=I9lrQ1ogb5QKIiWjO2gLgdLkMoqZJFvwk6E5RCH6C5MTgncjZ4nxTpY5VSjjn691X
	 UseTJKEk/e/m0c0N6iKjMthQrIGMs2tKw/ONq2bUbvBzSLUqEL2UD6UOIPgytlftNY
	 A0peelE760VGjyu4ySWJRWKZGtW1xMNpE6Bmg82H1Co7JAL+1iRttKYY3mUDLKA6gj
	 1A25aCnEXgEchUI67fmb9ZrYXQACV1mwli1yPqWWaLMAY0OHBvfCv5zUUBf0MxEkQY
	 CffJQG1EpaM4fMfW1MWb48hH79rmsfvhLGP5gdsZr/t5g6rUcgd5zEAb+NSV2T3fQ9
	 qwICKuNbH9mRQ==
Received: by mail-ed1-f69.google.com with SMTP id p20-20020a50cd94000000b003db23619472so15926610edi.19
        for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 06:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TCIb7WK8/iuKN7T7OPw+tlF5ym+d4BoIMWwoVr8feEY=;
        b=ZxdKoh+NU7N/tDH5U33iOMA0DVmGXDfKJHm28tWoY3I+sq4p9EyVhdHfro3ktjiJy6
         faQKgNUwDTX7lU/vjxsGbaDRWJ2CUDWttN2+P0xrEvxgbF/Dt5MhGfQQHl5lGbtkOwh+
         E03r3giOTCsQtj6i9t8UwCSgWVkUuhfcB4wK7ovUq++uwHlcIGqmYzfqfYMJ+CNmVnfF
         UNJt5mvKhI4pLo/p2H7RrNAC9MNUOo2rxwllnE1XdRuwSjCfP9rMJ75/V5p+4T/3q43F
         6IfCQfszugivwXF3GpOhKKovqZEWp8fbPGlGEFi9u1YCEN6M3rVGS7VY8J7EpHj7b7TX
         xIgA==
X-Gm-Message-State: AOAM533pJnuHlFV36WwnXB1tzbwsAvWJL3jzJedqEmHdTLClWePK+WEJ
	ddpPimXEN13PHuQsJtujUylVMR6dJB0d9kJRj0LFmbsUYTEMvsjhTumjFcGCupQMoNyzdbdiuxo
	jSqeaZAVPFvway3ZcyrhNXMYSRoPoITylgQ==
X-Received: by 2002:a05:6402:4387:: with SMTP id o7mr18183367edc.77.1633959235875;
        Mon, 11 Oct 2021 06:33:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLeTGK5Vyvc9ZBIZQgzot5W/MsVUfLcPkJ81E15XqTbR6u2CWcacsANyKJM9MNvAiDHxYWfg==
X-Received: by 2002:a05:6402:4387:: with SMTP id o7mr18183346edc.77.1633959235736;
        Mon, 11 Oct 2021 06:33:55 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g17sm4242831edv.72.2021.10.11.06.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 06:33:54 -0700 (PDT)
To: Jakub Kicinski <kuba@kernel.org>
References: <20211007133021.32704-1-krzysztof.kozlowski@canonical.com>
 <20211008.111646.1874039740182175606.davem@davemloft.net>
 <CA+Eumj5k9K9DUsPifDchNixj0QG5WrTJX+dzADmAgYSFe49+4g@mail.gmail.com>
 <CA+Eumj65krM_LhEgbBe2hxAZhYZLmuo3zMoVcq6zp9xKa+n_Jg@mail.gmail.com>
 <20211011060352.730763fe@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ccff3781-60e1-8ff2-043b-80dc6e3ad355@canonical.com>
Date: Mon, 11 Oct 2021 15:33:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011060352.730763fe@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Language: en-US
Message-ID-Hash: UHUMHITVZNC3O47QPS3MJMPTD7S6SX56
X-Message-ID-Hash: UHUMHITVZNC3O47QPS3MJMPTD7S6SX56
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: David Miller <davem@davemloft.net>, linux-nfc@lists.01.org, netdev@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-wireless@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [RESEND PATCH v2 0/7] nfc: minor printk cleanup
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/UHUMHITVZNC3O47QPS3MJMPTD7S6SX56/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/10/2021 15:03, Jakub Kicinski wrote:
> On Sun, 10 Oct 2021 13:36:59 +0200 Krzysztof Kozlowski wrote:
>> On Fri, 8 Oct 2021 at 12:18, Krzysztof Kozlowski wrote:
>>> On Fri, 8 Oct 2021 at 12:17, David Miller <davem@davemloft.net> wrote:  
>>>> Please CC: netdev for nfc patches otherwise they will not get tracked
>>>> and applied.  
>>>
>>> netdev@vger.kernel.org is here. Which address I missed?  
>>
>> The patchset reached patchwork:
>> https://patchwork.kernel.org/project/netdevbpf/list/?series=559153&state=*
>> although for some reason it is marked as "changes requested". Are
>> there any other changes needed except Joe's comment for one patch?
> 
> I think it was just Joe's comment, nothing else here looks
> objectionable.
> 

OK, I'll send a v3 with fixed SPDX.

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
