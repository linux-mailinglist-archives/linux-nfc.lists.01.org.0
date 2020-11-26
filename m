Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD562C59F9
	for <lists+linux-nfc@lfdr.de>; Thu, 26 Nov 2020 18:03:40 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 2584D100EC1D7;
	Thu, 26 Nov 2020 09:03:39 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.66; helo=mail-wm1-f66.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id A628C100EC1D5
	for <linux-nfc@lists.01.org>; Thu, 26 Nov 2020 09:03:36 -0800 (PST)
Received: by mail-wm1-f66.google.com with SMTP id a186so2757104wme.1
        for <linux-nfc@lists.01.org>; Thu, 26 Nov 2020 09:03:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Cgybd6xbGXLkt0sw6GYKKfpw15ST7qyxdFUHppXT/mE=;
        b=C6+tWFr06LByTJBVdLpDwjzpBnC+7ZyMmRD+NFF7hdr3Z66hUzmHYGfSlPr9bxjwAg
         DsjdLMj8L254ih3DDNRxvbD0JT/YLpnOWcQnVSwkqUTCZ1UQmLrMxz6LHPHebewOywa7
         qeeA9HdRikiYR3iGJ4pWsk49K8n7CabXrD6it7wcBeJyGJHI8fLE9UxKrJM+jcJgdjp8
         sHDH/HkZaiKFD3dMeswpgZyOaw8eP2l2Zlv65MdSVwma+Mlv/085WssJB1+YlOvvEtiY
         jze2/iv/jZSvZHgsTxln6hposKvxX44dYCIJSg9h/j4Gr+lliTSmvEQjWDdAOt1pYWXX
         h/VA==
X-Gm-Message-State: AOAM530uzHDWMC4yPd4UAAl8bxeb1PhlRrtDxZTzv0N9yzwNV4Z+dsYx
	HIzuIrnadqybMGBfu6jBOjw=
X-Google-Smtp-Source: ABdhPJydsaRL6q7BidWBXwnOtWeYEizgqHM52UNuaQ347n6zbnTQh9mQZMMPUix323JU6c8R20wMyA==
X-Received: by 2002:a7b:c412:: with SMTP id k18mr4486905wmi.36.1606410215008;
        Thu, 26 Nov 2020 09:03:35 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id e27sm11480050wrc.9.2020.11.26.09.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 09:03:33 -0800 (PST)
Date: Thu, 26 Nov 2020 18:03:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: bongsu.jeon2@gmail.com
Message-ID: <20201126170330.GB4978@kozik-lap>
References: <1606404819-30647-1-git-send-email-bongsu.jeon@samsung.com>
 <1606404819-30647-2-git-send-email-bongsu.jeon@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606404819-30647-2-git-send-email-bongsu.jeon@samsung.com>
Message-ID-Hash: OKCFNYSMODRRNMNATKRYBGKRQG362XSE
X-Message-ID-Hash: OKCFNYSMODRRNMNATKRYBGKRQG362XSE
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next 2/3] nfc: s3fwrn5: reduce the EN_WAIT_TIME
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/OKCFNYSMODRRNMNATKRYBGKRQG362XSE/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 27, 2020 at 12:33:38AM +0900, bongsu.jeon2@gmail.com wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> 
> The delay of 20ms is enough to enable and
> wake up the Samsung's nfc chip.
> 
> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  drivers/nfc/s3fwrn5/i2c.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
> index ae26594..9a64eea 100644
> --- a/drivers/nfc/s3fwrn5/i2c.c
> +++ b/drivers/nfc/s3fwrn5/i2c.c
> @@ -19,7 +19,7 @@
>  

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
