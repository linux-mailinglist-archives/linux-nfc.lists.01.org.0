Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6BB3DB9F7
	for <lists+linux-nfc@lfdr.de>; Fri, 30 Jul 2021 16:03:44 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 292B4100EB82A;
	Fri, 30 Jul 2021 07:03:43 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B8E15100EBBC4
	for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 07:03:38 -0700 (PDT)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id A3C413F23D
	for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 14:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627653817;
	bh=/Gja+i0Dvjadolanru2/enXX4OvFq4ZgMqAnNw717vc=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=oP4EGFHbuM8HS4pOQxnH9iULeVWfme2ZJ8xcYQ0LIo7UrTLG4zBT5yAE49NR1V768
	 btPaRhXEY7j+T2h/j1yq2xBcg8x8qekZTCg6h+5E06+VROclcOn4VKIuXeZgomD+ts
	 +E4cvh5Q3/kNwhkKmpttzbZyb0nKESOn+jezeiYe8XiIA5nq93fivLqk+YSlVX75vI
	 7ik8E2uhpzUQs9DrJQZA+YLgYJlI0PAHY8R5nLpM+H5P5RBtck2CQgchyK6snAkC6L
	 /wWnibRLgsQptTiDrnbVNcjlDmhkB3Bt2iVt0yZ8C+zEBj2vsRmLVLaQ1BrxTzWc0H
	 2IzwhpnttFctg==
Received: by mail-ej1-f69.google.com with SMTP id rv22-20020a17090710d6b029058c69e3adbbso3125157ejb.6
        for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 07:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/Gja+i0Dvjadolanru2/enXX4OvFq4ZgMqAnNw717vc=;
        b=FxZhikQ8TrwbO50ngyFkMgLE7LfokqaVHZsQ/9QMeg5Es09eQSw/O4//NQPrUJUEK0
         b19t1p+HdzNZlFkJULDv0ne8YI9S7J91QbIoLZYO+1PLnLR78fXAI56AGpC3TIOzKjds
         G1jMtEvKucvBA7nhrlraK2NHF0cmSv7FLUEiY9fDI1bPKCSoZ48Txg7RTQCx74pPnddQ
         BUUb4JYX5ksDLomApkjJlWsL37wrVB+GIK+k+TFYe3BlwwjRJz0ArrN1FbRRVKKpQySH
         jsYIFKqweQBEfLV/2aFzjF4M01oHd81JlRfAdI0h5+Q1D+kmkW3FYzqHOCU0JVKrjPhH
         mA+g==
X-Gm-Message-State: AOAM532f+u3AmT/Dc5ycFPbC9L/ngA6EkNxSK6RkcHJ+P4v71KDIAfJX
	RQ//5MdKILIXz8m/ZsLheZBU/oiGSbRl2fKFnF2ra1WryZt9ZLPHxnHYJSaK1ID+mytUlc8nYaV
	5PzWVLaoaALoFUWeQ7EMf42NJjBR12Hy7DQ==
X-Received: by 2002:a17:907:c26:: with SMTP id ga38mr2672536ejc.38.1627653814932;
        Fri, 30 Jul 2021 07:03:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWNcPSq0sChCf8yeGm1VCDTCj5y7YK0ZOAnQUkLnjkO9q0Hq9IldEhamlXvjbuzBlZKUTmgQ==
X-Received: by 2002:a17:907:c26:: with SMTP id ga38mr2672213ejc.38.1627653809436;
        Fri, 30 Jul 2021 07:03:29 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id w6sm765114edd.22.2021.07.30.07.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 07:03:28 -0700 (PDT)
To: Jakub Kicinski <kuba@kernel.org>
References: <20210730065625.34010-1-krzysztof.kozlowski@canonical.com>
 <20210730065625.34010-8-krzysztof.kozlowski@canonical.com>
 <20210730064922.078bd222@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <53f89bae-fcb5-8e7c-0b03-effa156584fe@canonical.com>
 <20210730065830.547df546@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6f609952-cf76-58f9-1917-f06f3f376843@canonical.com>
Date: Fri, 30 Jul 2021 16:03:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730065830.547df546@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Language: en-US
Message-ID-Hash: QLZHWF6YRIWJ7X3G2SH22OLUGWJMVHGE
X-Message-ID-Hash: QLZHWF6YRIWJ7X3G2SH22OLUGWJMVHGE
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: "David S. Miller" <davem@davemloft.net>, linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2 7/8] nfc: hci: pass callback data param as pointer in nci_request()
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/QLZHWF6YRIWJ7X3G2SH22OLUGWJMVHGE/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 30/07/2021 15:58, Jakub Kicinski wrote:
> On Fri, 30 Jul 2021 15:56:19 +0200 Krzysztof Kozlowski wrote:
>> On 30/07/2021 15:49, Jakub Kicinski wrote:
>>> This generates a bunch of warnings:
>>>
>>> net/nfc/nci/core.c:381:51: warning: Using plain integer as NULL pointer
>>> net/nfc/nci/core.c:388:50: warning: Using plain integer as NULL pointer
>>> net/nfc/nci/core.c:494:57: warning: Using plain integer as NULL pointer
>>> net/nfc/nci/core.c:520:65: warning: Using plain integer as NULL pointer
>>> net/nfc/nci/core.c:570:44: warning: Using plain integer as NULL pointer
>>> net/nfc/nci/core.c:815:34: warning: Using plain integer as NULL pointer
>>> net/nfc/nci/core.c:856:50: warning: Using plain integer as NULL pointer  
>>
>> Indeed. Not that code before was better - the logic was exactly the
>> same. I might think more how to avoid these and maybe pass pointer to
>> stack value (like in other cases).
>>
>> The 7/8 and 8/8 could be skipped in such case.
> 
> We don't usually take parts of series, would you mind resending first 6
> or respinning with the warnings addressed?

Sure, no problem.


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
