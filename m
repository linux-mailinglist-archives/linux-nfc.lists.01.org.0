Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60578395617
	for <lists+linux-nfc@lfdr.de>; Mon, 31 May 2021 09:30:26 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 9C952100ED48C;
	Mon, 31 May 2021 00:30:24 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id D7F63100EF267
	for <linux-nfc@lists.01.org>; Mon, 31 May 2021 00:30:22 -0700 (PDT)
Received: from mail-wm1-f72.google.com ([209.85.128.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lncNR-0002F7-IM
	for linux-nfc@lists.01.org; Mon, 31 May 2021 07:30:21 +0000
Received: by mail-wm1-f72.google.com with SMTP id 18-20020a05600c0252b029019a0ce35d36so1519130wmj.4
        for <linux-nfc@lists.01.org>; Mon, 31 May 2021 00:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cAlI26tnTTG5mkLy5nypjSlUByQ/kCeC+Y7Gnr7Dwj8=;
        b=EnBfe/LR0FKPqKHh44YWewudAZAioBanG9SxdShBjsJthVPdzt5+r7kgqxpaArorbV
         1bBGMDzVUNEMcnKWKdCtVD4j0qEwaZC3ccQ1bUNFap2RmUn9iHyB0g2bQw4Ygw9y1c+y
         aGyVTcStaaTJi7G3JmdbChTuGey+rYynrp6KZdacKXUIc4ZQ8OyQ5JT7VGwIosl/9ZXR
         /eI0Lr8iX0VVkiL7oZ0X0DKcTGE67b0p13O19hI8L4X6wAGtsTfyp2qe+g0ookhPBlh0
         9VSJcOnwrUw7sK8yEJ8hIys8sB5dQ1iXZPQivMbon7nxjJqBHr49GxYdLjlFeFTA2xBb
         q/Bg==
X-Gm-Message-State: AOAM531PeDYUqZmfK9P10/T55bvp9VgL6Iq59XSnlrqn/+Rb/Q2jdxUN
	VccV0TJA9lO+lll77Chf+RInp4frEs8/xfSW+KobZdt2U+Lh/3Xwpk1O4aefMrX5gxIdKWf/f0Z
	JosTz/h/8XB2Z5ycjyCAGU//QugukeUVUEg==
X-Received: by 2002:a7b:c084:: with SMTP id r4mr19400423wmh.102.1622446221387;
        Mon, 31 May 2021 00:30:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGn2RwHbI3WaJdd8bqimsKztQEfvYoe5ivVyqd/sUnbSsNPwopPg2sBXTTyFD3lrJGA4eoOw==
X-Received: by 2002:a7b:c084:: with SMTP id r4mr19400386wmh.102.1622446220937;
        Mon, 31 May 2021 00:30:20 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id v15sm22303365wmj.39.2021.05.31.00.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 May 2021 00:30:20 -0700 (PDT)
To: Jakub Kicinski <kuba@kernel.org>
References: <20210528145330.125055-1-krzysztof.kozlowski@canonical.com>
 <20210528151340.7ea69c15@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <4f44c25c-c296-ba3e-7c6d-bc1016574231@canonical.com>
Date: Mon, 31 May 2021 09:30:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210528151340.7ea69c15@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
Content-Language: en-US
Message-ID-Hash: YJX3XPYDO56S5CFR7L73NN6VGAOAIHHL
X-Message-ID-Hash: YJX3XPYDO56S5CFR7L73NN6VGAOAIHHL
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: "David S. Miller" <davem@davemloft.net>, Randy Dunlap <rdunlap@infradead.org>, linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 01/11] nfc: fdp: drop ftrace-like debugging messages
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/YJX3XPYDO56S5CFR7L73NN6VGAOAIHHL/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 29/05/2021 00:13, Jakub Kicinski wrote:
> On Fri, 28 May 2021 10:53:20 -0400 Krzysztof Kozlowski wrote:
>> Now that the kernel has ftrace, any debugging calls that just do "made
>> it to this function!" and "leaving this function!" can be removed.
>> Better to use standard debugging tools.
>>
>> This allows also to remove several local variables and entire
>> fdp_nci_recv_frame() function (whose purpose was only to log).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> Hi! Would you mind reposting these 11 fixes? build bots don't
> understand series dependencies and the last patch here depends 
> on the previous clean up set.

Sure, no problem.


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
