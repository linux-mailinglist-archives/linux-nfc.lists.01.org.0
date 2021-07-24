Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC253D4706
	for <lists+linux-nfc@lfdr.de>; Sat, 24 Jul 2021 12:08:52 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id A81E9100EBB8F;
	Sat, 24 Jul 2021 03:08:50 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=vindrg@gmail.com; receiver=<UNKNOWN> 
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id CA704100EBBBB
	for <linux-nfc@lists.01.org>; Sat, 24 Jul 2021 03:08:47 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id a26so6185005lfr.11
        for <linux-nfc@lists.01.org>; Sat, 24 Jul 2021 03:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vTNOB1TLkUZmL+y8SovAHj8vCnu3p/B6BRYsXBlqoLM=;
        b=nuu4W1/qd1L3FMFSsDVK2lwx/BKE2J4THpNMud4JTFT+wgrPB8QbLeKhGGVN1rsebv
         mfVVBP7G1CZev7EzIAA7YCUHxUtayvT58N8TqTHfvejpSq6iboqZnmAWKvg+Wwc48U8U
         EGuumVD+VdYgyCuRmEMklviPdLvSaaYIV6W478VtmuEyauz09fHLp4WYfjSAe7oJFciK
         lQOA9NizikI5/cL//pVa8s7CmxubdRo4hX6aeGfiqZmfoG2NHW7Wf8G9I5u0m8fOoEmw
         5/82HSLZsYp+HI07Ub6TB+k8aq6TVtEtpf2ILkAQmnBl7McCoNAxiWGYzzba09aupnNr
         mWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vTNOB1TLkUZmL+y8SovAHj8vCnu3p/B6BRYsXBlqoLM=;
        b=Z+hBuGCd+E+55V/DffV97mZgHxPa+z9/P89kya/s26Qkkvyf/32oJGbND+F7/ZJlkB
         rvkui12FX82/AbaPQ03gsAKLUjvqp4vqRRetF9z+5ceG0EJr5L/a0RqT+FcCfDJQO/8P
         /guPMdvAUhNdtBkt+JdOAyQFv5EFhEqmaxleiEyuL+JWU8EPqJNqsuqGs9DbYB3ud8wA
         KTWclYp3p4xMgr2hihQdeVGxIqM79mMkszMew+lrDPtrfmxCe4jGKvMvHctRfL8Ttwx9
         /zRA/bGkyWnzC9K6O/WKF+Dck5E7QGP+31Cf1jRwkScr46AgH2uTKdjTXtkUbVjwE+/H
         xl/A==
X-Gm-Message-State: AOAM531CR6p4T1Irqnc8QPIhX1c4KFvcPu+/7TyLnRQQ96UTaQoFzY2k
	2bHlVTmHgXPCnV+AcVepIxnc7FWc3FM=
X-Google-Smtp-Source: ABdhPJxSTSjyQa99oQKJ2ZP3LzxfVgz7igS4BD8h5ywS/tHMRJGZ1wjkDzxua26Y4mWtgoGvahkLkQ==
X-Received: by 2002:a05:6512:c23:: with SMTP id z35mr6052754lfu.299.1627121324699;
        Sat, 24 Jul 2021 03:08:44 -0700 (PDT)
Received: from [192.168.1.10] (mail.dargis.net. [62.80.227.49])
        by smtp.gmail.com with ESMTPSA id g1sm184784lfb.300.2021.07.24.03.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jul 2021 03:08:43 -0700 (PDT)
To: Mark Greer <mgreer@animalcreek.com>
References: <CAPNCXk0qkc-5myby0TdzD=6kBXSd_o_iNGy6jjjO5YXeyZqceg@mail.gmail.com>
 <20210723060328.GA1042603@animalcreek.com>
From: Vincas Dargis <vindrg@gmail.com>
Message-ID: <d32783af-54a2-9c4e-af88-b98e33384b37@gmail.com>
Date: Sat, 24 Jul 2021 13:08:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210723060328.GA1042603@animalcreek.com>
Content-Language: en-US
Message-ID-Hash: A563XF34HSVVZ27FWKIP5J2WYB24BR4H
X-Message-ID-Hash: A563XF34HSVVZ27FWKIP5J2WYB24BR4H
X-MailFrom: vindrg@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: About NFC Tag emulation on Linux
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/A563XF34HSVVZ27FWKIP5J2WYB24BR4H/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

2021-07-23 09:03, Mark Greer wrote:
> ...
Thanks Mark for the very useful info!
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
