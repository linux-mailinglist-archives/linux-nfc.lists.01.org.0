Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D7B48FDEF
	for <lists+linux-nfc@lfdr.de>; Sun, 16 Jan 2022 17:50:24 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 67D0E100EB856;
	Sun, 16 Jan 2022 08:50:22 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id E4E8B100EBB92
	for <linux-nfc@lists.01.org>; Sun, 16 Jan 2022 08:50:20 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4EB843F175
	for <linux-nfc@lists.01.org>; Sun, 16 Jan 2022 16:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642351816;
	bh=uu9EwQyUbuYOtlXdv8X6YvDBdNAXZT2Hiy2y1K9OCsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=Ah6xF7eC0TWXBsxmFjXPvU/9YqyLg9qkw/JSvMksPcoP/cYbJzPpp5jwtVWtLc3lO
	 ok+ELGEZbh1r+cd3JC+SsBQHUiSYvViwGmSVgKu0RwmC83eoK6LW6uU6NV7A7mrCcj
	 LflY1FAMO2o7ZBIej/P8VK+KAEm54Y9SlMirn/fu0MZBoRRYnsh8wuirF/XLWuoMY/
	 t3dEfBNQuLTgyzQtdunvgQpUdzQxfrOR6+iaNEPPZhVyZfi/J7gIO7dddnI7XWbxPG
	 OGMZ8oLqRK9//k38WNFqJhEfVDHIf0e2cR2ReHZUNjtntLGDscXZ+fnf/aOmXFdgRr
	 sVLE7l7fCQrqQ==
Received: by mail-ed1-f71.google.com with SMTP id c8-20020a05640227c800b003fdc1684cdeso12204820ede.12
        for <linux-nfc@lists.01.org>; Sun, 16 Jan 2022 08:50:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uu9EwQyUbuYOtlXdv8X6YvDBdNAXZT2Hiy2y1K9OCsE=;
        b=TGubjQb/m2CtM9ORpQehe/xUQCafuNk94FznxLvZczATvRjBWsy5OayL5Y3laxVqOz
         11qcFf6EluUtTBwgW+1YdOJSVG9oBEXLjaknDrP9214JFgUasvf1ZO9w1rTL/8kbrkT8
         58Th+KgXnXf19EDqfYyGmAMNC0Ne+wQEryuBfaiwniqbzo+d6jlMoaidqpxdHq3G1UH6
         5yYCADAStujCLw8mmo/paC4C5YXhnEUybqEFVhZcw2aEk+MvKH7bY57mVMX7Mrrgfbkq
         9mWBFwGVWaGOOlKdT9DQto4K65xUJec72yRqpzyxeTgWwo6PCbxqMarBEeW6PLINZjuH
         7Y3A==
X-Gm-Message-State: AOAM53365sIPYMjeVkJ8kovpq8sfezQZ/JUtYn+Pa9I5r/yW1BBLp2Wf
	JxvcU1SMQXvsPeJHPOKxAXWRPI6dLMvxsUQz8tyxwkCYKPwbT8sCh159J69MYjozLyYpT99QP1j
	MgOVQjHlK4N6tdwl+N7PFSMWMGqB+hN98PQ==
X-Received: by 2002:a17:906:3e8a:: with SMTP id a10mr13816084ejj.612.1642351815103;
        Sun, 16 Jan 2022 08:50:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTDkNNzbNUZrdQVQnZWdz82SY8ieh3/fjQzLtq01B7PHYFbyE/eHBt0M1wSkD8sdfYhWEPVA==
X-Received: by 2002:a17:906:3e8a:: with SMTP id a10mr13816070ejj.612.1642351814769;
        Sun, 16 Jan 2022 08:50:14 -0800 (PST)
Received: from [192.168.0.35] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id 7sm3585082ejh.161.2022.01.16.08.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jan 2022 08:50:14 -0800 (PST)
Message-ID: <ddce0e77-2fba-716f-6a69-eeb148fe91ca@canonical.com>
Date: Sun, 16 Jan 2022 17:50:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
To: Hillf Danton <hdanton@sina.com>
References: <20220115122650.128182-1-krzysztof.kozlowski@canonical.com>
 <20220116134122.2197-1-hdanton@sina.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220116134122.2197-1-hdanton@sina.com>
Message-ID-Hash: IQBN25PTEGMSNSEDWMHUI2LPGHWOTTHY
X-Message-ID-Hash: IQBN25PTEGMSNSEDWMHUI2LPGHWOTTHY
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, syzbot+7f23bcddf626e0593a39@syzkaller.appspotmail.com
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 1/7] nfc: llcp: fix NULL error pointer dereference on sendmsg() after failed bind()
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/IQBN25PTEGMSNSEDWMHUI2LPGHWOTTHY/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 16/01/2022 14:41, Hillf Danton wrote:
> Hey Krzysztof 
> 
> On Sat, 15 Jan 2022 13:26:44 +0100 Krzysztof Kozlowski wrote:
>> +++ b/net/nfc/llcp_sock.c
>> @@ -789,6 +789,11 @@ static int llcp_sock_sendmsg(struct socket *sock, struct msghdr *msg,
>>  
>>  	lock_sock(sk);
>>  
>> +	if (!llcp_sock->local) {
>> +		release_sock(sk);
>> +		return -ENODEV;
>> +	}
>> +
>>  	if (sk->sk_type == SOCK_DGRAM) {
>>  		DECLARE_SOCKADDR(struct sockaddr_nfc_llcp *, addr,
>>  				 msg->msg_name);
>> -- 
>> 2.32.0
> 
> Given the same check for llcp local in nfc_llcp_send_ui_frame(), adding
> another check does not help.

Helps, because other is not protected with lock. The other could be
removed, because it is simply wrong, but I did not check it.

The patch fixes the report and reproducible race, but maybe does not
necessarily fix entirely the race (which maybe this is what you meant by
"does not help"?).


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
