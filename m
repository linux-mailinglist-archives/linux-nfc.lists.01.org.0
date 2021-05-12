Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B71D637C2C3
	for <lists+linux-nfc@lfdr.de>; Wed, 12 May 2021 17:15:35 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 8665D100EBB6C;
	Wed, 12 May 2021 08:15:34 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id AB2A9100EBB6B
	for <linux-nfc@lists.01.org>; Wed, 12 May 2021 08:15:30 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id C82C15C0045;
	Wed, 12 May 2021 11:15:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 12 May 2021 11:15:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm2; bh=YVb0jvkmEwmzubD+WY/O9I3Lwz6
	UzT1MBUzmycrS1X0=; b=FRwdWdbb2twJseeJq+qSCcc9GlztShbYmnKJowgxGtv
	g87O2DVPWEdlo/jHV8csHR5+9oubXJU1MebXg8atcX0CFPZlz3mgikgYwAu9NIms
	oo7qmgFvOwdG5c16y3fDRWeeKeDLfG6CNLpTKpFjVq4dYgFfHnMa2QmEt8btOl6g
	DAak3dslDOyx80sdNBXA9Ko2hFB5G4Ph9NF8XYmm/FyR/gFgX9VntwnEyQiBCBvM
	99lHx764+V6VUdmKu/t4OIBm5EdRSONwsV4lMHlCE3GEuIxq/QLfI8g36WKgftUj
	FpJTu4GoqmXA93T0vyJ4HBy3uMqGfTHerEjWRoXpZ4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=YVb0jv
	kmEwmzubD+WY/O9I3Lwz6UzT1MBUzmycrS1X0=; b=TfDUy/HEdekEgEmn35QrP8
	vSnTZaG28Y4JvYwBtOJ8uMsAElOje+D+01CdrSr76wgRwdNstcQc+J+OdqS4GMQ1
	w0cbo11GXX0sK01YlsNHMTmE9j5u43EyIr3oyJxI2hTErfxlnOcFStambU5fIp6D
	Y8OE0397JIVRsaqEAZ8laIOP7LYXM5+ly06gIAmVk7TksuBy7qG0VsX0qwMXhzXe
	MTKu4rXwtVkCsw4gbJqcRjGehhJbFPuH/n8emDBEMh+6L1VECAnvN85OqppcLNFJ
	+7FaxocXUxgMxnqgxoKrWopPLf4jGeVJxwY8Nn3d89eLzjhznme8XAVBA+2VCdgA
	==
X-ME-Sender: <xms:D_GbYFXtFz5jfR4g2rSdljD13nzJTZY_cDI8jmSyLWbojffzAZsD5Q>
    <xme:D_GbYFmHvLdZ6LG12Op-mhmQaRtq3Y4KLPoSIwS1xq8G-zM6jbgYoPVX42KZYtv_S
    _kPzABYDgSnJ9ooYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehvddgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjohesthdtredttddtvdenucfhrhhomhepofgrrhhk
    ucfirhgvvghruceomhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhmqeenucggtf
    frrghtthgvrhhnpeeiuefguddtfeeitddvffetudefvdejhefgveevfedugfejffegieet
    teejudffhfenucfkphepjedtrddujedvrdefvddrvddukeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmghhrvggvrhesrghnihhmrghltghr
    vggvkhdrtghomh
X-ME-Proxy: <xmx:D_GbYBbvS4iKQXktS56xejXww8t2ygqwhbedyVtLgjq1yS-ZOhKH6g>
    <xmx:D_GbYIX8TQJLeM3LWuJNevHbYQuCf9t53oxJ67r4MKXfTxPmM5KlAg>
    <xmx:D_GbYPnG82hS7ZuqIpb2cgxqirOG5EN6aFqs_q7r0uEwZKLPqkNbcQ>
    <xmx:EPGbYNjD6mI5FLixTC5Y_PrGqVtSM_acIbUBM9usyOyUYD7U78BRGg>
Received: from blue.animalcreek.com (ip70-172-32-218.ph.ph.cox.net [70.172.32.218])
	by mail.messagingengine.com (Postfix) with ESMTPA;
	Wed, 12 May 2021 11:15:27 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 9741D136008B; Wed, 12 May 2021 08:15:26 -0700 (MST)
Date: Wed, 12 May 2021 08:15:26 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20210512151526.GC215713@animalcreek.com>
References: <20210512144319.30852-1-krzysztof.kozlowski@canonical.com>
 <20210512144319.30852-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210512144319.30852-2-krzysztof.kozlowski@canonical.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: NASWFK6LLSFZATGJ5LBBAKYPEUW3FQXZ
X-Message-ID-Hash: NASWFK6LLSFZATGJ5LBBAKYPEUW3FQXZ
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 2/2] MAINTAINERS: nfc: include linux-nfc mailing list
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/NASWFK6LLSFZATGJ5LBBAKYPEUW3FQXZ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 12, 2021 at 10:43:19AM -0400, Krzysztof Kozlowski wrote:
> Keep all NFC related patches in existing linux-nfc@lists.01.org mailing
> list.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index adc6cbe29f78..83f18e674880 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12900,6 +12900,7 @@ F:	net/ipv4/nexthop.c
>  
>  NFC SUBSYSTEM
>  M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> +L:	linux-nfc@lists.01.org (moderated for non-subscribers)
>  L:	netdev@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/net/nfc/

FWIW,

Acked-by: Mark Greer <mgreer@animalcreek.com>
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
