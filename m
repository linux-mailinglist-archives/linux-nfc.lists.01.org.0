Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE852C8D16
	for <lists+linux-nfc@lfdr.de>; Mon, 30 Nov 2020 19:42:37 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 32763100EF267;
	Mon, 30 Nov 2020 10:42:36 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.65; helo=mail-wr1-f65.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 4E258100EF265
	for <linux-nfc@lists.01.org>; Mon, 30 Nov 2020 10:42:34 -0800 (PST)
Received: by mail-wr1-f65.google.com with SMTP id 64so17553956wra.11
        for <linux-nfc@lists.01.org>; Mon, 30 Nov 2020 10:42:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0z4kMZ/L26HA3bimUDjYY1jt90FsNiuc+VpOhte22TQ=;
        b=QYdeEOhhNVVUOsYWfM0RpTmUquBZrHY5AHZsWsOkwEHkult4/ZzXwjvOUT53eVmxqJ
         T7ewyudINn74nLAdwvllhb1tP6vZkkneJzhSg3ZIZu+SW/vWYp2Zm+zLeuSLZS1Pk7yY
         6Qjrg34I2BTAs1UDPt7ehcX2yd68VJIBCa7vu7mg+WFVD5j55CcDCD1QstEc+2mNH6/W
         tnf6Da0faorRvINgmUA/Io76CBu+9SMmBWYzr7RbpyWvtInnaoJIiJQFwy1HSWoJAlsc
         uKhm7L/cLNXzdeXRt2+us7mWGl/btIvg6/fHRWXQbJL5Y/cd5HwCV2cUgEszJCdfAoxC
         Rpeg==
X-Gm-Message-State: AOAM531EGZpOlRP7cOQmACNrjGpB+K7wdvRHatdIdT/Gx7bQtLrRRivJ
	2q3qpA4GHb5cgUPB6qYSQF4=
X-Google-Smtp-Source: ABdhPJzS5rKeyCdk7vXGyB027nSu2wXtFxZrWsRmSCyWSC+2I/zY4xZDJCEwxue7oPvvwvvIKto80Q==
X-Received: by 2002:adf:e88a:: with SMTP id d10mr31071993wrm.29.1606761752819;
        Mon, 30 Nov 2020 10:42:32 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id y7sm10350445wrp.3.2020.11.30.10.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 10:42:31 -0800 (PST)
Date: Mon, 30 Nov 2020 20:42:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon2@gmail.com>
Message-ID: <20201130184230.GC28735@kozik-lap>
References: <1606737829-29586-1-git-send-email-bongsu.jeon@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606737829-29586-1-git-send-email-bongsu.jeon@samsung.com>
Message-ID-Hash: 7OKKLSIURGCUPLK4UIJQR76V7F6B5T5V
X-Message-ID-Hash: 7OKKLSIURGCUPLK4UIJQR76V7F6B5T5V
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v3 net-next 3/4] nfc: s3fwrn5: extract the common phy blocks
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/7OKKLSIURGCUPLK4UIJQR76V7F6B5T5V/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 30, 2020 at 09:03:49PM +0900, Bongsu Jeon wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> 
> Extract the common phy blocks to reuse it.
> The UART module will use the common blocks.
> 
> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  Changes in v3:
>    - move the phy_common object to s3fwrn.ko to avoid duplication.
>    - include the header files to include everything which is used inside.
>    - wrap the lines.
> 
>  Changes in v2:
>    - remove the common function's definition in common header file.
>    - make the common phy_common.c file to define the common function.
>    - wrap the lines.
>    - change the Header guard.
>    - remove the unused common function.
> 
>  drivers/nfc/s3fwrn5/Makefile     |   2 +-
>  drivers/nfc/s3fwrn5/i2c.c        | 117 +++++++++++++--------------------------
>  drivers/nfc/s3fwrn5/phy_common.c |  63 +++++++++++++++++++++
>  drivers/nfc/s3fwrn5/phy_common.h |  36 ++++++++++++
>  4 files changed, 139 insertions(+), 79 deletions(-)
>  create mode 100644 drivers/nfc/s3fwrn5/phy_common.c
>  create mode 100644 drivers/nfc/s3fwrn5/phy_common.h

I am sorry, but I am not going to review this. Please send properly a
next version - v4 of entire patchset - while fixing issues pointed out
in my other email (so use proper workflow).

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
