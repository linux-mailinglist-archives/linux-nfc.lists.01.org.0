Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C9D1F31D
	for <lists+linux-nfc@lfdr.de>; Wed, 15 May 2019 14:11:07 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 944A8212794A8;
	Wed, 15 May 2019 05:11:05 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=oleg.zhurakivskyy@intel.com; receiver=linux-nfc@lists.01.org 
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id 83BAE2127546B
 for <linux-nfc@lists.01.org>; Wed, 15 May 2019 05:11:04 -0700 (PDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 May 2019 05:11:03 -0700
X-ExtLoop1: 1
Received: from ozhuraki-desk.fi.intel.com (HELO [10.237.67.35])
 ([10.237.67.35])
 by fmsmga005.fm.intel.com with ESMTP; 15 May 2019 05:11:01 -0700
To: Sedat Dilek <sedat.dilek@credativ.de>,
 Samuel Ortiz <sameo@linux.intel.com>,
 Charles Gorand <charles.gorand@effinnov.com>,
 =?UTF-8?Q?Cl=c3=a9ment_Perrochaud?= <clement.perrochaud@effinnov.com>,
 linux-nfc@lists.01.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20190515120233.19159-1-sedat.dilek@credativ.de>
From: Oleg Zhurakivskyy <oleg.zhurakivskyy@intel.com>
Message-ID: <f794b70e-2614-9779-0768-e6b8ebdc302a@intel.com>
Date: Wed, 15 May 2019 15:10:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190515120233.19159-1-sedat.dilek@credativ.de>
Content-Language: en-US
Subject: Re: [linux-nfc] [PATCH 1/2] NFC: nxp-nci: Clarify on supported chips
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-nfc-bounces@lists.01.org
Sender: "Linux-nfc" <linux-nfc-bounces@lists.01.org>

On 5/15/19 3:02 PM, Sedat Dilek wrote:
> This patch clarifies on the supported NXP NCI chips and families
> and lists PN547 and PN548 separately which are known as NPC100
> respectively NPC300.

LGTM and thanks!

Regards,
Oleg
_______________________________________________
Linux-nfc mailing list
Linux-nfc@lists.01.org
https://lists.01.org/mailman/listinfo/linux-nfc
