Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A1B3E37D0
	for <lists+linux-nfc@lfdr.de>; Sun,  8 Aug 2021 03:38:37 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 40B35100EB341;
	Sat,  7 Aug 2021 18:38:36 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 31F8C100EB33F
	for <linux-nfc@lists.01.org>; Sat,  7 Aug 2021 18:38:34 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 967B2320030E;
	Sat,  7 Aug 2021 21:38:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sat, 07 Aug 2021 21:38:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=ydZzMESPavWKcz5VhnZA8LMKX9M
	Wuaq4a4vW9CMyGzQ=; b=HrcsKHHrL5wOVJfD6QfSX1yjxmboqm8G1dWHOBK7Z4l
	2gQZbMZW4pXYlJzzcj8OPjq5qCBt8DbIT6x+ouCKHhXRNUwBBQZrt9VE4TureP7d
	Zz8LaH87MM9BEecDfe0tA7HWxcM1Z8mtjFfrcY2K7Jm8fxJJ28t1LMCoWmd2zmHQ
	IFKbT5sOVDrqsinsONbZV5I+nKPH87KNZihgQTh0OnuXd1T1hWykQarF5qyZi2TJ
	mI5u+0jaUahlGlo+CSNH3MM5da8zptMK+I45hAMcrT7jJGhyzsTB/e7fHgCsNK3j
	D7y+SLrEd6p0YwZ1Kxw5uX8Xxo5FeYDs0KCLh3EpPgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ydZzME
	SPavWKcz5VhnZA8LMKX9MWuaq4a4vW9CMyGzQ=; b=PCh23Qwdl43aeUWRGIyaku
	FiXeNSp26nt0g5ivB0VqtrC19ZgrJwSEzLJSxkd8pC/MDtU+oeGsWRXKL8OGTOoY
	vClacr+9n1ir6rfXwpels9weoZ2dzCil7RBCSI3BUaut/EYRMwwaRVW1J2qxsCTQ
	isAn5zPRC9JERlGnfuY5fmXslYcP2gJK8xc98xNCqp3HpNFBS5u2HwNFdvaY+WoY
	JU65D1x+a+Clez/1IlL7us0OoSUFts7G/Ahj5Sqy82wa6Xc2r6G2mCMQFAFxTVzI
	N6X+mnULo0LT0O7payy9cwEa5sEbH7lCTjjOLbCVK0E99JXGtH1KAvnoQF0Ok3IA
	==
X-ME-Sender: <xms:lzUPYZ21_FQEtrwA45-v4PZXMvdsf3TKoXgDFGJgWcEvp5Oq2ySrZw>
    <xme:lzUPYQF-dhVQaBFE4esBq8qQBMthGcOpWtw2CqDEoCMA4NdoSOKGSqI4QL7rVbd8T
    41bXeTgo6fg7JGGQg>
X-ME-Received: <xmr:lzUPYZ7k9JajsT87hhezCvFyJ8UZIuhb1DrJGlcZ8yQ6zfpXeQ6XsweSgu6UvhfsJSJtuxUwLNtWm6ntnIRhxsDB8CnnNW786gV5zr8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjeeggdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujghosehttdertddttddvnecuhfhrohhmpeforghrkhcu
    ifhrvggvrhcuoehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomheqnecuggftrf
    grthhtvghrnhepieeugfdutdefiedtvdfftedufedvjeehgfevveefudfgjeffgeeiteet
    jedufffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhm
X-ME-Proxy: <xmx:lzUPYW23NlYafD1VGANcWbC5BQdZDCn7-I2WSRKnjbua5ZRKJlP5oQ>
    <xmx:lzUPYcHL17iiEShBfvqHnh_pxFszvOUSTYGh_7NlaM2NTG5eLxFAtQ>
    <xmx:lzUPYX_Dw0mtBNrN7JQr9B2uJi0rUDqrBOj9zgHNgElZBloz9pThLA>
    <xmx:mDUPYRQwDuoT4zgHjIMo-aPMW2c4GDx6JuhkdYFpY2SiBB87sRC_Kw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Aug 2021 21:38:31 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id A8A38136009E; Sat,  7 Aug 2021 18:38:30 -0700 (MST)
Date: Sat, 7 Aug 2021 18:38:30 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Message-ID: <20210808013830.GD124928@animalcreek.com>
References: <20180917094856.5961-1-ricardo.ribalda@gmail.com>
 <20180917233752.GA12491@animalcreek.com>
 <CAPybu_2=rY5g0MNNoztBZQQhbteXxgG7RdrgQAWT6HkaKvp8sA@mail.gmail.com>
 <20180919170359.GA16132@animalcreek.com>
 <20180921032904.GA19759@animalcreek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180921032904.GA19759@animalcreek.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: O725HO4IJBBUIYUFETI4V5OUJGLJD6QN
X-Message-ID-Hash: O725HO4IJBBUIYUFETI4V5OUJGLJD6QN
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] ndef: Only register interface for known records
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/O725HO4IJBBUIYUFETI4V5OUJGLJD6QN/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 20, 2018 at 08:29:04PM -0700, Mark Greer wrote:
> On Wed, Sep 19, 2018 at 10:03:59AM -0700, Mark Greer wrote:
> 
> > Thanks for the data.  I'll decipher it later today.
> 
> Hi Ricardo.  I sort of got hit with some stuff so it may be a few days.
> 
> Sorry for the delay.

Well, a few days turned into a few years but it is in there now.
Thanks for your patience Ricardo.

Applied.

Mark
--
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
