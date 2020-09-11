Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D631D26591D
	for <lists+linux-nfc@lfdr.de>; Fri, 11 Sep 2020 08:09:07 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 02906143DA18F;
	Thu, 10 Sep 2020 23:09:06 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=krzk@kernel.org; receiver=<UNKNOWN> 
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id E5E4C143B2FD5
	for <linux-nfc@lists.01.org>; Thu, 10 Sep 2020 23:09:02 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 57A15221EC
	for <linux-nfc@lists.01.org>; Fri, 11 Sep 2020 06:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599804542;
	bh=XzzaqRgzegv5mShrfRiMAX/0bKqxPmMJr5VwppGGwEw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ihhcwtVWk6dTGE+h9Hne7tOOv/piw6eF0oxfxjMAzyMEi76bRAHq4wh9HTqPQlReu
	 FO4DNAMAN0P2AnALwa4Gh1oqnSXIPSd/9RwcY1PYk2Gwow+aZNT2gqUI10i7aXbuvY
	 5OWPFFLx+B4R2b1vfMPvfrbmYQJTsJGjSjDapPtk=
Received: by mail-ej1-f44.google.com with SMTP id i22so12197584eja.5
        for <linux-nfc@lists.01.org>; Thu, 10 Sep 2020 23:09:02 -0700 (PDT)
X-Gm-Message-State: AOAM530UcUCUVHDmqqznz+mPPi8mCnqOs7CZFWuhldRAzHNzBaCD0NoG
	XfI8e1zmBnzJ+gyv0eiWkuZEUjpvpvxxpKGub5w=
X-Google-Smtp-Source: ABdhPJwZG4xklZq441Eewbql9ntW9zPs1xfQjq9o+LVzvNLUp2kxK3mUNknnSYBDmPX56LMLO75nMFLMG4xyFDPtcm4=
X-Received: by 2002:a17:906:8401:: with SMTP id n1mr505360ejx.215.1599804540886;
 Thu, 10 Sep 2020 23:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200910161219.6237-1-krzk@kernel.org> <20200910.152235.1512682061673845419.davem@davemloft.net>
In-Reply-To: <20200910.152235.1512682061673845419.davem@davemloft.net>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 11 Sep 2020 08:08:49 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcFfxY2EU7-_gPQyhp9m_dVed6qxgpZzD4kazEkjDeXOw@mail.gmail.com>
Message-ID: <CAJKOXPcFfxY2EU7-_gPQyhp9m_dVed6qxgpZzD4kazEkjDeXOw@mail.gmail.com>
To: David Miller <davem@davemloft.net>
Message-ID-Hash: PCECEH6K2J3OQEXCDQTCXF6MEA37UC7F
X-Message-ID-Hash: PCECEH6K2J3OQEXCDQTCXF6MEA37UC7F
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: kuba@kernel.org, robh+dt@kernel.org, kgene@kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-nfc@lists.01.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v3 0/8] nfc: s3fwrn5: Few cleanups
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/PCECEH6K2J3OQEXCDQTCXF6MEA37UC7F/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 11 Sep 2020 at 00:22, David Miller <davem@davemloft.net> wrote:
>
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Date: Thu, 10 Sep 2020 18:12:11 +0200
>
> > Changes since v2:
> > 1. Fix dtschema ID after rename (patch 1/8).
> > 2. Apply patch 9/9 (defconfig change).
> >
> > Changes since v1:
> > 1. Rename dtschema file and add additionalProperties:false, as Rob
> >    suggested,
> > 2. Add Marek's tested-by,
> > 3. New patches: #4, #5, #6, #7 and #9.
>
> Seires applied to net-next, thanks.

Thanks. The DTS should go separate - via samsung-soc/arm-soc tree.
However if it is too late, then no problem.

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
