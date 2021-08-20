Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC143F2F84
	for <lists+linux-nfc@lfdr.de>; Fri, 20 Aug 2021 17:33:34 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id F37C2100EB32A;
	Fri, 20 Aug 2021 08:33:30 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id E9D5A100EB329
	for <linux-nfc@lists.01.org>; Fri, 20 Aug 2021 08:33:29 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id AB1915C011B;
	Fri, 20 Aug 2021 11:33:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 20 Aug 2021 11:33:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=KnTVuMs2H5gzlN4B5psHvAa8Bfy
	jO1A6i+S8P8kDpXs=; b=ngLzZcuQul7ySp4ZWjGOFn1D9s97e1vlwnADnPLUG1D
	AzOYE2dMTE09SesInfTlozfxr9Sif4Epru3/Teamet5aPtfHsXXgogpKq/tREfnW
	tEEUd4Rdk2uG8GuoXNMSWlkMw7Ideyy3HhwjiVLhpMdCiVGXDxDd8nQtU/ctU3QM
	H4FiTF/Mbz4EEXZwVk+hU2vkb7aKlWGP+WjA8vdmCTLXvgVkjHXokebW83vsc3uy
	kHHBHGzzHbbczpdQQ2D2huqpqIxkl7rYwdtWVJFzsyEdkqVMcq5vajS8VdPev+Tv
	j173XEHTT5coUoEtmFvCV48qbsSQdFg13BkWuzEZGtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=KnTVuM
	s2H5gzlN4B5psHvAa8BfyjO1A6i+S8P8kDpXs=; b=GjarI/m8tVKAZKs2HOJxTu
	HrXMM6/v6Rmj9YCi7gn60hFGG4QmG3i2wMmVHJdhyLfvxMelwwr1+1P5XbPKSEJN
	uNVatjWRLMPLxO++1xEMVm6y1+lUAkDsfZiXApQm1BsC9X1bqMlw8Zm2rG0VXmQo
	SRYUeR+9mHQYtW8BXe4aqrkhFE/ZtpmNSyT9f8I3rZ26VsqUJCoU/wdFZ/asgWXI
	Yo8btTGXbg6aiEGPGZBgAtO9d1/orHW0yomgqRTGlVb3OGbOG1hapRJ1om+Nujji
	nfHZZJkkY7nVM6Vkzxdv3OERhTtK2IShur7H6gFJUmfkiZGLbFk7Uc9YockSedCg
	==
X-ME-Sender: <xms:R8sfYVMg0HGQyEdg1RClzGVYHzRdjTlWLcGwIgTRT5R13lE-g-0C7g>
    <xme:R8sfYX9xIoHYPKskT6aydp6_GnBdK5ghMVoQya6fPmBCUXkDxcHJ5lAKG0iI09rFS
    WhRvW55EToDTdclvA>
X-ME-Received: <xmr:R8sfYUTFFqg3PRTNJQgz2UrqjYtQZlb_uUKOV_YTkBVo2tzNZY-8eVsOfEnwXI2eWBMPWvw89G2sYoK35R8MzkjfyFy05RpFK_rQXpc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleelgdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujghosehttdertddttddvnecuhfhrohhmpeforghrkhcu
    ifhrvggvrhcuoehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomheqnecuggftrf
    grthhtvghrnhepveeltdelgfevteehuddvhffhfefhfeeigeelhfejveefgedvgefggfdu
    geettdfgnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmghhrvggvrhesrghnihhmrghltghr
    vggvkhdrtghomh
X-ME-Proxy: <xmx:R8sfYRuCgB5JAcX47HDnvhgla-PxgyklGUXBfCujW_JyV78pbgyWLg>
    <xmx:R8sfYddrwwjJuJvLwZBoFqIuwCsGys-8QIUzWUYSJXofWGlHbiakaA>
    <xmx:R8sfYd2wMquN06bspFse_7nZabdjrH9TpbcGrd9GSn2RlaMSTH9YJQ>
    <xmx:SMsfYdGVnW0LfrqsLjzG1vapeFoUaA95fVRfsxXlSCuzEVuiva0WKQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Aug 2021 11:33:27 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 90897136009A; Fri, 20 Aug 2021 08:33:26 -0700 (MST)
Date: Fri, 20 Aug 2021 08:33:26 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20210820153326.GB355224@animalcreek.com>
References: <20210808022058.171350-1-mgreer@animalcreek.com>
 <65c7b6ca-c1f6-6557-1b54-f8f666e3a5bf@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <65c7b6ca-c1f6-6557-1b54-f8f666e3a5bf@canonical.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: TCXFAJLVSBXH4RG2RRONRDMETTS35QG3
X-Message-ID-Hash: TCXFAJLVSBXH4RG2RRONRDMETTS35QG3
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] [neard][RFC] test: Convert Python2 scripts to Python3
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/TCXFAJLVSBXH4RG2RRONRDMETTS35QG3/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 09, 2021 at 12:35:07PM +0200, Krzysztof Kozlowski wrote:
> On 08/08/2021 04:20, Mark Greer wrote:
> > Python2 is deprecated so convert the neard test scripts, which are
> > Python2, to Python3.
> > 
> > Signed-off-by: Mark Greer <mgreer@animalcreek.com>
> > ---
> > This is a first pass at converting the python scripts to Python3.
> > Not a lot of testing yet.  It appears that the 'gobject' is not
> > available anymore so I have to look into how to rework the code that
> > uses it.
> > 
> > I would appreciate any testing that you are willing to provide.
> > 
> > Also available at:
> > 	https://github.com/linux-nfc/neard/tree/mag/python3-ize
> > 
> >  se/test/test-channel     | 18 +++++------
> >  se/test/test-seel        | 38 +++++++++++-----------
> >  test/bt-handover         |  8 ++---
> >  test/handover-agent      | 34 +++++++++----------
> >  test/monitor-near        |  8 ++---
> >  test/ndef-agent          | 20 ++++++------
> >  test/neard-ui.py         | 70 ++++++++++++++++++++--------------------
> >  test/neardutils.py       | 14 ++++----
> >  test/phdc-simple-manager | 50 ++++++++++++++--------------
> >  test/test-adapter        | 16 ++++-----
> >  test/test-device         | 34 +++++++++----------
> >  test/test-tag            | 10 +++---
> >  12 files changed, 160 insertions(+), 160 deletions(-)
> > 
> 
> Few tests:
> ------------
> $ sudo python3 ./test/test-adapter poll nfc0 on
> Traceback (most recent call last):
>   File "./test/test-adapter", line 92, in <module>
>     adapter.StartPollLoop(mode)
>   File "/usr/lib/python3/dist-packages/dbus/proxies.py", line 72, in
> __call__
>     return self._proxy_method(*args, **keywords)
>   File "/usr/lib/python3/dist-packages/dbus/proxies.py", line 141, in
> __call__
>     return self._connection.call_blocking(self._named_service,
>   File "/usr/lib/python3/dist-packages/dbus/connection.py", line 652, in
> call_blocking
>     reply_message = self.send_message_with_reply_and_block(
> dbus.exceptions.DBusException: org.neard.Error.Failed: No such device
> 
> During handling of the above exception, another exception occurred:
> 
> Traceback (most recent call last):
>   File "./test/test-adapter", line 94, in <module>
>     print("%s: %s" % (error._dbus_error_name, error.message))
> AttributeError: 'DBusException' object has no attribute 'message'
> ------------

...

Thanks for testing Krzysztof.  I was in too much of a rush.
I'm in the thick of another project which include some upcoming travel
so I won't get back to this for a couple more weeks.  But I will get
back to it eventually.

Mark
--
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
