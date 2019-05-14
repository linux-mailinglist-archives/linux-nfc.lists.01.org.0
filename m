Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9436A1C50A
	for <lists+linux-nfc@lfdr.de>; Tue, 14 May 2019 10:34:25 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 009B5212746F9;
	Tue, 14 May 2019 01:34:24 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id F1A312125ADD1
 for <linux-nfc@lists.01.org>; Tue, 14 May 2019 01:34:21 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id d12so18124770wrm.8
 for <linux-nfc@lists.01.org>; Tue, 14 May 2019 01:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=8NjoP7C8oyZPDDZY3IPQoINwZUvpqoxzMLsqnLr6dWg=;
 b=tKLN7ieRmd5krRtqxeRuOaavVs5eXgQg/hGNs+VdTS6gmNZ3GZPbOttPcm2Usi7ja9
 i9ToL3t8SOCH0cmxoV4MO0iZQP3ly7RtEsgbgwfoV8qPsABBot9ITLg9J7l7VXS0WG6R
 1wT4mXge/8ALMBClLImYo27ythBxl2rpP7zsqbk3lFDrqS7hdEZ93/zW1GiPhrgHUKtl
 XW/Cu8QEVYZTLE4ovnuAFfrWKMePY5snP5mZ7/w2uauytWPwazd70EKIvhaaFaBtHsuV
 K07U0NKPVnTseAHDDUNOzHtGIVB1oh+QJ4+yVKVC5wtEUU5jId/HyalodfHpcyvSwydL
 1RbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=8NjoP7C8oyZPDDZY3IPQoINwZUvpqoxzMLsqnLr6dWg=;
 b=AktGIAay+fpfQrCuGL4OItUV8hYJmPehZDDup2BlrqfjwjbHNXW+dk5/O428XUIo/E
 NGlwnnUPSrIp10ZfbN34EYCErYlk2skKAf2sSO3BM+pE/OGnPj5I1l/A4/Tfy06ooMoI
 CbxWpkWdW8DxBTJOag/a3hQHm4uxVfb6suAbblhzbRViMhV82iGaK8TskK0fbirZlRO1
 Y/9m1gbFCHVpFsw5ldbAuawJkWUPPcHCDj7ZMpGs9cer5qopM7GYc207CkD46oLPCdGQ
 zWHIdUGg+cWWcEaoyg+40HUqIFygQhEemVSKcxBI8Ok0b3ZR0I43wdpitG77Ow7ErC2s
 RN4g==
X-Gm-Message-State: APjAAAWYBnM1g/KAr/WTaJ/x+dydAcA7Q/WDkbWhACFG87iPZZYdmqjR
 4gdtRwBsLpW0M70rjmfqBR4ysmQFxA+up40IIe4=
X-Google-Smtp-Source: APXvYqwwSjNEO9yPYhPmDE8T14m9ihMvCjsm7IzEEIn+yGfK3Z1xtN/7o4efwAaIqfAcqayNUS9fP3qeuiuaBWu0FLk=
X-Received: by 2002:adf:9e46:: with SMTP id v6mr9064537wre.141.1557822860443; 
 Tue, 14 May 2019 01:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190513104358.59716-1-andriy.shevchenko@linux.intel.com>
 <CA+icZUV_g5mJnmHQKZgtcPj3YfZSYp1DQJT9tmi+892AzRCm3A@mail.gmail.com>
 <20190513123751.GS9224@smile.fi.intel.com>
In-Reply-To: <20190513123751.GS9224@smile.fi.intel.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 14 May 2019 10:34:09 +0200
Message-ID: <CA+icZUUA8TfU--6b+RwXMf=ui7ww0DK=EurzdMeDUkGvwcJ_rg@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [linux-nfc] [PATCH v2 00/12] NFC: nxp-nci: clean up and support
 new ID
X-BeenThere: linux-nfc@lists.01.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: NFC on Linux <linux-nfc.lists.01.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nfc>,
 <mailto:linux-nfc-request@lists.01.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nfc/>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nfc>,
 <mailto:linux-nfc-request@lists.01.org?subject=subscribe>
Reply-To: sedat.dilek@gmail.com
Cc: linux-nfc@lists.01.org, linux-wireless@vger.kernel.org,
 Charles Gorand <charles.gorand@effinnov.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-nfc-bounces@lists.01.org
Sender: "Linux-nfc" <linux-nfc-bounces@lists.01.org>

On Mon, May 13, 2019 at 2:37 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, May 13, 2019 at 02:18:03PM +0200, Sedat Dilek wrote:
> > On Mon, May 13, 2019 at 12:44 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > It has been reported that some laptops, equipped with NXP NFC300, have
> > > different ID then mentioned in the driver.
> > >
> > > While at it, I found that the driver has a lot of duplication and redundant
> > > platform data. The rest of the series (11 out of 12 patches) is dedicated to
> > > clean the driver up.
> > >
> > > Sedat, would be nice if you can compile kernel with this patch series applied
> > > and test on your laptop.
> > >
> > > In v2:
> > > - added new ID patch
> > > - added new clean up patch
> > > - Cc'ed to linux-wireless@ as well, since linux-nfc@ bounces my mails
> > > - Cc'ed to the reported of the problem with T470 laptop
> > >
> > > Andy Shevchenko (12):
> > >   NFC: nxp-nci: Add NXP1001 to the ACPI ID table
> > >   NFC: nxp-nci: Get rid of platform data
> > >   NFC: nxp-nci: Convert to use GPIO descriptor
> > >   NFC: nxp-nci: Add GPIO ACPI mapping table
> > >   NFC: nxp-nci: Get rid of code duplication in ->probe()
> > >   NFC: nxp-nci: Get rid of useless label
> > >   NFC: nxp-nci: Constify acpi_device_id
> > >   NFC: nxp-nci: Drop of_match_ptr() use
> > >   NFC: nxp-nci: Drop comma in terminator lines
> > >   NFC: nxp-nci: Remove unused macro pr_fmt()
> > >   NFC: nxp-nci: Remove 'default n' for tests
> > >   NFC: nxp-nci: Convert to SPDX license tags
> > >
> > >  MAINTAINERS                           |   1 -
> > >  drivers/nfc/nxp-nci/Kconfig           |   1 -
> > >  drivers/nfc/nxp-nci/core.c            |  15 +--
> > >  drivers/nfc/nxp-nci/firmware.c        |  13 +--
> > >  drivers/nfc/nxp-nci/i2c.c             | 147 ++++++--------------------
> > >  drivers/nfc/nxp-nci/nxp-nci.h         |   1 -
> > >  include/linux/platform_data/nxp-nci.h |  27 -----
> > >  7 files changed, 37 insertions(+), 168 deletions(-)
> > >  delete mode 100644 include/linux/platform_data/nxp-nci.h
> >
> > Can we have NPC300 listed in the Kconfg help text?
>
> Sure, it's good thing to do!
>
> Either as a separate patch or I may incorporate in the next iteration.
> Samuel, what do you prefer?
>

Am I correct that "NPC100" is "PN547" and "NPC300" is "PN548"?

- Sedat -
_______________________________________________
Linux-nfc mailing list
Linux-nfc@lists.01.org
https://lists.01.org/mailman/listinfo/linux-nfc
