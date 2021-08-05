Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AFC3E1947
	for <lists+linux-nfc@lfdr.de>; Thu,  5 Aug 2021 18:14:33 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 21E62100EBBD7;
	Thu,  5 Aug 2021 09:14:28 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id D4E82100EBBC4
	for <linux-nfc@lists.01.org>; Thu,  5 Aug 2021 09:14:26 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id E1A865C012A;
	Thu,  5 Aug 2021 12:14:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 05 Aug 2021 12:14:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=dUQ4BK3OXzNzO0UIMgVfu5lznE4
	fZzYyP93938I/YxM=; b=bXTq1fqD4w6QphKGXUwMMV5XFA82ht+Qycuu1I2PMQO
	UPd3zq8LiTeSPr6qXFc0wcpqZOwkQPn+7pG9SieWio3PrfGExfKzcNgMJrbOQ8cT
	0sCbfPsp9sILBR8KcmWOLYPE93PB+Dw+hC5GaJkjbt3vgZJgAfEY3AWJ9DYVe5gR
	jDJyafflozgzwhSDExrz402xGdoxQb9p79KGS+/1BWnOHmavQNhHkE4Q/nx3bL9O
	njomGezJ419Er+SVLsFmL4MYUWvxd9muHLjelAusEXhuO2U100/ccKiejha3i8af
	6uU1EZdvCX1TDV6IkdSbkuvIEVXU239ZCb+Jihk80xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=dUQ4BK
	3OXzNzO0UIMgVfu5lznE4fZzYyP93938I/YxM=; b=nshUBUt2wMDTaJWssnZ9Kn
	Hne3/ZInbOk5Y9HZ+K7kM3kGDw+hQ+a5SCi0W+28NmSdiWCm86cVgKZiUpH9AXUH
	SMN4Gc+W5+EAewsBgjLJn5yZIMrMqlrWtlZr1WpyN39YyM+XgBlJyN1l440J2DJ3
	P4cUfd3KzLWvW52nvqjXp3oDQZ2Ci82+mhstVxCc6nMsuLXJ+bXu77Nt0tcPPubc
	TEQgNwMEA17/iTkfTbG2y1FZqdofEs5no19hKRjPvkx7VWU85l3knc4X/XL/9rFr
	bHOmDXE7zor7XsATTedHw7qqSeKTpH9ZFSXtPklSbF8e0y4VcbQbrqNWx55LWA0Q
	==
X-ME-Sender: <xms:YQ4MYZ_ynKC3C6xe4iBeROZxXSPV4YRG6Lqd-0uo5XGuffFzBdphVg>
    <xme:YQ4MYdtDWDmIK8aS-e6d4f7CauYlz7-RarxZRlu7DpnPNRSe5Bbqt3zF_x4-hC_3j
    xAOPZDVgPc3GlzW9w>
X-ME-Received: <xmr:YQ4MYXD-zya7W33BNg2TnCOr_iCRjDsCSkoPBfPC5kL_9LUoOu0y9tltW9DVTl9kt-qIf3c_FhVP-29_KjnD-hBzaLb5H6DWGH1S5mk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieelgdeliecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujghosehttdertddttddvnecuhfhrohhmpeforghrkhcu
    ifhrvggvrhcuoehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomheqnecuggftrf
    grthhtvghrnhepieeugfdutdefiedtvdfftedufedvjeehgfevveefudfgjeffgeeiteet
    jedufffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhm
X-ME-Proxy: <xmx:YQ4MYddhS1nHOX1wfmXUhB2YT3BZVc3tAxwn_NrjQpOZFdmE4ozHxQ>
    <xmx:YQ4MYeOWd5_8ykSvuiyfMVpTqOqmyVl18DkoovIkt0H3_M--zBl3ug>
    <xmx:YQ4MYfnMpct2J6mpNhml899QdVfYPILKKDSmS9JB-2PKf4ZCKMA_-A>
    <xmx:YQ4MYQ0x5hygotPrdsfdFlesKNCXpUK0hZbNQLWjo5HQemSb3r5tSw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Aug 2021 12:14:25 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 90CD11360E11; Thu,  5 Aug 2021 09:14:24 -0700 (MST)
Date: Thu, 5 Aug 2021 09:14:24 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20210805161424.GA556298@animalcreek.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
 <20210801231140.GA397941@animalcreek.com>
 <47b15b65-61cc-9cec-ca6c-c9a6d84ff7d5@canonical.com>
 <CA+Eumj6wuufroVja4PMk+NbmQm57AZEYhtECXZJRH-j08UtJng@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+Eumj6wuufroVja4PMk+NbmQm57AZEYhtECXZJRH-j08UtJng@mail.gmail.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: JOLC6PCQCS3ASZDCJWWYHSY75AXAGI33
X-Message-ID-Hash: JOLC6PCQCS3ASZDCJWWYHSY75AXAGI33
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [neard][PATCH v2 00/73] combined fixes - warnings, memory leaks, memory corruption
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/JOLC6PCQCS3ASZDCJWWYHSY75AXAGI33/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 04, 2021 at 09:56:00AM +0200, Krzysztof Kozlowski wrote:
> On Mon, 2 Aug 2021 at 09:51, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
> > > FYI, I built neard natively with these patches applied on an amd64
> > > (ubuntu 20.04) and an ARM Cortext A8 (debian 10).  Both build cleanly
> > > and I could read & write tags.
> > >
> > > My plans include:
> > > - python3-ize the python test scripts
> 
> I checked now Ubuntu/Debian packages and dependency on Python2 was
> reason of removal of neard from their package repository.
> Convertinging these to Python3 would allow bring it back, so it's
> quite useful task.

Good to know.  Thanks for checking.

Mark
--
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
