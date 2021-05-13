Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC3A37F0F4
	for <lists+linux-nfc@lfdr.de>; Thu, 13 May 2021 03:35:47 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 7204D100F2276;
	Wed, 12 May 2021 18:35:43 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id CCD54100F2275
	for <linux-nfc@lists.01.org>; Wed, 12 May 2021 18:35:41 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id A23CE5C0066;
	Wed, 12 May 2021 21:35:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 12 May 2021 21:35:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm2; bh=DpVUZkigS0YBcpQTAee6c+OCcYp
	kgSAchYFyPrT0G/I=; b=SJFqvRwXKaHVDrp6yAbs5aDuYPqR5dMZEZPNWhqHCNL
	bAp/P8hbLXXc6IaZOb2xy7dRFIepJJqymysEeBW3wB1Xg4ThHWx2abvyvYkMsrzC
	5QqwqQHxeIlHwQCH0kwlFwRMMpBP0w5qD8UMMeTBxuOFYvog8m4PQKcn4FHTMrzz
	7EZeZlZ40d8YQ4pPlzXLdf1mMAno9mnGPeqZ53ZFRzYhmdEHtK7XLYregQrj74NB
	thZuThM1IkHXX0/JQuIrLdKagNdh7Ve8KwM8tfDkboF2s49HaNAog6wkg+dWC6i6
	3cIOeKwWunVWTt9t+6wj4Y+aF8hBB3ZGBCdt8yNAmYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DpVUZk
	igS0YBcpQTAee6c+OCcYpkgSAchYFyPrT0G/I=; b=OefKtoattdw537PpJdXfxG
	jwqYDSvbE9GmGzKaTQTuiuPs1OXiw+fjvIlGUmED1+GIAs/z9S1DIjZo1CfoVaHo
	bEFSiD2CXGXQUTVSrXJoVLyqI/vz+7/V4nROPpTSwzFkaMEZDR2Q3RP5yTEj3ACV
	SdDBYE0bJ7S8qfhxVVnsn4d8ogsQSyeB7afqx8JPA7ktTxoRQBY5NmKl59yDzJp5
	xhVhbLkkZPHWfL/pir7LPTDOV5IWVXa87Y2g+sc1s92jhGT4AiI+eus0KNYMaX74
	NZOIm4MDCbaMJUdROT5iyT4/EoXt+0cPzZO0LiYUPIROXY8Ra9OAH2xJIOK/aWLg
	==
X-ME-Sender: <xms:a4KcYGnxGmmAIqp-win5FZOhI6MVjVJJve1clAnteo4EXMvo_xaqBw>
    <xme:a4KcYN07H9hHVzDyk9dTxy-ymPrbn6H0SWhcxFrh7gxwxOeXdQWJ81Ax5VNtnRO-p
    meGX1em1rgdaRNPwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehfedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjohesthdtredttddtvdenucfhrhhomhepofgrrhhk
    ucfirhgvvghruceomhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhmqeenucggtf
    frrghtthgvrhhnpedtheegudevteevkeeffeevudffvdejkeeitdekveeugfetleetheeg
    gfduhfdtieenucffohhmrghinhepqhhtrdhiohenucfkphepjedtrddujedvrdefvddrvd
    dukeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
    ghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomh
X-ME-Proxy: <xmx:a4KcYEpjMeKINo4TqU_tJZq6V7NLnxI15BpHwbBsW0M7eWZobcuQgw>
    <xmx:a4KcYKkuV6dsV-0TvuGu-2uMprVwns-2DC8Sr7P4ZD6xlkbjoErnBg>
    <xmx:a4KcYE14GmK2tR9Qk9LF1GNOltslgJUEZrA5oK5rUSoZGVJ6CJO-Xw>
    <xmx:bIKcYOqCu1RbsC7KTxJUOVVctHLIz-D1bmOwIzTvZ55UVgH6kimb6w>
Received: from blue.animalcreek.com (ip70-172-32-218.ph.ph.cox.net [70.172.32.218])
	by mail.messagingengine.com (Postfix) with ESMTPA;
	Wed, 12 May 2021 21:35:39 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 431E4136008E; Wed, 12 May 2021 18:35:38 -0700 (MST)
Date: Wed, 12 May 2021 18:35:38 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20210513013538.GA239989@animalcreek.com>
References: <20210512144319.30852-1-krzysztof.kozlowski@canonical.com>
 <14e78a9a-ed1a-9d7d-b854-db6d811f4622@kontron.de>
 <20210512170135.GB222094@animalcreek.com>
 <cd7a0110-702a-6e14-527e-fb4b53705870@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cd7a0110-702a-6e14-527e-fb4b53705870@canonical.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: DCFYEWFDOFUXLAPLRFVGADITC5ZKOZ3F
X-Message-ID-Hash: DCFYEWFDOFUXLAPLRFVGADITC5ZKOZ3F
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Frieder Schrempf <frieder.schrempf@kontron.de>, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nfc@lists.01.org, Alex Blasche <alexander.blasche@qt.io>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 1/2] MAINTAINERS: nfc: add Krzysztof Kozlowski as maintainer
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/DCFYEWFDOFUXLAPLRFVGADITC5ZKOZ3F/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 12, 2021 at 04:21:25PM -0400, Krzysztof Kozlowski wrote:
> On 12/05/2021 13:01, Mark Greer wrote:

> > Re: QT - I've already talked to Alex Blasche from QT (CC'd).  With some
> > work we can get Linux NFC/neard back into their good graces.  I/we need
> > to find time to put in the work, though.
> > 
> > An example of the issues they have seen is:
> > 
> > 	https://bugreports.qt.io/browse/QTBUG-43802
> > 
> > Another issue I have--and I suspect you, Krzysztof, have as well--is
> > lack of hardware.  If anyone reading this wants to volunteer to be a
> > tester, please speak up.
> 
> Yes, testing would be very appreciated. I don't know how many unit tests
> neard has, but maybe some mockups with unit testing would solve some of
> problems?

I'm not sure what you mean by this.  Do you mean creating some tests that
sit directly on top of the kernel and test the kernel parts (e.g., use
netlink)?  If so, that would be useful but you may end up implementing
some of the NFC stack.  If you mean more/better tests that use neard to
exercise the whole stack then that would be really good too.

Speaking of NFC stack, the NFC forum has their specs paywalled which is
a real bummer/pain.  I can try reaching out to them to see if they will
help us help their mission but I'm not hopeful.

FYI, most of the issues that I ran into and know still exist are
timing/race issues in neard.  I'm sure if we tested more, we could find
some in the kernel though.

Mark
--
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
