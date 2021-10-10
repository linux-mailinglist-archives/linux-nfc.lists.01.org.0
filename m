Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 191CC428396
	for <lists+linux-nfc@lfdr.de>; Sun, 10 Oct 2021 22:51:37 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 773E8100EAB73;
	Sun, 10 Oct 2021 13:51:35 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 0C615100EAB70
	for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 13:51:32 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 967913F324
	for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 20:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633899090;
	bh=v9Hlca2h1Hh9i8XXavu//vSEpOtNM2PYGAkdRD7X2go=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=JZFELgw7K0VD1IMh+hu0KyjgYongMtaaJBYo1b7wFYJzYnvSYWpnQ5iE9/jdr/qcg
	 LAEPB2afCUSJ56tVi1mUgI6VUdJRlUUJ9os/tCsnAuotwZA1YFzq/7oJS4yTn7HqVB
	 Y88g8DpUr/peeM3bggW0sC47V5PAADWqE05IpQMBrvdjKM5c59bMYc8bO0RvojTGj5
	 ufuHfw35PKcu+xUGSqhWWklz5nDMKyXUJQtXlKrqw/dpJtURYpTOQ6nLLXw39dJqfG
	 FB6otqlLmL/FcylGrSniknfPJfQy7vFf0FtCqq/rtsDiAMZu0pgGu6TWiiObDwDB+A
	 sCi/+mBhAK+hw==
Received: by mail-ed1-f70.google.com with SMTP id 2-20020a508e02000000b003d871759f5dso13911115edw.10
        for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 13:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v9Hlca2h1Hh9i8XXavu//vSEpOtNM2PYGAkdRD7X2go=;
        b=DiDJ/Ej8TIprOqM4PrPXRKH4u31lUmeYYHcnjS30QCzJxM9w4ftG7oMpuJEw0jEKXj
         41v6OCbmDWghYACeiPW6lAWai1u397fCFPeXz9DtcYWoPzn3ykoBku6MWlVzMqjzUCbw
         uVDTzD0nau6RZwDxLlhrs9WRcoUk0EH1LIzYDAyJ03Ziiu4uhjqKlrr5UmFY4cmvmq7n
         FAioDxmvJ/PZBP62GFbZ/YKZAz4KgXp9HYmg6Ysk7GSAggqluB208m0I90setIOx7BTK
         /mFwu+4zhps7d3cRRBf7/13Di9sflornXwfH5guiCkJOqAwVEeyUC7y9QIdV/mW3pleR
         +92A==
X-Gm-Message-State: AOAM530lOk2LBoOpHvO7pTR2/WWVmweF+HkffGlJOvqwJkgpaeCKUTRX
	vOodT7i/AXY10ANYwUWZqD3T+nxVlhdgBmWBQ6/zUy2hvgNAOBbFt2YR5XzQCRWyQ6vfXYiDzw3
	GJ1SMcNPX8a4c3iCwOD6mUTqfF9CAxg9RBA==
X-Received: by 2002:a17:906:3192:: with SMTP id 18mr21236984ejy.246.1633899090340;
        Sun, 10 Oct 2021 13:51:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjRNid0wZoUMAIiXI0MXbANDRhB9LTg/OYg47esYCah+m3e1tvb/+lQTYbtBYkGvBFAh3XVw==
X-Received: by 2002:a17:906:3192:: with SMTP id 18mr21236965ejy.246.1633899090203;
        Sun, 10 Oct 2021 13:51:30 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id m9sm3032908edl.66.2021.10.10.13.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Oct 2021 13:51:29 -0700 (PDT)
To: Rob Herring <robh@kernel.org>
References: <20211010142317.168259-1-krzysztof.kozlowski@canonical.com>
 <20211010142317.168259-6-krzysztof.kozlowski@canonical.com>
 <1633894316.452946.3158671.nullmailer@robh.at.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <a16d9765-a5d1-c8bc-729d-1c807b24e393@canonical.com>
Date: Sun, 10 Oct 2021 22:51:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1633894316.452946.3158671.nullmailer@robh.at.kernel.org>
Content-Language: en-US
Message-ID-Hash: N5NS4VVEGM2TALO5YBBZ3SC2WJCSTUY3
X-Message-ID-Hash: N5NS4VVEGM2TALO5YBBZ3SC2WJCSTUY3
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Charles Gorand <charles.gorand@effinnov.com>, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 6/7] dt-bindings: nfc: ti,trf7970a: convert to dtschema
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/N5NS4VVEGM2TALO5YBBZ3SC2WJCSTUY3/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/10/2021 21:31, Rob Herring wrote:
> On Sun, 10 Oct 2021 16:23:16 +0200, Krzysztof Kozlowski wrote:
>> Convert the TI TRF7970A NFC to DT schema format.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  .../bindings/net/nfc/ti,trf7970a.yaml         | 98 +++++++++++++++++++
>>  .../devicetree/bindings/net/nfc/trf7970a.txt  | 43 --------
>>  MAINTAINERS                                   |  2 +-
>>  3 files changed, 99 insertions(+), 44 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/net/nfc/ti,trf7970a.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/net/nfc/trf7970a.txt
>>
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/patch/1539014
> 
> 
> nfc@0: 't5t-rmb-extra-byte-quirk', 'vin-voltage-override' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	arch/arm/boot/dts/imx6dl-prtrvt.dt.yaml

I already sent a patch for this one.


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
