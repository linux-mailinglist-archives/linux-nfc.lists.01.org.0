Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 760A52C8CF9
	for <lists+linux-nfc@lfdr.de>; Mon, 30 Nov 2020 19:40:49 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id DC6D5100EF261;
	Mon, 30 Nov 2020 10:40:47 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.65; helo=mail-wr1-f65.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 4863B100EF260
	for <linux-nfc@lists.01.org>; Mon, 30 Nov 2020 10:40:45 -0800 (PST)
Received: by mail-wr1-f65.google.com with SMTP id o1so3606867wrx.7
        for <linux-nfc@lists.01.org>; Mon, 30 Nov 2020 10:40:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2ZOrDa6ldlj99dU4NwWopQDDabM2YX1J/bSlPxihqSc=;
        b=ekE7dDqbCWlmQiIkB7HDQzGmULSNwz0t9WI2zHsaMBIJsEUFIJDJFsOfFYvTu5elzF
         zifd/WLOWywbJHiXqDqStuXVB9uNyt/JA+EDQKc7zQcZuRe3QRN1lLbP19+2J0mN6/98
         yBYPIzb0ODOh9SGIC54Tp/emINB57gMKvF3/YroNWSKLByrH5ECj3/yYqJJHbiofrLrD
         lfVaLdRLsC8w0yVEnwc8jVa7Wa+Km7oCXJSd1gXSclupiAiSi0QS3SzOP67M9kDIOlwL
         RZvOjcbphOWbESkJPN5FE628wEKadNIGSjUxHzZha5wXq8g3TNh4NZvV2FQHEekdFtyG
         Bm/A==
X-Gm-Message-State: AOAM530LjZQBGoQWAjoWZ1aghTMaMdhTbHHt7bTUrTEm4k7H7QpK6iK7
	NpZ7Iry28RtfdaJeib9INpxJ0ueywo8=
X-Google-Smtp-Source: ABdhPJx/ocpaaLADvVke5dqXezlyxFV2p7C5qdqnWe5pkBjHsJXNrEB1rkx5N13R+yVHQMZj0yCuBg==
X-Received: by 2002:adf:fd0d:: with SMTP id e13mr29118129wrr.85.1606761643575;
        Mon, 30 Nov 2020 10:40:43 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id e27sm33508526wrc.9.2020.11.30.10.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 10:40:42 -0800 (PST)
Date: Mon, 30 Nov 2020 20:40:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon2@gmail.com>
Message-ID: <20201130184041.GB28735@kozik-lap>
References: <1606737750-29537-1-git-send-email-bongsu.jeon@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606737750-29537-1-git-send-email-bongsu.jeon@samsung.com>
Message-ID-Hash: TP4JAVWBFY6P47XJ5Z2EOVQ243WIL5NM
X-Message-ID-Hash: TP4JAVWBFY6P47XJ5Z2EOVQ243WIL5NM
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next 2/4] nfc: s3fwrn5: reduce the EN_WAIT_TIME
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/TP4JAVWBFY6P47XJ5Z2EOVQ243WIL5NM/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 30, 2020 at 09:02:30PM +0900, Bongsu Jeon wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> 
> The delay of 20ms is enough to enable and
> wake up the Samsung's nfc chip.
> 
> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  drivers/nfc/s3fwrn5/i2c.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

It's really not easy to work with your way of sending the patches.

I am sorry but you have to adjust your style to the style of reviewers
and the entire community.

1. Again, you ignored/dropped my Ack.

2. I asked you to send all patches referencing each other, which you can
   achieve without any effort with git format-patch and send-email or
   with in-reply-to.
   Seriously, these tools work properly by default! You have to break
   them on purpose - so stop.  Now, all your patches are scattered over
   my mailbox. They are all over mailing list:
   https://lore.kernel.org/lkml/?q=bongsu.jeon2%40gmail.com
   Browsing this patchset is uncomfortable. It's a pain.

Please, work on your workflow. Get help in that - there are plenty of
open-source contributors in Samsung. Ask them how to do it. If you
cannot, read the mailing lists and see how others do it.

Recent example, one of thousands:
https://lore.kernel.org/linux-arm-kernel/20201130131047.2648960-1-daniel@0x0f.com/T/#m4a9ed644869b8018b8286a6b229012278141cb66

1. It comes with a cover letter,
2. All emails are properly linked with each other (scroll to the bottom).

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
