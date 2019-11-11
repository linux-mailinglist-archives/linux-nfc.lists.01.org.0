Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 213AFF6D99
	for <lists+linux-nfc@lfdr.de>; Mon, 11 Nov 2019 05:37:40 +0100 (CET)
Received: from new-ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 021BD100EA521;
	Sun, 10 Nov 2019 20:39:36 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 2475A100EA605
	for <linux-nfc@lists.01.org>; Sun, 10 Nov 2019 20:39:34 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 7F930205DD;
	Sun, 10 Nov 2019 23:37:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sun, 10 Nov 2019 23:37:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=O+S/avd+6exbLR/3Rw2MLAFbplP
	kQPtibFV+XxqyUSQ=; b=L8FpdC6yYtrmLWfXKX03ok4i6guIxAScfpdts5cquSA
	MRpp16auqu5cLMGWiL4jVEYbcjunIlpCMCXndWwj1laxqNc497CFvymETIZRaqP9
	fJtX7I9L/1eeyarXjpE4jPd4owFxv7QDH8EqX6i/RPDa3Rr/D1s3KY17L/eRm79q
	vt2MAcDGA5nmnk/fuQy/+jRZtXAhQNRZdC2vvNZqTqIsBkuu1tE9uYm5qAKxagR6
	YHgXpRIH9QlQ+6lvr+NBVF4pkq95NJDvRT+Fc789tmhud1ewEjkQNaTC8FO7GcQw
	UKEPXvCF6HEppvzBLEp6eY7Xo5ayeA13Ktrdv3FcVaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=O+S/av
	d+6exbLR/3Rw2MLAFbplPkQPtibFV+XxqyUSQ=; b=vM/HIODb8UpxBrir5vRUC/
	VVV3SQuV5r0oBsLi9KPpSuDz2zp9L42Mk8V7lJ6gsirFyxE7RLD6sP0q1s9TWBgt
	yoxQIIuW6Lvgze/QBQ+JWT7GAXD5CsYq1+Cu9vA0BERdofUblmfzoA+gdV8pK4B4
	jv9jrqlogelAmgISDJV+bQuolJkbhBO9tCmCeCjNHsnQESv7ba41jZ5A1UUW5Fpg
	HUwMQSpTPHYyIB2hYMg6gSH6HWibCIe8I2wR6uao7TGD8gMZTzYwsqaPR16W62KU
	VqkYAE4jzWmS6DsLJ0NEUHU5osLhF2xOGJpnmIKqx9YDWnY45TgqRewfww9hjLXw
	==
X-ME-Sender: <xms:juXIXfXQuZzZEz3gMM8YlnrmXqbuniGiiADLx0v6MpNci8vqUC6vCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddviedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjohgfsehttdertddtredvnecuhfhrohhmpeforghr
    khcuifhrvggvrhcuoehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomheqnecukf
    hppeeikedrvddrkedvrddujedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmghhrvggv
    rhesrghnihhmrghltghrvggvkhdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:j-XIXfwq76Db7qLBuawlkQJRejHhtG8vQo2pFAzrQn335dTezLH3bg>
    <xmx:j-XIXTdhaHGCrg7mX_YaIX6RN7jsLugs1HfCVFfdO0QjC9m_5u7tpA>
    <xmx:j-XIXQc1TWZE_Vo1mQHQRct6kVyIOpUQ2rswEMF0iIoFfgbk0V4QAw>
    <xmx:j-XIXZLdfMYZ3FANjEOxzpkXSXcA4Ko1mlDlu5e-sCWfiDCDf2byjA>
Received: from blue.animalcreek.com (ip68-2-82-171.ph.ph.cox.net [68.2.82.171])
	by mail.messagingengine.com (Postfix) with ESMTPA id ADDDF8005B;
	Sun, 10 Nov 2019 23:37:34 -0500 (EST)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id C07B6A21D7C; Sun, 10 Nov 2019 21:37:33 -0700 (MST)
Date: Sun, 10 Nov 2019 21:37:33 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Message-ID: <20191111043733.GB2789@animalcreek.com>
References: <CAPybu_2=rY5g0MNNoztBZQQhbteXxgG7RdrgQAWT6HkaKvp8sA@mail.gmail.com>
 <20180918061952.14335-1-ricardo.ribalda@gmail.com>
 <20180930233513.GA16410@animalcreek.com>
 <CAPybu_297JGrQ1WtG7D277MnhVMboYHSTV_KBNCsjA6uJab4RA@mail.gmail.com>
 <20191108040813.GA19844@animalcreek.com>
 <20191108090501.GA278603@caravaggio>
 <20191109203830.GA31348@animalcreek.com>
 <CAPybu_2+p6vzPnmD05jBksRdAH8sYwPYeojU_FrmCOmY_dN=kg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPybu_2+p6vzPnmD05jBksRdAH8sYwPYeojU_FrmCOmY_dN=kg@mail.gmail.com>
Organization: Animal Creek Technologies, Inc.
User-Agent: Mutt/1.5.24 (2015-08-30)
Message-ID-Hash: FAREDOKJ6C4Q27QPPO2U4O6GNRX2MXXQ
X-Message-ID-Hash: FAREDOKJ6C4Q27QPPO2U4O6GNRX2MXXQ
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2] ndef: Only register interface for known records
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/FAREDOKJ6C4Q27QPPO2U4O6GNRX2MXXQ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> On Sat, Nov 9, 2019 at 9:38 PM Mark Greer <mgreer@animalcreek.com> wrote:
> > On Fri, Nov 08, 2019 at 10:05:01AM +0100, Samuel Ortiz wrote:
> > > What about moving the neard repo to github and have you or Ricardo (or
> > > both) maintain it from there?
> >
> > I'm okay with that but I am really busy these days.  I'll do what I
> > can but I know I won't be very prompt.  Ricardo, can you help me with
> > that?

On Sun, Nov 10, 2019 at 05:37:29PM +0100, Ricardo Ribalda Delgado wrote:
> Unfortunately I cannot contribute much. I am not using neard everyday,
> it is not my area of expertise and I just got a baby #2, so not much
> time left for hacking :).

Darn :(   (but congrats on the new baby)

I'm not working with it everyday either but as long as people are patient,
I'll do what I can.

I'll shake off the neard cobwebs and send an email with more info in the
next few weeks.

Mark
--
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
