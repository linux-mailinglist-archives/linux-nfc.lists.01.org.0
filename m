Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3E8390022
	for <lists+linux-nfc@lfdr.de>; Tue, 25 May 2021 13:38:26 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 10221100EF276;
	Tue, 25 May 2021 04:38:24 -0700 (PDT)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=91.189.89.112; helo=youngberry.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id E0492100EF271
	for <linux-nfc@lists.01.org>; Tue, 25 May 2021 04:38:21 -0700 (PDT)
Received: from mail-vk1-f197.google.com ([209.85.221.197])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1llVO7-0006Vw-6M
	for linux-nfc@lists.01.org; Tue, 25 May 2021 11:38:19 +0000
Received: by mail-vk1-f197.google.com with SMTP id 28-20020a056122169cb0290200b091f299so3216008vkl.3
        for <linux-nfc@lists.01.org>; Tue, 25 May 2021 04:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CZwbJzMdNKQ9pWB+s9p+++BmYWbMRl5a2xW6x+5P6p4=;
        b=H2m5tYa2fqT3GzI+tMegYVLuOBARAP+Cuw4YKHJ+8qaNaLkeo32hIAhGsG4TQq7Pxj
         PYnS18H8yvsuTkaGenUOdu0JuOetv6aYdFKsdYVw7kh0StDwDGXWWIAlKfvbew4Xb/yF
         FVgiqjKa/0M2lD3QjP9YVwOd4yR/S5BoIxTN+B04GtiPxCZrdb9ayKpEC4CRfbRh+KmR
         EAntnEtKsy0sZ7eMoft7ny9dnjhNL9Aido4yLUFtBmUkHF4VcTtgeRS4Y4qYSgGEpDbp
         UTrtbOJmHufrijeupfnQx+W2lCmWJOEVY3igpqo09q/d1+laSL8nMpGAZKPE5tN1B/z4
         Nrug==
X-Gm-Message-State: AOAM5324S7V3FAaMbc2Wp0RtTPnj7sTJb93IiJLj+ehtu3akzBak9dP9
	uuUK9vCDiifrmu9+g07avX+AwFmpVDEOBgVlRdS8rrLpJKetawHwUHMAOXcHnNfgpBOssrIRCZ8
	/wEENsCooTtrs0ueuPnJ1DKTDMjViiiU57A==
X-Received: by 2002:a05:6102:c51:: with SMTP id y17mr25390313vss.26.1621942698338;
        Tue, 25 May 2021 04:38:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOEzcON3XhO32bZ26xkZY6KWrQERAD0cR1oUrEsZ49BhW9FtyS4wfFrcDhfyuXV5mJmUftYQ==
X-Received: by 2002:a05:6102:c51:: with SMTP id y17mr25390303vss.26.1621942698166;
        Tue, 25 May 2021 04:38:18 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.1])
        by smtp.gmail.com with ESMTPSA id y129sm1549174vkg.9.2021.05.25.04.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 04:38:17 -0700 (PDT)
To: samirweng1979 <samirweng1979@163.com>, davem@davemloft.net,
 dinghao.liu@zju.edu.cn
References: <20210525063801.11840-1-samirweng1979@163.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <3fe26970-91ab-d598-92ff-e13d8d707d47@canonical.com>
Date: Tue, 25 May 2021 07:38:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210525063801.11840-1-samirweng1979@163.com>
Content-Language: en-US
Message-ID-Hash: 2NCW4OKQQBJSOTSN55KHRMFPRVCRC57V
X-Message-ID-Hash: 2NCW4OKQQBJSOTSN55KHRMFPRVCRC57V
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, wengjianfeng <wengjianfeng@yulong.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] NFC: st95hf: remove unnecessary assignment and label
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/2NCW4OKQQBJSOTSN55KHRMFPRVCRC57V/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 25/05/2021 02:38, samirweng1979 wrote:
> From: wengjianfeng <wengjianfeng@yulong.com>
> 
> In function st95hf_in_send_cmd, the variable rc is assigned then goto
> error label, which just return rc, so we use return to replace it. and

s/return/returns/
s/. and/. Since/ (don't start sentences with "and", neither with
lowercase letter).

> error label only used once in the function, so we remove error label.

With these fixes and subject prefix fix to "nfc" (lowercase):

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
