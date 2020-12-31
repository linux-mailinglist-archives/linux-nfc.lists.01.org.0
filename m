Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0CE2E7E0F
	for <lists+linux-nfc@lfdr.de>; Thu, 31 Dec 2020 06:23:01 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 5DEB8100EBBBA;
	Wed, 30 Dec 2020 21:22:59 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 6D768100EBBB4
	for <linux-nfc@lists.01.org>; Wed, 30 Dec 2020 21:22:57 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id r9so16391856ioo.7
        for <linux-nfc@lists.01.org>; Wed, 30 Dec 2020 21:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RIc44+c3YEkg/IldDEKf0sBTUdVnrPFU3OYUl/jyWMQ=;
        b=ESONkeY34QnDOUXJGNPrRPqfRE+cE7h5CX1YsyUv2MldHKKA8ZakrfIcqcwGsjJtYX
         FFE/1oHNNwpQ7O+DW5ZjsLSeSwSP1UBUBsC1Pb7OnJkS8yDl3TVFEOJW7ynl99HNN6TU
         fMnMXxD0vVTEKgK+7ZeSuiqpZLsEt2GjMHJ6aplUqeV6xnx4onafP49pBsOOu7Cym+cn
         YCv2E5NhpSk8MI7IwH76cu6QQBM1Q2U7HSlKQJyZ4HKeVypsHO8jon5AOeXkhr3EjBIq
         maaBXDPDyawGt29XGbgqgUQmmb3PeG2ejzU7d3ADNPBQ7JcyYkWh6vfV2tiwdE5p/8dV
         M1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RIc44+c3YEkg/IldDEKf0sBTUdVnrPFU3OYUl/jyWMQ=;
        b=kGeEKfC0eBUTGUk0w4ZVcttcRs9fL1qjwWZFl6/bGSxGjYvAmjzRlmpcxLCdtqxVoY
         FpJwQwfrzXFhM7JLjGy0HlgmosPydWhl2MnzmqAS95eqtnx4mbJeBax0s63UqnC1Uup1
         9442CCdlEw3xjIe4xnQw7GPwBCo1GQJm02mWqcGwzqE4l1M9UTygnGHHibjCbLxevbcH
         JESV1EMRF2li/og/3Hans8NkldgtXbaedGP6m0wr/VE7CVFJaL5Iguph2loRyWqSZ2xe
         AlfxhQmqATdWUyWClui219qjmEsGKsVdaU5FvAI7UWS/i2VVHEfgVjhFeQmwyZudHdCR
         P4tQ==
X-Gm-Message-State: AOAM532cslrZDgiKnjFbF4DUALzNz3+xVQZ3UIOBnBc/axkWKC1ofdX2
	i5rbTofymoOoPrh16HT4jGogYJ5CjyAYRolYQig=
X-Google-Smtp-Source: ABdhPJwfipLZx3LyzC+ygC3KwqfO7kYf13xkgSdzq7BNPbgGYZlRD1E2aKTFARNjoZT68sUTm7xmpmLC0yy38dn0wMw=
X-Received: by 2002:a6b:3115:: with SMTP id j21mr44671212ioa.55.1609392176219;
 Wed, 30 Dec 2020 21:22:56 -0800 (PST)
MIME-Version: 1.0
References: <20201228094507.32141-1-bongsu.jeon@samsung.com> <20201228131657.562606a0@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201228131657.562606a0@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
Date: Thu, 31 Dec 2020 14:22:45 +0900
Message-ID: <CACwDmQCVkxa6u0ZuS4Zn=9JvOXoOE8-v1ZSESO-TaS9yHc7A8A@mail.gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID-Hash: YIGZRYS5EDV6FKL5YGTJBNWZJUVTJF3W
X-Message-ID-Hash: YIGZRYS5EDV6FKL5YGTJBNWZJUVTJF3W
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nfc@lists.01.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next] nfc: Add a virtual nci device driver
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/YIGZRYS5EDV6FKL5YGTJBNWZJUVTJF3W/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 29, 2020 at 6:16 AM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Mon, 28 Dec 2020 18:45:07 +0900 Bongsu Jeon wrote:
> > From: Bongsu Jeon <bongsu.jeon@samsung.com>
> >
> > A NCI virtual device can be made to simulate a NCI device in user space.
> > Using the virtual NCI device, The NCI module and application can be
> > validated. This driver supports to communicate between the virtual NCI
> > device and NCI module.
> >
> > Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
>
> net-next is still closed:
>
> http://vger.kernel.org/~davem/net-next.html
>
> Please repost in a few days.
>
> As far as the patch goes - please include some tests for the NCI/NFC
> subsystem based on this virtual device, best if they live in tree under
> tools/testing/selftest.

thank you for your answer.
I think that neard(NFC deamon) is necessary to test the NCI subsystem
meaningfully.
The NCI virtual device in user space can communicate with neard
through this driver.
Is it enough to make NCI virtual device at tools/nfc for some test?
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
