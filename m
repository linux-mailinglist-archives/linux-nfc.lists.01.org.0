Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 143D41C7F4
	for <lists+linux-nfc@lfdr.de>; Tue, 14 May 2019 13:45:16 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4AECE212735D8;
	Tue, 14 May 2019 04:45:14 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=oleg.zhurakivskyy@intel.com; receiver=linux-nfc@lists.01.org 
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id 05A482125585B
 for <linux-nfc@lists.01.org>; Tue, 14 May 2019 04:45:12 -0700 (PDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 May 2019 04:45:11 -0700
X-ExtLoop1: 1
Received: from ozhuraki-desk.fi.intel.com (HELO [10.237.67.35])
 ([10.237.67.35])
 by orsmga008.jf.intel.com with ESMTP; 14 May 2019 04:45:09 -0700
To: sedat.dilek@gmail.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20190513104358.59716-1-andriy.shevchenko@linux.intel.com>
 <CA+icZUV_g5mJnmHQKZgtcPj3YfZSYp1DQJT9tmi+892AzRCm3A@mail.gmail.com>
 <20190513123751.GS9224@smile.fi.intel.com>
 <CA+icZUUA8TfU--6b+RwXMf=ui7ww0DK=EurzdMeDUkGvwcJ_rg@mail.gmail.com>
From: Oleg Zhurakivskyy <oleg.zhurakivskyy@intel.com>
Message-ID: <2d39b39b-27eb-abef-747f-400433daefee@intel.com>
Date: Tue, 14 May 2019 14:44:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+icZUUA8TfU--6b+RwXMf=ui7ww0DK=EurzdMeDUkGvwcJ_rg@mail.gmail.com>
Content-Language: en-US
Subject: Re: [linux-nfc] [PATCH v2 00/12] NFC: nxp-nci: clean up and support
 new ID
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
Cc: linux-wireless@vger.kernel.org,
 Charles Gorand <charles.gorand@effinnov.com>, linux-nfc@lists.01.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: linux-nfc-bounces@lists.01.org
Sender: "Linux-nfc" <linux-nfc-bounces@lists.01.org>


On 5/14/19 11:34 AM, Sedat Dilek wrote:
  =

> Am I correct that "NPC100" is "PN547" and "NPC300" is "PN548"?

Yes, NPC100 is PN547.

Don=92t know on NPC300, but a quick web search reveals it=92s PN548.

Might it make sense to drop NPC... and to keep just the chip names in Kconf=
ig?

Regards,
Oleg
_______________________________________________
Linux-nfc mailing list
Linux-nfc@lists.01.org
https://lists.01.org/mailman/listinfo/linux-nfc
