Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2224138AC8A
	for <lists+linux-nfc@lfdr.de>; Thu, 20 May 2021 13:40:49 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 40E27100ED4A4;
	Thu, 20 May 2021 04:40:46 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 7FDB9100EF26A
	for <linux-nfc@lists.01.org>; Thu, 20 May 2021 04:40:43 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id c15so19297684ljr.7
        for <linux-nfc@lists.01.org>; Thu, 20 May 2021 04:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W1iYG6kbUe5nK7eqeY/6xIuOqZtwvfU9nh1Ly+2R88I=;
        b=TY+Kgu8IT5hYJYaCLKDo15fgh4ixBEDL3dujMvPydRe9zNoPlRgZX64Sg5tlztCI2R
         bzUtAdfZ9vmrjpTBVyWjAfJ9oDMqD0CZc2nFSgjD9Zsp9dTRKzICUb78Vb0rV7W5LAQy
         qkHM4sDzE8sX4NJXgQprKC6Rslty5W7ykWZNPLMSaTDTOKNX7cOny9o8QeUBW0KTvijk
         L2rI7W/t+ki6/18dSx0wwJC/P427aAw7z3wahSpWyfbEqfP4UnIdqO4qXCi2pqlkbvyG
         SZhDD757sTMYKwhUV/sSWa9zVIoFlLj8QPCfL0ctY5SgxdRHRGYofd6qYO62ka2se85U
         elHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W1iYG6kbUe5nK7eqeY/6xIuOqZtwvfU9nh1Ly+2R88I=;
        b=BFXaK+SOt/NEHUNZA/jSbcLwTG4r0wxO5r90yW/A4gUzihoWY8EsvGZbcee6eCo9wi
         hOjDzXv6qggmJmDOW8mAcwNHGfvVQjbRPniZRy9mr88UYPZ8Ty52QPQkrgRmEpObylkT
         yT58X7tMwtVXypKTdtqDxRPLG5/WwBtxQnlAbo81IWsqU6eyJkSXoGGZpG+l+74VJLbN
         YAroyMii2L+jvEIIDifEwvckG5U54xI6R7kkJMNWM3Qc/nIv1remaIGUwy3PkDlzF6qW
         NTgi7HySAeaC/j+iYqUfUPWOWPZUC7uJbWN1d9ctABB0xcrQ6uH5/uOK+JUhKuiqi8so
         H4Lw==
X-Gm-Message-State: AOAM532YH3Qot9+8MblqWQNrghTlAiFKbIphV/OZsI990jYH6jnnnAP4
	6r2xD1lGuQQNfTm1ffvrRZITXsVcC+L58D83QDA=
X-Google-Smtp-Source: ABdhPJzgyIseVFaqkWWbLmI5/gM92T66y1xoOEKZghJ6yA9kN/FuKODImcvFV0Oc9AsPjwENSYgHtzmFfhY+Z5mLIEw=
X-Received: by 2002:a2e:b819:: with SMTP id u25mr2701365ljo.182.1621510840603;
 Thu, 20 May 2021 04:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210518133935.571298-1-stephan@gerhold.net> <20210518133935.571298-2-stephan@gerhold.net>
 <ac04821e-359d-aaaa-7e07-280156f64036@canonical.com> <YKPWgSnz7STV4u+c@gerhold.net>
 <8b14159f-dca9-a213-031f-83ab2b3840a4@canonical.com> <YKTHXzUhcYa5YJIs@gerhold.net>
 <10b3a50e-877c-d5b1-3e35-e5dff4ef53d8@canonical.com>
