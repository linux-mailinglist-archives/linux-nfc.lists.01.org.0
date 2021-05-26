Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2513D391946
	for <lists+linux-nfc@lfdr.de>; Wed, 26 May 2021 15:56:11 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id EF349100ED49E;
	Wed, 26 May 2021 06:56:08 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 47DE3100ED482
	for <linux-nfc@lists.01.org>; Wed, 26 May 2021 06:56:05 -0700 (PDT)
Received: from mail-vs1-f69.google.com ([209.85.217.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1llu0y-00065m-80
	for linux-nfc@lists.01.org; Wed, 26 May 2021 13:56:04 +0000
Received: by mail-vs1-f69.google.com with SMTP id f20-20020a67d8940000b029022a675e6e86so277111vsj.2
        for <linux-nfc@lists.01.org>; Wed, 26 May 2021 06:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gZn8h8gkilkZaN7gS01tsrUP7HzVUTqYj/r9HNxu8z0=;
        b=mRtpRQ8zihzWpgt6wEycqUTDhLPBDYlzIQOPfzHpJ0HQzBluCyw/lHqLvOQRy3Iztq
         pioTjOslkEqT3XJRRZAJnmOp1KAdlUmnf7MJhwAcm6pzSRG9b6ybJtVRqUvv3Zy9jjMY
         bVSrGHA4GasTwAwhDXI2UjY0tqQBlOdm+PPhxfzU15050HNQhwikzUQzP8ls5A9t6QS2
         O9Waxth2/ht5+Dfr9L1VcMkdG78YJYQn3FD8xM7xGMDzDKVgHATr07qD8t88v9OlSnkF
         +hCzW6BOGdEGOEA7PQk3zhDiUhHILInPYYCy9Gd7aF/SUzgpbWNEpegbP6G52XkCUO3m
         BtPg==
X-Gm-Message-State: AOAM531t+3A/srGLHJy0Q8tUhondi/cRaC1y9jEwYgVJ2lTnpGhxQsvC
	SNrhd6pUZmM7/7GdlHo5fzZTerge5rb9XWfSNqlc/8YzvgjOJHXk29TSOLa7XpdDU+K3YPQArFN
	cCYowhiQpbBMpOy48M82JT9ar4LdGsO5Wpw==
X-Received: by 2002:ab0:14ce:: with SMTP id f14mr32867800uae.50.1622037363412;
        Wed, 26 May 2021 06:56:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJtF7d3KZ3MenrDN2pRpX/m5oT/p1wrFd4tXmL69qgbesK0af5Jah5586fDe1vLhqceDDxUw==
X-Received: by 2002:ab0:14ce:: with SMTP id f14mr32867618uae.50.1622037362034;
        Wed, 26 May 2021 06:56:02 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id f6sm2100014vsh.31.2021.05.26.06.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 May 2021 06:56:01 -0700 (PDT)
To: samirweng1979 <samirweng1979@163.com>, davem@davemloft.net,
 dinghao.liu@zju.edu.cn
References: <20210526005651.12652-1-samirweng1979@163.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <1aecd37b-88e8-e00d-d0b1-2fd989514c19@canonical.com>
Date: Wed, 26 May 2021 09:56:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210526005651.12652-1-samirweng1979@163.com>
Content-Language: en-US
Message-ID-Hash: AJ3VCSKKD3QB42XZQQVE4COYQJ2ZZARW
X-Message-ID-Hash: AJ3VCSKKD3QB42XZQQVE4COYQJ2ZZARW
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, wengjianfeng <wengjianfeng@yulong.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2] nfc: st95hf: remove unnecessary assignment and label
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/AJ3VCSKKD3QB42XZQQVE4COYQJ2ZZARW/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 25/05/2021 20:56, samirweng1979 wrote:
> From: wengjianfeng <wengjianfeng@yulong.com>
> 
> In function st95hf_in_send_cmd, the variable rc is assigned then goto
> error label, which just returns rc, so we use return to replace it.
> Since error label only used once in the function, so we remove error label.
> 
> Signed-off-by: wengjianfeng <wengjianfeng@yulong.com>
> ---
>  drivers/nfc/st95hf/core.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
