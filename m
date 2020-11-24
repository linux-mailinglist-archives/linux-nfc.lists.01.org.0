Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 510712C24B7
	for <lists+linux-nfc@lfdr.de>; Tue, 24 Nov 2020 12:39:56 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id B675F100EBB82;
	Tue, 24 Nov 2020 03:39:54 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 5ABCA100EC1C4
	for <linux-nfc@lists.01.org>; Tue, 24 Nov 2020 03:39:52 -0800 (PST)
Received: by mail-io1-xd43.google.com with SMTP id i9so21567438ioo.2
        for <linux-nfc@lists.01.org>; Tue, 24 Nov 2020 03:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o+pLgnufOu586P5N25km8tKyPfvWEh+E0AYw7VCffmc=;
        b=fAlU84St8aTSVSdLa7K2XwZARe2D+EuLN2meQQBV4nfKO4qX+KWuvYvessuPsLRGVQ
         GN29tZ50ReEtksCCcofpdnqRZzJv/7V6CWQCr9tx1nzRTGfVYZX2WdbpytUw8bzZ9Zas
         5qq9lxwbQngbd77gwvPkPlQTtdajvoxaClGI1hdEXRI6U6mBi4yKYSxCoUV2cX1yWDrC
         zdhnL1searhMs4HOOYWZgCkoFiJK0TZFLYl9AiFzZRuK20zGfTy4HOLCw3ex1A+eI+I4
         8U+lgToKbExpLb/YDcmy/Oxsuf5rfumWsV4aSFdbH6o/ZHz+HT3LYhXUnS/nL/pkrkr2
         mtVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o+pLgnufOu586P5N25km8tKyPfvWEh+E0AYw7VCffmc=;
        b=senA7o6Ru59LC4W4Fq6GRrDcy0yBfRsW1ZPrXMKRqNMWoGk18snzK7GWpET6QWSEed
         zf8no1sAeJtYP3Q6OxGPnnv7epbWV61Erh7sODuNC6C0C6/NN8eVeZiEnNL9hW9XS0nB
         sKyirmF1XtEztMrpY5XOYbf49XRH5XFEhq9mGG69s7PUREOG8gFAnyo5Iut4z5LDPNCa
         Nl9ZcH2Gs+onRlkcBS5pIl9V05Kjz8xKrRCI6aHQWkI+XVMzDEjOqtkm6eNBbCXyGX60
         +i7YzFJ9PaMPCBCb7BXVPH2RsbGJm7wBKDozAybukBeFjIp7u3n+IOGR2aktK0oAPV8R
         FgZQ==
X-Gm-Message-State: AOAM532J1s+u/uvocxftT1lgOgVu+OhKUR+o0YLZ1ut5vfCXmLtE2H+K
	NKo8VjMuvNQUIRyKcYQ5mxf/EB8K/H78+yKny0pEVo4Pcewzcw==
X-Google-Smtp-Source: ABdhPJyAuwpxepiQkMqr6HXHH/PjSQ2oJsHlN/rNT/dhgM+V8+l1AuOD348LrUQ2R1isVaXMJMSeQXxPhPCU2I6n07g=
X-Received: by 2002:a6b:fc16:: with SMTP id r22mr653203ioh.55.1606217991225;
 Tue, 24 Nov 2020 03:39:51 -0800 (PST)
MIME-Version: 1.0
References: <CGME20201123075526epcms2p59410a8ba942f8942f53a593d9df764d0@epcms2p5>
 <20201123075526epcms2p59410a8ba942f8942f53a593d9df764d0@epcms2p5> <20201123080123.GA5656@kozik-lap>
In-Reply-To: <20201123080123.GA5656@kozik-lap>
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
Date: Tue, 24 Nov 2020 20:39:40 +0900
Message-ID: <CACwDmQBh77pqivk=bBv3SJ14HLucY42jZyEaKAX+n=yS3TSqFw@mail.gmail.com>
To: "krzk@kernel.org" <krzk@kernel.org>
Message-ID-Hash: 5NMHGJLZT6Y5BHR745NWSFK3SA2S5CFR
X-Message-ID-Hash: 5NMHGJLZT6Y5BHR745NWSFK3SA2S5CFR
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Bongsu Jeon <bongsu.jeon@samsung.com>, "kuba@kernel.org" <kuba@kernel.org>, "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next 1/2] dt-bindings: net: nfc: s3fwrn5: Support a UART interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/5NMHGJLZT6Y5BHR745NWSFK3SA2S5CFR/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 23, 2020 at 5:02 PM krzk@kernel.org <krzk@kernel.org> wrote:
>
> On Mon, Nov 23, 2020 at 04:55:26PM +0900, Bongsu Jeon wrote:
> > Since S3FWRN82 NFC Chip, The UART interface can be used.
> > S3FWRN82 supports I2C and UART interface.
> >
> > Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> > ---
> >  .../bindings/net/nfc/samsung,s3fwrn5.yaml     | 28 +++++++++++++++++--
> >  1 file changed, 26 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
> > index cb0b8a560282..37b3e5ae5681 100644
> > --- a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
> > +++ b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
> > @@ -13,6 +13,7 @@ maintainers:
> >  properties:
> >    compatible:
> >      const: samsung,s3fwrn5-i2c
> > +    const: samsung,s3fwrn82-uart
>
> This does not work, you need to use enum. Did you run at least
> dt_bindings_check?
>
Sorry. I didn't. I fixed it as below and ran dt_bindings_check.
    compatible:
       oneOf:
           - enum:
               - samsung,s3fwrn5-i2c
               - samsung,s3fwrn82


> The compatible should be just "samsung,s3fwrn82". I think it was a
> mistake in the first s3fwrn5 submission to add a interface to
> compatible.
>
Ok. I will change the name.

> >
> >    en-gpios:
> >      maxItems: 1
> > @@ -47,10 +48,19 @@ additionalProperties: false
> >  required:
> >    - compatible
> >    - en-gpios
> > -  - interrupts
> > -  - reg
> >    - wake-gpios
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: samsung,s3fwrn5-i2c
> > +    then:
> > +      required:
> > +        - interrupts
> > +        - reg
> > +
> >  examples:
> >    - |
> >      #include <dt-bindings/gpio/gpio.h>
> > @@ -71,3 +81,17 @@ examples:
> >              wake-gpios = <&gpj0 2 GPIO_ACTIVE_HIGH>;
> >          };
> >      };
> > +  # UART example on Raspberry Pi
> > +  - |
> > +    &uart0 {
> > +        status = "okay";
> > +
> > +        s3fwrn82_uart {
>
> Just "bluetooth" to follow Devicetree specification.
Sorry. I don't understand this comment.
Could you explain it?
Does it mean i need to refer to the net/broadcom-bluetooth.txt?

>
> Best regards,
> Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
