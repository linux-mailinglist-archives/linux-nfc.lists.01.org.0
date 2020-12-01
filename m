Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B45852CAD3C
	for <lists+linux-nfc@lfdr.de>; Tue,  1 Dec 2020 21:24:52 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 52495100EC1FB;
	Tue,  1 Dec 2020 12:24:51 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.66; helo=mail-ed1-f66.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id BA0AF100EC1F9
	for <linux-nfc@lists.01.org>; Tue,  1 Dec 2020 12:24:48 -0800 (PST)
Received: by mail-ed1-f66.google.com with SMTP id b2so5274001edy.13
        for <linux-nfc@lists.01.org>; Tue, 01 Dec 2020 12:24:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZeQhgtJymCHCi7xcHFwnekowg0dZ1ylay8OPyOYHius=;
        b=Y9UDTSIcj5HUEN3K/jHzdlQnC05WY8fHxWrpV0l26/SPHQPs6W7xI/Wul5jGFUiBB7
         pc49bOtvQAeOhgCg9WNDJ5FwYKeaSqXiLeUwb2St39L71OZO9PRGF7wAijOt5HAbu9D2
         tK6o25I4kGiFH5c1OASwk7UmQmryorOF7NjKRj0kFTJ51+imZIKcPUdYo3aEKTX8LNtD
         +youu8ZY1hpsuDhv/YN2h/VXN+emzv4U2RtlmR/YrHXy8G2r5/qjveYJUcQ4XdLXX85E
         8bgFKR1Dc45ZekW6pGkgOB00YhFFvt47UU9/ocVebu9UCQP12CWFFcXljO33y1ffwkwg
         Y5DA==
X-Gm-Message-State: AOAM530ZYjR/DqSFSt4zkv8cWtpcmOS3TkqrxF4LwCUwuy+LRMZARPqH
	scCQEqW2LvUhSLk8AVV7uC79haFi2Ho=
X-Google-Smtp-Source: ABdhPJzQqqaHsg2yWf3EuAlhpDz+JHiuWbYCBZowD4C6Nrak+YQb7+xuF0eHcD3V2hn6nxyq+25Bgw==
X-Received: by 2002:a50:e00b:: with SMTP id e11mr1883546edl.303.1606854285637;
        Tue, 01 Dec 2020 12:24:45 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id n15sm351278eje.112.2020.12.01.12.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 12:24:44 -0800 (PST)
Date: Tue, 1 Dec 2020 22:24:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon2@gmail.com>
Message-ID: <20201201202443.GD2435@kozik-lap>
References: <1606830628-10236-1-git-send-email-bongsu.jeon@samsung.com>
 <1606830628-10236-5-git-send-email-bongsu.jeon@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606830628-10236-5-git-send-email-bongsu.jeon@samsung.com>
Message-ID-Hash: FRDSGNLPIDFXAVD55CQEBGKX47AMBD32
X-Message-ID-Hash: FRDSGNLPIDFXAVD55CQEBGKX47AMBD32
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v4 net-next 4/4] nfc: s3fwrn5: Support a UART interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/FRDSGNLPIDFXAVD55CQEBGKX47AMBD32/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 01, 2020 at 10:50:28PM +0900, Bongsu Jeon wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> 
> Since S3FWRN82 NFC Chip, The UART interface can be used.
> S3FWRN82 uses NCI protocol and supports I2C and UART interface.
> 
> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  drivers/nfc/s3fwrn5/Kconfig      |  12 +++
>  drivers/nfc/s3fwrn5/Makefile     |   2 +
>  drivers/nfc/s3fwrn5/phy_common.c |  12 +++
>  drivers/nfc/s3fwrn5/phy_common.h |   1 +
>  drivers/nfc/s3fwrn5/uart.c       | 196 +++++++++++++++++++++++++++++++++++++++
>  5 files changed, 223 insertions(+)
>  create mode 100644 drivers/nfc/s3fwrn5/uart.c
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
