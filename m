Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C6441488C
	for <lists+linux-nfc@lfdr.de>; Wed, 22 Sep 2021 14:13:17 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 1EBA2100EB83B;
	Wed, 22 Sep 2021 05:13:15 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 7A538100EBBCE
	for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 05:13:12 -0700 (PDT)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 39A673F4BC
	for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 12:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1632312789;
	bh=hP2w8Q1bmRd7QsbJSWuw/qEx96Jo8lROQWYodGYqF1k=;
	h=To:Cc:From:Subject:Message-ID:Date:MIME-Version:Content-Type;
	b=qluV3r/7/EaNV5Yb/Re6wvjqVdMCjzZA9he+7erkmkxiVLUZdQ3UNBo8HZDHXiQsM
	 mcM7FCxKI+01+fgUYLuWiMJDDIrpwALrw0t4Tgnj5V0lRMeIe9LJYOzYfDmU4pd275
	 SwqMetA6rao+Gd9v2JFdl/WGH40jvDaUJ6wKPMh9Zx0LPB7cjlSg7gEHngIaadqzVS
	 k5WygabJa5Fj1ZVN5dGVf3x4iskkwlLjDJq7evP9Q9VfkJ2KgxQv8IMkYIbhrzN9U+
	 y9xbflMRnMgbYdtCEH+GaHeYkMMjm1dP9Y/p6bCZDTy26Yh/XgI50RRGDDhcSUF9JY
	 ppBoa8aVX78lg==
Received: by mail-wr1-f70.google.com with SMTP id j16-20020adfa550000000b0016012acc443so1956971wrb.14
        for <linux-nfc@lists.01.org>; Wed, 22 Sep 2021 05:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=hP2w8Q1bmRd7QsbJSWuw/qEx96Jo8lROQWYodGYqF1k=;
        b=1yDtPfsXHcIWC5JzyGVr0gRaVEfKK1wIZvAVjfPbdMoPGVWGyGjQsZILNdrvXA3Pa9
         iJlIQBz8AkC1xjjm+mIemI3zG5INMbzHFaS5tdQ0MwxMn8koojfZn8qWXtjouxhx7i2l
         G1DS1yV51oa6DedTEW9HrYSg0akdpYqbbg3hbxFe/nBr4cJ6KqHdCeIWlZpq8eXVNwu3
         pflVyPAELWUsHtbKBTPhBmelN9sln+4lG3j4b2xeDc/mgeXZrEyKBDrizauvuXhppZch
         Od/YcdZuHJ+mXqlkNKsZP4byQTlzZwyh0trUB97CWL2c6+wz7OrWjRKSyHJrNIkxSM30
         sRGQ==
X-Gm-Message-State: AOAM5338tbgIcfA5ulP+yNpdSuJj5FsSGMJGxOP+7+0/yqjA7Dbi5wa2
	CxWFcKUCT8TRKwXl4JgjhrmSZbkJ4erwEXQmoyz3qNMFS10G54qGCuliZzMlGjWmkoiT2KljHWA
	52H70l+DnGMzcJGkNLpyLo1/t0n/BrCEhiw==
X-Received: by 2002:a7b:ce06:: with SMTP id m6mr10228308wmc.85.1632312788942;
        Wed, 22 Sep 2021 05:13:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6RcbWQVWI9dXldtPewpPa4PrqTW+ts4ENjpUypUVVACFIqnLduFSWsT10CZrGiuDO42igJw==
X-Received: by 2002:a7b:ce06:: with SMTP id m6mr10228285wmc.85.1632312788799;
        Wed, 22 Sep 2021 05:13:08 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id b188sm1890703wmd.39.2021.09.22.05.13.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Sep 2021 05:13:08 -0700 (PDT)
To: linux-nfc@lists.01.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>, aur-general@lists.archlinux.org,
 devel@lists.fedoraproject.org, packaging@lists.opensuse.org
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <f3701543-8ee0-fefa-c57d-590832a1f951@canonical.com>
Date: Wed, 22 Sep 2021 14:13:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: en-US
Message-ID-Hash: J3AQP4LFAKAKV26TCNEXVPPFLO4BP7LI
X-Message-ID-Hash: J3AQP4LFAKAKV26TCNEXVPPFLO4BP7LI
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzk@kernel.org>, Cody P Schafer <dev@codyps.com>, Dave Olsthoorn <daveo@fedoraproject.org>, Dirk Mueller <dmueller@suse.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard] neard release v0.17
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/J3AQP4LFAKAKV26TCNEXVPPFLO4BP7LI/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

v0.17
=====
After quiet period, the neard user-space counterpart of Linux kernel NFC
stack, gets a new release - v0.17.

The release includes several fixes (including potential security fixes)
and improvements, plus few new features.

Source code release:
https://git.kernel.org/pub/scm/network/nfc/neard.git/tag/?h=v0.17
https://git.kernel.org/pub/scm/network/nfc/neard.git/snapshot/neard-0.17.tar.gz

Few notes on new names and maintainers
======================================
The neard package was previously maintained Samuel Ortiz and Marcel
Holtmann, which were also main contributors. Last years Mark Greer was
looking after neard. I joined in 2021, both as a maintainer of Linux
kernel NFC stack and the neard.

The project development still happens via linux-nfc mailing list but
also got a second home on GitHub:
https://github.com/linux-nfc/neard

Under GitHub I set up also Continuous Integration:
https://github.com/linux-nfc/neard/actions

Feel free join and hack via both channels.

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
