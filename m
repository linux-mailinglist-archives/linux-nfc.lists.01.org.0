Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F1837BEFE
	for <lists+linux-nfc@lfdr.de>; Wed, 12 May 2021 15:56:16 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 2EF2E100EBB6F;
	Wed, 12 May 2021 06:56:15 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 0D9D2100EBB6F
	for <linux-nfc@lists.01.org>; Wed, 12 May 2021 06:56:13 -0700 (PDT)
Received: from mail-vk1-f197.google.com ([209.85.221.197])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lgpLP-0001Nq-NT
	for linux-nfc@lists.01.org; Wed, 12 May 2021 13:56:11 +0000
Received: by mail-vk1-f197.google.com with SMTP id w62-20020a1f30410000b02901cf4520924fso3054006vkw.2
        for <linux-nfc@lists.01.org>; Wed, 12 May 2021 06:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lXaHKVR3mIuGrEd20jO1ipa+dY/mERv/ymrR+ENUctY=;
        b=nnt0BzrRs4yIthMQKYtY6Lsuv6zdTx0fjA/FVSSSpcW7T05+h9vxxIBxAqsZDWDw2D
         6iKOW3P8qW3Lj4equwCRvtj7dj+HjOkGf1q9b4fx12Nmi2r7QDAFo4mTbfeO3RptNo+g
         ipvrX1FyRRu4cCS/3XdYOZ87XJeIattWVOKUIlMosihoaoqQsrtfG0Y46pMry7y5Q1t5
         WIPUqAArzQ/Ryjlzi0S89UPY5olRcz1JMjQvRa6gip6W6I/NBYzdnMxT9/tWLV84QvLY
         LGsG5kQKQZTne+9FtbIh3qL8JRmgEoB2/H5Z6YkTaLFYHbFsxvu3tUHfug7j4QUsNz/f
         AUQQ==
X-Gm-Message-State: AOAM530I1MnHu4EZ3r1qxfO1sqQ2LG+2h0BMPD/+fnxafgIVdaDd+uXu
	DmgPfzBpA9RgPmru4Wd7v3S47sMfoNLvk/6gf8E4hI7oMq4Dkyn1VmANgoLEfMymve/JLRz6lKm
	ONyZKJ1lNgvKzgMyCXoW/ZyuOSSUAIxLM4Q==
X-Received: by 2002:a1f:a156:: with SMTP id k83mr28414337vke.15.1620827770909;
        Wed, 12 May 2021 06:56:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFKHt8OP4wmzhJrUkVfrF17uR7sG1r9+2EPNedobXl/PjCRvBZV/7/nIvERgBeuVfww2lPyg==
X-Received: by 2002:a1f:a156:: with SMTP id k83mr28414306vke.15.1620827770584;
        Wed, 12 May 2021 06:56:10 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.2])
        by smtp.gmail.com with ESMTPSA id g192sm1238075vkf.10.2021.05.12.06.56.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 06:56:10 -0700 (PDT)
To: Oliver Neukum <oneukum@suse.com>, clement.perrochaud@effinnov.com,
 charles.gorand@effinnov.com, linux-nfc@lists.01.org, netdev@vger.kernel.org
References: <20210512135451.32375-1-oneukum@suse.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <154ad073-f5c8-0d76-7dcd-220623cca865@canonical.com>
Date: Wed, 12 May 2021 09:56:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210512135451.32375-1-oneukum@suse.com>
Content-Language: en-US
Message-ID-Hash: P5FWUX7MGQQJI7PIEFSONEMFKI4XW7K7
X-Message-ID-Hash: P5FWUX7MGQQJI7PIEFSONEMFKI4XW7K7
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] nxp-nci: add NXP1002 id
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/P5FWUX7MGQQJI7PIEFSONEMFKI4XW7K7/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/05/2021 09:54, Oliver Neukum wrote:
> The driver also works with those new devices.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/nfc/nxp-nci/i2c.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/nfc/nxp-nci/i2c.c b/drivers/nfc/nxp-nci/i2c.c
> index 7e451c10985d..94f7f6d9cbad 100644
> --- a/drivers/nfc/nxp-nci/i2c.c
> +++ b/drivers/nfc/nxp-nci/i2c.c
> @@ -332,6 +332,7 @@ MODULE_DEVICE_TABLE(of, of_nxp_nci_i2c_match);
>  #ifdef CONFIG_ACPI
>  static const struct acpi_device_id acpi_id[] = {
>  	{ "NXP1001" },
> +	{ "NXP1002" },
>  	{ "NXP7471" },
>  	{ }
>  };
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
