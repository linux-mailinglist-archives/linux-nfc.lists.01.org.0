Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D191BE7B
	for <lists+linux-nfc@lfdr.de>; Mon, 13 May 2019 22:15:20 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id DE121212741E1;
	Mon, 13 May 2019 13:15:18 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::442; helo=mail-wr1-x442.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id 11148212735CE
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 13:15:16 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id h4so16701989wre.7
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 13:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=WseHiS737oljtnoWHZSGwODZuVgoSFVRNVAi+JX4ZKo=;
 b=LJuQoAeG9sNoH/rt3nDFVsTOoqMD2S/rAlTereAb9m5ZdXNBxki+1340Ey0bpj6Q08
 T8gXC2cO2bKz1OygbTDe5CF7xxiEAqNvRFM8+/JMrFmGtU0bwztoydMt+0jFmLLrEyRF
 70VSlNeCGzzVGG5ltH5xbQ4uLjD0SleKxDVx8qpCVArxhz9VfIjA5UFhsjjybWDZkVxi
 uV1TKARmgNbDusa2QRQBFyZN62vvKj9Fq+s3hjncJOJIDz8AY5uLEBNcMVoZSNi8SUBv
 KRDyiRjhdl/B2PTLSYhiJx+kM8bXDLLj0sf4YSDruj0I8xXbsADPGJYE3Kd3S7qqG3/X
 IoKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=WseHiS737oljtnoWHZSGwODZuVgoSFVRNVAi+JX4ZKo=;
 b=GlTxz6aKJXbZ2QwC3f7ZSufjgnNu1ocUTkqgtG85QU0zOVgBrw4/S320WdYo3rBKEP
 YAJBVc87WTb9iO063Mkb/yySYGZ6oBChgih+gDb1aKcqgJ3i/zhgKIlKu4JH1kBxFBpJ
 Tzn3js7Rlx/U1ZAg36tx4mRG9Q8K+KYs2nr3wPIDDplzabc0RNYcBw7XV3tIAnTJMRGs
 pXEBYMoDZfEc247Hfd1zi0ou6OZ4T5auH0Myr+YtqeLaXy8gGqygBcxS9RrpHZytqfIU
 D+94UhYawWrD8j8P6jvrDhGPZEaEvYvvCDxI3P3OFAzWk7CtvbC/Yzm6062vSXCCRB70
 bI7w==
X-Gm-Message-State: APjAAAVrTcWjoP8YSe4GmE7ztBfuz9RDoie/6ECvKH0H0cBh6rdHgJ5o
 SNYzdLgj4RmYs54nSO6J5t2GOXIOuhuTR/BrlY0=
X-Google-Smtp-Source: APXvYqyJ3LBZ1Vw7Zu4BUBw+/9RMxuP8SjrM9N+MIHZuAlAgWc9U5uueDq7nfKIHhqBwMRWboqaP+x1l+vloSFw6QGI=
X-Received: by 2002:adf:9e46:: with SMTP id v6mr7193558wre.141.1557778515522; 
 Mon, 13 May 2019 13:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <c2d0d19f-d814-8f41-4860-77b9cc7f9d26@linaro.org>
In-Reply-To: <c2d0d19f-d814-8f41-4860-77b9cc7f9d26@linaro.org>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 13 May 2019 22:15:02 +0200
Message-ID: <CA+icZUVz7sB6hv4fhL_rqhR_D8RePBJFXk1PaUy5tMw2z4xC_Q@mail.gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [linux-nfc] NXP NFC version and ACPI
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
Cc: robert.dolca@intel.com, linux-nfc@lists.01.org,
 linux-wireless@vger.kernel.org, charles.gorand@effinnov.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-nfc-bounces@lists.01.org
Sender: "Linux-nfc" <linux-nfc-bounces@lists.01.org>

On Wed, Dec 5, 2018 at 8:38 AM Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>
>
> Hi,
>
> the discussion reference is on github [1].
>
> I acquired a Lenovo x280 with a NFC chip. It is unclear what chip is it
> really, it is called NXP NPC300 which could be a PN7xxx chip range.
>
> A hacked version of an old deprecated out-of-tree module made the PN5xxx
> to work with my laptop but I suspect it brought some subtle instability
> on my system.
>
> Now it would be nice to have this correctly supported upstream.
>
> I dumped the ACPI DSDT table and got the id NXP1001. This one is not
> listed in the match table of the nxp-nci driver.
>
>  - is the driver missing for the so called NXP NPC300 ?
>  - should the NXP1001 matching string to be added to nxp-nci?
>  - is my firmware sending me garbage ?
>
> Thanks in advance for any input
>

[ CC Andy ]

Hi Daniel,

I was able to get a NXP NPC300 NFC device run on Lenovo ThinkPad T470.

Look at the patchset "[PATCH v2 00/12] NFC: nxp-nci: clean up and
support new ID".
I have tested on top of Linux v5.1.1.

Here I have set...

scripts/config -m NFC_NCI -m NFC_NXP_NCI -m NFC_NXP_NCI_I2C -e
PINCTRL_SUNRISEPOINT

Please give this a try and report.

For details see the below references.

Thanks.

Regards,
- Sedat -

[1] https://patchwork.kernel.org/project/linux-wireless/list/?submitter=33142
[2] https://marc.info/?t=155740978400003&r=1&w=2
[3] https://marc.info/?t=155774435600001&r=1&w=2
_______________________________________________
Linux-nfc mailing list
Linux-nfc@lists.01.org
https://lists.01.org/mailman/listinfo/linux-nfc
