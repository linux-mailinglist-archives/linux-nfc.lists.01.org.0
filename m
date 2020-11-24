Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 855442C24B9
	for <lists+linux-nfc@lfdr.de>; Tue, 24 Nov 2020 12:41:58 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 293E8100EBB86;
	Tue, 24 Nov 2020 03:41:57 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.65; helo=mail-ed1-f65.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id A78F4100EBB82
	for <linux-nfc@lists.01.org>; Tue, 24 Nov 2020 03:41:55 -0800 (PST)
Received: by mail-ed1-f65.google.com with SMTP id r22so11870758edw.6
        for <linux-nfc@lists.01.org>; Tue, 24 Nov 2020 03:41:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OuWuDtQpe3gLLoCvV3TSZsRvGbsd7x5eT2lI0ArbwK4=;
        b=FMOxBgFjIsi5RFJh6dUuN7us6dgmt0oFynCMPiq0WRzJCIvEwkCW6RcIG+pP59Qq6v
         clHJnZUOyBk5CR7gpOJUbMMy6yWXtuo7hIFBH10LPxkrAoJW1xSLOqXIbTeL/SbFOTJD
         Bq4OZek0S4h4VwKcJ/gJiqQJsvedSlddt1t6Jx0lWqg0shjhGEfrKmZ9Dw6GTTy31V18
         KLkxdl9whbb2tHcYa9KoM3IeTjnsh9QKBDevWkokBs48hpcOtfPx83CI/n6B8TDg9PTa
         oeuemx6BokhTmXDRszT6//AR2xRuesbzddkgnYWpKxEh6s9Rh/lBk7QrjNO0Z4mrcYg8
         DNBg==
X-Gm-Message-State: AOAM533UAUMT9cDwNDBeQaA1qEE/EPeWcaQgpfCHsu4il69s/P1IC8Jv
	o44rnQUC8or8u5NjcxEONx4=
X-Google-Smtp-Source: ABdhPJxIubTB3KIMkbTAqjZj968UiXkQgXME39M860y8SovpFjszvM1mKrVv9MmjhuYudLM5KIhu4g==
X-Received: by 2002:a50:eb0a:: with SMTP id y10mr3723877edp.342.1606218113995;
        Tue, 24 Nov 2020 03:41:53 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id i2sm2886628ejs.17.2020.11.24.03.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 03:41:52 -0800 (PST)
Date: Tue, 24 Nov 2020 12:41:51 +0100
From: "krzk@kernel.org" <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon2@gmail.com>
Message-ID: <20201124114151.GA32873@kozik-lap>
References: <CGME20201123075526epcms2p59410a8ba942f8942f53a593d9df764d0@epcms2p5>
 <20201123075526epcms2p59410a8ba942f8942f53a593d9df764d0@epcms2p5>
 <20201123080123.GA5656@kozik-lap>
 <CACwDmQBh77pqivk=bBv3SJ14HLucY42jZyEaKAX+n=yS3TSqFw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACwDmQBh77pqivk=bBv3SJ14HLucY42jZyEaKAX+n=yS3TSqFw@mail.gmail.com>
Message-ID-Hash: T6BMJYACCSXPNMPLWE3ONXX5IJUHHM3B
X-Message-ID-Hash: T6BMJYACCSXPNMPLWE3ONXX5IJUHHM3B
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Bongsu Jeon <bongsu.jeon@samsung.com>, "kuba@kernel.org" <kuba@kernel.org>, "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next 1/2] dt-bindings: net: nfc: s3fwrn5: Support a UART interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/T6BMJYACCSXPNMPLWE3ONXX5IJUHHM3B/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 24, 2020 at 08:39:40PM +0900, Bongsu Jeon wrote:
> On Mon, Nov 23, 2020 at 5:02 PM krzk@kernel.org <krzk@kernel.org> wrote:
> >
> > On Mon, Nov 23, 2020 at 04:55:26PM +0900, Bongsu Jeon wrote:
 > >  examples:
> > >    - |
> > >      #include <dt-bindings/gpio/gpio.h>
> > > @@ -71,3 +81,17 @@ examples:
> > >              wake-gpios = <&gpj0 2 GPIO_ACTIVE_HIGH>;
> > >          };
> > >      };
> > > +  # UART example on Raspberry Pi
> > > +  - |
> > > +    &uart0 {
> > > +        status = "okay";
> > > +
> > > +        s3fwrn82_uart {
> >
> > Just "bluetooth" to follow Devicetree specification.
> Sorry. I don't understand this comment.
> Could you explain it?
> Does it mean i need to refer to the net/broadcom-bluetooth.txt?

The node name should be "bluetooth", not "s3fwrn82_uart", because of
Devicetree naming convention - node names should represent generic class
of a device.

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
