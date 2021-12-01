Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E79E6464A47
	for <lists+linux-nfc@lfdr.de>; Wed,  1 Dec 2021 10:00:43 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 7F5A9100F47BC;
	Wed,  1 Dec 2021 01:00:42 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 3D8B4100EAB44
	for <linux-nfc@lists.01.org>; Wed,  1 Dec 2021 01:00:40 -0800 (PST)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0CA223F1F1
	for <linux-nfc@lists.01.org>; Wed,  1 Dec 2021 09:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1638349239;
	bh=nfPQms7Vq6yFTHbRUn5fpD5ZtXele/imXKAWJ2K3gBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type;
	b=wYpmS4bJWGaBHngDy8owTUI20rbhB+zxDycDuqkLtMTPUHhhekRVkprt5GvFHlNqW
	 OETcr37FKD7yuJ9s0+AB05tuHZqAbSku5ds/dL+8onfUNZx5S1cxEFzIbpf92YJ7T9
	 GbQBSYuowCiEYB6mP5tmAc3vtJsPmcpdjcO9+L3c/wobWU/MOiQ2ZBNjK/CSbjhOKE
	 5RJ9IF9n0eT+MYoSfFZeEQMG40Ki1pswstbOzmIkIsxxR30+FXd69oPhRwl4EBj9yU
	 rSOAMBW5aJJVvtiax61ToSSnV3rEOOUH/isSPeNQGTaxvdWU0Cqs/Z+pCSyXK8Xo5v
	 Mm9Tf5Nre587g==
Received: by mail-lj1-f198.google.com with SMTP id o15-20020a2e90cf000000b00218dfebebdeso8457498ljg.13
        for <linux-nfc@lists.01.org>; Wed, 01 Dec 2021 01:00:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nfPQms7Vq6yFTHbRUn5fpD5ZtXele/imXKAWJ2K3gBs=;
        b=mWaxzC48YJ6mHylN++pdOpkYwtVufuWsvsbtF7gYDvKxeWCsU+0fHgNbkEwdNt/axS
         KYfDDayGF4sCI7St18mShumqagLaQflX51WvXJy4KE4QYpMKpdDqo6cKqyDqE+XjWe5Q
         zpsK2/9Tpbf6xOcH161AV51E3HyYBLHczjca0n1JeFZDze9TNBWB2jmDPFWzklewQziS
         VkZQO38EZgcazDRqmO4NcLpOAvT9A7sD3N7zNalTgqOHCmfpOOVcjjGjtP0c63Ucr3w/
         2aH3qQDfpGiAuVJwbA5NGYSMHi9BBuJNWGfQ06PRVbq1E3Z8NMDf6xlBD6R/KXuZvwCE
         DRSQ==
X-Gm-Message-State: AOAM533FrG6E5kHFUNbjSeTbSc2abB6/CxSwEqGEqdBvEBXtut5pCxHk
	SB9dHb63PrMItEK9O6iiizG4PqBydi7U8eb0eGIQyludbzYhyrJVWxVKCoJ4Qq72btPvMVfbLOj
	koT0r5TG6LCQNdvgDKqPeULHgkrVqpRB7Vg==
X-Received: by 2002:ac2:4e09:: with SMTP id e9mr4439960lfr.657.1638349238143;
        Wed, 01 Dec 2021 01:00:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5ERviNdJDlDaDuTBQT5EfZ9NbVVlesdgzlZAykGLdjgmo6sOiPowdH0OH/J4IqBsF1tDmjQ==
X-Received: by 2002:ac2:4e09:: with SMTP id e9mr4439945lfr.657.1638349237980;
        Wed, 01 Dec 2021 01:00:37 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id r14sm2009867lfp.305.2021.12.01.01.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Dec 2021 01:00:37 -0800 (PST)
Message-ID: <e7ff7ef9-f3f2-d063-141a-63019616db52@canonical.com>
Date: Wed, 1 Dec 2021 10:00:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
To: Mark Greer <mgreer@animalcreek.com>, linux-nfc@lists.01.org
References: <20211129050606.873494-1-mgreer@animalcreek.com>
 <20211129050606.873494-3-mgreer@animalcreek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211129050606.873494-3-mgreer@animalcreek.com>
Message-ID-Hash: EROEU27UHEJ4XCJH6WY6ZYUDDHE2MMAL
X-Message-ID-Hash: EROEU27UHEJ4XCJH6WY6ZYUDDHE2MMAL
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2 2/6] test: Convert test script from Python2 to Python3
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/EROEU27UHEJ4XCJH6WY6ZYUDDHE2MMAL/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 29/11/2021 06:06, Mark Greer wrote:
> Python2 is deprecated so convert the neard test scripts, which are
> Python2, to Python3.
> 
> Signed-off-by: Mark Greer <mgreer@animalcreek.com>
> ---
>  test/bt-handover         |  8 ++---
>  test/handover-agent      | 34 +++++++++----------
>  test/monitor-near        | 10 +++---
>  test/ndef-agent          | 20 ++++++------
>  test/neard-ui.py         | 70 ++++++++++++++++++++--------------------
>  test/neardutils.py       | 17 ++++------
>  test/phdc-simple-manager | 50 ++++++++++++++--------------
>  test/test-adapter        | 16 ++++-----
>  test/test-device         | 34 +++++++++----------
>  test/test-tag            | 10 +++---
>  10 files changed, 132 insertions(+), 137 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
