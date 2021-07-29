Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 501933DA180
	for <lists+linux-nfc@lfdr.de>; Thu, 29 Jul 2021 12:48:44 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id DF26D100EBB78;
	Thu, 29 Jul 2021 03:48:42 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id AC46F100EBB6A
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:48:40 -0700 (PDT)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 5E14E3F229
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 10:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627555719;
	bh=hgYfV6PUzr4ibh1B07XnMBlFCdNWiJgFxyAVIqgM0RM=;
	h=Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=j5LskC2qFE2kXjhZ5neucO7FLX8/9Ou0Ku/+rupPwsDpNHyWK/kqv9Z/BtORDPUZ9
	 cDbqQdXaomVLFa/kb4QSX1va+9RACrBszRvE77TcN8V8jekqzL9ZDygyksZfQcbJh0
	 k9+gghZQlmNzUwRg9cl7NvhGNSDf4NUQds0RTI1IKHyAQ9TF6AuY2gppXjDfBwknhW
	 VOcjjXeWoCn1ldPNJjP/zMi5Dv2DWD0pBvuZs/FhcHsmzYIAIckR91jOWAZOmn/eDj
	 haVTyBrvGQ/OM39fgcCZGKDuoWGy0wdFRIaFZgT0b4mdmhDeuliCfofZqR9IP177Fr
	 31OyoB1ZyRJWw==
Received: by mail-ej1-f72.google.com with SMTP id k21-20020a1709062a55b0290590e181cc34so761004eje.3
        for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 03:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hgYfV6PUzr4ibh1B07XnMBlFCdNWiJgFxyAVIqgM0RM=;
        b=ljjYt2B7RomYSSoHSnvnMbJ+Ko08C7hBxQ48UBLej9UmlAZzk9iM3HbhWhNi6M5Cfw
         dU89NulQOdB9CiqsDcWmUASC4l21dEDbVZna/QOLtZSeO/KB4kNJaKgc5KIBgpihX+X/
         PViemAP35zpfhAPa6NLmQhiCh977tqwk7Z4V1udxqAcem8ZvO8c9dewhW9WH2vk2Dsxf
         UVbYLinMNYVCnSiKZuNrqj2qo7ZeotVgF5zKr4+5B4ew6tP7V6Xm1HW9QDfrLj1D6b3g
         Cwc3onht0J0M2+mR8Pyd5e5/tIc5GnBMVh5XY6yDbG/wzVTvGagtGUpB8wG58NcjKO7J
         LVug==
X-Gm-Message-State: AOAM530pScg/n9sp3t11h7ZdhcOajgGIQS2A76WSC/8D3meq36PbmiuA
	pWdyqyLzaKHXyCojB038MsSkM5BFvhcvoFAh7jY3G4Ubgoysmu2gEVZYaHx1c13UrHiGRSVnMn8
	CKkpmznKvdiUbLDPQRsvQej6UWqh2gJ/+7Q==
X-Received: by 2002:a05:6402:1546:: with SMTP id p6mr5320732edx.206.1627555718182;
        Thu, 29 Jul 2021 03:48:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwY4QAn1JOv7y3Pw7jEkKTFfdNWaTLg8KUKIcj9ag9xPZRr+U6cjAwxcWvt9Mt8ejiQhrR1PQ==
X-Received: by 2002:a05:6402:1546:: with SMTP id p6mr5320717edx.206.1627555718025;
        Thu, 29 Jul 2021 03:48:38 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id a35sm1053304edf.80.2021.07.29.03.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 03:48:37 -0700 (PDT)
To: Mark Greer <mgreer@animalcreek.com>, Bongsu Jeon
 <bongsu.jeon@samsung.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, linux-nfc@lists.01.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org
References: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
 <20210729104022.47761-12-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <fc52cc72-b9e2-4b30-5dcb-ec50b828f957@canonical.com>
