Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECD737C36F
	for <lists+linux-nfc@lfdr.de>; Wed, 12 May 2021 17:20:05 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 0D28E100EBB6B;
	Wed, 12 May 2021 08:20:04 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id BC386100EBB6A
	for <linux-nfc@lists.01.org>; Wed, 12 May 2021 08:20:01 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 0ED645C00C6;
	Wed, 12 May 2021 11:20:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 12 May 2021 11:20:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm2; bh=Kgo+9NfshjuG9uUsAhGIj4n0WsL
	LkN92qiDU5HFHBGE=; b=SsIX0XUQUN14zlWxpW7R+W2EWCPzqjZVjVaqcQJrXpi
	QJNv9+Hex3F06GoFRvl30TJWqESFzrJOu3tvNoBnCSp0KrgJsvihuo0rh/E7W0pf
	CVGoddNJ41sJmYMto2DYyOaPEn1VMTU8LiD6FEfTYsyUieFtFftSOf6oC0/fGjFR
	ihItMV6APaZdTD33tL42QRdJhxceBrV7HCi8ecnDaoOuAeOr0PTjfxyE8wWLH8BE
	Tb6dNt2UHyrJJaC56C5G5oiwuIyd596tAs6bUUtaeABGX9yS2o+TjaCFx5hInI39
	xK3/+zpL/CCgPUajqO0oAyD/SHm6iGODhnAYxemPxSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Kgo+9N
	fshjuG9uUsAhGIj4n0WsLLkN92qiDU5HFHBGE=; b=B6TMkebtXL8k9llFwztwzI
	1onpRtGr5Zg437jmAP/Bkd/E9QxrC57fKTDXnrWFaHTWpmyLIcvhL66HGtbsqGcI
	9zOWnzZtZ+5J1xI+gP7pqKMEIToCrAy08eSMdDnzNAOau8XrheZKfFXYqNtdwwOc
	QJnseDD+ZVTyMndiCbGf9sML2em/RZZCI3LAqY1F+d6PJBHlOYLF/OqaQ2HZPIYh
	rMLGl+XlwesxLp7+dPEwL0+YgfvaN6zkYs4KxpkxGF/43aFBP/zgSECiwuT1F7t3
	ckwLEjpep7vxKYtmPs/Jld+iw7+kxgnwLPwTJMz7+zlH9q3RAAzjn81qKhrbHAPQ
	==
X-ME-Sender: <xms:IPKbYAtijJa21vrOKPHj2ilGX4DbmKHj-9zG26QI2MftKsWOYYMjPQ>
    <xme:IPKbYNe89W1_HpPYkLgiGVgbIEZ2OlXZ7UOIy_K1qjCNqm6LoPigF-pJT7MWMbfyF
    RL3X6GgqU8S0PcJNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehvddgkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjohesthdtredttddtvdenucfhrhhomhepofgrrhhk
    ucfirhgvvghruceomhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhmqeenucggtf
    frrghtthgvrhhnpeeiuefguddtfeeitddvffetudefvdejhefgveevfedugfejffegieet
    teejudffhfenucfkphepjedtrddujedvrdefvddrvddukeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmghhrvggvrhesrghnihhmrghltghr
    vggvkhdrtghomh
X-ME-Proxy: <xmx:IPKbYLzp3hhtVEKltQGZ69mFjYYDBjt7GiwExZlk8OgtNy9xfM8-pg>
    <xmx:IPKbYDPZG6NTbNeve-ysKLW7be1gdK_KFg43CpliRrKy85pCCsKCTQ>
    <xmx:IPKbYA8RRymLY_zfXRKBmxFvliVIaexSQRg7Ha6MOkppimoHZ5vv-w>
    <xmx:IfKbYJITzhABuFW7szg8BHxGToUb6eGGjIK31pHPp68hXXSdpli4ag>
Received: from blue.animalcreek.com (ip70-172-32-218.ph.ph.cox.net [70.172.32.218])
	by mail.messagingengine.com (Postfix) with ESMTPA;
	Wed, 12 May 2021 11:19:59 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 36A4F136008B; Wed, 12 May 2021 08:19:59 -0700 (MST)
Date: Wed, 12 May 2021 08:19:59 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Oliver Neukum <oneukum@suse.com>
Message-ID: <20210512151959.GD215713@animalcreek.com>
References: <46d0d6a709d42a344db86b8646293c077f0b8521.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46d0d6a709d42a344db86b8646293c077f0b8521.camel@suse.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: 5MEIYQNP3KC2R66VVR3N32BU5OQYWJ4H
X-Message-ID-Hash: 5MEIYQNP3KC2R66VVR3N32BU5OQYWJ4H
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: how to test a driver for a new device
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/5MEIYQNP3KC2R66VVR3N32BU5OQYWJ4H/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 11, 2021 at 06:30:42PM +0200, Oliver Neukum wrote:
> Hi,

Hi Oliver.

> I have a system with an NXP1002 as opposed to NXP1001
> device. I've added it to the nxp-nci driver and I can detect
> tags. Is there a test suite for NFC I should run before
> submitting?

There isn't a specified test suite but there are some python scripts in
the neard repository that you can run to ensure that things work.  Those
require neard to be running, of course.

Mark
--
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
