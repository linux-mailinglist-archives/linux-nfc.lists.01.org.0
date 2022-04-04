Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B164F165B
	for <lists+linux-nfc@lfdr.de>; Mon,  4 Apr 2022 15:46:44 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 3DD84100F3FB3;
	Mon,  4 Apr 2022 06:46:43 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN> 
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 1A796100F3FB1
	for <linux-nfc@lists.01.org>; Mon,  4 Apr 2022 06:46:41 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id ot30so10127295ejb.12
        for <linux-nfc@lists.01.org>; Mon, 04 Apr 2022 06:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vfQJmcM0qrYi49vcCG2B2KxC0x5r/jsGZIFrh4niQZc=;
        b=sfdjINLCI7yuAvcOi9KAnb6V86j9QN3KifvcftXLDut+PGBdMIQThW4FvRrmxJqLmd
         QFcTxZRQ3/UbrId+SsClV+HVS1KzpmLCM2iKMQm+JCVEAxQeVapEVO9WQ+rT8ObVNev7
         KfCdHN00ZjbcQy9yqhVrf3I2SJ/F+dmwz3zIFy0oqzrcW71CB/ivFoNuFmhqUffhA/tF
         RSYMJEB6NKp33l3dBxF5Sj1vhQ7Ooe9UViHI7cN2Aihf9Jxvww4j0ktZo9tacyj/mqbn
         p0hwt93y85vKyrVBkxArcMZb04g9v7UAG9oFrpm5lZHdMCgdetLR7WnUUFPuG30IBR7W
         Ye7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vfQJmcM0qrYi49vcCG2B2KxC0x5r/jsGZIFrh4niQZc=;
        b=NGlsJcxGcmkQLMYbSMuhSPaWTuTzd4e13+45w1Reun5YorCi9WBXK9psEgFu+wpk62
         Ttnwc1PcVhuE3Pu3c/pw0ROWA9wqjKufenKRMUWvJ+O9kasWeLyXBZe8/n4VD1LrdVaC
         EiBgI/QT9Zge1UzmhEtAKqro4B4WWuZOq7mg6+MBVd3uvqCoeOSq7W0NVNu/ITn3XtJh
         DdPrk1VYb4LgDKiVDl/rHq4TKQ6iAwgUHplM+veQssUBknmMxnDh1E3cFGQsg3MxuYzj
         ETc3Le172EgkhbB8r3y30WWwVtVcRwWZYmAAzi1k2UHLlhjwkqong396sNdfIaTXG33A
         eRtg==
X-Gm-Message-State: AOAM530gdEzs5KpVOulCICvpi0HG1YZAl2kZXgRw+bdqH42vYG9AptsE
	HcHAyn3/9qd7zRgC9EtHhMbQzA==
X-Google-Smtp-Source: ABdhPJz/Fl/ycPt27uPD1jfBCnT7L/KvY41FuL5OomKqLLI6JcbOroETTemTgVbLNByEEPw/1Ty4xQ==
X-Received: by 2002:a17:907:6d11:b0:6df:f38b:b698 with SMTP id sa17-20020a1709076d1100b006dff38bb698mr48232ejc.711.1649079999583;
        Mon, 04 Apr 2022 06:46:39 -0700 (PDT)
Received: from [192.168.0.176] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id ke11-20020a17090798eb00b006e7fbf53398sm697669ejc.129.2022.04.04.06.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 06:46:39 -0700 (PDT)
Message-ID: <d470dd28-8084-2cda-10b4-006bb90c552a@linaro.org>
Date: Mon, 4 Apr 2022 15:46:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 netdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nfc@lists.01.org
References: <20220330074016.12896-1-krzysztof.kozlowski@linaro.org>
 <164907989905.809631.16161802401962719876.b4-ty@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <164907989905.809631.16161802401962719876.b4-ty@linaro.org>
Message-ID-Hash: LTWINNCN4TIYP64FPTJA4MJTEPPBWSZL
X-Message-ID-Hash: LTWINNCN4TIYP64FPTJA4MJTEPPBWSZL
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 0/2] MAINTAINERS/dt-bindings: changes to my emails
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/LTWINNCN4TIYP64FPTJA4MJTEPPBWSZL/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 04/04/2022 15:45, Krzysztof Kozlowski wrote:
> On Wed, 30 Mar 2022 09:40:14 +0200, Krzysztof Kozlowski wrote:
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>>
>> Hi,
>>
>> I can take both patches via my Samsung SoC tree, if that's ok.
>>
>> Best regards,
>> Krzysztof
>>
>> [...]
> 
> Applied, thanks!

Applied to fixes, as Rob asked for.


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
