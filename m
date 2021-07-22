Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3873D2ADE
	for <lists+linux-nfc@lfdr.de>; Thu, 22 Jul 2021 19:13:31 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 9E78C100EBB6C;
	Thu, 22 Jul 2021 10:13:28 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=vindrg@gmail.com; receiver=<UNKNOWN> 
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 786C1100EBB61
	for <linux-nfc@lists.01.org>; Thu, 22 Jul 2021 10:13:25 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id h9so8256831ljm.5
        for <linux-nfc@lists.01.org>; Thu, 22 Jul 2021 10:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=CRCFwsQOXkT0mbXd3z3LBiBD6q2OZ4JY8b+72EAn3F8=;
        b=bKRPrZT8cZh2kSSLpIciaydzSZwb4n3VGEZDTBA7tFwJDhz/hlpBiWCtKozTrxkNby
         +Lk4hXwR1BWMzbDd2tCCAmSu/zcsZSEu9HJ6ExO1YkwRQz1pxFZ9jn8O/8xGbfi3eEfR
         512nXBjwCyXmPd3DyoJE1ZhWnwfYtiwJlzv5HmRlwlVBuNY5Egc8Ps71RM/14/Mb0W+E
         xXIEbqiZZQlHQTtSJBnEjvQOfJ4BMiFAa6qx8ul0+YWo+89QYFXcb5iCvdkfrnRVblMb
         vraz8njYeRC6a9oECOE10nUrhIR7PvL1H56K/86HQnSOCfXT7Lf57GYA1KnZA1IsPadE
         zxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CRCFwsQOXkT0mbXd3z3LBiBD6q2OZ4JY8b+72EAn3F8=;
        b=O6hktGjf9Mrrva7aFrc/yM3z6FLzE5YbsuYC0ZAZgUj9MqXzMMtEGJ2whf3d6sj+qx
         ysR0EEaO5c+tqKdiQLT6IBQsaeiUliGq8afLqi3uT4TLSb7ivfubyP077IiqDx8vxQWN
         WsGZzQVT6SEqXNIrgORBMXnMz4Y6d4ytPmZlZReEID28J21Y+fAlhXtQiCcMbPcEtkVL
         v2kq3OpVhSl7nmlAC1eOmGK8DvaEXir60b6/Vqo27PPpXp/PTsCA8//uL1E/+N47z8dS
         2ml0vNQTuujLr84lKsq1vM+wzo3jiFMWkpkIyB/slPfAHe4zCSsG+35hh0srT/mC1YGf
         INgQ==
X-Gm-Message-State: AOAM533Xl3P4xk8YrkC04BaoWclfeoGg7PFhIhqs/E0rqgRclJdrU5vb
	bordC9VS4ytKgsQRf+eY02Rw0Oy9U/c=
X-Google-Smtp-Source: ABdhPJyTifWjMeJ3Ok+9Sff4AOs6cX1Gd20q5jJX8IpCSVq0uBjO+JHlEn2mAAAtrC4jlq/9pFCk3g==
X-Received: by 2002:a2e:9215:: with SMTP id k21mr726097ljg.91.1626974002078;
        Thu, 22 Jul 2021 10:13:22 -0700 (PDT)
Received: from [192.168.1.10] (mail.dargis.net. [62.80.227.49])
        by smtp.gmail.com with ESMTPSA id d7sm2955828ljq.112.2021.07.22.10.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jul 2021 10:13:21 -0700 (PDT)
To: Frieder Schrempf <frieder.schrempf@kontron.de>, linux-nfc@lists.01.org
References: <CAPNCXk0qkc-5myby0TdzD=6kBXSd_o_iNGy6jjjO5YXeyZqceg@mail.gmail.com>
 <e35ac631-3b84-f6c5-3f34-b6859f3b709f@kontron.de>
From: Vincas Dargis <vindrg@gmail.com>
Message-ID: <338d62d6-b59b-1742-b146-1278ae1b9139@gmail.com>
Date: Thu, 22 Jul 2021 20:13:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <e35ac631-3b84-f6c5-3f34-b6859f3b709f@kontron.de>
Content-Language: en-US
Message-ID-Hash: Z4JF3YQAECQSIPCOV3PJBS3UC7JMPEXO
X-Message-ID-Hash: Z4JF3YQAECQSIPCOV3PJBS3UC7JMPEXO
X-MailFrom: vindrg@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: About NFC Tag emulation on Linux
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/Z4JF3YQAECQSIPCOV3PJBS3UC7JMPEXO/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

2021-07-22 15:34, Frieder Schrempf wrote:
> By the way, this is only true for Qt up to version 5.15. They dropped neard support for Qt 6 (see https://bugreports.qt.io/browse/QTBUG-81824).

Ouch... good catch, so I just scrap the idea... Thanks.
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
