Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD59460DFE
	for <lists+linux-nfc@lfdr.de>; Mon, 29 Nov 2021 05:15:45 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 6896B100EB323;
	Sun, 28 Nov 2021 20:15:42 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 11B02100ED48C
	for <linux-nfc@lists.01.org>; Sun, 28 Nov 2021 20:15:39 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 0548E320092B;
	Sun, 28 Nov 2021 23:15:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sun, 28 Nov 2021 23:15:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=gPwsUMz6WJ8fSf24HaThk7elXaZ
	+THMCwlyJICoKHtA=; b=JmZX+fX/x7LeTU1OVwPCrc0vVxL0jv62tPhLVvw248V
	q+NETmvs57rUpwzLpD6BkETn3KBfx0YESmYXyrw2qHIn0ZgFZl4bfX81QY0bfpUZ
	OKth3jUOBHRVh4XZPWkzz7WNtj+ttLONX3FWqr9yFlf0dSj8Jsz6JEXtVPNotw5g
	1gphSX6gcBpqRhFAYlVNQA/dsFRfmX6bzSJW1KfQI9K2UBwYtCb60TS9kVHGyiuM
	6t3FHBH+JRdtdvb9r1/oDBuk9mSjHHR5iYcV1CaeW/zJo9KzAvMoc5Tpcovo2Llk
	moPSO0BRSkP8UEobAojbIc0j61F7fIt6heIK4853EaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=gPwsUM
	z6WJ8fSf24HaThk7elXaZ+THMCwlyJICoKHtA=; b=Ie2CKp1vCANdYCqMl09VBP
	gIR38WvTYa0NDNsTm4BYTmxDudQWYAnvZ3vTfjkkgGeY+LXbBxgcZVNidNLC8rPh
	MOs1IDVrhhdieyBzyb/W2BxGxCSNpnivl5sPBUKAqfJQjXitWvSTry+D+Tk/KRLD
	36rPA8KEgkYBAkiWDRtXyhlPkidp/l2TpsMlejfMIpOb4ZeYk4c4btG4P9R6QHUJ
	cjRZrsUkiHebNivrVRHsRHY/0jAggLOMUab1TRVWa3a6kuyhAhDRJwu3zRRLMo79
	TXFsZW91INwjfmjiaPTlyoRnJgMuddKAjCxtEBEVqBuW3We0th3eFLl6qMtiGsLA
	==
X-ME-Sender: <xms:6lOkYem9OvjdqQsMphfshnxPnvlrL0XxBALlbCb1Rfb1QwRpcwUvCg>
    <xme:6lOkYV1OZOA8h4HQpwWLJD4q0fjmU4pR8K0gFO4H5yV5I0DWBvlb-b5voQIZx0xdl
    wrR40apLinAddBV_w>
X-ME-Received: <xmr:6lOkYcpDOYR5Kc9M4VxHwL8QQL5uWXrNqjGLJFwGlhs4ua6irfyfpQGzwNmrt2l2IJ3B-Mmp1FgmpXktMVoXrSaGu-UnYjFpRiV8NvM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrheekgddtiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujghosehttdertddttddvnecuhfhrohhmpeforghrkhcu
    ifhrvggvrhcuoehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomheqnecuggftrf
    grthhtvghrnhepveeltdelgfevteehuddvhffhfefhfeeigeelhfejveefgedvgefggfdu
    geettdfgnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmghhrvggvrhesrghnihhmrghltghr
    vggvkhdrtghomh
X-ME-Proxy: <xmx:6lOkYSnFZK5M3EYjd_B3DheS9brRF99QyxWfYx08-ajvdKPlweP4rg>
    <xmx:6lOkYc2MGlaIfB6qDnBzFth-3jQB7raC2UhirkktkUbyohVj-4cyCA>
    <xmx:6lOkYZu9sJeaYFiYdjX0RERpaNL09Z2Ls_BRv_ReeDmobXe9Hlr6vw>
    <xmx:6lOkYZ_stSJVywRDMPAXWY4b2hkuFytXEfKQC1UkGOGooL783tzZog>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 28 Nov 2021 23:15:37 -0500 (EST)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id A27B713604A6; Sun, 28 Nov 2021 21:15:36 -0700 (MST)
Date: Sun, 28 Nov 2021 21:15:36 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20211129041536.GA830560@animalcreek.com>
References: <20210808022058.171350-1-mgreer@animalcreek.com>
 <65c7b6ca-c1f6-6557-1b54-f8f666e3a5bf@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <65c7b6ca-c1f6-6557-1b54-f8f666e3a5bf@canonical.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: E4E6LMQXUFMLTQ7JG7N3C5GVYEVGRBO6
X-Message-ID-Hash: E4E6LMQXUFMLTQ7JG7N3C5GVYEVGRBO6
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] [neard][RFC] test: Convert Python2 scripts to Python3
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/E4E6LMQXUFMLTQ7JG7N3C5GVYEVGRBO6/>
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

This looks like you may not have installed the necessary dbus support
(e.g., src/org.neard.conf).  After building neard, you can install this
with:

$ sudo make install

