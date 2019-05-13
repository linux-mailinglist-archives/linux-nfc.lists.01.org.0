Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4991BE2E
	for <lists+linux-nfc@lfdr.de>; Mon, 13 May 2019 21:48:32 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 9E40321268F8A;
	Mon, 13 May 2019 12:48:30 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id D0948211FB8BC
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 12:48:28 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id w8so14181449wrl.6
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 12:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=jxVNHvkCAClk55VtV/ChIHyBnXMsML+QlgXGtiEg/5Y=;
 b=TOJwGUsL6hhtypW1dS0xJ12N8M8OeZJl7niTOkmSTpLJKKI0zQgGNSso/y7x2Zw3/Z
 ELLZC61mEP+oAqUZVQi+efnZir0esEeP6d1O9SLqAgLhjsDuZ7l1JRS5XC7x9aQBbyzD
 ZHjePJfXMFluBdJsbgdUjuEkQPnc8IosRNF6deuMGiIYCrOiHz+/j2dkOEVAjuGre3LS
 7297z3T02H4jrSGPoosFnWP0Vcb1ol7IBsCKC6MthHV0Q5X0zA3quKlG8YcWEchV0Xjq
 e+IYoLAquuTuKNol06iz67QtpNSNM8yRqFirV0qFlg2T1fuwqo2xDGk88rhcrfe1zy9c
 3ZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=jxVNHvkCAClk55VtV/ChIHyBnXMsML+QlgXGtiEg/5Y=;
 b=tbSCP9AT7sgR+Ov9o7cLJrPyfq9vEVx2n0voCRfCnlonYSjF4zRIMuB90+dLvsZhNX
 d79WLHMHGlWGIhjvSihFf2VyXgYuyvBmfgeqBw5M9XVjfe5gY/ffwyMtAvMN/QoRlz+k
 CYxdosROlURznuTPVCGt1bbfOwDcqUuzXl/I4/bIdM3fNG3yHatSscuL5x6H2XImEiQb
 rwBXRgPP1UdMER8ebB7UxJ6k+anixVuC5wT0JbzdDcGHakASiXQ5HkXA2QUoPNmQrqac
 A9yKGaSphZN2im6fHm6jomiuiHthZdlYeu7kOiJ5aqp9GxsVJtiHJ79a6G/5Glk80igI
 sKug==
X-Gm-Message-State: APjAAAWlr09HN0N9yVG/QBbBCBoQ8PbsEkeetGNQiDl3ZyyzyvR1euY/
 +n9RTxjsyfDk4d7g8HyIH21btWb69PnGzE4EOMzZpMF2
X-Google-Smtp-Source: APXvYqwhH3o6/uM3plBNrSQ9gWNwyJZbcfhz+8wUrkR4+yNkxv5pvL7ft3iQppPStSnpbbS8qxPIeF/8miCZ5AoUH98=
X-Received: by 2002:a5d:4692:: with SMTP id u18mr6817860wrq.285.1557776907160; 
 Mon, 13 May 2019 12:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190513104358.59716-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20190513104358.59716-1-andriy.shevchenko@linux.intel.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 13 May 2019 21:48:15 +0200
Message-ID: <CA+icZUVn9tHQ3Zug0u2scbvGFfrLag_WYdzs9FCBJsGJ4bhuzw@mail.gmail.com>
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

Is it possible to have an info in dmesg log when nxp-nci_i2c kernel
module is loaded?

- Sedat -
_______________________________________________
Linux-nfc mailing list
Linux-nfc@lists.01.org
https://lists.01.org/mailman/listinfo/linux-nfc
