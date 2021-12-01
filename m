Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEBA464A31
	for <lists+linux-nfc@lfdr.de>; Wed,  1 Dec 2021 09:53:29 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id BBD8B100EB839;
	Wed,  1 Dec 2021 00:53:27 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 8222A100EB835
	for <linux-nfc@lists.01.org>; Wed,  1 Dec 2021 00:53:25 -0800 (PST)
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 760BB3F1B2
	for <linux-nfc@lists.01.org>; Wed,  1 Dec 2021 08:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1638348803;
	bh=LmCLun3NrYgt3gwxQkHSkE5NNqnAPSKbBMxG5vjb4Hw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=BpLdggeMbgK992zY+ZN4Z1KGyBXV9wLQ/ee+XtZ5eeamvaTthkrNuBn5d0c/vU2m5
	 vsRiOVwR/nqZUsuxX8eb97y4qqjUImylhdC5pU2DEt0vyj5C96bf7wwJGGN4AUQDSf
	 9vYpEh2zAvosvJes2wKen/0fwrhdjtCae9tFbtGqFoBTXvAXoIOoJKKqtzV1YuNM6r
	 fSIRrGrWv4O9brSP+tbUPOIkrhBgsjusX8hW+ti0Q5VXKuej2uraoOIgdnOyMbbWAu
	 rBPdn4mz2x92ywCgtqO7YQzDq7nYJnR5egl+16YK/BcZRz0ENaJ2f2KgCDcVghSPq+
	 0NM7c9XdNi9Sw==
Received: by mail-lf1-f72.google.com with SMTP id m2-20020a056512014200b0041042b64791so9233660lfo.6
        for <linux-nfc@lists.01.org>; Wed, 01 Dec 2021 00:53:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LmCLun3NrYgt3gwxQkHSkE5NNqnAPSKbBMxG5vjb4Hw=;
        b=4BZQaoeaibLOu33pX+T7Gw09FZ7l5KVXzQF7FHuvTLt7iRDvSQIQoyYiWbDsxqgnTJ
         GA9Si0vqXSJZ4pkdGGU56XuZQLNVv2/+FOrc795MRaqNQ9hVoSR49xd7I9D7pErYyL3i
         Xq5wAT9QTobsgAP9NJPAwmxfI+F93Ud5jcP9vw0sGV8OcjP9AH88BxgrPS8kJMRomc17
         bHLLFLBYdihVATKJhop+Y9qCSsVNURKa3GYU1KS42LELL9P/2c+o1szEm6D71lqmri+1
         9BcxBT4ctWQZOOhmwAXdnqB1DO29obIrhhYrWNfPnr8p/ThJFz5nVw5doJIu5J8qfKd+
         SRnA==
X-Gm-Message-State: AOAM532SKPMuMvbZtaErAtqqP5WCnon+hBeBfYVkIHT9SrhUyfCmEre9
	mop+WUKkSDlzDgcabBxDVHA6JNKbCLBq+AwMRKKu3X9PkRi8HB7+wjHocPjpbTuehYPIzrX6OHJ
	cOwcWdh9HGxS5487x5nNdsxSwkBEf9tl4ig==
X-Received: by 2002:a2e:b8ca:: with SMTP id s10mr4364470ljp.327.1638348802954;
        Wed, 01 Dec 2021 00:53:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwalmWpsnA4A4ORcFvQ/RrypOhlseuHVrzblLH8lqTfMtGMuDcJcHtIJpXTRf5aMfJHbdPcPQ==
X-Received: by 2002:a2e:b8ca:: with SMTP id s10mr4364414ljp.327.1638348802305;
        Wed, 01 Dec 2021 00:53:22 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id d11sm2019838lfq.303.2021.12.01.00.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Dec 2021 00:53:21 -0800 (PST)