If that isn't it, I'll need more info about your environment because I
don't get those errors.  To make sure we're on the same page, these steps
should get you going (this example on an amd64 running Ubuntu 20.04):

$ ./bootstrap-configure
$ make
$ sudo make install

<now insert your nfc hardware (a pn533 in this case)>

$ test/test-adapter list  # no need for sudo
 [ /org/neard/nfc0 ]
    Protocols = [ Felica MIFARE Jewel ISO-DEP NFC-DEP ]
    Mode = Idle
    Polling = false
    Powered = false
$ test/test-adapter powered nfc0 on
$ test/test-adapter list
 [ /org/neard/nfc0 ]
    Protocols = [ Felica MIFARE Jewel ISO-DEP NFC-DEP ]
    Mode = Idle
    Polling = false
    Powered = true
$ test/test-adapter poll nfc0 on Initiator
$ test/test-adapter list
 [ /org/neard/nfc0 ]
    Protocols = [ Felica MIFARE Jewel ISO-DEP NFC-DEP ]
    Mode = Idle
    Polling = true
    Powered = true

<now more a tag within range>

$ test/test-adapter list
 [ /org/neard/nfc0 ]
    Protocols = [ Felica MIFARE Jewel ISO-DEP NFC-DEP ]
    Mode = Initiator
    Polling = false
    Powered = true
$ test/test-tag list
 [ /org/neard/nfc0/tag0 ]
    Protocol = MIFARE
    ReadOnly = false
    Type = Type 2
    Adapter = /org/neard/nfc0
$ test/test-tag write /org/neard/nfc0/tag0 Text UTF-8 en-US "Hello World"
$ test/test-tag dump
[ /org/neard/nfc0/tag0 ]
  [ /org/neard/nfc0/tag0/record1 ]
      Representation = Hello World
      Type = Text
      Language = en-US
      Encoding = UTF-8

<move tag out of range>

$ test/test-tag dump
$ test/test-tag list
$ test/test-adapter list
 [ /org/neard/nfc0 ]
    Protocols = [ Felica MIFARE Jewel ISO-DEP NFC-DEP ]
    Mode = Idle
    Polling = false
    Powered = true

<you have to poll again to read/write again and it should be called nfc1>

> Others:
> ------------
> sudo python3 ./test/test-device
>   File "./test/test-device", line 76
>     usage()
>           ^
> TabError: inconsistent use of tabs and spaces in indentation
> ------------
> sudo python3 ./test/phdc-simple-manager
>   File "./test/phdc-simple-manager", line 60
>     print('Init PhdcPeerManager thread')
>                                        ^
> TabError: inconsistent use of tabs and spaces in indentation
> ------------

Not a py3-specific issue but I will fix this and other formatting issues.

> > diff --git a/test/neard-ui.py b/test/neard-ui.py
> > index cf4bb13c5155..91f8e6bbaa6a 100755
> > --- a/test/neard-ui.py
> > +++ b/test/neard-ui.py
> > @@ -1,4 +1,4 @@
> > -#!/usr/bin/env python
> > +#!/usr/bin/env python3
> >  
> >  import pdb
> >  import sys
> > @@ -18,12 +18,12 @@ import neardutils
> >  class Neard:
> >  
> >      def interface_Added(self, path, interface):
> > -        print (" New interface added: %s") % path
> > +        print((" New interface added: %s") % path)
> 
> 
> Instead:
> print(" New interface added: %s" % path)

Will fix all of these.

> > @@ -42,7 +42,7 @@ class Neard:
> >                                      dbus_interface="org.freedesktop.DBus.ObjectManager",
> >                                      signal_name="InterfacesRemoved")
> >          except:
> > -            print ("Can't connect to org.freedesktop.DBus.ObjectManager");
> > +            print(("Can't connect to org.freedesktop.DBus.ObjectManager"));
> 
> Double ((

Will fix all of these.

> > @@ -57,26 +57,26 @@ def quotechars( chars ):
> >  class PhdcPeerManager:
> >      def __init__(self, agent_fd):
> >  	#Grab the agent ....
> > -	print 'Init PhdcPeerManager thread'
> > +	print('Init PhdcPeerManager thread')
> >  	self.r_fd = agent_fd.take()
> > -	print 'Agent fd:', str(self.r_fd)
> > +	print('Agent fd:', str(self.r_fd))
> >  
> >      def run( self):
> > -	print 'Run PhdcPeerManager thread: ', str(self.r_fd)
> > +	print('Run PhdcPeerManager thread: ', str(self.r_fd))
> >  	self.sock = socket.fromfd(self.r_fd, AF_NFC, socket.SOCK_STREAM)
> >          try:
> >              while True:
> >  		miu = self.sock.getsockopt(SOL_NFC, NFC_LLCP_MIUX)
> > -		print 'MIU=', miu
> > +		print('MIU=', miu)
> 
> Mixed up indentation but I guess the issue was here before.

Looks like an artifact of tabs vs. spaces.  I'll fix that and other
formatting issues.

> Best regards,
> Krzysztof

Thanks for the review.

Mark
--
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