Date: Thu, 29 Jul 2021 12:48:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729104022.47761-12-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
Message-ID-Hash: 5DYLSBGYUPRNCCXJCZWCLFZ3B4NS7KU3
X-Message-ID-Hash: 5DYLSBGYUPRNCCXJCZWCLFZ3B4NS7KU3
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 11/12] nfc: mrvl: constify several pointers
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/5DYLSBGYUPRNCCXJCZWCLFZ3B4NS7KU3/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 29/07/2021 12:40, Krzysztof Kozlowski wrote:
> Several functions do not modify pointed data so arguments and local
> variables can be const for correctness and safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  drivers/nfc/nfcmrvl/fw_dnld.c | 16 +++++++++-------
>  drivers/nfc/nfcmrvl/i2c.c     |  2 +-
>  drivers/nfc/nfcmrvl/main.c    |  2 +-
>  drivers/nfc/nfcmrvl/nfcmrvl.h |  2 +-
>  drivers/nfc/nfcmrvl/spi.c     |  4 ++--
>  drivers/nfc/nfcmrvl/uart.c    |  2 +-
>  6 files changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/nfc/nfcmrvl/fw_dnld.c b/drivers/nfc/nfcmrvl/fw_dnld.c
> index aaccb8b76b3e..edac56b01fd1 100644
> --- a/drivers/nfc/nfcmrvl/fw_dnld.c
> +++ b/drivers/nfc/nfcmrvl/fw_dnld.c
> @@ -129,7 +129,7 @@ static void fw_dnld_timeout(struct timer_list *t)
>  }
>  
>  static int process_state_reset(struct nfcmrvl_private *priv,
> -			       struct sk_buff *skb)
> +			       const struct sk_buff *skb)
>  {
>  	if (sizeof(nci_pattern_core_reset_ntf) != skb->len ||
>  	    memcmp(skb->data, nci_pattern_core_reset_ntf,
> @@ -145,7 +145,8 @@ static int process_state_reset(struct nfcmrvl_private *priv,
>  	return 0;
>  }
>  
> -static int process_state_init(struct nfcmrvl_private *priv, struct sk_buff *skb)
> +static int process_state_init(struct nfcmrvl_private *priv,
> +			      const struct sk_buff *skb)
>  {
>  	struct nci_core_set_config_cmd cmd;
>  
> @@ -175,7 +176,7 @@ static void create_lc(struct nfcmrvl_private *priv)
>  }
>  
>  static int process_state_set_ref_clock(struct nfcmrvl_private *priv,
> -				       struct sk_buff *skb)
> +				       const struct sk_buff *skb)
>  {
>  	struct nci_core_set_config_cmd cmd;
>  
> @@ -221,7 +222,7 @@ static int process_state_set_ref_clock(struct nfcmrvl_private *priv,
>  }
>  
>  static int process_state_set_hi_config(struct nfcmrvl_private *priv,
> -				       struct sk_buff *skb)
> +				       const struct sk_buff *skb)
>  {
>  	if (sizeof(nci_pattern_core_set_config_rsp) != skb->len ||
>  	    memcmp(skb->data, nci_pattern_core_set_config_rsp, skb->len))
> @@ -232,7 +233,7 @@ static int process_state_set_hi_config(struct nfcmrvl_private *priv,
>  }
>  
>  static int process_state_open_lc(struct nfcmrvl_private *priv,
> -				 struct sk_buff *skb)
> +				 const struct sk_buff *skb)
>  {
>  	if (sizeof(nci_pattern_core_conn_create_rsp) >= skb->len ||
>  	    memcmp(skb->data, nci_pattern_core_conn_create_rsp,
> @@ -347,7 +348,7 @@ static int process_state_fw_dnld(struct nfcmrvl_private *priv,
>  }
>  
>  static int process_state_close_lc(struct nfcmrvl_private *priv,
> -				  struct sk_buff *skb)
> +				  const struct sk_buff *skb)
>  {
>  	if (sizeof(nci_pattern_core_conn_close_rsp) != skb->len ||
>  	    memcmp(skb->data, nci_pattern_core_conn_close_rsp, skb->len))
> @@ -358,7 +359,8 @@ static int process_state_close_lc(struct nfcmrvl_private *priv,
>  	return 0;
>  }
>  
> -static int process_state_boot(struct nfcmrvl_private *priv, struct sk_buff *skb)
> +static int process_state_boot(struct nfcmrvl_private *priv,
> +			      const struct sk_buff *skb)
>  {
>  	if (sizeof(nci_pattern_proprietary_boot_rsp) != skb->len ||
>  	    memcmp(skb->data, nci_pattern_proprietary_boot_rsp, skb->len))
> diff --git a/drivers/nfc/nfcmrvl/i2c.c b/drivers/nfc/nfcmrvl/i2c.c
> index 59a529e72d96..6e659e77c8a2 100644
> --- a/drivers/nfc/nfcmrvl/i2c.c
> +++ b/drivers/nfc/nfcmrvl/i2c.c
> @@ -182,8 +182,8 @@ static int nfcmrvl_i2c_parse_dt(struct device_node *node,
>  static int nfcmrvl_i2c_probe(struct i2c_client *client,
>  			     const struct i2c_device_id *id)
>  {
> +	const struct nfcmrvl_platform_data *pdata;
>  	struct nfcmrvl_i2c_drv_data *drv_data;
> -	struct nfcmrvl_platform_data *pdata;
>  	struct nfcmrvl_platform_data config;
>  	int ret;
>  
> diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
> index 6e9e7ce8792c..d8e48bdaf652 100644
> --- a/drivers/nfc/nfcmrvl/main.c
> +++ b/drivers/nfc/nfcmrvl/main.c
> @@ -93,7 +93,7 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
>  				void *drv_data,
>  				struct nfcmrvl_if_ops *ops,
>  				struct device *dev,
> -				struct nfcmrvl_platform_data *pdata)
> +				const struct nfcmrvl_platform_data *pdata)
>  {
>  	struct nfcmrvl_private *priv;
>  	int rc;
> diff --git a/drivers/nfc/nfcmrvl/nfcmrvl.h b/drivers/nfc/nfcmrvl/nfcmrvl.h
> index a715543bc9bf..84fafa95965e 100644
> --- a/drivers/nfc/nfcmrvl/nfcmrvl.h
> +++ b/drivers/nfc/nfcmrvl/nfcmrvl.h
> @@ -94,7 +94,7 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
>  				void *drv_data,
>  				struct nfcmrvl_if_ops *ops,
>  				struct device *dev,
> -				struct nfcmrvl_platform_data *pdata);
> +				const struct nfcmrvl_platform_data *pdata);
>  
>  
>  void nfcmrvl_chip_reset(struct nfcmrvl_private *priv);
> diff --git a/drivers/nfc/nfcmrvl/spi.c b/drivers/nfc/nfcmrvl/spi.c
> index 66696321c645..7b015bb33fc9 100644
> --- a/drivers/nfc/nfcmrvl/spi.c
> +++ b/drivers/nfc/nfcmrvl/spi.c
> @@ -106,7 +106,7 @@ static struct nfcmrvl_if_ops spi_ops = {
>  	.nci_update_config = nfcmrvl_spi_nci_update_config,
>  };
>  
> -static int nfcmrvl_spi_parse_dt(struct device_node *node,
> +static int nfcmrvl_spi_parse_dt(const struct device_node *node,
>  				struct nfcmrvl_platform_data *pdata)

This one is not correct (yet) as it depends on changes in OF/IRQ. I just
found compile configuration which triggers here warning.

Please skip this one patch.


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
