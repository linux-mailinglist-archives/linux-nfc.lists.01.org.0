Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4285925EE48
	for <lists+linux-nfc@lfdr.de>; Sun,  6 Sep 2020 16:39:15 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 7DD871396FB9F;
	Sun,  6 Sep 2020 07:39:13 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=krzk@kernel.org; receiver=<UNKNOWN> 
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id EAD721396FB9A
	for <linux-nfc@lists.01.org>; Sun,  6 Sep 2020 07:39:07 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 115412087C
	for <linux-nfc@lists.01.org>; Sun,  6 Sep 2020 14:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599403147;
	bh=7IEOIE7fQw9QHXmykxTiIVu886iDkKJ30802n3q5IwU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=etXM+rlB1+DW1J4jNFEGcm+fF67s78ieiIJMokib3gbJ/4axa/QC0n2G8dk5lqyab
	 qBGZpGxKO4g23EzVrnLE9URUV/18btbD6jd7BioxTKQiRAZiF9j5rBoO60/0+AU19R
	 QrrjUKSu0Uk6jLxywtE5Upy8feMDExtu7wnkOdM4=
Received: by mail-ej1-f45.google.com with SMTP id r7so1198869ejs.11
        for <linux-nfc@lists.01.org>; Sun, 06 Sep 2020 07:39:06 -0700 (PDT)
X-Gm-Message-State: AOAM5335uDhccet+5KyW+rAbCwxFMr6DbplZru67MwTDa+YIxOuvnXa1
	reQuM3eLXsM/jT/k88b1aSO5SH849s2wNIqu+rY=
X-Google-Smtp-Source: ABdhPJwZbjzSkmXyfdB9RtLYvattBo3H9pni7matmcNuK/Qe1S1r3L8Nqgb9OFRwyrC4kvI+4viaz1GbEG+WoE49O3Y=
X-Received: by 2002:a17:907:724f:: with SMTP id ds15mr16286701ejc.119.1599403145475;
 Sun, 06 Sep 2020 07:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200829142948.32365-1-krzk@kernel.org> <20200903163255.GA2903619@bogus>
In-Reply-To: <20200903163255.GA2903619@bogus>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 6 Sep 2020 16:38:53 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeTRNvnMijzXrpJNHKr_DLCfAWhqHmBvXsKr-Cp3XuzcQ@mail.gmail.com>
Message-ID: <CAJKOXPeTRNvnMijzXrpJNHKr_DLCfAWhqHmBvXsKr-Cp3XuzcQ@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Message-ID-Hash: G3RY356HOFUW3ZI5F2XLNOKFWQZ35WXA
X-Message-ID-Hash: G3RY356HOFUW3ZI5F2XLNOKFWQZ35WXA
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Kukjin Kim <kgene@kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-nfc@lists.01.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <snawrocki@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 1/4] dt-bindings: net: nfc: s3fwrn5: Convert to dtschema
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/G3RY356HOFUW3ZI5F2XLNOKFWQZ35WXA/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 3 Sep 2020 at 18:33, Rob Herring <robh@kernel.org> wrote:
>
> On Sat, Aug 29, 2020 at 04:29:45PM +0200, Krzysztof Kozlowski wrote:
> > Convert the Samsung S3FWRN5 NCI NFC controller bindings to dtschema.
> > This is conversion only so it includes properties with invalid prefixes
> > (s3fwrn5,en-gpios) which should be addressed later.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  .../devicetree/bindings/net/nfc/s3fwrn5.txt   | 25 --------
> >  .../devicetree/bindings/net/nfc/s3fwrn5.yaml  | 59 +++++++++++++++++++
>
> Please rename to samsung,s3fwrn5-i2c.yaml.
>
> >  MAINTAINERS                                   |  1 +
> >  3 files changed, 60 insertions(+), 25 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/net/nfc/s3fwrn5.txt
> >  create mode 100644 Documentation/devicetree/bindings/net/nfc/s3fwrn5.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/net/nfc/s3fwrn5.txt b/Documentation/devicetree/bindings/net/nfc/s3fwrn5.txt
> > deleted file mode 100644
> > index f02f6fb7f81c..000000000000
> > --- a/Documentation/devicetree/bindings/net/nfc/s3fwrn5.txt
> > +++ /dev/null
> > @@ -1,25 +0,0 @@
> > -* Samsung S3FWRN5 NCI NFC Controller
> > -
> > -Required properties:
> > -- compatible: Should be "samsung,s3fwrn5-i2c".
> > -- reg: address on the bus
> > -- interrupts: GPIO interrupt to which the chip is connected
> > -- s3fwrn5,en-gpios: Output GPIO pin used for enabling/disabling the chip
> > -- s3fwrn5,fw-gpios: Output GPIO pin used to enter firmware mode and
> > -  sleep/wakeup control
> > -
> > -Example:
> > -
> > -&hsi2c_4 {
> > -     s3fwrn5@27 {
> > -             compatible = "samsung,s3fwrn5-i2c";
> > -
> > -             reg = <0x27>;
> > -
> > -             interrupt-parent = <&gpa1>;
> > -             interrupts = <3 0 0>;
> > -
> > -             s3fwrn5,en-gpios = <&gpf1 4 0>;
> > -             s3fwrn5,fw-gpios = <&gpj0 2 0>;
> > -     };
> > -};
> > diff --git a/Documentation/devicetree/bindings/net/nfc/s3fwrn5.yaml b/Documentation/devicetree/bindings/net/nfc/s3fwrn5.yaml
> > new file mode 100644
> > index 000000000000..c22451dea350
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/nfc/s3fwrn5.yaml
> > @@ -0,0 +1,59 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/nfc/s3fwrn5.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Samsung S3FWRN5 NCI NFC Controller
> > +
> > +maintainers:
> > +  - Krzysztof Kozlowski <krzk@kernel.org>
> > +  - Krzysztof Opasiak <k.opasiak@samsung.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: samsung,s3fwrn5-i2c
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  s3fwrn5,en-gpios:
> > +    maxItems: 1
> > +    description:
> > +      Output GPIO pin used for enabling/disabling the chip
> > +
> > +  s3fwrn5,fw-gpios:
> > +    maxItems: 1
> > +    description:
> > +      Output GPIO pin used to enter firmware mode and sleep/wakeup control
> > +
> > +required:
> > +  - compatible
> > +  - interrupts
> > +  - reg
> > +  - s3fwrn5,en-gpios
> > +  - s3fwrn5,fw-gpios
>
> additionalProperties: false

Sure, I'll fix both issues.

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