In-Reply-To: <10b3a50e-877c-d5b1-3e35-e5dff4ef53d8@canonical.com>
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
Date: Thu, 20 May 2021 20:40:29 +0900
Message-ID: <CACwDmQCQQpLKeaRxfxXYqSty3YhpZ9y7LNxgkKCBQ=YJiAk1cg@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID-Hash: BWYICNKJQAZZA7QZXEV7N4PFAIULXE2Y
X-Message-ID-Hash: BWYICNKJQAZZA7QZXEV7N4PFAIULXE2Y
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Stephan Gerhold <stephan@gerhold.net>, Bongsu Jeon <bongsu.jeon@samsung.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-nfc@lists.01.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 2/2] nfc: s3fwrn5: i2c: Enable optional clock from device tree
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/BWYICNKJQAZZA7QZXEV7N4PFAIULXE2Y/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 20, 2021 at 12:58 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 19/05/2021 04:07, Stephan Gerhold wrote:
> > On Tue, May 18, 2021 at 11:25:55AM -0400, Krzysztof Kozlowski wrote:
> >> On 18/05/2021 11:00, Stephan Gerhold wrote:
> >>> On Tue, May 18, 2021 at 10:30:43AM -0400, Krzysztof Kozlowski wrote:
> >>>> On 18/05/2021 09:39, Stephan Gerhold wrote:
> >>>>> s3fwrn5 has a NFC_CLK_REQ output GPIO, which is asserted whenever
> >>>>> the clock is needed for the current operation. This GPIO can be either
> >>>>> connected directly to the clock provider, or must be monitored by
> >>>>> this driver.
> >>>>>
> >>>>> As an example for the first case, on many Qualcomm devices the
> >>>>> NFC clock is provided by the main PMIC. The clock can be either
> >>>>> permanently enabled (clocks = <&rpmcc RPM_SMD_BB_CLK2>) or enabled
> >>>>> only when requested through a special input pin on the PMIC
> >>>>> (clocks = <&rpmcc RPM_SMD_BB_CLK2_PIN>).
> >>>>>
> >>>>> On the Samsung Galaxy A3/A5 (2015, Qualcomm MSM8916) this mechanism
> >>>>> is used with S3FWRN5's NFC_CLK_REQ output GPIO to enable the clock
> >>>>> only when necessary. However, to make that work the s3fwrn5 driver
> >>>>> must keep the RPM_SMD_BB_CLK2_PIN clock enabled.
> >>>>
> >>>> This contradicts the code. You wrote that pin should be kept enabled
> >>>> (somehow... by driver? by it's firmware?) but your code requests the
> >>>> clock from provider.
> >>>>
> >>>
> >>> Yeah, I see how that's a bit confusing. Let me try to explain it a bit
> >>> better. So the Samsung Galaxy A5 (2015) has a "S3FWRN5XS1-YF30", some
> >>> variant of S3FWRN5 I guess. That S3FWRN5 has a "XI" and "XO" pin in the
> >>> schematics. "XO" seems to be floating, but "XI" goes to "BB_CLK2"
> >>> on PM8916 (the main PMIC).
> >>>
> >>> Then, there is "GPIO2/NFC_CLK_REQ" on the S3FWRN5. This goes to
> >>> GPIO_2_NFC_CLK_REQ on PM8916. (Note: I'm talking about two different
> >>> GPIO2 here, one on S3FWRN5 and one on PM8916, they just happen to have
> >>> the same number...)
> >>>
> >>> So in other words, S3FWRN5 gets some clock from BB_CLK2 on PM8916,
> >>> and can tell PM8916 that it needs the clock via GPIO2/NFC_CLK_REQ.
> >>>
> >>> Now the confusing part is that the rpmcc/clk-smd-rpm driver has two
> >>> clocks that represent BB_CLK2 (see include/dt-bindings/clock/qcom,rpmcc.h):
> >>>
> >>>   - RPM_SMD_BB_CLK2
> >>>   - RPM_SMD_BB_CLK2_PIN
> >>>
> >>> (There are also *_CLK2_A variants but they are even more confusing
> >>>  and not needed here...)
> >>>
> >>> Those end up in different register settings in PM8916. There is one bit
> >>> to permanently enable BB_CLK2 (= RPM_SMD_BB_CLK2), and one bit to enable
> >>> BB_CLK2 based on the status of GPIO_2_NFC_CLK_REQ on PM8916
> >>> (= RPM_SMD_BB_CLK2_PIN).
> >>>
> >>> So there is indeed some kind of "AND" inside PM8916 (the register bit
> >>> and "NFC_CLK_REQ" input pin). To make that "AND" work I need to make
> >>> some driver (here: the s3fwrn5 driver) enable the clock so the register
> >>> bit in PM8916 gets set.
> >>
> >> Thanks for the explanation, it sounds good. The GPIO2 (or how you call
> >> it NFC_CLK_REQ) on S3FWRN5 looks like non-configurable from Linux point
> >> of view. Probably the device firmware plays with it always or at least
> >> handles it in an unknown way for us.
> >>
> >
> > FWIW, I was looking at some more s3fwrn5 code yesterday and came
> > across this (in s3fwrn5_nci_rf_configure()):
> >
> >       /* Set default clock configuration for external crystal */
> >       fw_cfg.clk_type = 0x01;
> >       fw_cfg.clk_speed = 0xff;
> >       fw_cfg.clk_req = 0xff;
> >       ret = nci_prop_cmd(info->ndev, NCI_PROP_FW_CFG,
> >               sizeof(fw_cfg), (__u8 *)&fw_cfg);
> >       if (ret < 0)
> >               goto out;
> >
> > It does look quite suspiciously like that configures how s3fwrn5 expects
> > the clock and possibly (fw_cfg.clk_req?) how GPIO2 behaves. But it's not
> > particularly useful without some documentation for the magic numbers.
>
> Right, without documentation of FW protocol there is not much we can
> deduct here. There is no proof even that the comment matches actual code.
>
> Dear Bongsu,
> Maybe you could share some details about clock selection?

These configuration values depend on the HW circuit for NFC.

There are  two types of fw_cfg.clk_type for N5.
0x01 : external XTAL ( don't need to control the clock because XTAL
always supplies
the NFC clock automatically.)
0x00 : PLL clock (need to control clock. )

There are three types of fw_cfg.clk_speed for N5.
0xFF : for external XTAL
0x00 : 24M for PLL.
0x01 : 19.12M for PLL.

There are two types of fw_cfg.clk_req for N5.
0xFF: NFC firmware controls CLK Req when NFC needs the external clock.
0xF0: NFC firmware doesn't control CLK Req.

>
> >
> > Personally, I just skip all firmware/RF configuration (which works thanks
> > to commit 4fb7b98c7be3 ("nfc: s3fwrn5: skip the NFC bootloader mode")).
> > That way, S3FWRN5 just continues using the proper configuration
> > that was loaded by the vendor drivers at some point. :)
>
> But isn't that configuration lost after power off?
>

If you skip all firmware/RF configuration, you can use  the preserved
firmware and
RF configuration on the chip.

>
> Best regards,
> Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
