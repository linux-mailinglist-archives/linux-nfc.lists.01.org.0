Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D7C4283A3
	for <lists+linux-nfc@lfdr.de>; Sun, 10 Oct 2021 22:59:06 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 29075100EAB7D;
	Sun, 10 Oct 2021 13:59:05 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id E2B24100EAB79
	for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 13:59:02 -0700 (PDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9C70040013
	for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 20:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633899541;
	bh=vbA6KQmT88TPosyqyyvRSbT6u/s6NWq+qTxHMzpWCdA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=aafMjLiidKOfsoeaHM20W+8ZulnVY8h64S3f2lL0Tno1x5kCfuGvMWH3BUYRAM+t7
	 NXmC7wXvSoh8XdQ33xM4nOD12sSM7Ej1sfMpQ4xNUmOTqVjn3LiFM3xljxa7G1PVle
	 MLacPZYnipHWZY65L+IhVDSegidceVU1uQlBvT9/Xl1E4iS1vXJBlvfyMgAhRVIqi0
	 IChraGyGK0wMiLfMZbzJOI2ioEDP6YqlV6TT+2WedGkk5VEZcuIl6LDU+ICtL4eu9w
	 lafKR3Xto5h0HnWLl6gNrBf6mufPBAlwPraDSdK3NOA008yccTM3/7f+2LePYvh7O3
	 I5rBP990MTXWw==
Received: by mail-ed1-f71.google.com with SMTP id e14-20020a056402088e00b003db6ebb9526so4345256edy.22
        for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 13:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vbA6KQmT88TPosyqyyvRSbT6u/s6NWq+qTxHMzpWCdA=;
        b=i+rCRdnziNIiUO025A5tKaSKWWvrvn5Z7xgLw0MEZfe2IVtFl5sCp4uXUntx2sqpB/
         TNPRIJa07PeL6MPbWj53Hnhb4dQCD53x2AHXe3HMEnl+SgC71sXdqFCOENXFlBFg4+BL
         c6VOEB873XrlkHMFuq00UxHKF69w5HL9M7kapUwEaz72f987DlixILmevEzxbzLxzLj9
         zWW4Us08LCDwsZRak8+Nm3DHxu4PY73vM/sOhWvTa718f4envBFhPy6cQ2m35pUfV2GC
         FHcpj80zUFGAGtgT04X+RpchFFHgHdFCm9NhHnp6fXoIwORpAwA9FyvVJJp4n9L5yq1/
         bASw==
X-Gm-Message-State: AOAM530C0gC3HxDJH7SWmfA1fK0JtbjkchrJPVgYnwETC27TuJ+eR2QS
	g9buAXlzy/5TA0ZJJdreOTASjfRYVqT+5K6xJ6oHzwOARrTWfDfhkk3rhKk2P+pDhg95j838/G2
	yuofsgERlIRP5B6se4jL6yquhRC0tN7QSCw==
X-Received: by 2002:a05:6402:1941:: with SMTP id f1mr8554631edz.3.1633899541310;
        Sun, 10 Oct 2021 13:59:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFdhFoFHiozNsDRv0hkz318JVGkZTHVd/QS3nQ6sTbPFwP2FFLCChwQCYgJKHsOaeft+JO3g==
X-Received: by 2002:a05:6402:1941:: with SMTP id f1mr8554606edz.3.1633899541074;
        Sun, 10 Oct 2021 13:59:01 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id fx4sm2495638ejb.113.2021.10.10.13.58.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Oct 2021 13:59:00 -0700 (PDT)
To: Rob Herring <robh@kernel.org>
References: <20211010142317.168259-1-krzysztof.kozlowski@canonical.com>
 <1633894316.441793.3158669.nullmailer@robh.at.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <f955726a-eb2d-7b3e-9c5f-978358710eb6@canonical.com>
Date: Sun, 10 Oct 2021 22:58:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1633894316.441793.3158669.nullmailer@robh.at.kernel.org>
Content-Language: en-US
Message-ID-Hash: T4PZBMHFXQQCA3ADG3S3POPMW23DSKLA
X-Message-ID-Hash: T4PZBMHFXQQCA3ADG3S3POPMW23DSKLA
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, devicetree@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Charles Gorand <charles.gorand@effinnov.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 1/7] dt-bindings: nfc: nxp,nci: convert to dtschema
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/T4PZBMHFXQQCA3ADG3S3POPMW23DSKLA/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/10/2021 21:31, Rob Herring wrote:
> On Sun, 10 Oct 2021 16:23:11 +0200, Krzysztof Kozlowski wrote:
>> Convert the NXP NCI NFC controller to DT schema format.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  .../devicetree/bindings/net/nfc/nxp,nci.yaml  | 61 +++++++++++++++++++
>>  .../devicetree/bindings/net/nfc/nxp-nci.txt   | 33 ----------
>>  MAINTAINERS                                   |  1 +
>>  3 files changed, 62 insertions(+), 33 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/net/nfc/nxp-nci.txt
>>
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/patch/1539010
> 
> 
> nfc@28: 'clock-frequency' is a required property
> 	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dt.yaml
> 

Hmm, this actually looks as mistake in bindings. First, clock-frequency
is a property of a I2C bus, not I2C child device. Second, it should not
be a required property anyway, as I2C will choose a default one matching
driver (e.g. standard speed of 100 kHz).

Except the trf7970a NFC driver, none of other NFC drivers parse the
clock-frequency.

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