Message-ID: <cd4169f5-2a97-61d8-240d-30ee16bcdd06@canonical.com>
Date: Wed, 1 Dec 2021 09:53:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
To: Mark Greer <mgreer@animalcreek.com>
References: <20210808022058.171350-1-mgreer@animalcreek.com>
 <65c7b6ca-c1f6-6557-1b54-f8f666e3a5bf@canonical.com>
 <20211129041536.GA830560@animalcreek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211129041536.GA830560@animalcreek.com>
Message-ID-Hash: 5PN3CXENBSUQGVZT2PVPIN2DMK626IRE
X-Message-ID-Hash: 5PN3CXENBSUQGVZT2PVPIN2DMK626IRE
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] [neard][RFC] test: Convert Python2 scripts to Python3
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/5PN3CXENBSUQGVZT2PVPIN2DMK626IRE/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 29/11/2021 05:15, Mark Greer wrote:
> On Mon, Aug 09, 2021 at 12:35:07PM +0200, Krzysztof Kozlowski wrote:
>> On 08/08/2021 04:20, Mark Greer wrote:
>>> Python2 is deprecated so convert the neard test scripts, which are
>>> Python2, to Python3.
>>>
>>> Signed-off-by: Mark Greer <mgreer@animalcreek.com>
>>> ---
>>> This is a first pass at converting the python scripts to Python3.
>>> Not a lot of testing yet.  It appears that the 'gobject' is not
>>> available anymore so I have to look into how to rework the code that
>>> uses it.
>>>
>>> I would appreciate any testing that you are willing to provide.
>>>
>>> Also available at:
>>> 	https://github.com/linux-nfc/neard/tree/mag/python3-ize
>>>
>>>  se/test/test-channel     | 18 +++++------
>>>  se/test/test-seel        | 38 +++++++++++-----------
>>>  test/bt-handover         |  8 ++---
>>>  test/handover-agent      | 34 +++++++++----------
>>>  test/monitor-near        |  8 ++---
>>>  test/ndef-agent          | 20 ++++++------
>>>  test/neard-ui.py         | 70 ++++++++++++++++++++--------------------
>>>  test/neardutils.py       | 14 ++++----
>>>  test/phdc-simple-manager | 50 ++++++++++++++--------------
>>>  test/test-adapter        | 16 ++++-----
>>>  test/test-device         | 34 +++++++++----------
>>>  test/test-tag            | 10 +++---
>>>  12 files changed, 160 insertions(+), 160 deletions(-)
>>>
>>
>> Few tests:
>> ------------
>> $ sudo python3 ./test/test-adapter poll nfc0 on
>> Traceback (most recent call last):
>>   File "./test/test-adapter", line 92, in <module>
>>     adapter.StartPollLoop(mode)
>>   File "/usr/lib/python3/dist-packages/dbus/proxies.py", line 72, in
>> __call__
>>     return self._proxy_method(*args, **keywords)
>>   File "/usr/lib/python3/dist-packages/dbus/proxies.py", line 141, in
>> __call__
>>     return self._connection.call_blocking(self._named_service,
>>   File "/usr/lib/python3/dist-packages/dbus/connection.py", line 652, in
>> call_blocking
>>     reply_message = self.send_message_with_reply_and_block(
>> dbus.exceptions.DBusException: org.neard.Error.Failed: No such device
>>
>> During handling of the above exception, another exception occurred:
>>
>> Traceback (most recent call last):
>>   File "./test/test-adapter", line 94, in <module>
>>     print("%s: %s" % (error._dbus_error_name, error.message))
>> AttributeError: 'DBusException' object has no attribute 'message'
>> ------------
> 
> This looks like you may not have installed the necessary dbus support
> (e.g., src/org.neard.conf).  After building neard, you can install this
> with:
> 
> $ sudo make install
> 
> If that isn't it, I'll need more info about your environment because I
> don't get those errors.  To make sure we're on the same page, these steps
> should get you going (this example on an amd64 running Ubuntu 20.04):

Indeed lack of dbus support could be the original exception but the
final exception is "AttributeError: 'DBusException' object has no
attribute 'message'" which looks unrelated to actual DBUS installation.
The error is that new Python dbus does not have message field. It has
__str__ representation or get_dbus_message() method.

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
