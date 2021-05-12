Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A12E37C2BE
	for <lists+linux-nfc@lfdr.de>; Wed, 12 May 2021 17:14:57 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 63BA7100EBB6B;
	Wed, 12 May 2021 08:14:55 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 12223100EBB6A
	for <linux-nfc@lists.01.org>; Wed, 12 May 2021 08:14:54 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 1D7755C0089;
	Wed, 12 May 2021 11:14:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 12 May 2021 11:14:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=fm2; bh=v
	dMf60Saph/emOVT1xf9TpZDrVMBXzuMGESNTJ768bY=; b=gpIGKjyipdtfL41WC
	ANR5rzw167MdJR0gkbDk8dXS5XUuVynL1BoAnTNxDvEMvgU6dMlsQE9vm+a/MArT
	vUidNnTEqQzL5JexovNFcRzSryEdoMzWxwSyORqpDNrTHMIE4us0kjJPlddkyDuu
	r5SNDMIUP8hJWYsegkD0i3ilUjIABbiUFLMbz6xJgEwLv87/EB3eearBpqpKfwdH
	kEdBM1EW7AoUelefTLdXNbznFYysK2CeaiKTkBhawUF+/OHFrXa1dOdOes6TXG2h
	CBPMUbpJesrt8CfsA8KXy31upeQU56cJ/Vgjj7NATMOAhXkjNo48xXCLCnXT5qZ6
	/z4gA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=vdMf60Saph/emOVT1xf9TpZDrVMBXzuMGESNTJ768
	bY=; b=qLPnk0juzOmjqFqGknKoMmqY4zPHOnpFX9Oh//ml5d190WematB2595oI
	K2YSbWeS7FklkxX1fBBhrNOi9gGJ+A2UmKI48OyQHSRKljH13XH2+hUdo7e1iJDs
	S77GFH7ENL8Y58FJ4LvoXKFJnYx2dSS+6+Y43LsFuuNWxnywUVKmzOHF9pFVls0Q
	glXLqQlM67wc8aO6zRPTWiLmvyV3UXZKcDmDYbip0phHPzSaurDTCOHI/9ZdlABX
	/t82MFDrrDYifvSjR7JzTV+SHT3KPD3GxgmC3lOrCmUKxlsqfs8WoF/SOZpBtV7t
	aolVzQdJuhv7v7F+EThLQFO8uteMw==
X-ME-Sender: <xms:6_CbYJBR2UNejqJmf-v73t7IL8qo-cFx9ZoxpHBDdYEgfc-0rgbT_g>
    <xme:6_CbYHg2hXshWn-URE8KnejoHl11OmYMbn_oXsSfz6YbEGZ8d8UTTy9s4LFoGHAjj
    5PxLfpN60Mb8fC8Mg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehvddgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtugfgjghosehtkeertddttddunecuhfhrohhmpeforghr
    khcuifhrvggvrhcuoehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomheqnecugg
    ftrfgrthhtvghrnheptedtfefhhffghfehheeikedvteehueetkeeitdejudffudeuudfh
    leevudejffetnecukfhppeejtddrudejvddrfedvrddvudeknecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhgrhgvvghrsegrnhhimhgrlhgt
    rhgvvghkrdgtohhm
X-ME-Proxy: <xmx:6_CbYElZqISeeZ5VbyMfTOxy2oR_hyq5JK2PG5M2RDssYe_NtURbbQ>
    <xmx:6_CbYDwGFZ6_SPx6-BNo_4UbVPwNvsjZ0MBMHNWUqH5BpHNhUWtt2Q>
    <xmx:6_CbYORTITbKTgUcWax8RqHdL30wuXl2c9qBgYbRx-uFJ2fGE57FvQ>
    <xmx:7fCbYNE6fo1XnFX5X_6muhpcMok7dtpitrp2qrw6V9yHpUqk-iW4Aw>
Received: from blue.animalcreek.com (ip70-172-32-218.ph.ph.cox.net [70.172.32.218])
	by mail.messagingengine.com (Postfix) with ESMTPA;
	Wed, 12 May 2021 11:14:51 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 9DD90136008B; Wed, 12 May 2021 08:14:50 -0700 (MST)
Date: Wed, 12 May 2021 08:14:50 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20210512151450.GA215713@animalcreek.com>
References: <20210512140046.25350-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210512140046.25350-1-krzysztof.kozlowski@canonical.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: ZTOOXCGONMWEJCR25DDT653X2Q45WGFT
X-Message-ID-Hash: ZTOOXCGONMWEJCR25DDT653X2Q45WGFT
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Charles Gorand <charles.gorand@effinnov.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Frieder Schrempf <frieder.schrempf@kontron.de>, linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc]  Re: [PATCH] =?iso-8859-1?q?MAINTAINERS=3A_nfc=3A_drop_Cl=E9ment?= Perrochaud from NXP-NCI
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ZTOOXCGONMWEJCR25DDT653X2Q45WGFT/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 10:00:46AM -0400, Krzysztof Kozlowski wrote:
> Emails to Cl=E9ment Perrochaud bounce with permanent error "user does not
> exist", so remove Cl=E9ment Perrochaud from NXP-NCI driver maintainers
> entry.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index efeaebe1bcae..cc81667e8bab 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13208,7 +13208,6 @@ F:	Documentation/devicetree/bindings/sound/tfa987=
9.txt
>  F:	sound/soc/codecs/tfa9879*
> =20
>  NXP-NCI NFC DRIVER
> -M:	Cl=E9ment Perrochaud <clement.perrochaud@effinnov.com>
>  R:	Charles Gorand <charles.gorand@effinnov.com>
>  L:	linux-nfc@lists.01.org (moderated for non-subscribers)
>  S:	Supported
> --=20
> 2.25.1

FWIW,

Acked-by: Mark Greer <mgreer@animalcreek.com>
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
