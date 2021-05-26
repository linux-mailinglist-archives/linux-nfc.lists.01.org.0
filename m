Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F5939194C
	for <lists+linux-nfc@lfdr.de>; Wed, 26 May 2021 15:56:30 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 10B8A100ED49E;
	Wed, 26 May 2021 06:56:29 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id A5C1B100ED482
	for <linux-nfc@lists.01.org>; Wed, 26 May 2021 06:56:27 -0700 (PDT)
Received: from mail-vs1-f70.google.com ([209.85.217.70])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1llu1J-000674-IG
	for linux-nfc@lists.01.org; Wed, 26 May 2021 13:56:25 +0000
Received: by mail-vs1-f70.google.com with SMTP id z5-20020a67d2850000b029023673cc643bso274928vsi.7
        for <linux-nfc@lists.01.org>; Wed, 26 May 2021 06:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wk3UlUCfkCL6QN9YaFyZimOXVt4iG+84u/Humu+3uZw=;
        b=sK80C6KMVZxJ9iVRyu+kNd8oFP2UZ33klmgdV9c55SLQZWHPQo6b+OWZfAWi0KjRJ3
         vuULbxaSstyvWnjEgsYXXwC2v537W8sQQ9sw/chRPOstjHeoO1Ku+nyvJB6kEp0r6fza
         eOBUSEZ/DPE1g8eXMFwzwtLnN+RnsvRsBzVNk00Dder3wxM+n56dvjIHHyM0l4cPKE86
         AwS3aAyPbFQOcGGEfB+z3zZeEyJZ3IVCroe3pYXZYD5hXLzl8ndufMI1J9hHdwsmJ1vE
         Dt7A/FXyU1u1JhAInOgW2HsznkNijYuejZN8xWu6feORk+FKRcbnsoBqPprHpTkCK3VB
         O2VQ==
X-Gm-Message-State: AOAM5303d1u38QOtsk6ZZsw3vvyWvxYmdumXFGidnxbf+VrsCviBXudi
	GSiLY2f5yhU3SfULzJWhTlBz6ZtZULdxye9LmyS9meKoSZaTnaTxhUxQz/wPTJ7Ov9ZpLsEJIVH
	7oKNwDjZT/NJVgjFuWeT7eJ/bh9a8wYeEvA==
X-Received: by 2002:a67:b919:: with SMTP id q25mr31366089vsn.17.1622037384733;
        Wed, 26 May 2021 06:56:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxinuLNMn5s0odgmLxRBXmJbtLvoYFepINUvv6jG+v4e1LdZ3aCTN15rHZ6f5RTZ6en80fFWA==
X-Received: by 2002:a67:b919:: with SMTP id q25mr31366076vsn.17.1622037384616;
        Wed, 26 May 2021 06:56:24 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id b26sm2113090vsh.23.2021.05.26.06.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 May 2021 06:56:24 -0700 (PDT)
To: samirweng1979 <samirweng1979@163.com>, davem@davemloft.net
References: <20210526011624.11204-1-samirweng1979@163.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <dcb14fe3-4907-43f6-d79f-27599f1be249@canonical.com>
Date: Wed, 26 May 2021 09:56:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210526011624.11204-1-samirweng1979@163.com>
Content-Language: en-US
Message-ID-Hash: SDRZKPL3P45I37QDGRRF43KROF7PG3X5
X-Message-ID-Hash: SDRZKPL3P45I37QDGRRF43KROF7PG3X5
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, wengjianfeng <wengjianfeng@yulong.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2] nfc: st-nci: remove unnecessary labels
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/SDRZKPL3P45I37QDGRRF43KROF7PG3X5/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 25/05/2021 21:16, samirweng1979 wrote:
> From: wengjianfeng <wengjianfeng@yulong.com>
> 
> Some labels are only used once, so we delete them and use the
> return statement instead of the goto statement.
> 
> Signed-off-by: wengjianfeng <wengjianfeng@yulong.com>
> ---
>  drivers/nfc/st-nci/vendor_cmds.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
