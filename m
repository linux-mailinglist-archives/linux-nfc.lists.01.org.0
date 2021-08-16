Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 640C83ED06F
	for <lists+linux-nfc@lfdr.de>; Mon, 16 Aug 2021 10:41:45 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id F187C100EBB9E;
	Mon, 16 Aug 2021 01:41:43 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id ECBEC100EBB92
	for <linux-nfc@lists.01.org>; Mon, 16 Aug 2021 01:41:41 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id E36283F0A7
	for <linux-nfc@lists.01.org>; Mon, 16 Aug 2021 08:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1629103299;
	bh=+xUEc/qm1PzDJP5u3baZXXtjTc7h8rBhDiakdDHi1yM=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=pnAUd2JV346AM2Zd1HY1VEMopx6ly3bxdpElZxYAgiC4Gt9uopwvgX4M5gguwynQp
	 gQGW/RSCAxlpgVN9QhmwnXJqekZLjuXMI0r9aljvrlV2/oZjkK04Bi+O79SM2GX00Z
	 h19nzNcvnwm/vFXMLPpwnfK7LDeib5x7FSwoefrnxbDgmxD+wnZzM4zZ9s2bjFktAL
	 3i5QEaM1KjWJO8/QEJiTa5nN8NiVUVpHqjO1EONR8PZuUcPzOluoSxOIm+BiuqcnBF
	 nWYErUUureMUHX240NlYF5x4uQxE9I+AVA6whd6KC8tQ0PeedXaHuGL6cDHcjZKmUL
	 O36vUCVww0OxA==
Received: by mail-ed1-f70.google.com with SMTP id di3-20020a056402318300b003bebf0828a2so4436754edb.8
        for <linux-nfc@lists.01.org>; Mon, 16 Aug 2021 01:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+xUEc/qm1PzDJP5u3baZXXtjTc7h8rBhDiakdDHi1yM=;
        b=njafSrhgnnvEqWeeykmeIDhV6KtRt1UOCZi3DJ3Rbrky4bIyotpaSydBmhc1OFnCQP
         dAh7xwtDEwPKc05Kp0VNjHOd+DvqYqrS39DZUBN1SGUYWveXlnvPDjh4UM5EmqiSA3NT
         OmbLmNmazPegUBD7OrgeXNyGijRwHDMA/t3B/PIdXt8QKEUXtK3afK9hj8oIE9rNdTkX
         Wws7KjLBHrWt5yacNW9JSsS83OQ997GQ/eXcH6b/H0dc4Jq1aKQkqnShhsMqkTkjL88O
         +DdVNjQoKFNA2cE7EEGrMqsljgvienn14M3e70U0IDyKvdZBBnJpNncMmzcvRgowy+k2
         o7DQ==
X-Gm-Message-State: AOAM530V2w31Fn/FVW7dM9duNortelX917nuH5lfFByuzp8GD9BLctH0
	BVa6g9Quix7W52+MWt2Xv/vQ2A6j4U+z7RcCV9IkHUrAdQXCwOJAHwc+0wfGEf6ZWQeglquuHPv
	kbmHA0YC8H8kXiHGN/I6xtf+ItM7tJpSNqA==
X-Received: by 2002:a17:907:b09:: with SMTP id h9mr15069796ejl.278.1629103299686;
        Mon, 16 Aug 2021 01:41:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwh6pMzFSVOs7lSNGbKe0iJwJ55gCTC/3pF7/7l+/UXo12eilgMq1CpfKKWMAKorkvgL73RVA==
X-Received: by 2002:a17:907:b09:: with SMTP id h9mr15069783ejl.278.1629103299522;
        Mon, 16 Aug 2021 01:41:39 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id h13sm1523571ejq.77.2021.08.16.01.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 01:41:38 -0700 (PDT)
To: bongsu.jeon2@gmail.com, shuah@kernel.org
References: <20210816040600.175813-1-bongsu.jeon2@gmail.com>
 <20210816040600.175813-3-bongsu.jeon2@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <03cfd784-72ce-9835-a6b4-3af6ed34f092@canonical.com>
Date: Mon, 16 Aug 2021 10:41:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816040600.175813-3-bongsu.jeon2@gmail.com>
Content-Language: en-US
Message-ID-Hash: PVIAXNVYPK3Y2CPL4A3YC34SF4WRQ4VB
X-Message-ID-Hash: PVIAXNVYPK3Y2CPL4A3YC34SF4WRQ4VB
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: netdev@vger.kernel.org, linux-nfc@lists.01.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next 2/3] selftests: Remove the polling code to read a NCI frame
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/PVIAXNVYPK3Y2CPL4A3YC34SF4WRQ4VB/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 16/08/2021 06:05, bongsu.jeon2@gmail.com wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> 
> Because the virtual NCI device uses Wait Queue, the virtual device
> application doesn't need to poll the NCI frame.
> 
> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  tools/testing/selftests/nci/nci_dev.c | 33 +++++++++------------------
>  1 file changed, 11 insertions(+), 22 deletions(-)
> 

This depends on the patch 1/3 (the NCI change) so should go via the same
tree probably (or cross tree merge). Looks good to me:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
