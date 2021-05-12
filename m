Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 289D737BF9F
	for <lists+linux-nfc@lfdr.de>; Wed, 12 May 2021 16:16:02 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 96FD0100EBB6B;
	Wed, 12 May 2021 07:16:00 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=oneukum@suse.com; receiver=<UNKNOWN> 
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 5B2BF100EBB6A
	for <linux-nfc@lists.01.org>; Wed, 12 May 2021 07:15:58 -0700 (PDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620828956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qEM9B8aavf7aizeB8uYLEEBIRas/EykFssfdfuh2sp8=;
	b=EAz5jwxUpDyUOFmomq46zlG96hPEMuqcqZ1xFuVXn65ecV/c3nCuneKUZDpD0wI+ZPcoCH
	LOsORBzXTalx28+paL4YMCUgPuXE3NFG1/cLnm899+2a/evrmgz7DQ2b6Q0djUOPGWm0MX
	XBsEpI5EgGryJ4wRXc0RyQrUmtxLtsA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C36AAADA2;
	Wed, 12 May 2021 14:15:56 +0000 (UTC)
Message-ID: <2e1bb24b989e7ee56dcec3302a80d9e8f7d2db94.camel@suse.com>
From: Oliver Neukum <oneukum@suse.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	clement.perrochaud@effinnov.com, charles.gorand@effinnov.com,
	linux-nfc@lists.01.org, netdev@vger.kernel.org
Date: Wed, 12 May 2021 16:15:55 +0200
In-Reply-To: <0a8ca4c7-ce55-3c92-cc29-b383e546d563@canonical.com>
References: <20210512134413.31808-1-oneukum@suse.com>
	 <0a8ca4c7-ce55-3c92-cc29-b383e546d563@canonical.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Message-ID-Hash: 34JUWZQ4BO2TNTFH7PMBGIC2LSJ3LTGN
X-Message-ID-Hash: 34JUWZQ4BO2TNTFH7PMBGIC2LSJ3LTGN
X-MailFrom: oneukum@suse.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] NFC: cooperation with runtime PM
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/34JUWZQ4BO2TNTFH7PMBGIC2LSJ3LTGN/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Am Mittwoch, den 12.05.2021, 09:54 -0400 schrieb Krzysztof Kozlowski:
> Hi,
> 
> Thanks for the patch. Few notes:
> 

Hi,

thank you excellent suggestion. V2 is compiling and will
be tested incorporating your suggestions.

	Regards
		Oliver

_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
