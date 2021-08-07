Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC3B3E3756
	for <lists+linux-nfc@lfdr.de>; Sun,  8 Aug 2021 00:05:36 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 82ABD100EB33C;
	Sat,  7 Aug 2021 15:05:34 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 3BDC4100EB85C
	for <linux-nfc@lists.01.org>; Sat,  7 Aug 2021 15:05:33 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id F1A905C0099;
	Sat,  7 Aug 2021 18:05:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 07 Aug 2021 18:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=KgkmzsOWAjC5cqF92AjyI3iedqL
	UUXYO6Ycz6ekIoTg=; b=n6zs8LfqwreXyCWlJrjHMOba9b3q0xUDoUFssfz2Y9o
	mDaIdg0/jbRpwVF7kE1xYE2eYYP7tkRt28jfSP/0kq3YsAr+aBLS6rQ/Qr746mJw
	Y20yeS+v1y7u6a7zMh02UPiRMOA+i3M1eD7dS9Lzhc4B/8JJz80ADZkOcYtyPPVO
	xWBHu6v0PNFnxqYwMvVjDCpE03ZawPBW5ZBHra2PeaZrsQy8Wz1BH8JfnPodbecf
	jez54AM0MUKfJIcKI0PLYVzBdQyDvs7TzOME55XEb592DuzzrsQ6dsv00dybA934
	1HkGqpAoXMhkZidP4twthK7ufPJopSLAYC0GBB5RdIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Kgkmzs
	OWAjC5cqF92AjyI3iedqLUUXYO6Ycz6ekIoTg=; b=NDYvZvBhX+TCwo3ICXMPin
	+r1CzsN3rumIkmPHCcCW0kF6bDdfHVkA/zkNiLmkShse8sKHw2g0wuu780lHqIol
	xzKEj7qEIYfrx3Swz1y1naNs2/rdHetJQxc+EVwiGm/0jKeth1atzop2gmPGWZYy
	C+HQaXhUmGYi/XnqWKx0YTfIMFLZeamJ+OrzYJT/8rdodOTZtGWznd/V5mxVHboK
	gPi/O+X0zred+uVTRZrrhwi5awhTJzlymrbS090C8CIu21KTTv9rTwWfO/pP3YoY
	bpRDS4IO7FxFRlmpr6uM6VbCHl7ReghPrQIYKZWsuNcXbPqVP2KIs2AeAAeH3ETw
	==
X-ME-Sender: <xms:qwMPYZBFCHKw66iw_M7Z3UM3Bu7vQDB7zeJvXAjL1Wt8Py_5MLC9kA>
    <xme:qwMPYXgau0S0hl98NoaGY02CeFlbCbHC-PHmRJyljg_-v3brQzY7mDnD2-0Oxm3D_
    m47sHiC69buaaFNzg>
X-ME-Received: <xmr:qwMPYUltcsvkYNzfsRa4cIbc4fipNahQR2wEWNZKirIfktg7rA1sJ7Vgyn6xyuMVu2Z_CbflDj1gwS276vj7E1MVvzLLnpKFdDtXVI8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjeefgdduieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjohesthdtredttddtvdenucfhrhhomhepofgrrhhk
    ucfirhgvvghruceomhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhmqeenucggtf
    frrghtthgvrhhnpeegledtgfeludelteeuueeggffftdeijeejvdeiueehhedvhffhvdet
    ieekjeekieenucffohhmrghinhepphgtrdhinhenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehmghhrvggvrhesrghnihhmrghltghrvggvkhdr
    tghomh
X-ME-Proxy: <xmx:qwMPYTyKF8CspZ8d_WZPMfk3Xj1awDxVoL8E9DdyKbogjST8htHF2Q>
    <xmx:qwMPYeSHy6MOHWl32uywzfpntpGV9oxN0UrvUfHkJi27EfTVmgjYJQ>
    <xmx:qwMPYWZQ1hhOf8Ctzrd1L0xx1R4eucZmvNF4TzzdwgrfV2YX6hYVmA>
    <xmx:qwMPYRIh57s3t-w_wxo_DguiAwIg-zTqQT8IPLANowuU2SDNoq1ntA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Aug 2021 18:05:31 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 64D5D136009E; Sat,  7 Aug 2021 15:05:30 -0700 (MST)
Date: Sat, 7 Aug 2021 15:05:30 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20210807220530.GB124928@animalcreek.com>
References: <20210804110145.85210-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210804110145.85210-1-krzysztof.kozlowski@canonical.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: 32FCKOZXWBYPMIYYJ347KTMBYBKHJYR5
X-Message-ID-Hash: 32FCKOZXWBYPMIYYJ347KTMBYBKHJYR5
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [neard][PATCH] build: fix missing pkglibdir substitute in neard.pc
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/32FCKOZXWBYPMIYYJ347KTMBYBKHJYR5/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 04, 2021 at 01:01:45PM +0200, Krzysztof Kozlowski wrote:
> The pkglibdir is used by neard.pc.in (so by autoconf) however the
> automake defines it, not autoconf.  Add early definition of pkglibdir so
> substitute in neard.pc.in will work correctly.
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
