Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 511683DD18D
	for <lists+linux-nfc@lfdr.de>; Mon,  2 Aug 2021 09:51:23 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id C5102100EB82B;
	Mon,  2 Aug 2021 00:51:21 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 6D182100EBB68
	for <linux-nfc@lists.01.org>; Mon,  2 Aug 2021 00:51:20 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 3534B3F07E
	for <linux-nfc@lists.01.org>; Mon,  2 Aug 2021 07:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1627890678;
	bh=fs9fpedxUqb4ruSG2aoP4UXK6qGXGG+yyjmaHqaWHQA=;
	h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=Vp1FVdKzpWroRzaisYTy1ceBIFrxVLum63/c6NHSV+8AzznCJim8Z7sav7z3BZzMZ
	 +V/a37eRisRgVRy4STHewDjwdg5ceZd8qW0AML0w7zY65jDT9mPWyfQe8Hqws0Nw+X
	 +cp+fXZeuUha6zXhwzMA9Ojgn2x8l0AScK5wf4QodZMm0IYxCqmkEq4lFtb+ZWTtiv
	 rUyZ1auoWLtOJidmDQ6nUpUYZ9W4wU7xOGg9RnI/u08BaaHrJdJLzcPHqnlFJsI0Bb
	 TVJH7t1FZut4zGQjdJXzTcvTBSJvGAHUJ5SOMesSmoCYR0wNQulZAqYWpAq7vcO0Xp
	 jHQlECJ4Rur4Q==
Received: by mail-ed1-f70.google.com with SMTP id k14-20020a05640212ceb02903bc50d32c17so8347775edx.12
        for <linux-nfc@lists.01.org>; Mon, 02 Aug 2021 00:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fs9fpedxUqb4ruSG2aoP4UXK6qGXGG+yyjmaHqaWHQA=;
        b=aK23w67Um8QEYrOSHz668GOaDD9fG8/qelq9Hh3NWdXJbVt54HRnQko3uXQA3IZy2Y
         HKaapUnZ5v955R3c6ajtKvLTo2gRy8qMK+WQ7pfPEUUJUVKfFO3ypgdb6gHAWlWKOdp4
         zG+HRUg7UhMHF/hWUNBXM82DXAvzEwwZVJjIq5LqECHUP5H81F2xXQi8F60crpuCF0JY
         6tmEJ0a5xGXPi3iHA9ohlGnljAXw0aW3vMUiI1+pWtaNUq65VHWtTeg5gtEsA0bszB7K
         rQ2rbJO8iOvldbc6uNZuVNs6IvMm0bmSZredEED9eNBVVqYNd63lSdfdtyKjnSlvqWJL
         4jvw==
X-Gm-Message-State: AOAM532gaYx98pnJ+f167nK32d1jZVPyujdj4a21In5hOZ2GEi7vYpwY
	bX8hIA86uWKkM2RfnbAChaLMihj6OluLJ8x55G79xAXuba/VtpZ5i//VdoE6DfRV6+8NMueJKBp
	EKv9N1+oWyaThH9Twqybw8q6kZFsPN5wcUw==
X-Received: by 2002:a17:907:1c9f:: with SMTP id nb31mr8917840ejc.114.1627890677594;
        Mon, 02 Aug 2021 00:51:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXAiwupO7PPEQjUHktz609i+sCirHEjYD6/TgR04hhpYbCfC8MOiXGTPdgv2iRoRAhAhfJyg==
X-Received: by 2002:a17:907:1c9f:: with SMTP id nb31mr8917830ejc.114.1627890677467;
        Mon, 02 Aug 2021 00:51:17 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.43.172])
        by smtp.gmail.com with ESMTPSA id u10sm4127631ejf.121.2021.08.02.00.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Aug 2021 00:51:16 -0700 (PDT)
To: Mark Greer <mgreer@animalcreek.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
 <20210801231140.GA397941@animalcreek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <47b15b65-61cc-9cec-ca6c-c9a6d84ff7d5@canonical.com>
