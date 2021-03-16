Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C10B33DBEB
	for <lists+linux-nfc@lfdr.de>; Tue, 16 Mar 2021 19:02:20 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 57AA1100EBB71;
	Tue, 16 Mar 2021 11:02:16 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 00867100EBBCE
	for <linux-nfc@lists.01.org>; Tue, 16 Mar 2021 11:02:13 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id CDF0C5C00E5;
	Tue, 16 Mar 2021 14:02:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 16 Mar 2021 14:02:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm2; bh=4b1r5k0kIk0lfR9k9SzOnyXfWnc
	xd8DH1ID+7jUQbQc=; b=MtKLwTgcNwhxEp8DlyPgArr+wLS1If5pHuDSk7SEdHT
	fO9/11r9NXnOvtzzpgz5qrLrg0OOg6eLeWZk3RQRh8epVMfRO6Dp0hnZMPR9ZZXH
	GfHLtqZdfiqOxsyLXoAR4J8VM0jYJAfNiBM8772QfPJj1Qw57mDuwkAh7qMLk4rz
	wZKQiSqOOPipq/rtyjfu1rCrbZwAlN87slb0RJTqlZVqTg9mBP0X2DaUe+JBPYjh
	2Gr9MrHU96r6IZm1/2RNZJ7kfZxFUvTHh+WSLOgDQNpEo0xlMYj4RRlgy2JP9GDT
	Ie5AUehuCJTKMC+q0vg5P5ZfyIYQqvplnSs9Ems3nXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=4b1r5k
	0kIk0lfR9k9SzOnyXfWncxd8DH1ID+7jUQbQc=; b=jkIOgdKxlIo2In3+Zp0iRJ
	4RNe4klBvUxuLdHRAXWEDoR56vs5U6xGGXm+90HVTDvPME96n/0mLhXA0V0fauQT
	nkH207gkuQXNc3rlX0Ot16o0AXQ5YkmFO1bOQhSKFFAfZHn55LWvGqrQR2LmH6RY
	4X48nTgEzMnRvnrdeG7oAe70td1FS5mt9YSJNt5M+BDFo8rpkB8xHd/99GRnchdi
	ve4P/MBCXGQ7swg2bvkBMxfjaJ4bo4gNA/5bmgjb1t55K3Ji0uD/HPUOt29nwi6t
	J0mcIyTGD+WfN5R2XqfsXl6zXJs+6GIrfy4mjMrfQIQnLTyvdk0NB0d+H2VLJ71w
	==
X-ME-Sender: <xms:nvJQYJ-FfFERUMRN22-Au5y6XpiUihPjSn-GbcFsKvDfyank9ebPxA>
    <xme:nvJQYLjMxXuetG_4BzBKnWQ6gA7kT6GdTSlGeC4Vs0qyhAdt3mzdFCkpsMF1XK9Fj
    D8EtNSPwo5ucQbpAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefvddguddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujghosehttdertddttddvnecuhfhrohhmpeforghr
    khcuifhrvggvrhcuoehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomheqnecugg
    ftrfgrthhtvghrnheptdehgeduveetveekfeefveduffdvjeekiedtkeevuefgteelteeh
    gefgudfhtdeinecuffhomhgrihhnpehqthdrihhonecukfhppeeikedrvddrkedvrdduje
    dunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhg
    rhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhm
X-ME-Proxy: <xmx:nvJQYBewBmAbHSJQuglAF3Z8G7kJ-9YPMT1RNL4TJzT3VzG1QZ5A9A>
    <xmx:nvJQYKrx13rxAF6GvQUhnTYP8CMN6NCVozAwCgqAddcjfI7oFUM4DA>
    <xmx:nvJQYOC0sw07ph22Y4iDjwiM8K4LiF6ao-H1YX3lEPYyZucuTfxP4A>
    <xmx:o_JQYKBixAe_8LNzGB-jIES2Utww6YBxWmKIMDgguy9Ce3GTG6aT1Q>
Received: from blue.animalcreek.com (ip68-2-82-171.ph.ph.cox.net [68.2.82.171])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2D2F41080063;
	Tue, 16 Mar 2021 14:02:06 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 1BC131360097; Tue, 16 Mar 2021 11:02:05 -0700 (MST)
Date: Tue, 16 Mar 2021 11:02:05 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <20210316180205.GA501044@animalcreek.com>
References: <20210311085020.429987-1-frieder.schrempf@kontron.de>
 <20210312012140.GA316619@animalcreek.com>
 <baa083e3-0f3c-6038-7b0b-f1c576d8f200@kontron.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <baa083e3-0f3c-6038-7b0b-f1c576d8f200@kontron.de>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: BVWQ4RLYWY3CRDLFIQ5XC4BTYM3NBVTV
X-Message-ID-Hash: BVWQ4RLYWY3CRDLFIQ5XC4BTYM3NBVTV
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] tag: Implement readout of tag UID via DBus interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/BVWQ4RLYWY3CRDLFIQ5XC4BTYM3NBVTV/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 16, 2021 at 09:53:21AM +0100, Frieder Schrempf wrote:
> Hi Mark,

Hi Frieder.

> On 12.03.21 02:21, Mark Greer wrote:
> > On Thu, Mar 11, 2021 at 09:50:20AM +0100, Schrempf Frieder wrote:
> > > From: Frieder Schrempf <frieder.schrempf@kontron.de>
> > 
> > Hi Frieder.
> > 
> > I am supposed to be taking over neard maintenance but I have been
> > completely derelict in my duties.  I need to refresh my brain's
> > cache and look at your patch in more detail.  In the meantime,
> > I have a few minor comments below.
> 
> Good to hear that you are planning to take over maintainership. I was a bit
> worried to see neard being abandoned.

Just a warning that I have precious little time to dedicate to this so
please set expectations accordingly.

> I also recently found out that Qt has abandoned their support for neard in
> Qt 6 [1], which means that Qt 5.15 is the last version to offer integration
> with neard.
> 
> I think that's very unfortunate as this provided a nice and mainline-ish
> stack for NFC devices from the kernel up to the application layer. I don't
> know the reasons for this decision, but neard looking like it is not
> maintained anymore is maybe one of them.
> 
> [1] https://bugreports.qt.io/browse/QTBUG-81824

Thank you for the heads up and link.  This is disappointing.  I'll reach
out to them and see what their current thoughts are and whether they'll
reconsider.

Mark
--
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
