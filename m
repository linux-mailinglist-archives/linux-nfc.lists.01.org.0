Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3070A3ED069
	for <lists+linux-nfc@lfdr.de>; Mon, 16 Aug 2021 10:40:02 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id C56CE100EBB92;
	Mon, 16 Aug 2021 01:39:59 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 5CF80100EBB81
	for <linux-nfc@lists.01.org>; Mon, 16 Aug 2021 01:39:57 -0700 (PDT)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 570E93FE71
	for <linux-nfc@lists.01.org>; Mon, 16 Aug 2021 08:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1629103195;
	bh=wt0NZuZpgfFNvR+TwCzu6vYQ2lecDjr/nFLemapH+ik=;
	h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=ah+aWVEE/6tZbSRtDcSt7d8Z/nSdYslgM45w5wzNa3irTZh8l4jfvEgwZ+hy7NiDx
	 NkSK4iCiwk3dPJdqHfY8pVtpKT/fPNhjsVlpILdT283IasQkUevcB3Fj1u/1EhTtwh
	 Lgb7X2nOrej73P7q2ayghbHOB0ubYq2gq34NiFhEcMfAXmwhXaNrPxLdSD/MB8mesd
	 NvxGBpEH0jVYzqHrYHOkNsvU1Pg6XO/dcG8hsbJsqNoitE8g3s1cI6VzsT8Th6voIO
	 wYvd5uQIEJGn1xtHkVzkf4+ry87gT1G0LT/XfuOuD9TbjGdnnQ6MGrJlY5FMIHGf7+
	 amfAw7dWU/5MQ==
Received: by mail-ej1-f72.google.com with SMTP id v3-20020a1709063383b02905b4d1d1e27cso4412134eja.19
        for <linux-nfc@lists.01.org>; Mon, 16 Aug 2021 01:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wt0NZuZpgfFNvR+TwCzu6vYQ2lecDjr/nFLemapH+ik=;
        b=ixFtGZa8TwWJKFbb/SslDTN+7CU4c3g1iceBogra+qXBI44UcxFtsKLxrLwKn5YBK9
         Otb1tysA+nU7VFFxqqxO4WSCL7oE+Xe3RamI8UiuMRk86Mpdgcsdg0kc9iwju8mewm5d
         K7lYi+Ze0WFUDiRqM8Tkk2FnmkQDz7gg2oGNMA/XZ+uNlfpm4QFqjvlAJTf2FfRFBqhn
         nItHq57rm+foCHpFSpO8mVwQv+tn2b0JBWzUDULqV0PemSmq/Jgq0hLhZvsmSrXYoG7w
         wmi9PJDLcRG9fNlMbPdWU43lGIlRCjPAyZtyvSghBQyr/mPEKeOcGwlke82zbPWstujA
         FJEQ==
X-Gm-Message-State: AOAM5323xQUU4H/pmUl+eoRbDMn6NSgNLmkSDFPN073a6pTNc5SQQBxf
	CSd+Q/6jsdhgk6LmXytkFYnLUamPnhTqCzb0a0EtDNsogpLBIBUOY8/TbiGsD/cxYV6qYkqQqG4
	si72trjcUSaDUjAJt860Gb8DLaoF4P6MRtw==
X-Received: by 2002:a05:6402:557:: with SMTP id i23mr18650638edx.373.1629103195099;
        Mon, 16 Aug 2021 01:39:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+zhXEUP+YS5/ViGxnqoGy9/HGP9hJ7syIxL69aNlF6UmY4fE2aIjNrLEfuebwLxwiSvjSEg==
X-Received: by 2002:a05:6402:557:: with SMTP id i23mr18650621edx.373.1629103194993;
        Mon, 16 Aug 2021 01:39:54 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id n2sm4510744edi.32.2021.08.16.01.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 01:39:54 -0700 (PDT)
To: bongsu.jeon2@gmail.com, shuah@kernel.org
References: <20210816040600.175813-1-bongsu.jeon2@gmail.com>
 <20210816040600.175813-2-bongsu.jeon2@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <47a9321b-c79e-a06e-6575-9321a758dc36@canonical.com>
Date: Mon, 16 Aug 2021 10:39:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816040600.175813-2-bongsu.jeon2@gmail.com>
Content-Language: en-US
Message-ID-Hash: JAMQTDBTOWI7JPPC7T7PGEQ67A7KKNZY
X-Message-ID-Hash: JAMQTDBTOWI7JPPC7T7PGEQ67A7KKNZY
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: netdev@vger.kernel.org, linux-nfc@lists.01.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next 1/3] nfc: Change the virtual NCI device driver to use Wait Queue
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/JAMQTDBTOWI7JPPC7T7PGEQ67A7KKNZY/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 16/08/2021 06:05, bongsu.jeon2@gmail.com wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> 
> In previous version, the user level virtual device application that used
> this driver should have the polling scheme to read a NCI frame.
> To remove this polling scheme, changed the driver code to use Wait Queue.
> 

Subject - please prefix it with:
"nfc: virtual_ncidev: "

Also make it simpler (skipping unnecessary words like "change", "device
driver"), so:
"nfc: virtual_ncidev: use wait queue instead of polling"

> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  drivers/nfc/virtual_ncidev.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/nfc/virtual_ncidev.c b/drivers/nfc/virtual_ncidev.c
> index 2ee0ec4bb739..1953904176a2 100644
> --- a/drivers/nfc/virtual_ncidev.c
> +++ b/drivers/nfc/virtual_ncidev.c
> @@ -10,6 +10,7 @@
>  #include <linux/module.h>
>  #include <linux/miscdevice.h>
>  #include <linux/mutex.h>
> +#include <linux/wait.h>
>  #include <net/nfc/nci_core.h>
>  
>  enum virtual_ncidev_mode {
> @@ -27,6 +28,7 @@ enum virtual_ncidev_mode {
>  				 NFC_PROTO_ISO15693_MASK)
>  
>  static enum virtual_ncidev_mode state;
> +static DECLARE_WAIT_QUEUE_HEAD(wq);
>  static struct miscdevice miscdev;
>  static struct sk_buff *send_buff;
>  static struct nci_dev *ndev;
> @@ -61,6 +63,7 @@ static int virtual_nci_send(struct nci_dev *ndev, struct sk_buff *skb)
>  	}
>  	send_buff = skb_copy(skb, GFP_KERNEL);
>  	mutex_unlock(&nci_mutex);
> +	wake_up_interruptible(&wq);
>  
>  	return 0;
>  }
> @@ -76,12 +79,11 @@ static ssize_t virtual_ncidev_read(struct file *file, char __user *buf,
>  {
>  	size_t actual_len;
>  
> -	mutex_lock(&nci_mutex);
> -	if (!send_buff) {
> -		mutex_unlock(&nci_mutex);
> +	wait_event_interruptible(wq, send_buff);
> +	if (!send_buff)

I think access to send_buff should still be protected by mutex. What
happens if you have to readers?

>  		return 0;
> -	}
>  
> +	mutex_lock(&nci_mutex);
>  	actual_len = min_t(size_t, count, send_buff->len);
>  
>  	if (copy_to_user(buf, send_buff->data, actual_len)) {
> 


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
