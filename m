Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA7B3DFC55
	for <lists+linux-nfc@lfdr.de>; Wed,  4 Aug 2021 09:56:19 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E6E09100EBBD7;
	Wed,  4 Aug 2021 00:56:15 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 08164100EBBBB
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 00:56:13 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id F109D3F230
	for <linux-nfc@lists.01.org>; Wed,  4 Aug 2021 07:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1628063771;
	bh=S+GMiKewILJS8l+jqquvQurW4doVNozE6yym6sw6Fg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=CbGyOAKjKTPDfbKAFaE1U/jtWIE3Vb/pC6CUOUZ0ZIdcKYXvaM8yjjHoZ07kikLKb
	 cABg0bQLOhJEyMap5Tw5zOglYG3ro9ZSsXlNl0zlXaYru+kbSvKXsErt18M11+gtLg
	 1yJLTND8speQ1ZWfEXqWJ0jP1Y2cSTZKXCtMI+A7puRAIM9lSwwSYaQ1a7gffkEXn+
	 5Mr3AxYnk1cKL/OULW4nqC+MfJRVc/FP0AH1HBYOg7v6wkaT4w3qRRjDJNW8to3GKZ
	 m5f4H+cM2MrU7oOVU2lI0XKSoZXKER94CMWU3/B8hOV1ypQKN9JG+ZkDCyuY73T9Ty
	 UQyiPVseS8UYw==
Received: by mail-ed1-f70.google.com with SMTP id v26-20020aa7d9da0000b02903bda706c753so1037954eds.18
        for <linux-nfc@lists.01.org>; Wed, 04 Aug 2021 00:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S+GMiKewILJS8l+jqquvQurW4doVNozE6yym6sw6Fg0=;
        b=eJUA95qS/oJ/BA0HuuyDlFjmz7pf8aXnrJlZuapEHDKBaSEKA7nNjcVLveQWNd9Yg+
         3SBmfod3fc/pR8GsyG6YB7eZbikb1P6YgyKeVxPl5TksO18JjtC6271iPRcrtGjGvBZ9
         3ToZMooEln/7Stc9qIUvoNvNmCvvPeOKPRTxwYOaW3FVEd0rT9oJfnzVFgGA6uHP9Geb
         NMCcVC9dnwIOvpa0Xhs1547kgV3uQYpp1HIrqVqB285dkrC/YaHh9klUwxs9N98/RH+E
         UvZADxb3FEZPJf83wuYBNj0GkmJirET3lVMu/ME5/SonT/w0s2TS/Y6Sz88jOX/ImHwH
         Crzg==
X-Gm-Message-State: AOAM530PkyA8W4KKZ5gh+UkCanTKQq5UmJmMdJNEQ+epDwVF4JZcOVuA
	pABwCVbLSM5pXZcnERuDd7ytAcs+9s1c04WbGBT6LYDpPT3xrl4FWCYwbgNdSu5g76syKCQOdc+
	FzJO0duREJ4szCckqxM/zRlJZisHNg2HFX/TVeT7jAEW/TkbfUQ==
X-Received: by 2002:a17:907:2d28:: with SMTP id gs40mr24856860ejc.193.1628063771720;
        Wed, 04 Aug 2021 00:56:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRvJefKGUsKrfMqOvlK+UHgIhA9wG+hGN6M2+KU4x78XIQSleSNC/GdtoE1J0I3iYZUgX2HsWO6kdk9b6YVaA=
X-Received: by 2002:a17:907:2d28:: with SMTP id gs40mr24856848ejc.193.1628063771440;
 Wed, 04 Aug 2021 00:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
 <20210801231140.GA397941@animalcreek.com> <47b15b65-61cc-9cec-ca6c-c9a6d84ff7d5@canonical.com>
In-Reply-To: <47b15b65-61cc-9cec-ca6c-c9a6d84ff7d5@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date: Wed, 4 Aug 2021 09:56:00 +0200
Message-ID: <CA+Eumj6wuufroVja4PMk+NbmQm57AZEYhtECXZJRH-j08UtJng@mail.gmail.com>
To: Mark Greer <mgreer@animalcreek.com>
Message-ID-Hash: Q6W7CULTCJAVT3JBPTQGUCCWDLXVH2KC
X-Message-ID-Hash: Q6W7CULTCJAVT3JBPTQGUCCWDLXVH2KC
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [neard][PATCH v2 00/73] combined fixes - warnings, memory leaks, memory corruption
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/Q6W7CULTCJAVT3JBPTQGUCCWDLXVH2KC/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2 Aug 2021 at 09:51, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> > FYI, I built neard natively with these patches applied on an amd64
> > (ubuntu 20.04) and an ARM Cortext A8 (debian 10).  Both build cleanly
> > and I could read & write tags.
> >
> > My plans include:
> > - python3-ize the python test scripts

I checked now Ubuntu/Debian packages and dependency on Python2 was
reason of removal of neard from their package repository.
Convertinging these to Python3 would allow bring it back, so it's
quite useful task.


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
