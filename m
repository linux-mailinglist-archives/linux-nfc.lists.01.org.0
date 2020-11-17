Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF28D2B5B17
	for <lists+linux-nfc@lfdr.de>; Tue, 17 Nov 2020 09:39:14 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 22F6D100EC1F3;
	Tue, 17 Nov 2020 00:39:13 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=krzk@kernel.org; receiver=<UNKNOWN> 
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 999E8100EC1F1
	for <linux-nfc@lists.01.org>; Tue, 17 Nov 2020 00:39:10 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8552F2467A
	for <linux-nfc@lists.01.org>; Tue, 17 Nov 2020 08:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605602349;
	bh=Cy4GXcCCTrzvouUawUb+lUVg0c61NgYMg4LCDAnSajg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pcBulDDViZFjtMVmHT8AROBaOm7zOqxMnlHZUfQnkAiaWRYwukO4goGfGYrfAD/5D
	 MaP/qBQ9LcbOUjfPxBT/WYZfNC/lWwVqJUf/tt1hw4O1ryYPFlQ03LWY0kgX7k0qf3
	 wIT3jMvyh5RenR3wLOwPCGPob6idio6ltD0Rua80=
Received: by mail-ed1-f51.google.com with SMTP id m16so6683734edr.3
        for <linux-nfc@lists.01.org>; Tue, 17 Nov 2020 00:39:09 -0800 (PST)
X-Gm-Message-State: AOAM531MmYdacdLFOFZXFO1+DiGgSNvzujTLEb0kVRmDAPZeGDvOuvvl
	B+RRyIz/eyTX/8tksR+CTSHkJPnbm9KuXkG45PI=
X-Google-Smtp-Source: ABdhPJxvy7lCCxsJGnRs2AsQAgaEPb8MUllAkLTlRtx6a6g4tlOHxhV2zK5kJo+XicMxbmEMQt9ABULEMBwP46a/IFg=
X-Received: by 2002:a05:6402:31b6:: with SMTP id dj22mr20391396edb.348.1605602348036;
 Tue, 17 Nov 2020 00:39:08 -0800 (PST)
MIME-Version: 1.0
References: <CGME20201117011611epcms2p22fb0315814144e94856a96014c376a04@epcms2p2>
 <20201117011611epcms2p22fb0315814144e94856a96014c376a04@epcms2p2>
 <20201117074207.GC3436@kozik-lap> <CAEx-X7epecwBYV7UYoesQ9+Q8ir+kjYGyysiyDtCa0BzKiCGtA@mail.gmail.com>
In-Reply-To: <CAEx-X7epecwBYV7UYoesQ9+Q8ir+kjYGyysiyDtCa0BzKiCGtA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 17 Nov 2020 09:38:56 +0100
X-Gmail-Original-Message-ID: <CAJKOXPdH49zOQ2caOvDDiZPkEptYiCjUmXw+O2dCC1tKHZgPag@mail.gmail.com>
Message-ID: <CAJKOXPdH49zOQ2caOvDDiZPkEptYiCjUmXw+O2dCC1tKHZgPag@mail.gmail.com>
To: Bongsu Jeon <bs.jeon87@gmail.com>
Message-ID-Hash: XWFSX7WAORY5TFBA6N3PHXYUUWTFOGYJ
X-Message-ID-Hash: XWFSX7WAORY5TFBA6N3PHXYUUWTFOGYJ
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Bongsu Jeon <bongsu.jeon@samsung.com>, "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next v2 1/3] nfc: s3fwrn5: Remove the max_payload
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/XWFSX7WAORY5TFBA6N3PHXYUUWTFOGYJ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 17 Nov 2020 at 09:14, Bongsu Jeon <bs.jeon87@gmail.com> wrote:
>
> 2020-11-17 16:42 GMT+09:00, krzk@kernel.org <krzk@kernel.org>:
> > On Tue, Nov 17, 2020 at 10:16:11AM +0900, Bongsu Jeon wrote:
> >> max_payload is unused.
> >
> > Why did you resend the patch ignoring my review? I already provided you
> > with a tag, so you should include it.
> >
> > https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> >
> > Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> >
> > Best regards,
> > Krzysztof
> >
>
> Sorry about that. I included the tag.

You need to reduce the rate of sending new patches. You sent v1. Then
you sent again v1, which I reviewed. Then you send v2 without my
review. So I provided a review. Then you sent again a v2 with my
reviewed tags. So there are two v1 patches and two v2. Since I
provided you the review tags for v2, no need to send v2 again. It
confuses.

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
