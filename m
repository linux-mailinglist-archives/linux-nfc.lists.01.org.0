Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E432154278A
	for <lists+linux-nfc@lfdr.de>; Wed,  8 Jun 2022 09:10:03 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 44F1A100EA2C9;
	Wed,  8 Jun 2022 00:10:01 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN> 
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id A56AD100EAB62
	for <linux-nfc@lists.01.org>; Wed,  8 Jun 2022 00:09:59 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id w27so25774297edl.7
        for <linux-nfc@lists.01.org>; Wed, 08 Jun 2022 00:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4VhB2e/ltpu1xO6FxebSIJdavw/FcgMQSIeYIdUzE8E=;
        b=LB8glNF1OZD8rR7O+PhXb+revMGeyvo2TrVT9fhvVjTttyEoABo26rnt0n/EjhhSxT
         gN3sLTTgCcsakc/Vkd2HAoa793GrCgXy+ybkcUfkL3hJ5M3/ciuvSp4INRP9MLSB+Jtg
         jsFQVBHwyqqrjqdLSXWImg0nbS5Hgf5fW3/Wtw9T32lYnJeJ/AiA0WTuxAkiCJtEPTkV
         2K3x6A/JhFBgdFWLf97Ez7n5yiN7bhSf+wHfh6YsahQ8QrYh6bMYvNOPTCGHX8sqFVkz
         z3v/tn0QCMmB3w5iFGVHqFl4jgd9XFzGAXh9QQgRdttu5dXck1LPPY19NitDuEMCMc9G
         YV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4VhB2e/ltpu1xO6FxebSIJdavw/FcgMQSIeYIdUzE8E=;
        b=iE4DcYOIzd9CuXr6uXM/CPJ6wqP5WpgS/OiEEOK+8EzFUJrtv7RKmjUNh1MAgaZvm4
         fis4Wsid+IyKGc/1UgD2pj7wsAESwW8sk1DAhV+t/J1GxWzQfs57iCKie4yDE058I387
         dnYwnVkC8G9RnhaVCqsSku+gfxCDt7wv7nJErbeUvoNJzvds6xOswfL5/RvaDdY52ZHK
         rygFoT99fK9q0xU/lozCeRYnoVTrVQIBV0U2selfAnGRU2pRJeFXGrJFQnbmEGJyIAyS
         KD0HPsReNSpyKsMCh6tuF4xTXIaKonMl+Ncy3+mpHLUsNu2U+dKyy4HRClcgs5RpjpcW
         6fJg==
X-Gm-Message-State: AOAM531z7bDL+JqOe1FAdfiQybegQI138WoRIQMcLPQsUNTAikH+ukzK
	A7kj9ExITtRhdEmsbwtRCTkx6A==
X-Google-Smtp-Source: ABdhPJyHF7hM8V6O84F0LFPlhTciyOv7byFP2rtEm5inGFYWa9ZRBeTODiIowgOO0jIDtMk+cgWVvA==
X-Received: by 2002:aa7:d9d9:0:b0:42d:f9e4:49e0 with SMTP id v25-20020aa7d9d9000000b0042df9e449e0mr37174658eds.299.1654672197861;
        Wed, 08 Jun 2022 00:09:57 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id m11-20020a056402050b00b0042dd7e13391sm11673670edv.45.2022.06.08.00.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 00:09:57 -0700 (PDT)
Message-ID: <9d387882-3c9a-5056-9ee3-81ab6ea0a9a6@linaro.org>
Date: Wed, 8 Jun 2022 09:09:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Martin Faltesek <mfaltesek@google.com>, kuba@kernel.org
References: <20220607025729.1673212-1-mfaltesek@google.com>
 <20220607025729.1673212-4-mfaltesek@google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220607025729.1673212-4-mfaltesek@google.com>
Message-ID-Hash: E2AVN3WQPY6O7DODNBOMZVT6PLG63DH7
X-Message-ID-Hash: E2AVN3WQPY6O7DODNBOMZVT6PLG63DH7
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: christophe.ricard@gmail.com, gregkh@linuxfoundation.org, groeck@google.com, jordy@pwning.systems, krzk@kernel.org, martin.faltesek@gmail.com, netdev@vger.kernel.org, linux-nfc@lists.01.org, wklin@google.com, theflamefire89@gmail.com, stable@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net v3 3/3] nfc: st21nfca: fix incorrect sizing calculations in EVT_TRANSACTION
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/E2AVN3WQPY6O7DODNBOMZVT6PLG63DH7/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 07/06/2022 04:57, Martin Faltesek wrote:
> The transaction buffer is allocated by using the size of the packet buf,
> and subtracting two which seem intended to remove the two tags which are
> not present in the target structure. This calculation leads to under
> counting memory because of differences between the packet contents and the
> target structure. The aid_len field is a u8 in the packet, but a u32 in
> the structure, resulting in at least 3 bytes always being under counted.
> Further, the aid data is a variable length field in the packet, but fixed
> in the structure, so if this field is less than the max, the difference is
> added to the under counting.
> 
> The last validation check for transaction->params_len is also incorrect
> since it employs the same accounting error.
> 
> To fix, perform validation checks progressively to safely reach the
> next field, to determine the size of both buffers and verify both tags.
> Once all validation checks pass, allocate the buffer and copy the data.
> This eliminates freeing memory on the error path, as those checks are
> moved ahead of memory allocation.
> 
> Fixes: 26fc6c7f02cb ("NFC: st21nfca: Add HCI transaction event support")
> Fixes: 4fbcc1a4cb20 ("nfc: st21nfca: Fix potential buffer overflows in EVT_TRANSACTION")
> Cc: stable@vger.kernel.org
> Signed-off-by: Martin Faltesek <mfaltesek@google.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
