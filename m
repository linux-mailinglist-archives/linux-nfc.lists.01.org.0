Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAC72D9B53
	for <lists+linux-nfc@lfdr.de>; Mon, 14 Dec 2020 16:44:53 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 39F00100ED4A5;
	Mon, 14 Dec 2020 07:44:52 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.68; helo=mail-ed1-f68.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B519D100ED4A4
	for <linux-nfc@lists.01.org>; Mon, 14 Dec 2020 07:44:49 -0800 (PST)
Received: by mail-ed1-f68.google.com with SMTP id u19so17632159edx.2
        for <linux-nfc@lists.01.org>; Mon, 14 Dec 2020 07:44:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YxCiPQ08bXOR9WwEZlKFbDgY/znMZCzuPkpK3/N4u4I=;
        b=fH0t4cDhdeFAvo76GZ2gPxNbXyr8i5JV41bpCQ3grKmB1He1d1zNpZdAMUZa7V6SO8
         dcWT3iC/7uEM4DyZl04rRpB9Bx1SVG9iVfufb4bzVdcdex6yFfqnUDfTx5tJbCTWtmbt
         eHI25BW8QhwsB2f4lHG5dvTZgTgyv0yNIuKICVc+TId0r/bZI1JKm2aZR1DRVkQ6p/0/
         w9v3V6ebtZbvmCSuY3FV5TTJaY2folvJQGtW540U3ZSSwpeHndib5KBbNn1+8AlV1dbj
         hTF7JX4l/46GSYYHlIolavVOeIqyC7iSqmz5hZuOz8A7A28xx2g0SG8APhAr9TkdMkJZ
         Felw==
X-Gm-Message-State: AOAM533cqhI1M02dGplRbx1SSUUbDPkdQYvkUchsh/PR3BeUddkhnj46
	wM+vUuH0f5xWQW6KaLHME00=
X-Google-Smtp-Source: ABdhPJzax4Rk6o4qgm3tHTPLlC1IzRv08FnPJymM2C3AEOPFB+5xVKkaqEAgt1Ts0aOI6t3gmPe05g==
X-Received: by 2002:aa7:d915:: with SMTP id a21mr25033719edr.251.1607960687860;
        Mon, 14 Dec 2020 07:44:47 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id m7sm16014117eds.73.2020.12.14.07.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 07:44:46 -0800 (PST)
Date: Mon, 14 Dec 2020 16:44:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon2@gmail.com>
Message-ID: <20201214154444.GA2493@kozik-lap>
References: <20201214122823.2061-1-bongsu.jeon@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201214122823.2061-1-bongsu.jeon@samsung.com>
Message-ID-Hash: ZLEB6KYT5A6W4I3ABFTUPLLUXXVLVJ6P
X-Message-ID-Hash: ZLEB6KYT5A6W4I3ABFTUPLLUXXVLVJ6P
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next] MAINTAINERS: Update maintainer for SAMSUNG S3FWRN5 NFC
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ZLEB6KYT5A6W4I3ABFTUPLLUXXVLVJ6P/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 14, 2020 at 09:28:23PM +0900, Bongsu Jeon wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> 
> add an email to look after the SAMSUNG NFC driver.

Hi Bongsu,

Review and testing is always appreciated. However before adding an entry
to Maintainers, I would prefer to see some activity in maintainer-like
tasks. So far there are none:
https://lore.kernel.org/lkml/?q=f%3A%22Bongsu+Jeon%22

Contributing patches is not the same as maintenance. Please subscribe to
relevant mailing lists and devote effort for improving other people
code.

We had too many maintainers from many companies which did not perform
actual maintainership for long time and clearly that's not the point.

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
