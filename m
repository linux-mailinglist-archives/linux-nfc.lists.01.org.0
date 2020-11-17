Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA6C2B5A6D
	for <lists+linux-nfc@lfdr.de>; Tue, 17 Nov 2020 08:42:39 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 7604C100EF24D;
	Mon, 16 Nov 2020 23:42:38 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.65; helo=mail-wm1-f65.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id A1C72100EF24C
	for <linux-nfc@lists.01.org>; Mon, 16 Nov 2020 23:42:36 -0800 (PST)
Received: by mail-wm1-f65.google.com with SMTP id c9so2267309wml.5
        for <linux-nfc@lists.01.org>; Mon, 16 Nov 2020 23:42:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xWp1eHqxJnsfkTXNJY856jqkL7WhZdMDgB3LhjYCpkU=;
        b=CNGl8Mj65AEp9C0rjgGA2uUcjkm4Q4SaqytwRYao4GbEyHeD9wHIRo6VF622js0S9V
         D3kYZf9cp7AD1tm5JYHgXUZOwN3qPCFUfVneFyCRCkuJw5zzWfG15q7A78CaXtWazKmC
         +cy55ukNU/GnuQ+pyNcmVq6fLciM7bdB4JIJM9sBHF3XrDfl6k/m2Fwq1slmBZyImQNd
         LwJK/wuZEqJW4F38pdRp0TlypU0MCxqrc81GRlbzo+NEh36Id5rp/5JE0VBmf+g2oApm
         xDQZ6eqrEUHLKyVNEvlaQbdsWwBpoPJOk1/LjqoVQmqOGidQzOAwL1Z7IvkxY5DaFGId
         pJKg==
X-Gm-Message-State: AOAM530WDA7ihKQo4KgxD9rk0VHtkJ7mXXIrnkJtzqRn2mDPzuNbnxQE
	WMb7F34azmMuriUv0WG9/HE=
X-Google-Smtp-Source: ABdhPJzALsxAg5KaT3kOTwptjvp8LII9u6EUdpnh08YKxeIcahOtj/XHoV6s7MpPfXSq2Bd30L3Jeg==
X-Received: by 2002:a05:600c:286:: with SMTP id 6mr2654961wmk.125.1605598955112;
        Mon, 16 Nov 2020 23:42:35 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id a12sm25749440wrr.31.2020.11.16.23.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 23:42:34 -0800 (PST)
Date: Tue, 17 Nov 2020 08:42:32 +0100
From: "krzk@kernel.org" <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon@samsung.com>
Message-ID: <20201117074232.GD3436@kozik-lap>
References: <CGME20201117011742epcms2p1fb85ba231b3a1673d97af4bc1479744f@epcms2p1>
 <20201117011742epcms2p1fb85ba231b3a1673d97af4bc1479744f@epcms2p1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117011742epcms2p1fb85ba231b3a1673d97af4bc1479744f@epcms2p1>
Message-ID-Hash: R4Y5BIWQJDW5M4JHXNO2J2CZH4LC67WJ
X-Message-ID-Hash: R4Y5BIWQJDW5M4JHXNO2J2CZH4LC67WJ
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next v2 2/3] nfc: s3fwrn5: Fix the misspelling in a comment
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/R4Y5BIWQJDW5M4JHXNO2J2CZH4LC67WJ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 17, 2020 at 10:17:42AM +0900, Bongsu Jeon wrote:
> stucture should be replaced by structure.
> 
> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>

I already reviewed it.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
