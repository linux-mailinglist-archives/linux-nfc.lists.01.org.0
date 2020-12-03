Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8482CDB03
	for <lists+linux-nfc@lfdr.de>; Thu,  3 Dec 2020 17:19:12 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id AC0F7100ED4BC;
	Thu,  3 Dec 2020 08:19:10 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.68; helo=mail-ed1-f68.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id F15FA100ED4BB
	for <linux-nfc@lists.01.org>; Thu,  3 Dec 2020 08:19:08 -0800 (PST)
Received: by mail-ed1-f68.google.com with SMTP id b2so2705544edm.3
        for <linux-nfc@lists.01.org>; Thu, 03 Dec 2020 08:19:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ODKylo1ARO1Guvyudvma49X5O/saBDRUYXjRotR9i2w=;
        b=t3U/SEhqbCKvp4mAXq/Ua6sKm64sCIovXXSfty0sRXgrhBB74M1HrvHAcSamekHL9V
         sNrccMW/5A7AGBzrgegzFA7Q1JKpSx6TeNRn1mMVxpm41nj5Obzo3Vw15DQG7k2lKuFO
         4pLmV2jVbYuyL/ZaKBWH9f+Ee3CDBTd5fXg601/iaX8AHvLwfHWnSiOqzejdcNLoldmm
         5L0a2IOscXhUP74ksA3axJY+8uUjsBd+Wka/THCcKS+ClwckjuSsFPA7R7JkBubz1/eP
         5B+/XFBU8yZEnamzPC9lrH0V4LKE5jsMQyCIyMhDIz/tWZxAyVI26D+4wb0a2Wjowu8Q
         5jLQ==
X-Gm-Message-State: AOAM533sHUyid2LFqW0Znviel4mDQ744d16XJhwYGqwgwAwB3x3Od7/c
	6RV+GoJ8hjnraP7s8JVCOl0=
X-Google-Smtp-Source: ABdhPJyL9nlMz2v7x3aE+3ruRh8dZzYEMhD1TpwcFCO9mxL5SdTnNGRAR6YqDbwp6RR8z4MEXKEApg==
X-Received: by 2002:a50:c19a:: with SMTP id m26mr3518773edf.302.1607012347188;
        Thu, 03 Dec 2020 08:19:07 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id ga11sm1116662ejb.34.2020.12.03.08.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 08:19:05 -0800 (PST)
Date: Thu, 3 Dec 2020 18:19:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon2@gmail.com>
Message-ID: <20201203161904.GA16186@kozik-lap>
References: <20201203153950.13772-1-bongsu.jeon@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201203153950.13772-1-bongsu.jeon@samsung.com>
Message-ID-Hash: YMT6RRK4CQ63CFZTNPCQ2565NBOSJFSK
X-Message-ID-Hash: YMT6RRK4CQ63CFZTNPCQ2565NBOSJFSK
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next] nfc: s3fwrn5: skip the NFC bootloader mode
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/YMT6RRK4CQ63CFZTNPCQ2565NBOSJFSK/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 04, 2020 at 12:39:50AM +0900, Bongsu Jeon wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> 
> If there isn't proper NFC firmware image,
> Bootloader mode will be skipped.

Wrap your commit msg as described in submitting patches (so at 75
character).

> 
> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  drivers/nfc/s3fwrn5/core.c     | 44 ++++++++++++++++++++++++----------
>  drivers/nfc/s3fwrn5/firmware.c | 11 +--------
>  drivers/nfc/s3fwrn5/firmware.h |  1 +
>  3 files changed, 33 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/nfc/s3fwrn5/core.c b/drivers/nfc/s3fwrn5/core.c
> index f8e5d78d9078..df89bc5d7338 100644
> --- a/drivers/nfc/s3fwrn5/core.c
> +++ b/drivers/nfc/s3fwrn5/core.c
> @@ -20,13 +20,26 @@
>  				NFC_PROTO_ISO14443_B_MASK | \
>  				NFC_PROTO_ISO15693_MASK)
>  
> +static int s3fwrn5_firmware_init(struct s3fwrn5_info *info)
> +{
> +	struct s3fwrn5_fw_info *fw_info = &info->fw_info;
> +	int ret;
> +
> +	s3fwrn5_fw_init(fw_info, "sec_s3fwrn5_firmware.bin");
> +
> +	/* Get firmware data */
> +	ret = s3fwrn5_fw_request_firmware(fw_info);
> +	if (ret < 0)
> +		dev_err(&fw_info->ndev->nfc_dev->dev,
> +			"Failed to get fw file, ret=%02x\n", ret);
> +	return ret;
> +}
> +
>  static int s3fwrn5_firmware_update(struct s3fwrn5_info *info)
>  {
>  	bool need_update;
>  	int ret;
>  
> -	s3fwrn5_fw_init(&info->fw_info, "sec_s3fwrn5_firmware.bin");
> -
>  	/* Update firmware */
>  
>  	s3fwrn5_set_wake(info, false);
> @@ -109,21 +122,26 @@ static int s3fwrn5_nci_post_setup(struct nci_dev *ndev)
>  	struct s3fwrn5_info *info = nci_get_drvdata(ndev);
>  	int ret;
>  
> -	ret = s3fwrn5_firmware_update(info);
> -	if (ret < 0)
> -		goto out;
> +	if (s3fwrn5_firmware_init(info) == 0) {

if (s3fwrn5_firmware_init(info)) {
	// skip bootloader mode
	ret = 0;
	goto out;
}

so entire next block won't have to be indented.  This follows usual
pattern of error handling.

Best regards,
Krzysztof


> +		ret = s3fwrn5_firmware_update(info);
> +		if (ret < 0)
> +			goto out;
>  
> -	/* NCI core reset */
> -
> -	s3fwrn5_set_mode(info, S3FWRN5_MODE_NCI);
> -	s3fwrn5_set_wake(info, true);
> +		/* NCI core reset */
>  
> -	ret = nci_core_reset(info->ndev);
> -	if (ret < 0)
> -		goto out;
> +		s3fwrn5_set_mode(info, S3FWRN5_MODE_NCI);
> +		s3fwrn5_set_wake(info, true);
>  
> -	ret = nci_core_init(info->ndev);
> +		ret = nci_core_reset(info->ndev);
> +		if (ret < 0)
> +			goto out;
>  
> +		ret = nci_core_init(info->ndev);
> +	} else {
> +		dev_info(&info->ndev->nfc_dev->dev,
> +			 "skip bootloader mode\n");
> +		ret = 0;
> +	}
>  out:
>  	return ret;
>  }
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
