Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D159C2B5A6E
	for <lists+linux-nfc@lfdr.de>; Tue, 17 Nov 2020 08:43:06 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 8A493100EC1E7;
	Mon, 16 Nov 2020 23:43:05 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.68; helo=mail-wm1-f68.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 836CD100EF24D
	for <linux-nfc@lists.01.org>; Mon, 16 Nov 2020 23:43:03 -0800 (PST)
Received: by mail-wm1-f68.google.com with SMTP id h2so2291832wmm.0
        for <linux-nfc@lists.01.org>; Mon, 16 Nov 2020 23:43:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oExuX2nPRUSZWCSdhqK8NxiNZJd+yxDbz9expD12f3M=;
        b=CYciylDK7thDdUgsP6WY6GLRFEb++hXvXfxJPZIah6ITbt5FEOWL4atzFDHmAXN3DC
         lZbK2KzxBzz/KhPenBE385DUGsrhTmPF7oGBhZ4jgiqWjSansz78+xD4gqzpPe9ECzZj
         c7NY1+g5LaBiMRRWjdZOneGkoxgx+mT1c4qndarFAfMCItvXJN69CHjTtzCkb9VlDUSx
         hXr01ScQnUkOzOxSwFA3NI4LRjrXt1n+SlbR85wh7/4C6baDzhfpnMB0Ep2nzTXgb3qH
         yxwD0mWNhjFVXC5g2/54/yaSCWMIwj8B44KvPSajR1IWbpU1b/JF1RYZaVmCjHw9xiXM
         K3Mg==
X-Gm-Message-State: AOAM5318mWz72YSe7Y0jx5ZjZ+FV+dJ8WkgTlsWoPowOTsb1YvhGsfmF
	uJdNj9AWlEFwno0ZWHx7ed3kDzWnfqU=
X-Google-Smtp-Source: ABdhPJxcnC6sO/BNZsI5NeOShjqX9i4uiWmUL3qMzRG3WfK8VeDKoqFmlMidJJfFt7rjcQXccIBrOA==
X-Received: by 2002:a05:600c:2949:: with SMTP id n9mr2732488wmd.29.1605598981991;
        Mon, 16 Nov 2020 23:43:01 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id m3sm22344531wrv.6.2020.11.16.23.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 23:43:01 -0800 (PST)
Date: Tue, 17 Nov 2020 08:42:59 +0100
From: "krzk@kernel.org" <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon@samsung.com>
Message-ID: <20201117074259.GE3436@kozik-lap>
References: <CGME20201117011850epcms2p568af074144630cd0f02b3a7f7eff8d1a@epcms2p5>
 <20201117011850epcms2p568af074144630cd0f02b3a7f7eff8d1a@epcms2p5>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117011850epcms2p568af074144630cd0f02b3a7f7eff8d1a@epcms2p5>
Message-ID-Hash: NRNKNCS27JDG3LOA7JT2VN65LKU7YON6
X-Message-ID-Hash: NRNKNCS27JDG3LOA7JT2VN65LKU7YON6
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next v2 3/3] nfc: s3fwrn5: Change the error code
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/NRNKNCS27JDG3LOA7JT2VN65LKU7YON6/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 17, 2020 at 10:18:50AM +0900, Bongsu Jeon wrote:
> ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP.
> 
> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  drivers/nfc/s3fwrn5/s3fwrn5.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

I already reviewed it.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
