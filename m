Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F3F2DA9D7
	for <lists+linux-nfc@lfdr.de>; Tue, 15 Dec 2020 10:13:17 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 8FEDD100EBBB7;
	Tue, 15 Dec 2020 01:13:16 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.68; helo=mail-ej1-f68.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 7CC0A100EBBB4
	for <linux-nfc@lists.01.org>; Tue, 15 Dec 2020 01:13:14 -0800 (PST)
Received: by mail-ej1-f68.google.com with SMTP id n26so26586635eju.6
        for <linux-nfc@lists.01.org>; Tue, 15 Dec 2020 01:13:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rFnb5r44Hk5DXz0JFCpBQMfmXkX1W5NDEIgxSLGBVvc=;
        b=oAqpcjvCfutdESQTFnc+GArv0QH3soJw93EY7kBVrSvzmzODf/ASmlI5uXqUpPr+Y5
         YbeVgkJkmJ1Fn4cxyWD3+EnTptc7Jbzo4TcJ4e6hAz5DJ1iJLuASVA2qrFMIhkYkzl3Y
         ODMiYZNDszu1tb00BDaEKFoS7zp/Za1e1gSWHmknbahkK9/C7wY4Chtf9j/XYzNw4PfM
         lxwmpBckX2AVGWdqGd7g6eft/mnklhll8K2rg7JbyFHEnpRDjYQqscbNxxjmAehJVbco
         XYKOEjwCI1rEVE+ppdP/NFUjteQBtI0vsJhLQgH8QPk1rw86ne2pw54CrC7n4gSeyIOM
         vHFw==
X-Gm-Message-State: AOAM531XVYLdhI+MP3EdRTiQslTj7KZQ42Z0YXUaU8GRwLzM8tWYIG/4
	SpezaY+wj+4bxbmHXrag4rs=
X-Google-Smtp-Source: ABdhPJySndnJVgRCwyOzhjXag8LQ6zc060SR5W9nuHFoSB3ubPvN06jFqCe666TP9S/Bczfzm8o0ug==
X-Received: by 2002:a17:906:195a:: with SMTP id b26mr13930796eje.4.1608023592858;
        Tue, 15 Dec 2020 01:13:12 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id n13sm904902ejr.93.2020.12.15.01.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 01:13:11 -0800 (PST)
Date: Tue, 15 Dec 2020 10:13:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon2@gmail.com>
Message-ID: <20201215091310.GB29321@kozik-lap>
References: <20201215065401.3220-1-bongsu.jeon@samsung.com>
 <20201215065401.3220-3-bongsu.jeon@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201215065401.3220-3-bongsu.jeon@samsung.com>
Message-ID-Hash: 5RZ65BE55BHAI6PVTKDW2Q66EM76FWDY
X-Message-ID-Hash: 5RZ65BE55BHAI6PVTKDW2Q66EM76FWDY
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2 net-next 2/2] nfc: s3fwrn5: Remove unused NCI prop commands
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/5RZ65BE55BHAI6PVTKDW2Q66EM76FWDY/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 15, 2020 at 03:54:01PM +0900, Bongsu Jeon wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> 
> Remove the unused NCI prop commands that s3fwrn5 driver doesn't use.
> 
> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  drivers/nfc/s3fwrn5/nci.c | 25 -------------------------
>  drivers/nfc/s3fwrn5/nci.h | 22 ----------------------
>  2 files changed, 47 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
