Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C52E1B713
	for <lists+linux-nfc@lfdr.de>; Mon, 13 May 2019 15:33:09 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 68E39212735A2;
	Mon, 13 May 2019 06:33:07 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id 9742A21250C89
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 06:33:05 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id y3so4498571wmm.2
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 06:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=LNwFnYc3OiS4RD8IV8zCW5QU7k8ZZnL5AgwEDil8YnU=;
 b=Fq6NXYHOcGGEllYWmz80gGvjm4r0V3zvWdi7/vw3EXJCu13n3I54KpqUTr0VNkExsw
 Cyl/kx5Bijn/mgEaKTHPPSu1Rf5625NUcGaUOWOsilE5FQAvkzzsa5l6KA+6aa/fvLsa
 jDCm1Ds/J0KQO6daAikLKVKihjHuawaPun4l2aHpZy0a6YXgnFSX2E0jMGThEXV/6PXY
 aEV8tc6CZxqTQVqtryoDoe5wGIWpQQfqhUYBkkIHUmzDXpbRvHCty/r3tpKvk4zEcze7
 AuCsmoxaJFGj8owt1rL7xFVtfcKbPA6mWxONvaoDoJZoksJ7qYrSE895d9npOe/ABlbu
 /lvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=LNwFnYc3OiS4RD8IV8zCW5QU7k8ZZnL5AgwEDil8YnU=;
 b=A60NqBHttLjR6RTp2m929NSYrbGgf1to1wJMRetOrlGrdFdn3mC73hdMSNMEtdJ6il
 ug1IjilpzoJvA7UXsGSHNWDP0y/UMNGpV11qDiduSpfYWjNZr6hEbq7AbO1YSvDjah/g
 v20Mqc2Q/2sbhrSka651z94o+1J+Sh/lfHCDGQi45sPVRAq4eAH80wiDBze6fnq2d7MK
 pneyv3l11hdmjzb9CSWWkS+dQmQzXS5giE6x7EctgHIAI+6AbofEmHZ3g7aipOWbPMQA
 F5rg8bu1AjyiyvW/9xL/mgnMQbcZaO7J74JKfrNGtbAHztT+KzOw/iMUHc5LgsJO8Cbu
 dtDQ==
X-Gm-Message-State: APjAAAWc6wgr5GG63ncAbT1WTkj2/ztYSIYU8jM54AVawRxt1ARpqLU1
 C6MhUQP4yj9rBXdiO/kIei+LamexYFWZfN+HTeA=
X-Google-Smtp-Source: APXvYqy54cLvXoMtRWWCle62B31u78Ig2T5okZEODeV/BoukVMGuTqlCHqQLert6e3qnFd+KXh0zAAAOTFOZRMlW4hs=
X-Received: by 2002:a7b:cc12:: with SMTP id f18mr16137716wmh.40.1557754383835; 
 Mon, 13 May 2019 06:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUX+VNtk00YQnNYCnDeeH2Onq6s1vbdzYrv-OHf7q186Ww@mail.gmail.com>
 <154e3e74-38b5-850b-5993-295f9db8fe3c@intel.com>
 <CA+icZUWhBeup95PTP_k58xs8Lf2Ofqb0S_gkdBfbuc0-wdpF-w@mail.gmail.com>
 <06fbacb5-7739-1ca1-3bf4-8049a3ef019b@intel.com>
 <CA+icZUWJ0kZSqogg18LdP2YkNXk=_SNnT7-ufkd_Xp1ak7uchg@mail.gmail.com>
 <20190513095059.GN9224@smile.fi.intel.com>
 <CA+icZUWXSup0BfXNZXxcrAAbu-b9KCiBU++OkC+eFqacMrTwRg@mail.gmail.com>
 <20190513105745.GR9224@smile.fi.intel.com>
 <CA+icZUVDTx_ZUuOgHVDmg5_a4tgrRkPp880+0KPaRJ1d=zF5VQ@mail.gmail.com>
 <20190513124049.GT9224@smile.fi.intel.com>
In-Reply-To: <20190513124049.GT9224@smile.fi.intel.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 13 May 2019 15:32:52 +0200
Message-ID: <CA+icZUWU2OQszOYi1Jzp7yW+gB-TmhkBfmqaLAvy3WEOn9Rh8g@mail.gmail.com>
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

BTW, which Linux Kconfig setting are minimum?

scripts/config -m NFC_NCI -m NFC_NXP_NCI -m NFC_NXP_NCI_I2C

What about?

scripts/config -m NFC_NCI_SPI -m NFC_NCI_UART -m I2C_GPIO -m SPI_GPIO

Required?
Not needed?

- Sedat -
_______________________________________________
Linux-nfc mailing list
Linux-nfc@lists.01.org
https://lists.01.org/mailman/listinfo/linux-nfc
