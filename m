Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C7F2D1348
	for <lists+linux-nfc@lfdr.de>; Mon,  7 Dec 2020 15:13:19 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 6D091100EBB6A;
	Mon,  7 Dec 2020 06:13:17 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.65; helo=mail-wr1-f65.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 65875100EBB68
	for <linux-nfc@lists.01.org>; Mon,  7 Dec 2020 06:13:15 -0800 (PST)
Received: by mail-wr1-f65.google.com with SMTP id a12so6105298wrv.8
        for <linux-nfc@lists.01.org>; Mon, 07 Dec 2020 06:13:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gG7VgUZtjX4oofV7gBPwji7WUqiGnJQzMVNQgM8p0KI=;
        b=HysnFTYAeZFux51w6kA2E7IQhPEkKT9HgDX4uD2yj9inj4M9jPaRwTW3l6Huhie2cX
         7SVm4DJV53tvwFM0tk+cJS4O8sEnz7U1Ym9/unHQjsei8bLyH38UeQR6Wz9yoxzefo2U
         TA4ms/3I+sbaoHrHRO8N0vA55kSqU+LzNxSehq2N1ylS86e3i8GEl4rilM06oaZ8KaEL
         2Rf4kgx+d0bhDtfW0KaX1LtuSeQJyHkDndYUIjoDmobuBEYuNbiPQlb3nN9mArgNTib/
         TgQygYNcA8ZVZc2Uu6P/V4hkQTqd+rFnKe4R+i8xB3MZW7erYwMOr1VRnMcQsq8wf4Ai
         9/dw==
X-Gm-Message-State: AOAM530dP9/W5OCRZksLl69V3LKOtgUE+QXNB8SGWHlljC1DAPUlTosZ
	oeQuFls2Nz5ynr9EisAq1N0=
X-Google-Smtp-Source: ABdhPJyDGmRg/7pSYaUY4kTpP3/w8YFZ21qsd0KTsX0+bqFdeH6YXibx9gEqHimAS3PtvvVq5sh71w==
X-Received: by 2002:a5d:4349:: with SMTP id u9mr19326981wrr.319.1607350393759;
        Mon, 07 Dec 2020 06:13:13 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id z11sm15491704wmc.39.2020.12.07.06.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 06:13:12 -0800 (PST)
Date: Mon, 7 Dec 2020 15:13:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon2@gmail.com>
Message-ID: <20201207141311.GB34599@kozik-lap>
References: <20201207113827.2902-1-bongsu.jeon@samsung.com>
 <20201207115147.GA26206@kozik-lap>
 <CACwDmQDHXwqzmUE_jEmPcJnCcPrzn=7qT=4rp1MF3s30OM7uTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACwDmQDHXwqzmUE_jEmPcJnCcPrzn=7qT=4rp1MF3s30OM7uTQ@mail.gmail.com>
Message-ID-Hash: NU5OS5L4PIIL3WU2DMGH7N4D6ML4WUHQ
X-Message-ID-Hash: NU5OS5L4PIIL3WU2DMGH7N4D6ML4WUHQ
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next] nfc: s3fwrn5: Change irqflags
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/NU5OS5L4PIIL3WU2DMGH7N4D6ML4WUHQ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 07, 2020 at 10:39:01PM +0900, Bongsu Jeon wrote:
> On Mon, Dec 7, 2020 at 8:51 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On Mon, Dec 07, 2020 at 08:38:27PM +0900, Bongsu Jeon wrote:
> > > From: Bongsu Jeon <bongsu.jeon@samsung.com>
> > >
> > > change irqflags from IRQF_TRIGGER_HIGH to IRQF_TRIGGER_RISING for stable
> > > Samsung's nfc interrupt handling.
> >
> > 1. Describe in commit title/subject the change. Just a word "change irqflags" is
> >    not enough.
> >
> Ok. I'll update it.
> 
> > 2. Describe in commit message what you are trying to fix. Before was not
> >    stable? The "for stable interrupt handling" is a little bit vauge.
> >
> Usually, Samsung's NFC Firmware sends an i2c frame as below.
> 
> 1. NFC Firmware sets the gpio(interrupt pin) high when there is an i2c
> frame to send.
> 2. If the CPU's I2C master has received the i2c frame, NFC F/W sets
> the gpio low.
> 
> NFC driver's i2c interrupt handler would be called in the abnormal case
> as the NFC F/W task of number 2 is delayed because of other high
> priority tasks.
> In that case, NFC driver will try to receive the i2c frame but there
> isn't any i2c frame
> to send in NFC. It would cause an I2C communication problem.
> This case would hardly happen.
> But, I changed the interrupt as a defense code.
> If Driver uses the TRIGGER_RISING not LEVEL trigger, there would be no problem
> even if the NFC F/W task is delayed.

All this should be explained in commit message, not in the email.

> 
> > 3. This is contradictory to the bindings and current DTS. I think the
> >    driver should not force the specific trigger type because I could
> >    imagine some configuration that the actual interrupt to the CPU is
> >    routed differently.
> >
> >    Instead, how about removing the trigger flags here and fixing the DTS
> >    and bindings example?
> >
> 
> As I mentioned before,
> I changed this code because of Samsung NFC's I2C Communication way.
> So, I think that it is okay for the nfc driver to force the specific
> trigger type( EDGE_RISING).
> 
> What do you think about it?

Some different chip or some different hardware implementation could have
the signal inverted, e.g. edge falling, not rising. This is rather
a theoretical scenario but still such change makes the code more
generic, configurable with DTS. Therefore trigger mode should be
configured via DTS, not enforced by the driver.

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
