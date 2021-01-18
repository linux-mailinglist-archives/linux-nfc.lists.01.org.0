Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 950892FAC73
	for <lists+linux-nfc@lfdr.de>; Mon, 18 Jan 2021 22:19:40 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id B2BF9100EBBDA;
	Mon, 18 Jan 2021 13:19:38 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 428D0100EBBD7
	for <linux-nfc@lists.01.org>; Mon, 18 Jan 2021 13:19:36 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id m10so19685050lji.1
        for <linux-nfc@lists.01.org>; Mon, 18 Jan 2021 13:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7Gw9GWK1LY+wiC3xlS1+0EnqCUMmvekAt1MEE2u5Clg=;
        b=AT1ajz/a3PMJPAUuuNGw3hMwI7o0S4FiZc5V+xlgtrazeF1IJ/dRwjZT6aObPeajwu
         neZSMBur1kLY+oajIHHdBhAEud61L6V9Qowhyhkgv9PgThd6WO71fqWELaOYHefe1VW9
         t9HMUKJQ7v9bYRLiopX/42UsX5GcsgvKK5JeBuoA+OH+ve1UhCNHUdgg9h35zcKFkwfh
         i0nN9OIBzPgjf3qZCWMbsCirlDwPjT3VLGZnm/a9ykYgZriS9wfxyoqEySeciKPC2Osw
         zvA18FAISZsIUlD9S9J5llSsJDKSfi4DwGHfL1/OjLZ7FxIGc+xwBROUuxYBKQjqVRXc
         lCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7Gw9GWK1LY+wiC3xlS1+0EnqCUMmvekAt1MEE2u5Clg=;
        b=N15ksnB4pO+k9HGmdC4Ebym4RndQt3aOA+yxx6iHhznazkjTZQYsBH6dsk6KoeIpdY
         2bNPxyBmHiPaXpEJl9ePEc7x2mFTTwOQhgKSQ0/0hcSUYcr4G+37Mhx27x6SvXmMwejD
         wQE7ocEQ9CUsXl/fh6yfnjwWTatfG/OgDLIo98XCTjz1YVO55Pd3Gb+FygQszubnKIk3
         XSlpaBJJi2u3DKsu4QV6MAqCgbznzyIQgAK2uNFBckRR7Mg7aqrwUc+Upo2zSz0OhEwX
         0VKMFawb7zKba1dIIONxsQjKfqF4q8WW5Evn59mCjoQ7D4KpcFsBEhAcKkOO2Ea10Gvj
         kDlQ==
X-Gm-Message-State: AOAM532KK0dBIbEIhh+tX2eq5EYtEmD5UYcfS9cSZjk81KQrM6FcJkhf
	W/HS0/bN61WdW81mWP2DbPzyHyZS/kB4fX6IRJY=
X-Google-Smtp-Source: ABdhPJzACseCUIk3O93p43wtSe9U6ueEHRh/iRgAn3tf5XogTMtTUYvYgZvbcKMKYf3XErfZk3wMfaQSWQC7BToJatw=
X-Received: by 2002:a05:651c:120f:: with SMTP id i15mr583141lja.339.1611004774188;
 Mon, 18 Jan 2021 13:19:34 -0800 (PST)
MIME-Version: 1.0
References: <20210118205522.317087-1-bongsu.jeon@samsung.com> <20210118130154.256b3851@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210118130154.256b3851@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
Date: Tue, 19 Jan 2021 06:19:23 +0900
Message-ID: <CACwDmQDxa6WKq4UwCfk2sxC8JukV+CcnuSqrCdhSWSjJ9ppwOg@mail.gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID-Hash: VLYDIGZNMS733FPBWVD75IQEEAZ3HSEI
X-Message-ID-Hash: VLYDIGZNMS733FPBWVD75IQEEAZ3HSEI
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nfc@lists.01.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net] net: nfc: nci: fix the wrong NCI_CORE_INIT parameters
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/VLYDIGZNMS733FPBWVD75IQEEAZ3HSEI/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 19, 2021 at 6:01 AM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Tue, 19 Jan 2021 05:55:22 +0900 Bongsu Jeon wrote:
> > From: Bongsu Jeon <bongsu.jeon@samsung.com>
> >
> > Fix the code because NCI_CORE_INIT_CMD includes two parameters in NCI2.0
> > but there is no parameters in NCI1.x.
> >
> > Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
>
> What's the Fixes tag for this change?
Sorry to miss the Fixes tag.
This is the Fixes tag ( Fixes: bcd684aace34 ("net/nfc/nci: Support NCI
2.x initial sequence") )
Could I resend this patch after adding that tag?
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
