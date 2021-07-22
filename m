Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 547BF3D2302
	for <lists+linux-nfc@lfdr.de>; Thu, 22 Jul 2021 13:53:44 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 55CFF100EBBD7;
	Thu, 22 Jul 2021 04:53:42 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 5A7CE100EBBCE
	for <linux-nfc@lists.01.org>; Thu, 22 Jul 2021 04:53:39 -0700 (PDT)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 4BD4F3F237
	for <linux-nfc@lists.01.org>; Thu, 22 Jul 2021 11:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626954816;
	bh=hf6nIv0cROSgk9uBrXGh/YvidCZMnHdvO2jJcowIub8=;
	h=Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=HHAAy0nTlKqxPDXvcyMZBwd4jl/jArFd5F5n2g4apQo+Zoqid0D09bE05y89to/jn
	 EoZeuWJLdbB6XvMmbVSXDGghu9oGBRVAP5JGQIYT+OSawfQJYkmRF1twN1vfXOTzrd
	 FXN/LukOUY5V5FpbTbfJMzjFl5Injnoe93BwhCdsP23MLKv8UcJ9aqbh3YQxKiDltg
	 GvASXcslw4aRprD8iMbBX8+fED7kUEoyfjFCfcIZJ4FX7MVpd0V5Cwe/AK/g4j/YxH
	 7mTID5HQj7nYTt1hv2aez4ftbe73AqMOKmPl0GxSQZfu9mFfcgetStt60RF5qG818T
	 CEqGGbmanhfYw==
Received: by mail-ej1-f71.google.com with SMTP id kf3-20020a17090776c3b0290536d9b62eb6so1732915ejc.2
        for <linux-nfc@lists.01.org>; Thu, 22 Jul 2021 04:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hf6nIv0cROSgk9uBrXGh/YvidCZMnHdvO2jJcowIub8=;
        b=i/cOJeGjOJEg48uB+Rp26DAfAq3lPKjW56WfVY3vVQQo5Oq7l3O8A9hMqn2xubitWE
         hZK5W+ADXua6Aj8+oDaamfuqaCnYZtV5xJ5mBVZvc3md7x/FBDyNp3cnNLlq/mpyC5Sr
         2p0b0fbdopxNZrc8UAx8rSXLxOQTKhAl/ylEWiEi53C2m5kykybhYDTH750UvzmOfZYM
         EnvSdibJuSpO4V4q3/QIchn/RYlLcySMxjb0srqtbojl/RFeuJcKQk1Kf+0kur6c8UQh
         pTFjwjucWHdCwrjGN2nXN26QHX1eGR1cUfKqCQPhnLdbt68Os9XMn7Jduy6uIK+q9wxC
         ATPA==
X-Gm-Message-State: AOAM530rcMwafSdwmtDuwOUa61agm73MHi0cRace2PzYhkPhxpTsIvex
	aIsvzdoptKp6f3CbZWmwdLqXXYKqcm7BCy2R5znQTC7WnMQ7P+dfjkZr18BeYFWprA2SjhvJ7B6
	gvDSVRQzBvaBy5Y58m+gk834G8ddehDHMTg==
X-Received: by 2002:a05:6402:c6:: with SMTP id i6mr54867238edu.330.1626954815561;
        Thu, 22 Jul 2021 04:53:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6jEzJlqXnN0F5EWHQnvdPYHY47ggi4hUNdv8RalGdpeebr4nb0oERF5PZWXvF1917jprONQ==
X-Received: by 2002:a05:6402:c6:: with SMTP id i6mr54867202edu.330.1626954815001;
        Thu, 22 Jul 2021 04:53:35 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id n26sm7736489eds.63.2021.07.22.04.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jul 2021 04:53:34 -0700 (PDT)
To: Vincas Dargis <vindrg@gmail.com>, linux-nfc@lists.01.org
References: <CAPNCXk0qkc-5myby0TdzD=6kBXSd_o_iNGy6jjjO5YXeyZqceg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <c3e98408-8d27-fe0e-4d99-6c1ae1d961ab@canonical.com>
Date: Thu, 22 Jul 2021 13:53:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPNCXk0qkc-5myby0TdzD=6kBXSd_o_iNGy6jjjO5YXeyZqceg@mail.gmail.com>
Content-Language: en-US
Message-ID-Hash: QUH7SKR2A7OJUSTPLOLMVPOGCT6TZG5I
X-Message-ID-Hash: QUH7SKR2A7OJUSTPLOLMVPOGCT6TZG5I
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: About NFC Tag emulation on Linux
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/QUH7SKR2A7OJUSTPLOLMVPOGCT6TZG5I/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 22/07/2021 12:59, Vincas Dargis wrote:
> Hi list,
> 
> I see there's "test-device", "test-tag" helpers in neard-tools package
> in Debian, but it looks like it needs actual devices/tags to test
> with..?
> 
> Is there a way to emulate NFC tag, to "emit" NFC tag discovery events
> and NDEF mesages on Linux? Qt supports NFC on Linux via neard daemon,
> so I thought it would be very useful to emulate NFC tags (with various
> payloads) for development and (automated even?) testing.

I think nfcsim kernel module could help you but I am not sure how much
you can emulate.

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
