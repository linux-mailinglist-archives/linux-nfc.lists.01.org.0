Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1603E3758
	for <lists+linux-nfc@lfdr.de>; Sun,  8 Aug 2021 00:05:57 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 96EBF100EB33F;
	Sat,  7 Aug 2021 15:05:52 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id F3136100EB33C
	for <linux-nfc@lists.01.org>; Sat,  7 Aug 2021 15:05:49 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 047125C0099;
	Sat,  7 Aug 2021 18:05:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sat, 07 Aug 2021 18:05:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=Nsf+H+DUdNfWLj6Piwy/N/NiKIV
	bbxR5Ylyz5fURb68=; b=bsfREzS0so2wZCgcVXmiAgNWnlmrjhST7iUyZ4Tn9Jn
	3CqKFreK2qnh0FgxWaMzgNBmQhbbCe3E3kX9EvQc8+YmmowXa4lf6s4Zl6fxKXwT
	eF+KqhCSls5zlCu1BMGtu+dBiV9O9QeDn9LPA26C6UBV/TZ38tBv2QYDeS/3iHIP
	NxfQUVhhVU9mRm2+MXhuQcuoz7eo4iJhC+LxyYkrzrv58UWYsBY07NbM+7nvnXCk
	pCMIug5xfDNgDrU4NHlRBfh1hyWrqnbsHcawPX0PHM0AxZX+8z2+ljFcHT4HqWcj
	i7rNUlHcESC7ymoWwzHKIaI+NtwNWlR4+2/O3bvuZtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Nsf+H+
	DUdNfWLj6Piwy/N/NiKIVbbxR5Ylyz5fURb68=; b=t2K7bukUyok4G9+60/CccQ
	pCyDyLwPV8O3NBOz2OL501sdaIcI2hcYzgWpeLvFVO34gr43y7oBedwVQisyAxqF
	Pa5TmU9pW2MjDPz5CyzcZ5kQ4FqRUBtVqAC55KCsPMK62qFO1IhIV2MsamioISvM
	PvgCvSZlX0cX12b5i5WgaQeHwyxPoTekyCHPuty2lyCBLXGgRdQbeQzXrwta6RP+
	Y42a9MbtNtGmkkHHN5JBo9HCF0gJ5DzI6nfwSEuLw2Q5lR2/CSHj9Itv7DAnwUU2
	6Exx0E5w7tg6rbJZzycpaf1Hb8+sXW9POt5XFCS3haWRqTrs58rH0Q5JEHTKE1ag
	==
X-ME-Sender: <xms:vAMPYXrW2Y__W-L-72uMlwKkpy7ZDKDpsp19mN0jQZfX8hAoV7sNog>
    <xme:vAMPYRoK4MKmGIJppCtbDEwxizLFgvI8JP-znZDcQQ7bxUTnRdsVT2JzBg91Hpq4z
    UMvak-pevbqSq3EXQ>
X-ME-Received: <xmr:vAMPYUMB0BU4LjM1r7YvNfIcD1bPb5_i9hx19pZPhDhLoP2GlABCFnPqJpVQAnUuUInc5gAJIVrOOPg1c6v2LpfsmPcaRjb_Y4g4upE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjeefgdduieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjohesthdtredttddtvdenucfhrhhomhepofgrrhhk
    ucfirhgvvghruceomhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhmqeenucggtf
    frrghtthgvrhhnpedujeelgeejleegleevkeekvdevudfhteeuiedtleehtdduleelvdei
    fffhvdehtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhgrhgvvghrsegrnhhimhgrlhgt
    rhgvvghkrdgtohhm
X-ME-Proxy: <xmx:vAMPYa4nWrOlsi8V5u0SjWKLmVtUf_GZYCONMq9Y1TSCfV5LvTlSlg>
    <xmx:vAMPYW79tBFwUr98Zf6kbRJ-ReIfHXGBz6cjNUpVF3xebIagvRZ5Zg>
    <xmx:vAMPYShYD6xyjPqbcnCPDpx3ayrjMg5G2TGWAgTiydbDKUrnQ8jmsA>
    <xmx:vQMPYcQ6wQZu0demNauBwV0kbqP-_fDKa2b9BG9xTb-3rej01Q16wA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Aug 2021 18:05:48 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 195C0136009E; Sat,  7 Aug 2021 15:05:48 -0700 (MST)
Date: Sat, 7 Aug 2021 15:05:48 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20210807220548.GC124928@animalcreek.com>
References: <20210804111956.86833-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210804111956.86833-1-krzysztof.kozlowski@canonical.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: UK3GBSLUCQI32ZZLAN35HYVUSR5DKOKK
X-Message-ID-Hash: UK3GBSLUCQI32ZZLAN35HYVUSR5DKOKK
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [neard][PATCH] README: describe contributions
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/UK3GBSLUCQI32ZZLAN35HYVUSR5DKOKK/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 04, 2021 at 01:19:56PM +0200, Krzysztof Kozlowski wrote:
> Mention the linux-nfc mailing list for contributions and current
> repositories - GitHub and kernel.org.  Document explicitly that
> contributions can come also via GitHub pull request.  For many
> developers without experience in development of Linux kernel, the GitHub
> PRs are easier than the patch-email workflow.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Applied.

Thank you.

Mark
--
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
