Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9C11B50E
	for <lists+linux-nfc@lfdr.de>; Mon, 13 May 2019 13:36:38 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 91AD821260A46;
	Mon, 13 May 2019 04:36:36 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=oleg.zhurakivskyy@intel.com; receiver=linux-nfc@lists.01.org 
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id D9B3D2125ADF8
 for <linux-nfc@lists.01.org>; Mon, 13 May 2019 04:28:13 -0700 (PDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 May 2019 04:28:12 -0700
X-ExtLoop1: 1
Received: from ozhuraki-desk.fi.intel.com (HELO [10.237.67.35])
 ([10.237.67.35])
 by orsmga004.jf.intel.com with ESMTP; 13 May 2019 04:28:11 -0700
To: sedat.dilek@gmail.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <CA+icZUX+VNtk00YQnNYCnDeeH2Onq6s1vbdzYrv-OHf7q186Ww@mail.gmail.com>
 <154e3e74-38b5-850b-5993-295f9db8fe3c@intel.com>
 <CA+icZUWhBeup95PTP_k58xs8Lf2Ofqb0S_gkdBfbuc0-wdpF-w@mail.gmail.com>
 <06fbacb5-7739-1ca1-3bf4-8049a3ef019b@intel.com>
 <CA+icZUWJ0kZSqogg18LdP2YkNXk=_SNnT7-ufkd_Xp1ak7uchg@mail.gmail.com>
 <2b1bd56f-8797-fb90-e2af-218edaedd089@intel.com>
 <CA+icZUVMjCWwuC-ee1-+EPU6+mYqFZ7w4ai4t4EJcrsvZ2_BYg@mail.gmail.com>
From: Oleg Zhurakivskyy <oleg.zhurakivskyy@intel.com>
Message-ID: <3b7065a2-694f-63bf-fba3-a1641a03ea76@intel.com>
Date: Mon, 13 May 2019 14:28:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+icZUVMjCWwuC-ee1-+EPU6+mYqFZ7w4ai4t4EJcrsvZ2_BYg@mail.gmail.com>
Content-Language: en-US
Subject: Re: [linux-nfc] ThinkPad T470 and NXP PN5xx (PN547 or PN548)
X-BeenThere: linux-nfc@lists.01.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: NFC on Linux <linux-nfc.lists.01.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nfc>,
 <mailto:linux-nfc-request@lists.01.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nfc/>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nfc>,
 <mailto:linux-nfc-request@lists.01.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org, linux-nfc@lists.01.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-nfc-bounces@lists.01.org
Sender: "Linux-nfc" <linux-nfc-bounces@lists.01.org>


Hi Sedat, Andy,

Andy, thanks a lot for extending and cleaning that up.

> Unsure, why the pn544_i2c NFC driver shipped with the Linux v5.1.1
does not work.

I briefly looked into drivers/nfc/pn544, that seems like an HCI based chip (as opposed to NCI based PN547).

It might be that changes that Andy posted are already sufficient for PN547 to just work with neard (if I am not missing anything).

# sudo apt-get install neard neard-tools
# man nfctool

Regards,
Oleg
_______________________________________________
Linux-nfc mailing list
Linux-nfc@lists.01.org
https://lists.01.org/mailman/listinfo/linux-nfc
