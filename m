Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1EF4B5029
	for <lists+linux-nfc@lfdr.de>; Mon, 14 Feb 2022 13:32:38 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id AF4C6100E6BBE;
	Mon, 14 Feb 2022 04:32:37 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 6A60F100F3924
	for <linux-nfc@lists.01.org>; Mon, 14 Feb 2022 04:32:35 -0800 (PST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 56F5F40334
	for <linux-nfc@lists.01.org>; Mon, 14 Feb 2022 12:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644841954;
	bh=Somk9rK9wTbAf3uJuc6ymMU5jHvbOhkCj5K3V5f0z94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=KipG9sRM6ebLfq1iDbXnWTtBB0x6tG9OuHapvoJTeG9m4ay1KYkarhTKYKayeSEzE
	 joZox1ALEn8FWKPWjKEnuX/xwBLUkEOULsbijBH9Eb0BykNhN6BfEQ4L+mb4AHhQYh
	 LeF9KN8rVIb5e8GNAHwQm2gsuLbYp8ACu6M+M0E1spBirMkAMRbporUXIGhUp40s40
	 BieLXPo7h7Y8ZiasURvO3BsqwKDbbLf8L9D9vcvyB0H/70Oi6GzqGEAKCi1q3/UZN5
	 9lG9FGTdGgiJN809KtbZzsxfA48Kd0eyU8MTqpXSUS7x70dgFkmDLy5NXFnHz65aZs
	 jJgjukHGKwSIw==
Received: by mail-wm1-f71.google.com with SMTP id a8-20020a7bc1c8000000b0037bc4c62e97so4970914wmj.0
        for <linux-nfc@lists.01.org>; Mon, 14 Feb 2022 04:32:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Somk9rK9wTbAf3uJuc6ymMU5jHvbOhkCj5K3V5f0z94=;
        b=pjdwjBlUnL0sFllyuUm6tjWDK8vQqm22LV002+kP38F0Fybi3uq876px4/bbL7R0bE
         KYc5SLI+rq5MfFIloFPyURnM3dkGyGwdSR9p18oCWIWOS0su04pFZkgwRWUR9xIKyqAw
         RDA/QhmxOkL2QaEBvyzhW86lloW3wCmSYr95RIStWSi4jHwHNZO4FV55VWNngDu9B8mG
         nLnR2s8QSzvqlcyqIKUxcNZ+Ghf2pzXzkW/IKTsZ/Wr1W+D34Xsr4Cx6mZkzh4xs6VAw
         bG7JgrCRRJzEW/KsgltsiahcOPw1O+VGVSNkWX6ey8+Z1XUxLBNCujPrWMZLe/zIOZim
         7nHQ==
X-Gm-Message-State: AOAM5306hwLfVqonE5ILxHWzDf/lruMvRtWNaMjgKTVj3G6kiqm5fw7S
	3661RFyxfkFpTzH+zdYaz6fT3ZkQbV0vXd9CzMX+/0pG4SuLt4E/EkW/r3aPeqUF4FPKc8u+SqX
	C+oD6ip1n99TlNOlHLZngFqLBIwg341GT3g==
X-Received: by 2002:a05:600c:3b9b:: with SMTP id n27mr10946810wms.14.1644841953702;
        Mon, 14 Feb 2022 04:32:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuWZrbcvyeym7EJCg6qkfrt/l43NwKTp0ltn4fiOEIOvPnnQbFVVM0fTBMhiqoTASAoKd7HA==
X-Received: by 2002:a05:600c:3b9b:: with SMTP id n27mr10946798wms.14.1644841953553;
        Mon, 14 Feb 2022 04:32:33 -0800 (PST)
Received: from [192.168.0.106] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id c8sm14427246wmq.39.2022.02.14.04.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 04:32:32 -0800 (PST)
Message-ID: <c976051a-54ee-a96f-06d7-3ec3ccc4d360@canonical.com>
Date: Mon, 14 Feb 2022 13:32:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: linux-nfc@lists.01.org
Cc: Mark Greer <mgreer@animalcreek.com>
References: <20220214123110.27056-1-krzysztof.kozlowski@canonical.com>
 <20220214123110.27056-2-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220214123110.27056-2-krzysztof.kozlowski@canonical.com>
Message-ID-Hash: KQVKVAEMWFAAIDGMUS2Y4QQ46VSUGY5E
X-Message-ID-Hash: KQVKVAEMWFAAIDGMUS2Y4QQ46VSUGY5E
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [neard][PATCH] Revert "include: Add a copy of the NFC kernel header"
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/KQVKVAEMWFAAIDGMUS2Y4QQ46VSUGY5E/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 14/02/2022 13:31, Krzysztof Kozlowski wrote:
> This reverts commit fb7664e2995f2b5bed4b93c7c82aab14c2485eb8 and changes
> several other files to match the scope of revert (using back system
> header, instead of local copy).
> 
> The reverted commit argued it is better to miss header updates than not
> being able to run the neard daemon at all.  It's not correct.  The
> /usr/include/linux/nfc.h header does not affect the runnability of
> daemon but the build stage.  The daemon, once compiled, will be able to
> run even if nfc.h system header changes.
> 
> However in case of any important differences in nfc.h, it is better to
> fail early during build time, than later during runtime because of
> differences of ABI (structures or functions) between kernel and
> user-space.
> 
> Rely back on system/kernel header, to avoid manual synchronisation.
> This will also force us to keep the neard updated if kernel header
> changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

This was sent by mistake, please ignore.

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
