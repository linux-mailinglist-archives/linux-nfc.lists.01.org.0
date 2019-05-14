Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DBA1C374
	for <lists+linux-nfc@lfdr.de>; Tue, 14 May 2019 08:52:31 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id CDE81212735AE;
	Mon, 13 May 2019 23:52:29 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id A884321CB74A4
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 23:52:28 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id j187so1572536wma.1
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 23:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=14dzsudd7sUG7BDz0u24Ld3Jw0VzpoPG2X+vAzwuqFI=;
 b=KfIqLBxaLtPT3uoPIWV4yFjvWn2nHfOMnS2JRrh6NXsh9oQr71hQwzo4v/Hd9qdRsE
 qkrdP1zeE4iaFvo9BQjvlQLA7JwfBWYDSEMO9/GbbF9P58xD0cHgx4+ZsoFG5MMl/bVh
 sQ4bAch7wosDZcDou6pKhVL0cSFmcUPc4PgCYNaL7LkB23dAJS0ZX/ydGl+8wtkdLM7e
 sGOW4UvGvAr7nMA1LJOQymPjPEClwd/O+ERXZIbymrtTAaAxiCmYEsu68x20m/YBs0vY
 DB8wgEjRZOYOxuInS6lVmxWZmLG0Gc2yiH3QugFiVfRO56m2v9AzHDeiNKiRauDGLmnv
 kY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=14dzsudd7sUG7BDz0u24Ld3Jw0VzpoPG2X+vAzwuqFI=;
 b=YEpiFOrRNf11uLMwWsV4z1+wdLi9kh+maLu4e6j7C3i18qqMO8nmsRs4TkJGABl/kf
 IlNhidmaPDXCXNeHuz6hNLOPEdJ/NriC9u5UjNa0JN71/7obYy3MQJmp3QGv0nT5OjmL
 fHzv+NlqAqmAhqClfH3+Ukrju0XztkPk8gFsORfoQafRgqKn56i7QScOWCqHhr55oqqO
 RU3e6mIBiXtrobQIsTHlXF66PDF/Zl5d+j4bxITT6Ipc5tD/CcGkwVhk/BybKZQ7qhdU
 8upg3EHrY5MKrkXSTFdChVmKOPoO8VTaAoxMsQsVelPNzWbUxQAmNgnAnGbQwGwFy9Nt
 +3Rw==
X-Gm-Message-State: APjAAAVrhQh9tAHOQxh1LP0VEQtqFV5SCV3bvo625OeuXthaxAAk6oX+
 FN2g/ANhyaiYJQwWVcon7sci+sLPAcvF93qXjkc=
X-Google-Smtp-Source: APXvYqzKAhLbEREeLmH4GBlgzj6nhFtkF9oWCbxqjCodtODNXMWteVag4NDMVuacRs8icydo+xZwvtpRHMOosnthjZ4=
X-Received: by 2002:a1c:385:: with SMTP id 127mr6999044wmd.109.1557816746990; 
 Mon, 13 May 2019 23:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <c2d0d19f-d814-8f41-4860-77b9cc7f9d26@linaro.org>
 <CA+icZUVz7sB6hv4fhL_rqhR_D8RePBJFXk1PaUy5tMw2z4xC_Q@mail.gmail.com>
 <5ae87449-83a1-ecce-c72c-b4742c507497@linaro.org>
In-Reply-To: <5ae87449-83a1-ecce-c72c-b4742c507497@linaro.org>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 14 May 2019 08:52:15 +0200
Message-ID: <CA+icZUWLBjTtcFS0Fo8M5gSb90GbEUpetUgwr3fy=NxGAVqCyw@mail.gmail.com>
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

On Tue, May 14, 2019 at 8:43 AM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 13/05/2019 22:15, Sedat Dilek wrote:
> > On Wed, Dec 5, 2018 at 8:38 AM Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> >>
> >>
> >> Hi,
> >>
> >> the discussion reference is on github [1].
> >>
> >> I acquired a Lenovo x280 with a NFC chip. It is unclear what chip is it
> >> really, it is called NXP NPC300 which could be a PN7xxx chip range.
> >>
> >> A hacked version of an old deprecated out-of-tree module made the PN5xxx
> >> to work with my laptop but I suspect it brought some subtle instability
> >> on my system.
> >>
> >> Now it would be nice to have this correctly supported upstream.
> >>
> >> I dumped the ACPI DSDT table and got the id NXP1001. This one is not
> >> listed in the match table of the nxp-nci driver.
> >>
> >>  - is the driver missing for the so called NXP NPC300 ?
> >>  - should the NXP1001 matching string to be added to nxp-nci?
> >>  - is my firmware sending me garbage ?
> >>
> >> Thanks in advance for any input
> >>
> >
> > [ CC Andy ]
> >
> > Hi Daniel,
> >
> > I was able to get a NXP NPC300 NFC device run on Lenovo ThinkPad T470.
> >
> > Look at the patchset "[PATCH v2 00/12] NFC: nxp-nci: clean up and
> > support new ID".
> > I have tested on top of Linux v5.1.1.
>
> Hi Sedat,
>
> yes, I have them see. Thanks for letting me know.
>
> > Here I have set...
> >
> > scripts/config -m NFC_NCI -m NFC_NXP_NCI -m NFC_NXP_NCI_I2C -e
> > PINCTRL_SUNRISEPOINT
> >
> > Please give this a try and report.
>
> My laptop is the first one I have with a NFC reader, so I'm not used to
> test this as it was not working yet.
>
> I booted the machine with a 5.1.1, the series applied on top, and the
> config options set as mentioned above.
>
> The nxp-nci kernel module is loaded and neard is installed.
>
> I used the sniffing tool with the command libnfc -d nfc0 -n but when
> passing my NFC devices on the laptop's NFC mark, nothing happens.
>
> Is that correct?
>

Hi Daniel,

I am new to the topic Linux NFC.

I have installed neard (daemon) v0.16 and neard-tools from Debian/buster AMD64.

root@iniza:~# systemctl is-active neard.service
active

root@iniza:~# nfctool --list
nfc0:
          Tags: [ ]
          Devices: [ ]
          Protocols: [ Felica MIFARE Jewel ISO-DEP NFC-DEP ]
          Powered: No
          RF Mode: None
          lto: 150
          rw: 15
          miux: 2047

root@iniza:~# nfctool --poll -d nfc0
Start polling on nfc0 as initiator

...

Throwing my YubiKey Neo-5 NFC on my ThinkPad T470 NFC sticker shows me...

Targets found for nfc0
  Tags: [ tag0 ]
  Devices: [ ]

Hope that helps.

Regards,
- Sedat -
_______________________________________________
Linux-nfc mailing list
Linux-nfc@lists.01.org
https://lists.01.org/mailman/listinfo/linux-nfc
