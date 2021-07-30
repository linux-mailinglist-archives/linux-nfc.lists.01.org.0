Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 983973DB9D6
	for <lists+linux-nfc@lfdr.de>; Fri, 30 Jul 2021 15:56:27 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 68424100EB839;
	Fri, 30 Jul 2021 06:56:24 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 6A455100EBBCB
	for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 06:56:23 -0700 (PDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 624133F239
	for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 13:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627653381;
	bh=lARzsFFKndNN9dr3t+/u0cyc0ObFsz25/ZNbpOuqiCk=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=BFTuQGJz0deDosa4zG7ihL4XwFHAEo7iw3+9Y1z7AU9cuHLVN7OwcYuYFaSwnhnjy
	 pr6nxKoZZYaoX58Gg53F27T2TgvErEwMvX03H2alzwanQsJilwidKdBGFyNu1S5wRe
	 VJTsnyudwiCb4fkF3PKBIAQvVDr+WBntSFJ/zfENgmuOPVaduZHY9Psu1o9lt9XQPK
	 Kdoxi98OQCdh/OuKVLEjfKhNowlIRYErjU92SSZbZImDONUDwPR3VkQit0fqjQbu+f
	 8FETe3/7RMh9vQ8o984oSnC3/yFgOPory8IFHadx4UdNc6kzN1naruLWIpTlyWQnMb
	 09+PJsVZb7UZg==
Received: by mail-ed1-f71.google.com with SMTP id de5-20020a0564023085b02903bb92fd182eso4691691edb.8
        for <linux-nfc@lists.01.org>; Fri, 30 Jul 2021 06:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lARzsFFKndNN9dr3t+/u0cyc0ObFsz25/ZNbpOuqiCk=;
        b=Sq3gCdlMsAvVZWRfLDeeoyjFat3zeXqQYDbx5f3A9eaPCJZ3UU6eJ+D1dWwVudRj0q
         fiDEnk3KcAnr8V6ihbk56URDRDC+9MWfmjomzB5qFWZKzbD5arWUKYl0JrnwZmHnlx6M
         +LepVmLEZa1KSdQCoUlswwCVeBb0aZ+lX0pytxjpcbubKZ5JYMDnaI4eFNeE83+Z/UlF
         akZO77bSw/iLBL3P/TfTX/VeSAa1paqRrV8tMCSg/EAx+uAgzA4u6l2MXxFjAyDGr7a7
         OdjM/M6rLYRfIdd5mzziFoQ/JIlIzu+goKJoI1eW6PmxKT2Xc51nmhPrIcfWgMVwFLnB
         1XCg==
X-Gm-Message-State: AOAM532VMzLZsxYQhaMpgYSSejGNfOCLxk9UNn54VFvBtiMW/KA8IKzj
	gHORBHrGszqd+txi9Ol04Vy/cv8CUPyXW+Wo2Dd8UzrhcXE/GBPc95u2D+JBjGlJ+GliKMdfntD
	7ER2Yqu69ujvK9TjVdATa7ElZfTWZmzBWhg==
X-Received: by 2002:a05:6402:51c7:: with SMTP id r7mr3249751edd.150.1627653381107;
        Fri, 30 Jul 2021 06:56:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVO/TZcid1GbI+VKszynUFz37DfSLb78lTq4sraurPgpb2E6eKicuL9nwvbLgEGd+vhDfkZg==
X-Received: by 2002:a05:6402:51c7:: with SMTP id r7mr3249721edd.150.1627653380787;
        Fri, 30 Jul 2021 06:56:20 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id m26sm730890edf.4.2021.07.30.06.56.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 06:56:20 -0700 (PDT)
To: Jakub Kicinski <kuba@kernel.org>
References: <20210730065625.34010-1-krzysztof.kozlowski@canonical.com>
 <20210730065625.34010-8-krzysztof.kozlowski@canonical.com>
 <20210730064922.078bd222@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <53f89bae-fcb5-8e7c-0b03-effa156584fe@canonical.com>
Date: Fri, 30 Jul 2021 15:56:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730064922.078bd222@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Language: en-US
Message-ID-Hash: K2JFIP6NDMFLLELD6POBRU3SLVYKVACL
X-Message-ID-Hash: K2JFIP6NDMFLLELD6POBRU3SLVYKVACL
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: "David S. Miller" <davem@davemloft.net>, linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2 7/8] nfc: hci: pass callback data param as pointer in nci_request()
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/K2JFIP6NDMFLLELD6POBRU3SLVYKVACL/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 30/07/2021 15:49, Jakub Kicinski wrote:
> On Fri, 30 Jul 2021 08:56:24 +0200 Krzysztof Kozlowski wrote:
>> The nci_request() receives a callback function and unsigned long data
>> argument "opt" which is passed to the callback.  Almost all of the
>> nci_request() callers pass pointer to a stack variable as data argument.
>> Only few pass scalar value (e.g. u8).
>>
>> All such callbacks do not modify passed data argument and in previous
>> commit they were made as const.  However passing pointers via unsigned
>> long removes the const annotation.  The callback could simply cast
>> unsigned long to a pointer to writeable memory.
>>
>> Use "const void *" as type of this "opt" argument to solve this and
>> prevent modifying the pointed contents.  This is also consistent with
>> generic pattern of passing data arguments - via "void *".  In few places
>> passing scalar values, use casts via "unsigned long" to suppress any
>> warnings.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> This generates a bunch of warnings:
> 
> net/nfc/nci/core.c:381:51: warning: Using plain integer as NULL pointer
> net/nfc/nci/core.c:388:50: warning: Using plain integer as NULL pointer
> net/nfc/nci/core.c:494:57: warning: Using plain integer as NULL pointer
> net/nfc/nci/core.c:520:65: warning: Using plain integer as NULL pointer
> net/nfc/nci/core.c:570:44: warning: Using plain integer as NULL pointer
> net/nfc/nci/core.c:815:34: warning: Using plain integer as NULL pointer
> net/nfc/nci/core.c:856:50: warning: Using plain integer as NULL pointer

Indeed. Not that code before was better - the logic was exactly the
same. I might think more how to avoid these and maybe pass pointer to
stack value (like in other cases).

The 7/8 and 8/8 could be skipped in such case.

> 
> BTW applying this set will resolve the warnings introduced by applying
> "part 2" out of order, right? No further action needed?

Yes, it will resolve all warnings. No further action needed, at least I
am not aware of any new issues.

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
