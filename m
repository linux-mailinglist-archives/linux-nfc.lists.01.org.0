Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B81148FE10
	for <lists+linux-nfc@lfdr.de>; Sun, 16 Jan 2022 17:58:36 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 10F77100F2262;
	Sun, 16 Jan 2022 08:58:35 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id EB96A100F2245
	for <linux-nfc@lists.01.org>; Sun, 16 Jan 2022 08:58:31 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A5FE13F206
	for <linux-nfc@lists.01.org>; Sun, 16 Jan 2022 16:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642352310;
	bh=QUxJvjdxOHxqcyIcyp2pPFZDYQTODmNTcXQxvaV9Jjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=ftPlrLkRhGTZgouvChla3eVFmJ2AfzuXRY7WZkWB5RlgFcmfJ8F8tyNcTCY1HzJnh
	 esbBlojjMGjgUUcf67UPdwvZVDDhFu52DfgVJ0LZh42h3+fUZd6ez5HaVi6ufGWeNe
	 jiVXz7CFvpnkWd9TozvJoaT+ZNpg4zeTACMQWrq5NEIAfVVZ1932X4s+2IZ+hanmdg
	 Ly3F0L1YXra2v6EUQFkBeVu7eq621akH00i8jiQVIfJDTnfcxidGqJiNDFtEqvXf7l
	 szrV3HmpMRqE0HvMjZCD77Hvh0HUL/F0FhIa8H8dIVb0J9EHFWuGnWmCV4DHvqjJfj
	 BG4DOo3fQIDkw==
Received: by mail-ed1-f72.google.com with SMTP id v18-20020a056402349200b003f8d3b7ee8dso12161341edc.23
        for <linux-nfc@lists.01.org>; Sun, 16 Jan 2022 08:58:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QUxJvjdxOHxqcyIcyp2pPFZDYQTODmNTcXQxvaV9Jjs=;
        b=6/2Bs9d0nyrdF6JqG+YHGauf9FnQAgFDrgM/yKpQlNIjnIEA8OfUX5HP38LRCzhbyV
         k+3uoPqZ/6AYraj5vk78RLSfRr5w1z0xaL59n6hDYL2GUvjLlgOpj43mHhP7xkmO751r
         s13HXq6GQBrLj3IJ51ZowECjNg2hlIwSZZyY4AWgj2pBlW6BDtEz3Q92GpVr1EJqdd97
         BnKRkc1BCNquFSE6QUxrC1fNtgvqJ9/UUIqmWdnU6U0y1ZhHmSntZNQutg0dIW6ziUaW
         SuhQzqZsOGkVvfidT7sys9hhga3DsjTl4lcu34BK7gyCxb53jWk/+SnERGYZFpluGID4
         lJLQ==
X-Gm-Message-State: AOAM533LoN4an6lYPt/SMFpELiM9X+l+qX3ENAZNRc+uDSuEzpd1Sjpe
	0++HjyRVnFrtJ/vRYiwuYAJoWW1wW6+lYncTIOxk3T8BXzpFoP/AbjS3RjyJyKEJViF1Htu0dlY
	cp45cB2NTwzN8xnwo2+JLtkgF9u4W1je+oQ==
X-Received: by 2002:aa7:c9ca:: with SMTP id i10mr17883778edt.66.1642352310302;
        Sun, 16 Jan 2022 08:58:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9w3mtLdhSj54CtN8jzh+J3pJj+RpZnbf53zhH8BPmWKIKMsfiJF8bekVl02LG0GPUAmtMqQ==
X-Received: by 2002:aa7:c9ca:: with SMTP id i10mr17883761edt.66.1642352309854;
        Sun, 16 Jan 2022 08:58:29 -0800 (PST)
Received: from [192.168.0.35] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id pk12sm382094ejb.35.2022.01.16.08.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jan 2022 08:58:29 -0800 (PST)
Message-ID: <9fcef93a-7afa-06ad-66e4-2cb22c6ea0ae@canonical.com>
Date: Sun, 16 Jan 2022 17:58:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
To: David Miller <davem@davemloft.net>
References: <20220115122650.128182-1-krzysztof.kozlowski@canonical.com>
 <20220116.123211.1251576778673440603.davem@davemloft.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220116.123211.1251576778673440603.davem@davemloft.net>
Message-ID-Hash: KICEZ3U3LHMGHPHPZ5DXRLMLIA4ZPFYQ
X-Message-ID-Hash: KICEZ3U3LHMGHPHPZ5DXRLMLIA4ZPFYQ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: kuba@kernel.org, linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 0/7] nfc: llcp: fix and improvements
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/KICEZ3U3LHMGHPHPZ5DXRLMLIA4ZPFYQ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 16/01/2022 13:32, David Miller wrote:
> 
> Please don't mix cleanups and bug fixes.

The fix is the first patch, so it is easy to apply. Do you wish me to
resend it?


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
