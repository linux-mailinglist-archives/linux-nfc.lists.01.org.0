Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A8137F9FB
	for <lists+linux-nfc@lfdr.de>; Thu, 13 May 2021 16:49:03 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 90475100EF26A;
	Thu, 13 May 2021 07:49:01 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 63025100EF25B
	for <linux-nfc@lists.01.org>; Thu, 13 May 2021 07:48:59 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.nyi.internal (Postfix) with ESMTP id 3A9D0580715;
	Thu, 13 May 2021 10:48:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 13 May 2021 10:48:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm2; bh=lEk17EktawF4yxbelteLRZPL1u7
	6s2v81K0ba/CVsLk=; b=dst6D/19N83Ua2dTF3g8TngtqoC74H416i/EgnfFofw
	3nDGfArAk0ihsOzFOXuI3Us9IQFYQ3uJIYjuS3vmZtIp7dMORyM203+z/PTZXGIm
	0K6zTD7y6l2J5h/CKj9LatOU5HmHItaLeCljRBMLW8H50IObu6v7xN61hrQBlAun
	6EZUSN+eJVy0uOIjrFmPbmTAOV9MFtNXMj3u33s2IbZ80DJyJ4iD/yn+/VW+Poi7
	AX9+ztICVwZ1fvHg7sSypdr44GHSFY6g5w7oZV0FeWnBFqpvRnixHGvKYTlqQceD
	QWMFLua5JCumUiEuIfsK4aK4aunhJ25PvbdS2f8m63Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=lEk17E
	ktawF4yxbelteLRZPL1u76s2v81K0ba/CVsLk=; b=B+ppxc5KqjbyAI6jGMV0c8
	l3rNFJ7Cuvtgmgbrcd2UqMszPUVD81ml/Z5DXib3PMsSrlyNMRuMkgVd1JP5YhDB
	hiLV16AtlCPMxN94/W0JHvpl5JzwyH+Jii5h0tTcAjl4JzOCsLtXan7dhBSVBBmt
	fuqC4rkbUeO7cOauaJuk+/vvkS3SGqGf+SgEK+dGpS2HXcyRUszpwXOlkbzl5kws
	i3Lb4v9fyJE4UWnkJJlI2yB2QwXpRk70NV+wzeXCWM+TrMpMr/tRnFf9+QrmPQqX
	pFVLmTp8O3lLVs+5VW/BKfBbTnShAWKcMx6tXDqlRv8ku56C1IWNr06O0BKVgkcA
	==
X-ME-Sender: <xms:WTydYH1AdZuqZV75EQ77wbbQJizOCC4Unx9-FnyVuhYLx93H7zzcqw>
    <xme:WTydYGHfDqrYYj3_6O5O5cDljxGzb937CMGwW3KvjegyT7vvKnwvQKe1bcNuiEnLD
    qoUX-N573bSft4oqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehgedgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjohesthdtredttddtvdenucfhrhhomhepofgrrhhk
    ucfirhgvvghruceomhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhmqeenucggtf
    frrghtthgvrhhnpedujeelgeejleegleevkeekvdevudfhteeuiedtleehtdduleelvdei
    fffhvdehtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeejtddrudejvd
    drfedvrddvudeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhm
X-ME-Proxy: <xmx:WTydYH6a0serpBMN0bhht0OcKsZuXXuzXk4tjPBimH3o0dJE-R0zcw>
    <xmx:WTydYM1nhEBx9iyhPMUoGqeS88bQ2f-vYGeYFAN_OrfHGz2GqhAOvQ>
    <xmx:WTydYKEk4iDN7SHNX2RLhWQsQD9KEV9AtFKeSo7gVslAQXas80eZMA>
    <xmx:WjydYIYeddoIr3gRJY-O7nvnW9ji4XewFauyBzAoYJp89UHtV8wRfQ>
Received: from blue.animalcreek.com (ip70-172-32-218.ph.ph.cox.net [70.172.32.218])
	by mail.messagingengine.com (Postfix) with ESMTPA;
	Thu, 13 May 2021 10:48:56 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 8E0EF136008E; Thu, 13 May 2021 07:48:55 -0700 (MST)
Date: Thu, 13 May 2021 07:48:55 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Stephan Gerhold <stephan@gerhold.net>
Message-ID: <20210513144855.GA266838@animalcreek.com>
References: <20210512144319.30852-1-krzysztof.kozlowski@canonical.com>
 <14e78a9a-ed1a-9d7d-b854-db6d811f4622@kontron.de>
 <20210512170135.GB222094@animalcreek.com>
 <YJ0SYWJjq3ZmXMy3@gerhold.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJ0SYWJjq3ZmXMy3@gerhold.net>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: TRK4KJFKRV4BWPIE2WGTZZWMJHA35G4H
X-Message-ID-Hash: TRK4KJFKRV4BWPIE2WGTZZWMJHA35G4H
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Frieder Schrempf <frieder.schrempf@kontron.de>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nfc@lists.01.org, Alex Blasche <alexander.blasche@qt.io>, phone-devel@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: Testing wanted for Linux NFC subsystem
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/TRK4KJFKRV4BWPIE2WGTZZWMJHA35G4H/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 13, 2021 at 01:49:53PM +0200, Stephan Gerhold wrote:
> Hi!

Hi Stephan and thanks for stepping up.

> I have a couple of "recycled" smartphones running mainline Linux
> and some of them do have NFC chips. I have two with NXP PN547
> (supported by nxp,nxp-nci-i2c), one with Samsung S3FWRN5
> (samsung,s3fwrn5-i2c) and even one with Broadcom BCM2079x I think
> (this one does not have a driver for the Linux NFC subsystem sadly).
> 
> +Cc phone-devel@vger.kernel.org, in case other people there are
> interested in NFC :)
> 
> The NXP/Samsung ones seems to work just fine. However, since there are
> barely any userspace tools making use of Linux NFC all my testing so far
> was limited to polling for devices with "nfctool" and being happy enough
> when it realizes that I hold some NFC tag close to the device. :S

There is a user-level daemon that is the counterpart for the in-kernel
NFC subsystem.  It is called neard and is available here:

	git://git.kernel.org/pub/scm/network/nfc/neard.git

There are a few test script in it that will let you read and write NFC
tags, and do some other things.  We can add some more tests to that set
as we go.

> I would be happy to do some more testing if someone has something useful
> that can be tested. However, I guess ideally we would have someone who
> actually uses Linux NFC actively for some real application. :)

Ideally, you should have some NFC tags of various types.  Types 2, 3,
4A, 4B, and 5 tags are supported.  Peer-to-peer mode is supported too
so you should be able to transfer data from one of your phones to the
other over NFC (and do a BT hand-over, if you're interested).

Note that the specified range for NFC is only 4 cm and poor antenna
design, etc. means that the actual range is usually much less (e.g.,
they amost have to touch).  Also note that there are timing constraints
so you may need to make the scheduling priority of the interrupt thread
of your NFC driver real-time.

Mark
--
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
