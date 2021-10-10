Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E2A428398
	for <lists+linux-nfc@lfdr.de>; Sun, 10 Oct 2021 22:53:02 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 9D697100EAB78;
	Sun, 10 Oct 2021 13:53:01 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 3A30B100EAB77
	for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 13:53:00 -0700 (PDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9FB1D40016
	for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 20:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633899178;
	bh=VUoZvUcEz5W61r6JJ0vnYx7Iv2cJ136M8cBt3vNkKRo=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=Cg6GwNaIpXwBsjoB2F2R5WeCYlJG/1vXNWTvJjDwvb401T8dudGZIiZ6AJKwmhvcW
	 /WxPq4qGvcFzqPXCSStGIlh/8avTGjkhoCTuTCirk/a02BOKESLkUicK1ssuk+4+8/
	 2LkLhjnrPcajpYOHpOpeg2NmbfN94M8WxGnnfgUXw5JwJRzGTrRXa5he+v0lMT4QNn
	 0M4AHLCp1AW35YVwqgHRH9mE3x17hbCbhpAozLD4k72pop/Y/P8WIfl3r8UAmOwXly
	 jvr624nYId3tlIApY95NN7y7VrLDIi/yigCILsUmfMnHxyA7zzafW+ENwlFbDd0KUX
	 tbF6vwg8Ak6mg==
Received: by mail-ed1-f71.google.com with SMTP id e14-20020a056402088e00b003db6ebb9526so4339000edy.22
        for <linux-nfc@lists.01.org>; Sun, 10 Oct 2021 13:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VUoZvUcEz5W61r6JJ0vnYx7Iv2cJ136M8cBt3vNkKRo=;
        b=FgnOsgBIxuLGOheoEKjV17cpiE1Ehtc9WiqAQzwd+s1bqcHFJjY5KcPAdO7jhMC2F+
         yG/XDyWMRG4g2kHpfJdCYGCZAqI9rlJGdTSGOMGp0bYtITxof+Z9aJG4ZR+5+4f9/ak2
         Yxe48vbwd2arLkfql/KOmT080/TtGA9UQqde6h+GamJHhrgGnVSdnse3IuJqh13dc9ZK
         DJd8psyC5yY0KTmAjPYevzjMhpDCTyE3jIZLFknMBHLSe9O9+omgD3TIA0VwckOfYvTX
         PRNKqB7BgX+YjXhE+ZdAI188zzp8iwIBAAgJsRQ6hm6zE9fCjQUOJxKLxzoyo0t4Z1rC
         Zcbg==
X-Gm-Message-State: AOAM533kDz5AxupGLU8WiAF+OtzKlv+9uW/8rFpIHkAvIwLkPD/8l1ys
	CINb4FErPcv8BW52PtVf4R42VTH/86dKxXuICcxZVs7+u+s0W8EvV1MyLeRdFXQX0Jt5n/pkI3L
	+Xf9WAgz5AC4t7+FZ/cX5ROmvrBG+OUjv1g==
X-Received: by 2002:a17:906:d0c3:: with SMTP id bq3mr21252742ejb.277.1633899178186;
        Sun, 10 Oct 2021 13:52:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUsaX5GVNNhedfg3aGctYY89+Bp8z44cavbVqI0d3fIzvOES2m0gz5xMXHfGP+pcKi3YgXYA==
X-Received: by 2002:a17:906:d0c3:: with SMTP id bq3mr21252732ejb.277.1633899178038;
        Sun, 10 Oct 2021 13:52:58 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w2sm3061619edj.44.2021.10.10.13.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Oct 2021 13:52:57 -0700 (PDT)
To: Rob Herring <robh@kernel.org>
References: <20211010142317.168259-1-krzysztof.kozlowski@canonical.com>
 <1633894316.441793.3158669.nullmailer@robh.at.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <0e26d0e6-9468-63b5-a357-af4c4e7ec677@canonical.com>
Date: Sun, 10 Oct 2021 22:52:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1633894316.441793.3158669.nullmailer@robh.at.kernel.org>
Content-Language: en-US
Message-ID-Hash: LYCQKAKD4COUYUYCPU7RE7IIGA7ALYLC
X-Message-ID-Hash: LYCQKAKD4COUYUYCPU7RE7IIGA7ALYLC
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, devicetree@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Charles Gorand <charles.gorand@effinnov.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 1/7] dt-bindings: nfc: nxp,nci: convert to dtschema
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/LYCQKAKD4COUYUYCPU7RE7IIGA7ALYLC/>
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
> nfc@28: compatible:0: 'nxp,nxp-nci-i2c' was expected
> 	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dt.yaml
> 
> nfc@28: compatible: Additional items are not allowed ('nxp,nxp-nci-i2c' was unexpected)
> 	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dt.yaml
> 
> nfc@28: compatible: ['nxp,pn547', 'nxp,nxp-nci-i2c'] is too long
> 	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dt.yaml
> 
> nfc@30: 'clock-frequency' is a required property
> 	arch/arm/boot/dts/ste-ux500-samsung-janice.dt.yaml
> 
> nfc@30: compatible:0: 'nxp,nxp-nci-i2c' was expected
> 	arch/arm/boot/dts/ste-ux500-samsung-janice.dt.yaml
> 
> nfc@30: compatible: Additional items are not allowed ('nxp,nxp-nci-i2c' was unexpected)
> 	arch/arm/boot/dts/ste-ux500-samsung-janice.dt.yaml
> 
> nfc@30: compatible: ['nxp,pn547', 'nxp,nxp-nci-i2c'] is too long
> 	arch/arm/boot/dts/ste-ux500-samsung-janice.dt.yaml
> 

I missed that new compatible. I'll send a patch adding nxp,nxp-nci-i2c
and try to fix the DTS (missing clock-frequency).

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
