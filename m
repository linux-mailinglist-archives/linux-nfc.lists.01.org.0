Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB2FF180E
	for <lists+linux-nfc@lfdr.de>; Wed,  6 Nov 2019 15:13:47 +0100 (CET)
Received: from new-ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 99756100DC3D9;
	Wed,  6 Nov 2019 06:16:20 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::142; helo=mail-lf1-x142.google.com; envelope-from=ricardo.ribalda@gmail.com; receiver=<UNKNOWN> 
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id D88FA100DC3D8
	for <linux-nfc@lists.01.org>; Wed,  6 Nov 2019 06:16:18 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id q28so18200945lfa.5
        for <linux-nfc@lists.01.org>; Wed, 06 Nov 2019 06:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Alp+JLTZd5OyDY1Z8iVVqUn+gj5ktWJ54qfoarW2ocI=;
        b=Xt1r0h/ifWEc37CHNqsYomhaKTC3joRmRWjC9oGEDiSbJLgv3at/klX2ypE64lpY/C
         0NuxMSNKwggqU4fLj4nniVvg1qfmOawkC8qHrqgsVKeEdPCRsz654Ow0WMC44VnLIA4F
         2DjAd2UFJFPUEgD6ovIvwvW0wmzNzhgoGi6wqsLHVbw+OePmh7mHPDXiySMhIb9d3Mbe
         8XnfRoWEzuoPxVks8qsArPS7C8vLdsGtv7aBLQ4SgWQjwoLq+Xlw3Er+mr4Ha8IkMdnD
         NKJ7uNY/CYsXy7tm9zFoyFosxwgxuXiwl+wrkAf7o3eV7RiqgVATyUfMaka2SNWFb+Tk
         9ktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Alp+JLTZd5OyDY1Z8iVVqUn+gj5ktWJ54qfoarW2ocI=;
        b=EzCRUoOIyWsAquC4qSm35eyzzEVBMBOX98Hb5SgH3FonlN+4uwU3q669vik5z/82iS
         1ZVLEQTN12SVMOTrO42/UocL2esQTddBsRjNp6vupT6sZ7l5lf8b/xCArIAqEamyFGfV
         bgTKym2hCWsthEtZB542TsJtAlTcdg7XaeOlCXLY0lU/y071D6O4fLyh2CREbcQ9RcEv
         RbDQXKQRDExpluDO8S82cjpZVlH5DlX38hJ/SCI9Z5IqE30tCrNOMJ2iMHJtgoq7bP7J
         hNALfontIN940IsgFE4+j+aGDTcjSb9fzVIWi0Jm4pCVnkgb5yzHhfBF6yHwk1/q5xmp
         UaPg==
X-Gm-Message-State: APjAAAVIwsc17LZii9Lc7tM3Tp+TCrXnP69cVR3G8vDJSzLpHOvZWVpZ
	XCkcEx0BD4U1xXWBtrfDq8HRY9R93Xn9IhylF9M=
X-Google-Smtp-Source: APXvYqwmEQ26z51XnNX2CadY3aTa3XoENoDjFM9RhUFy6z4UXkNUz57poORhYjnyke5YKiXd9ZrvfjDDYn56pe6pD+Y=
X-Received: by 2002:a19:c514:: with SMTP id w20mr24897471lfe.143.1573049622353;
 Wed, 06 Nov 2019 06:13:42 -0800 (PST)
MIME-Version: 1.0
References: <CAPybu_2=rY5g0MNNoztBZQQhbteXxgG7RdrgQAWT6HkaKvp8sA@mail.gmail.com>
 <20180918061952.14335-1-ricardo.ribalda@gmail.com> <20180930233513.GA16410@animalcreek.com>
In-Reply-To: <20180930233513.GA16410@animalcreek.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 6 Nov 2019 15:13:26 +0100
Message-ID: <CAPybu_297JGrQ1WtG7D277MnhVMboYHSTV_KBNCsjA6uJab4RA@mail.gmail.com>
To: Mark Greer <mgreer@animalcreek.com>
Message-ID-Hash: WHAYJHP5WVY5KCAAVUFC565RZC7PGT5R
X-Message-ID-Hash: WHAYJHP5WVY5KCAAVUFC565RZC7PGT5R
X-MailFrom: ricardo.ribalda@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2] ndef: Only register interface for known records
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/WHAYJHP5WVY5KCAAVUFC565RZC7PGT5R/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

This is just my yearly ping to check if it has been merged ;)

Best regards

On Mon, Oct 1, 2018 at 1:35 AM Mark Greer <mgreer@animalcreek.com> wrote:
>
> On Tue, Sep 18, 2018 at 08:19:52AM +0200, Ricardo Ribalda Delgado wrote:
> > If we register the interface for unknown/error records neard daemon will
> > crash with no useful output message.
> > https://lists.01.org/pipermail/linux-nfc/2018-September/004445.html
> >
> > ...
> > neard[2404]: src/ndef.c:aar_exists() No AAR
> > neard[2404]: src/ndef.c:mime_payload_exists() No MIME payload
> > neard[2404]: D-Bus disconnect
> > neard[2404]: D-Bus disconnect (BT)
> > ...
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > ---
>
> FWIW,
>
> Reviewed-by: Mark Greer <mgreer@animalcreek.com>



--
Ricardo Ribalda
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
