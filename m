Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA51B2D5531
	for <lists+linux-nfc@lfdr.de>; Thu, 10 Dec 2020 09:18:30 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 1F675100EB852;
	Thu, 10 Dec 2020 00:18:29 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.66; helo=mail-wm1-f66.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 69AF3100EC1F7
	for <linux-nfc@lists.01.org>; Thu, 10 Dec 2020 00:18:27 -0800 (PST)
Received: by mail-wm1-f66.google.com with SMTP id d3so3791118wmb.4
        for <linux-nfc@lists.01.org>; Thu, 10 Dec 2020 00:18:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LQkGEYd3krV+Z3bgXSv+63USQGfgVXpXR+vwfP4BQCs=;
        b=Vhnlmpe06PUxiA8s1Z/caIKpvXT4eOpMoVf0GD6X2soPJrGM2JcK+J4dKDs3TDduwd
         NijynLoRA7osva3MNE6L4B144vqlo99JLGJJa3CE8WPKhUZewdHbv567seLPqVT/tm3m
         i+fxZXu4Kav8n5F4i2mCPunufap7cKOXvGrRmqcwx5yI7j9/uZWEqHKocnvfN9a9vh/S
         c80+6nKdXZcESe1Njd93eF9Dv3dbHQkbVMh7+HVrohY+LmJFvSFLvTD/2C+bUeQ+iuEy
         EysXFjLqiSGgmLq9Lm7VmfAL8K5x33F2xZSPN6y2se/ivwyNBXyivl4PcSyr0jBJ00S0
         5hqA==
X-Gm-Message-State: AOAM530YAUHlcmB8sS6aA7ZHnlRvEju9ITSkx+bOiTBR8Ej45b/hX45I
	24nASpKhO0Vf3X/CQkdcs3k=
X-Google-Smtp-Source: ABdhPJzobk+kyfH4IaVIUVdA4tztlyolb0iUT9kGkge6VnZKnOwInCXsjw6M7XGVjoTByVPdgV1xpQ==
X-Received: by 2002:a7b:c5c6:: with SMTP id n6mr6552880wmk.131.1607588305727;
        Thu, 10 Dec 2020 00:18:25 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id h20sm8889440wrb.21.2020.12.10.00.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 00:18:24 -0800 (PST)
Date: Thu, 10 Dec 2020 09:18:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon2@gmail.com>
Message-ID: <20201210081822.GA3573@kozik-lap>
References: <20201208141012.6033-1-bongsu.jeon@samsung.com>
 <20201208141012.6033-3-bongsu.jeon@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201208141012.6033-3-bongsu.jeon@samsung.com>
Message-ID-Hash: 64RN2XWRWONHFQUAFFIULSAGLKUNXBZB
X-Message-ID-Hash: 64RN2XWRWONHFQUAFFIULSAGLKUNXBZB
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2 net-next 2/2] nfc: s3fwrn5: Remove hard coded interrupt trigger type from the i2c module
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/64RN2XWRWONHFQUAFFIULSAGLKUNXBZB/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 08, 2020 at 11:10:12PM +0900, Bongsu Jeon wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> 
> For the flexible control of interrupt trigger type, remove the hard coded
> interrupt trigger type in the i2c module. The trigger type will be loaded
>  from a dts.
> 
> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  drivers/nfc/s3fwrn5/i2c.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
> index e1bdde105f24..42f1f610ac2c 100644
> --- a/drivers/nfc/s3fwrn5/i2c.c
> +++ b/drivers/nfc/s3fwrn5/i2c.c
> @@ -179,6 +179,8 @@ static int s3fwrn5_i2c_probe(struct i2c_client *client,
>  				  const struct i2c_device_id *id)
>  {
>  	struct s3fwrn5_i2c_phy *phy;
> +	struct irq_data *irq_data;
> +	unsigned long irqflags;
>  	int ret;
>  
>  	phy = devm_kzalloc(&client->dev, sizeof(*phy), GFP_KERNEL);
> @@ -212,8 +214,11 @@ static int s3fwrn5_i2c_probe(struct i2c_client *client,
>  	if (ret < 0)
>  		return ret;
>  
> +	irq_data = irq_get_irq_data(client->irq);
> +	irqflags = irqd_get_trigger_type(irq_data) | IRQF_ONESHOT;

This patch is wrong and should not be applied. David, please give few
days to review the patches. :)

The irqd_get_trigger_type is not necessary.

I'll send follow ups to correct this.

Best regards,
Krzysztof


> +
>  	ret = devm_request_threaded_irq(&client->dev, phy->i2c_dev->irq, NULL,
> -		s3fwrn5_i2c_irq_thread_fn, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +		s3fwrn5_i2c_irq_thread_fn, irqflags,
>  		S3FWRN5_I2C_DRIVER_NAME, phy);
>  	if (ret)
>  		s3fwrn5_remove(phy->common.ndev);
> -- 
> 2.17.1
> 
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
