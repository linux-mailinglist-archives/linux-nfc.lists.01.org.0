Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D1C5BE7B3
	for <lists+linux-nfc@lfdr.de>; Tue, 20 Sep 2022 15:54:40 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 666D2100EA2DF;
	Tue, 20 Sep 2022 06:54:36 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN> 
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 21760100EBB7F
	for <linux-nfc@lists.01.org>; Tue, 20 Sep 2022 06:54:33 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id x29so3111535ljq.2
        for <linux-nfc@lists.01.org>; Tue, 20 Sep 2022 06:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=wBzI+FDP/xHbpMc4ZR1RvLoZ+WufA1CKuPKcPQeIWxs=;
        b=jKP4O2Vs5dgzrrV3QjJGsS/tq+4AAw9Cn0UMg7Z6+RT5/S8x55GBEmciQyE2xBxHNl
         cLEOAq+ndnid9UY81L7XfUzwUAOo5jDRyRbeCuYPY4Tm4U3mlu4CWwBBwhg6yjKuY1Jg
         9/naHdgqElN1RZGaH9ErYL6Lbtjo/zvZy/0qP6+HwVfM0DbxeNYkgLTWVFrIGPUwFGrI
         R0bywwdc02ZDYB1rk27nDWXxeczPZ1gBsH9WcfAzC6Ow2y/Kw1wuwAjBfNKDdUDUbFO6
         /1vcUU8n1TN/qwbOJ2Tg1l9doC45MY9Axh2lDP5oq2E16JdYboriwb0t9iRscsBIKRCs
         Z+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=wBzI+FDP/xHbpMc4ZR1RvLoZ+WufA1CKuPKcPQeIWxs=;
        b=CEARRu3Xd3eVY3KoJ4GmnMgfMeOiio7Vpv7K7LjNH8RR3nxxUPWD82L/+YaXDTLiHe
         IngxfMQnW3TUyTZMjwcfvMMskLXOoR3y/Wc8NCrEHbDLvmACi3pzqzKjhRn2uBz8O/PX
         D3bMOvnwwCAPGcf/y6GLsWYQ8KC/9euMlPdFXAixm0P51A7x5rW2CzO+gW2rjPIuA+Mk
         zDP1S80U3CXwCVuYBrIKasxOmaw88qm9u6jZ4CZeYHARE+iqc3kePWd1POBnKrdK45I4
         9GvipFjsJuCvAgE3mi5iItUaRqtUJ4nOikagc9MaBpt+ATRfDl0jEvTFPZrhC3iWghtN
         NBww==
X-Gm-Message-State: ACrzQf0n69/TiTCjB2ufGVeewjehYDaW2BAR5Ac+nQQJgOjC1BbT6AQ5
	e+w+FUQLfggvIQMylqCHwN9WzQ==
X-Google-Smtp-Source: AMsMyM7qwNQsEBzVzh51pbKzZ073N0bCU/uLTdwj8t+B9IR78GGUWgkfjRPrW7ec6ftreXNBIXP7qw==
X-Received: by 2002:a2e:964b:0:b0:26c:5a42:ed99 with SMTP id z11-20020a2e964b000000b0026c5a42ed99mr1310939ljh.169.1663682071302;
        Tue, 20 Sep 2022 06:54:31 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u22-20020a05651c131600b0026c4113c150sm8590lja.111.2022.09.20.06.54.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 06:54:30 -0700 (PDT)
Message-ID: <18828928-415f-2faa-8069-b4d01fa38fc6@linaro.org>
Date: Tue, 20 Sep 2022 15:54:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Rondreis <linhaoguo86@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "linux-nfc@lists.01.org"
 <linux-nfc@lists.01.org>
References: <CAB7eexL3ac2jxVQ70Q06F6sK9VdwY2aoO=S6OqYu7DTgFMg6tQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAB7eexL3ac2jxVQ70Q06F6sK9VdwY2aoO=S6OqYu7DTgFMg6tQ@mail.gmail.com>
Message-ID-Hash: XK6BNTUELSQ6YWV47UHHCAD76BNUKYXK
X-Message-ID-Hash: XK6BNTUELSQ6YWV47UHHCAD76BNUKYXK
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: task hung in port100_send_cmd_sync
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/XK6BNTUELSQ6YWV47UHHCAD76BNUKYXK/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 18/09/2022 15:22, Rondreis wrote:
> Hello,
> 
> When fuzzing the Linux kernel driver v6.0-rc4, the following crash was
> triggered.

Hi,

Thanks for the report.

> 
> HEAD commit: 7e18e42e4b280c85b76967a9106a13ca61c16179
> git tree: upstream
> 
> kernel config: https://pastebin.com/raw/xtrgsXP3
> C reproducer: https://pastebin.com/raw/hjSnLzDh
> console output: https://pastebin.com/raw/3ixbVNcR
> 
> Basically, in the c reproducer, we use the gadget module to emulate
> attaching a USB device(vendor id: 0x54c, product id: 0x6c1, with the
> printer function) and executing some simple sequence of system calls.
> To reproduce this crash, we utilize a third-party library to emulate
> the attaching process: https://github.com/linux-usb-gadgets/libusbgx.
> Just clone this repository, install it, and compile the c
> reproducer with ``` gcc crash.c -lusbgx -lconfig -o crash ``` will do
> the trick.
> 
> I would appreciate it if you have any idea how to solve this bug.

You can try to bisect. Or you can build kernel with lockdep and try to
reproduce.

> 
> The crash report is as follows:

It's not a crash, but a blocked task, so there might be deadlock,
incorrect synchronization or some missing cleanup path. Actually quite a
lot could lead to this.

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
