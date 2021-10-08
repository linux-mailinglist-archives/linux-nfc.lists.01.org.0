Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA880426821
	for <lists+linux-nfc@lfdr.de>; Fri,  8 Oct 2021 12:46:39 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 88623100EB847;
	Fri,  8 Oct 2021 03:46:37 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id EF88E100EB83E
	for <linux-nfc@lists.01.org>; Fri,  8 Oct 2021 03:46:34 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0AE5940010
	for <linux-nfc@lists.01.org>; Fri,  8 Oct 2021 10:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633689993;
	bh=3cr8zX2dAw0svXJgbkiM05M80BJoKzttTWvDR09S5uE=;
	h=Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=FKKCggq0k/F8FSv/8g+6vc3kYAI6ttzEBhmtZc5svjFKZRZHHNn2qqYB7SlrSJgqg
	 /CQfg9sxQZKOj5IeDWdd851KE7sehE4BHy7G40GMadO6CBHYTJKV+2FUlBQ/MZLY4t
	 wMoPVOyQgw0/mUGfTvkek5MYSe04y0XgnFPIM4aO0RefI3v1hyvZlV+K/r7+glhfZP
	 Qs3cEjoU/dxBw4nM7cJiBHmMSiaBt6AgvqTSmAU8sG9xugmgwbF4dBrBVMYKIPBGAI
	 uRifEvQHiTTCTFtJVnyaxvcznLPqExZOMW2WBCUDqwEjU4wHs2uwFiw8GuKNVj0ru0
	 sVpU9TqYD/WeA==
Received: by mail-ed1-f70.google.com with SMTP id d11-20020a50cd4b000000b003da63711a8aso8756730edj.20
        for <linux-nfc@lists.01.org>; Fri, 08 Oct 2021 03:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3cr8zX2dAw0svXJgbkiM05M80BJoKzttTWvDR09S5uE=;
        b=D1+p/fPGJO09RSTfmJpdUE7ipJTmWwXxUCJKpGom4t68qH5fss+5cV1azbuhbwiSbJ
         F9KVKEp7f+H23Dh1mNHo1P6C9YYzpl3bxRBDobDcj70q6RZr9dLkZM3hl/ei7iKPddlt
         7JpU2yBz7SJ1crNbbISh+UjZwu5KLAk5uidKat3AkbRB+HwFpsuoX2SCvPeIWYkI0vf+
         e9dTp1rRssqNUPmboCLg1IbubYvZs0haCSrVnHH/HfLMzEHNkbo/QzsO18cCk5/MLjIO
         uLYwqawhr9P4rUiSeIecnZmXyoMOP/zWFO55Uw6c0/US+QYWofJAHDs+rNSAHlc/2tq3
         fAOw==
X-Gm-Message-State: AOAM5325G/FmfbN2IXkW1x/BuwpTWc1WWpCVBvAWX1mYgmkMTSEY7Syv
	oEnYIQrlDvEh45zrCZ8EaOCLuJy5TiyofmBbmZmiqJIVO7YntDcr+vRSOQJLfUbKFC/k8g74OYq
	uLf70X9K7GoBls8JmJ2v4fEQGXEwEE6hjtQ==
X-Received: by 2002:aa7:cd90:: with SMTP id x16mr14673683edv.148.1633689992417;
        Fri, 08 Oct 2021 03:46:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCnuwvEp45zrynOfgAiJNTLTmF14F6ci1bs8PUwWz6ORr06pt51TTTkRL3uoEToyDmY4LVUw==
X-Received: by 2002:aa7:cd90:: with SMTP id x16mr14673660edv.148.1633689992271;
        Fri, 08 Oct 2021 03:46:32 -0700 (PDT)
Received: from [192.168.1.24] (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id y4sm324097ejw.3.2021.10.08.03.46.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Oct 2021 03:46:31 -0700 (PDT)
To: Joe Perches <joe@perches.com>, Krzysztof Opasiak <k.opasiak@samsung.com>,
 Mark Greer <mgreer@animalcreek.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 linux-nfc@lists.01.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
References: <20211007133021.32704-1-krzysztof.kozlowski@canonical.com>
 <20211007133021.32704-3-krzysztof.kozlowski@canonical.com>
 <34cc3eda06fa2e793c46b48ee734fd879e6f8ab1.camel@perches.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <9669a6cd-77de-ca0c-153c-75b531bd2490@canonical.com>
Date: Fri, 8 Oct 2021 12:46:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <34cc3eda06fa2e793c46b48ee734fd879e6f8ab1.camel@perches.com>
Content-Language: en-US
Message-ID-Hash: WJYEVYU5PV2YDVCNES4L3FAEN6KT6UIT
X-Message-ID-Hash: WJYEVYU5PV2YDVCNES4L3FAEN6KT6UIT
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [RESEND PATCH v2 2/7] nfc: nci: replace GPLv2 boilerplate with SPDX
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/WJYEVYU5PV2YDVCNES4L3FAEN6KT6UIT/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 08/10/2021 12:33, Joe Perches wrote:
> On Thu, 2021-10-07 at 15:30 +0200, Krzysztof Kozlowski wrote:
>> Replace standard GPLv2 only license text with SPDX tag.
> 
> Nak
> 
> This is actually licenced with GPL-2.0-or-later
> 
>> diff --git a/net/nfc/nci/uart.c b/net/nfc/nci/uart.c
> []
>> @@ -1,20 +1,8 @@
>> +// SPDX-License-Identifier: GPL-2.0
> []
> You may use, redistribute and/or modify this File in
>> - * accordance with the terms and conditions of the License, a copy of which
>> - * is available on the worldwide web at
>> - * http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
> 
> See the actual text at the old link which includes:
> 
>     This program is free software; you can redistribute it and/or modify
>     it under the terms of the GNU General Public License as published by
>     the Free Software Foundation; either version 2 of the License, or
>     (at your option) any later version.


Thanks Joe for checking this. Isn't this conflicting with first
paragraph in the source file:

  This software file (the "File") is distributed by Marvell
InternationalLtd. under the terms of the GNU General Public License
Version 2, June 1991(the "License").

This part does not specify "or later".

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
