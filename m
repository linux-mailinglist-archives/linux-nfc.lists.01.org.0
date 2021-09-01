Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B583FD556
	for <lists+linux-nfc@lfdr.de>; Wed,  1 Sep 2021 10:27:28 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id B3D91100EB826;
	Wed,  1 Sep 2021 01:27:26 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 2E58A100EBB9C
	for <linux-nfc@lists.01.org>; Wed,  1 Sep 2021 01:27:23 -0700 (PDT)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 335B040187
	for <linux-nfc@lists.01.org>; Wed,  1 Sep 2021 08:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1630484842;
	bh=aY9gv2ACWx7j3apMcyMOxIKcp1JCAh1Z5IMtKt0nhIM=;
	h=To:References:From:Subject:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type;
	b=k24WAxYapbiTmVS95ZYcF4i4FfTwhCGSl6QhO4EjgzhQx4qbO/1BKFH+RoliJ0/dy
	 NyJkauhA3BBtUPiHle6ZrfXCF40l1/POiHGlU3RduYxMt5JDqY8LGQ2pFiRTLsUZ11
	 kLhttF5vOLMQwkzpfb8rR6mo3wpO7BUsWx5Y1I/7mO+TEDInYT20x/EU618UslDiSP
	 k8H4mlAb7ZmnW7atunfYOwAChMyoW0dLKH6eufU//PCpqO56/0ov3caWLgn5HxkwPX
	 SaVfWhyM7tesMWyHljOkP2LX+mEU4pCB78CBoDdIJDfUMNlRs5a8A0R8u0LPIsVixY
	 3ByOJ1e4CzTIQ==
Received: by mail-wm1-f70.google.com with SMTP id f19-20020a1c1f13000000b002e6bd83c344so744730wmf.3
        for <linux-nfc@lists.01.org>; Wed, 01 Sep 2021 01:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aY9gv2ACWx7j3apMcyMOxIKcp1JCAh1Z5IMtKt0nhIM=;
        b=Spx7AZ/QO3MJdGgu4gANlPLEdHosw5GCS32qhxbYDuvbOHTC2nWOdzBro24wvOlVOb
         gWd3iXC6gbopTtPNQLkz5WPhPzg/G0zjViGo8X1/YRjyASWTmXvucE33Q+g/teNhmbk+
         yNRzDneURHdpXrhfTni3ZAUYOQZcxQr5NhDnYaa+xfYzybI7BF9JYLg2cHAo+a+Ft4Ix
         ISyjyHqbGkF3MAqIPoo7yZoQ+s35hNubgcBR2tLxyjxfp6L0BzFRt0YjNrK2MSeZ3QM5
         LtjTEs8iYZOUWmPCDPPe3SUep0wvLscJpVRVsbDg4Q+jGU1xwnZ4FJxkjfj1+vKMrH/I
         fCtw==
X-Gm-Message-State: AOAM533BNOz8ppPn6WZL186M35xsho3eOleNMtbaKp6yo8rm/FADAsVY
	YQx1PTUBeXt88T6FAfBhcXEG2Qk1qx3+XVvJe94tl6p26RKMPNU6Vlngfhvgo9PrkDLjSORZyRb
	JZ5spS7T+/cqvPd5LwLXyB/R9aRIW+4TMLQ==
X-Received: by 2002:adf:dcc7:: with SMTP id x7mr35684098wrm.173.1630484841916;
        Wed, 01 Sep 2021 01:27:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWt9eZtbHgzVv7IfVksi6sTwwtO+mAxETcyROAjIvwdGWXWrsH9fTsBf5WMpK8rR6D6C8zwQ==
X-Received: by 2002:adf:dcc7:: with SMTP id x7mr35684070wrm.173.1630484841615;
        Wed, 01 Sep 2021 01:27:21 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.113.249])
        by smtp.gmail.com with ESMTPSA id c13sm20767112wru.73.2021.09.01.01.27.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 01:27:21 -0700 (PDT)
