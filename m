Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9BE416289
	for <lists+linux-nfc@lfdr.de>; Thu, 23 Sep 2021 17:54:50 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 53277100EB34A;
	Thu, 23 Sep 2021 08:54:48 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id E5A9C100EBBA2
	for <linux-nfc@lists.01.org>; Thu, 23 Sep 2021 08:54:45 -0700 (PDT)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C4F8940264
	for <linux-nfc@lists.01.org>; Thu, 23 Sep 2021 15:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1632412483;
	bh=RpNIIqsG4ktzWwJMj9n7TezeCNMWkufILMGcYlWLh8M=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=ozSD73NCcjIBZ3w75Y64MuaY3/FvMFfwMg6g/LOfi2yHyMtu8dascZiD+zV2M5vNl
	 kEDewuLhiqg1k061/ZB0I0TxpDAUrfIwTNBcAJ+5KE0VEt1c1Oq/Ex6RiyjSi5wLSz
	 kyJKpQpsaBIoAnO2j1+eXSb+tUYwCaaD7MyEbC19nuPsQHvHe2rSHA0sDIer38hzDb
	 TFwPclQeepNzPUweul4fHO7lif1znVIuHrtt4CdR5ojxzjmYmG2GHUUADgLH1hhW4B
	 q485MvQ6kJzE3u090dA4AxfY3vYUqKbCtd7XKWWAlcSGEx5n6ssKgpil5AGPpglzBt
	 LSL4Af47vcJ+g==
Received: by mail-wr1-f72.google.com with SMTP id r15-20020adfce8f000000b0015df1098ccbso5563886wrn.4
        for <linux-nfc@lists.01.org>; Thu, 23 Sep 2021 08:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RpNIIqsG4ktzWwJMj9n7TezeCNMWkufILMGcYlWLh8M=;
        b=Y7sPt7LZGb3/08oMlOVPjpwlDaDLfeTHEpSsJVKHKVJJL90PxocogAvQXtzR3C/QFj
         l7sBSzDmlbd4r9fLqmEaAQtFrO753pk6OxRFqvHErPhtigBnDXK/874c4+WiBxAl8LQC
         M/Oxnm+tB9mn5O3kBRQaGHFG8LIrxopHxwFKSGF7OorQJgO/yA7wb1xL6RHsORj9CdX2
         Z7r9odki0fQy46Z2VqlzIBKAkZm0/GWML0Zz/I5EeWWihGe59uQRC9x5Aeuo2ME9vfp2
         p+D8zZvrYYeGFPzWdr3p53/5p+SmBn+9VSAG3+jO3hlfjOgwaDxz2LeePmrhJPaED94o
         JIMQ==
X-Gm-Message-State: AOAM532xgNP8gTk8reJJcW3egWmDeXhuGBh96gqITeoGnXmC5AumcKf7
	AK355p3mFu75FAbB/OrnTasmK4nfEcdMJnjcsnX1SI+Ex/48wwvMC8e2nKh8xv67HPj1jqu4weg
	ynNYOcKMNMiryCRGUEEMlr8rpzCPBxVfARg==
X-Received: by 2002:a1c:7219:: with SMTP id n25mr5284140wmc.107.1632412483220;
        Thu, 23 Sep 2021 08:54:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRwBiyLe86hiVAeIPS6fGY13BXN794FF7P1o8rmMW1rV8vhQODA9KjoacWe+lqSwAFX3M30w==
X-Received: by 2002:a1c:7219:: with SMTP id n25mr5284123wmc.107.1632412483005;
        Thu, 23 Sep 2021 08:54:43 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id x17sm6028183wrc.51.2021.09.23.08.54.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Sep 2021 08:54:42 -0700 (PDT)
To: linux-nfc@lists.01.org
Cc: Mark Greer <mgreer@animalcreek.com>
References: <20210922161113.142758-1-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <16360c35-bc5d-c2f6-4a44-1521b3b67962@canonical.com>
Date: Thu, 23 Sep 2021 17:54:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922161113.142758-1-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
Message-ID-Hash: IQRXLDP5GJBGUTV52P6GL5QPNGUOJKAR
X-Message-ID-Hash: IQRXLDP5GJBGUTV52P6GL5QPNGUOJKAR
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [neard][PATCH 1/8] build: adjust configure.ac syntax to match autoupdate
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/IQRXLDP5GJBGUTV52P6GL5QPNGUOJKAR/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 22/09/2021 18:11, Krzysztof Kozlowski wrote:
> Effect of autoupdate, without changing the version.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  configure.ac | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configure.ac b/configure.ac
> index 25b12b9a85d8..a1f7bd8bf56a 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -1,5 +1,5 @@
> -AC_PREREQ(2.60)
> -AC_INIT(neard, 0.17, [linux-nfc@lists.01.org])
> +AC_PREREQ([2.60])
> +AC_INIT([neard],[0.17],[linux-nfc@lists.01.org])
>  AC_CONFIG_MACRO_DIR([m4])
>  
>  AM_INIT_AUTOMAKE([foreign subdir-objects color-tests])
> 

All applied to master in https://github.com/linux-nfc/neard

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
