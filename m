Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE932464A69
	for <lists+linux-nfc@lfdr.de>; Wed,  1 Dec 2021 10:15:12 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id C258D100F4844;
	Wed,  1 Dec 2021 01:15:11 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 96BF3100F4843
	for <linux-nfc@lists.01.org>; Wed,  1 Dec 2021 01:15:09 -0800 (PST)
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 255883F1E5
	for <linux-nfc@lists.01.org>; Wed,  1 Dec 2021 09:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1638350108;
	bh=IKgBGQCQuRpwgVKdd8OaDNhGyAFMCJLE7uKI+gDvSgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type;
	b=dzl3KnzkqhJ3igl0/zI5sC3cdVApAwgdSfCeaAldhWpudseI/OQVkr3OqfSr8jdlP
	 wtbkMm7/Gj3cBEMaF3n9ZJUfTe+aCUP8cyQVcoxpGIoeKBVd8CIwmt+zmUns8tmDu4
	 ZRqMCDsD3LfwV0NTOkSZt2nChWO33vkn/mZvEqYwhN8f1MSGOxGcXL38MuYAnTb4UP
	 IDPfgf4x04J3KTmN47j2jXz2d4N5XYNdUiv5i1qFK6Iukup2l8qeN6Wo4ULNrougIi
	 8mL0GNlskogmUD8VftwnGqju7F6d7WEZ5xId8FLK5dQ4GWOASiUE7dmfDJYI/HV5Vr
	 XjSFOsXn6+WIQ==
Received: by mail-lj1-f198.google.com with SMTP id q13-20020a2e750d000000b00218c953d0b8so8510813ljc.21
        for <linux-nfc@lists.01.org>; Wed, 01 Dec 2021 01:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IKgBGQCQuRpwgVKdd8OaDNhGyAFMCJLE7uKI+gDvSgA=;
        b=yPayiL7qOQPz7toJHtxWlsf2zgrQXSohCxldsfysAKckCJ7FjU1crWq4HOfuIe7mAk
         ZuT++u9v670GVZ7c/L1g5dafwl0NrDQ0E3XaWV+hXourG5NZWRGSgSbBhT1tbVTaJ50r
         aC+YoXi6BUvmJv4bMPwd4/oc/f3TOSHP8qyWlGM4Qq6m9aB5G0FjcueTHp/J0AJXNoZH
         kzUvLEiu0NwNHJLJEWi4dNe0+FS5zYIt1N64C3J/hpVspexzG2IAZm+1poSctPqBveZi
         xB5wEwuiu/2kYDql7RchSaqXwONgRVlEJXeBG27pf4sTx9Gfbd34EkuoP37eQkaqQ62n
         ybYg==
X-Gm-Message-State: AOAM530rpJbn3AtNDwmvFFa3tdGB3rA6aVEB8wXcJrX9J2GpH5XCCi8O
	D+4qqJqxD6PX1E7NkmF+lRGrindutnnSZdLreJUKVh9uOUIEQwRouavLvayObXshh+2hqCFNtSG
	hnMHjWPZptEsgkLf5VaSBFlf4ma99Q7SlXw==
X-Received: by 2002:a2e:890d:: with SMTP id d13mr4469592lji.396.1638350107121;
        Wed, 01 Dec 2021 01:15:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxU3z8KH0zly6n0jLhv7oD2TJzpI8VLavEyakeF1auCMExo85QXRUzIdN6CFvB+d3SHgEQMTA==
X-Received: by 2002:a2e:890d:: with SMTP id d13mr4469579lji.396.1638350106963;
        Wed, 01 Dec 2021 01:15:06 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id v23sm1850631lji.79.2021.12.01.01.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Dec 2021 01:15:06 -0800 (PST)
Message-ID: <77e68d99-b96a-2616-5933-00f6b4affa28@canonical.com>
Date: Wed, 1 Dec 2021 10:15:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
To: Mark Greer <mgreer@animalcreek.com>, linux-nfc@lists.01.org
References: <20211129050606.873494-1-mgreer@animalcreek.com>
 <20211129050606.873494-5-mgreer@animalcreek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211129050606.873494-5-mgreer@animalcreek.com>
Message-ID-Hash: IIYITJJIVMYMBBWBIIL5NHZ4BHLPO67S
X-Message-ID-Hash: IIYITJJIVMYMBBWBIIL5NHZ4BHLPO67S
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2 4/6] se: Use spaces only for SE Python test scripts
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/IIYITJJIVMYMBBWBIIL5NHZ4BHLPO67S/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 29/11/2021 06:06, Mark Greer wrote:
> The Python PEP 8 style guide prefers spaces over tabs so replace all
> tabs in the SE Python test scripts with spaces. See:
> 
> 	https://www.python.org/dev/peps/pep-0008/#tabs-or-spaces
> 
> Signed-off-by: Mark Greer <mgreer@animalcreek.com>
> ---
>  se/test/test-channel |  84 ++++++++++----------
>  se/test/test-seel    | 178 +++++++++++++++++++++----------------------
>  2 files changed, 131 insertions(+), 131 deletions(-)
> 
The same as in patch #1 - since you are touching all the lines and
changing indentation, no point in having two steps fixing indentation,
so make it 4-spaces.


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
