Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDDBF42D5
	for <lists+linux-nfc@lfdr.de>; Fri,  8 Nov 2019 10:05:09 +0100 (CET)
Received: from new-ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 620C5100EA62D;
	Fri,  8 Nov 2019 01:07:27 -0800 (PST)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=sameo@linux.intel.com; receiver=<UNKNOWN> 
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 4A710100EA629
	for <linux-nfc@lists.01.org>; Fri,  8 Nov 2019 01:07:25 -0800 (PST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Nov 2019 01:05:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,280,1569308400";
   d="scan'208";a="201305301"
Received: from kmcadoo-mobl.ger.corp.intel.com (HELO caravaggio) ([10.252.9.211])
  by fmsmga008.fm.intel.com with ESMTP; 08 Nov 2019 01:05:02 -0800
Date: Fri, 8 Nov 2019 10:05:01 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Mark Greer <mgreer@animalcreek.com>
Message-ID: <20191108090501.GA278603@caravaggio>
References: <CAPybu_2=rY5g0MNNoztBZQQhbteXxgG7RdrgQAWT6HkaKvp8sA@mail.gmail.com>
 <20180918061952.14335-1-ricardo.ribalda@gmail.com>
 <20180930233513.GA16410@animalcreek.com>
 <CAPybu_297JGrQ1WtG7D277MnhVMboYHSTV_KBNCsjA6uJab4RA@mail.gmail.com>
 <20191108040813.GA19844@animalcreek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191108040813.GA19844@animalcreek.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Message-ID-Hash: QGMGJWIZ6HQXOYAL4PSK2TDSZJ2L566G
X-Message-ID-Hash: QGMGJWIZ6HQXOYAL4PSK2TDSZJ2L566G
X-MailFrom: sameo@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2] ndef: Only register interface for known records
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/QGMGJWIZ6HQXOYAL4PSK2TDSZJ2L566G/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Mark, Ricardo,

On Thu, Nov 07, 2019 at 09:08:13PM -0700, Mark Greer wrote:
> On Wed, Nov 06, 2019 at 03:13:26PM +0100, Ricardo Ribalda Delgado wrote:
> > Hi
> > 
> > This is just my yearly ping to check if it has been merged ;)
> > 
> > Best regards
> > 
> > On Mon, Oct 1, 2018 at 1:35 AM Mark Greer <mgreer@animalcreek.com> wrote:
> > >
> > > On Tue, Sep 18, 2018 at 08:19:52AM +0200, Ricardo Ribalda Delgado wrote:
> > > > If we register the interface for unknown/error records neard daemon will
> > > > crash with no useful output message.
> > > > https://lists.01.org/pipermail/linux-nfc/2018-September/004445.html
> > > >
> > > > ...
> > > > neard[2404]: src/ndef.c:aar_exists() No AAR
> > > > neard[2404]: src/ndef.c:mime_payload_exists() No MIME payload
> > > > neard[2404]: D-Bus disconnect
> > > > neard[2404]: D-Bus disconnect (BT)
> > > > ...
> > > >
> > > > Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > > > ---
> > >
> > > FWIW,
> > >
> > > Reviewed-by: Mark Greer <mgreer@animalcreek.com>
> 
> Hi Ricardo.
> 
> I don't think anyone is maintaining neard nowadays.  :(

I would say that's correct. I moved on to different areas and don't have
time to maintain it anymore. I also released my kernel NFC maintainer
role. Sorry about that.

> I don't really have any suggestions for you on how to proceed.
> 
> Samuel, any thoughts?

What about moving the neard repo to github and have you or Ricardo (or
both) maintain it from there?

Cheers,
Samuel.
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
