Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F00C546A288
	for <lists+linux-nfc@lfdr.de>; Mon,  6 Dec 2021 18:11:49 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id A8095100F3FC8;
	Mon,  6 Dec 2021 09:11:48 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 81B9B100F3FC7
	for <linux-nfc@lists.01.org>; Mon,  6 Dec 2021 09:11:31 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id F15985C0054;
	Mon,  6 Dec 2021 12:11:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 06 Dec 2021 12:11:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=yd0Ra5hzA5yPdADjlNZpXMmcP8W
	xtuSNq1yVchawN6g=; b=cyV4Oa9xt4jK8kiyQT4ySbm5bta7s0RaNFctJbZF0FH
	AEEK+DCDnw6hADUqPXhzuIcgr21+WuaicRve5jiSiqlHa5Gfb1kU/OIq3s1MczTZ
	QTy4D134otA26LZEVL8DXfeN/jk+286VrlBdlaHzdv7/OEMBSVSe/avLnVrQve/y
	5fobTklFRx0vXiQSbjoK/Bz2wSyYBDMiJDkSjyPB8W6WXM4vvgF4fYwtyKA3MFlU
	87Xdj8HtCFObYF9Qxlt/YL6G9uKRtQ8YeQtbhz1qHgUS+x/MUB6fcn2RCNU1PTzY
	LhgmbAGgFUr+znTHrtanNbLOZH4m3pq0a1AGOMpr2qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=yd0Ra5
	hzA5yPdADjlNZpXMmcP8WxtuSNq1yVchawN6g=; b=Mpe/EQG8/rED3fTkSd2z2v
	WtDE2tsTUb4PM/Aji406zKwrnFjAHJ4LZ9IeOW8pqYKoSMmETSzTDPbBC1Iftxdj
	UNsic1R5H2qqq77nxWlZYA0we0uuKf7MWfdlmXQfTmy8+fVYyYNBX8eG26tcmA51
	h78URCbc6JiH0ewn6dOKV3YHC91HzxOK0yISftqtpXgf42xiXg0vCC6a0DumHqns
	9AruKX3lzZmQDThxMN0MpG9N4N1IrfddnrNf6fVXuPWjBU5RLavlWPIZgn7vdw44
	pRIgP9zUaPZW45rkAJzUX7wRevL5YOLeLHGLXPaddZClG8i9Gunk3qasAtcC6Tsw
	==
X-ME-Sender: <xms:QkSuYZiDv50bE7mZt4AIzPZMKQiliS1aTnohppcEs3snXL8yO-cYBw>
    <xme:QkSuYeCz26KKuqyGV7_qPuobEr5OLN-uOrj4bB17qTyGPvdeR2JAThkjdII1Yfap9
    o7r1DKwjKQj9k1J7g>
X-ME-Received: <xmr:QkSuYZEuB8WF4oRlUtinthvwy6TVD22OHJLmK7sYvtKuCTPFYLds4mzUBmbwvo0dLUrlSSt3_kTAzkA0PdENV4Q81VM7XzphvCTSOIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrjeefgdelkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujghosehttdertddttddvnecuhfhrohhmpeforghrkhcu
    ifhrvggvrhcuoehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomheqnecuggftrf
    grthhtvghrnhepfeeuvdejleeijeekueehgfdtlefggfdvgfduuefhhffhgfejiedvveeu
    leffheeknecuffhomhgrihhnpehphihthhhonhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmghhrvggvrhesrghnihhmrghltghr
    vggvkhdrtghomh
X-ME-Proxy: <xmx:QkSuYeSFdEjGVT25QNDo5qsd6K_zn576i7KdMyNR5Gmao_F2-VgxOA>
    <xmx:QkSuYWyeW-zWXsmzFa60lzgijbSt8hFEMdrLU4XunfZglm4sCHOncg>
    <xmx:QkSuYU4YzicupqStm7E5KQ6VV2a-9cq7TBnA7SfaTf88N5O0YdwdlA>
    <xmx:QkSuYbrpeMeLHT3TZUcUdqtKQXWD9UjbLbDkME7ZtYZ1VtjVg9aeVw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Dec 2021 12:11:30 -0500 (EST)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id F1DDC136006C; Mon,  6 Dec 2021 10:11:29 -0700 (MST)
Date: Mon, 6 Dec 2021 10:11:29 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20211206171129.GB234718@animalcreek.com>
References: <20211129050606.873494-1-mgreer@animalcreek.com>
 <20211129050606.873494-5-mgreer@animalcreek.com>
 <77e68d99-b96a-2616-5933-00f6b4affa28@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <77e68d99-b96a-2616-5933-00f6b4affa28@canonical.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: 2RUTTH6IAWYWOEGRJN6GRRTHSSYSWMH7
X-Message-ID-Hash: 2RUTTH6IAWYWOEGRJN6GRRTHSSYSWMH7
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2 4/6] se: Use spaces only for SE Python test scripts
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/2RUTTH6IAWYWOEGRJN6GRRTHSSYSWMH7/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 01, 2021 at 10:15:05AM +0100, Krzysztof Kozlowski wrote:
> On 29/11/2021 06:06, Mark Greer wrote:
> > The Python PEP 8 style guide prefers spaces over tabs so replace all
> > tabs in the SE Python test scripts with spaces. See:
> > 
> > 	https://www.python.org/dev/peps/pep-0008/#tabs-or-spaces
> > 
> > Signed-off-by: Mark Greer <mgreer@animalcreek.com>
> > ---
> >  se/test/test-channel |  84 ++++++++++----------
> >  se/test/test-seel    | 178 +++++++++++++++++++++----------------------
> >  2 files changed, 131 insertions(+), 131 deletions(-)
> > 
> The same as in patch #1 - since you are touching all the lines and
> changing indentation, no point in having two steps fixing indentation,
> so make it 4-spaces.

OK
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
