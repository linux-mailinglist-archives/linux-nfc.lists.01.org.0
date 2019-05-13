Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB121B542
	for <lists+linux-nfc@lfdr.de>; Mon, 13 May 2019 13:50:17 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 3C90621268F8A;
	Mon, 13 May 2019 04:50:15 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id A3A9421237ACD
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 04:50:13 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id n25so13315413wmk.4
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 04:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=8Iv1H9IVtWYDs79W1H1Cik2yB+/Wcr66be8hSM8L1w0=;
 b=MGnqeZDsgS1O3xxWJrkluSjw+DHoHLVg+6MAiVIG6ipY0E9uHwEGS6zosM11E961pf
 tzRRjnvtU/Kt88uDapU/lE/aeqp2HtOuczNsJ+vWBW/ZimZoO4mnTvQtlUgLdoxDTEjR
 ryn52JHGdrr1KO3gbEdnC5GNihDkh+Tx7Sfb0m9v02jVjxEtZwTV1JgrXHe1djwPSCiF
 OQLvbuTG8vBI0O1Z7DjerF4E1AlyzCSJSMF4rxrMx+lhJ8fCjuBq4maO/S4lmEr3JVEm
 rRDV5Aw/y0U4aE+UoGYasBKTwdekSjUcMWGuJ4DlHZyTxc0DZkpxcqEI9fgiUU2B+nNd
 mILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=8Iv1H9IVtWYDs79W1H1Cik2yB+/Wcr66be8hSM8L1w0=;
 b=bhslePzPxpMmp7EWcooAAv1TayDh1DLjL1zNM1zuMFjSxliAF2JkY/iNoc3pf5L3gz
 TamMrS0x38pLtSh+3Yhai5NHNF/JfyCM3xOo5ro0VnD/PZ3n+sqjCnIGdunWzPLlyzG7
 RbFRx8PeQA8ADre9iqxc7yWlE1+Keh3xSrYDhqzXCWcALw1NkAU3OiwsI8g7aqasw1Xi
 6vXQURYvPwboUv3zwU2pkrAgN4XqA7NtAy8PVHKGvD4eqxXul7RgrKJzPpAvayZUP61w
 vAVp1hKFASzSLwT+4MxGN6vk/F40mPr0b303frIT6Yhwh9AbzY6thHCGS0/ALlivUXr4
 gbeQ==
X-Gm-Message-State: APjAAAVCGMsg5aJoS3o7C+IAZvvaTY+kL73zHuTgNVfU49UkZn4ytciR
 ZvELJhukH396cHvZ5hozmyTVV37cx+noJjTNPsU=
X-Google-Smtp-Source: APXvYqyotmCBEy1JptG9GAIy5wK3/0jIikJZpXH4ntVKtn25K+YO2Fe2hBZSF1HFiHC5WFGyTAvN2ChUpuicu/NgIbY=
X-Received: by 2002:a1c:f606:: with SMTP id w6mr14387665wmc.130.1557748212005; 
 Mon, 13 May 2019 04:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUX+VNtk00YQnNYCnDeeH2Onq6s1vbdzYrv-OHf7q186Ww@mail.gmail.com>
 <154e3e74-38b5-850b-5993-295f9db8fe3c@intel.com>
 <CA+icZUWhBeup95PTP_k58xs8Lf2Ofqb0S_gkdBfbuc0-wdpF-w@mail.gmail.com>
 <06fbacb5-7739-1ca1-3bf4-8049a3ef019b@intel.com>
 <CA+icZUWJ0kZSqogg18LdP2YkNXk=_SNnT7-ufkd_Xp1ak7uchg@mail.gmail.com>
 <2b1bd56f-8797-fb90-e2af-218edaedd089@intel.com>
 <CA+icZUVMjCWwuC-ee1-+EPU6+mYqFZ7w4ai4t4EJcrsvZ2_BYg@mail.gmail.com>
 <3b7065a2-694f-63bf-fba3-a1641a03ea76@intel.com>
In-Reply-To: <3b7065a2-694f-63bf-fba3-a1641a03ea76@intel.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 13 May 2019 13:50:00 +0200
Message-ID: <CA+icZUVJbr_GLCccZQ+h8z+cSFj6hBAaywb97=s8SvnR6AbOVA@mail.gmail.com>
To: Oleg Zhurakivskyy <oleg.zhurakivskyy@intel.com>
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-wireless@vger.kernel.org, linux-nfc@lists.01.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-nfc-bounces@lists.01.org
Sender: "Linux-nfc" <linux-nfc-bounces@lists.01.org>

On Mon, May 13, 2019 at 1:28 PM Oleg Zhurakivskyy
<oleg.zhurakivskyy@intel.com> wrote:
>
>
> Hi Sedat, Andy,
>
> Andy, thanks a lot for extending and cleaning that up.
>
> > Unsure, why the pn544_i2c NFC driver shipped with the Linux v5.1.1
> does not work.
>
> I briefly looked into drivers/nfc/pn544, that seems like an HCI based chip (as opposed to NCI based PN547).
>
> It might be that changes that Andy posted are already sufficient for PN547 to just work with neard (if I am not missing anything).
>
> # sudo apt-get install neard neard-tools
> # man nfctool
>

With the nxp-pn5xx (plus acpi support) and running the nfcDemoApp
demo-app I saw this in the logs...

$ grep PN548 nfcDemoApp-poll.txt
NxpHal:     phNxpNciHal_deriveChipType Hw Version (0x68) Not Found:
Setting Default Chip Type : PN548C2
NxpHal:     phNxpNciHal_deriveChipType NxpNci > Product : PN548C2

- Sedat -
_______________________________________________
Linux-nfc mailing list
Linux-nfc@lists.01.org
https://lists.01.org/mailman/listinfo/linux-nfc
