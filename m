Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CC23CBAF9
	for <lists+linux-nfc@lfdr.de>; Fri, 16 Jul 2021 19:15:22 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 76B22100EB82B;
	Fri, 16 Jul 2021 10:15:19 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 6B952100EBB7D
	for <linux-nfc@lists.01.org>; Fri, 16 Jul 2021 10:15:16 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 4CE395C01C7;
	Fri, 16 Jul 2021 13:15:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 16 Jul 2021 13:15:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=kWStHtJuieFDMP3C0uGuJICDPp2
	nT+wHAmUx9wb1elo=; b=ZWcY+qB17vsUOopNx3oYtX1UR/QChXvSQpvH4kRtB5x
	LBDzwH/LDPQOCQsKN2o1E+X/3DAfaihhwqfEqD5P70wekR75dDRrEsshWaZtpkbE
	IJKzDHPZbmSTvGNL0h7kalUYHpfWPL14w4yMCfkHOL9a5ri4C4BcpNnjD21/ewlM
	bpYlNIjzVS3MNt48c9xvUiWJadoFhJNMDSvs5dnJqYqd1f8phznzwSlytXfX1cQH
	8JC9NokWginicBkeT1vS/ID0IHitBTPyUq//XOLVH4xAzLDfzArWl3Fl4Q0cebmu
	5uphDeHcYIS4MlTDv5+OWCC7uMQ5/KDHH7RITQ8mb9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=kWStHt
	JuieFDMP3C0uGuJICDPp2nT+wHAmUx9wb1elo=; b=wfy1DzrkZFvQKyesGCtdfg
	z4O9o6jibhX2McEHjXW4uZz1cOKpiBOYAWZ6VMRZG2KTRHHbjgNd5T5ZJJqxARsE
	kjV39ighU2SBH2BBl2eSYNfrHWSjfKvBBa5s5iA8FhbmuYzcRdtYMyt8A9usSecV
	u2GRfhQmFAL8YvIGLyw6jaJULrY3/FtogYh1nm987UZXayAcG4yGa1HCrTyersqL
	yEQi8Whx8JU1HNB5C0hknEpQIcAKpTooHh+kknftEfFCjyx4XVv48DJWyqXRTVQ2
	0RRIPPJwr1dRU4gEchnB0d9nQRQOxVJYxaDMjBUTf21thSiPgNUoFuTOY/HA4PIw
	==
X-ME-Sender: <xms:or7xYIz6LfqwuPpUTe8eT0y7sK4BBkC_p0eP1GO0dY40XMAikhHKRw>
    <xme:or7xYMSRs31oUGrZSE9FEUZx5RlhKN1KlPC9IMezdac_tGsQ1PTWgb761PaLqpsiJ
    CNFgw670oWvdpGQqQ>
X-ME-Received: <xmr:or7xYKWAeyqtpw4Cs3DW0xt8zVuVc_2QXD6meEk1nBHsH7d01pUuWzwdAWie31jCX70fn2GwH46wSG8mU4a-0cDWmBZ_go6Jeby3zYU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefgddutdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjohesthdtredttddtvdenucfhrhhomhepofgrrhhk
    ucfirhgvvghruceomhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhmqeenucggtf
    frrghtthgvrhhnpedujeelgeejleegleevkeekvdevudfhteeuiedtleehtdduleelvdei
    fffhvdehtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhgrhgvvghrsegrnhhimhgrlhgt
    rhgvvghkrdgtohhm
X-ME-Proxy: <xmx:or7xYGhwKf9JNPjUq4ay6T3bwQL5TC4KZqZ2G5kV97DmbIOjWrfDew>
    <xmx:or7xYKAQxuumuSwpL36uO5koCdd_qCjQnh8JT1XHQt9s3r7A0zIx_g>
    <xmx:or7xYHJwq-pnUV42Dusdy3lPPno1fDsm-uyEmpSz4HGkq7UtNkl8aw>
    <xmx:o77xYB51mtLtLqljpausa3ssCOhpoadg3mmRbMRLhjpLweSPsS0WyA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Jul 2021 13:15:14 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 3BBE11360093; Fri, 16 Jul 2021 10:15:13 -0700 (MST)
Date: Fri, 16 Jul 2021 10:15:13 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20210716171513.GB590407@animalcreek.com>
References: <20210512144319.30852-1-krzysztof.kozlowski@canonical.com>
 <961dc9c5-0eb0-586c-5e70-b21ca2f8e6f3@linaro.org>
 <d498c949-3b1e-edaa-81ed-60573cfb6ee9@canonical.com>
 <20210512164952.GA222094@animalcreek.com>
 <df2ec154-79fa-af7b-d337-913ed4a0692e@canonical.com>
 <20210715183413.GB525255@animalcreek.com>
 <d996605f-020c-95c9-6ab4-cfb101cb3802@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d996605f-020c-95c9-6ab4-cfb101cb3802@canonical.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: OP4C7JGHL4S4H6VFOELUJBOU4ATXN3BM
X-Message-ID-Hash: OP4C7JGHL4S4H6VFOELUJBOU4ATXN3BM
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 1/2] MAINTAINERS: nfc: add Krzysztof Kozlowski as maintainer
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/OP4C7JGHL4S4H6VFOELUJBOU4ATXN3BM/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 16, 2021 at 12:17:43PM +0200, Krzysztof Kozlowski wrote:
> On 15/07/2021 20:34, Mark Greer wrote:
> > On Fri, Jul 09, 2021 at 11:24:41AM +0200, Krzysztof Kozlowski wrote:
> >> On 12/05/2021 18:49, Mark Greer wrote:

> For the kernel.org I think you need an account @kernel.org (which itself
> requires your key to be signed by someone), but I am not sure.

Yeah, I just ran into this yesterday.  You need a key signed by at least
two people who already have k.o accounts.  With that, and your name
in the MAINTAINERS file, you can get an acct pretty quickly.  I need to
set that up and get some signatures.  That will take a while for me.

> I am happy to move entire development to github and keep kernel.org only
> for releases till some distro packages notice the change. If Github,
> then your linux-nfc looks indeed nicer.

Okay, lets do that.  I'm the owner so I can give permissions to whoever
needs them (e.g., you :).

> > I will review your patch sets but the earliest I will get to them will
> > be Sunday.
> 
> I just sent one more set :)

Awesome, thanks.

Mark
--
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
