Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B00A2DA69F
	for <lists+linux-nfc@lfdr.de>; Tue, 15 Dec 2020 04:03:59 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id C8192100EC1EF;
	Mon, 14 Dec 2020 19:03:57 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::141; helo=mail-lf1-x141.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 5626E100EC1D7
	for <linux-nfc@lists.01.org>; Mon, 14 Dec 2020 19:03:56 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id o17so32635513lfg.4
        for <linux-nfc@lists.01.org>; Mon, 14 Dec 2020 19:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eG4n9xlHK+SC1LnsZtRhg9CmgC53883GCBz3X7IjH2k=;
        b=NfCR/RzNIhL9/8rUWxOMM1RKNx6qavE3Bpc1JyLwBn5wkEgkl4Y+FnLJiDqSs3f9j/
         tXexs/0wiINS7DTDeiTxy/CXROmShi8Jto6O5yVfAciOvEgvSLbseFxyq7RkVNEMgYyt
         FBJheKRgljUESdaGYCkiNGjYx1Rqwpcc8wSh1H/5ALTA6YqiLsmWkv3jvYagpXFBs6UG
         /zBIyp17ssnsAqKhnOJFTwNlWVWpoOrJFf83FoygJN8La9qe+JAEGRkxVrqeoAFALFoo
         TqgiRPSMpPjYkprH7DgFt2r7knsKyvj5g9oN0LYOEiOsOnteS0TG7And7C3BJQP8KlqR
         +sbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eG4n9xlHK+SC1LnsZtRhg9CmgC53883GCBz3X7IjH2k=;
        b=Mfnz2htDpt8NXtRnYfDe1BbV6eJIVJ4ytiE8hovzM7I4DBre4xhEW4GQqKp5IZIQLd
         48H/1O7yhtg4XTy1tIOCau2pZ0XENk5dThJ2YltNiLwDnjEvJC4UBssVO3gKzV5ft2mr
         Ph/YakXVpdBXEi42E6BbB8bcOp+aWsttB/o7BW8Lc6PzbxoWQvRl2/dgcs3TW02SkZUV
         YzlkgYodM1lZ+ohdWJfFFXiCILVsti6P7On6RpZV21iUhz4uiBXa7yqlR4CWrF59D4bn
         BAGsh2xXdGLRaA8Qh2ynwFGM4YXGPBL+lhMoL0h09sr2XlkUATSt0YsLSIBhUDo6gbOd
         JkGQ==
X-Gm-Message-State: AOAM5322PeerrmPrUpqgNCgcj+w2xhmuDbPs4RxxaMZCIkx4ou44gGet
	kCRutJa0O4kaRVQI0Wh7e2jPC57sOW+os7qK6XJT1on6
X-Google-Smtp-Source: ABdhPJwZ8B6BkRbU5hZNjNnCS2mYUbc9BKbp2oGlfkxy7IPbHqsJlcKUmNFOjAT2zleyHz+y0Dm9FS5ZdzSBwCY03k0=
X-Received: by 2002:a2e:90d6:: with SMTP id o22mr11848460ljg.56.1608001434542;
 Mon, 14 Dec 2020 19:03:54 -0800 (PST)
MIME-Version: 1.0
References: <20201214114658.27771-1-bongsu.jeon@samsung.com> <20201214160202.GD2493@kozik-lap>
In-Reply-To: <20201214160202.GD2493@kozik-lap>
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
Date: Tue, 15 Dec 2020 12:03:43 +0900
Message-ID: <CACwDmQCi83rNDEOMaGsDRx553DPUeCOmKiLZtzx5HHj2QdbL+w@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID-Hash: XBRZJNNHWBXGYLK4TTVQW2VCVHGXEYME
X-Message-ID-Hash: XBRZJNNHWBXGYLK4TTVQW2VCVHGXEYME
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next] nfc: s3fwrn5: Remove unused nci prop commands
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/XBRZJNNHWBXGYLK4TTVQW2VCVHGXEYME/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 15, 2020 at 1:02 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Dec 14, 2020 at 08:46:58PM +0900, Bongsu Jeon wrote:
> > From: Bongsu Jeon <bongsu.jeon@samsung.com>
> >
> > remove the unused nci prop commands that samsung driver doesn't use.
>
> Don't send patches one-by-one, but group them in a patchset.
>
> Previous comments apply here as well - NCI is acronym, start with
> capital letter.
>
> Best regards,
> Krzysztof
>
I will update the comments and send the patches in a series.
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
