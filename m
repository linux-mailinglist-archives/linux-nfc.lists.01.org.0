Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA382CAD25
	for <lists+linux-nfc@lfdr.de>; Tue,  1 Dec 2020 21:17:43 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id B6639100EC1FB;
	Tue,  1 Dec 2020 12:17:41 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.67; helo=mail-ed1-f67.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 61EFA100EC1FA
	for <linux-nfc@lists.01.org>; Tue,  1 Dec 2020 12:17:39 -0800 (PST)
Received: by mail-ed1-f67.google.com with SMTP id c7so5278613edv.6
        for <linux-nfc@lists.01.org>; Tue, 01 Dec 2020 12:17:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1ns4HG9DM27lmRcUp9biCqhgyVmAToMpSvVFQa0yBXI=;
        b=UwLx13qeMOvICg2qeKsWZncZK3wc0fXgOKEbHhW9C855FHSTLvFFsx+HpY+9WO7Ddo
         vpUzxHI+KooTa0TCFZehd0JZ7JIWYW3kb8QbvVWfTgKRM9PGBI6zZbM3BQU5IYQ2oT/D
         uvctJmyqxHrvwv0ho7rXT1d46lCNk1n1J3nZiWe3BbQAicvDSww3bwIkRPxL0+XNVeDZ
         +1J67E06HLsCzs6ZQ4kQo1I7htnbm8xdZBw83I2OX7W6NoansX8s8DP6weqQ/dMz3zvN
         NOHAPAVgPYDvnqBFtBwsLQSjh9ZPRWsiTKAXLPEfW3ExWzkbbqFPixHQ5VdT62JRWEUO
         4k2g==
X-Gm-Message-State: AOAM530KWokK1p8Hy/G59nbMmFmfaWRLLT6vJRj8vc22eH1LotJo9PhP
	GVYFT09rs6iCvZz16kfj+Mk=
X-Google-Smtp-Source: ABdhPJytaTlX5sDtGX2dkVcTazbihS4Em7qkx3GYmCK6ADvKA5s0Ww+UFFOU8w6FLSmjPQ7UdihqTA==
X-Received: by 2002:aa7:cc19:: with SMTP id q25mr4847401edt.290.1606853857665;
        Tue, 01 Dec 2020 12:17:37 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id d9sm412152edk.86.2020.12.01.12.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 12:17:36 -0800 (PST)
Date: Tue, 1 Dec 2020 22:17:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon2@gmail.com>
Message-ID: <20201201201735.GC2435@kozik-lap>
References: <1606830628-10236-1-git-send-email-bongsu.jeon@samsung.com>
 <1606830628-10236-4-git-send-email-bongsu.jeon@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606830628-10236-4-git-send-email-bongsu.jeon@samsung.com>
Message-ID-Hash: J7DHBEWHQZRQ4OG42J67QQGZJ7QOWULP
X-Message-ID-Hash: J7DHBEWHQZRQ4OG42J67QQGZJ7QOWULP
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v4 net-next 3/4] nfc: s3fwrn5: extract the common phy blocks
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/J7DHBEWHQZRQ4OG42J67QQGZJ7QOWULP/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 01, 2020 at 10:50:27PM +0900, Bongsu Jeon wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> 
> Extract the common phy blocks to reuse it.
> The UART module will use the common blocks.
> 
> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  drivers/nfc/s3fwrn5/Makefile     |   2 +-
>  drivers/nfc/s3fwrn5/i2c.c        | 117 +++++++++++++--------------------------
>  drivers/nfc/s3fwrn5/phy_common.c |  63 +++++++++++++++++++++
>  drivers/nfc/s3fwrn5/phy_common.h |  36 ++++++++++++
>  4 files changed, 139 insertions(+), 79 deletions(-)
>  create mode 100644 drivers/nfc/s3fwrn5/phy_common.c
>  create mode 100644 drivers/nfc/s3fwrn5/phy_common.h
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
