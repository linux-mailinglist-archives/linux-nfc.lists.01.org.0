Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A95737D42E
	for <lists+linux-nfc@lfdr.de>; Wed, 12 May 2021 22:21:35 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 46049100F225A;
	Wed, 12 May 2021 13:21:33 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id C28EC100F2257
	for <linux-nfc@lists.01.org>; Wed, 12 May 2021 13:21:31 -0700 (PDT)
Received: from mail-ua1-f72.google.com ([209.85.222.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lgvMH-0005cL-JT
	for linux-nfc@lists.01.org; Wed, 12 May 2021 20:21:29 +0000
Received: by mail-ua1-f72.google.com with SMTP id b34-20020ab014250000b02901eb696c5fbaso3449009uae.22
        for <linux-nfc@lists.01.org>; Wed, 12 May 2021 13:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GPSchaWIh9W0a/KWJptAdzH4Ia11x5AtL0JuQZVu/NU=;
        b=WdCby6UOKltzVj138YdZ4S3xjwM6fF33gGUgFGHrDYN5GGJ+r6hY+5axzWAHx/mgd2
         OcyU/ePyKbsIoEqKasQRxTKe0W70LoxymmtB7ungAQtiWDVnCMoiepHNI1bS8Y07iw0z
         7Ajhcm7QYKa7qhRB4nEWDFrkc4G0QRwDK4AEj+8y9LKd3i6tGdQbox2bsdL9aw9PLfit
         qSVyjX/1doLsa1DqPOCVuG6epFh21CF5DxiDqK76fg3ckmXeIP3GBOiykutMVuWi5qcF
         J8SR0mH08867QbXHIMSckMHXB4eUcpQigoQjvTFtKYzRA3V5ZEbiOtcSyowozxsML565
         Sx4A==
X-Gm-Message-State: AOAM532xPJP4rNQKzMjC0poccn4wbNkB9YVEf0gKOzqQP+TrLRWQNcyl
	W0J8VI1asgSXXXspZnHrHUtN9wMdZqqifRXVmYxfPGYNvWt/8B/nF2y4WzksOp8D+Y2KDan7V/J
	HV4D4t5XkcpIklTiqrBPiVRPqhk5HPxCtSw==
X-Received: by 2002:a1f:784c:: with SMTP id t73mr30125701vkc.14.1620850888188;
        Wed, 12 May 2021 13:21:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrJdbPgvpiXdpX3wOjnLuu0MgeYwXqYZEYdNJ2scWsTdKyud/94qx2Zr8Ha9rIIBePrSKTbw==
X-Received: by 2002:a1f:784c:: with SMTP id t73mr30125683vkc.14.1620850887959;
        Wed, 12 May 2021 13:21:27 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id b197sm120811vke.24.2021.05.12.13.21.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 13:21:27 -0700 (PDT)
To: Mark Greer <mgreer@animalcreek.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>
References: <20210512144319.30852-1-krzysztof.kozlowski@canonical.com>
 <14e78a9a-ed1a-9d7d-b854-db6d811f4622@kontron.de>
 <20210512170135.GB222094@animalcreek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <cd7a0110-702a-6e14-527e-fb4b53705870@canonical.com>
Date: Wed, 12 May 2021 16:21:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512170135.GB222094@animalcreek.com>
Content-Language: en-US
Message-ID-Hash: XZ4VTB3NPBJGJLBJJLL6NF2XJOEJYYOT
X-Message-ID-Hash: XZ4VTB3NPBJGJLBJJLL6NF2XJOEJYYOT
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nfc@lists.01.org, Alex Blasche <alexander.blasche@qt.io>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 1/2] MAINTAINERS: nfc: add Krzysztof Kozlowski as maintainer
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/XZ4VTB3NPBJGJLBJJLL6NF2XJOEJYYOT/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/05/2021 13:01, Mark Greer wrote:
> On Wed, May 12, 2021 at 05:32:35PM +0200, Frieder Schrempf wrote:
>> On 12.05.21 16:43, Krzysztof Kozlowski wrote:
>>> The NFC subsystem is orphaned.  I am happy to spend some cycles to
>>> review the patches, send pull requests and in general keep the NFC
>>> subsystem running.
>>
>> That's great, thanks!
>>
>> Maybe you also want to have a look at the userspace side and talk to Mark Greer (on cc). He recently said, that he is supposed to be taking over maintenance for the neard daemon (see this thread: [1]) which currently looks like it's close to being dead (no release for several years, etc.).
>>
>> I don't know much about the NFC stack and if/how people use it, but without reliable and maintained userspace tooling, the whole thing seems of little use in the long run. Qt has already dropped their neard support for Qt 6 [2], which basically means the mainline NFC stack won't be supported anymore in one of the most common application frameworks for IoT/embedded.
>>
>> [1] https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/thread/OHD5IQHYPFUPUFYWDMNSVCBNO24M45VK/
>> [2] https://bugreports.qt.io/browse/QTBUG-81824
> 
> Re: QT - I've already talked to Alex Blasche from QT (CC'd).  With some
> work we can get Linux NFC/neard back into their good graces.  I/we need
> to find time to put in the work, though.
> 
> An example of the issues they have seen is:
> 
> 	https://bugreports.qt.io/browse/QTBUG-43802
> 
> Another issue I have--and I suspect you, Krzysztof, have as well--is
> lack of hardware.  If anyone reading this wants to volunteer to be a
> tester, please speak up.

Yes, testing would be very appreciated. I don't know how many unit tests
neard has, but maybe some mockups with unit testing would solve some of
problems?



Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
