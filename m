Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF2F3CA591
	for <lists+linux-nfc@lfdr.de>; Thu, 15 Jul 2021 20:34:22 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 6B86F100EB834;
	Thu, 15 Jul 2021 11:34:20 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=mgreer@animalcreek.com; receiver=<UNKNOWN> 
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 3A9F1100EBB7F
	for <linux-nfc@lists.01.org>; Thu, 15 Jul 2021 11:34:18 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 502563200929;
	Thu, 15 Jul 2021 14:34:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 15 Jul 2021 14:34:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=animalcreek.com;
	 h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=NluGXAJ/DAp9CqW2ihdNBSTC8Kd
	6zOQIZTS2wa+Zktw=; b=Jpk2wiqBm0FEOUdpWoGZ3OMLe7DduD3R5Sbk7MBpxS4
	YfVixTdI4ARElhYtAdXv1YSDkg32ByGQtvtGGWCyKmOlHU/rSHF8fjzGYeP+tvto
	nDim8w886gMFakJ7hck+1oM0/vLqgXkiDrx0X7hQDLYWs50oqoR2iO5cQ7ql7DBU
	yRi2/w7PIyBu/rVQX0nLuR+HCuq7ef9RTtG5k0wFG0uDFHu37Ui/9roSoX8/Q1JU
	5q1vh2zlubHI66O4AY5GjaJMspZlw9R0kVYdpDX+bEWcfXBObJeHwW/emSIWMlpx
	WpEp3PSyFtQaXNXF14d7S5bLX9hlqAaeXpiD4q+iPVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=NluGXA
	J/DAp9CqW2ihdNBSTC8Kd6zOQIZTS2wa+Zktw=; b=ks0ttD9WWdNH1/M4qdFJLX
	uDQ3sifuZlObjNrGGPBWsBKI/olhMja8thsGk/IO4D72vIG/UOHVcNcTkZ6qBqRj
	1MAOQerSYFlCj5A1A/5FV7AkdTEGAd25Z2EccNOVPtkF3qK72P4StqsQyqPjT70l
	oMFfWkR58YL2NwbAUZip6UPeehGPuMaTF3lZxiZbgtMu9CoR05k9LLLeelsdZcWx
	kbnLFqafH4yQaQtFuXYz+CkCajcXiwf89fjXqUA6L6pijOoJQMAdT5Q+RJgPzmtv
	ED9/4mJn7hmYozHNuAnLZzTYI+mtay++yp2QLHqwdlmQdswpd3SxVq5d0MgaDMlw
	==
X-ME-Sender: <xms:pn_wYMaNPrxdjdiexF2mS--jZ2-G7YkOohBTcb6vx6OU9rSBc4JHiQ>
    <xme:pn_wYHZdgAjz-L0T3JGNvJX49Etn__nwtnaRz3xnYu4r-sbhR1tM3HusSgYFz8mIE
    eKWtuoSH21yydhebA>
X-ME-Received: <xmr:pn_wYG8nyGbqm7QKIVPWiTL8dOvXQN_fWPsyv9DrpmlicScgXo1_oEm_juUOxW40PfqS52Z56Yf27Z8xuIKNODfxPJbYYA5eCOpfaYc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtgdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujghosehttdertddttddvnecuhfhrohhmpeforghrkhcu
    ifhrvggvrhcuoehmghhrvggvrhesrghnihhmrghltghrvggvkhdrtghomheqnecuggftrf
    grthhtvghrnhepfeetudehfeetgeeivdffheelteeiieegjeduleeludegueeludeijefh
    udekjeejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhgrhgv
    vghrsegrnhhimhgrlhgtrhgvvghkrdgtohhm
X-ME-Proxy: <xmx:pn_wYGrw3XdqWZUqLRHI7YJWNhg9u6fdkxOayqsXqAQL_OCW24CQ2w>
    <xmx:pn_wYHpdejlwl2SHWV0LZfAVovcHSeC79tMk9msoZEmyKSJ5r_qgdA>
    <xmx:pn_wYEQFdOIk5NjAl8j1qGcIgS44kHDNr3hbzN9JUW8f_aNRge7Z9w>
    <xmx:pn_wYICVmAV64wC9FhiHgtFaH1Owc6xPW0R9_Smdpsp9LCOVmYqZpA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Jul 2021 14:34:14 -0400 (EDT)
Received: by blue.animalcreek.com (Postfix, from userid 1000)
	id 59F931360093; Thu, 15 Jul 2021 11:34:13 -0700 (MST)
