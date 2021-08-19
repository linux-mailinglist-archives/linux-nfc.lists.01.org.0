Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 240B43F1C11
	for <lists+linux-nfc@lfdr.de>; Thu, 19 Aug 2021 16:58:27 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 1D6A3100EB84F;
	Thu, 19 Aug 2021 07:58:25 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B1545100EB839
	for <linux-nfc@lists.01.org>; Thu, 19 Aug 2021 07:58:22 -0700 (PDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 776AC411D3
	for <linux-nfc@lists.01.org>; Thu, 19 Aug 2021 14:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1629385100;
	bh=wQiuLX/Xvn4Q37h7Mu5nwpojESQ/HSYYdmVtuyw8BcY=;
	h=Subject:From:To:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=r98Lf5U853s7PmYLeKeKITIqrQkz2yeB1Mar/HbyiL+bUY99KKnv/qQtkPv6bGYBq
	 LYYqL5w+2PznyJzqncSU7rJTb1RH6l8eZNlSHV9iU78kCovcMhUHCXtvScO1/pJ7tP
	 /hfHNJz99j7qxFEJLyLPAnSeZzp1yhJLQWKPI5Zulyl8eBLNgEt0Ho16f2XUL+A8KC
	 SrkTLLzL1Nwwv8dQLjfUOcJgU+p/3zn//aUBBBafVABKgz95W7oZTuLPLJhSP1tI+t
	 YfR3zmGW5ZiyNLjDWdQfPucBeK0zPM67S5Z4UcBojJWFo2j6Xa82LlJvnrS17YsfvR
	 1JzqryKS2dLdQ==
Received: by mail-ed1-f71.google.com with SMTP id l18-20020a0564021252b02903be7bdd65ccso2970274edw.12
        for <linux-nfc@lists.01.org>; Thu, 19 Aug 2021 07:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wQiuLX/Xvn4Q37h7Mu5nwpojESQ/HSYYdmVtuyw8BcY=;
        b=Xjufq90mzSz2/dqbHttHRNLXHl3GvC0CBgXNKNXJODV9JjoFBMPbx1z3p5tFWOEII2
         WRT+OujwEs8ciELERM/jtUFTF+XXirglcWz1mfJRTYFM8Q28zDzrdeoSqUR5QJmDAyEo
         3EyuMPkhA5imiUCrSa6LAHU5B2ZuF6vyGWHuDirMkXVBI85tSXr5sk4UeIOAnm9g3tAf
         4o7re9g1diylq2B50B6MER7PDo3jLMLAgEgWqApGh5584hx4vvu4Bj0qn/MPNNY9Y2EL
         LJ/a1iOpjKqfCY+UsneJ7snHUyfhUBqaDttRniQGASg7QMSnzMRBDln6npQz+VaNjzsU
         h7ew==
X-Gm-Message-State: AOAM532stRGooiZbjizddXD0OVv0xwgEAwbzcb7Xa6xCRXqAUF6Lrdvg
	yCUxoq/hYCnYzMUBbMxhI0d3ClWxxT5vfUtFas2+NumnRNZAJroEQaxA705f8I9oboqNrpqKEOD
	37sh/za05SCQXRdfsY026ZdOQtVHRf+taeg==
X-Received: by 2002:a17:906:3716:: with SMTP id d22mr16171134ejc.376.1629385100006;
        Thu, 19 Aug 2021 07:58:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7cjsLyRDa+Jb4UZS3n7mrb3stwTeBOK9wBvs+ikE3e8cF/D0BtqIDDctUeqM9AZzfBaf2Tg==
X-Received: by 2002:a17:906:3716:: with SMTP id d22mr16171117ejc.376.1629385099836;
        Thu, 19 Aug 2021 07:58:19 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id v6sm1385704ejk.117.2021.08.19.07.58.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 07:58:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Oliver Neukum <oneukum@suse.com>, charles.gorand@effinnov.com,
 andy.shevchenko@gmail.com, linux-nfc@lists.01.org
References: <20210819140228.15591-1-oneukum@suse.com>
 <7ff001e9-8e82-cecb-96af-458baac30dfc@canonical.com>
Message-ID: <41c3e936-482a-9000-8fe3-4d6986f905a7@canonical.com>
Date: Thu, 19 Aug 2021 16:58:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7ff001e9-8e82-cecb-96af-458baac30dfc@canonical.com>
Content-Language: en-US
Message-ID-Hash: C4CB6HK7RS6HJXP6JILOV4D6PDIJJ2GZ
X-Message-ID-Hash: C4CB6HK7RS6HJXP6JILOV4D6PDIJJ2GZ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] NFC: NCI: make parent aware in PM terms
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/C4CB6HK7RS6HJXP6JILOV4D6PDIJJ2GZ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 19/08/2021 16:45, Krzysztof Kozlowski wrote:
> 
> On 19/08/2021 16:02, Oliver Neukum wrote:
>> The NCI device is a child of an i2c device.
>> If the i2c layer uses runtime PM the power to
>> the NFC device can be cut whenever the i2c
>> layer is done transmitting data to the NFC
>> device.
>> Under these conditions NFC can not work, as
>> it needs power to wait for reception of packets.
> 
> Hi,
> 
> Thanks for the patch.
> However this
> is unparseable.
> Please wrap commit
> message around 75th character:
> https://elixir.bootlin.com/linux/v5.13/source/Documentation/process/submitting-patches.rst#L124
> 
> The subject prefix: "nfc: nxp-nci: "
> 
> Please also Cc all people and lists. You missed here netdev
> and linux-kernel, so this cannot be applied.
> 
>>
>> The necessary extension of runtime PM
>> to the NFC device requires that it
>> be activated as a child of the i2c device.
>> It is not necessary to do any runtime PM
>> operations. This will disable runtime PM
>> for this branch of the tree, but otherwise
>> the NFC device is inoperable.
>>
>> Signed-off-by: Oliver Neukum <oneukum@suse.com>
>> ---
>>  drivers/nfc/nxp-nci/i2c.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/nfc/nxp-nci/i2c.c b/drivers/nfc/nxp-nci/i2c.c
>> index 94f7f6d9cbad..dba78a5d217a 100644
>> --- a/drivers/nfc/nxp-nci/i2c.c
>> +++ b/drivers/nfc/nxp-nci/i2c.c
>> @@ -18,6 +18,7 @@
>>  #include <linux/interrupt.h>
>>  #include <linux/module.h>
>>  #include <linux/nfc.h>
>> +#include <linux/pm_runtime.h>
>>  #include <linux/gpio/consumer.h>
>>  #include <asm/unaligned.h>
>>  
>> @@ -261,6 +262,7 @@ static int nxp_nci_i2c_probe(struct i2c_client *client,
>>  {
>>  	struct device *dev = &client->dev;
>>  	struct nxp_nci_i2c_phy *phy;
>> +	struct nfc_dev *ndev;
>>  	int r;
>>  
>>  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
>> @@ -297,6 +299,11 @@ static int nxp_nci_i2c_probe(struct i2c_client *client,
>>  	if (r < 0)
>>  		return r;
>>  
>> +	ndev = phy->ndev->nfc_dev;
>> +	pm_runtime_set_active(&ndev->dev);
>> +	pm_runtime_enable(&ndev->dev);
>> +	pm_runtime_mark_last_busy(&ndev->dev);
> 
> Setting PM for someone else does not look correct. This breaks
> encapsulation and separation of these files. The NCI device
> (nxp_nci_probe() and other parts of core.c) should instead manage
> it's own runtime PM.
> 

Except this, the code is really weird... there is no runtime PM in the
drivers but this enables it. For what purpose? It also marks it as last
busy but there is no autosuspend. I think I missed entirely the purpose
of this code.

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
