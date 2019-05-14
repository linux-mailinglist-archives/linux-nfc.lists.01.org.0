Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE7F1CAEA
	for <lists+linux-nfc@lfdr.de>; Tue, 14 May 2019 16:53:26 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id DDCFF21256BA2;
	Tue, 14 May 2019 07:53:24 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id 2284621237816
 for <linux-nfc@lists.01.org>; Tue, 14 May 2019 07:53:22 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id c66so2556658wme.0
 for <linux-nfc@lists.01.org>; Tue, 14 May 2019 07:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=3q9zAd1mfqLEWgtN9KBQL8ZyemYmSupu9NkVwzRaOEQ=;
 b=twzOdOTMQC3qusxoiOhAwwUuB9dHoScRb1Mxt3wsoHDCScqVS0joqx9vLHbi5lDwMw
 aFQa6RvqLhPLv6pMkH+T3k938wsNJoGcFuw7KGCrdE3iq/Gq8ltj2dyu7zd9sk9zO+4n
 +bATAOdWIh9l5qgdRT1b1yVXPJcSbVd2Dg13FT6J3ZSxbZ0kAfA1puNcH95P2w4Sx/FJ
 23aZR/AA59hwShUR5atR8whyZz2uAgQOclXapxgfL5LI9Rs+Fi1COflqUQ7gf5ri1QMz
 Vku7ih3WErJ+AotXpcjQ/06DZvdnEwUZBClIztK0Jf5B8VWJjMgHCDylyJIYfqU4s5ch
 gcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=3q9zAd1mfqLEWgtN9KBQL8ZyemYmSupu9NkVwzRaOEQ=;
 b=OuStAFBHIE2mx/tw1Lf7arng+RD2Gl9rcuYe9264uh/WBSJXCLN70pJr0Sr1Bs8Jf3
 m/WO8eltPqhk/XrxQ7DLJXzNdX3AIw8ZvE4hnj+bV7YSO7WQv5fwniYViZbDdfgEqgQM
 VQquGu8dy9p8hMA4D2brjxNDX4mdeYG6QfTv/f9MMfP9JsVoXB1t0DZRs/3AXr5SCzke
 Va0gwdT8df+Zut289IUOgFGPuud//HGdjWMTRDSxZxcYZxdS2D1F0IuK+9EbTe2Jox4v
 7RYc2Zx7CPO6AGzswzLOC6s5nbhEcdER9iv/HQ3avHgLnFPJ0zmtElmODqdy0oj/qOwU
 Tceg==
X-Gm-Message-State: APjAAAWbMRF1BVU8STWKSq9fCHyU5B4iPjYffcBqvC+OAropa4z++JxT
 m5qJuhre4Ox+FJcBtImBM/ICQecjmvo6f8obDCo=
X-Google-Smtp-Source: APXvYqz1IN9x6k5J6WB/v6FVQ5pXgqKV96kikS/r8kCM6VZ3elo/3jq1wHqf+U2+r90KE4kKB1DmaoZnqWobKWjXeGY=
X-Received: by 2002:a1c:9616:: with SMTP id y22mr9069193wmd.73.1557845601591; 
 Tue, 14 May 2019 07:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190513104358.59716-1-andriy.shevchenko@linux.intel.com>
 <CA+icZUV_g5mJnmHQKZgtcPj3YfZSYp1DQJT9tmi+892AzRCm3A@mail.gmail.com>
 <20190513123751.GS9224@smile.fi.intel.com>
 <CA+icZUUA8TfU--6b+RwXMf=ui7ww0DK=EurzdMeDUkGvwcJ_rg@mail.gmail.com>
 <2d39b39b-27eb-abef-747f-400433daefee@intel.com>
 <CA+icZUW6vttB8EvgBZYi3kT7uhcbQr+baYbif_V6D78ZNEDbHQ@mail.gmail.com>
 <4f297fa0-257d-5036-8a1a-0f5434bb5d26@intel.com>
 <CA+icZUWZH-JS=JHLieVd2ga=Zutac2BXd4tk0tSXs+izQ5txOQ@mail.gmail.com>
 <787aff34-b1b9-b9e2-faf3-409d7fc95a52@intel.com>
In-Reply-To: <787aff34-b1b9-b9e2-faf3-409d7fc95a52@intel.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 14 May 2019 16:53:10 +0200
Message-ID: <CA+icZUV=TBfabHsbzj_JPnxXBjo114LWVJ==xSS7zVPkajmNgw@mail.gmail.com>
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

On Tue, May 14, 2019 at 3:57 PM Oleg Zhurakivskyy
<oleg.zhurakivskyy@intel.com> wrote:
>
>
> On 5/14/19 4:44 PM, Sedat Dilek wrote:
>
> >            Say Y if unsure.
> >
> > Shouldn't that be "Say N if unsure"?
> > Or Say Yes If Sure :-).
>
> :)
>
> Must be a typo.
>
> As to me, the last 5 lines in the description are extra, but this is just a matter of taste.
>

What about this one?

diff --git a/drivers/nfc/nxp-nci/Kconfig b/drivers/nfc/nxp-nci/Kconfig
index a28c4265354d..b9e6486aa8fe 100644
--- a/drivers/nfc/nxp-nci/Kconfig
+++ b/drivers/nfc/nxp-nci/Kconfig
@@ -2,8 +2,8 @@ config NFC_NXP_NCI
        tristate "NXP-NCI NFC driver"
        depends on NFC_NCI
        ---help---
-         Generic core driver for NXP NCI chips such as the NPC100
-         or PN7150 families.
+         Generic core driver for NXP NCI chips such as the NPC100 (PN547),
+         NPC300 (PN548) or PN7150 families.
          This is a driver based on the NCI NFC kernel layers and
          will thus not work with NXP libnfc library.

@@ -19,6 +19,11 @@ config NFC_NXP_NCI_I2C
          chips.
          Select this if your platform is using the I2C bus.

+          Furthermore, the pin control and GPIO driver of the actual SoC or
+          PCH is needed.
+          For example set CONFIG_PINCTRL_SUNRISEPOINT=y to activate the
+          Intel Sunrisepoint (PCH of Intel Skylake) pinctrl and GPIO driver.
+
          To compile this driver as a module, choose m here. The module will
          be called nxp_nci_i2c.
-         Say Y if unsure.
+         Say N if unsure.

- Sedat -
_______________________________________________
Linux-nfc mailing list
Linux-nfc@lists.01.org
https://lists.01.org/mailman/listinfo/linux-nfc
