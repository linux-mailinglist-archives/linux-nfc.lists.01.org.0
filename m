Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCC02CACFB
	for <lists+linux-nfc@lfdr.de>; Tue,  1 Dec 2020 21:07:34 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E8DDA100EC1F7;
	Tue,  1 Dec 2020 12:07:32 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.66; helo=mail-ej1-f66.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 20F83100EC1F6
	for <linux-nfc@lists.01.org>; Tue,  1 Dec 2020 12:07:30 -0800 (PST)
Received: by mail-ej1-f66.google.com with SMTP id bo9so6796589ejb.13
        for <linux-nfc@lists.01.org>; Tue, 01 Dec 2020 12:07:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o8OpMIpKsvTP+ao76T3f62qpT21Ac6Cs3TQoq3094Zc=;
        b=J8ozhrO3FV1QmOK9X7H9ChRyaTT2N+0upURdGsuJS7GWOYSUJmX5HijKf2WACUIK9v
         JZfgvj3r5HqERcrb9C4fLcHZMFBK3M6iD3ihg4hYEfjxB69/4IgTXfcoOj3JaokkLgS9
         FwYNgyTtll8KXtGNWjipTEvZceoz8n6bqqILqq465nMd9z+iQ44np3i1rcmLemtuUvsJ
         xTqe7jxh/zVL+xPwzBK4DXYGpJnhshjBm4XfNuxyiDKiYvIkz3hrpbCpewPTIXgMGmoP
         +u/6G42eERugx7jwww2qToG30cBbcjrBJ6+a+6WqsolJnbPT0JkX7/M6TQexdrfVVXKt
         dGmw==
X-Gm-Message-State: AOAM530Bjassxzm/8ylAJwktasC6aMe8DpE2nwuUYf9bQhIMLxzVA6pO
	COy/T1yrsB0LLZswCAslrqs=
X-Google-Smtp-Source: ABdhPJza6eg+oPJXQ5ReF6xIUHNqwcfSXWPMj952gZlGgpNUU+Gspt9SH0D1dl7xx52uuqb0E4/0BQ==
X-Received: by 2002:a17:906:c0d1:: with SMTP id bn17mr5003733ejb.114.1606853248214;
        Tue, 01 Dec 2020 12:07:28 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id s15sm391164edj.75.2020.12.01.12.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 12:07:27 -0800 (PST)
Date: Tue, 1 Dec 2020 22:07:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon2@gmail.com>
Message-ID: <20201201200725.GB2435@kozik-lap>
References: <1606830628-10236-1-git-send-email-bongsu.jeon@samsung.com>
 <1606830628-10236-2-git-send-email-bongsu.jeon@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606830628-10236-2-git-send-email-bongsu.jeon@samsung.com>
Message-ID-Hash: DM5JD5TFGT3HVR77RHY35TF25NC3KGND
X-Message-ID-Hash: DM5JD5TFGT3HVR77RHY35TF25NC3KGND
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v4 net-next 1/4] dt-bindings: net: nfc: s3fwrn5: Support a UART interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/DM5JD5TFGT3HVR77RHY35TF25NC3KGND/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 01, 2020 at 10:50:25PM +0900, Bongsu Jeon wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> 
> Since S3FWRN82 NFC Chip, The UART interface can be used.
> S3FWRN82 supports I2C and UART interface.
> 
> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  .../bindings/net/nfc/samsung,s3fwrn5.yaml          | 32 ++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
> index cb0b8a5..cc5f9a1 100644
> --- a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
> +++ b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
> @@ -12,7 +12,10 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: samsung,s3fwrn5-i2c
> +    items:

This still has items but it should be a simple enum.

> +      - enum:
> +          - samsung,s3fwrn5-i2c
> +          - samsung,s3fwrn82
>  
>    en-gpios:
>      maxItems: 1
> @@ -47,10 +50,19 @@ additionalProperties: false
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
> @@ -71,3 +83,17 @@ examples:
>              wake-gpios = <&gpj0 2 GPIO_ACTIVE_HIGH>;
>          };
>      };
> +  # UART example on Raspberry Pi
> +  - |
> +    uart0 {
> +        status = "okay";
> +
> +        nfc {
> +            compatible = "samsung,s3fwrn82";
> +
> +            en-gpios = <&gpio 20 0>;
> +            wake-gpios = <&gpio 16 0>;

Use GPIO flags like in example above.

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
