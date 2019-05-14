Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B03A1C840
	for <lists+linux-nfc@lfdr.de>; Tue, 14 May 2019 14:12:15 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id DC1872125ADEB;
	Tue, 14 May 2019 05:12:13 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id AAE7221250448
 for <linux-nfc@lists.01.org>; Tue, 14 May 2019 05:12:12 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id f8so1109682wrt.1
 for <linux-nfc@lists.01.org>; Tue, 14 May 2019 05:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=LU/y2PLG6rVuITKR4Wa/pGlYz/fiYSoIqXWFjQFGsvM=;
 b=MGK5RXrU+bPs8RahQSCBCWyWmiTRMj5W36Vss6v8eMXEeGPh8vooAjouUVsTTShgqW
 /D6KI8iXfBMp5Pkb/HF5BSMQKVvNH2A1Xo1vDgPvG3HqoULDLmlcEHL6VFpBgNppUpGx
 313TizLO2n3yz29rb6TQs3H+OMjQoCYdSlVIRPuiD7892pQSrlVNFZiDeVNWrDFU6vRZ
 pCsgQKBhUxqDckCSZqdsbhzFZ1VXjWv8quBjHM/29NLe8TbxX4Ne3W+YHFTlS3a104F6
 JoOci2GVwadh92DnuKOJzXRffotkB2hOBNY0HVVuaV5TvclYT9MaRmhYigIDUETTO6od
 RgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=LU/y2PLG6rVuITKR4Wa/pGlYz/fiYSoIqXWFjQFGsvM=;
 b=Nf+ufHXTVmbzAua0kCq/76Tu4SF1/VIhbL4WSfgfnj2m/7yyd0EAF9GO4fqVhF4RqY
 3NbIMPNSiLGrfBJvJS6wNLTy2Kgf6VV497xBItgmLXCn04fGiW0mmRx47TbEBedm6fBc
 DIOiFHEGiqdow+2YUAwTPHjRoouKd+b/QhYSBkCqRwYiANnA4SJs6Gje1JMr5B3RulrQ
 IH/WA6p3+rg7G9fZO6OWKULLPaNxjRxkS1xkAIw6kxxmZYCYEACxQo7Jl54mninViWyq
 uepz32W09SoV9q+Bjz8Q2CGGU4C3lAQ1+kaQvm/IlGKe6zGpCv/7ZQONXsHRGd1U5W8z
 D+lQ==
X-Gm-Message-State: APjAAAWCbo7vXWN+00wz/mUgUH3ALkd3wuuqKLH3PcqoYdVw7/XfeeLF
 QVZc3pHJkYKum4imad25TMuEYmVLabGGUokWJQiLgSL+hDA=
X-Google-Smtp-Source: APXvYqy7ZnnsvJB/JkNl3MLE2nsysLUbcMDHOyT+lseiBsAIqoDUZpxZ4XadbtMObROThQhixq00rJqkn3dxMhaC/PM=
X-Received: by 2002:a5d:4692:: with SMTP id u18mr9628728wrq.285.1557835931138; 
 Tue, 14 May 2019 05:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190513104358.59716-1-andriy.shevchenko@linux.intel.com>
 <CA+icZUVn9tHQ3Zug0u2scbvGFfrLag_WYdzs9FCBJsGJ4bhuzw@mail.gmail.com>
 <20190514100328.GB9224@smile.fi.intel.com>
In-Reply-To: <20190514100328.GB9224@smile.fi.intel.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 14 May 2019 14:12:00 +0200
Message-ID: <CA+icZUXS1eLAndPD=Fk=HwW+P3YrZq+enFO5aEvyixotXdrTvg@mail.gmail.com>
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

On Tue, May 14, 2019 at 12:03 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, May 13, 2019 at 09:48:15PM +0200, Sedat Dilek wrote:
> > On Mon, May 13, 2019 at 12:44 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
>
> > Is it possible to have an info in dmesg log when nxp-nci_i2c kernel
> > module is loaded?
>
> We have 'initcall_debug' for such purposes.
>

Thanks.

That's nice for retrieving helpful informations, especially the proble
line (see below).

Unload nxp_nci_i2c module...

[  277.362813] NET: Unregistered protocol family 39

...and reload nxp_nci_i2c module...

[  291.640491] calling  nfc_init+0x0/0x8e [nfc] @ 2998
[  291.640499] nfc: nfc_init: NFC Core ver 0.1
[  291.640603] NET: Registered protocol family 39
[  291.640651] initcall nfc_init+0x0/0x8e [nfc] returned 0 after 111 usecs
[  291.653179] calling  nxp_nci_i2c_driver_init+0x0/0x1000 [nxp_nci_i2c] @ 2998
[  291.669584] probe of i2c-NXP1001:00 returned 1 after 16364 usecs
[  291.669841] initcall nxp_nci_i2c_driver_init+0x0/0x1000
[nxp_nci_i2c] returned 0 after 16244 usecs

What I mean is (here: btrfs and vboxdrv built as modules)...

[   21.285569] Btrfs loaded, crc32c=crc32c-intel
[   28.823902] vboxdrv: Successfully loaded version 6.0.6_Debian
(interface 0x00290008)

- Sedat -
_______________________________________________
Linux-nfc mailing list
Linux-nfc@lists.01.org
https://lists.01.org/mailman/listinfo/linux-nfc
