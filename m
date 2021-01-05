Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 075012EB602
	for <lists+linux-nfc@lfdr.de>; Wed,  6 Jan 2021 00:17:05 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 9C962100EB82E;
	Tue,  5 Jan 2021 15:17:03 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id F1366100EB82D
	for <linux-nfc@lists.01.org>; Tue,  5 Jan 2021 15:17:00 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id b26so2393251lff.9
        for <linux-nfc@lists.01.org>; Tue, 05 Jan 2021 15:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6kOryAJrStBd8GAF9mPMT5rzmSfnVjJiqfToohtn1oU=;
        b=eudOJPK7ZjqernYUOX/zuWLpNy3vVIIyCDJpI1RsRlZ0qOhFxbnUllEkifaNzAzLHD
         X+L8Qb52/KVm5+RCZLsUrBwCq+KIcC0IOqzm/CymYe5JF5AiBAjgVGt/dXDQYq35oqe6
         h0idE8cfBQtqTI1jaaSZfqiZ2SI4LxYFAwxh8/G2bHZ5shHUW5QZm/e6OYM+hhTzqjwR
         /ut02J0M0lhWp+0Q5psLgzudxS5dKeJMA2jjhRFflsVs9rgNGO5sBYOW+VvOuw2ijQSj
         ajaloAvwmGvRm/gVVXacxK+2RbX3vCdEjEtH6zqZEbCQyEnknBBrAuoNEokjcds9n9tr
         CrBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6kOryAJrStBd8GAF9mPMT5rzmSfnVjJiqfToohtn1oU=;
        b=sYqQGFR7z2udazKpsgcUycq/PRQ+hpcGilI1c3Ih7KB2+TvB1DF0fhqTpZSEeUqx9F
         ZZ0s+yMHgkspTog9pHHhIEg7sB2MVdwsHkFsaKcPI3TEjGxzn0m6y7g26aVJd2xJ5yzr
         a2Kr9n+XIMZCo5RoSEUCahdXh63OLFk5qChaufl7Q49NTrK1uTIIFc75apU6nh+qN4HB
         zWEo2z8l5jLWRyqSkM5YV2mGam7pOZIIhxt7td5tbJyeCdXPzuCcNEUhEBuTkmEHwPCA
         fXr0VX0Ait/EbHdK5wSSErjdn+nLRE5U7xVIMpVVPvK9z6nMjorC+FIlSUWU7Y+XzERh
         SBDw==
X-Gm-Message-State: AOAM531JjhkRSsNfxuhz5sl2tmmfSAeBQvbnPT6t6Ys22wASnRTKVZ36
	h/HmIREa+w9g57Io3EAHle48KkZ+YKM8olzGK3s=
X-Google-Smtp-Source: ABdhPJyj9xBWxuO9gc10TTdB6hsRgGfu+WRbN+uRicTApp6J2cyOkCTIM7rxnkf+sNrhbCc9gtzUy8RsrJEtsqmD/jI=
X-Received: by 2002:a2e:996:: with SMTP id 144mr754893ljj.341.1609888618513;
 Tue, 05 Jan 2021 15:16:58 -0800 (PST)
MIME-Version: 1.0
References: <20201228094507.32141-1-bongsu.jeon@samsung.com>
 <20201228131657.562606a0@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CACwDmQCVkxa6u0ZuS4Zn=9JvOXoOE8-v1ZSESO-TaS9yHc7A8A@mail.gmail.com> <20210104114842.2eccef83@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210104114842.2eccef83@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
Date: Wed, 6 Jan 2021 08:16:47 +0900
Message-ID: <CACwDmQCTj1T+25XBx8=3z=NmCtBSeHxHbUykA6r9_MwNJmJOQQ@mail.gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID-Hash: CZEK7GFNEAL6AYHTMUMLVQQD73K4QLZF
X-Message-ID-Hash: CZEK7GFNEAL6AYHTMUMLVQQD73K4QLZF
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nfc@lists.01.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next] nfc: Add a virtual nci device driver
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/CZEK7GFNEAL6AYHTMUMLVQQD73K4QLZF/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 5, 2021 at 4:48 AM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Thu, 31 Dec 2020 14:22:45 +0900 Bongsu Jeon wrote:
> > On Tue, Dec 29, 2020 at 6:16 AM Jakub Kicinski <kuba@kernel.org> wrote:
> > >
> > > On Mon, 28 Dec 2020 18:45:07 +0900 Bongsu Jeon wrote:
> > > > From: Bongsu Jeon <bongsu.jeon@samsung.com>
> > > >
> > > > A NCI virtual device can be made to simulate a NCI device in user space.
> > > > Using the virtual NCI device, The NCI module and application can be
> > > > validated. This driver supports to communicate between the virtual NCI
> > > > device and NCI module.
> > > >
> > > > Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> > >
> > > net-next is still closed:
> > >
> > > http://vger.kernel.org/~davem/net-next.html
> > >
> > > Please repost in a few days.
> > >
> > > As far as the patch goes - please include some tests for the NCI/NFC
> > > subsystem based on this virtual device, best if they live in tree under
> > > tools/testing/selftest.
> >
> > thank you for your answer.
> > I think that neard(NFC deamon) is necessary to test the NCI subsystem
> > meaningfully.
> > The NCI virtual device in user space can communicate with neard
> > through this driver.
> > Is it enough to make NCI virtual device at tools/nfc for some test?
>
> I'm not sure if I understand. Are you asking if it's okay for the test
> or have a dependency on neard?

Sorry for confusing you.
There is no dependency between neard and a NCI virtual device.
But, To test the NCI module, it is necessary to make an application like neard.
Is it okay to just make a NCI virtual device as a tool at tools/nfc
without the application?
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
