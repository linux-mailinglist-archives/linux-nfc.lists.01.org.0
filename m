Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 289A91B842
	for <lists+linux-nfc@lfdr.de>; Mon, 13 May 2019 16:23:48 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 7E2CF212735A6;
	Mon, 13 May 2019 07:23:46 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id D81EC2126CF88
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 07:23:44 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id l2so15502638wrb.9
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 07:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=eYwTzeU6ZY30B/JYnW2PX8dKTbyzANTuzswZ9p11ZEE=;
 b=VZJkhTIgl37jUXlLXnsuLgOhuH43bGJG0ixecoW20T67XwGLoAKWsQTYctLThEXhCV
 ShQaSkbVLsNHnL/sXrDG0f1IL0EdKDOD2EIwXJYbX8XR2OJS0snbblyj0kkWaU2nSsD/
 D2uUF1vIuOKigClHpNTvS38dXZLwqG6ewhtm+48iYAQ504A1ecx8LzfRhb79434GHseO
 flKKsfcTRadEYNDTv1iLpvIl/f09F506kdwq/jALijTDTSnQQl7TUeQvKluOG+sn4DN6
 jXBNqFTBKiYpO2unbft/RJZ54CIxEYCh6k/f9SZvLkXuoNzMfvvvkOAbWoSHCuydltH6
 agng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=eYwTzeU6ZY30B/JYnW2PX8dKTbyzANTuzswZ9p11ZEE=;
 b=nwWuQfg9bV4s8rKr6u6XXo4wIgzQvxh+j4grOd6Ci19bVDsNBv43xcyxmZWbxjFG65
 2TU9km0dkUUVBRRog/Zsf2bRl4dbTMUN7ji0BXKRGn0ChsjxQ39vek5Zm65SVg5oonA0
 Eg5CjGa8jfUnNKOCDIHpNNNTfeObaGqAv4Q+GicdP5GUpeDBoZFJN/2Cp6Xs1VQeFuxq
 O1olxvJ/Mg5Fjzw8PxJBaXVkq/vlQ/2HYHyj97mkahEu+bvm55UzNfccT2dzerZuySlK
 +tS+VWSFTv1vXY5ybdmKvZcOy3a4Ku+v5A/UzxKcikUZgsQ5LEmaciz/CFRk9skf7rwV
 DaWw==
X-Gm-Message-State: APjAAAWRWBcaxMCDHHfR1f1HN6GI1u+McJhyahAtOS+Q/tSfZcgq/029
 vmjhEqaA/yiX+AQ7VYUI6OekG5CTAWV2BlmN67jSOAhse1E=
X-Google-Smtp-Source: APXvYqwFTQAbqNWHE8FU4DdQRT0B9flIPbOAZGghsOWBHjjYaUiQxXOvU0hiuUnV8D5JIgnzCTOSfiuddMfxVrIDV1A=
X-Received: by 2002:a5d:4692:: with SMTP id u18mr5774572wrq.285.1557757423219; 
 Mon, 13 May 2019 07:23:43 -0700 (PDT)
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
In-Reply-To: <20190513141128.GY9224@smile.fi.intel.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 13 May 2019 16:23:32 +0200
Message-ID: <CA+icZUWLhvn66Tx4ao8sZA_=-cjMHQ01rshmsRWEYWXY_3Jw4A@mail.gmail.com>
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

On Mon, May 13, 2019 at 4:11 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, May 13, 2019 at 03:32:52PM +0200, Sedat Dilek wrote:
> > BTW, which Linux Kconfig setting are minimum?
> >
> > scripts/config -m NFC_NCI -m NFC_NXP_NCI -m NFC_NXP_NCI_I2C
> >
> > What about?
> >
> > scripts/config -m NFC_NCI_SPI -m NFC_NCI_UART -m I2C_GPIO -m SPI_GPIO
> >
> > Required?
> > Not needed?
>
> I2C_GPIO and SPI_GPIO has nothing to do with all this. What indeed is needed is
> the pin control of the actual Intel SoC (unfortunately I don't know what
> exactly you have, so, you better to check yourself), something like
> CONFIG_PINCTRL_SKYLAKE=y.
>

OK.

What is with NFC_NCI_SPI and NFC_NCI_UART Kconfigs?

I had never changed PINCTRL Kconfigs, so what I have is/was...

$ grep PINCTRL .config | grep ^CONFIG | sort
CONFIG_PINCTRL_AMD=y
CONFIG_PINCTRL_BAYTRAIL=y
CONFIG_PINCTRL_BROXTON=y
CONFIG_PINCTRL_CHERRYVIEW=y
CONFIG_PINCTRL_INTEL=y
CONFIG_PINCTRL_SUNRISEPOINT=y
CONFIG_PINCTRL=y

Which one is this?

And if PINCTRL_XXX is mandatory, shall it be added as Kconfig
dependency in drivers/nfc/nxp-nci/Kconfig?

- Sedat -

P.S.: List of unset PINCTRL Kconfigs

$ grep PINCTRL .config | grep ^'# CONFIG' | sort
# CONFIG_DEBUG_PINCTRL is not set
# CONFIG_PINCTRL_CANNONLAKE is not set
# CONFIG_PINCTRL_CEDARFORK is not set
# CONFIG_PINCTRL_DENVERTON is not set
# CONFIG_PINCTRL_GEMINILAKE is not set
# CONFIG_PINCTRL_ICELAKE is not set
# CONFIG_PINCTRL_LEWISBURG is not set
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_SX150X is not set
_______________________________________________
Linux-nfc mailing list
Linux-nfc@lists.01.org
https://lists.01.org/mailman/listinfo/linux-nfc
