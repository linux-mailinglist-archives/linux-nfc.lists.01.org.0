Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D9E3D3463
	for <lists+linux-nfc@lfdr.de>; Fri, 23 Jul 2021 08:03:36 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 1CC30100EBB97;
	Thu, 22 Jul 2021 23:03:34 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 09C14100EBB92
	for <linux-nfc@lists.01.org>; Thu, 22 Jul 2021 23:03:31 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 99A27320090C;
	Fri, 23 Jul 2021 02:03:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 23 Jul 2021 02:03:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=/+INcXZ7oSeDPQmZYnxKbv44fUk
	KVvZYkm8l0g2UoGs=; b=qTwZlioyyMLKJBhY3kd7IVwqiadwqdm8Ps57Y6o5uvS
	9atUUF/98u9kzL3ureFyStBK4+J9UNQsuDyOYTSikBojOgIKwfX2UwyzKBUkwIek
	2XkH5yOlW8IY+IyrXgCPIzOn+cLs+fVnX2/KYeZJwtRR6EEizoDFpGaF97JEVXxN
	GvxKvo4zasaLm4NQgUs1mVWuL3ZRkv7aYJAD3YLKC7OcPjfbrVy6+3FhSTGzU8PW
	rjid3fW8wJ3hHEahFVGjHikAWHkZvyXuZ9vSVCCcbXNUpyQuxGEZBMRhWG9qs6kq
	CcYoucT96n4Fl+irwvLUPFNcMMfZ+cyOWOHXqZyOiMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/+INcX
	Z7oSeDPQmZYnxKbv44fUkKVvZYkm8l0g2UoGs=; b=ECJhh3s/vhSfwsHN5Uemgu
	US9SpuIXA1EeWQEPR33mFYt8QRA06rMhcqTKjwE31idQed/Ovv4vTN9wlK2pBfZF
	WRuAC3pUZ8ohNhHP8P4mBdSTQ1SbpddA4oOoK+oMqYhkUYK4abAUZD2vjBoICCrE
	hwUmvBq75ilUG2OG3Ob5/eY0R9vAxKc2DUt9J0jzQTf7m6Lydp+hMoVHpy6Jr5dj
	T1mL4GlmCsYDnN3Qc3sir1VYQ98ls1CRQTqgcPZWxc2mR3MJaYvMXszVXNS0AW7K
	L9fPf+ulf4bG640KASVCQplnLGWwQbjvbM+migaCGulabSRAIeSB7fL9y6kdRdMA
	==
X-ME-Sender: <xms:sVv6YAeJ7zehgqB7kXAun9eVPn5Gz4fTTBUFYbrW58Mz1YEiSCWC9w>
    <xme:sVv6YCO-g7Ltx_mRz5fQJyuIf_NgA6iL-5g4ZO4s_16uEpxaAdxyhGXk6ncgrKDha
    EDzfHejisS2PSNlvg>
X-ME-Received: <xmr:sVv6YBi_j_h8A9WetMe0siyBUf0lEkqEUPosjR9IEVZ29Q8MKPQI2A6NFStMGXcLSl8UcOb8O4ai8m0VJrlFoB6CbKDuoz-TodKPW6o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeejgdelkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjohesthdtre
    dttddtvdenucfhrhhomhepofgrrhhkucfirhgvvghruceomhhgrhgvvghrsegrnhhimhgr
    lhgtrhgvvghkrdgtohhmqeenucggtffrrghtthgvrhhnpeeivdetheefhffhleejgffghe
    ettedtfeevfedvuedvieduieekhfdukeeiiedujeenucffohhmrghinhepmhhikhhrohgv
    rdgtohhmpdhtihdrtghomhdpghhothhothgrghhsrdgtohhmnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhgrhgvvghrsegrnhhimhgrlhgt
    rhgvvghkrdgtohhm
X-ME-Proxy: <xmx:sVv6YF9Z5zmIOqe-34kE3ZHs7L_NRxwzFe7GFp-Iik1bEqDf8jSTyQ>
    <xmx:sVv6YMsrpIML7_rjE90NAXgLL4NiI0J2ujblOhxP8Td6bSFLZBhynw>
    <xmx:sVv6YMGjSXaiIGknogLxapDzOFtfTtdeQM2P0yE7_l6DYbg_DYV4NA>
    <xmx:slv6YC2n_ACafEqDLgWSNXex2j7XBvmqyv6inQJwlQItmjiGp504cw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jul 2021 02:03:29 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 453D113600A8; Thu, 22 Jul 2021 23:03:28 -0700 (MST)
Date: Thu, 22 Jul 2021 23:03:28 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Vincas Dargis <vindrg@gmail.com>
Message-ID: <20210723060328.GA1042603@animalcreek.com>
References: <CAPNCXk0qkc-5myby0TdzD=6kBXSd_o_iNGy6jjjO5YXeyZqceg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPNCXk0qkc-5myby0TdzD=6kBXSd_o_iNGy6jjjO5YXeyZqceg@mail.gmail.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: KQYRNUFHB33WO6OHEFSXXN6RJMLCEUUO
X-Message-ID-Hash: KQYRNUFHB33WO6OHEFSXXN6RJMLCEUUO
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: About NFC Tag emulation on Linux
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/KQYRNUFHB33WO6OHEFSXXN6RJMLCEUUO/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 22, 2021 at 01:59:17PM +0300, Vincas Dargis wrote:
> Hi list,

Hi Vincas.

> I see there's "test-device", "test-tag" helpers in neard-tools package
> in Debian, but it looks like it needs actual devices/tags to test
> with..?
> 
> Is there a way to emulate NFC tag, to "emit" NFC tag discovery events
> and NDEF mesages on Linux? Qt supports NFC on Linux via neard daemon,
> so I thought it would be very useful to emulate NFC tags (with various
> payloads) for development and (automated even?) testing.

I won't repeat [much of] what others have said but I can add this:


A: Try nfcsim

Already mentioned in this thread.

B: Use real hardware

B.1: Reader/Writers

PN533 dongles are fairly inexpensive (e.g.,
https://www.mikroe.com/nfc-usb-dongle) but most other are > $50 USD
so they are a little expensive.

B.2: Tags

B.2.i: Use a dynamic tag

That is a fancy term for a programmable device that looks like a "dumb"
NFC tag from the reader/writer side but you can control it (including
the data that is read by the reader) from the other side.  NXP, ST,
and TI all have (or did have) versions.  There may be others.  These
will almost certainly require a programming effort on your part.  If
you chose the TI rf430cl33x, I may be able to help
(e.g., https://www.ti.com/tool/DLP-RF430BP).

B.2.ii: Buy some "dumb" tags

They're cheap so buy a few (e.g., https://store.gototags.com/nfc-tags).
Try different tags types.  Types 2, 3, 4A, 4B, and 5 all work.
In theory type 1 tags work too but I have no way to test them so I
cannot say for sure.

Mark
--
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
