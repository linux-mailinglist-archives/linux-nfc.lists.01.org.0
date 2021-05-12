Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B598737C9E9
	for <lists+linux-nfc@lfdr.de>; Wed, 12 May 2021 18:49:59 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 5BADB100EB82B;
	Wed, 12 May 2021 09:49:58 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 2DFB2100EBB6C
	for <linux-nfc@lists.01.org>; Wed, 12 May 2021 09:49:56 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id F118D5C0107;
	Wed, 12 May 2021 12:49:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 12 May 2021 12:49:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm2; bh=xX4sK0wP630sSX/gWoDeLZV/D7e
	lv2JgtfxTDJe3BMs=; b=bUcYWO2o4IU/HZu8Nx3PZDJkz7Y2B58VgCQwd8YZOiP
	xjOUlspn6JYTzA+j4AMZbLl7LWBH1aCBawhP4CoFskkYzzJDBTRTF9O50GiFnmTr
	FmhFYsmr29jxJB5t4L8p9Ap0PmJF2k1GKk0Qtp68X62GfxSVIHvEmpaXn+yN+zD+
	30m5TefoXWJguthFki3QGQLP92gafVA/4II7+fogjKaahX+XSgpGcBIs75+YMRa+
	fpa7nAESevUxEy/HNDbbgC36+ZvDrCaLYHaUf7jYoMMOpyJKe4aPmVuLxHtyqNhp
	nGrpHfhbkQMGBsMqqbqwMQlfqXm/ZAx2SHY2+86bOtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xX4sK0
	wP630sSX/gWoDeLZV/D7elv2JgtfxTDJe3BMs=; b=RP82s1NAHJlrm7tOxVnzUF
	xAVeQsAu8XJODM+/202CEtH/s9fuhej707Feq3PgIOrKy95ItEywnj87FG6aOpwZ
	WmRrMe4U3qzlyE3CBE4SI4fDFFYoXPVW+X1y3v1sUlKoBCtbP0gPoihZK4CMso0x
	pW2bEcZetZHZa5qSL+vn7CsebQvJb8Om3/WwAemPMaVu0I2lSXcfzk7mB7GzFWBf
	kzh0Xc4WfDXNY/KY7oZrTk9MPIwb0+uFJDJ4/CImKVhvb52m+BXtntV1XmFYxnnD
	b2KGedLynDpCVgge1779V5iKs2dlBQEa1eFyfzYKMvsnazCpkTK7J8Yc96Lh3Ldg
	==
X-ME-Sender: <xms:MQecYOYfrnDLiz0a6DDfBFZbm1tviQLOeDza3YMe0wpMkL25P-VKvg>
    <xme:MQecYBZVyo77YpWoipLn1APqz_PaJNNRpZKM3XECzYVFwvBPsqFLa-KOcez5Z_30E
    j32TmwSbkLXsiirXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehvddguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujghosehttdertddttddvnecuhfhrohhmpeforghr
    khcuifhrvggvrhcuoehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomheqnecugg
    ftrfgrthhtvghrnhepudejleegjeelgeelveekkedvveduhfetueeitdelhedtudelledv
    ieffhfdvhedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepjedtrdduje
    dvrdefvddrvddukeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomh
X-ME-Proxy: <xmx:MQecYI9WQBAtvhRJHUtT_07hb5slooMvk9S9KfwkBi_jQNobxA9rvw>
    <xmx:MQecYArB4Mun0qt-KAOgwKo9w7Dn1ulqUlfBmNan7amrSqo0JhZeOg>
    <xmx:MQecYJrxnJkQiBC_1fnUOC0dfvJJImyMlqcXzuV8jST8E756ChFWxA>
    <xmx:MgecYKkw73FAAko-V6zsw6Ohoqj7w3ndO6R1LVD_rJPRwUwI4mzhOA>
Received: from blue.animalcreek.com (ip70-172-32-218.ph.ph.cox.net [70.172.32.218])
	by mail.messagingengine.com (Postfix) with ESMTPA;
	Wed, 12 May 2021 12:49:53 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 98144136008B; Wed, 12 May 2021 09:49:52 -0700 (MST)
Date: Wed, 12 May 2021 09:49:52 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20210512164952.GA222094@animalcreek.com>
References: <20210512144319.30852-1-krzysztof.kozlowski@canonical.com>
 <961dc9c5-0eb0-586c-5e70-b21ca2f8e6f3@linaro.org>
 <d498c949-3b1e-edaa-81ed-60573cfb6ee9@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d498c949-3b1e-edaa-81ed-60573cfb6ee9@canonical.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: NIONVZPUGWZJLTDWODBWDNN5YHNPGATT
X-Message-ID-Hash: NIONVZPUGWZJLTDWODBWDNN5YHNPGATT
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 1/2] MAINTAINERS: nfc: add Krzysztof Kozlowski as maintainer
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/NIONVZPUGWZJLTDWODBWDNN5YHNPGATT/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 12, 2021 at 11:43:13AM -0400, Krzysztof Kozlowski wrote:
> On 12/05/2021 11:11, Daniel Lezcano wrote:
> > On 12/05/2021 16:43, Krzysztof Kozlowski wrote:
> >> The NFC subsystem is orphaned.  I am happy to spend some cycles to
> >> review the patches, send pull requests and in general keep the NFC
> >> subsystem running.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> >>
> >> ---
> >>
> >> I admit I don't have big experience in NFC part but this will be nice
> >> opportunity to learn something new. 
> > 
> > NFC has been lost in the limbos since a while. Good to see someone
> > volunteering to take care of it.
> > 
> > May I suggest to create a simple nfc reading program in the 'tools'
> > directory (could be a training exercise ;)
> > 
> 
> Noted, thanks. I also need to get a simple hardware dongle for this....

Krzysztof, the NFC portion of the kernel has a counterpart in userspace
called neard.  I'm supposed to be maintaining it but I have next to no
time to do so.  If you have spare cycles, any help would be appreciated.

Anyway, in neard, there are some simple test scripts (python2 - I/we need
to update to python3).  The current home of neard is:

git://git.kernel.org/pub/scm/network/nfc/neard.git

Mark
--
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
