Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4DD1C9BE
	for <lists+linux-nfc@lfdr.de>; Tue, 14 May 2019 15:57:15 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 6BFFD2125F1CE;
	Tue, 14 May 2019 06:57:13 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=oleg.zhurakivskyy@intel.com; receiver=linux-nfc@lists.01.org 
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id BC7EC21244A45
 for <linux-nfc@lists.01.org>; Tue, 14 May 2019 06:57:11 -0700 (PDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 May 2019 06:57:10 -0700
X-ExtLoop1: 1
Received: from ozhuraki-desk.fi.intel.com (HELO [10.237.67.35])
 ([10.237.67.35])
 by orsmga002.jf.intel.com with ESMTP; 14 May 2019 06:57:08 -0700
To: sedat.dilek@gmail.com
References: <20190513104358.59716-1-andriy.shevchenko@linux.intel.com>
 <CA+icZUV_g5mJnmHQKZgtcPj3YfZSYp1DQJT9tmi+892AzRCm3A@mail.gmail.com>
 <20190513123751.GS9224@smile.fi.intel.com>
 <CA+icZUUA8TfU--6b+RwXMf=ui7ww0DK=EurzdMeDUkGvwcJ_rg@mail.gmail.com>
 <2d39b39b-27eb-abef-747f-400433daefee@intel.com>
 <CA+icZUW6vttB8EvgBZYi3kT7uhcbQr+baYbif_V6D78ZNEDbHQ@mail.gmail.com>
 <4f297fa0-257d-5036-8a1a-0f5434bb5d26@intel.com>
 <CA+icZUWZH-JS=JHLieVd2ga=Zutac2BXd4tk0tSXs+izQ5txOQ@mail.gmail.com>
From: Oleg Zhurakivskyy <oleg.zhurakivskyy@intel.com>
Message-ID: <787aff34-b1b9-b9e2-faf3-409d7fc95a52@intel.com>
Date: Tue, 14 May 2019 16:56:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+icZUWZH-JS=JHLieVd2ga=Zutac2BXd4tk0tSXs+izQ5txOQ@mail.gmail.com>
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
Cc: linux-nfc@lists.01.org, linux-wireless@vger.kernel.org,
 Charles Gorand <charles.gorand@effinnov.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-nfc-bounces@lists.01.org
Sender: "Linux-nfc" <linux-nfc-bounces@lists.01.org>


On 5/14/19 4:44 PM, Sedat Dilek wrote:

>            Say Y if unsure.
> 
> Shouldn't that be "Say N if unsure"?
> Or Say Yes If Sure :-).

:)

Must be a typo.

As to me, the last 5 lines in the description are extra, but this is just a matter of taste.

Regards,
Oleg
_______________________________________________
Linux-nfc mailing list
Linux-nfc@lists.01.org
https://lists.01.org/mailman/listinfo/linux-nfc
