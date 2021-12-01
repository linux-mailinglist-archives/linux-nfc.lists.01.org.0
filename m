Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAE0464A6C
	for <lists+linux-nfc@lfdr.de>; Wed,  1 Dec 2021 10:15:38 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E4731100F4846;
	Wed,  1 Dec 2021 01:15:36 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B49D9100F4845
	for <linux-nfc@lists.01.org>; Wed,  1 Dec 2021 01:15:35 -0800 (PST)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 018403F1BD
	for <linux-nfc@lists.01.org>; Wed,  1 Dec 2021 09:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1638350133;
	bh=4UbWlcXj2YADUHfXSjXEbz9ALdk7SF7NU0zYPyXULCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type;
	b=EZ/Jy8i3wtzUXuTCe/ydwlHeLb3GKKh5MPm+fn2mT8Y5bosFj3cvOECakwY0aCvgZ
	 aLFiH0hVjn2bGfmZgkFTycleNgSXz9BrR/4kRpIQ5gwWrzSgZi3vW3hvQb8bRGmGE8
	 TlTv63q1dQ9dGi1ogZ+XV5VRnIaEjM3Ue5eM62lJJkwWD8a0DdqKgLKZ0i36nCx49r
	 bYKBHeWWlfXxhWt86popY/PIjSDevUOYmnEM9yRKgVoB615MgPHybO2Bo8wyC3PQmp
	 6+9YyNIaKXk1YPkn2W5+75yz+F6taOW1O71uyciutFOOZWhBN0vXd8OldDQpFj+KNc
	 ZmGyNFhuOFseg==
Received: by mail-lf1-f71.google.com with SMTP id k5-20020a05651210c500b0040934a07fbdso9233485lfg.22
        for <linux-nfc@lists.01.org>; Wed, 01 Dec 2021 01:15:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4UbWlcXj2YADUHfXSjXEbz9ALdk7SF7NU0zYPyXULCo=;
        b=Hsq1muL3C2xrgYSlHazuzEO2vJaudzIUcZ2a1KQyWL8jfDmIoiD9EBzlD8AR2JV/+y
         ijP8J+BA4tknsbaoKGZBj5t3pqVOmwqX5ccXI55mVxjP7lYa4w8XK0bOtOI1rEAHGPk5
         A30tHBXSwY7ObKmMnLw7A85Cfk6ImLaTVfwJg/sv2MTE1OK/FvxIipnSd65lN/g/IpQC
         vzjgVlN/NGrAoj9bYlM4G2fP3V9FOKrwuYqrtA+HloVpRxvJaEPg97uqL88s3eb7mYzI
         xj9d5JlLKHBBP7xWPGd3MS0ZSSPRcPJM5XIapyJlhYpRvInGsjJdRwOgSjWPPoYskcDO
         5B3A==
X-Gm-Message-State: AOAM533AKq2RvICVN6tQ7FSwYyVw6R0c4PkUxXUbOVSkVztGjyrSnj0D
	LMYvh9+4GS9Mv5L+toCjxb5uPh+2/XyKUrzOD3Vb8avQLIcpxsLeJOLu/2vOwcEYSWzknf9AD9+
	apx1gc5fDFf6ztR8VdJ1mZkoiUxRNIK7eLg==
X-Received: by 2002:a2e:9456:: with SMTP id o22mr4500458ljh.129.1638350132338;
        Wed, 01 Dec 2021 01:15:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAkdEJCvDd1H5Y/c4PdHSQlCd+wLMzeadkC7I05AHxv9ZEWe+Lhausuo+I47DD9Jq2u2pNDA==
X-Received: by 2002:a2e:9456:: with SMTP id o22mr4500442ljh.129.1638350132174;
        Wed, 01 Dec 2021 01:15:32 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id j19sm1381127ljq.9.2021.12.01.01.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Dec 2021 01:15:31 -0800 (PST)
Message-ID: <d8653fc9-0b6a-83b2-12fc-e592d38b695e@canonical.com>
Date: Wed, 1 Dec 2021 10:15:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
To: Mark Greer <mgreer@animalcreek.com>, linux-nfc@lists.01.org
References: <20211129050606.873494-1-mgreer@animalcreek.com>
 <20211129050606.873494-6-mgreer@animalcreek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211129050606.873494-6-mgreer@animalcreek.com>
Message-ID-Hash: YXNEAJLF4EEYZGFGW66KKKQ5HOFMYYJH
X-Message-ID-Hash: YXNEAJLF4EEYZGFGW66KKKQ5HOFMYYJH
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2 5/6] se: Convert SE test script from Python2 to Python3
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/YXNEAJLF4EEYZGFGW66KKKQ5HOFMYYJH/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 29/11/2021 06:06, Mark Greer wrote:
> Python2 is deprecated so convert the SE test scripts, which are
> Python2, to Python3.
> 
> Signed-off-by: Mark Greer <mgreer@animalcreek.com>
> ---
>  se/test/test-channel | 18 +++++++++---------
>  se/test/test-seel    | 38 +++++++++++++++++++-------------------
>  2 files changed, 28 insertions(+), 28 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