To: LinMa <linma@zju.edu.cn>, linux-nfc@lists.01.org,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <5b6649e2.af5bf.17ba04c8d62.Coremail.linma@zju.edu.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <2a052383-6c82-d3a4-fc61-5ecd7b7c49d9@canonical.com>
Date: Wed, 1 Sep 2021 10:27:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5b6649e2.af5bf.17ba04c8d62.Coremail.linma@zju.edu.cn>
Content-Language: en-US
Message-ID-Hash: MHO7XDB4SJBR7ROCM7VVCYZCQINKHBXD
X-Message-ID-Hash: MHO7XDB4SJBR7ROCM7VVCYZCQINKHBXD
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: set dev->rfkill to NULL in device cleanup routine
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/MHO7XDB4SJBR7ROCM7VVCYZCQINKHBXD/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 01/09/2021 09:39, LinMa wrote:
> In nfc_unregister_device() function, the dev->rfkill is forgotten to set to NULL after the rfkill_destroy(). This may lead to possible cocurrency UAF in other functions like nfc_dev_up().

Commit msg should be wrapper at 75 char.
https://elixir.bootlin.com/linux/v5.13/source/Documentation/process/submitting-patches.rst#L124


Use also scripts/get_maintainers.pl to get list of people and lists
you need to CC. You skipped Networking maintainers and two mailing lists.

> 
> The FREE chain is like
> 

Please trim multiple blank lines and organize the commit msg to be readable.
No need to paste existing code into the commit msg.

> 
> void nfc_unregister_device(struct nfc_dev *dev)
> {
>   int rc;
>   pr_debug("dev_name=%s\n", dev_name(&dev->dev));
>   if (dev->rfkill) {
>     rfkill_unregister(dev->rfkill);
>     rfkill_destroy(dev->rfkill);
>   // ......
> }
> 
> 
> 
> The USE chain is like
> 
> 
> static int nfc_genl_dev_up(struct sk_buff *skb, struct genl_info *info)
> {
>   struct nfc_dev *dev;
>   int rc;
>   u32 idx;
>   if (!info->attrs[NFC_ATTR_DEVICE_INDEX])
>     return -EINVAL;
>   idx = nla_get_u32(info->attrs[NFC_ATTR_DEVICE_INDEX]);
>   dev = nfc_get_device(idx);
>   if (!dev)
>     return -ENODEV;
>   rc = nfc_dev_up(dev);
> 
>   // ......
> }
> 
> 
> int nfc_dev_up(struct nfc_dev *dev)
> {
>   int rc = 0;
>   pr_debug("dev_name=%s\n", dev_name(&dev->dev));
>   device_lock(&dev->dev);
>   if (dev->rfkill && rfkill_blocked(dev->rfkill)) { // dev->rfkill is not NULL here
>     rc = -ERFKILL;
>     goto error;
>   }
>   // ......
> }
> 
> 
> The FREE chain and USE chain can be like below (as there is no locking protection).

Something is missing.

> 
> 
> Therefore, the below patch can be added.

Use imperative form:
https://elixir.bootlin.com/linux/v5.13/source/Documentation/process/submitting-patches.rst#L89

> 
> 
> Signed-off-by: Lin Ma <linma@zju.edu.cn>
> ---
>  net/nfc/core.c | 1 +
>  1 file changed, 1 insertion(+)
> diff --git a/net/nfc/core.c b/net/nfc/core.c
> index 573c80c6ff7a..d0b3224e65d7 100644
> --- a/net/nfc/core.c
> +++ b/net/nfc/core.c
> @@ -1157,6 +1157,7 @@ void nfc_unregister_device(struct nfc_dev *dev)
>   if (dev->rfkill) {
>   rfkill_unregister(dev->rfkill);
>   rfkill_destroy(dev->rfkill);
> + dev->rfkill = NULL;

This is not a valid patch. Does not match the code.
For example, use git format-patch and git send-email.

About the topic:
Your code does not prevent a race condition, since you say there is no
locking. Even if you move dev->rfkill=NULL before rfkill_unregister(),
still nfc_dev_up() could happen between.

The questions are:
1. Whether nfc_unregister_device() can happen after nfc_get_device()?
2. Whether netlink nfc_genl_dev_up() can happen after nfc_unregister_device()
started.



>   }
>   if (dev->ops->check_presence) {
> --
> 2.32.0
> _______________________________________________
> Linux-nfc mailing list -- linux-nfc@lists.01.org
> To unsubscribe send an email to linux-nfc-leave@lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> 


Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
