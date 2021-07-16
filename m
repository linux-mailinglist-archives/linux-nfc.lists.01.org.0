Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0359F3CBBC1
	for <lists+linux-nfc@lfdr.de>; Fri, 16 Jul 2021 20:17:50 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id C7DF8100F2255;
	Fri, 16 Jul 2021 11:17:46 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 59273100F2250
	for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 11:17:45 -0700 (PDT)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 4B5A8408B7
	for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 18:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626459463;
	bh=iIUxpkpHlT/ujJv35mg4KveIs6ZMWhsNWrIIJdMLdVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=e1xwD4ESNvubQd7eM1pZkACw+zosSLTI7e2RcEuRoUnrY8ns1kl+lPEJuLrxSfuGQ
	 lp+gM0XGjBcCB1GoySZG/QmUUL1rUCCl5syG7ofuImax7frqOcxMu6QzBNLdQmcDgX
	 omOwpZSTkX3LGoHZnlEEqESx/kIscW4usm2nItLv3r9c62KHb3VEs8e5bG8W5h8oLI
	 TKZpkDl8+A5tEr5bK9ovRDQXePNGBs7ihrDqnAIyxeswhIPY66T8yealO2FbtjvOZe
	 V5l4LCIrsvPVJuS+SxV0RlEbgphICylifuA4zllrToscoxhbY2DOwPhcBBfo2kX0Pk
	 TMfknsS1YBF7g==
Received: by mail-ej1-f70.google.com with SMTP id t8-20020a1709063e48b0290501cd965554so3914733eji.8
        for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 11:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iIUxpkpHlT/ujJv35mg4KveIs6ZMWhsNWrIIJdMLdVY=;
        b=d1w4QtNqxwOZ1IhRxPyY3GoGsdXF41/bHaJuINg68VlYHZ9tddVdSGyto2aRS4qc1D
         6bRilWKWwdXphs1AeiB65GJeOngaTAYLLgBNkU33juH1QHj2lxqaU4O7EdHyVFd4Rqxl
         pXDbqzavBuFJqI1sjIJhGsr5BbpPfSSAINEB5qkKVHFm65iakM6hemNEku9YR2bDB3jW
         Wak9tD0atUbqiVSxq5uzylA529yxQj8fSIsaw5CskLkigdPByKQcaoHHRUV/VTcJl4Uf
         d4tEHtf06RuUQurfouLvnu7MXF72/ZsW71iWZqKpkZpvYBBfUyDn1T11UrvcI96YUqz3
         /vig==
X-Gm-Message-State: AOAM531IzVWeibsBRz7fMyJtxXYJ4tIBY1KXJJ9IP0YjLZZktne5jhz0
	iwvMRSsh9K7QdqopaiGy/haev3lFD9c7FM6XBIuSPuuPRQewXVsJQqGBws1iVJcArPtRsqhWhDx
	cVo/xSFDYPcQYzrAZxN6ecAknp+IU8DxMKenbH24+6Rjsxmrqsg==
X-Received: by 2002:a17:906:f104:: with SMTP id gv4mr13185829ejb.193.1626459463080;
        Fri, 16 Jul 2021 11:17:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7df1dhE7FzdafW/owwyXmM1zYUZ7HBRYCPlHWpeQXx6e8+gqubotkBQv3ZT/yzAAMRbSMDc4ayjjFEpa3Tx8=
X-Received: by 2002:a17:906:f104:: with SMTP id gv4mr13185805ejb.193.1626459462770;
 Fri, 16 Jul 2021 11:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210512144319.30852-1-krzysztof.kozlowski@canonical.com>
 <961dc9c5-0eb0-586c-5e70-b21ca2f8e6f3@linaro.org> <d498c949-3b1e-edaa-81ed-60573cfb6ee9@canonical.com>
 <20210512164952.GA222094@animalcreek.com> <df2ec154-79fa-af7b-d337-913ed4a0692e@canonical.com>
 <20210715183413.GB525255@animalcreek.com> <d996605f-020c-95c9-6ab4-cfb101cb3802@canonical.com>
 <20210716171513.GB590407@animalcreek.com>
In-Reply-To: <20210716171513.GB590407@animalcreek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date: Fri, 16 Jul 2021 20:17:31 +0200
Message-ID: <CA+Eumj7SPFXOMUGRxZqjG-0Jq_1EnWwh9Ny-a=+QsN8tfrrCwg@mail.gmail.com>
To: Mark Greer <mgreer@animalcreek.com>
Message-ID-Hash: LZ6E27HVM3ZO5Y262JDOM6OH67YWUWOY
X-Message-ID-Hash: LZ6E27HVM3ZO5Y262JDOM6OH67YWUWOY
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 1/2] MAINTAINERS: nfc: add Krzysztof Kozlowski as maintainer
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/LZ6E27HVM3ZO5Y262JDOM6OH67YWUWOY/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 16 Jul 2021 at 19:15, Mark Greer <mgreer@animalcreek.com> wrote:
> > I am happy to move entire development to github and keep kernel.org only
> > for releases till some distro packages notice the change. If Github,
> > then your linux-nfc looks indeed nicer.
>
> Okay, lets do that.  I'm the owner so I can give permissions to whoever
> needs them (e.g., you :).

Then please assign some to the account "krzk" on Github. Thanks!

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
