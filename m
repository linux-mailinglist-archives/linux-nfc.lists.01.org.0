Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 421853DA81A
	for <lists+linux-nfc@lfdr.de>; Thu, 29 Jul 2021 17:58:11 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 78631100EBB6E;
	Thu, 29 Jul 2021 08:58:09 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 7AA41100EC1C6
	for <linux-nfc@lists.01.org>; Thu, 29 Jul 2021 08:58:07 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id E69D45C010E;
	Thu, 29 Jul 2021 11:58:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 29 Jul 2021 11:58:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=ahTGRcGEE9+wIDNP0Z6gvlwNfNO
	vXtR62+7G1xOUlpo=; b=dAjdr+TgHnv2Eba/RgVsG3XsqoPIBieIN8+ypHOme+f
	HzIHhd3w1egvJStE/G9hosh7PIJxB1rUBB3oFWte2hd+R8MieCZjTSw7ErvStI0O
	LuemMP8129pCo995OvxlryEMjCZylKH3AdD2CXXeX6j2HRhfWLS5a+ltRC/AfNZ9
	pNqqsC4Foxtkw9ROn6KFNZJGEp333EM8X0xv+LwM95Z5HiNe17MOU5BmcWnzEIen
	i7/7PytUdQbIrSob75Xl9KvGaUsh/fEBSUz7X/ElDFX3KoWtYqoloKUL3m+P3oRH
	v9ZW5LNjLNAl7TKzHvGeyXnD8mLzBhqtn4Nh9o2BOZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ahTGRc
	GEE9+wIDNP0Z6gvlwNfNOvXtR62+7G1xOUlpo=; b=VsurHzvl5huQ9dXpK1Uo6+
	0LgCrkdHNO2LaFY/a2jfAFxaBSVsK9GseP+KnGyXhZoR8LmdAktTvYhRHzYxtIvZ
	OGYGRv10va2f+2PZl/k9D01ud9j6xG2yT2niOU23wQLS3Qsg9DREx5OG9y/ecu05
	qt6VEihXQZQ4eeREx043VMiooD7ANtt38o3fWR51NtWTazqu1utG0vNdbUhV8e2Y
	sLO6wkZPkhUB7JA1mxxw1uhRlDQWu1mcKslCyIGKkwzeWpfjWl0OWI9ePxKJKoNh
	FT4A2uJO5aOd2pILX9DiiW1X0OriUTqU/DAQY1Y7K5hO1OUO0fMYhGFAFjj5S8dw
	==
X-ME-Sender: <xms:C9ACYWHCx_vM9SpHKf7IQ8Mb1P734ae9_TsiLtAYNN75bcE_k4Ch4Q>
    <xme:C9ACYXUFE0QNXCHmwAonFsHW7KEqHVum95V7oxlBYz2UdzZovOMmhoMKOaPWdgB5P
    VR8Mgn2CQdu7YYOpA>
X-ME-Received: <xmr:C9ACYQLJPIihb5KG6S9ccCE1aEOcO7doSAJdBTh7cfPRr2mwfBGC_2N-ZydhxriT5jKRlfB538ednSwNx8ucvjz0-3dZ6Id2CebnUfo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrheefgdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujghosehttdertddttddvnecuhfhrohhmpeforghrkhcu
    ifhrvggvrhcuoehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomheqnecuggftrf
    grthhtvghrnhepieeugfdutdefiedtvdfftedufedvjeehgfevveefudfgjeffgeeiteet
    jedufffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhm
X-ME-Proxy: <xmx:C9ACYQHONO11FiGHu5ER7cLbFxopPx78wEJTZgZzLcn-kMnazxzFRQ>
    <xmx:C9ACYcVgwHPmJQqekfcZzE3IJjtrZ_yHyzipFw4ciyRNXkjs8nxOuA>
    <xmx:C9ACYTPOXKyo9ah6Xcc77nFAtR34dCN4hTP8IG_o7Y5fLdeO-8awOQ>
    <xmx:C9ACYfHWTLoJN7XD9sXBe53u6jN_WhM0U3Zu_DD_j5uKqJmzpGS-BQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Jul 2021 11:58:03 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 6508C1360232; Thu, 29 Jul 2021 08:58:02 -0700 (MST)
Date: Thu, 29 Jul 2021 08:58:02 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20210729155802.GA242073@animalcreek.com>
References: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
 <20210729104022.47761-5-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210729104022.47761-5-krzysztof.kozlowski@canonical.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: J6JZETX7BQZNWA2YQUI5NSJZI7WIB3R5
X-Message-ID-Hash: J6JZETX7BQZNWA2YQUI5NSJZI7WIB3R5
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Bongsu Jeon <bongsu.jeon@samsung.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 04/12] nfc: trf7970a: constify several pointers
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/J6JZETX7BQZNWA2YQUI5NSJZI7WIB3R5/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 29, 2021 at 12:40:14PM +0200, Krzysztof Kozlowski wrote:
> Several functions do not modify pointed data so arguments and local
> variables can be const for correctness and safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  drivers/nfc/trf7970a.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)

Acked-by: Mark Greer <mgreer@animalcreek.com>
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
