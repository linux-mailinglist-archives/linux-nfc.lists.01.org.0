Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9696B37ABF2
	for <lists+linux-nfc@lfdr.de>; Tue, 11 May 2021 18:30:48 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 33601100EB32A;
	Tue, 11 May 2021 09:30:47 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=oneukum@suse.com; receiver=<UNKNOWN> 
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 121BF100EBB6E
	for <linux-nfc@lists.01.org>; Tue, 11 May 2021 09:30:44 -0700 (PDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620750643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4b6QaZNIM+EV22K9NPgM7etmRIFMFLZrODPkJMGcdwk=;
	b=pbeMg1s0omT0Ny61+fTCyAVJL4Vs5LWHxTxx6BnQNIdFy92QeTPPnw5mzafU5skBf9kEo8
	3bi87k1Hls3mk8s4DztJMJPo6l0yGD3iFpyilk/8eYYX/nQmL3mqDobSHo5byZx9gVpLCO
	4EihmD99No59kpPw/we2FKHnYU4qG9o=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6C379B1AC
	for <linux-nfc@lists.01.org>; Tue, 11 May 2021 16:30:43 +0000 (UTC)
Message-ID: <46d0d6a709d42a344db86b8646293c077f0b8521.camel@suse.com>
From: Oliver Neukum <oneukum@suse.com>
To: linux-nfc@lists.01.org
Date: Tue, 11 May 2021 18:30:42 +0200
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Message-ID-Hash: WYYIETV6THLF2KKORQBUKM7RYCN2XANK
X-Message-ID-Hash: WYYIETV6THLF2KKORQBUKM7RYCN2XANK
X-MailFrom: oneukum@suse.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] how to test a driver for a new device
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/WYYIETV6THLF2KKORQBUKM7RYCN2XANK/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I have a system with an NXP1002 as opposed to NXP1001
device. I've added it to the nxp-nci driver and I can detect
tags. Is there a test suite for NFC I should run before
submitting?

	Regards
		Oliver

_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
