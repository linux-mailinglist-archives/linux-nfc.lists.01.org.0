Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 231A82C00F6
	for <lists+linux-nfc@lfdr.de>; Mon, 23 Nov 2020 09:01:31 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id D4E18100EC1CC;
	Mon, 23 Nov 2020 00:01:29 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.67; helo=mail-ej1-f67.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id DEE05100EC1C8
	for <linux-nfc@lists.01.org>; Mon, 23 Nov 2020 00:01:27 -0800 (PST)
Received: by mail-ej1-f67.google.com with SMTP id o9so21996133ejg.1
        for <linux-nfc@lists.01.org>; Mon, 23 Nov 2020 00:01:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NclaCJHXiBfJ0Rpl5FSpxC/w5EINjItcyb1F1x5YFWQ=;
        b=uR0iUca6bSXnQiOQhvqkjHXgc29nsGBHHLsxXNS5urtzjlD/68LVjK3o1PD1H8tM4A
         g9N+Cmy5oFOYBshjgtJCEEao5yIgcHbwYcryVdF2MpATQL6eCiW6i7ENHeaUABkTEaXE
         XwpNZiUaPYBp2o/rPGRwn7EIszA0OYhPG2gRo7i3xvXm3/P22v5X/zvNTkPvfcAt7r/M
         2X2lgl5+vzqvsHDdIFZAJkF61pbDv2Z1MtkUxaCPOxHRjINid4CawjbNjv8wVY5qHS22
         NOV/MRhbSvOucVOllbGTentRGrqRGxPPFEphVhT0JaFzAucrSOkC8AbCTTjxZdkJYAt/
         3jNA==
X-Gm-Message-State: AOAM5313R29n9u8CgT8CdPrxoGBY+PE7lM3zl136Z/m7Y0qSTRN/tWAr
	QikRLtYphX0tP0X2QL8+svQ=
X-Google-Smtp-Source: ABdhPJxsrf7uRQesS+TQY5uPAJFd1MmlLT1cbPz+Ppl65azwyzxj2pEdLkjsnapnixfNYkjMu0oeVg==
X-Received: by 2002:a17:906:831a:: with SMTP id j26mr43630906ejx.450.1606118486218;
        Mon, 23 Nov 2020 00:01:26 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id y12sm4453869ejj.95.2020.11.23.00.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 00:01:25 -0800 (PST)
Date: Mon, 23 Nov 2020 09:01:23 +0100
From: "krzk@kernel.org" <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon@samsung.com>
Message-ID: <20201123080123.GA5656@kozik-lap>
References: <CGME20201123075526epcms2p59410a8ba942f8942f53a593d9df764d0@epcms2p5>
 <20201123075526epcms2p59410a8ba942f8942f53a593d9df764d0@epcms2p5>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201123075526epcms2p59410a8ba942f8942f53a593d9df764d0@epcms2p5>
Message-ID-Hash: J4LWCZLQ255A6KJ3WG544V2G5KGVO2AZ
X-Message-ID-Hash: J4LWCZLQ255A6KJ3WG544V2G5KGVO2AZ
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: "kuba@kernel.org" <kuba@kernel.org>, "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next 1/2] dt-bindings: net: nfc: s3fwrn5: Support a UART interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/J4LWCZLQ255A6KJ3WG544V2G5KGVO2AZ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 23, 2020 at 04:55:26PM +0900, Bongsu Jeon wrote:
> Since S3FWRN82 NFC Chip, The UART interface can be used.
> S3FWRN82 supports I2C and UART interface.
> 
> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  .../bindings/net/nfc/samsung,s3fwrn5.yaml     | 28 +++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
> index cb0b8a560282..37b3e5ae5681 100644
> --- a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
> +++ b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
> @@ -13,6 +13,7 @@ maintainers:
>  properties:
>    compatible:
>      const: samsung,s3fwrn5-i2c
> +    const: samsung,s3fwrn82-uart

This does not work, you need to use enum. Did you run at least
dt_bindings_check?

The compatible should be just "samsung,s3fwrn82". I think it was a
mistake in the first s3fwrn5 submission to add a interface to
compatible.

>  
>    en-gpios:
>      maxItems: 1
> @@ -47,10 +48,19 @@ additionalProperties: false
>  required:
>    - compatible
>    - en-gpios
> -  - interrupts
> -  - reg
>    - wake-gpios
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,s3fwrn5-i2c
> +    then:
> +      required:
> +        - interrupts
> +        - reg
> +
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> @@ -71,3 +81,17 @@ examples:
>              wake-gpios = <&gpj0 2 GPIO_ACTIVE_HIGH>;
>          };
>      };
> +  # UART example on Raspberry Pi
> +  - |
> +    &uart0 {
> +        status = "okay";
> +
> +        s3fwrn82_uart {

Just "bluetooth" to follow Devicetree specification.

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
