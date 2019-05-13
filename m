Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B121B5B1
	for <lists+linux-nfc@lfdr.de>; Mon, 13 May 2019 14:18:19 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id AC02821268F9D;
	Mon, 13 May 2019 05:18:17 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id 30AC521244A56
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 05:18:16 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id f204so8132225wme.0
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 05:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=NEG3vBWVhGLrRWlwKuNiB7uidufmGuDfj5WGjq1CyGc=;
 b=g+EfGPu7pX6PY1eCxt6sejRx2+4TlzR/x9faRnQCwlOOLCInZBJ26oyVW7H7m+g6Jl
 lAdiUPFjqG3fqgiTFWufHrifU3nDAEL2vstqY7aPiN0Sy/H99Na+oZ24W+3MEAhK4ZQt
 noiB+Kzoe9ayIryxuecXesJikNVL78iYfz3hHzyVo5I57J4yN3QZ9NrUofytkh+GT0PB
 4DSiz2bCFD6zm7QfFir/DOvqlcUa/JmoHtR3jDHd/ctlH588Ik72aMngouMdqJem8mt8
 tTeqmYahTiAXPHLF5O9kjCaOxHvs7oe+Uf4XUuDh+YwX0uB97RIinrW7X1My346o0/Yp
 6m5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=NEG3vBWVhGLrRWlwKuNiB7uidufmGuDfj5WGjq1CyGc=;
 b=XxfoVsAgEcsevKXBocojFmyIL4nSW1L+gtpx/gxGcXad81ocPGFUfUhTVHvbw6eyfv
 /FHONlhl0mcIeZjut5RmXTpOz7Wkq7CAB1Da9KNGxqqsxEemOmIAvi6ntwkJ+Urba5cz
 TnZgveJibr5slVWkXJMTiH0LVZ7EaM3ay6WUTBYmcarCrRRk5U2qTHUbwDkDAEATA8P3
 uebnCAI4Em6B3Nfd1Bime3skwNW6+YChQockDFlZBTkPYJffIiNGhPGbTRBOnUio02TG
 95Okj33Of8B504TMOv1RUo6lULqmjHJaOjVw2xJQ2/VJjzEzY14Uov83qeWYBkxOhfv6
 46UQ==
X-Gm-Message-State: APjAAAXHIv/7jnf1QhNAFhBXH/aP7qQVWFa6Na9IPR3Czof2vhFyQfHY
 RsZRgbluH+3GuqA7JKtr5qkKTs/shl17sC8FvuY=
X-Google-Smtp-Source: APXvYqwZBB5sLBxmgweOFaTs4tTGL+FJFGQvsN3llQlpPX/9L5H9TxR4dnolguO3KORdhzY4x5StqdgPnXEl9WNOCzU=
X-Received: by 2002:a7b:cc12:: with SMTP id f18mr15891780wmh.40.1557749894616; 
 Mon, 13 May 2019 05:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190513104358.59716-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20190513104358.59716-1-andriy.shevchenko@linux.intel.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 13 May 2019 14:18:03 +0200
Message-ID: <CA+icZUV_g5mJnmHQKZgtcPj3YfZSYp1DQJT9tmi+892AzRCm3A@mail.gmail.com>
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

On Mon, May 13, 2019 at 12:44 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> It has been reported that some laptops, equipped with NXP NFC300, have
> different ID then mentioned in the driver.
>
> While at it, I found that the driver has a lot of duplication and redundant
> platform data. The rest of the series (11 out of 12 patches) is dedicated to
> clean the driver up.
>
> Sedat, would be nice if you can compile kernel with this patch series applied
> and test on your laptop.
>
> In v2:
> - added new ID patch
> - added new clean up patch
> - Cc'ed to linux-wireless@ as well, since linux-nfc@ bounces my mails
> - Cc'ed to the reported of the problem with T470 laptop
>
> Andy Shevchenko (12):
>   NFC: nxp-nci: Add NXP1001 to the ACPI ID table
>   NFC: nxp-nci: Get rid of platform data
>   NFC: nxp-nci: Convert to use GPIO descriptor
>   NFC: nxp-nci: Add GPIO ACPI mapping table
>   NFC: nxp-nci: Get rid of code duplication in ->probe()
>   NFC: nxp-nci: Get rid of useless label
>   NFC: nxp-nci: Constify acpi_device_id
>   NFC: nxp-nci: Drop of_match_ptr() use
>   NFC: nxp-nci: Drop comma in terminator lines
>   NFC: nxp-nci: Remove unused macro pr_fmt()
>   NFC: nxp-nci: Remove 'default n' for tests
>   NFC: nxp-nci: Convert to SPDX license tags
>
>  MAINTAINERS                           |   1 -
>  drivers/nfc/nxp-nci/Kconfig           |   1 -
>  drivers/nfc/nxp-nci/core.c            |  15 +--
>  drivers/nfc/nxp-nci/firmware.c        |  13 +--
>  drivers/nfc/nxp-nci/i2c.c             | 147 ++++++--------------------
>  drivers/nfc/nxp-nci/nxp-nci.h         |   1 -
>  include/linux/platform_data/nxp-nci.h |  27 -----
>  7 files changed, 37 insertions(+), 168 deletions(-)
>  delete mode 100644 include/linux/platform_data/nxp-nci.h
>
> --
> 2.20.1
>

Can we have NPC300 listed in the Kconfg help text?

Thanks.

- Sedat -

$ git diff
diff --git a/drivers/nfc/nxp-nci/Kconfig b/drivers/nfc/nxp-nci/Kconfig
index a28c4265354d..f2173c1de745 100644
--- a/drivers/nfc/nxp-nci/Kconfig
+++ b/drivers/nfc/nxp-nci/Kconfig
@@ -2,8 +2,8 @@ config NFC_NXP_NCI
        tristate "NXP-NCI NFC driver"
        depends on NFC_NCI
        ---help---
-         Generic core driver for NXP NCI chips such as the NPC100
-         or PN7150 families.
+         Generic core driver for NXP NCI chips such as the NPC100,
+         NPC300 or PN7150 families.
          This is a driver based on the NCI NFC kernel layers and
          will thus not work with NXP libnfc library.
_______________________________________________
Linux-nfc mailing list
Linux-nfc@lists.01.org
https://lists.01.org/mailman/listinfo/linux-nfc
