Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 972ED1C98E
	for <lists+linux-nfc@lfdr.de>; Tue, 14 May 2019 15:44:29 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4C3842125ADFB;
	Tue, 14 May 2019 06:44:28 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id 2592F21253319
 for <linux-nfc@lists.01.org>; Tue, 14 May 2019 06:44:26 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id d12so19259714wrm.8
 for <linux-nfc@lists.01.org>; Tue, 14 May 2019 06:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=U7t9OWgDul1DXrcWJKRj2Op8WI9SAhOi5TTLWWgd0Ys=;
 b=riajmBb6Emk4JTr9q69MjIzkxUOdEaAp7VRcJ8c80SjV4zRTs57VBGRr2mnajcmHP7
 iZAwzufMiZl5bkPznW4IGTE41NrCu8HJf8FbiMSJu9X98PJsW9al4uVyz4eQguewEztv
 dFx/oCuGuDZeGeWx6K+jUVlIH0R7gf/uQszzMudQZuRNOsG52QkpQS80TLlrc+6x3kQY
 GxOb2GYiYfbMDmv2yJgRpoqdwtADG5jgZ127KPYjh/8ivOqh4lUR2O3guFeyR3PTz6is
 moDFqu5jEPETxXSmTObdFYEwCfMCptehsn7r2xio7H5y1SNhGLU3sB4E8fpocmVFUoIF
 3Kvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=U7t9OWgDul1DXrcWJKRj2Op8WI9SAhOi5TTLWWgd0Ys=;
 b=W9CTedbAvPUgytuUXkX0LiJOQjlzcZlwrVSYTOzf594g2YYkNKghgpnH+qq/Z9ep6R
 rv7RJkwHIKTmPbRkOfJ7ryy1pRIwFvs0BC6QLiUnsgNtNFe9juNfsDHPxCC9eC/qNrr1
 L/SnEOWXDQoWoBrdo0daYHEtnHsHD7wNS914uy2+9CI8XqQzJh8J02/dzEOKpaFpI0IF
 OmlaZZ8YkVAZM/bPKRXoUvK/Ol28YKeZub5dfro558qH6LlQE+1zGkZU/E+7qrq85u4R
 HBIph1MjGVZg81L3ZDy5J22/YZ/bOmOCLEZPrYaGoVEs/bmndG42f+704c86E8YZFDiw
 3p4g==
X-Gm-Message-State: APjAAAXOZuhzSSvhUlRXJlkf8cUy1YvaLuNo3/K24EKDXcLTVDtd8TjF
 QkA5MWOG9booRzJ7v0IuVwYxPcy0mtvcZwwLw3Z8kRJcAhA=
X-Google-Smtp-Source: APXvYqzdXf3G0V0OCkWiEoKao4toPiFThaoWMWknZbPGTQfpmDOZ/acvD+TPVLujU/sD+FnZpbdscLu0/zmfAANurOU=
X-Received: by 2002:adf:9e46:: with SMTP id v6mr10216280wre.141.1557841465392; 
 Tue, 14 May 2019 06:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190513104358.59716-1-andriy.shevchenko@linux.intel.com>
 <CA+icZUV_g5mJnmHQKZgtcPj3YfZSYp1DQJT9tmi+892AzRCm3A@mail.gmail.com>
 <20190513123751.GS9224@smile.fi.intel.com>
 <CA+icZUUA8TfU--6b+RwXMf=ui7ww0DK=EurzdMeDUkGvwcJ_rg@mail.gmail.com>
 <2d39b39b-27eb-abef-747f-400433daefee@intel.com>
 <CA+icZUW6vttB8EvgBZYi3kT7uhcbQr+baYbif_V6D78ZNEDbHQ@mail.gmail.com>
 <4f297fa0-257d-5036-8a1a-0f5434bb5d26@intel.com>
In-Reply-To: <4f297fa0-257d-5036-8a1a-0f5434bb5d26@intel.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 14 May 2019 15:44:13 +0200
Message-ID: <CA+icZUWZH-JS=JHLieVd2ga=Zutac2BXd4tk0tSXs+izQ5txOQ@mail.gmail.com>
To: Oleg Zhurakivskyy <oleg.zhurakivskyy@intel.com>
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
 Charles Gorand <charles.gorand@effinnov.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-nfc-bounces@lists.01.org
Sender: "Linux-nfc" <linux-nfc-bounces@lists.01.org>

On Tue, May 14, 2019 at 3:30 PM Oleg Zhurakivskyy
<oleg.zhurakivskyy@intel.com> wrote:
>
>
> OK, thanks!
>
> On 5/14/19 3:03 PM, Sedat Dilek wrote:
>
> > It's good to keep both informations - preferable put them into the
> > Kconfig help text?
>
> Sure, it's best to keep them both.
>

While looking at the Kconfig help text; I wonder why...

config NFC_NXP_NCI_I2C
        tristate "NXP-NCI I2C support"
        depends on NFC_NXP_NCI && I2C
        ---help---
          This module adds support for an I2C interface to the NXP NCI
          chips.
          Select this if your platform is using the I2C bus.

          To compile this driver as a module, choose m here. The module will
          be called nxp_nci_i2c.
          Say Y if unsure.

Shouldn't that be "Say N if unsure"?
Or Say Yes If Sure :-).

- Sedat -
_______________________________________________
Linux-nfc mailing list
Linux-nfc@lists.01.org
https://lists.01.org/mailman/listinfo/linux-nfc
