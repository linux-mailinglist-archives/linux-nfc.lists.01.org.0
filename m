Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1D9390039
	for <lists+linux-nfc@lfdr.de>; Tue, 25 May 2021 13:42:42 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 800A9100EF276;
	Tue, 25 May 2021 04:42:38 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 27318100EF267
	for <linux-nfc@lists.01.org>; Tue, 25 May 2021 04:42:37 -0700 (PDT)
Received: from mail-ua1-f71.google.com ([209.85.222.71])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1llVSF-0006jV-SK
	for linux-nfc@lists.01.org; Tue, 25 May 2021 11:42:35 +0000
Received: by mail-ua1-f71.google.com with SMTP id t19-20020ab021530000b029020bc458f62fso12929321ual.20
        for <linux-nfc@lists.01.org>; Tue, 25 May 2021 04:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VXjoVJRWk5TrrriWnFtDbtKUT3FPojwGMjJKb1jQu0A=;
        b=oEO/F8r9viGlkpuMycqUJGV8MP+E/sEsg7ylCE01zXTkj6iVToSnRyyylF6xe6dVwL
         rmr0Flg+/dNRUs3fWU8UBPYZPH1iXSMrlFnXe+0cDx6uHi6bx2iYNHxa4DKENkbYmdzY
         k85uQ19H5oGGppDg7p4OWAXyPjjPc3YzY+GtALbSbKIA+0yb9fdZB4rgQDn/PirW2PxT
         4CtbuOfZdxj5xYsD/TOAiU02nklZ1QJ6FCtud9hpWsOHsNwTs7yPK743VDGHTHp81Q+D
         pHh31EUYAThIkyz8EASlLf4BvKRWcWOGyKbecewTqH4vVjjqDjlb8Ova9gVe0QCa7J4i
         8YrQ==
X-Gm-Message-State: AOAM533g433nvzJxc90eV8pkRxl3qxCu3Llep0WwTLCASi53z8/0cDTq
	X8+3jwI4+uD6J2KetHZmRgsYIH2sJ2lNKATML2wKHMcRDgfk70J127juMDr6Vscb+XZsTyMXy5J
	PIXj+CdrnP4z4oGikQWPgNINzQQAKFmLxRQ==
X-Received: by 2002:a67:386:: with SMTP id 128mr25118095vsd.16.1621942955041;
        Tue, 25 May 2021 04:42:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhH2Oy6U2MwqDvTIgHPfHj+dUj4sa4mqqqYZABnajBnsS6pfEVpV2mlZePB62r/vU58NqBIQ==
X-Received: by 2002:a67:386:: with SMTP id 128mr25118092vsd.16.1621942954888;
        Tue, 25 May 2021 04:42:34 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.1])
        by smtp.gmail.com with ESMTPSA id b26sm1555470vsh.23.2021.05.25.04.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 04:42:34 -0700 (PDT)
To: samirweng1979 <samirweng1979@163.com>, davem@davemloft.net
References: <20210525031254.12196-1-samirweng1979@163.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <93e67699-a0c4-7fe7-6c38-aeff68a3881f@canonical.com>
Date: Tue, 25 May 2021 07:42:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210525031254.12196-1-samirweng1979@163.com>
Content-Language: en-US
Message-ID-Hash: 4K4ANKINMH6FGDEZOJMGAIDKXYBR4Y4Z
X-Message-ID-Hash: 4K4ANKINMH6FGDEZOJMGAIDKXYBR4Y4Z
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, wengjianfeng <wengjianfeng@yulong.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] nfc: st-nci: remove unnecessary labels
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/4K4ANKINMH6FGDEZOJMGAIDKXYBR4Y4Z/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 24/05/2021 23:12, samirweng1979 wrote:
> From: wengjianfeng <wengjianfeng@yulong.com>
> 
> In some functions, use goto exit statement, which just return r.

This is not parseable. Imperative "use goto" suggest that it's the
change you make.

> and exit label only used once in each funciton, so we use return

Every sentence in English starts with capital letter. They however
cannto start with "and" because it joins two parts of sentences.

s/funciton/use the spellcheck please/

The code looks good, but please spend some time to make the description
understandable. You can also make it very short, to avoid complicated
sentences. Look for examples in Linux kernel how other people wrote it.


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
