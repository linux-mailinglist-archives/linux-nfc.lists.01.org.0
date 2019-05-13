Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4FB1B489
	for <lists+linux-nfc@lfdr.de>; Mon, 13 May 2019 13:07:46 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4D78E212604FE;
	Mon, 13 May 2019 04:07:45 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id 30740212604E6
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 04:07:43 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e15so2352814wrs.4
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 04:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=8qPPqWD2z0kVvPp6nbqZgda8oGIC82fsd1pYy39EkQQ=;
 b=iRv4ybgWM2JAFd7VuYeqp8SUaqDFJd7QfoCasx+UeFbhGS9X2IZZdSFBq1obmwJmHj
 jAxrCZ+aqosCD847t/b18vScxa6+/Q/ZnnBRoJFxJ/jllhe5AWUOhcF4nQGu2LLeg3/Z
 OoyewQ6+yG+AvjvqCyOaMMTx8Y9EbmqE3c3GQ5WGn6Y/ntwXHB1p4OiCN4ars+pLs9Ud
 qU2jdZa7pc+mbTrerilKBAQhVnFRLzk42Rj5PvVS3zBLa0RFR3+vAlmEaI6Lb26Y10Qx
 3m0UrwffoAuzdOC/npIPXgImcvPCl/BYbR/Q/JrWDSoK16C5aWWUg896L0u1N/V6aOfz
 soWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=8qPPqWD2z0kVvPp6nbqZgda8oGIC82fsd1pYy39EkQQ=;
 b=mr7aj5+VT1+ElC8EPJROMe/pK5NHnDyisT02RVNyaEkr2GhUo57ARGjw9oamyYlvj1
 E+jwS0qtq1gmIzIKwl6sJQx4GhV/cch2eMnsE9oNY3VGgP8Fk9MyVybM8jmpLqjE5pmy
 HG90hfdmS8/xmY8E2MZG/q8IIE2RA5zxmUWy/yR08pnrIXT1btQGQxuRKGgYUDGSTFXk
 SDomMOh8y+0tWDEA2SxgbuzPlaEtlKWpcHsJLlIMclbi7MiujvjCF+0XrdMWkoFCHML/
 hMyr0Wexp7mCFpkq+7u2CdClmu6DaQy4mPaLJQqEkFRREdE9tFjs+KZ1uNHPuYgU57t3
 a60w==
X-Gm-Message-State: APjAAAWfinRtSuTAIZiKGWhG15B1mjt0LZDMRlUlvFBKGLOZDBsMTZbr
 oOUkXXjWIjC2eHJIJWazS/8TJ5xbhE7IzhP6/FE=
X-Google-Smtp-Source: APXvYqx1eAYNDOxbTxJVFLgZJHeX4IvNbIyUrKXknGFDmfT5L4fbQqDg7nSg0bzq5e/H0Q5XbeZkjQLwYZO8IV30ueI=
X-Received: by 2002:adf:dc4b:: with SMTP id m11mr17724172wrj.66.1557745661721; 
 Mon, 13 May 2019 04:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUX+VNtk00YQnNYCnDeeH2Onq6s1vbdzYrv-OHf7q186Ww@mail.gmail.com>
 <154e3e74-38b5-850b-5993-295f9db8fe3c@intel.com>
 <CA+icZUWhBeup95PTP_k58xs8Lf2Ofqb0S_gkdBfbuc0-wdpF-w@mail.gmail.com>
 <06fbacb5-7739-1ca1-3bf4-8049a3ef019b@intel.com>
 <CA+icZUWJ0kZSqogg18LdP2YkNXk=_SNnT7-ufkd_Xp1ak7uchg@mail.gmail.com>
 <20190513095059.GN9224@smile.fi.intel.com>
 <CA+icZUWXSup0BfXNZXxcrAAbu-b9KCiBU++OkC+eFqacMrTwRg@mail.gmail.com>
 <20190513105745.GR9224@smile.fi.intel.com>
In-Reply-To: <20190513105745.GR9224@smile.fi.intel.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 13 May 2019 13:07:28 +0200
Message-ID: <CA+icZUVE2ZG3bkMcq2HWX-Av=-H0Xqh5pMgMQOpc7w0my7CqkQ@mail.gmail.com>
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

On Mon, May 13, 2019 at 12:57 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, May 13, 2019 at 12:38:27PM +0200, Sedat Dilek wrote:
> > On Mon, May 13, 2019 at 11:51 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Mon, May 13, 2019 at 11:27:07AM +0200, Sedat Dilek wrote:
> > >
> > > > Sorry to say, I still have not get all correlations...
> > >
> > > Can you provide the output of the following on running Linux system with latest
> > > possible kernel you can install (I am expecting v5.1) and command line with
> > > 'ignore_loglevel'?
> > >
> > > 1. `dmesg`
> > > 2. `grep -H 15 /sys/bus/acpi/devices/*/status`
> > > 3. `acpidump -o t470-tables.dat` # the file t470-tables.dat
> > > 4. `lspci -vv -nk`
> > >
> > > P.S. You may use GitHub gist for this set (please, don't share archives) or any
> > > other resource like pastebin.
> > >
> >
> > Looks like I am unable to use Debian's gist-paste package today or
> > need more coffee.
> >
> > So, I add this here.
> >
> > I added my kernel-config.
>
>
> Thanks. I just sent a series to (hopefully) support it in the vanilla kernel.
> Can you test it?
>
> P.S. I see in dmesg the pn544 tries to bind to the NXP1001. Do you have some
> custom patches for that in your kernel? If so, please drop them.
>

Hi Andy,

I dropped the manually added nxp-pn5xx in driver/misc.

No, I have no custom patches.

Thanks, I amcompiling with your v2 series of NFC nxp-nci...

- Sedat -
_______________________________________________
Linux-nfc mailing list
Linux-nfc@lists.01.org
https://lists.01.org/mailman/listinfo/linux-nfc
