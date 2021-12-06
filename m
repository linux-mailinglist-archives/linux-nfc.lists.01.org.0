Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B028846A296
	for <lists+linux-nfc@lfdr.de>; Mon,  6 Dec 2021 18:17:18 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 16264100F3FC9;
	Mon,  6 Dec 2021 09:17:17 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 8A291100EB82A
	for <linux-nfc@lists.01.org>; Mon,  6 Dec 2021 09:17:14 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id E37E25C0124;
	Mon,  6 Dec 2021 12:17:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 06 Dec 2021 12:17:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=qzY/D+WaeebW91l4ok1Y1FA0kea
	had68mdiuxaZRqqc=; b=H9vYP5MWa98IO/4SJjjUzlnyzmYoaPXyrVOBFhg0rDD
	fhlNQEg8xkR/ItXtPjV62gUPG0qebClGoDe72oZiDGPy5JlFDmWLPh/LJandQB1O
	fsSg5OXd2an813M00OWgbWfyzoi9c5Tv9O07x3VUq9JhxINNGafK9n4TwDhfHNOX
	pDqFb4PgSnFSHplJpwNzkdTKnu4biCaicTBKqXLLXZbKp0uVjKBFGDQ5DSHrd3HL
	J9+8nPD5AXTNYUwRwjZhHzbL1iMWJebXiv6nz6ZcHUIi1OQLUZ/bM8XB1i+n9IRB
	Pj4of5WCciyUdZ6Gsqr8wPIfx6IsPEHUg+45/aMg0NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=qzY/D+
	WaeebW91l4ok1Y1FA0keahad68mdiuxaZRqqc=; b=ZIcKkUlAFWCMXhLem6KMyF
	Whzpm2xNOwAlXoz738DsQUl8Ivb73mUCaosn4epgbieahHwPj5ByN9STXTu3dKpG
	eeEY7kp/bD8ZaftUImXjRTYFdRLUh9Rft9eFC2Rsob6iWUhL2uxQKvDKwD2pUAyR
	nh9JoMPamylu3QzCrxts2uEe3MVSNN8Y3GjBVOniS2nCt3JQDrrqr7SVuJrtxNmh
	k8ShylKSrwE7AgKWPd3/iqpL7cG3PVoGAZT7L7q7X2Wk7zMzghS9hooNMzElCAxS
	DQsHIPa6qO/Op2NhHClcfudq4r1PV+c4tSheatPriZyXnjXjB3lvSAm4fDHeDxZQ
	==
X-ME-Sender: <xms:mUWuYTNWNT5MNGuB2JdzmRtILu3hay0rOgv95gi9tL0yCYA4OkizOA>
    <xme:mUWuYd-hIWGIgq90fRZS_RqZsEdl6NNlrqf61rvypqKs7nuUcM6Z-N8fdX3rTlr52
    djqPXUBXdGBlkl0ow>
X-ME-Received: <xmr:mUWuYSSetCVT62GVc0dmB_73INBIfYrHD9rxhSZxMcFhS38Kp3_cutAFIeTLkt9QAYTLMsH-8w3CY3Y10SakXSteCQxZpJTaVCwc4EQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrjeefgdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujghosehttdertddttddvnecuhfhrohhmpeforghrkhcu
    ifhrvggvrhcuoehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomheqnecuggftrf
    grthhtvghrnhepveeltdelgfevteehuddvhffhfefhfeeigeelhfejveefgedvgefggfdu
    geettdfgnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmghhrvggvrhesrghnihhmrghltghr
    vggvkhdrtghomh
X-ME-Proxy: <xmx:mUWuYXsZD5q-HJemVnn_mLr96IdEYo2G7khX58abMTIeTi78DmR4mg>
    <xmx:mUWuYbcf-oy_qFA-ho0WWdwqtZJJdilXMzLk-zTof15QoYAElLzagA>
    <xmx:mUWuYT2HmC7d0qtykj6Xc4WWdG8340DFYosTAHuZTyA1dz3yyNM_-w>
    <xmx:mUWuYTG542vjkzJPEjO6IxSPcjtmZOKHXK0KzXFm1yg-rf8xyDpbGg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Dec 2021 12:17:13 -0500 (EST)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 950CB136006C; Mon,  6 Dec 2021 10:17:12 -0700 (MST)
