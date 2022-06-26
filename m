Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C3555B57E
	for <lists+linux-nfc@lfdr.de>; Mon, 27 Jun 2022 05:05:12 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id C7A5B100EA101;
	Sun, 26 Jun 2022 20:04:47 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.41; helo=mail-ej1-f41.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN> 
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 3A526100E6C29
	for <linux-nfc@lists.01.org>; Sun, 26 Jun 2022 13:02:20 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id h23so14899499ejj.12
        for <linux-nfc@lists.01.org>; Sun, 26 Jun 2022 13:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/dHdhk9iSqnCzmK8wQDYGABZ8GvQS0ONofRd5NT5Ei4=;
        b=GgfhNWvWw7MYFIu+a9jPtPG2t0BzcvYNpIHFK72XmfTMDjXUeLDWa/QX9bm5Ivx1WQ
         9gBjCy5nNc95xBhXP2U5KgNYU6jHA0HCNzBTCZ+ER/Qo+Iw1/KsXoarIaZ1wLQVP6R72
         BfLjlvgS7wD2XzLcsXTPQ6Xk54ev7jsytuQA20iKSsgz5eW6s2cFUKG6iAvJ38K5vmVi
         BC1Z4JIgoUrlMCXDGsTdyt5YaeRensip/iZSaWdfS0qyquTL5dZi7Dqmxcd7vNOpYvr6
         beGJryK3qiK+wiK2pFaErPZq7XL/6q56xDCJ2agYXvmQ1GJCCXM+OA233kmc65Gxvrzw
         YwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/dHdhk9iSqnCzmK8wQDYGABZ8GvQS0ONofRd5NT5Ei4=;
        b=s4FnRUTZDtJPxntUQSwvE8a/taHoJI8BNr/bqBuHr1yCVmYnQK6G2uaoI6A48eA5db
         F/W9Lo7RKgGx2FOCxynfWWDgoKlWoYaABqysJw0lCsAWO+dBkkupEjyAapgFNEYt6Kae
         g8utOZI78eILz9Jw85+nBkNnDxuwMyGZuZ8dDJlJ5LJcJay4JILQWq0MfnvneMZ9ZcLl
         K/kQ7VFfMjzlBYIwDDkiy1GuvTR92GinwxTEcPcMhBHRFYJGCvxbXYQpKBQs1gz1nU/D
         XhQWRhKlrXmc0W8Y0GOPF1wsI8V6SOvgvtyONucExTgjJXNmgbG5KUNexgdVfxdbQbm5
         L9eg==
X-Gm-Message-State: AJIora9sOhOdD7rY5kLb0q1RyfHwMEI1datCQp0q2gtDD9f2h5ZVI2nO
	HfwE+9b3crugVBQyQUYAR3N72g==
X-Google-Smtp-Source: AGRyM1t9NeUDMF6za5hKlOFTVIoS0uVollNBtYIZoGH9DQtIvuLwltJirMTqp1+X3zUOea8cICce7g==
X-Received: by 2002:a17:907:1c0b:b0:711:cc52:2920 with SMTP id nc11-20020a1709071c0b00b00711cc522920mr9371914ejc.301.1656273678091;
        Sun, 26 Jun 2022 13:01:18 -0700 (PDT)
Received: from [192.168.0.245] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q14-20020a1709066ace00b00722e603c39asm4182115ejs.31.2022.06.26.13.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 13:01:17 -0700 (PDT)
Message-ID: <6f338cbb-9602-fe28-74ed-98bd8f110c6c@linaro.org>
Date: Sun, 26 Jun 2022 22:01:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
References: <20220626200039.4062784-1-michael@walle.cc>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220626200039.4062784-1-michael@walle.cc>
Message-ID-Hash: 7YVHMAZH3WRM6NPLVTSKORAIWMLAUTJS
X-Message-ID-Hash: 7YVHMAZH3WRM6NPLVTSKORAIWMLAUTJS
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-nfc@lists.01.org, netdev@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] MAINTAINERS: nfc: drop Charles Gorand from NXP-NCI
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/7YVHMAZH3WRM6NPLVTSKORAIWMLAUTJS/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 26/06/2022 22:00, Michael Walle wrote:
> Mails to Charles get an auto reply, that he is no longer working at
> Eff'Innov technologies. Drop the entry and mark the driver as orphaned.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
