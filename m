Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3623CE432
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 18:32:58 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id DE17B100EB355;
	Mon, 19 Jul 2021 09:32:56 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 35E8A100EB352
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 09:32:51 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id 53A285C0067;
	Mon, 19 Jul 2021 12:32:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 19 Jul 2021 12:32:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=QgROJs0KlTphpL9KjoMLq0QjopL
	HnKdG80bl4edVseQ=; b=jPwIUgos/LlGy4OM38c4PKS+Lkz53PLu79/VhT/6eH1
	HK3bgeKg9+ySMbewv1DclgzeD7g4GGavIYDD2MSCAr5j+R8r95QpSYZ3z/1FcRrt
	DRGIiVrVGA3G4lBurG4Mn/aTCjrSPb9XpW+x0Botc7n/QZCisZ2ht7tktthlaWcX
	VQy9Ge1LNqYBy1GTyTfuhku3qFtnnnZTp7AQ5EKxxDHxdDnTu2OBVhsINjHWY8R/
	5TCUQzb7hDgUByeE2jAgG9vAA4zJZkj5Pb/RvtjermtvlPTmEkzJ51hfvnDBSovB
	NS4sCMLFPEXss+g71GxeV+kecw5xU9IEHVVFPpwjLEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=QgROJs
	0KlTphpL9KjoMLq0QjopLHnKdG80bl4edVseQ=; b=vugTTWHRDKNHLifwLeVN0h
	hu24hHOSa827hBe9UIwg+l+f5kYQRlnEUUhOe26+VEeadjkosuEM7HBYqoM3UTUK
	JXg2CX1QBEbFLRIVdUE4BvCv5JNl3Ef/tqwbWQxAHJBHTEHEIeLFGOWwCfWniSoM
	hEovPYs2Cq8Yo/SISpjFglvmYBs7IZSXB9Gjs6TpoYTLNQ47JLHqREWCg9xocs2H
	ahozT6GMinRGbNoZZRVB4MYMN+jFFtLAblnrpLAbHF+4y6EnJgjCfyVAKFmzF7Bk
	Cgf5OhkZI5S1jqwjeNKz9jwaObLBSkItzuJ2eFz8XoZJQokhwo3CTMMtQI9wJ6JQ
	==
X-ME-Sender: <xms:Man1YKVSseJ9y9KA5RqNwvemT_N9kju0MOviTDDUAYUQn1K8qIS72g>
    <xme:Man1YGmK0mMjnAwvVMtAtfv5VGXQBn8IWd3NJmc4Y6xcRG1jK2D5YjYb00ARfN3bf
    UY0wKA7rVT3zrhvRw>
X-ME-Received: <xmr:Man1YOacK0czZgDw0E3H2hzpIyQQLNmH6zW131ixouf5nkUSauR5vcvD-QsjpRMO7J3i1Yu1KMCwx6G0bbWisH_F8rJk9F_uQzrewVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedtgddutddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjohesthdtredttddtvdenucfhrhhomhepofgrrhhk
    ucfirhgvvghruceomhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhmqeenucggtf
    frrghtthgvrhhnpeefteduheefteegiedvffehleetieeigeejudelledugeeuleduieej
    hfdukeejjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmghhr
    vggvrhesrghnihhmrghltghrvggvkhdrtghomh
X-ME-Proxy: <xmx:Man1YBXec9k2Uh_hGMjnZ4dzR4dm7HoUEiRjjVUlJPT7iERiYRMbHQ>
    <xmx:Man1YEkxfN2yedYwByM4uKsSEGcOH5ETmD_Urr41t3I78yVXfQPW6A>
    <xmx:Man1YGcuWyBnWhy-iEkS6GnKzHpGUWAHh8LbsDyFH7GpT1o8X_gLZA>
    <xmx:Mqn1YAu3Pj74QdUHtiSHUMN0eEvLbUiNbkKeA5Y3KIxhS_6D7tdPMQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jul 2021 12:32:49 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id EF8AB136009D; Mon, 19 Jul 2021 09:32:47 -0700 (MST)
Date: Mon, 19 Jul 2021 09:32:47 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20210719163247.GA860856@animalcreek.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
 <d78d75e7-098c-cf41-9f96-c746d91385ad@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d78d75e7-098c-cf41-9f96-c746d91385ad@canonical.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: 3Y3YYOEXPOHPVIX2SYT5KEJQGIBGRRFR
X-Message-ID-Hash: 3Y3YYOEXPOHPVIX2SYT5KEJQGIBGRRFR
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [neard][PATCH v2 00/73] combined fixes - warnings, memory leaks, memory corruption
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/3Y3YYOEXPOHPVIX2SYT5KEJQGIBGRRFR/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 19, 2021 at 01:21:21PM +0200, Krzysztof Kozlowski wrote:
> On 19/07/2021 13:07, Krzysztof Kozlowski wrote:
> > Hi,
> > 
> > Mark asked for resending fixes separate from setting up CI under Github
> > Actions, so here is a combination of all my previously sent patches
> > related only to the actual C code:
> > 
> > https://lore.kernel.org/linux-nfc/20210710033859.3989-1-krzysztof.kozlowski@canonical.com/T/#t
> > https://lore.kernel.org/linux-nfc/20210711202102.18094-1-krzysztof.kozlowski@canonical.com/T/#t
> > https://lore.kernel.org/linux-nfc/20210714110518.104655-1-krzysztof.kozlowski@canonical.com/T/#t
> > https://lore.kernel.org/linux-nfc/20210716100844.51360-1-krzysztof.kozlowski@canonical.com/T/#t
> > 
> > This includes fixes for GCC/clang warnings, memory leaks, memory
> > corruption and few other minor fixes. The UTF-8 and UTF-16 is not
> > entirely fixed and I removed the work-in-progress patches.
> > 
> > Changes since v1 are:
> > 1. Group all patches based on prefix (unit file), instead of topic.
> > 2. Put the build-related patches at the end.
> > 3. Remove all CI-related patches.
> 
> I put CI-related changes in:
> https://github.com/linux-nfc/neard/commits/krzk/github-ci-v2
> 
> It's based on master, so it fails building (fixes are in the set here).
> Should be rebased on top of this set before merging. Few patches got
> also squashed as now this set does not follow my exact development history.

Okay.  I'll work on reviewing through the week but I likely won't get
through many until next weekend.

Thanks for the quick turn-around.

Mark
--
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
