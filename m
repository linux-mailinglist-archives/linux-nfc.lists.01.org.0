Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC2C3CCC02
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 03:40:53 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 5F4CA100EBBBB;
	Sun, 18 Jul 2021 18:40:51 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id A5F72100EBBAF
	for <linux-nfc@lists.01.org>; Sun, 18 Jul 2021 18:40:48 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id DC3033200923;
	Sun, 18 Jul 2021 21:40:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sun, 18 Jul 2021 21:40:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=hcaYuRoAVm+Rdwl0tlvtUTTDbaS
	KK7ISg5YM3sPeRpc=; b=D6+tGsA09P2uQlldj6u6CppHkQs7Y30AFGmaNcokp9z
	mAki3iKnIS7Fl8e5j+lF3Ra8s3qWrWWHUsOQIRGQg/MGm/jXymyS78gGwfRDWjid
	3MOo2xTEPdpY2zS5+OsjCHeK4/UmzyTBhBrczfLuyLTnGJIg8tnRbWmM7UzCaWLy
	4EW68wIfeJtf5RGWNryqJlfbfiUqsQJ4AQhfQwHPIAtzZBWR2qhGqj84LkDvtRKH
	14IgKEn8jq1vTO6Y5YcceggE3IxAWrSppDZmmqxyftlygpMHpL63JuA2/REMfRs9
	sDBBBUR/62+Sa/GJaWCB4vPqKQMYqwU5RAxMZJkTzrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=hcaYuR
	oAVm+Rdwl0tlvtUTTDbaSKK7ISg5YM3sPeRpc=; b=H7Ov07LxOGcBcqUPFMwhJi
	qZiubYvhsUqcV+goJ6zhycq3D6n1mn8tNLFuR7yPdJq6GCrlnant7ClOC5H9Uu7X
	SuPmPa2fvETCbqZsRi7glTBwX/H7sUXF7DgeQEFadcw/Vjqlo3+7UtXSbUrX5D6k
	GpcuwXRWOGmlZNbipLxR3Tzmbw0gvHFtHSkHiVl7B4xHGZMvOdtGnGYyQex8BfTf
	hbD6LA9R6pDzJ2Vu3a+RF/DBavTxcQJdeVZWHLF4dl7sTVb5FjnBRo5dHjkKqI9k
	JC5SOqCLSwiwhPnKRYKeEyiFEva+4WCS3dP3GS58k6CQCOTsX5MVib96QdFmh7WA
	==
X-ME-Sender: <xms:Htj0YAAz6IqCDG5G4pFNaEuBZ0xqeZKNltTi4is63ldI3neqXoVKAQ>
    <xme:Htj0YCjTpQ7vpEIvFz4u9ASFRa60KdF_PYpI5zPeORiVjWPrKxEOhCWaXko40zDU_
    0vJ0287HlBPo4SBwA>
X-ME-Received: <xmr:Htj0YDkwkYjUePPB3TNshAb6uNDBgEUOpVp4lI0fERVUsGo1xXFmB9Q6T3ic7-T5NQiS8Bq5XMho3LYhBws9ryfR4ANOLqBdmujN_CI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdelgdegvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujghosehttdertddttddvnecuhfhrohhmpeforghrkhcu
    ifhrvggvrhcuoehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomheqnecuggftrf
    grthhtvghrnhepfeetudehfeetgeeivdffheelteeiieegjeduleeludegueeludeijefh
    udekjeejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhgrhgv
    vghrsegrnhhimhgrlhgtrhgvvghkrdgtohhm
X-ME-Proxy: <xmx:Htj0YGwqlL6Tv4ywVYgM2SadQ2nuIJ6qVUXJe-jftKsyGmSxQzDAmg>
    <xmx:Htj0YFTcBkNk6BMFFHJe3gV2sWylNjYZ1qd8dlsZ50PyonVumyFuZA>
    <xmx:Htj0YBbkNSogN-dR19z60SZuu3jOlnC-jhPoiEj6Pe5dRAnnfjqcdQ>
    <xmx:H9j0YEKXZeiltBfT0Jvd0VwxS8iGilLHRYJJa6_xdEDtt1dH2jnzng>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Jul 2021 21:40:46 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 76337136009D; Sun, 18 Jul 2021 18:40:45 -0700 (MST)
Date: Sun, 18 Jul 2021 18:40:45 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20210719014045.GA705685@animalcreek.com>
References: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: WRHW3NTRLLBKG57H33XLFCS4X5KUPZOU
X-Message-ID-Hash: WRHW3NTRLLBKG57H33XLFCS4X5KUPZOU
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [neard][PATCH 00/16] neard CI under Github and rouund of fixes
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/WRHW3NTRLLBKG57H33XLFCS4X5KUPZOU/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 10, 2021 at 05:38:43AM +0200, Krzysztof Kozlowski wrote:
> Hi,

Hi Krzysztof

> Mark proposed to do some work around neard (the user-space counterpart
> of NFC drivers) [1], so here it is.
> 
> I made a fork on Github [2] and I add here Continuous Integration via
> Github actions. These are pretty easy to set up. For starting only few
> builds are done, but I have also more in the queue - just need to fix
> 32-bit and clang builds.
> 
> The neard fails to compile on GCC v10 (earlier maybe as well) in
> maintainer moe (so with some warnings enabled) which is fixed here. It
> is also first round of fixes around UTF-8 and UTF-16 parsing, although
> this is not finished yet.
> 
> Further plans:
> 1. Decide whether official releases should be made from Github or
>    kernel.org.
> 2. Fix for clang.
> 3. Fix UTF-8 and UTF-16 in ndef.
> 4. Add more unit tests around ndef and others (help would be here
>    appreciated).
> 5. Add more GCC/clang warnings and fix them.
> 6. Add some static analysis checks in Github CI.
> 
> [1] https://lore.kernel.org/linux-nfc/20210512144319.30852-1-krzysztof.kozlowski@canonical.com/T/#m6a1cdae5f435b295cc7670c361b5bdc1daf30273
> [2] https://github.com/krzk/neard

[This pertains to all of your patch sets that you've submitted.]

I started looking at these today but this patch series does not apply on
top of the current neard master branch.  Also, there are CI patches
intermingled with code-changing patches (and at least one patch that
changes both (12th patch of second patch series).  Looking at your
neard repository, there seems to be some patches in there that haven't
been submitted via email.  Would you mind separating out CI patches from
code patches (i.e., separate patch sets and email threads), ensuring
that all patches are included, then re-submitting?

In the meantime, I will continue to get my NFC hardware running which
has been its own adventure.

Thanks,

Mark
--
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
