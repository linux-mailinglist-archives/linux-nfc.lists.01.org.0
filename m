Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF4637BEF7
	for <lists+linux-nfc@lfdr.de>; Wed, 12 May 2021 15:55:04 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E819A100EBB78;
	Wed, 12 May 2021 06:55:02 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 7E7F9100EBB72
	for <linux-nfc@lists.01.org>; Wed, 12 May 2021 06:55:01 -0700 (PDT)
Received: from mail-vk1-f197.google.com ([209.85.221.197])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lgpKF-0001HM-L0
	for linux-nfc@lists.01.org; Wed, 12 May 2021 13:54:59 +0000
Received: by mail-vk1-f197.google.com with SMTP id b203-20020a1fb2d40000b02901c9714c9241so3044584vkf.19
        for <linux-nfc@lists.01.org>; Wed, 12 May 2021 06:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=08/+1Aj4jEy4gK05fIKfXFMVV/kT+0I43RKPwzZata8=;
        b=LojyUutx300UoNcNmg66zceyWN4k9r59ja8me7rJSp3QoCkrwTWqzZDKiarxcnIOp8
         /f6XQVLZDZ5J+zk6j2UQ/4zxyXCm1Brzyasvg4FxmMka/G4omPc7k1zRFcFoTx1t+jWJ
         tCxgOyUfY5uYsG6l3J/jDCe3intqNOLEjQMjQeKfuE2dMiEP7zVRiW+WKiu/R/BP9m7j
         7juPAe8t1YoWz9WjVEittVyMhF51PBU/LbcHseFEsLEDh1ANT1IM9Fry1DkuHjAb6YNK
         XMgGVVZKzS7yBfJauC1l/5/FgBGcT6G2vktwGMTNDnBPgwAUFYyynTVJmKn2WuvrWIvL
         kGow==
X-Gm-Message-State: AOAM530/VBRsKkRJhxjM0pFWZIZKBbG1WlnB+O72PIVlQjsHhd0axeIJ
	TcyG1qj6aE+AQm/rKZ9QCT1BcodqXZYnOCoPof4hkDVjT2hsdw/PY+3ckIk32fnl/xqUdOicySn
	u6FjXs0VgBZWvTpgYy1X5LCVoo0z6wRA1Ow==
X-Received: by 2002:a05:6102:392:: with SMTP id m18mr32323993vsq.40.1620827698777;
        Wed, 12 May 2021 06:54:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrxfpUpULT3L7xt6Zj4sj9UXYXHp9f3OZeTPl+LwAsQyX6v2O/9LdvHC94imaHMxW9WYsIoQ==
X-Received: by 2002:a05:6102:392:: with SMTP id m18mr32323869vsq.40.1620827697461;
        Wed, 12 May 2021 06:54:57 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.2])
        by smtp.gmail.com with ESMTPSA id a5sm2432668vkl.19.2021.05.12.06.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 06:54:56 -0700 (PDT)
To: Oliver Neukum <oneukum@suse.com>, clement.perrochaud@effinnov.com,
 charles.gorand@effinnov.com, linux-nfc@lists.01.org, netdev@vger.kernel.org
References: <20210512134413.31808-1-oneukum@suse.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <0a8ca4c7-ce55-3c92-cc29-b383e546d563@canonical.com>
Date: Wed, 12 May 2021 09:54:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210512134413.31808-1-oneukum@suse.com>
Content-Language: en-US
Message-ID-Hash: HRLQV6LQRUU3NVVSTKK6QR4QYLNNE3FU
X-Message-ID-Hash: HRLQV6LQRUU3NVVSTKK6QR4QYLNNE3FU
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] NFC: cooperation with runtime PM
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/HRLQV6LQRUU3NVVSTKK6QR4QYLNNE3FU/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Thanks for the patch. Few notes:

On 12/05/2021 09:44, Oliver Neukum wrote:
> We cannot rely on the underlying hardware to do correct
> runtime PM. NFC core needs to get PM reference while
> a device is operational, lest it be suspended when
> it is supposed to be waiting for a target to come
> into range.


Your word wrapping is unusually early - please wrap the commit msg as in
coding style (so around 75-character).
https://elixir.bootlin.com/linux/latest/source/Documentation/process/submitting-patches.rst#L578

> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  net/nfc/core.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/net/nfc/core.c b/net/nfc/core.c
> index 573c80c6ff7a..5ca4597c39c7 100644
> --- a/net/nfc/core.c
> +++ b/net/nfc/core.c
> @@ -15,6 +15,7 @@
>  #include <linux/slab.h>
>  #include <linux/rfkill.h>
>  #include <linux/nfc.h>
> +#include <linux/pm_runtime.h>
>  
>  #include <net/genetlink.h>
>  
> @@ -37,6 +38,7 @@ int nfc_fw_download(struct nfc_dev *dev, const char *firmware_name)
>  	pr_debug("%s do firmware %s\n", dev_name(&dev->dev), firmware_name);
>  
>  	device_lock(&dev->dev);
> +	pm_runtime_get_sync(&dev->dev);

This can fail. Probably you wanted pm_runtime_resume_and_get() here.

>  
>  	if (!device_is_registered(&dev->dev)) {
>  		rc = -ENODEV;
> @@ -58,7 +60,10 @@ int nfc_fw_download(struct nfc_dev *dev, const char *firmware_name)
>  	if (rc)
>  		dev->fw_download_in_progress = false;

goto error

>  
> +	device_unlock(&dev->dev);
> +	return rc;

Since last rc cannot be != 0, return 0

Blank line

>  error:
> +	pm_runtime_put(&dev->dev);
>  	device_unlock(&dev->dev);
>  	return rc;
>  }
> @@ -73,9 +78,13 @@ int nfc_fw_download(struct nfc_dev *dev, const char *firmware_name)
>  int nfc_fw_download_done(struct nfc_dev *dev, const char *firmware_name,
>  			 u32 result)
>  {
> +	int rv;

"int rc"

> +
>  	dev->fw_download_in_progress = false;
>  
> -	return nfc_genl_fw_download_done(dev, firmware_name, result);
> +	rv = nfc_genl_fw_download_done(dev, firmware_name, result);
> +	pm_runtime_put(&dev->dev);
> +	return rv;
>  }
>  EXPORT_SYMBOL(nfc_fw_download_done);
>  
> @@ -93,6 +102,7 @@ int nfc_dev_up(struct nfc_dev *dev)
>  	pr_debug("dev_name=%s\n", dev_name(&dev->dev));
>  
>  	device_lock(&dev->dev);
> +	pm_runtime_get_sync(&dev->dev);

Same comments as before.

>  
>  	if (dev->rfkill && rfkill_blocked(dev->rfkill)) {
>  		rc = -ERFKILL;
> @@ -124,7 +134,11 @@ int nfc_dev_up(struct nfc_dev *dev)
>  	if (dev->ops->discover_se && dev->ops->discover_se(dev))
>  		pr_err("SE discovery failed\n");
>  
> +	device_unlock(&dev->dev);
> +	return rc;

Probably same comments as before apply.

> +
>  error:
> +	pm_runtime_put(&dev->dev);
>  	device_unlock(&dev->dev);
>  	return rc;
>  }
> @@ -161,6 +175,9 @@ int nfc_dev_down(struct nfc_dev *dev)
>  		dev->ops->dev_down(dev);
>  
>  	dev->dev_up = false;
> +	pm_runtime_put(&dev->dev);
> +	device_unlock(&dev->dev);
> +	return rc;

return 0

>  
>  error:
>  	device_unlock(&dev->dev);
> 


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
