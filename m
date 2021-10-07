Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48819425395
	for <lists+linux-nfc@lfdr.de>; Thu,  7 Oct 2021 15:01:34 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id AEA3F100EA92E;
	Thu,  7 Oct 2021 06:01:32 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id C956E100EA92D
	for <linux-nfc@lists.01.org>; Thu,  7 Oct 2021 06:01:29 -0700 (PDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C136440004
	for <linux-nfc@lists.01.org>; Thu,  7 Oct 2021 13:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633611687;
	bh=CWLF3Mwbuv27wfSQ2ZR3naLE1cJ0EA/H/ZCKfT8DDNk=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=ltUNq2q728kxrAGG+8SXOMIjL7Nm9WvqfAgtUYnpucWTYJNZ87SI5nA5rxRd2mxIx
	 bzqeKRk6lLcghgo8LhLOVSk9spzAQDeMpN+CJqlVgc1lm/ZPAFk1fNTPbiDxxsSS0K
	 8+i+ofTHgXG5NfSta/CSEX5OF9yqD77wjIMp3lTltLttyId5J3ONF8FfpA+Jd43TFy
	 idHcZ1gA9qaeM6nut9Tdh/4PEfY9suOlbpwx3VOkSKUVqBJ5CNrNiP/pkZb9FgT/QB
	 36Iy1QZOj+kkUU73GIFWsCfnBpquqjPgmUcbVr/SzWEXhCGmM5Jg5y5yvpq0TA+YDs
	 /S5iDwO4DvVuw==
Received: by mail-ed1-f71.google.com with SMTP id t28-20020a508d5c000000b003dad7fc5caeso5792306edt.11
        for <linux-nfc@lists.01.org>; Thu, 07 Oct 2021 06:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CWLF3Mwbuv27wfSQ2ZR3naLE1cJ0EA/H/ZCKfT8DDNk=;
        b=jl9S/T2ytLpkRVu8q8kZw3bVBttkYvmHhxdd+u8vhXfT/K7PDsQWv3smkzfFhSfzgu
         +jpzfMJY8wJJ/mX+xHrpkFhoGE24JoI4BXHYz6stPfD0NkPl5skOh1izYX7LZGCMO2F/
         ZCOrmg6uRZe8Xn8D6rl04hwXEy8O60iRc+8X1bJ9KPRL3nO+JDiQzF2yQx1IRVLqCliS
         BAeT2jnoGJWYZ6OQXIssAzejP0cf3LpOXsFxZO947l1neErsbrUo6w8uAQOLl74V46aB
         mW80C2aUCNVEiPB2giHqT9GZPvQJXW0E/YXa2/70GqoNSlLTesfsDqixzbJ5MaZT4cyw
         680w==
X-Gm-Message-State: AOAM533rbAjwl5knLz33Zh33dCTlu2dtTl9vgGcYcJzEY2Yx57xRSOEf
	tL9nRTi3Cdik3lFsqXTwkrCT3rVGtI//wsheybxGpufIYuZhYc5wguzrmQyMFRf5Bm7YjIbQ1F5
	fn6st+eW6fZV/yTZmV4lk0gjoPR/6g1fcLg==
X-Received: by 2002:a50:d98d:: with SMTP id w13mr6249836edj.51.1633611687537;
        Thu, 07 Oct 2021 06:01:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsGkLjq/HVHDfN4bAucyZ/pV1jwbbBY9M9ehNU17nvM5neTPUW/YNaP9/xGkH5n1G9eNdJaw==
X-Received: by 2002:a50:d98d:: with SMTP id w13mr6249781edj.51.1633611687059;
        Thu, 07 Oct 2021 06:01:27 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id m23sm2258674eja.6.2021.10.07.06.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 06:01:26 -0700 (PDT)
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
References: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
 <20210913132035.242870-13-krzysztof.kozlowski@canonical.com>
 <20210913165757.GA1309751@animalcreek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <47eae95d-d34c-1fa7-fea9-6e77a130aa97@canonical.com>
Date: Thu, 7 Oct 2021 15:01:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913165757.GA1309751@animalcreek.com>
Content-Language: en-US
Message-ID-Hash: 5LT5LCUHLYWJYMY2MW6NFJRUORMS2POT
X-Message-ID-Hash: 5LT5LCUHLYWJYMY2MW6NFJRUORMS2POT
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2 12/15] nfc: trf7970a: drop unneeded debug prints
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/5LT5LCUHLYWJYMY2MW6NFJRUORMS2POT/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 13/09/2021 18:57, Mark Greer wrote:
> On Mon, Sep 13, 2021 at 03:20:32PM +0200, Krzysztof Kozlowski wrote:
>> ftrace is a preferred and standard way to debug entering and exiting
>> functions so drop useless debug prints.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  drivers/nfc/trf7970a.c | 8 --------
>>  1 file changed, 8 deletions(-)
>>

Hi Jakub and David,

Some patches from this set were applied, but rest was not. All of them
are however marked as accepted:
https://patchwork.kernel.org/project/netdevbpf/list/?series=545829&state=*

I think something got lost. Could you apply missing ones or maybe I
should rebase and resend?


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
