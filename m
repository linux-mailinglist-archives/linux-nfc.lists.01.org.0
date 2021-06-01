Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C0E3973D4
	for <lists+linux-nfc@lfdr.de>; Tue,  1 Jun 2021 15:07:55 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E6E34100ED49E;
	Tue,  1 Jun 2021 06:07:53 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 2AC3D100ED497
	for <linux-nfc@lists.01.org>; Tue,  1 Jun 2021 06:07:50 -0700 (PDT)
Received: from mail-wr1-f70.google.com ([209.85.221.70])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lo47Z-0001r7-0i
	for linux-nfc@lists.01.org; Tue, 01 Jun 2021 13:07:49 +0000
Received: by mail-wr1-f70.google.com with SMTP id k25-20020a5d52590000b0290114dee5b660so3181647wrc.16
        for <linux-nfc@lists.01.org>; Tue, 01 Jun 2021 06:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FpFE3Q169p9I82G663kCNgbGWOU29minA7JKgCHkCBE=;
        b=GveTuA29rlrtCU5n8y0d+bzX4gg+EMG4GvkicZUOsfWqbJqzf++dmiasous1j6blGV
         TSOQ4mOamRKSi0xqw6yr5a181Nk6PWuwlPx31Q3JtR9x3LCBNM1o+GzFUiB/nR4Et2Dw
         VyvCCrr7MN3uj+UX1ldJrtzEriQ7cTN0parzp4GokMMyarrNAy5b1xa4N70tnCT5dDSd
         YG5jPOUnvNvxW+XjVaYZU8L49W3owNFDGUo0WjvaLghkJKQ+PlmGZfwroNSCtGD9IiPs
         hCPDeUlqNqcfP3wup3dvEsMxA+fUieAB9T2Wg9m8N/9jWD8D8GWE4ORvrZ85rBh1oJ7q
         VlJA==
X-Gm-Message-State: AOAM530S+6waES3XMgdAMqQqsejGPsSMlkvbYg+tb1EZQ0h5DwW+4V3D
	dXsyl31Yk1a5CBvTwbwCd8wwAxOQcBRPq1s1jGDoRzUayHosDY5lYzy5cQAZNKDcEd4pUPTyu6r
	BO46YZQX9Z42IndeMQlDkrkzLAoeogwPd9g==
X-Received: by 2002:a05:600c:3227:: with SMTP id r39mr26743367wmp.26.1622552868730;
        Tue, 01 Jun 2021 06:07:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPw71Sl27dDWwQIasNqYQAmTjczXg24B0GI/7daRMIzEBWYFDceWeCW6ZZlV/yvXmg1UM8eA==
X-Received: by 2002:a05:600c:3227:: with SMTP id r39mr26743349wmp.26.1622552868588;
        Tue, 01 Jun 2021 06:07:48 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id e17sm3587959wre.79.2021.06.01.06.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 06:07:48 -0700 (PDT)
To: Nigel Christian <nigel.l.christian@gmail.com>
References: <YLYvcbjuPg1JFr7/@fedora>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <3e2f804b-107a-9f44-2ed2-95e4c2a2e426@canonical.com>
Date: Tue, 1 Jun 2021 15:07:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLYvcbjuPg1JFr7/@fedora>
Content-Language: en-US
Message-ID-Hash: KM2VG5QM4EQVEMBQUJALKDQLF44K7ATE
X-Message-ID-Hash: KM2VG5QM4EQVEMBQUJALKDQLF44K7ATE
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] NFC: microread: Pass err variable to async_cb()
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/KM2VG5QM4EQVEMBQUJALKDQLF44K7ATE/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 01/06/2021 15:00, Nigel Christian wrote:
> In the case MICROREAD_CB_TYPE_READER_ALL clang reports a dead
> code warning. The error code is being directly passed to 
> async_cb(). Fix this by passing the err variable, which is also
> done in another path.
> 
> Addresses-Coverity: ("Unused value") 
> Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
> ---
>  drivers/nfc/microread/microread.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/nfc/microread/microread.c b/drivers/nfc/microread/microread.c
> index 8d3988457c58..130b0f554016 100644
> --- a/drivers/nfc/microread/microread.c
> +++ b/drivers/nfc/microread/microread.c
> @@ -367,7 +367,7 @@ static void microread_im_transceive_cb(void *context, struct sk_buff *skb,
>  				err = -EPROTO;

Remove this line instead, please. The err is argument passed by value so
assigning it within a function is ugly.

>  				kfree_skb(skb);
>  				info->async_cb(info->async_cb_context, NULL,
> -					       -EPROTO);
> +					       err);
>  				return;
>  			}
>  
> 


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
