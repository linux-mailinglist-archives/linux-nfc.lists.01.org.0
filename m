Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F0D2FCD92
	for <lists+linux-nfc@lfdr.de>; Wed, 20 Jan 2021 10:54:33 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 47D32100EC1C4;
	Wed, 20 Jan 2021 01:54:32 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 08705100ED49F
	for <linux-nfc@lists.01.org>; Wed, 20 Jan 2021 01:54:30 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id x23so25288926lji.7
        for <linux-nfc@lists.01.org>; Wed, 20 Jan 2021 01:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1Dzgt9eOErv7DRncKnAq6YJRbBsHovoN+K2WQNL3Z+8=;
        b=i4L+8exRf8lZaHTBzZPCPFSzSc+e00vaZuS4BnMHCc5zLodWr1iZ3wAYs11U8kBWDx
         Ql6TFIOJbwSFm2uj9IBHnVmfV+wN94OZ2XezIkgDorrGD43fsxSJUUMQFhwHtM6zM670
         RBcCKg8s964NGEL+12NSQamZqWozbLnwsJmNTUrpm4HTrvgt29zioadEOhGUgScFoxI6
         XI8YR1CgfbPAxLAmq43FmO/1nkYF/Ycm3m+EkiKvV8mjlveoDtrBZqzoF5kSEdMYbooG
         xoypAOB2q3SaksfogjIGkMoLn0Ym0MkofVA2IqCZB6MEfHfKi8ynpRDAZNt6oK1fbLeQ
         J+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1Dzgt9eOErv7DRncKnAq6YJRbBsHovoN+K2WQNL3Z+8=;
        b=nhneSnE4sflQvBytt5NU/JFGDiF+5AxbJYNq7oGLhabQMU/xv+H/zs99ksPC/BHIkl
         L/ZFg+yvdZ8H+U9NKtlre2nfo1Nc0L2rrUzlxUp+PebSg9JLWyZdVGMF44WplmFZbAB3
         UwhsP0K42XD79YJV7/qz7kel1koBFxqwo4l3FQ6sVfFkwpjNqx3cxWxWxOqScYAdtPpX
         FiyT5lsaWQRIAbQpZTkaXD4ytYJ0ki+N2NcjLUP3MdUxel+KFxZGxlwz7vkpjLXFaxh5
         5xrjJPmUhm8DUcVUvIPlXBpnQVrEaNqz6414KwkMJSr6zYVcX9IdorDhFvpIJ/9+HSHK
         5q3g==
X-Gm-Message-State: AOAM530oWG3PpoSOp4VxCOG5F0yl2O10qAFNnZzTmXIkaKSmYjqlkRYB
	A4RFqgDoVknX28hYbPQthf2DouGjOilcNkk2EPCyIuyd
X-Google-Smtp-Source: ABdhPJwvMiO84gkALjBZYV/Z8117B5Fi5UzzquECd8v/xmJfuxLrV4PrxacoLeKawiqrEkSVrrKWWYw6Pxw4PasRCAU=
X-Received: by 2002:a2e:bc1e:: with SMTP id b30mr4263478ljf.18.1611136468818;
 Wed, 20 Jan 2021 01:54:28 -0800 (PST)
MIME-Version: 1.0
References: <20210118205522.317087-1-bongsu.jeon@samsung.com> <161110440860.4771.13780876306648585886.git-patchwork-notify@kernel.org>
In-Reply-To: <161110440860.4771.13780876306648585886.git-patchwork-notify@kernel.org>
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
Date: Wed, 20 Jan 2021 18:54:17 +0900
Message-ID: <CACwDmQBZ-LVursCYmtngyv3yFCQ9_Jkip03VZ8cd1auNu86V8A@mail.gmail.com>
To: patchwork-bot+netdevbpf@kernel.org
Message-ID-Hash: KPCUTC7D52EQF26MFSIMSBMBDLCNZ3AI
X-Message-ID-Hash: KPCUTC7D52EQF26MFSIMSBMBDLCNZ3AI
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: davem@davemloft.net, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nfc@lists.01.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net] net: nfc: nci: fix the wrong NCI_CORE_INIT parameters
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/KPCUTC7D52EQF26MFSIMSBMBDLCNZ3AI/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 20, 2021 at 10:00 AM <patchwork-bot+netdevbpf@kernel.org> wrote:
>
> Hello:
>
> This patch was applied to netdev/net.git (refs/heads/master):
>
> On Tue, 19 Jan 2021 05:55:22 +0900 you wrote:
> > From: Bongsu Jeon <bongsu.jeon@samsung.com>
> >
> > Fix the code because NCI_CORE_INIT_CMD includes two parameters in NCI2.0
> > but there is no parameters in NCI1.x.
> >
> > Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> >
> > [...]
>
> Here is the summary with links:
>   - [net] net: nfc: nci: fix the wrong NCI_CORE_INIT parameters
>     https://git.kernel.org/netdev/net/c/4964e5a1e080
>
> You are awesome, thank you!
> --
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html
>
>

Could you merge this patch to net-next repo??
NCI selftest that i will send will fail if this patch isn't merged.
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
