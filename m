Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FC82C8CC8
	for <lists+linux-nfc@lfdr.de>; Mon, 30 Nov 2020 19:29:47 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id D744E100EF256;
	Mon, 30 Nov 2020 10:29:45 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.68; helo=mail-wr1-f68.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 74CAA100EF251
	for <linux-nfc@lists.01.org>; Mon, 30 Nov 2020 10:29:40 -0800 (PST)
Received: by mail-wr1-f68.google.com with SMTP id s8so17491265wrw.10
        for <linux-nfc@lists.01.org>; Mon, 30 Nov 2020 10:29:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BL7GgKlxyULO787aR2VhuF5srikfeJ8kPXa9y9+CzWY=;
        b=b8pYvxTwrRreMxY8znjByE61tJPTHbZNy3HaNH1qaeQX/TMfTiMaD4P63NDz9Ho1M6
         txYp0GfTMCdbFx0Uhuy6LhdsJ097EvO6x1DHsolXmD+bHd6CzbJPfkMK0Z+vQ7z0LkkL
         kMuqx9oUe2Hkmao0x1/pJCwXvXrmTMn23PBP8NSQs9G0I3l6dlbb7h50TVOtI0hFraMw
         c/djOhwBQ4mNkVMa/B5oyzLUbWAQoLPyfQJvth2Zogq1JZKP+kX+CoO4LKzawzAHLL74
         iiBSOpTlx2Sv6OYOMpPiG0lqEojaWQyGbJ12lgy64p3iKYy9PKyvUfOJO7ocIsFIJPkR
         NEHQ==
X-Gm-Message-State: AOAM532jRHAs36iN0GzCOyaSVrpvqss1UpTGobx/HKV/3kIwrxF++4kn
	pOCAdkCaQ5KXlB0D2l0VZwY=
X-Google-Smtp-Source: ABdhPJy0qru9FG+0tWt9eOshF9nKj7ldKMBW7pMLd3yrYEw5pvskZP1IW/CKEzIrXt9WowIPsBTZeA==
X-Received: by 2002:a5d:5689:: with SMTP id f9mr29965801wrv.181.1606760978169;
        Mon, 30 Nov 2020 10:29:38 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id b12sm924332wmj.2.2020.11.30.10.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 10:29:37 -0800 (PST)
Date: Mon, 30 Nov 2020 20:29:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20201130182935.GA28735@kozik-lap>
References: <1606737627-29485-1-git-send-email-bongsu.jeon@samsung.com>
 <20201130085542.45184040@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201130085542.45184040@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
Message-ID-Hash: FWXTSRJAUBKLMS3DCVO2HIXKU42XVLLM
X-Message-ID-Hash: FWXTSRJAUBKLMS3DCVO2HIXKU42XVLLM
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Bongsu jeon <bongsu.jeon2@gmail.com>, linux-nfc@lists.01.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2 net-next 1/4] dt-bindings: net: nfc: s3fwrn5: Support a UART interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/FWXTSRJAUBKLMS3DCVO2HIXKU42XVLLM/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 30, 2020 at 08:55:42AM -0800, Jakub Kicinski wrote:
> On Mon, 30 Nov 2020 21:00:27 +0900 Bongsu jeon wrote:
> > From: Bongsu Jeon <bongsu.jeon@samsung.com>
> > 
> > Since S3FWRN82 NFC Chip, The UART interface can be used.
> > S3FWRN82 supports I2C and UART interface.
> > 
> > Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> 
> All patches in the series should have the same version.
> 
> If the patch was not changes in the given repost you can add:
> 
>  v3:
>   - no change
> 
> Or just not mention the version in the changelog.
> 
> It's also best to provide a cover letter describing what the series
> does as a whole for series with more than 2 patches.

Beside that I received just 1/4 of v2. LKML has one as well:
https://lore.kernel.org/lkml/1606737627-29485-1-git-send-email-bongsu.jeon@samsung.com/

Where are the others?

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
