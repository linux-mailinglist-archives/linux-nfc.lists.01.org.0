Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 302EE3EB221
	for <lists+linux-nfc@lfdr.de>; Fri, 13 Aug 2021 10:02:45 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 6C291100EBB61;
	Fri, 13 Aug 2021 01:02:39 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=ricardo.ribalda@gmail.com; receiver=<UNKNOWN> 
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 0961A100EBBCE
	for <linux-nfc@lists.01.org>; Fri, 13 Aug 2021 01:02:35 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id f3so10860228plg.3
        for <linux-nfc@lists.01.org>; Fri, 13 Aug 2021 01:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EjKqOZVUZ2jVaKTQKPscMwFqRGxOYt3snCKNzAcUiOQ=;
        b=LHKrwzvvUzxFBtV8Nxf79q871FniW3zVeqdkYFtVUMy7aAR3c/HfTz+rvtXHHgWXNR
         oCwd5z1Mg2iqBj8IqeOEySFRKb+trgOH8WBuy7SrE4Y0FlgvPm197Z6DOZ+TodoF22hb
         l4fMPCb5u9sjqPsqgwYZUJ5xiYrGIOug1Nn0dnG9QrJrr1f057m5MkOeJB1EnBUEu3WL
         KfYsnmN3j44AQGWZm1p1ACfjIaWsJQQ1FIt4NX+YOk/HulOpCIw0wXj8zKG1QA1RHDd1
         vdYpFs/dIu6F7IATjzpHFlog6r639klhjnArV1S9T/l4/QVJYynlArKU6v0VpkQrmkam
         0oGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EjKqOZVUZ2jVaKTQKPscMwFqRGxOYt3snCKNzAcUiOQ=;
        b=JhgC4jlQMsNkoh468L/MNsHTPJJbGiTn72wzij1j1QazTOYyLWS3HljzlS4M7ZA7IY
         b7kCmhekTTkSLI2rTq9WvWDpsmXPu9GDm5RHvP/Ix3aFmQYbzh0phZk9yG5P6/Q+E8pd
         ybGM1kea6Fg4ju03b+FtXVBn0BahtzOu4bJ+fab+5+smS1HbBLYdmP0nYT3zeLCMRDWp
         g4rlJQiLzK7ILU95fgcUmA4nsEJkPEZaDPQk2jkVgDT5toJrAPRFYr8xXThCTVMCV9eK
         pvk2vTgMR5R9/T/Q1b40v3NqONS5iPgc887DeddiB9sO5+nCnXV0CDRoODtFU7GNNR8a
         l4tQ==
X-Gm-Message-State: AOAM5326/fma6TXYY15Uof+v3zfxGcrFcVVwBqoHn4tPjMd3bBg4KtfF
	gncTKkj2cdNQYh2+Miqkev0/+ZukBZKRRCMjeOU=
X-Google-Smtp-Source: ABdhPJz3x5XrXn4MFmlKbI54scbHA/4HCJOif4+2Y5c/dq80Cz+xPUoyHrKzGqnqVqyyYAkf7bRpkkJPQYI2Br6XBBE=
X-Received: by 2002:a17:90b:1950:: with SMTP id nk16mr1407684pjb.11.1628841755490;
 Fri, 13 Aug 2021 01:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20180917094856.5961-1-ricardo.ribalda@gmail.com>
 <20180917233752.GA12491@animalcreek.com> <CAPybu_2=rY5g0MNNoztBZQQhbteXxgG7RdrgQAWT6HkaKvp8sA@mail.gmail.com>
 <20180919170359.GA16132@animalcreek.com> <20180921032904.GA19759@animalcreek.com>
 <20210808013830.GD124928@animalcreek.com>
In-Reply-To: <20210808013830.GD124928@animalcreek.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 13 Aug 2021 10:02:19 +0200
Message-ID: <CAPybu_2tXU9w_dF_nGaD2j9pnri94FNN5ceELkS44S2YwCwhgA@mail.gmail.com>
To: Mark Greer <mgreer@animalcreek.com>
Message-ID-Hash: KNQSQD4KWJSSVSZXLHVH3XBVH6ANVFIR
X-Message-ID-Hash: KNQSQD4KWJSSVSZXLHVH3XBVH6ANVFIR
X-MailFrom: ricardo.ribalda@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] ndef: Only register interface for known records
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/KNQSQD4KWJSSVSZXLHVH3XBVH6ANVFIR/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Absolutely no worries.

Thanks for your work Mark :)

On Sun, Aug 8, 2021 at 3:38 AM Mark Greer <mgreer@animalcreek.com> wrote:
>
> On Thu, Sep 20, 2018 at 08:29:04PM -0700, Mark Greer wrote:
> > On Wed, Sep 19, 2018 at 10:03:59AM -0700, Mark Greer wrote:
> >
> > > Thanks for the data.  I'll decipher it later today.
> >
> > Hi Ricardo.  I sort of got hit with some stuff so it may be a few days.
> >
> > Sorry for the delay.
>
> Well, a few days turned into a few years but it is in there now.
> Thanks for your patience Ricardo.
>
> Applied.
>
> Mark
> --



-- 
Ricardo Ribalda
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
