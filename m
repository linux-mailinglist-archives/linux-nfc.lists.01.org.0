Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0696D1BE2B
	for <lists+linux-nfc@lfdr.de>; Mon, 13 May 2019 21:46:47 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 5A9D6212741E0;
	Mon, 13 May 2019 12:46:45 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::442; helo=mail-wr1-x442.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id D9E1921244A75
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 12:46:43 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id c5so16576913wrs.11
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 12:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=Bh7/Cp4HTA07jQMfA3jNUPz8gtLY1xgAbfjysY3NW8Q=;
 b=kdf5XvSehlwDU216QTJAwA/+u8M5VM9DU/WJVZTlTo3lEM8VDZZYlVynTcza4YS23c
 SGAZBgNXr6jJE7gKmds3myE4ZU7DdORSgxujWD9QL4tvVon2ICqSsVsjkMMGgA5QjMt5
 BOq637sEX1knoFO/k8sJs9dVHkIKl+uFTkbwYbnfc+VrNPTPT9NNBRdncyS04GhPPmIh
 nsc6UJQRDuPOYTMSo3O17qhWgkkIZXs4UpleXxzQdRfskaZ4EiYBXofhl2pJfw5jmZ4X
 deISew27UHRpzeCO6UlLOH7Gyg94AfbaXgTv79tCemJUGb+FonOdPNk1K2RfkerxJcUL
 33Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=Bh7/Cp4HTA07jQMfA3jNUPz8gtLY1xgAbfjysY3NW8Q=;
 b=r9w28P3705PM8HKE/Zk3lZazjBpVxLVdHa8S/HkEeSC+VoC7HGQhbc/34oaQw3ntSk
 GFcyYjfuoPMSVKYYc3athnAw+axXxf0yVvHbyQbiYle8EKooUE8HbxUXdi2zbqUzdask
 bSbSO8ZvmNSjf2jymFEmr3pQhSRvMJUZR2ju7BLYqLCr+WCr0oBgOdCxaZk5awnSLELG
 EsKhZ+RBtw6lANc0j4/Qiw4Jw0XE0f6NxT+Q30fwV3SmtMZ/NX3vugn+SQY7zu/oaxSc
 466KLlOisDMTAGltMsxemwZ5TcQ9cmMx/jY2u1ILwz6j3cM8vxbJVFPIx8mU+HwAdomO
 bBJA==
X-Gm-Message-State: APjAAAUiPgjEyGO6rbX53NDtTManOu8+3EH7TjeS+OHq5Zht+tN3txoH
 ZCTUNIrPwACn48SCTmrfuNbT9f1JDsqV/S+xFcg=
X-Google-Smtp-Source: APXvYqx5F5iy5/YYEh79h2rJPNvjbHn8yneZdgKuXWRi2e8tS12GZqmtasGGkS+Wj7r+X8SXDtVuA4TfjuZfuu65ngU=
X-Received: by 2002:a5d:4692:: with SMTP id u18mr6813840wrq.285.1557776801173; 
 Mon, 13 May 2019 12:46:41 -0700 (PDT)
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
Date: Mon, 13 May 2019 21:46:29 +0200
Message-ID: <CA+icZUUsutHt1NXLNFd17J3QK-LtFCuUUEw4qqp9urJ++dDaKA@mail.gmail.com>
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

I played a bit with the Kconfigs...

scripts/config -m NFC_NCI -m NFC_NXP_NCI -m NFC_NXP_NCI_I2C

...is sufficient.

I don't know which CONFIG_PINCTRL_XXX is needed.

- Sedat -
_______________________________________________
Linux-nfc mailing list
Linux-nfc@lists.01.org
https://lists.01.org/mailman/listinfo/linux-nfc
