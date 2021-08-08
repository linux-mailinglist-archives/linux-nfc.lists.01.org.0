Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AA03E37D6
	for <lists+linux-nfc@lfdr.de>; Sun,  8 Aug 2021 03:55:38 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 75A43100EB345;
	Sat,  7 Aug 2021 18:55:37 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 86248100EB345
	for <linux-nfc@lists.01.org>; Sat,  7 Aug 2021 18:55:35 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id 843CD5C00C2;
	Sat,  7 Aug 2021 21:55:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sat, 07 Aug 2021 21:55:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=xWqQEupo1s4GJs4lg3fvoDqAN0V
	WpU8dhJop+dZuiDI=; b=kBPJHE0wSL8zWiH1aiFb5te5z7FHJMjQiHfNpshL8nU
	AWUdESchnY6C5acUQ0HZsIktpKYZYumaMV93XtHGVPWJ22q+8OqCmsne4GjRKseB
	GMiyGTs035ny2+MT5r6zN3fL843x1gD3ofL2MIMpioX8RvcpxN/NeE3KQrybEkUU
	98vW3c/a7OJQLkOXk9JI2fcU1gw2R8s+ghSu9f0EaSv/TdNWgu6DLw9l5/gLMtiX
	BIq+x+TzfYeaKLpymXdzkP5sbezAh3r83bFJsfnDQGAYfFCODEwIMCPO17aTwKvH
	hZAs29OalNo0PBSELyajvBY7wnmCuhtpgEmqgFu7tZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xWqQEu
	po1s4GJs4lg3fvoDqAN0VWpU8dhJop+dZuiDI=; b=ahg2dhCn34zTwLKMS+Whjy
	aibWhPwvHMX/PHBKhCkogyVoDoERg5IdBW6dPKy2Vxu2c2WxBi5hWCprHmsQjEad
	OQs78Vz8L0DVVCGix0KTkjKABbMN0pC7SWvr/TLcFvzD5vj6x4wxRUC3Kfh2Mdx2
	cbedH6LFivzhLvB9jVs6bf0cTzbpa+W4ubgnI0FaS5Ez021iMkpft8LvUsckIeEC
	jqZXFFdPBfYOaBr7V35NfsW9wimgVG8fqj+Mh7+Svkk3CQN6Zqw7xZT9JfnPENjG
	QXuCRa+OLvbUEdBSsTUnnS1rg1rvXt5dvPNvgHrlfRZIJfjUTm7xzOXkdKv8+rgg
	==
X-ME-Sender: <xms:lTkPYR-1ijdUM7wnjS_E97gykacLZNnPHyDDhrtrNHLOSyXUqJaxvA>
    <xme:lTkPYVsUU2d-3Ndmx9XO3cwGDJ-sIE8jkjgvsrIj0Y_syu8gCOGGCrSQHwchdqAhC
    RVfXaih6xWFWR8zKw>
X-ME-Received: <xmr:lTkPYfDE7Uf_jHlEx4mn6OhZbAKE29lLG4JtwrMKA4fDcYLPKpDdturs6g9bfE-4Cd8KkOpMD2u7g23njxwPRtuWuEqp3Vjp7Q91kyY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjeeggdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujghosehttdertddttddvnecuhfhrohhmpeforghrkhcu
    ifhrvggvrhcuoehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomheqnecuggftrf
    grthhtvghrnhepieeugfdutdefiedtvdfftedufedvjeehgfevveefudfgjeffgeeiteet
    jedufffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhm
X-ME-Proxy: <xmx:lTkPYVfmTzEPCYa3jYM7srJyYVlh02JTqccSIgC4FQej-MygIw2tzg>
    <xmx:lTkPYWMBb86go7o04fYf_rHILxb1MCfTxAezeMHMi6GyQnRfiDSrJA>
    <xmx:lTkPYXklrULyqbX8Z1l7J8LkjpyHfisHjdrreBZdLNPWzl12SXQayg>
    <xmx:ljkPYfa3RftwGvegrST0yTUg9ugjirruo8aYmxUJWlrvDudQV3AE9A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Aug 2021 21:55:33 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 95472136009E; Sat,  7 Aug 2021 18:55:32 -0700 (MST)
Date: Sat, 7 Aug 2021 18:55:32 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <20210808015532.GE124928@animalcreek.com>
References: <20210316112210.50100-1-frieder.schrempf@kontron.de>
 <AM0P122MB011340CE87F73F55335D040C826B9@AM0P122MB0113.EURP122.PROD.OUTLOOK.COM>
 <e925f779-3be9-1d11-81ea-e8841f55381a@kontron.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e925f779-3be9-1d11-81ea-e8841f55381a@kontron.de>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: Y6HZ7UD5KONUICKAJP6VPNG2O6YXKEZ5
X-Message-ID-Hash: Y6HZ7UD5KONUICKAJP6VPNG2O6YXKEZ5
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2] tag: Implement readout of tag UID via DBus interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/Y6HZ7UD5KONUICKAJP6VPNG2O6YXKEZ5/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 18, 2021 at 05:14:35PM +0100, Frieder Schrempf wrote:
> Hi Fabian,
> 
> On 16.03.21 19:49, Gottstein, Fabian wrote:
> > Hi Frieder,
> > 
> > thanks for the patch.
> 
> thanks for your feedback.
> 
> > 
> > Could you please also consider the following situation:
> > In the case of a NFC Tag Type 1, the identifier is delivered via the RID command (see NFC Digital Protocol). Thus, the Tag's nfcid property is updated in a later step.
> > To inform the neard users, a property changed signal has to be emitted when nfcid has changed (in near_tag_set_nfcid). Also, a exists() handler for the new DBus property should be implemented.
> 
> I'm new to NFC and D-Bus, so I don't know much about what use-cases and
> requirements there are.
> 
> Your request sounds reasonable and I think I have a rough understanding of
> what is probably needed to implement this. Still to actually do this I need
> to look at the specifications and the code more closely and I don't know
> if/when I will find time to do this.
> 
> Also I don't have any hardware to test this with NFC type 1 tags.
> 
> > 
> > Another thing regarding building the response message:
> > The following code snippet could simplify and improve the readability of the usage of the dbus message builder:
> > 
> > dbus_message_iter_open_container(iter, DBUS_TYPE_ARRAY, DBUS_TYPE_BYTE_AS_STRING, &entry);
> > dbus_message_iter_append_fixed_array(&entry, DBUS_TYPE_BYTE, &uid, len);
> > dbus_message_iter_close_container(iter, &entry);
> > 
> Thanks for the improved code, I will use this instead.
> 
> Frieder

Hi Frieder.

Do you have an updated version of this patch (or did I miss it)?

Thanks,

Mark
--
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
