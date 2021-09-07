Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C619402C8D
	for <lists+linux-nfc@lfdr.de>; Tue,  7 Sep 2021 18:05:33 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id BC391100EBB9F;
	Tue,  7 Sep 2021 09:05:31 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id D1746100EBB72
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 09:05:29 -0700 (PDT)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1825840191
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 16:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631030728;
	bh=YP2/VludKZxfn7ZssReTEMfvwdfhQuuxVwCMuWtoV0M=;
	h=Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=c71l0eoYBrO8abEIrs8JLOdXxaabnmWKIjlUsW4eXasrmVpuH5y9PMmz4uHMnfrHf
	 +i9p5jrra7pr2X76DHjHWAk4/NanrpUUimyTICw8uovb2/+Bv3WKDyF7PooUqOkS4F
	 QPpTnxur97AHw6qH5lYHO8HlHlnfn8j0tQAwKpIPqwf/iykR0o3D592S4FXO3I/dDB
	 GOQITrjDugbAe7uzLbxYfH9D72D4yUAb90jdy+lMAUGFjkgY/mMi1nYtlkQ3iIOCdt
	 3pTVyxMoR5wGKmGb+08dyV3ZpkCIn4Dox5H+kxwFM15ojzFOC5A7VOWgTty1/cmqk+
	 Ql6yLwvHmxbog==
Received: by mail-wm1-f72.google.com with SMTP id p29-20020a1c545d000000b002f88d28e1f1so3572183wmi.7
        for <linux-nfc@lists.01.org>; Tue, 07 Sep 2021 09:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YP2/VludKZxfn7ZssReTEMfvwdfhQuuxVwCMuWtoV0M=;
        b=tLyIsWNqnVYOz08sUnUk3rrceZGnsj5kp3Nk8IMNqYKvM9yZQ4c3O360BBB0dfni7w
         fPbpEwxrGQd4FYT+fGDURmNizMI7VvzLYJdGy2JcOf0lwu6rAMMFTG2G7IlhDxtlwuuF
         sZhNP79k3gufID25mJbv6tTY5INB27arZcbYOTTv5L0ToJJTkvyzBDTln74Jxr7Tx258
         YYv6kSc6L6XyFPB9YlOIsGdH3ypvv2xstJjCe63ntRRJaiGCiwMCpioIbu2bcwXa4au1
         w3LJXVY5VNagI+uCkzoEnHlvBrSPnfNQq0QE0/LKAo6WXSsiyrFf+XabZGZz38hS5UjO
         P5Ng==
X-Gm-Message-State: AOAM532poHif7L51etoeiMVKiPFA5H3OuTPcrGoOSs2vmggu7KoN7gMX
	OG39lgU2GF66VEHSvCxCG0kpi0iwd5ennyDOieV0SyEg8Xlkt9dtZYEuhVb8IuBDXuIHvaLO6jk
	Zl2u9oOzSStJVi8QJJ1TB2K0nsccNAAdvug==
X-Received: by 2002:adf:e606:: with SMTP id p6mr19733174wrm.231.1631030727408;
        Tue, 07 Sep 2021 09:05:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2vXes2sOGaOH/wZ20TblF6w1HjcLY8vGDnXm94khUXSoLOVYKf88pEQi2Y8AMLrFkz7eqTg==
X-Received: by 2002:adf:e606:: with SMTP id p6mr19733161wrm.231.1631030727289;
        Tue, 07 Sep 2021 09:05:27 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.113.63])
        by smtp.gmail.com with ESMTPSA id u25sm2772784wmj.10.2021.09.07.09.05.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 09:05:26 -0700 (PDT)
To: Krzysztof Opasiak <k.opasiak@samsung.com>,
 Mark Greer <mgreer@animalcreek.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 linux-nfc@lists.01.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
References: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
 <20210907121816.37750-6-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <35626061-ff2e-cb01-21ff-87a6f776dc28@canonical.com>
Date: Tue, 7 Sep 2021 18:05:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210907121816.37750-6-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
Message-ID-Hash: UIS7NXY5VPVRYCDMRAN457D2PSMKK3T4
X-Message-ID-Hash: UIS7NXY5VPVRYCDMRAN457D2PSMKK3T4
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 05/15] nfc: pn533: drop unneeded debug prints
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/UIS7NXY5VPVRYCDMRAN457D2PSMKK3T4/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 07/09/2021 14:18, Krzysztof Kozlowski wrote:
> ftrace is a preferred and standard way to debug entering and exiting
> functions so drop useless debug prints.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  drivers/nfc/pn533/i2c.c   | 1 -
>  drivers/nfc/pn533/pn533.c | 2 --
>  2 files changed, 3 deletions(-)
> 
> diff --git a/drivers/nfc/pn533/i2c.c b/drivers/nfc/pn533/i2c.c
> index e6bf8cfe3aa7..91d4a035eb63 100644
> --- a/drivers/nfc/pn533/i2c.c
> +++ b/drivers/nfc/pn533/i2c.c
> @@ -138,7 +138,6 @@ static irqreturn_t pn533_i2c_irq_thread_fn(int irq, void *data)
>  	}
>  
>  	client = phy->i2c_dev;

This line should also be removed (reported by kbuild robot).

I will send a v2.


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
