Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 905A94280D8
	for <lists+linux-nfc@lfdr.de>; Sun, 10 Oct 2021 13:37:18 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id EA656100EAB48;
	Sun, 10 Oct 2021 04:37:15 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id EBFD8100EAB47
	for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 04:37:13 -0700 (PDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 424103FFF0
	for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 11:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633865831;
	bh=3aL2g6ASYJjmJXLGE2td/GKebrEEfp5cYtOVSOPNOjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=RatrrUBM0raRQ9o99r5tsntg+AojFT1r+xlDCozpBhnbeWwHh6dk7sgiyeQB9p+RE
	 F59A+Xo4Ee9pOJmWnm3ldFzK4rfdF6v2caoSjSGBIiUirB7bre4wavbvdpLL2lNYLr
	 Chh5/Rxlm69N9QlHACBT6HdzaD2mn9DIEBII/Wcg4Tuct28Wzj+iIh3kFFaM4dy1LW
	 v+Uuuc1RrPCbNJJM5cKsH0oze/RWEq/unwQZPWYu3wHr0tbbOVqBALC/EpGVPJHxiS
	 vqIO4SjkN5UKXgXwUofVPt584F+DJ3b/qZwkaNqGq4A6hWHucYrrTomxfXXT6o7PpD
	 HSVtr0I3G9IhA==
Received: by mail-ed1-f72.google.com with SMTP id r11-20020aa7cfcb000000b003d4fbd652b9so11215416edy.14
        for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 04:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3aL2g6ASYJjmJXLGE2td/GKebrEEfp5cYtOVSOPNOjE=;
        b=G1KmAeUlMQuh1ZH6dWizunFSs7BoyWjoI56dMmL3QcC0rxp5TAqqR1tx1cWVA3bbZ5
         cjRM5kyh7DYOyksiXSNYEO+rbDdpTEOed2vlt5pI6N65DioK8ZRRZnuRINMamnRvubF/
         PkFRAZIdQ6h9AyIZxupHuQhmbYaRbtMGWn+VFwl/nCJRsFi8wxyyPZUtxkZH6+VN071c
         Z2y7k68T1AIoxXR3zgrF7hwW9VrXZ6hBa2/YUbrLQp8rVI/ZpQ2f+TJo5MnmJlvm+ydf
         PdvdeX31an5l6/04Coe6gkxPx3GGwT2Ka6vT0f3LPJ/cnH2sCLs1bAVx6y7mhs4b47Gn
         39zQ==
X-Gm-Message-State: AOAM533EgqVF7txP4xcE1wd45vzjF2mFNtE9O3Hl00aRwxMgvo2r+v23
	SX3Jq7obLLmXqNn1y60BcNZ9xnJnbDQf0eSsVkRd7+sQbX8VuZGVXHoN2QI/trIGzVGhRvh5a1F
	zzC6f6g5uEWtIthOm0z2xDvTetp6qWF1TBYhts97ABneOxAJpMA==
X-Received: by 2002:a17:906:919:: with SMTP id i25mr17554110ejd.171.1633865830569;
        Sun, 10 Oct 2021 04:37:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmGfXRax8w6ByvvioynebBatQTyi+KnMs4IdARMtMQVkKFfh4370Xu091DRaFkuwupjNT9l7lw+PWQutb8gQQ=
X-Received: by 2002:a17:906:919:: with SMTP id i25mr17554102ejd.171.1633865830425;
 Sun, 10 Oct 2021 04:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211007133021.32704-1-krzysztof.kozlowski@canonical.com>
 <20211008.111646.1874039740182175606.davem@davemloft.net> <CA+Eumj5k9K9DUsPifDchNixj0QG5WrTJX+dzADmAgYSFe49+4g@mail.gmail.com>
In-Reply-To: <CA+Eumj5k9K9DUsPifDchNixj0QG5WrTJX+dzADmAgYSFe49+4g@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date: Sun, 10 Oct 2021 13:36:59 +0200
Message-ID: <CA+Eumj65krM_LhEgbBe2hxAZhYZLmuo3zMoVcq6zp9xKa+n_Jg@mail.gmail.com>
To: David Miller <davem@davemloft.net>
Message-ID-Hash: 3LQOMCFU422WWJWGF7DXUZIEFAKVF6YC
X-Message-ID-Hash: 3LQOMCFU422WWJWGF7DXUZIEFAKVF6YC
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: kuba@kernel.org, linux-nfc@lists.01.org, netdev@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-wireless@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [RESEND PATCH v2 0/7] nfc: minor printk cleanup
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/3LQOMCFU422WWJWGF7DXUZIEFAKVF6YC/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 8 Oct 2021 at 12:18, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On Fri, 8 Oct 2021 at 12:17, David Miller <davem@davemloft.net> wrote:
> >
> > From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > Date: Thu,  7 Oct 2021 15:30:14 +0200
> >
> > > Hi,
> > >
> > > This is a rebase and resend of v2. No other changes.
> > >
> > > Changes since v1:
> > > 1. Remove unused variable in pn533 (reported by kbuild).
> >
> > Please CC: netdev for nfc patches otherwise they will not get tracked
> > and applied.
>
> netdev@vger.kernel.org is here. Which address I missed?

The patchset reached patchwork:
https://patchwork.kernel.org/project/netdevbpf/list/?series=559153&state=*
although for some reason it is marked as "changes requested". Are
there any other changes needed except Joe's comment for one patch?

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
