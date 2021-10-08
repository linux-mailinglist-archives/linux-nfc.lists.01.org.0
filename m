Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEE342678D
	for <lists+linux-nfc@lfdr.de>; Fri,  8 Oct 2021 12:18:54 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 8D4C8100EB83C;
	Fri,  8 Oct 2021 03:18:52 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 55904100EB83A
	for <linux-nfc@lists.01.org>; Fri,  8 Oct 2021 03:18:50 -0700 (PDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 530B63FFF0
	for <linux-nfc@lists.01.org>; Fri,  8 Oct 2021 10:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633688328;
	bh=8OszAYwmyRLKjqkt/vzBzk84xsQhgfNIYVQxorJQ0FE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=kUX2/IOU7O94IaD4MR1ZY6nZxK/OYKykJUA3tnlDQqtYIBtUiVqV8FcyVo2BOLe/f
	 NbS4QKmFIDGqNYNJF37g2PzVUBIr9ZOaVgFrQMQfoHS093oCXJSp21jbWuNdBxQjbR
	 rZL4VEflMxQM3om5UzBcgx+Ra0j0c0F6+IEpVuGcnfD00y4qaEUn7su1r0FkS088v5
	 6USMX2F3U1qtLtO+efxlFH9mQL1a/O2m8jx1fYwWw6N9iUtflF4NHUzpFd3YZm5BX5
	 NWC/kmSsbbnWHkb5L0XOvPfrhv2q9y4LrRFV5+Y8EJwm5GQ8C4MkqEuqS4VONpze4a
	 5KDW1/L7oPUoA==
Received: by mail-ed1-f69.google.com with SMTP id c7-20020a05640227c700b003d27f41f1d4so8707927ede.16
        for <linux-nfc@lists.01.org>; Fri, 08 Oct 2021 03:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8OszAYwmyRLKjqkt/vzBzk84xsQhgfNIYVQxorJQ0FE=;
        b=NE+f1lG9AM7N46pepV7TVEJcNwivW6KISzKwR62bt+0J0ucZUZCyD11BGLYZEYKWzL
         9eZlfAA9zbMI60wQnbDckLeriCfzAwLU/izHGSKMlrOJEc3juX+/PUIBMECN8nsTjCz3
         xN7dWcDNGPYmcO6rz98s4qWgR6UAK7ytH3NOHcTd/UhEPzz88/H2exGMQ3stYMpW6FaG
         BXpnxP2JGVk54xs9EPKkCNtRDQ6gfkBA1U9r6oEoqlJBMnSwcIr1HugpXEVYTbY1OPT2
         9ZQlGnlZmGC4QsJq8DhtpCOndrZxZRgnBO55SiA2E1PWhAxq2JKIDPQ7PHTg9v6KHAkZ
         RsxA==
X-Gm-Message-State: AOAM5339eczNk8QQkKMnXxxL5iEMWp3Syui7bVYy3JEbO1ZRX7HBI+8o
	UYpzRA42DkCyuMRfnsznOk6AIIy6EXwBfP8HYQQ4L80YRbCdZX2kMoJTUZszLt7C01HiyChHSNV
	IhYT1Hy3FQ0YB2VbZIktY9rZ2j+WEcNwWcmyNk9Q3Ch4HtFFwTw==
X-Received: by 2002:a05:6402:21eb:: with SMTP id ce11mr13601308edb.153.1633688328110;
        Fri, 08 Oct 2021 03:18:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7o7l2UNsnGaraOVKpHhb8tbtKVV+1I4OFVbSEp6Eg/VZ00BTQ9CBhrhN3STNdktZj1NYqnDUwdbEyoGT3BvY=
X-Received: by 2002:a05:6402:21eb:: with SMTP id ce11mr13601210edb.153.1633688327360;
 Fri, 08 Oct 2021 03:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211007133021.32704-1-krzysztof.kozlowski@canonical.com> <20211008.111646.1874039740182175606.davem@davemloft.net>
In-Reply-To: <20211008.111646.1874039740182175606.davem@davemloft.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date: Fri, 8 Oct 2021 12:18:36 +0200
Message-ID: <CA+Eumj5k9K9DUsPifDchNixj0QG5WrTJX+dzADmAgYSFe49+4g@mail.gmail.com>
To: David Miller <davem@davemloft.net>
Message-ID-Hash: UEJ42AZHHMSD6DA4IO6Q4B5DMURZ32OX
X-Message-ID-Hash: UEJ42AZHHMSD6DA4IO6Q4B5DMURZ32OX
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: kuba@kernel.org, linux-nfc@lists.01.org, netdev@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-wireless@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [RESEND PATCH v2 0/7] nfc: minor printk cleanup
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/UEJ42AZHHMSD6DA4IO6Q4B5DMURZ32OX/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 8 Oct 2021 at 12:17, David Miller <davem@davemloft.net> wrote:
>
> From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Date: Thu,  7 Oct 2021 15:30:14 +0200
>
> > Hi,
> >
> > This is a rebase and resend of v2. No other changes.
> >
> > Changes since v1:
> > 1. Remove unused variable in pn533 (reported by kbuild).
>
> Please CC: netdev for nfc patches otherwise they will not get tracked
> and applied.

netdev@vger.kernel.org is here. Which address I missed?

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