Date: Thu, 15 Jul 2021 11:34:13 -0700
From: Mark Greer <mgreer@animalcreek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20210715183413.GB525255@animalcreek.com>
References: <20210512144319.30852-1-krzysztof.kozlowski@canonical.com>
 <961dc9c5-0eb0-586c-5e70-b21ca2f8e6f3@linaro.org>
 <d498c949-3b1e-edaa-81ed-60573cfb6ee9@canonical.com>
 <20210512164952.GA222094@animalcreek.com>
 <df2ec154-79fa-af7b-d337-913ed4a0692e@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <df2ec154-79fa-af7b-d337-913ed4a0692e@canonical.com>
Organization: Animal Creek Technologies, Inc.
Message-ID-Hash: 74N767VCSD56BHDVWZLEHRRYTV62T2C7
X-Message-ID-Hash: 74N767VCSD56BHDVWZLEHRRYTV62T2C7
X-MailFrom: mgreer@animalcreek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 1/2] MAINTAINERS: nfc: add Krzysztof Kozlowski as maintainer
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/74N767VCSD56BHDVWZLEHRRYTV62T2C7/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 09, 2021 at 11:24:41AM +0200, Krzysztof Kozlowski wrote:
> On 12/05/2021 18:49, Mark Greer wrote:
> > On Wed, May 12, 2021 at 11:43:13AM -0400, Krzysztof Kozlowski wrote:
> >> On 12/05/2021 11:11, Daniel Lezcano wrote:
> >>> On 12/05/2021 16:43, Krzysztof Kozlowski wrote:
> >>>> The NFC subsystem is orphaned.  I am happy to spend some cycles to
> >>>> review the patches, send pull requests and in general keep the NFC
> >>>> subsystem running.
> >>>>
> >>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> >>>>
> >>>> ---
> >>>>
> >>>> I admit I don't have big experience in NFC part but this will be nice
> >>>> opportunity to learn something new. 
> >>>
> >>> NFC has been lost in the limbos since a while. Good to see someone
> >>> volunteering to take care of it.
> >>>
> >>> May I suggest to create a simple nfc reading program in the 'tools'
> >>> directory (could be a training exercise ;)
> >>>
> >>
> >> Noted, thanks. I also need to get a simple hardware dongle for this....
> > 
> > Krzysztof, the NFC portion of the kernel has a counterpart in userspace
> > called neard.  I'm supposed to be maintaining it but I have next to no
> > time to do so.  If you have spare cycles, any help would be appreciated.
> > 
> > Anyway, in neard, there are some simple test scripts (python2 - I/we need
> > to update to python3).  The current home of neard is:
> > 
> > git://git.kernel.org/pub/scm/network/nfc/neard.git
> 
> I guess none of us have problem of too much spare time :), so it took me
> a while before I looked at neard.
> 
> With newer Gcc, neard did not even compile (which I am fixing now). I
> set up a fork:
> https://github.com/krzk/neard
> However I can give early disclaimer - playing with GLib userspace code
> is not something I am in long term interested. If this was written in
> Rust, would be different story. :)
> 
> I also configured basic CI (or rather continuous building):
> https://github.com/krzk/neard/actions/runs/1014641944
> 
> However I still do not have proper testing setup. No hardware. Would be
> nice if Samsung. ST, NXP or Intel could spare some development board
> with the NFC chip supported by kernel. Till then, I will try the NFC
> simulator and virtual NCI drivers.
> 
> My next plan for neard is to extend the CI. There is no way I (or anyone
> else I believe) can keep good quality of releases without automated
> checks. I'll add some more distros, clang and later many some linters or
> cppcheck.

Hi Krzysztof, I see you've been busy.  Thanks for that.

FYI, I made a repo on github some time back but never announced it.  The
only reason I mention it is because the name/link looks more official:

	https://github.com/linux-nfc/neard

Let see what happens with permssion on kernel.org and go from there.

Re: hardware - I don't have much reader hardware either.  I almost
exclusively use BeagleBone[Black] + RF Cape + trf7970atb.  I also have
a USB dongle with a pn533, FWIW. I do have a decent collection of NFC tags,
though.  I'll contact you privately to arrange to send some to you.

For peer-to-peer testing, your smartphone probably has an NFC reader but
you'll have to play around to find the sweet spot where they put the
antenna (older phones were notoriously bad for NFC antenna design; newer
ones are generally better).

I will review your patch sets but the earliest I will get to them will
be Sunday.

Mark
--
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