Date: Mon, 2 Aug 2021 09:51:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210801231140.GA397941@animalcreek.com>
Content-Language: en-US
Message-ID-Hash: VMOC6LGYYYZYD7I3GKQWSXMSK3YOSPQP
X-Message-ID-Hash: VMOC6LGYYYZYD7I3GKQWSXMSK3YOSPQP
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [neard][PATCH v2 00/73] combined fixes - warnings, memory leaks, memory corruption
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/VMOC6LGYYYZYD7I3GKQWSXMSK3YOSPQP/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 02/08/2021 01:11, Mark Greer wrote:
> On Mon, Jul 19, 2021 at 01:07:06PM +0200, Krzysztof Kozlowski wrote:
>> Hi,
>>
>> Mark asked for resending fixes separate from setting up CI under Github
>> Actions, so here is a combination of all my previously sent patches
>> related only to the actual C code:
>>
>> https://lore.kernel.org/linux-nfc/20210710033859.3989-1-krzysztof.kozlowski@canonical.com/T/#t
>> https://lore.kernel.org/linux-nfc/20210711202102.18094-1-krzysztof.kozlowski@canonical.com/T/#t
>> https://lore.kernel.org/linux-nfc/20210714110518.104655-1-krzysztof.kozlowski@canonical.com/T/#t
>> https://lore.kernel.org/linux-nfc/20210716100844.51360-1-krzysztof.kozlowski@canonical.com/T/#t
>>
>> This includes fixes for GCC/clang warnings, memory leaks, memory
>> corruption and few other minor fixes. The UTF-8 and UTF-16 is not
>> entirely fixed and I removed the work-in-progress patches.
>>
>> Changes since v1 are:
>> 1. Group all patches based on prefix (unit file), instead of topic.
>> 2. Put the build-related patches at the end.
>> 3. Remove all CI-related patches.
>> 4. Drop patch: ndef: fix parsing of UTF-16 text payload.
>> 5. Fix commit msg in: nfctool: pass the format as string literal
>>
>> Best regards,
>> Krzysztof
>>
>>
>> Krzysztof Kozlowski (73):
>>   Drop empty NEWS
>>   nfctool: fix adapter_get_devices() cast-function-type
>>   nfctool: fix adapter_print_target() cast-function-type
>>   nfctool: fix adapter_print_info() cast-function-type
>>   nfctool: fix adapter_compare_idx() cast-function-type
>>   nfctool: fix nfctool_send_dep_link_up() cast-function-type
>>   nfctool: fix nfctool_print_and_remove_snl() cast-function-type
>>   nfctool: use proper format for integers (-Wformat)
>>   nfctool: pass the format as string literal
>>   dbus: fix -Wformat in near_dbus_encode_string()
>>   unit: pass real UTF-8 for testing text NDEF
>>   ndef: check UTF-16 text payload length
>>   ndef: silence clang -Wcast-align warning
>>   ndef: use NDEF_TEXT_RECORD_UTF16_STATUS define
>>   ndef: use proper format for integers (-Wformat)
>>   ndef: make freeing near_ndef_message reusable
>>   se: fix multiple apdu definitions
>>   se: silence clang -Wcast-align warning
>>   se: use proper format for integers (-Wformat)
>>   adapter: adjust indentation of continued arguments
>>   adapter: use proper format for integers (-Wformat)
>>   gdbus: do not shadow global 'pending' variable (-Wshadow)
>>   nciattach: fix poll.h include location
>>   nciattach: do not shadow other local 'opt' variable (-Wshadow)
>>   bluetooth: use proper format for integers (-Wformat)
>>   nfctype2: use proper format for integers (-Wformat)
>>   nfctype3: use proper format for integers (-Wformat)
>>   nfctype5: use proper format for integers (-Wformat)
>>   nfctype5: fix returning uninitialized stack value in
>>     t5_tag_is_ti_pro()
>>   mifare: use proper format for integers (-Wformat)
>>   mifare: use unsigned int to suppress compiler -Wstrict-overflow
>>   p2p: use proper format for integers (-Wformat)
>>   npp: use proper format for integers (-Wformat)
>>   device: use proper format for integers (-Wformat)
>>   manager: use proper format for integers (-Wformat)
>>   netlink: use proper format for integers (-Wformat)
>>   gdbus: annotate printf-like functions as accepting format
>>   snep-send: fix near_ndef_message memory leak
>>   tag: use proper format for integers (-Wformat)
>>   tag: do not open-code freeing ndef message
>>   snep: do not open-code freeing ndef message
>>   snep: remove useless NULL-ify of local pointer variable
>>   snep: fix double free of GSList
>>   snep: fix fragmented response memory leaks
>>   unit: use g_assert_cmpstr()
>>   unit: use g_assert_cmpint() and g_assert_cmpuint()
>>   unit: fix recv() and send() return types
>>   unit: use g_assert_null()
>>   unit: use g_assert_cmpmem()
>>   unit: use proper pointer to uint8_t in test_snep_read_recv_fragments()
>>   unit: do not shadow global 'text' variable (-Wshadow)
>>   unit: do not shadow global 'uri' variable (-Wshadow)
>>   unit: use proper format for integers (-Wformat)
>>   unit: fix memory leaks in test-ndef-parse
>>   unit: do not open-code freeing ndef message
>>   unit: fix memory leaks in test-ndef-build
>>   unit: fix memory leaks in test-snep-read error paths
>>   unit: fix record memory leak in test-snep-read
>>   unit: fix records GList memory leak in test-snep-read
>>   unit: do not pass NULL to memcpy()
>>   unit: do not search for headers locally where they do not exist
>>   unit: remove duplicated invalid definitions in test-snep-read
>>   unit: remove duplicated definitions in test-ndef-parse
>>   unit: add few asserts in test-snep-read
>>   HACKING: refine required packages
>>   build: fix setting CFLAGS on dash shell (Alpine Linux)
>>   build: add more compiler warnings
>>   build: enable -Wshadow and -Wformat-signedness compiler warnings
>>   build: enable -Wformat=2 warnings
>>   build: enable -Wunsafe-loop-optimizations and -Wstrict-overflow=2
>>     warnings
>>   build: fix missing usage of PIE check result
>>   build: add support for GCC sanitizers (asan, lsan and ubsan)
>>   AUTHORS: Mention Krzysztof Kozlowski's contributions
> 
> Applied.
> 
> Thanks Krzysztof.
> 
> FYI, I built neard natively with these patches applied on an amd64
> (ubuntu 20.04) and an ARM Cortext A8 (debian 10).  Both build cleanly
> and I could read & write tags.
> 
> My plans include:
> - python3-ize the python test scripts
> - debug an issue I think I saw
> - look for races that I recall running into in the past
> - recruit another arm SoC for testing
> - get my trf7970 working again

Great, sounds like a good plan.

I sent now rebased and fixed CI under Github:
https://github.com/linux-nfc/neard/pull/2

> 
> When things settle down and we're happy with what we have, we should
> cut a new version (0.17 or 1.0 even).



Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
