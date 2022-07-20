Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C19D57B8F9
	for <lists+linux-nfc@lfdr.de>; Wed, 20 Jul 2022 16:54:29 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 82399100EAB56;
	Wed, 20 Jul 2022 07:54:25 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::92b; helo=mail-ua1-x92b.google.com; envelope-from=mfaltesek@google.com; receiver=<UNKNOWN> 
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 0232B100EB349
	for <linux-nfc@lists.01.org>; Wed, 20 Jul 2022 07:54:22 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id l7so8096925ual.9
        for <linux-nfc@lists.01.org>; Wed, 20 Jul 2022 07:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=pRW51Zf8RzoluaRIPps/fzsMK5pZhkAW4XFwEonLMvw=;
        b=WiGwoKDNAEyBaub3ALOhsOfd8V1Tgkza8OJMERydOJCmZ4SPBYWl5LIlQuX7ywfnCU
         I3Hb1Joyb660f//GWck9lPLxB2cxJ21o5u7Jl9xGBNS2XfCwAnqqk5yeMAvX9zidy+kr
         aj3zERckGzNiyDk8T86GBc9WFnCJE1J/4gbw5IptkgJxFeD9Om+//q50EwPi79jF/8AV
         /8YTLcPvpy6CuJBCoOBO633GITuR+2PhDilJCjeSA5oL3fxiAWbc1/9unROkF1IghZis
         XstU0yK8SK5yTNWfoLE3blCDa7QI4CNQ9AV5Kfi9r6dMcdRqqLfHN33BG6mLpoUN6rLE
         BJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=pRW51Zf8RzoluaRIPps/fzsMK5pZhkAW4XFwEonLMvw=;
        b=P+LFkD/8BOkllnmyn7YnazBXM8jQVVNdQ5I1ImCm2DByYMqM6VyIPlqJrKFL5frCde
         d1oxfpiUiMaeyuDwOYPWtsYEwVuUJFKfjsHTYIwltZqfAlMq6/J9vt9dkpJ1EF/cSu72
         YOQGxpII2J2PAXxrKrIiqmYiYeVzYGC1HNuqI0/rBngF+fsWXVReFAFpExWJmTJaHMeF
         Idr8jrmZC2C8stFHLn5eVAEp0QBXilj7CiY166/9vU20ZGUSX8rxqUqjYvv69Wv+oxk+
         robJWAhckatXA8LKKlfl6glV9TMD04ImaEaFNKdLiucjP2SFupQ32H+f9r3D9KtpQO04
         BO2g==
X-Gm-Message-State: AJIora+XrB7u5lKF4JUeOv39oJICnQLCHrUy8GGFR+4nWT/XRJRcQ64O
	DueoIcLMouik2m5ckkdC5acnRWWF2YnOPN+90ivYQg==
X-Google-Smtp-Source: AGRyM1tMJIlVh+piYAR1gu3liiD2a2yD06tL01sT5b1NlAk+YutcH6h+FoabXhj/fEmuMGA7cgOG6qNwc9qAH5EJN18=
X-Received: by 2002:ab0:215a:0:b0:382:c57:ee13 with SMTP id
 t26-20020ab0215a000000b003820c57ee13mr14287948ual.68.1658328860989; Wed, 20
 Jul 2022 07:54:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220607025729.1673212-1-mfaltesek@google.com> <fc85ff14-70d6-0c3e-247d-eda2284a5f6b@oracle.com>
In-Reply-To: <fc85ff14-70d6-0c3e-247d-eda2284a5f6b@oracle.com>
From: Martin Faltesek <mfaltesek@google.com>
Date: Wed, 20 Jul 2022 08:53:44 -0600
Message-ID: <CAOiWkA_AcD_J1r1ncvmX8YswbMiS2fx5WySrYwvfdFE4qgk=hQ@mail.gmail.com>
To: Denis Efremov <denis.e.efremov@oracle.com>
Message-ID-Hash: LJFMNIBXWKJBVCY7TWB5FYAYFRS3ESKX
X-Message-ID-Hash: LJFMNIBXWKJBVCY7TWB5FYAYFRS3ESKX
X-MailFrom: mfaltesek@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, christophe.ricard@gmail.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <groeck@google.com>, jordy@pwning.systems, krzk@kernel.org, Martin Faltesek <martin.faltesek@gmail.com>, netdev@vger.kernel.org, linux-nfc@lists.01.org, William K Lin <wklin@google.com>, theflamefire89@gmail.com
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net v3 0/3] Split "nfc: st21nfca: Refactor EVT_TRANSACTION" into 3
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/LJFMNIBXWKJBVCY7TWB5FYAYFRS3ESKX/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 20, 2022 at 1:25 AM Denis Efremov
<denis.e.efremov@oracle.com> wrote:
>
> Hi,
>
> On 6/7/22 06:57, Martin Faltesek wrote:
> >
> > Martin Faltesek (3):
> >   nfc: st21nfca: fix incorrect validating logic in EVT_TRANSACTION
> >   nfc: st21nfca: fix memory leaks in EVT_TRANSACTION handling
> >   nfc: st21nfca: fix incorrect sizing calculations in EVT_TRANSACTION
> >
> >  drivers/nfc/st21nfca/se.c | 53 ++++++++++++++++++++++-----------------
> >  1 file changed, 30 insertions(+), 23 deletions(-)
>
>
> It looks like driver st-nci contains the same problems and all 3 fixes are
> also applicable to st_nci_hci_connectivity_event_received() function.
> At least I can see the memory leak
> https://elixir.bootlin.com/linux/v5.19-rc7/source/drivers/nfc/st-nci/se.c#L343
>
> Can you please double check the st-nci driver and send the same fixes to it?
> Reported-by: Denis Efremov <denis.e.efremov@oracle.com>

Will do.
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
