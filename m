Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5174F389326
	for <lists+linux-nfc@lfdr.de>; Wed, 19 May 2021 17:59:29 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 22BD4100EAB58;
	Wed, 19 May 2021 08:59:28 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id BECDE100EAB48
	for <linux-nfc@lists.01.org>; Wed, 19 May 2021 08:59:24 -0700 (PDT)
Received: from mail-qv1-f72.google.com ([209.85.219.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1ljObT-0007Ec-7n
	for linux-nfc@lists.01.org; Wed, 19 May 2021 15:59:23 +0000
Received: by mail-qv1-f72.google.com with SMTP id n12-20020a0cdc8c0000b02901efdf8d3bc7so7938256qvk.23
        for <linux-nfc@lists.01.org>; Wed, 19 May 2021 08:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PnooPKSwa6SmA/H8X8W7wHWC0547PfU+gn/DWorwdGQ=;
        b=eJxrREgzL7HfXMniiRHhfmaOIS8EA0xzW/HwdKUT7okjdDlgTrKshb3FfmjGNKPWHz
         +MKzYfcvViydsd5rnpG0g/yEdyQHrvjmUI/AqoM1ikeUW4HRm1lOyrArn6ro/ox6Jzqm
         8AtO7YshZYy3qXSSV++6AED+h9qKHfpBDdbOrxvWjLeSnuKMUa8/9F4auLsg6Al8ufm8
         yfOlHcsfuqpvCsEHGVKMbZzJlZwRBl39qjCMVToSB+nEFmUvVQp9IidZ9RvpuiS22llF
         M2C1nBg1dEhN3LweAbCMyVpVDd/R4CIqcDmGPFwQNLtvbI3sG9bkaZw7s6+TXjmQwVcw
         l52Q==
X-Gm-Message-State: AOAM532g5CDKT/+IuCZ4SOYYw3O5fccQjabVMsAQMQJeODBwP4HkaRIb
	xdXaB4UT4TEU0MUXf5b+3UNGwoHf/Sq35Va3a393J6JoaQyHQsmYtLcjPKxg+NVs9cpKuK8YJDe
	ZkyssgnRsV1dIKPAuV0l+9E3WEJihkiXsQQ==
X-Received: by 2002:ac8:5dce:: with SMTP id e14mr77865qtx.183.1621439962420;
        Wed, 19 May 2021 08:59:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGwuwn46qYHy7r79lyImK37z9ZMvzPgbLiPqex86I0vyobhhsRXb3Fod9XlHot7MGdUrlG5A==
X-Received: by 2002:ac8:5dce:: with SMTP id e14mr77836qtx.183.1621439962143;
        Wed, 19 May 2021 08:59:22 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id g15sm72470qka.49.2021.05.19.08.59.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 08:59:21 -0700 (PDT)
To: Stephan Gerhold <stephan@gerhold.net>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
References: <20210519091613.7343-1-stephan@gerhold.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <c1f02515-a86a-7293-b884-52c388ea70e3@canonical.com>
Date: Wed, 19 May 2021 11:59:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519091613.7343-1-stephan@gerhold.net>
Content-Language: en-US
Message-ID-Hash: 7WK7GHMNMTW55PUFO2AKYPUW74STZTXT
X-Message-ID-Hash: 7WK7GHMNMTW55PUFO2AKYPUW74STZTXT
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>, linux-nfc@lists.01.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>, ~postmarketos/upstreaming@lists.sr.ht
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2 1/2] dt-bindings: net: nfc: s3fwrn5: Add optional clock
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/7WK7GHMNMTW55PUFO2AKYPUW74STZTXT/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 19/05/2021 05:16, Stephan Gerhold wrote:
> On some systems, S3FWRN5 depends on having an external clock enabled
> to function correctly. Allow declaring that clock in the device tree.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
> Changes in v2: Minor change in commit message only
> v1: https://lore.kernel.org/netdev/20210518133935.571298-1-stephan@gerhold.net/
> ---
>  .../devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml         | 5 +++++
>  1 file changed, 5 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
