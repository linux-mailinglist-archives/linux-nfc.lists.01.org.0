Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A71D82B3F64
	for <lists+linux-nfc@lfdr.de>; Mon, 16 Nov 2020 10:08:24 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 6295E100ED49B;
	Mon, 16 Nov 2020 01:08:23 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.65; helo=mail-wm1-f65.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 66CE2100ED49B
	for <linux-nfc@lists.01.org>; Mon, 16 Nov 2020 01:08:20 -0800 (PST)
Received: by mail-wm1-f65.google.com with SMTP id h2so23008368wmm.0
        for <linux-nfc@lists.01.org>; Mon, 16 Nov 2020 01:08:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sZWpXTMZhBYNMXQLkNSi+nx/qUOUqjH8uwxWQ2rWk0s=;
        b=cDGKv5bi2BFAwPf273k7aTQ4ms7IfoJriX8YI7W8eR8uKrcIDowUQSm+iHLkhw8501
         6557ue/cdtRHmQ/1AMvkzVt0PBnGmKqvV/KtuME5xFucyrljQ4NQ61S815e87nKwW0AU
         dJEBmVb2W0V6VWCMn4fiRksWtKZ0iYwokOppQxYhVL6STn7lS9oEQhBhklfiL+n3XnA1
         M7gtLDLfPUYaRmRl3vuDuaydg8/ZQPckZAO4X5ebJycnccqBxaWFpau9qv4LhExIdsZg
         HBVOb08GKkbj4ocBPantJ3ht6jrrMmNvmpS8JdQm5SUdCEfD8pbZjvRgpg0sX7ZL9o+m
         jeLA==
X-Gm-Message-State: AOAM531Mmdf4hA39zGPjA9RZhxaR/Mf+QnBPmNaSW2CFnXSLiAehzotV
	IjCTLpacWu7PIHPhIjUKyn4=
X-Google-Smtp-Source: ABdhPJzeeJsikt2cm7eKacJ2H72vhOCG8oAnZZ3cMfRtvEakrqBU7SwjtlegU3S0hxGyctFwfTLdFg==
X-Received: by 2002:a05:600c:d2:: with SMTP id u18mr14527459wmm.102.1605517698893;
        Mon, 16 Nov 2020 01:08:18 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id v6sm24189475wrb.53.2020.11.16.01.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 01:08:18 -0800 (PST)
Date: Mon, 16 Nov 2020 10:08:16 +0100
From: "krzk@kernel.org" <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon@samsung.com>
Message-ID: <20201116090816.GB5937@kozik-lap>
References: <CGME20201116011755epcms2p7f7232e0865e8e1bc11a4b528c10d3571@epcms2p7>
 <20201116011755epcms2p7f7232e0865e8e1bc11a4b528c10d3571@epcms2p7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116011755epcms2p7f7232e0865e8e1bc11a4b528c10d3571@epcms2p7>
Message-ID-Hash: JSOHVGCFHXSFKH3GY4OPLRQAZ2KDTW4H
X-Message-ID-Hash: JSOHVGCFHXSFKH3GY4OPLRQAZ2KDTW4H
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next 2/3] nfc: s3fwrn5: Fix the misspelling in a comment
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/JSOHVGCFHXSFKH3GY4OPLRQAZ2KDTW4H/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 16, 2020 at 10:17:55AM +0900, Bongsu Jeon wrote:
> stucture should be replaced by structure.
> 
> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  drivers/nfc/s3fwrn5/firmware.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
