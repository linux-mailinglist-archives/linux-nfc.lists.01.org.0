Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A733F1BD7
	for <lists+linux-nfc@lfdr.de>; Thu, 19 Aug 2021 16:45:26 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 041C9100EB829;
	Thu, 19 Aug 2021 07:45:22 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 1FDF2100EBBBB
	for <linux-nfc@lists.01.org>; Thu, 19 Aug 2021 07:45:19 -0700 (PDT)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id C5559411DE
	for <linux-nfc@lists.01.org>; Thu, 19 Aug 2021 14:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1629384311;
	bh=wFMubXAPgnloMpa9yc4+iUcIt7iWSLMhT0Ogfw+jCxY=;
	h=To:References:From:Subject:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=YKzqu9u3PeQrK3eYek67yFJYz1apB44NAWETTb3YOpmNYcyUaGFr5RH4EyOiuUags
	 L0oM9eOis0O3I6E3PuiCp5xQn45sg86sbsGVPxVP0D+BPvCMKku5KfzjXi2nQnjzx+
	 m7J7RCCrDNABcG3zyeJglyL16XQEolpDcVMSPaJZHAuEiOPNEg6iIao67jyXAJdER/
	 7WcHPNzWG2voKkArMNdOmY2ybprqQBeAX+RqTHiTvZ+euJJ5s3L1HmsR1LJaqypaCA
	 LjUXq5j4QPEfQokvdX0d40TN9fWrjneFCLL+DXE1nXNgjrbb0iID5PCsfFpwwDpEdh
	 88ScwHfE2Cxwg==
Received: by mail-ej1-f69.google.com with SMTP id m24-20020a17090607d800b005c18a22567fso1159115ejc.3
        for <linux-nfc@lists.01.org>; Thu, 19 Aug 2021 07:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wFMubXAPgnloMpa9yc4+iUcIt7iWSLMhT0Ogfw+jCxY=;
        b=M/Zch7DmJduAzsuLSET05qekXxIVTWLpV/8aXzGS7IMJrXifYVcXKNVeHbNBFixsll
         FEeYOT1E+ddk9xfQ3Kn3M3RBFND9NhI3w8jC3SNLMLqrwbyVQP4c6Del+tE0RltJ7lvd
         eL3RxFPS1bEIn6rw5UiuvBPicrXtdWrrf/Ws9zUzlMLvDq/SJZe6HCNV8agGShI2tvG6
         2YNIH/CxQX7Nkp+jHexm1MKeavhoid1B0TlodmIFyrJOdxM5k0rZOS10W0Q0HWm5wvFI
         cv7tfQ3T90TQkDL4+1MruHheR9QW72n42/DpF3uxOS/OFA4yaQxGysvAWMM3m01lb8Ri
         DRig==
X-Gm-Message-State: AOAM531esIfOf/ye8wrLhsG2A26k0mv16sL/2k2I0IzBy93+sFCH48PU
	YUZjMrD9avOGJ7OaF7JnIL6JHDZu4s60SExKhOiRs4oaTSTLaui2XbVZVvzMUp2qba7cfE0h7Wl
	hcC4mwlsC9POrhb7hZxQkQZLNALl9q+w/FA==
X-Received: by 2002:a17:906:7691:: with SMTP id o17mr15925378ejm.485.1629384311166;
        Thu, 19 Aug 2021 07:45:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+WKfgClU/3qV2smfJHN0rntEcQuXt1D6Vi83NCorxv/0Id9h8d1fxx2bwe4TXCS9uPYfwSw==
X-Received: by 2002:a17:906:7691:: with SMTP id o17mr15925363ejm.485.1629384310937;
        Thu, 19 Aug 2021 07:45:10 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id lb12sm1380223ejc.28.2021.08.19.07.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 07:45:10 -0700 (PDT)
To: Oliver Neukum <oneukum@suse.com>, charles.gorand@effinnov.com,
 andy.shevchenko@gmail.com, linux-nfc@lists.01.org
References: <20210819140228.15591-1-oneukum@suse.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <7ff001e9-8e82-cecb-96af-458baac30dfc@canonical.com>
Date: Thu, 19 Aug 2021 16:45:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819140228.15591-1-oneukum@suse.com>
Content-Language: en-US
Message-ID-Hash: UFZ7JLGXGCM5WXO3BI53OQOAXNYP3TIN
X-Message-ID-Hash: UFZ7JLGXGCM5WXO3BI53OQOAXNYP3TIN
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] NFC: NCI: make parent aware in PM terms
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/UFZ7JLGXGCM5WXO3BI53OQOAXNYP3TIN/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


On 19/08/2021 16:02, Oliver Neukum wrote:
> The NCI device is a child of an i2c device.
> If the i2c layer uses runtime PM the power to
> the NFC device can be cut whenever the i2c
> layer is done transmitting data to the NFC
> device.
> Under these conditions NFC can not work, as
> it needs power to wait for reception of packets.

Hi,

Thanks for the patch.
However this
is unparseable.
Please wrap commit
message around 75th character:
https://elixir.bootlin.com/linux/v5.13/source/Documentation/process/submitting-patches.rst#L124

The subject prefix: "nfc: nxp-nci: "

Please also Cc all people and lists. You missed here netdev
and linux-kernel, so this cannot be applied.

> 
> The necessary extension of runtime PM
> to the NFC device requires that it
> be activated as a child of the i2c device.
> It is not necessary to do any runtime PM
> operations. This will disable runtime PM
> for this branch of the tree, but otherwise
> the NFC device is inoperable.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/nfc/nxp-nci/i2c.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/nfc/nxp-nci/i2c.c b/drivers/nfc/nxp-nci/i2c.c
> index 94f7f6d9cbad..dba78a5d217a 100644
> --- a/drivers/nfc/nxp-nci/i2c.c
> +++ b/drivers/nfc/nxp-nci/i2c.c
> @@ -18,6 +18,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/nfc.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/gpio/consumer.h>
>  #include <asm/unaligned.h>
>  
> @@ -261,6 +262,7 @@ static int nxp_nci_i2c_probe(struct i2c_client *client,
>  {
>  	struct device *dev = &client->dev;
>  	struct nxp_nci_i2c_phy *phy;
> +	struct nfc_dev *ndev;
>  	int r;
>  
>  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> @@ -297,6 +299,11 @@ static int nxp_nci_i2c_probe(struct i2c_client *client,
>  	if (r < 0)
>  		return r;
>  
> +	ndev = phy->ndev->nfc_dev;
> +	pm_runtime_set_active(&ndev->dev);
> +	pm_runtime_enable(&ndev->dev);
> +	pm_runtime_mark_last_busy(&ndev->dev);

Setting PM for someone else does not look correct. This breaks
encapsulation and separation of these files. The NCI device
(nxp_nci_probe() and other parts of core.c) should instead manage
it's own runtime PM.

> +
>  	r = request_threaded_irq(client->irq, NULL,
>  				 nxp_nci_i2c_irq_thread_fn,
>  				 IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> @@ -310,9 +317,12 @@ static int nxp_nci_i2c_probe(struct i2c_client *client,
>  static int nxp_nci_i2c_remove(struct i2c_client *client)
>  {
>  	struct nxp_nci_i2c_phy *phy = i2c_get_clientdata(client);
> +	struct nfc_dev *ndev = phy->ndev->nfc_dev;
>  
>  	nxp_nci_remove(phy->ndev);
>  	free_irq(client->irq, phy);
> +	pm_runtime_disable(&ndev->dev);
> +	pm_runtime_set_suspended(&ndev->dev);
>  
>  	return 0;
>  }
> 


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
