Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC883CD3A7
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:21:29 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 7C667100F2270;
	Mon, 19 Jul 2021 04:21:27 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id F10F7100EB333
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:21:24 -0700 (PDT)
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id CCBA1401C0
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626693683;
	bh=baErOkuRIl70n8LBpA7q/Ag4J5P4YXhLNiPvIOzzB0I=;
	h=Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=dWe7Jmxbt1IOe7340wHmntMmR5q3Qdvk3ILDvzSuX7sVgnAonOqc8HOLswK3e2V2H
	 XoHlf8oTXlEWaq3otRuhMAC8F5zf1Kc+VUuC0YuESL78Jg/47/DEBtoF5znvhQ0jAA
	 KBJanezioFARBCyPfnAzCBBmkr5EHbCUKfQWTN67him/B8kXsURygk8CpYNG73/7o3
	 JMePB0dkSYs3o+Lg8HvQvYJFIy0v+WzpzhrfkCew2xZT/Y+i7U39A7Isd0FtlsrUPA
	 cVxEg7oJxCjLqXiBV+DDTjpbO3ZjLiNIwJulxsVoaTUjgCGoUG4It63YDoHCald249
	 +SJEaDiFC+8qw==
Received: by mail-lj1-f197.google.com with SMTP id d1-20020a2e81010000b0290196925bc674so3221171ljg.10
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=baErOkuRIl70n8LBpA7q/Ag4J5P4YXhLNiPvIOzzB0I=;
        b=ntMT/tQx92KX+rm5OpT1fJbn3bbpw42AF6DU/CJjFgtvs4rikk9Z66ik10v7PA7xz4
         r070Nk7eJptpEGLK+9RHQkOHTVB5TFwztZN747KXOXC/zfjQAe5aaZ+s8srUwKh/mXFl
         fj4xqbz4IYJEpHbpBxAEyQadiYajNvMb+pJzdqmis5z16TfC7Tfbq1V6lgEC2XrKWyO7
         5pYLAZ1OCov4faef1936rabh0iw+BGCy/CFNwb3s2cdvmIF8dqkjqQcrlmai8Jknwo1O
         UA6+PWYLhfs2/oVtWZnY7q/Ok+fmqhY5mTKhXOeNkX3Wbm+W/KQx+1oX27bpzfyMm1B4
         gICw==
X-Gm-Message-State: AOAM531QMiKElibkUExr1DBR/hW7wGyFEK2kWAylUNZ3dS5H1WAgUTL3
	F7Vsu+hYzS/VoQhJSQ9puqj7OJmW6KXqqVvcULpNSCjcC4ruZ68cnF6SaAoHvotSYA/qu9rvVHP
	iEY7YhRBNAsSPtHbkDb59MB2KJm0bgzONJA==
X-Received: by 2002:a2e:9a8e:: with SMTP id p14mr11766536lji.69.1626693683009;
        Mon, 19 Jul 2021 04:21:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsXNu3tRH56qn8NqnXNzHJIY+d6VlbAZZEHiyYTnfIMlSqC1EZrCIabeMtqB0F626/d9GpmQ==
X-Received: by 2002:a2e:9a8e:: with SMTP id p14mr11766523lji.69.1626693682829;
        Mon, 19 Jul 2021 04:21:22 -0700 (PDT)
Received: from [192.168.8.102] (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id q23sm369000ljc.134.2021.07.19.04.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jul 2021 04:21:22 -0700 (PDT)
To: linux-nfc@lists.01.org, Mark Greer <mgreer@animalcreek.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <d78d75e7-098c-cf41-9f96-c746d91385ad@canonical.com>
Date: Mon, 19 Jul 2021 13:21:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
Message-ID-Hash: YJY6FXEXJE55VATYFIRFUXVM2IK7RGOF
X-Message-ID-Hash: YJY6FXEXJE55VATYFIRFUXVM2IK7RGOF
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [neard][PATCH v2 00/73] combined fixes - warnings, memory leaks, memory corruption
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/YJY6FXEXJE55VATYFIRFUXVM2IK7RGOF/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 19/07/2021 13:07, Krzysztof Kozlowski wrote:
> Hi,
> 
> Mark asked for resending fixes separate from setting up CI under Github
> Actions, so here is a combination of all my previously sent patches
> related only to the actual C code:
> 
> https://lore.kernel.org/linux-nfc/20210710033859.3989-1-krzysztof.kozlowski@canonical.com/T/#t
> https://lore.kernel.org/linux-nfc/20210711202102.18094-1-krzysztof.kozlowski@canonical.com/T/#t
> https://lore.kernel.org/linux-nfc/20210714110518.104655-1-krzysztof.kozlowski@canonical.com/T/#t
> https://lore.kernel.org/linux-nfc/20210716100844.51360-1-krzysztof.kozlowski@canonical.com/T/#t
> 
> This includes fixes for GCC/clang warnings, memory leaks, memory
> corruption and few other minor fixes. The UTF-8 and UTF-16 is not
> entirely fixed and I removed the work-in-progress patches.
> 
> Changes since v1 are:
> 1. Group all patches based on prefix (unit file), instead of topic.
> 2. Put the build-related patches at the end.
> 3. Remove all CI-related patches.

I put CI-related changes in:
https://github.com/linux-nfc/neard/commits/krzk/github-ci-v2

It's based on master, so it fails building (fixes are in the set here).
Should be rebased on top of this set before merging. Few patches got
also squashed as now this set does not follow my exact development history.


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
