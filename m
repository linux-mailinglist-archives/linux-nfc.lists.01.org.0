Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA351BE4D
	for <lists+linux-nfc@lfdr.de>; Mon, 13 May 2019 22:03:17 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id D7023212741E2;
	Mon, 13 May 2019 13:03:15 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id A92912122CAB4
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 13:03:13 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id y3so564370wmm.2
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 13:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=U2V70HHgq1G8IBAe48iadiBr2eJH/xQZxJnZViWgA4s=;
 b=K0R9v5xEBOGo+2EQkGypkZFNd0TDfuRi9yYCnpmXT7M0vEVkcTVDCdPBlKkCW3mJg4
 mnIk0wni/j+eYSK+aZ7Q0n/Ka9pBjL89QEO1+yQ46b014uPLRjiHN4N8aKtLDUVpM2BE
 BvTHJ04iUsZh3YTo1uabjy+ToOz6dpcFH1p/sOQpkNmy+yp7qhz4AgkVZA6+EPQf4SxM
 xstucGBmq5NpGiKiK+omtA6jY2yDL6cAWb3Z9dkRudfWXj1JkX9Lxkn8ffvRU/HoGRJ9
 JN1PE506ShT+OKs1XRljJVRZIB2SkuNDQgoEUsB6TWERyy8MFTS8xWyS2HpDXSORE1u1
 cO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=U2V70HHgq1G8IBAe48iadiBr2eJH/xQZxJnZViWgA4s=;
 b=cH7HtA0OwgkTt5lPptqCdsAF+bhG9TlGs7/lU7RVHs+EeUcipagaNRMWnG31aZCJi7
 rtjGqK2VPQQVAiWvWyOi4ty9UZOAM5qvAIDvTVftxRJ7GMOEEGbqAh7Tl444Ocx6HCZ7
 QhPtCu4GFuc1zPBzIUo32LOuAOuKO45uKkm85XHzgZNi5+owJkh6zBz7bfTJfYCatIuc
 7fKZfoXF3NjW+9/nRVSVyx41OAuhCIAjH4YNTONykXtj9mrdcMwiTwnL0/OyNk9bWTSC
 WUmR4j7SRwXUhJTSeBeAIWB0evDIrf0UGLiVFWW2d198fUvr+73d+xDfCuCmYrTN9gET
 X0cA==
X-Gm-Message-State: APjAAAWzmROu0YZEPPDidkMiXAWW4C0JHOsZH/PQm89gm8tfjAV7ShG/
 28Covnhz2IAs86SKCr1IHbXhr2gqS9CZkL8YCc4=
X-Google-Smtp-Source: APXvYqwzoneKL8ojrC8BcmjTUH07XF4Mv3gYTVaF4KZr9FLK0iqIm2jBeLxloXRciUvL1G8pSRlFZuhvHPDxW0PfwM8=
X-Received: by 2002:a1c:9616:: with SMTP id y22mr6079303wmd.73.1557777792012; 
 Mon, 13 May 2019 13:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <154e3e74-38b5-850b-5993-295f9db8fe3c@intel.com>
 <CA+icZUWhBeup95PTP_k58xs8Lf2Ofqb0S_gkdBfbuc0-wdpF-w@mail.gmail.com>
 <06fbacb5-7739-1ca1-3bf4-8049a3ef019b@intel.com>
 <CA+icZUWJ0kZSqogg18LdP2YkNXk=_SNnT7-ufkd_Xp1ak7uchg@mail.gmail.com>
 <20190513095059.GN9224@smile.fi.intel.com>
 <CA+icZUWXSup0BfXNZXxcrAAbu-b9KCiBU++OkC+eFqacMrTwRg@mail.gmail.com>
 <20190513105745.GR9224@smile.fi.intel.com>
 <CA+icZUVDTx_ZUuOgHVDmg5_a4tgrRkPp880+0KPaRJ1d=zF5VQ@mail.gmail.com>
 <20190513124049.GT9224@smile.fi.intel.com>
 <CA+icZUWU2OQszOYi1Jzp7yW+gB-TmhkBfmqaLAvy3WEOn9Rh8g@mail.gmail.com>
 <20190513141128.GY9224@smile.fi.intel.com>
 <CA+icZUUsutHt1NXLNFd17J3QK-LtFCuUUEw4qqp9urJ++dDaKA@mail.gmail.com>
In-Reply-To: <CA+icZUUsutHt1NXLNFd17J3QK-LtFCuUUEw4qqp9urJ++dDaKA@mail.gmail.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 13 May 2019 22:02:58 +0200
Message-ID: <CA+icZUXrJieuF8DLVbce=sTVa_2Wc+sgjzh0z3d2Zw91cC9kXw@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [linux-nfc] ThinkPad T470 and NXP PN5xx (PN547 or PN548)
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
Cc: linux-wireless@vger.kernel.org, linux-nfc@lists.01.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-nfc-bounces@lists.01.org
Sender: "Linux-nfc" <linux-nfc-bounces@lists.01.org>

On Mon, May 13, 2019 at 9:46 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Mon, May 13, 2019 at 4:11 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Mon, May 13, 2019 at 03:32:52PM +0200, Sedat Dilek wrote:
> > > BTW, which Linux Kconfig setting are minimum?
> > >
> > > scripts/config -m NFC_NCI -m NFC_NXP_NCI -m NFC_NXP_NCI_I2C
> > >
> > > What about?
> > >
> > > scripts/config -m NFC_NCI_SPI -m NFC_NCI_UART -m I2C_GPIO -m SPI_GPIO
> > >
> > > Required?
> > > Not needed?
> >
> > I2C_GPIO and SPI_GPIO has nothing to do with all this. What indeed is needed is
> > the pin control of the actual Intel SoC (unfortunately I don't know what
> > exactly you have, so, you better to check yourself), something like
> > CONFIG_PINCTRL_SKYLAKE=y.
> >
>
> I played a bit with the Kconfigs...
>
> scripts/config -m NFC_NCI -m NFC_NXP_NCI -m NFC_NXP_NCI_I2C
>
> ...is sufficient.
>
> I don't know which CONFIG_PINCTRL_XXX is needed.
>

I looked at lspci output and I see a lot of "Intel Corporation Sunrise
Point-LP", especially...

00:15.0 Signal processing controller: Intel Corporation Sunrise
Point-LP Serial IO I2C Controller #0 (rev 21)

I have set...

CONFIG_PINCTRL_SUNRISEPOINT=y

From [1]:

config PINCTRL_SUNRISEPOINT
tristate "Intel Sunrisepoint pinctrl and GPIO driver"
depends on ACPI
select PINCTRL_INTEL
help
Sunrisepoint is the PCH of Intel Skylake. This pinctrl driver
provides an interface that allows configuring of PCH pins and
using them as GPIOs.

- Sedat -

[1] https://github.com/torvalds/linux/blob/master/drivers/pinctrl/intel/Kconfig#L109
_______________________________________________
Linux-nfc mailing list
Linux-nfc@lists.01.org
https://lists.01.org/mailman/listinfo/linux-nfc
