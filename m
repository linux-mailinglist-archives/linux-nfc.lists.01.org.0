Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDEC2EE8D7
	for <lists+linux-nfc@lfdr.de>; Thu,  7 Jan 2021 23:38:44 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 27585100EAAFF;
	Thu,  7 Jan 2021 14:38:43 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B3EEF100EAAFE
	for <linux-nfc@lists.01.org>; Thu,  7 Jan 2021 14:38:40 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id n9so8379046ili.0
        for <linux-nfc@lists.01.org>; Thu, 07 Jan 2021 14:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g76BqINnxfL5FktF2QZPjibz0wQRs+oejPYTd9O0uKI=;
        b=oCDs9QSR09VDsaZxasV5ZQi3feqOMiay04zU8pdNYdCFf9UQ3bXtae5goNoXq+H79S
         9GX4wP0lzIV3a81xA5ahyspC8OfQBvO/o3BOTjbGYo7EURoxuWP+HPEbRv5k73A8Hwls
         boPONDhhfYiUKxkbXZg9xWkxt8cdzzutJue3mRcXPkdjF0Cs0fpRw1gzohQi4JPanUnL
         euOZRWKUkQtdllxLom0yLdW8agEQyv10EfdFWxxPPVhkV1VaYoC/NjwmXjFI18nEeQU4
         9cCECb8UZDYhNeM3PKS7mZnz2xmUXjCuo5+Q3qufBUAYoSS0dO2b3/+7qDXPOJpX9q6j
         54YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g76BqINnxfL5FktF2QZPjibz0wQRs+oejPYTd9O0uKI=;
        b=S+vgbn4thTWSB6TzWhrx0nUsvlmoRa8pLfdEL4cvlrB7joNo1kxlnkKeCszmVtmptc
         dGclki2OHgkpFCMhUvrjINFGoT9HRyB3WiXUXDedLlacOoPGL5+X225IT3+rRL53qDuG
         ODriWMyb9Lvq5AgVwxZruQL9gAVleg63r/mgP4x7Vsefh5/BvVvR+ZzWd44lYFXblhV/
         cIO7pDlag6w3iWNdMfT+MLSN21dsVReSC61MoSrKO4g30zKp4vM5wmTSxmDM3sYqrbUU
         MvJYioYdks9EDtRfAMnATFtuibqGhVYVP74CpS2OYbPOpuYM+moVYj2usBuj7lnONaH4
         qfOQ==
X-Gm-Message-State: AOAM533y2OiG5+eTAUHoTeu1t6jqUtFrsfzIpcnmByyUQkDG9n2KZii6
	zrjmZSmUHfOEJhQ0Qk29TqIYYK5lzTYdJIivLAs=
X-Google-Smtp-Source: ABdhPJz0cRe54eom0Jm6xNfSZA5zFZAyntyHcTcizOiimzwsJKHfdTZsaPDfqiTdjQJaKIaGWjdkMae4vy9yadvIs7k=
X-Received: by 2002:a92:8419:: with SMTP id l25mr1046154ild.100.1610059119870;
 Thu, 07 Jan 2021 14:38:39 -0800 (PST)
MIME-Version: 1.0
References: <20201228094507.32141-1-bongsu.jeon@samsung.com>
 <20201228131657.562606a0@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CACwDmQCVkxa6u0ZuS4Zn=9JvOXoOE8-v1ZSESO-TaS9yHc7A8A@mail.gmail.com>
 <20210104114842.2eccef83@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CACwDmQCTj1T+25XBx8=3z=NmCtBSeHxHbUykA6r9_MwNJmJOQQ@mail.gmail.com> <20210106090112.04ebf38f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210106090112.04ebf38f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
Date: Fri, 8 Jan 2021 07:38:29 +0900
Message-ID: <CACwDmQAKky89hBzmOR0FOy=B0HQ8-APj0MEKBFwUHtnTSWXh_w@mail.gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID-Hash: EQ6ZLDFRLNKORINKLV6PAAA6ILGDQPR4
X-Message-ID-Hash: EQ6ZLDFRLNKORINKLV6PAAA6ILGDQPR4
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nfc@lists.01.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next] nfc: Add a virtual nci device driver
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/EQ6ZLDFRLNKORINKLV6PAAA6ILGDQPR4/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 7, 2021 at 2:01 AM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Wed, 6 Jan 2021 08:16:47 +0900 Bongsu Jeon wrote:
> > On Tue, Jan 5, 2021 at 4:48 AM Jakub Kicinski <kuba@kernel.org> wrote:
> > > > thank you for your answer.
> > > > I think that neard(NFC deamon) is necessary to test the NCI subsystem
> > > > meaningfully.
> > > > The NCI virtual device in user space can communicate with neard
> > > > through this driver.
> > > > Is it enough to make NCI virtual device at tools/nfc for some test?
> > >
> > > I'm not sure if I understand. Are you asking if it's okay for the test
> > > or have a dependency on neard?
> >
> > Sorry for confusing you.
> > There is no dependency between neard and a NCI virtual device.
> > But, To test the NCI module, it is necessary to make an application like neard.
> > Is it okay to just make a NCI virtual device as a tool at tools/nfc
> > without the application?
>
> Meaning the device will be created but there will be no test cases in
> the tree?

yes.

>
> What we'd like to see is some form of a test which would exercise the
> NFC-related kernel code on such a device and can signal success /
> failure. It doesn't have to be very complex.
>
> You can build a more complex user space applications and tests
> separately.

okay. I understand it. I will try to make it.
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
