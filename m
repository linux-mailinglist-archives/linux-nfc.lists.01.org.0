Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C523D2AE3
	for <lists+linux-nfc@lfdr.de>; Thu, 22 Jul 2021 19:16:55 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E3D36100EBB72;
	Thu, 22 Jul 2021 10:16:53 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=vindrg@gmail.com; receiver=<UNKNOWN> 
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id F197B100EBB6C
	for <linux-nfc@lists.01.org>; Thu, 22 Jul 2021 10:16:50 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id t3so8267922ljc.3
        for <linux-nfc@lists.01.org>; Thu, 22 Jul 2021 10:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Q1HhO7C42Si4I/zqDG4/pAVk+GrW3JSrAc3ShHYGQjg=;
        b=QGVoPNKbjNuwzKJnZ2Md13h9a9YhcIB2OWm386spqUILN6auKQxwIRpFxGa70pwm2i
         /FkqKf1zZj7erstyydTpeWMptiThCvnqiR48Pe8Ahw8l0WtgAKS3vQpcGE6svOtHZqsb
         ylDMWpKmjw1+/auuiWKAGlnxf41YkDiPu2P8VL2aXkfQtPLMnVXVi8Hck+guq2l+5/8r
         1RF4hSQgKi1whRhOFRaZyT217HzesHsDmoNEx5rnyVg9NDkjmQPz6QcwMXHbtr5+5x/P
         FCUATHW09YOtV492rRy2GRXNc8r5+NA2BfhRtu3+cV+G8KTqPnRdjZ3ddJKnH0y+0t6b
         Z2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q1HhO7C42Si4I/zqDG4/pAVk+GrW3JSrAc3ShHYGQjg=;
        b=gOQLIYSVtr/t631+VjGrHs8qqZvQKAXplpDJFvPe6HhHZ4mKQAEmHSCSO4WZHODwJj
         vdRGslITMWSs+suuiFSVSr62XARgW5rBlyHrYLzHgXZSEnFkP0V0juJIWi29Hw3Lf30u
         qUbuHlnQPkogplHIbfncO10djDMg6ZWOhYq2dV/mp393ygyUots+JIklDSXm5gU9fDuU
         xqoQ8j3hyuqeVHu8btydTu5SIIsd10DwP/Kmi+1ClpwwgqWQKbMczjFBk+yinrUNwBy2
         kPrD9oqSQbRPorI/P8P2kSJvWz6zVfHrxVRap6/b4S7d8QdvH0IvEMhAZ1W5gL14YrON
         lk1A==
X-Gm-Message-State: AOAM532Rhm4XFToz10XhkQ4u1qdGag/Pu0KAL/Yj+9he5s/I2J/Xp140
	MMDLJ3dY51izo9AIVbX08hujZdL0i50=
X-Google-Smtp-Source: ABdhPJz97CBHlMZd+nuHTzhrEWkbJro1z7ZiteA5hoHvcS8ccFlcZnKqX8pEltDUAX4RQukrJyJiFg==
X-Received: by 2002:a2e:9b84:: with SMTP id z4mr705052lji.179.1626974206160;
        Thu, 22 Jul 2021 10:16:46 -0700 (PDT)
Received: from [192.168.1.10] (mail.dargis.net. [62.80.227.49])
        by smtp.gmail.com with ESMTPSA id e7sm2484249ljq.9.2021.07.22.10.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jul 2021 10:16:45 -0700 (PDT)
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-nfc@lists.01.org
References: <CAPNCXk0qkc-5myby0TdzD=6kBXSd_o_iNGy6jjjO5YXeyZqceg@mail.gmail.com>
 <c3e98408-8d27-fe0e-4d99-6c1ae1d961ab@canonical.com>
From: Vincas Dargis <vindrg@gmail.com>
Message-ID: <c60058e4-73d3-4545-7165-7d03df865822@gmail.com>
Date: Thu, 22 Jul 2021 20:16:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <c3e98408-8d27-fe0e-4d99-6c1ae1d961ab@canonical.com>
Content-Language: en-US
Message-ID-Hash: I2TI3NXO3XUIVRAP6NSWQI6EKM4XCBHL
X-Message-ID-Hash: I2TI3NXO3XUIVRAP6NSWQI6EKM4XCBHL
X-MailFrom: vindrg@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: About NFC Tag emulation on Linux
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/I2TI3NXO3XUIVRAP6NSWQI6EKM4XCBHL/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

2021-07-22 14:53, Krzysztof Kozlowski wrote:
> I think nfcsim kernel module could help you but I am not sure how much
> you can emulate.

That's interesting, though I'm not sure how should I use it too, and I guess it would be too low level?. And as another 
post mentioned, Qt will not have NFC support on Linux so I just scraping the idea...

Thanks.
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
