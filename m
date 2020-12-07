Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D252D0FB5
	for <lists+linux-nfc@lfdr.de>; Mon,  7 Dec 2020 12:51:55 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 20286100EBBDF;
	Mon,  7 Dec 2020 03:51:54 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.68; helo=mail-wm1-f68.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 56AC0100EBBDE
	for <linux-nfc@lists.01.org>; Mon,  7 Dec 2020 03:51:52 -0800 (PST)
Received: by mail-wm1-f68.google.com with SMTP id e25so13425063wme.0
        for <linux-nfc@lists.01.org>; Mon, 07 Dec 2020 03:51:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Cq2jFqDwIfrHoFOscYqfVgmZg47FDTLhoPP6+XAE2X8=;
        b=JWs0r4/+abQN7FUmFxfXdUhVQ8n/HjnPF7zotTmVjXwtv/wZhr6v/mllNxJ/sQU1wC
         O7PtVMk7vDsGHcfgQGbGWmpnTdlKxI3NOTqkTibjd2OJQoEV4m5Xg2jVzHPFAn29fwDs
         PNoHLLeIXIymInVXkWQxk+dGwRnVYkn2mzYmbHNawTfSKq6OZpG0nGS8i8jhyPLtd8Bh
         glhvbCATZUyIZerGc11VQaNys+QY/CXF5UUxE+YEZfOL6HXTeHYyGeLgqvNOoZwfsTx/
         t7zqeslbwF3XoJ279NRgego06YiT99Xfn8zrbXCpGAvsR+f1U0/5YVHEhgdeo/i5jQ4m
         zO9w==
X-Gm-Message-State: AOAM5339ixl0ykujh+FX9I8scTFhqNACqq94ZJJ/qSZ3dY23hNRAbmXM
	j5cq8uxq+/d7zq39+OM42gM=
X-Google-Smtp-Source: ABdhPJyggceK9kt1VON7RQM0pfXWP5R4vsXfjlVOjCpVKWVLZL7ubApXA+vTShbTcFEzdCKvK/06GQ==
X-Received: by 2002:a1c:3c09:: with SMTP id j9mr18047135wma.180.1607341910456;
        Mon, 07 Dec 2020 03:51:50 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id y2sm14522546wrn.31.2020.12.07.03.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 03:51:49 -0800 (PST)
Date: Mon, 7 Dec 2020 12:51:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon2@gmail.com>
Message-ID: <20201207115147.GA26206@kozik-lap>
References: <20201207113827.2902-1-bongsu.jeon@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201207113827.2902-1-bongsu.jeon@samsung.com>
Message-ID-Hash: MS6X4WXKWADBDELYXS5PAQKN7FFUVIPN
X-Message-ID-Hash: MS6X4WXKWADBDELYXS5PAQKN7FFUVIPN
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next] nfc: s3fwrn5: Change irqflags
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/MS6X4WXKWADBDELYXS5PAQKN7FFUVIPN/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 07, 2020 at 08:38:27PM +0900, Bongsu Jeon wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> 
> change irqflags from IRQF_TRIGGER_HIGH to IRQF_TRIGGER_RISING for stable
> Samsung's nfc interrupt handling.

1. Describe in commit title/subject the change. Just a word "change irqflags" is
   not enough.

2. Describe in commit message what you are trying to fix. Before was not
   stable? The "for stable interrupt handling" is a little bit vauge.

3. This is contradictory to the bindings and current DTS. I think the
   driver should not force the specific trigger type because I could
   imagine some configuration that the actual interrupt to the CPU is
   routed differently.

   Instead, how about removing the trigger flags here and fixing the DTS
   and bindings example?

Best regards,
Krzysztof

> 
> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  drivers/nfc/s3fwrn5/i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
> index e1bdde105f24..016f6b6df849 100644
> --- a/drivers/nfc/s3fwrn5/i2c.c
> +++ b/drivers/nfc/s3fwrn5/i2c.c
> @@ -213,7 +213,7 @@ static int s3fwrn5_i2c_probe(struct i2c_client *client,
>  		return ret;
>  
>  	ret = devm_request_threaded_irq(&client->dev, phy->i2c_dev->irq, NULL,
> -		s3fwrn5_i2c_irq_thread_fn, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +		s3fwrn5_i2c_irq_thread_fn, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
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
