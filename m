Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD9D2B3F65
	for <lists+linux-nfc@lfdr.de>; Mon, 16 Nov 2020 10:08:53 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 75BFD100ED49B;
	Mon, 16 Nov 2020 01:08:51 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.66; helo=mail-wm1-f66.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 6E48B100ED497
	for <linux-nfc@lists.01.org>; Mon, 16 Nov 2020 01:08:49 -0800 (PST)
Received: by mail-wm1-f66.google.com with SMTP id m125so11622548wmm.3
        for <linux-nfc@lists.01.org>; Mon, 16 Nov 2020 01:08:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0KWD0bnj4k/0SSS3VjjzTSsaeo2Viy6TEj9KR57CckA=;
        b=Eq9g6iZTBCOWEqw2XPCWASb2T49vKXuF0ycJnnddehI1V9nAc7Btt46sjeGG9JfUEe
         rxuL4IrUnGUIpeJ0mKJ90Bks0M+SWKWK1VTwrAFtK73wYuwnvJpqI2M5EXGAW3Czn1hH
         Vp9YnCPuGdWejf11WYb9TII1DjwpDTVfyhcMeeYTCSc0c8PXe0wbGbIqi3sFaaNVRAf7
         WCYY3rgaazpIMtUXKkYxPTfl/3EMZkNkgxHGamlMzYC4d44Ae9lhdBYa/Vv+2atHu1V9
         EWxRKaqkdN2InqCNqpT4HS3ebcsDrjyRJkUNXQ0hPNgkdGFBhJ3LcIUyGVRvv515eUBX
         kcGw==
X-Gm-Message-State: AOAM533cvhESaMRkQffPOBe9oDF3gTk+N34hV5zCyi/StItM8o/Hszj2
	05fxn9Ar1zOBGEk159g8ZPc=
X-Google-Smtp-Source: ABdhPJz/Lf2wqPhOxrZqNgUCCJkm0zp09JujFcjpcJD08dh6iRRnjH4y8BACbHylFmzfQqCiTza3IA==
X-Received: by 2002:a1c:c2c3:: with SMTP id s186mr14756745wmf.160.1605517727932;
        Mon, 16 Nov 2020 01:08:47 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id o205sm19078656wma.25.2020.11.16.01.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 01:08:47 -0800 (PST)
Date: Mon, 16 Nov 2020 10:08:45 +0100
From: "krzk@kernel.org" <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon@samsung.com>
Message-ID: <20201116090845.GC5937@kozik-lap>
References: <CGME20201116011950epcms2p68117cc4a7228db2baecb7d4a4840b955@epcms2p6>
 <20201116011950epcms2p68117cc4a7228db2baecb7d4a4840b955@epcms2p6>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116011950epcms2p68117cc4a7228db2baecb7d4a4840b955@epcms2p6>
Message-ID-Hash: XYELV4LS7HJRKOOX7D4NWOJZ6WDPRZQM
X-Message-ID-Hash: XYELV4LS7HJRKOOX7D4NWOJZ6WDPRZQM
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next 3/3] nfc: s3fwrn5: Change the error code
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/XYELV4LS7HJRKOOX7D4NWOJZ6WDPRZQM/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 16, 2020 at 10:19:50AM +0900, Bongsu Jeon wrote:
> ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP.
> 
> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  drivers/nfc/s3fwrn5/s3fwrn5.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
