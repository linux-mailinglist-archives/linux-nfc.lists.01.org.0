Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A416B2B3F5E
	for <lists+linux-nfc@lfdr.de>; Mon, 16 Nov 2020 10:06:55 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 34246100ED4A3;
	Mon, 16 Nov 2020 01:06:54 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.66; helo=mail-wr1-f66.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 66192100ED4A3
	for <linux-nfc@lists.01.org>; Mon, 16 Nov 2020 01:06:51 -0800 (PST)
Received: by mail-wr1-f66.google.com with SMTP id p8so17810623wrx.5
        for <linux-nfc@lists.01.org>; Mon, 16 Nov 2020 01:06:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tfut9vbpdfv8HXF8bwI2zTYoeL/KwnRwgcqOdkpMjQM=;
        b=BDdLjKBGu4t8HMYE+1aE4cWqqZLKhLIPke3XFaoMmlEQj8+WSxqQpdCROqt1AQwMXS
         VMOX5k1q6ZfEKqa856QOKQtHbFri0BktqoaXUic8Hm/Emhl+oT+FGozfd6dZ7/ehTDGC
         ssxi8FG6+DCSpszVXlYSkSeaVz0ovft6qwtLgnPV02Zm7JMfu4IbRzLa+GBgEVJ0g2Dw
         qbo84T36DCV+WsPQL8BKJXz1ShyzzRdlO2mIODEA9Iyg7TAEyBAn8RN9RpkCo6Yeslv7
         y7DmY/AP/WlOpv+5VVYrQuxRYVsY48c1RyKO5fwhapC+p3p/R/E8fYTFfwJ2xVE2VEJL
         covQ==
X-Gm-Message-State: AOAM532jFI0/DOcU3gXZrZKJb2CEhuEZZKsk6y/0iRePCRpBfSCihcpz
	Sk+BtWbTt+kfHy6xT5SLviqVbcfp6hI=
X-Google-Smtp-Source: ABdhPJymJXtGdK1p6/QBa66dXs3Ikztq26pKrXwaX8dSdc06QcZrx7F9wwgxmGLGLUUkbDSWVt1dGQ==
X-Received: by 2002:adf:f881:: with SMTP id u1mr19170576wrp.103.1605517609770;
        Mon, 16 Nov 2020 01:06:49 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id c17sm22001179wro.19.2020.11.16.01.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 01:06:48 -0800 (PST)
Date: Mon, 16 Nov 2020 10:06:47 +0100
From: "krzk@kernel.org" <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon@samsung.com>
Message-ID: <20201116090647.GA5937@kozik-lap>
References: <CGME20201116011205epcms2p566dbc946d6c7a0198d09b3a872e85f33@epcms2p5>
 <20201116011205epcms2p566dbc946d6c7a0198d09b3a872e85f33@epcms2p5>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116011205epcms2p566dbc946d6c7a0198d09b3a872e85f33@epcms2p5>
Message-ID-Hash: 4EGAMHS34OSHXZL5AWDWSAUZFC6JE2VM
X-Message-ID-Hash: 4EGAMHS34OSHXZL5AWDWSAUZFC6JE2VM
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next 1/3] nfc: s3fwrn5: Remove the max_payload
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/4EGAMHS34OSHXZL5AWDWSAUZFC6JE2VM/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 16, 2020 at 10:12:05AM +0900, Bongsu Jeon wrote:
> max_payload is unused.
> 
> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>

Please version your patches (this should be a v2) and describe changes
between versions in changelog, either in cover letter or after ---
separator.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
