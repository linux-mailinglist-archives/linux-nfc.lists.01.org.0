Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7EA2C3A33
	for <lists+linux-nfc@lfdr.de>; Wed, 25 Nov 2020 08:37:41 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 717E3100EF24B;
	Tue, 24 Nov 2020 23:37:36 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=krzk@kernel.org; receiver=<UNKNOWN> 
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 0B06F100EF24A
	for <linux-nfc@lists.01.org>; Tue, 24 Nov 2020 23:37:33 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E041C20B1F
	for <linux-nfc@lists.01.org>; Wed, 25 Nov 2020 07:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606289853;
	bh=pfubf2Eam/M4OwhA361SdUjqP5Jpv5yEhn0hQW/qEXM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=t1ilZtQl84DIdUr/Ndzh2aOEoxPNsNOyqAs7YwWNxFOl4LZqMrxDzTxTLVGwV/ARZ
	 5aMRl7wAttYA+TX0jAvo+IgqvlbpsuyYEN2a6trloHLJYgVsExhLbnlcjOQSpjKNr0
	 0tlBSE7OqbHnbe4fyyRNmWOx2CXBLCX3nLHFn8kY=
Received: by mail-ed1-f51.google.com with SMTP id d18so1473770edt.7
        for <linux-nfc@lists.01.org>; Tue, 24 Nov 2020 23:37:32 -0800 (PST)
X-Gm-Message-State: AOAM531uvKFYT2GPj24uma2JaJBlHgHWEtdRy4eD3YHJXA7wRDLtKWe6
	btShrZ4x5dkh1rNBouHZs5fzO1EUGAkOW1TLW3M=
X-Google-Smtp-Source: ABdhPJwuArKsAqTsBCAJDIDSansjrfy5FPVUgH9SvGi2jdhaUnKWI21oZXoXdA3HGRZkIUlEqhKaZTPWEalobRnY4l8=
X-Received: by 2002:a05:6402:2218:: with SMTP id cq24mr2305279edb.246.1606289851348;
 Tue, 24 Nov 2020 23:37:31 -0800 (PST)
MIME-Version: 1.0
References: <CGME20201123075526epcms2p59410a8ba942f8942f53a593d9df764d0@epcms2p5>
 <20201123075526epcms2p59410a8ba942f8942f53a593d9df764d0@epcms2p5>
 <20201123080123.GA5656@kozik-lap> <CACwDmQBh77pqivk=bBv3SJ14HLucY42jZyEaKAX+n=yS3TSqFw@mail.gmail.com>
 <20201124114151.GA32873@kozik-lap> <CACwDmQDWtfa8tXkG8W+EQxjdYJ6rkVgN9PjOVQdK8CwUXAURMg@mail.gmail.com>
In-Reply-To: <CACwDmQDWtfa8tXkG8W+EQxjdYJ6rkVgN9PjOVQdK8CwUXAURMg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 25 Nov 2020 08:37:19 +0100
X-Gmail-Original-Message-ID: <CAJKOXPc1sBvuZACRM_4fjiSJECg7eRqWB+c2aQPDE1iPWHbdmA@mail.gmail.com>
Message-ID: <CAJKOXPc1sBvuZACRM_4fjiSJECg7eRqWB+c2aQPDE1iPWHbdmA@mail.gmail.com>
To: Bongsu Jeon <bongsu.jeon2@gmail.com>
Message-ID-Hash: RBQPYYLYWNQPZSIHTCATIU33EI6MMKV3
X-Message-ID-Hash: RBQPYYLYWNQPZSIHTCATIU33EI6MMKV3
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Bongsu Jeon <bongsu.jeon@samsung.com>, "kuba@kernel.org" <kuba@kernel.org>, "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next 1/2] dt-bindings: net: nfc: s3fwrn5: Support a UART interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/RBQPYYLYWNQPZSIHTCATIU33EI6MMKV3/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 25 Nov 2020 at 04:08, Bongsu Jeon <bongsu.jeon2@gmail.com> wrote:
>
> On 11/24/20, krzk@kernel.org <krzk@kernel.org> wrote:
> > On Tue, Nov 24, 2020 at 08:39:40PM +0900, Bongsu Jeon wrote:
> >> On Mon, Nov 23, 2020 at 5:02 PM krzk@kernel.org <krzk@kernel.org> wrote:
> >> >
> >> > On Mon, Nov 23, 2020 at 04:55:26PM +0900, Bongsu Jeon wrote:
> >  > >  examples:
> >> > >    - |
> >> > >      #include <dt-bindings/gpio/gpio.h>
> >> > > @@ -71,3 +81,17 @@ examples:
> >> > >              wake-gpios = <&gpj0 2 GPIO_ACTIVE_HIGH>;
> >> > >          };
> >> > >      };
> >> > > +  # UART example on Raspberry Pi
> >> > > +  - |
> >> > > +    &uart0 {
> >> > > +        status = "okay";
> >> > > +
> >> > > +        s3fwrn82_uart {
> >> >
> >> > Just "bluetooth" to follow Devicetree specification.
> >> Sorry. I don't understand this comment.
> >> Could you explain it?
> >> Does it mean i need to refer to the net/broadcom-bluetooth.txt?
> >
> > The node name should be "bluetooth", not "s3fwrn82_uart", because of
> > Devicetree naming convention - node names should represent generic class
> > of a device.
> >
> Actually, RN82 is the nfc device.
> So, is it okay to use the name as nfc instead of Bluetooth?

Oops, of course, nfc, I don't know why the Bluetooth stuck in my mind.

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
