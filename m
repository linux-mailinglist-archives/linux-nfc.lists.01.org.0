Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECB83F2F80
	for <lists+linux-nfc@lfdr.de>; Fri, 20 Aug 2021 17:31:34 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id C9E8A100EB329;
	Fri, 20 Aug 2021 08:31:31 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 0084B100EB85D
	for <linux-nfc@lists.01.org>; Fri, 20 Aug 2021 08:31:29 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 5F9E35C0110;
	Fri, 20 Aug 2021 11:31:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 20 Aug 2021 11:31:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=/jqILAgOPao8gQXCUT2/aQkG3Ft
	swPFm4GpV3YTE1qQ=; b=vVHEUz8BKR/0DoDw3Ai/vwKiPhjnXmnqxNjugZiLbP+
	T4USUnzvq9Xxi2WypJiq44tIg9xp7TDL3lUkJsTZ293CMJUaanbSz2ryjWbpKAVN
	aOHt1XcS8wg7V0kBwXV1Ag3S2Xl2ZEf7Mv1enx0KfpKwVDMUPdK3LoPE0MNDyGg1
	Zqrmp169UVZva8zz9kYmifEQa5ih8HYv401SXlL79XzV8DVkfArKbf+JEfGoQENS
	toqUkpb0Vf1zOtM9O6JAa35/gVln6TqN2mEJ3NXGT9xYRrSFczVSdAnkKUK6q3Rr
	qGWfNOCmaahXmaPthJBY2YHPfiGFJn+05fKfxFqKx+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/jqILA
	gOPao8gQXCUT2/aQkG3FtswPFm4GpV3YTE1qQ=; b=QrVeIXKyZS1cTvefJ4hkmE
	NuYW7+DHLZJYANmVXwmN8xyeyLFfAbVbArJARmBoIbPQbGDwdGds55z1SvrSCnuz
	BPF/FkjyZcdPhVZ6Th1EGM+/v2CaO15fokyByMWkIQyxkLY2Ejh54KUWMqIZHMwB
	2UbMO9+A71g1h7aynJtaDXBDYdMlebqvqYI8QgXPGiGp8qn4jouB8mrUG/GRHEfP
	FMfJgCfc+qdfm8zLO+vbufHqfbpH1Le05W7ERXf8u987M5JYwjzy8kAWFEFjgG8w
	ihbFIAe9cZGvxSpqhJTnNEnFA9mwt4xEfVR2ALboxD++N45wUsWYG2Zq3u3/45kQ
	==
X-ME-Sender: <xms:zsofYX8JmSZUAhoTmzimGyInZ8KGvDIkt1tMwSvdUWe6LIvMEev3Vw>
    <xme:zsofYTtBuxjNMGMTw-BE3dG2NOttZvAWf19xjQZ-qzd93CJ4e-UJ-R7uso1uJgN3d
    0qR-FWAYseha4QQUw>
X-ME-Received: <xmr:zsofYVAgGggBFIOov5pebThHmHFH4v8QqPdiJIyZJnkmko3m84wD4yVUnaoL-8AQifz3O7ntqefg-W41I1Wu-WtfxtIFRtlm1G7uoao>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleelgdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujghosehttdertddttddvnecuhfhrohhmpeforghrkhcu
    ifhrvggvrhcuoehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomheqnecuggftrf
    grthhtvghrnhepieeugfdutdefiedtvdfftedufedvjeehgfevveefudfgjeffgeeiteet
    jedufffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhhgrhgvvghrsegrnhhimhgrlhgtrhgvvghkrdgtohhm
X-ME-Proxy: <xmx:z8ofYTcOy1qv4XCtmcwW1jUOL0zv2JO8yzkl44Ehhua3XrH4RL9fPg>
    <xmx:z8ofYcM7MiCnHojpm6J1nvn3snQNHKDGOvLDcFsI11aQDsjX0sNeTQ>
    <xmx:z8ofYVlAv4nnO8-ys9qCJcly-1fB2Z7y2S4tqPlLmMJh1JbTsMKhMg>
    <xmx:0MofYVbekdaOgBMXVpgBSRdqbS1s7KgxdXD0_s2JCqXxCQAP5KdiJA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Aug 2021 11:31:26 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 9D796136009A; Fri, 20 Aug 2021 08:31:25 -0700 (MST)
Date: Fri, 20 Aug 2021 08:31:25 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <20210820153125.GA355224@animalcreek.com>
References: <20210316112210.50100-1-frieder.schrempf@kontron.de>
 <AM0P122MB011340CE87F73F55335D040C826B9@AM0P122MB0113.EURP122.PROD.OUTLOOK.COM>
 <e925f779-3be9-1d11-81ea-e8841f55381a@kontron.de>
 <20210808015532.GE124928@animalcreek.com>
 <47a612c7-2a97-fc31-1735-dec5648d6167@kontron.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <47a612c7-2a97-fc31-1735-dec5648d6167@kontron.de>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: OPVO2SZISVNNGQZOJGGXEVHZUSTRGEZ2
X-Message-ID-Hash: OPVO2SZISVNNGQZOJGGXEVHZUSTRGEZ2
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2] tag: Implement readout of tag UID via DBus interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/OPVO2SZISVNNGQZOJGGXEVHZUSTRGEZ2/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 10, 2021 at 11:58:31AM +0200, Frieder Schrempf wrote:
> On 08.08.21 03:55, Mark Greer wrote:
> > On Thu, Mar 18, 2021 at 05:14:35PM +0100, Frieder Schrempf wrote:
> >> Hi Fabian,
> >>
> >> On 16.03.21 19:49, Gottstein, Fabian wrote:
> >>> Hi Frieder,
> >>>
> >>> thanks for the patch.
> >>
> >> thanks for your feedback.
> >>
> >>>
> >>> Could you please also consider the following situation:
> >>> In the case of a NFC Tag Type 1, the identifier is delivered via the RID command (see NFC Digital Protocol). Thus, the Tag's nfcid property is updated in a later step.
> >>> To inform the neard users, a property changed signal has to be emitted when nfcid has changed (in near_tag_set_nfcid). Also, a exists() handler for the new DBus property should be implemented.
> >>
> >> I'm new to NFC and D-Bus, so I don't know much about what use-cases and
> >> requirements there are.
> >>
> >> Your request sounds reasonable and I think I have a rough understanding of
> >> what is probably needed to implement this. Still to actually do this I need
> >> to look at the specifications and the code more closely and I don't know
> >> if/when I will find time to do this.
> >>
> >> Also I don't have any hardware to test this with NFC type 1 tags.
> >>
> >>>
> >>> Another thing regarding building the response message:
> >>> The following code snippet could simplify and improve the readability of the usage of the dbus message builder:
> >>>
> >>> dbus_message_iter_open_container(iter, DBUS_TYPE_ARRAY, DBUS_TYPE_BYTE_AS_STRING, &entry);
> >>> dbus_message_iter_append_fixed_array(&entry, DBUS_TYPE_BYTE, &uid, len);
> >>> dbus_message_iter_close_container(iter, &entry);
> >>>
> >> Thanks for the improved code, I will use this instead.
> >>
> >> Frieder
> > 
> > Hi Frieder.
> > 
> > Do you have an updated version of this patch (or did I miss it)?
> 
> No, unfortunately not. I implemented this fix for a project that is now discontinued. I can try to find some time in my spare time to implement at least Fabian's code improvement suggestion. But I don't know if it makes sense to upstream this without the changes Fabian suggested in regard to NFC Tag Type 1 and I currently have neither time to dig into this, nor hardware to test it.

Okay, no problem.

Mark
--
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
