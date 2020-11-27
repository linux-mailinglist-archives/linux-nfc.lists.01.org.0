Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 191A52C5FD0
	for <lists+linux-nfc@lfdr.de>; Fri, 27 Nov 2020 06:41:33 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 965A2100EBBB4;
	Thu, 26 Nov 2020 21:41:31 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::142; helo=mail-lf1-x142.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 8B1CC100EC1CD
	for <linux-nfc@lists.01.org>; Thu, 26 Nov 2020 21:41:28 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id u19so5412209lfr.7
        for <linux-nfc@lists.01.org>; Thu, 26 Nov 2020 21:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=jTbdJPLCPCmKC1sQucjkCurKOKfvRNOl0rPRqRFsYFs=;
        b=lFl6N3Dg+QQ82za+rkFQ0TN+wf6XTCAJuruvQ/rrIsW+JH+D44/zJlOW3SqcRKZIzT
         lrRUUZPKbtB2kqYAq+AG/QGqZnD3PXXa8rUpw0vPmd3QOKe8zCEtDvYkazvF7Y4BEMAL
         9uMKD7Um+UjqidjIlmJB1Gz24rF2LRwt89wKJlaBEOvo5X67mE2q44rxEr+e0Gzfr8P8
         Km+FaG/xOR4VkuWgezqfjuDohMKNDO928+38/BHAOd2G36s7mO7/NdYODdGc5YzNI4qd
         j7Mmc3ReOCJX5xWGgLsjyniTKsBTL7SfoyFF+ZZ6UJxdrXfpCVrG0BJWXM49wLTuMUWg
         LGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=jTbdJPLCPCmKC1sQucjkCurKOKfvRNOl0rPRqRFsYFs=;
        b=DlE3DmGgkQTVbl+KoRHdTgDgOYfUQi0oHTZYAcTA/7nXh7cODTONJmAQ+E2B8tvoNY
         AJOS8R7krs8kPh2RkTeLtbSlUz+f7AGAJEiEqJTcw6jBj8MbkWwBsutnmNF/mEs0nf+P
         pxn3mwqk/4AxaoJslAkINegyLZ8IQ8fX8X11TnMntvVby3wwkWdWA2XUTDIKkSOCxKNC
         AdpNwBkMzd1T7sNVXYSdhm8d4kbDAbYXhWM2vNoU8niQ9GN7UFeekPl0xLwWb8YgNSV3
         QO7QvKgunkPlDyvcrSADzDa5lFCzb8BZF8i8xDkXhoZiMMGdAfwimNN0xYY6kulCEm2r
         dTnw==
X-Gm-Message-State: AOAM532XkU7AOxguEU1eSBgliTTaFAnJIhfyFcvwpURoNOeZxK9s/gk0
	N7pxksy6vAkpA0wsubWbFiZzVkzt5OoYNHU+hcE=
X-Google-Smtp-Source: ABdhPJyAeMEzfdGrvJT9b5AUNWayhzIAW5+4r+WiiKzD3LJnSTc5sziUMYp+pVfE4rkRvctYI3pCNM0lKqC81E7N614=
X-Received: by 2002:a19:f60e:: with SMTP id x14mr2458236lfe.199.1606455686176;
 Thu, 26 Nov 2020 21:41:26 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9a:999:0:b029:97:eac4:b89e with HTTP; Thu, 26 Nov 2020
 21:41:25 -0800 (PST)
In-Reply-To: <CAEx-X7esGyZ2QiTGbE1H7M7z1dqT47awmqrOtN+p0FbwtwfPOg@mail.gmail.com>
References: <1606404819-30647-1-git-send-email-bongsu.jeon@samsung.com>
 <20201126170154.GA4978@kozik-lap> <CAEx-X7esGyZ2QiTGbE1H7M7z1dqT47awmqrOtN+p0FbwtwfPOg@mail.gmail.com>
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
Date: Fri, 27 Nov 2020 14:41:25 +0900
Message-ID: <CACwDmQA5acuCpUcjf7Q0biG9KnfK+3WGjTDbDaFpnMMMhBv9sg@mail.gmail.com>
To: krzk@kernel.org
Message-ID-Hash: WDNXSG2RHXTREDOULNT2IYBERH4ZQKH6
X-Message-ID-Hash: WDNXSG2RHXTREDOULNT2IYBERH4ZQKH6
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next 1/3] nfc: s3fwrn5: use signed integer for parsing GPIO numbers
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/WDNXSG2RHXTREDOULNT2IYBERH4ZQKH6/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/27/20, Bongsu Jeon <bs.jeon87@gmail.com> wrote:
> On Fri, Nov 27, 2020 at 2:06 AM Krzysztof Kozlowski <krzk@kernel.org>
> wrote:
>>
>> On Fri, Nov 27, 2020 at 12:33:37AM +0900, bongsu.jeon2@gmail.com wrote:
>> > From: Krzysztof Kozlowski <krzk@kernel.org>
>> >
>> > GPIOs - as returned by of_get_named_gpio() and used by the gpiolib -
>> > are
>> > signed integers, where negative number indicates error.  The return
>> > value of of_get_named_gpio() should not be assigned to an unsigned int
>> > because in case of !CONFIG_GPIOLIB such number would be a valid GPIO.
>> >
>> > Fixes: c04c674fadeb ("nfc: s3fwrn5: Add driver for Samsung S3FWRN5 NFC
>> > Chip")
>> > Cc: <stable@vger.kernel.org>
>> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>>
>> Why do you send my patch?
>>
>
> I think that your patch should be applied before refactoring for this
> driver.
> So, I applied your patch to net-next branch and included your patch at
> my patch list.
> Is this the wrong process?
>

Sorry to confuse you.
I found your patch when i updated my workspace using git pull.

>> Best regards,
>> Krzysztof
>
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
