Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2131EC0B
	for <lists+linux-nfc@lfdr.de>; Wed, 15 May 2019 12:22:51 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 9880E212777BB;
	Wed, 15 May 2019 03:22:49 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id 0974B21276757
 for <linux-nfc@lists.01.org>; Wed, 15 May 2019 03:22:47 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id f8so2057517wrt.1
 for <linux-nfc@lists.01.org>; Wed, 15 May 2019 03:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=laCY1D40foyBD+P6cy+jfrP2F74oAtcihG3FIQoD5RY=;
 b=c4HAA2AJsfUWWfilte+XxwqGFZVys3NQ7x+4D073IA5yNYG7SpDSQb1a/tG5A8LPDH
 qMsCgo83DEJKzig6qII1o5FYPtWuKSsaa71ExEz3WX5Aox6vHCiTC+mi5azTUlh3EJt5
 OY5q9TN393aoZozQNwrXOyMr/ONxIUQ8MNSlFFHcRpgoDlUlDQ+MtPrGnQPthnbtnpJX
 J3i1YCisMxSmZAOGXw6irY1oHtjS4IMjJvGzFx/1GOAPk9lVYXWRDpBm+0/tBfonUvRk
 prn8rEqwhcCQ0ZcQIdq6S6+/k1fkjltrpofajooKPQUMC5tiOyBSAFXuPNkJsm7OnMZ5
 wMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=laCY1D40foyBD+P6cy+jfrP2F74oAtcihG3FIQoD5RY=;
 b=cs6YesLtLM+FiOH/65ghRY5vcf2TyZrjML5N+R/9s1NL6tan7/Tmsi/cobbNceY8j0
 fzUaUMqhv2lyjcx1UqM/o1qHSxWa1OwyWaaNndhUGaDdpsPM7AaQnQd2j/w6LcccI4ov
 GoirHYCAQAttH8wVgkbQC9NsiimLhUokQ2uqxV7RoaKK381pVkfVXxnZHFL4tWPG7zy9
 +4XXxwdM5Hc431mN+TKGsIRdHq3vKANXwi/yGM/XNYujbnIeCp/oivs+KGdoDnRkDjuD
 Q7a3uv1Wfo+IuptKmnorpK24GuZeTRDgES8vJc6uqsdb/nvgPX8JXJHhFX54ktoYphF6
 Mt/w==
X-Gm-Message-State: APjAAAVgMuieKQYTVJUXx9pXyMfM4CRIP0BhFRsZfCw9pRMhGTk48ZWN
 fh6W0x6ZAq2M6VP/X4N2gt8I7+TP2eBRTWZRLEA=
X-Google-Smtp-Source: APXvYqzgviRHpMCakiwzpzxO70m78ERkw7BjAHWMSNRBT67hsUlz+nkr8PDh4OppZfJX4aJsukQJYInezTpsVIjm7eE=
X-Received: by 2002:adf:dd0d:: with SMTP id a13mr7532941wrm.153.1557915766195; 
 Wed, 15 May 2019 03:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190513123751.GS9224@smile.fi.intel.com>
 <CA+icZUUA8TfU--6b+RwXMf=ui7ww0DK=EurzdMeDUkGvwcJ_rg@mail.gmail.com>
 <2d39b39b-27eb-abef-747f-400433daefee@intel.com>
 <CA+icZUW6vttB8EvgBZYi3kT7uhcbQr+baYbif_V6D78ZNEDbHQ@mail.gmail.com>
 <4f297fa0-257d-5036-8a1a-0f5434bb5d26@intel.com>
 <CA+icZUWZH-JS=JHLieVd2ga=Zutac2BXd4tk0tSXs+izQ5txOQ@mail.gmail.com>
 <787aff34-b1b9-b9e2-faf3-409d7fc95a52@intel.com>
 <CA+icZUV=TBfabHsbzj_JPnxXBjo114LWVJ==xSS7zVPkajmNgw@mail.gmail.com>
 <20190514170136.GI9224@smile.fi.intel.com>
 <CA+icZUW0KM07sUH=muhRwFBZQKQpeqN6wCDHSDrQM-L35bA+SQ@mail.gmail.com>
 <20190515100919.GJ9224@smile.fi.intel.com>
In-Reply-To: <20190515100919.GJ9224@smile.fi.intel.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 15 May 2019 12:22:34 +0200
Message-ID: <CA+icZUV1FjAr_Ro5gACVy3QQ9n1nUggW-XtjE2Qx4hwFdNddiA@mail.gmail.com>
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

On Wed, May 15, 2019 at 12:09 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, May 15, 2019 at 10:32:36AM +0200, Sedat Dilek wrote:
> > On Tue, May 14, 2019 at 7:01 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
>
> > So, this is enough?
>
> Yes, please send it as a formal patch, I will chain it to my series and resend
> in a bunch of v3.
>

Will do after rebooting into Linux v5.1.2 stable :-).

- Sedat -

> > $ git diff
> > diff --git a/drivers/nfc/nxp-nci/Kconfig b/drivers/nfc/nxp-nci/Kconfig
> > index a28c4265354d..d85a4761e271 100644
> > --- a/drivers/nfc/nxp-nci/Kconfig
> > +++ b/drivers/nfc/nxp-nci/Kconfig
> > @@ -2,8 +2,8 @@ config NFC_NXP_NCI
> >         tristate "NXP-NCI NFC driver"
> >         depends on NFC_NCI
> >         ---help---
> > -         Generic core driver for NXP NCI chips such as the NPC100
> > -         or PN7150 families.
> > +         Generic core driver for NXP NCI chips such as the PN547 (NPC100),
> > +         PN548 (NPC300) or PN7150 families.
> >           This is a driver based on the NCI NFC kernel layers and
> >           will thus not work with NXP libnfc library.
> >
> > @@ -21,4 +21,4 @@ config NFC_NXP_NCI_I2C
> >
> >           To compile this driver as a module, choose m here. The module will
> >           be called nxp_nci_i2c.
> > -         Say Y if unsure.
> > +         Say N if unsure.
> >
> > Shall I sent a patch for this, or do you want to that yourself?
> >
> > Thanks.
> >
> > - Sedat -
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
_______________________________________________
Linux-nfc mailing list
Linux-nfc@lists.01.org
https://lists.01.org/mailman/listinfo/linux-nfc
