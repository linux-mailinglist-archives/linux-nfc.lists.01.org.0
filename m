Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A09F2C59C3
	for <lists+linux-nfc@lfdr.de>; Thu, 26 Nov 2020 18:02:02 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id F360A100EC1D5;
	Thu, 26 Nov 2020 09:02:00 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.65; helo=mail-wm1-f65.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 6FF41100EC1D3
	for <linux-nfc@lists.01.org>; Thu, 26 Nov 2020 09:01:59 -0800 (PST)
Received: by mail-wm1-f65.google.com with SMTP id h21so3073828wmb.2
        for <linux-nfc@lists.01.org>; Thu, 26 Nov 2020 09:01:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p5u+I4L/R8k3QmFwoa0PXudnHrBlJR7xKWZWA7BHe8c=;
        b=goh7tR6QA4bMKFW4Zi7ltk8yna3GlzRaf4QG4U0fLR5D29tJX6U681m3F055qUmczK
         gPTMaYLJeTkxs7orEFd8E/UbM44SJlwcAnzcYkN0nRfjlz5WCluN2U0zUEdX8YmwD/Dx
         DcCXCRid/WmdGxQtbQZwoBS/YLZoN+WgbXspA92uKGgYEbJ3aO2Y2FFo9sGV7Q7TMZOj
         qF24WQDrqiSvkvZHkCilh0W5zv+onEdnVTXafMNe+CtfBc+H9dDQbxE1seGp7v8tBPku
         0iomcR15lsJxgFUQ3XFTjk+BIjqo0AOzRyRlMAxzX7mwjrYLy0cvGdEagYsR4kKnctVz
         X26Q==
X-Gm-Message-State: AOAM532Uh/AK/KKeGPBXmQbMHxuq4gtdcYA4oE9g5QDd0jVXLpXSWUHt
	ThtCAMhRD9Kdw3e9fMrv3H0=
X-Google-Smtp-Source: ABdhPJwbdTks1pmZqfOgVKSU3Q5zZro4Vc28AJU/X6Lp45Jeke+KxaoNeLXXts9EwBk6A9SARRQdeQ==
X-Received: by 2002:a1c:2384:: with SMTP id j126mr4454862wmj.116.1606410117778;
        Thu, 26 Nov 2020 09:01:57 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id 189sm9786068wmb.18.2020.11.26.09.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 09:01:56 -0800 (PST)
Date: Thu, 26 Nov 2020 18:01:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: bongsu.jeon2@gmail.com
Message-ID: <20201126170154.GA4978@kozik-lap>
References: <1606404819-30647-1-git-send-email-bongsu.jeon@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606404819-30647-1-git-send-email-bongsu.jeon@samsung.com>
Message-ID-Hash: KC6YXU3OTMOCGKC5SUKKSFMD6RVVR7HY
X-Message-ID-Hash: KC6YXU3OTMOCGKC5SUKKSFMD6RVVR7HY
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next 1/3] nfc: s3fwrn5: use signed integer for parsing GPIO numbers
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/KC6YXU3OTMOCGKC5SUKKSFMD6RVVR7HY/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 27, 2020 at 12:33:37AM +0900, bongsu.jeon2@gmail.com wrote:
> From: Krzysztof Kozlowski <krzk@kernel.org>
> 
> GPIOs - as returned by of_get_named_gpio() and used by the gpiolib - are
> signed integers, where negative number indicates error.  The return
> value of of_get_named_gpio() should not be assigned to an unsigned int
> because in case of !CONFIG_GPIOLIB such number would be a valid GPIO.
> 
> Fixes: c04c674fadeb ("nfc: s3fwrn5: Add driver for Samsung S3FWRN5 NFC Chip")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Why do you send my patch?

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
