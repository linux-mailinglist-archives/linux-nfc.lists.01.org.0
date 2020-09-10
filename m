Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F309264977
	for <lists+linux-nfc@lfdr.de>; Thu, 10 Sep 2020 18:14:17 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 018C513DCA2DB;
	Thu, 10 Sep 2020 09:14:16 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.68; helo=mail-ej1-f68.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 1B0F213DCA2D6
	for <linux-nfc@lists.01.org>; Thu, 10 Sep 2020 09:14:12 -0700 (PDT)
Received: by mail-ej1-f68.google.com with SMTP id j11so9608719ejk.0
        for <linux-nfc@lists.01.org>; Thu, 10 Sep 2020 09:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UlWeBO5XXsVkxeqCqR5Hh1T/dXmevbm+y0dv6NWqW5E=;
        b=O513PObCoznH6O//LUeE3o5vVkV96EkrV5CkEaBdmDw+jBIhNBt8bH0rwyfBv8A19d
         TakTmyZ+YXaXACETlIm2+INX1pPOcym1e3uvTPn8ZmQC6svfge3wTx8tj1d/mVSjleNT
         yxyPRcmtaY37vhcU/R6Cv7roAe/w4cMCILVPeo9nXTOk2Jh9HoKYRDicAMJWz5u6/izd
         GSu4FiS0a9Y86bBTtB4H7Bz2vXMp9BmN68lZeDwpISRdxtLZWF5GDcZ5iWFXvE1oP4h2
         dYDvsey3PV5aA5mK4X9kzeTJ0MSc2Wo5l3IB9G77SI2jT6FuBdLfgjCF0pbOBw7eefFX
         BlGw==
X-Gm-Message-State: AOAM5315c1J03apLfBuT+alvJNITE348zHkA2mGfYxVy8TRVCAuB8veY
	Lnhw2kI85cURC/w7jNw6xqo=
X-Google-Smtp-Source: ABdhPJwIIQ8dJ5uLZ10q13CyfyBK+itpFUo2QKO7vjp47zYPGf4bkS+d38Lcvwn5F7hpQoBbFA1R6A==
X-Received: by 2002:a17:906:69c1:: with SMTP id g1mr9261970ejs.285.1599754450515;
        Thu, 10 Sep 2020 09:14:10 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
        by smtp.googlemail.com with ESMTPSA id f13sm7520054ejb.81.2020.09.10.09.14.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 09:14:09 -0700 (PDT)
Date: Thu, 10 Sep 2020 18:14:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Opasiak <k.opasiak@samsung.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Olof Johansson <olof@lixom.net>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-nfc@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Message-ID: <20200910161406.GA6491@kozik-lap>
References: <20200906153654.2925-1-krzk@kernel.org>
 <20200906153654.2925-10-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200906153654.2925-10-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Message-ID-Hash: 522N4UABX7PLVJQ3OBLKJJE4TQUL6UDW
X-Message-ID-Hash: 522N4UABX7PLVJQ3OBLKJJE4TQUL6UDW
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2 9/9] arm64: defconfig: Enable Samsung S3FWRN5 NFC driver
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/522N4UABX7PLVJQ3OBLKJJE4TQUL6UDW/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Sep 06, 2020 at 05:36:54PM +0200, Krzysztof Kozlowski wrote:
> Enable the Samsung S3FWRN5 NFC driver present in Exynos5433-based
> TM2/TM2E boards.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm64/configs/defconfig | 3 +++

Applied.

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