Date: Mon, 6 Dec 2021 10:17:12 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20211206171712.GC234718@animalcreek.com>
References: <20210808022058.171350-1-mgreer@animalcreek.com>
 <65c7b6ca-c1f6-6557-1b54-f8f666e3a5bf@canonical.com>
 <20211129041536.GA830560@animalcreek.com>
 <cd4169f5-2a97-61d8-240d-30ee16bcdd06@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cd4169f5-2a97-61d8-240d-30ee16bcdd06@canonical.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: 6RAEH3PIBMLIRG74MIMPYFM5E7YYRCQT
X-Message-ID-Hash: 6RAEH3PIBMLIRG74MIMPYFM5E7YYRCQT
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] [neard][RFC] test: Convert Python2 scripts to Python3
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/6RAEH3PIBMLIRG74MIMPYFM5E7YYRCQT/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 01, 2021 at 09:53:20AM +0100, Krzysztof Kozlowski wrote:
> On 29/11/2021 05:15, Mark Greer wrote:
> > On Mon, Aug 09, 2021 at 12:35:07PM +0200, Krzysztof Kozlowski wrote:
> >> On 08/08/2021 04:20, Mark Greer wrote:
> >>> Python2 is deprecated so convert the neard test scripts, which are
> >>> Python2, to Python3.
> >>>
> >>> Signed-off-by: Mark Greer <mgreer@animalcreek.com>
> >>> ---
> >>> This is a first pass at converting the python scripts to Python3.
> >>> Not a lot of testing yet.  It appears that the 'gobject' is not
> >>> available anymore so I have to look into how to rework the code that
> >>> uses it.
> >>>
> >>> I would appreciate any testing that you are willing to provide.
> >>>
> >>> Also available at:
> >>> 	https://github.com/linux-nfc/neard/tree/mag/python3-ize
> >>>
> >>>  se/test/test-channel     | 18 +++++------
> >>>  se/test/test-seel        | 38 +++++++++++-----------
> >>>  test/bt-handover         |  8 ++---
> >>>  test/handover-agent      | 34 +++++++++----------
> >>>  test/monitor-near        |  8 ++---
> >>>  test/ndef-agent          | 20 ++++++------
> >>>  test/neard-ui.py         | 70 ++++++++++++++++++++--------------------
> >>>  test/neardutils.py       | 14 ++++----
> >>>  test/phdc-simple-manager | 50 ++++++++++++++--------------
> >>>  test/test-adapter        | 16 ++++-----
> >>>  test/test-device         | 34 +++++++++----------
> >>>  test/test-tag            | 10 +++---
> >>>  12 files changed, 160 insertions(+), 160 deletions(-)
> >>>
> >>
> >> Few tests:
> >> ------------
> >> $ sudo python3 ./test/test-adapter poll nfc0 on
> >> Traceback (most recent call last):
> >>   File "./test/test-adapter", line 92, in <module>
> >>     adapter.StartPollLoop(mode)
> >>   File "/usr/lib/python3/dist-packages/dbus/proxies.py", line 72, in
> >> __call__
> >>     return self._proxy_method(*args, **keywords)
> >>   File "/usr/lib/python3/dist-packages/dbus/proxies.py", line 141, in
> >> __call__
> >>     return self._connection.call_blocking(self._named_service,
> >>   File "/usr/lib/python3/dist-packages/dbus/connection.py", line 652, in
> >> call_blocking
> >>     reply_message = self.send_message_with_reply_and_block(
> >> dbus.exceptions.DBusException: org.neard.Error.Failed: No such device
> >>
> >> During handling of the above exception, another exception occurred:
> >>
> >> Traceback (most recent call last):
> >>   File "./test/test-adapter", line 94, in <module>
> >>     print("%s: %s" % (error._dbus_error_name, error.message))
> >> AttributeError: 'DBusException' object has no attribute 'message'
> >> ------------
> > 
> > This looks like you may not have installed the necessary dbus support
> > (e.g., src/org.neard.conf).  After building neard, you can install this
> > with:
> > 
> > $ sudo make install
> > 
> > If that isn't it, I'll need more info about your environment because I
> > don't get those errors.  To make sure we're on the same page, these steps
> > should get you going (this example on an amd64 running Ubuntu 20.04):
> 
> Indeed lack of dbus support could be the original exception but the
> final exception is "AttributeError: 'DBusException' object has no
> attribute 'message'" which looks unrelated to actual DBUS installation.
> The error is that new Python dbus does not have message field. It has
> __str__ representation or get_dbus_message() method.

Yes, thank you.

I'll look at it when I look at the new dbus support for real.

Mark
--
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
