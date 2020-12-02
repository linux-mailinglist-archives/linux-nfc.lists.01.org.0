Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 242C82CC96D
	for <lists+linux-nfc@lfdr.de>; Wed,  2 Dec 2020 23:17:20 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id CC0AA100EBB88;
	Wed,  2 Dec 2020 14:17:18 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::144; helo=mail-lf1-x144.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 6178E100EF272
	for <linux-nfc@lists.01.org>; Wed,  2 Dec 2020 14:17:11 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id d8so7260571lfa.1
        for <linux-nfc@lists.01.org>; Wed, 02 Dec 2020 14:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+8RFjtKUiIjNnb5VO+rcGuBrmv97T7eSoiGm8pbdxuA=;
        b=kPH0A5Lwx1OV8ztUGsOh6sE0boMbEMNwgz+Z54Ddw27NRYo7je4wvbFtPgDXgMMuW9
         eoUpmYf6rCiWkn/RfpGWeroVmoTagqbxoYw9Od0ombcCsthN41c9Q1F6Ap8LG0m9fpZg
         00gmtsAua5pz9UVZvbomNnW8zOJVCh11vH3/lMWz7Vbl8SQEIu2gvTMovNL/OnJB5zWo
         LBHS4fHI3tTug8HuTMglpIaQb4VFC3mxUuGhVht+B8QU+WqiJ5Hqz98HhWN45qOCz9Nk
         mX8FHgBvH/ny9ulomdvwDKQEAmpQcrrwWVq0jmuEFbuC9g4vLwB4uPx7eFUwztDy127n
         rU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+8RFjtKUiIjNnb5VO+rcGuBrmv97T7eSoiGm8pbdxuA=;
        b=KoAUj0kaJ+sWOp3PBCSRTqjXW4pLrBFYTkOxoMQr6OeenBIsbl4/RfBIg1P1eqeE33
         w3lKXsheuAhmIyDh49rS9Hz0jk8UurZXiWulLpEUpH0ylNBRfk7WUXVC20OcrhvM6Avo
         xPO2Gp6em32IqiQeq6r+817XmQL4EDpeGKpBln97Qsl2UUxpcD9TS8Syupt95FMz4cTU
         F8LCNwEKq5gj1j8O+WaA9HoOHQ4Aqe9gIeD+eFJMc4it9XdSy9jhNcaWMmS6bX7ZPND3
         okWK7ugfIPxifB9sG6asmWvne2sw4IuzUUT2CKsUhKpddhtkareDxHGU9R+OntdxN1qs
         ZaMw==
X-Gm-Message-State: AOAM533UZh/U5LkOkcpzIT83sczU8hfJR+pMXEL1QarXcbJrCtnnPZJ8
	TEWewG1TsEBmRy+kotSuCTVt+upPvgPGKwkbd+8=
X-Google-Smtp-Source: ABdhPJzXPlem96N8CGl+5TGHZdaobIpGTmbeYXJ8t4Vz46E3a44IVnJ1GfUmsaQtj0yryhT0CNzM53/t86XIaLdhfqk=
X-Received: by 2002:ac2:5e91:: with SMTP id b17mr82021lfq.442.1606947410190;
 Wed, 02 Dec 2020 14:16:50 -0800 (PST)
MIME-Version: 1.0
References: <1606909661-3814-1-git-send-email-bongsu.jeon@samsung.com>
 <1606909661-3814-2-git-send-email-bongsu.jeon@samsung.com> <20201202171638.GA2778@kozik-lap>
In-Reply-To: <20201202171638.GA2778@kozik-lap>
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
Date: Thu, 3 Dec 2020 07:16:38 +0900
Message-ID: <CACwDmQD8dFCd2u=BnL8VrzQ=NuPYA9z44uBJsKSaUN5yR4R8Mw@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID-Hash: QFC6HHPODIT4YOKHCSKT5EII4SNLBOXA
X-Message-ID-Hash: QFC6HHPODIT4YOKHCSKT5EII4SNLBOXA
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v5 net-next 1/4] dt-bindings: net: nfc: s3fwrn5: Support a UART interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/QFC6HHPODIT4YOKHCSKT5EII4SNLBOXA/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 3, 2020 at 2:16 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Wed, Dec 02, 2020 at 08:47:38PM +0900, Bongsu Jeon wrote:
> > From: Bongsu Jeon <bongsu.jeon@samsung.com>
> >
> > Since S3FWRN82 NFC Chip, The UART interface can be used.
> > S3FWRN82 supports I2C and UART interface.
> >
> > Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> > ---
> >  .../bindings/net/nfc/samsung,s3fwrn5.yaml          | 31 +++++++++++++++++++---
> >  1 file changed, 28 insertions(+), 3 deletions(-)
> >
>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> Best regards,
> Krzysztof

Thanks a lot for advising and reviewing my patches.
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
