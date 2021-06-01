Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A2E397109
	for <lists+linux-nfc@lfdr.de>; Tue,  1 Jun 2021 12:11:26 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E36B4100ED49E;
	Tue,  1 Jun 2021 03:11:23 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 63BF1100ED497
	for <linux-nfc@lists.01.org>; Tue,  1 Jun 2021 03:11:22 -0700 (PDT)
Received: from mail-wr1-f70.google.com ([209.85.221.70])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lo1Mm-0006fv-GE
	for linux-nfc@lists.01.org; Tue, 01 Jun 2021 10:11:20 +0000
Received: by mail-wr1-f70.google.com with SMTP id k11-20020adfe3cb0000b0290115c29d165cso1681163wrm.14
        for <linux-nfc@lists.01.org>; Tue, 01 Jun 2021 03:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qKI7EcbsXTHO2QTIMScd8fUBWjbGKBIAk+4ExxlIwok=;
        b=WdyJSi69TgNmxuBJ/HwN+RipHVM/aj7bliTnx1pziInmyiBtoH25F3GbZfjxDIgphL
         QvXmdJz4D/g8ieOyQQJkH///bEb5HiHakhXBMD+WbKzO2FeVIcsp8O6S6nVbrYBUgElk
         dMIKofodruUasyDI614pLXyXBLXFoUL+8vTiGF97gaEmD/U8xcrbVYv3GULeLD+wEdQx
         jlqcCdPABbbU0ppIJUSde8wgjff6lyunidiK4+rQkII3qcjGK1eei36PZ6vWhjxRoAwz
         FmmV8oLdE3/m6J39snLSkGElx+7fux0uiunBYJnaal2rq+A7WaJhgbwUmq5AcVf8xJXf
         oYQg==
X-Gm-Message-State: AOAM531WImuKnuTcZO6VlZ0hz0ipHVRYXC2I3AlHuK0t11yZ/pVoCIU8
	aQtNmY+jrn8YG4P7U/6po3D/O58xzhocyNpLgLjEEbeG5OuoqrsYQQW4/KXP2VIZTv2HmZR727N
	9tua3RnISUsdILaoRjgjBi2XIlwhPoW/QmQ==
X-Received: by 2002:adf:f5c9:: with SMTP id k9mr8718735wrp.180.1622542280309;
        Tue, 01 Jun 2021 03:11:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8N/cp913jwmb4tDS6Dcr9BN5XWWh5nBdCmbejhu/A96UuguWTtuNN1cKnl2UDPzuYXHUmrA==
X-Received: by 2002:adf:f5c9:: with SMTP id k9mr8718687wrp.180.1622542279772;
        Tue, 01 Jun 2021 03:11:19 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id 30sm2746863wrl.37.2021.06.01.03.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 03:11:19 -0700 (PDT)
To: Yang Li <yang.lee@linux.alibaba.com>
References: <1622540990-102660-1-git-send-email-yang.lee@linux.alibaba.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <bbe532a0-95d4-bdc8-2caf-dba8ecf4ecda@canonical.com>
Date: Tue, 1 Jun 2021 12:11:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1622540990-102660-1-git-send-email-yang.lee@linux.alibaba.com>
Content-Language: en-US
Message-ID-Hash: OM7NH5FPRE53WFWF7H625NW47PMY4QPU
X-Message-ID-Hash: OM7NH5FPRE53WFWF7H625NW47PMY4QPU
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: davem@davemloft.net, kuba@kernel.org, nathan@kernel.org, ndesaulniers@google.com, linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] NFC: nci: Remove redundant assignment to len
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/OM7NH5FPRE53WFWF7H625NW47PMY4QPU/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 01/06/2021 11:49, Yang Li wrote:
> Variable 'len' is set to conn_info->max_pkt_payload_len but this
> value is never read as it is overwritten with a new value later on,
> hence it is a redundant assignment and can be removed.
> 
> Clean up the following clang-analyzer warning:
> 
> net/nfc/nci/hci.c:164:3: warning: Value stored to 'len' is never read
> [clang-analyzer-deadcode.DeadStores]
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  net/nfc/nci/hci.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/net/nfc/nci/hci.c b/net/nfc/nci/hci.c
> index 9686514..d6732e5 100644
> --- a/net/nfc/nci/hci.c
> +++ b/net/nfc/nci/hci.c
> @@ -161,8 +161,6 @@ static int nci_hci_send_data(struct nci_dev *ndev, u8 pipe,
>  	*(u8 *)skb_push(skb, 1) = data_type;
>  
>  	do {
> -		len = conn_info->max_pkt_payload_len;
> -
>  		/* If last packet add NCI_HFP_NO_CHAINING */
>  		if (i + conn_info->max_pkt_payload_len -
>  		    (skb->len + 1) >= data_len) {
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
